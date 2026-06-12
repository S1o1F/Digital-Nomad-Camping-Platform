----------------------------------------------------------------------------------------funkcii--------------------------------------------------------------------

-- 1. funkcija za vkupna cena za rezervacija, i plus i so equipment ako rentat, ako sakat da koristit dopolnitelen service, plus i za activities ako ima rezervacija
CREATE OR REPLACE FUNCTION calculate_full_reservation_price(
    p_reservation_id INT
)
RETURNS TABLE (
    base_price      NUMERIC,
    activity_price  NUMERIC,
    equipment_price NUMERIC,
    service_price   NUMERIC,
    discount_amount NUMERIC,
    discount_percent INT,
    final_price     NUMERIC
) AS $$
DECLARE
    v_base_price       NUMERIC := 0;
    v_activity_price   NUMERIC := 0;
    v_equipment_price  NUMERIC := 0;
    v_service_price    NUMERIC := 0;
    v_discount_percent INT     := 0;
    v_discount_amount  NUMERIC := 0;
    v_final_price      NUMERIC := 0;
    v_campLocationId   INTEGER;
BEGIN

    SELECT total_price, CampLocationcamplocationId
    INTO v_base_price, v_campLocationId
    FROM Reservation
    WHERE reservationId = p_reservation_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation with ID % does not exist!', p_reservation_id;
    END IF;

    SELECT COALESCE(SUM(total_price_for_activity), 0)
    INTO v_activity_price
    FROM ReservationActivity
    WHERE ReservationreservationId = p_reservation_id
      AND status <> 'cancelled';

    SELECT COALESCE(SUM(total_price), 0)
    INTO v_equipment_price
    FROM EquipmentRental
    WHERE ReservationreservationId = p_reservation_id
      AND status <> 'cancelled';

    SELECT COALESCE(SUM(s.additional_fee), 0)
    INTO v_service_price
    FROM camp_location_service cls
    JOIN Service s ON cls.ServiceserviceId = s.serviceId
    WHERE cls.CampLocationcampLocationId = v_campLocationId;

    SELECT
        COALESCE(p.discount_percent, 0),
        COALESCE(p.discount_amount, 0)
    INTO
        v_discount_percent,
        v_discount_amount
    FROM Reservation r
    LEFT JOIN Promotion p ON r.PromotionpromotionId = p.promotionId
    WHERE r.reservationId = p_reservation_id;

    v_final_price :=
        v_base_price      +
        v_activity_price  +
        v_equipment_price +
        v_service_price;

    IF v_discount_percent > 0 THEN
        v_final_price := v_final_price - (v_final_price * v_discount_percent / 100.0);
    END IF;

    IF v_discount_amount > 0 THEN
        v_final_price := v_final_price - v_discount_amount;
    END IF;

    IF v_final_price < 0 THEN
        v_final_price := 0;
    END IF;

    base_price       := ROUND(v_base_price, 2);
    activity_price   := ROUND(v_activity_price, 2);
    equipment_price  := ROUND(v_equipment_price, 2);
    service_price    := ROUND(v_service_price, 2);
    discount_amount  := ROUND(v_discount_amount, 2);
    discount_percent := v_discount_percent;
    final_price      := ROUND(v_final_price, 2);

    RETURN NEXT;

END;
$$ LANGUAGE plpgsql;

--test
SELECT * FROM calculate_full_reservation_price(2);


-- 2. funkcija za dostapnost na camplocation za odreden period
CREATE OR REPLACE FUNCTION is_camp_available(
    p_campLocationId INTEGER,
    p_check_in       DATE,
    p_check_out      DATE
)
RETURNS BOOLEAN AS $$
DECLARE
    v_conflict INTEGER;
    v_status   VARCHAR(20);
BEGIN

    IF p_check_out <= p_check_in THEN
        RAISE EXCEPTION
        'Check-out date must be after check-in date!';
    END IF;

    SELECT status
    INTO v_status
    FROM CampLocation
    WHERE campLocationId = p_campLocationId;

    IF NOT FOUND THEN
        RAISE EXCEPTION
        'Camp location with ID % does not exist!',
        p_campLocationId;
    END IF;

    IF v_status <> 'active' THEN
        RETURN FALSE;
    END IF;

    SELECT COUNT(*)
    INTO v_conflict
    FROM Reservation
    WHERE CampLocationcamplocationId = p_campLocationId
      AND reservation_status IN ('pending', 'confirmed')
      AND check_in_date < p_check_out
      AND check_out_date > p_check_in;

    IF v_conflict > 0 THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;

END;
$$ LANGUAGE plpgsql;

--test
SELECT is_camp_available(11, '2026-08-18', '2026-08-21');
SELECT camplocationcamplocationid, check_in_date, check_out_date, reservation_status
FROM Reservation
WHERE reservation_status IN ('pending', 'confirmed')
LIMIT 10;




------------------------------------------------------------------------------------proceduri----------------------------------------------------------------------------------------------------------

-- 1. procedura za kreiranje rezervacija
CREATE OR REPLACE PROCEDURE make_reservation(
    p_guestUserId    INTEGER,
    p_campLocationId INTEGER,
    p_check_in       DATE,
    p_check_out      DATE,
    p_num_guests     INTEGER,
    p_promo_code     VARCHAR(50) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    v_min_nights      INTEGER;
    v_max_guests      INTEGER;
    v_nights          INTEGER;
    v_price_per_night NUMERIC(12, 2);
    v_total_price     NUMERIC(12, 2);
    v_promotionId     INTEGER := NULL;
    v_discount        NUMERIC(10, 2) := 0;
    v_new_res_id      INTEGER;
BEGIN

    IF NOT is_camp_available(p_campLocationId, p_check_in, p_check_out) THEN
        RAISE EXCEPTION 'Camp location not available for the chosen period!';
    END IF;

    SELECT min_nights_stay, max_guests
    INTO v_min_nights, v_max_guests
    FROM CampLocation
    WHERE campLocationId = p_campLocationId;

    IF p_num_guests > v_max_guests THEN
        RAISE EXCEPTION 'Maximum number of guests is  %!', v_max_guests;
    END IF;

    SELECT ph.price_per_night
    INTO v_price_per_night
    FROM PriceHistory ph
    WHERE ph.CampLocationcampLocationId = p_campLocationId
      AND p_check_in BETWEEN ph.date_from AND ph.date_to
    LIMIT 1;

    IF v_price_per_night IS NULL THEN
        RAISE EXCEPTION 'There is no active price for the chosen camp location!';
    END IF;

    v_nights      := p_check_out - p_check_in;
    v_total_price := v_nights * v_price_per_night;

    IF p_promo_code IS NOT NULL THEN
        SELECT p.promotionId,
               COALESCE(p.discount_amount, 0) +
               COALESCE(v_total_price * p.discount_percent / 100.0, 0)
        INTO v_promotionId, v_discount
        FROM Promotion p
        WHERE p.promo_code = p_promo_code
          AND p.valid_from <= CURRENT_DATE
          AND p.valid_to   >= CURRENT_DATE
        LIMIT 1;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'The promo code "%" is not valid or is expired!', p_promo_code;
        END IF;
    END IF;

    v_total_price := GREATEST(v_total_price - v_discount, 0);

    INSERT INTO Reservation (
        GuestUseruserId,
        CampLocationcamplocationId,
        PromotionpromotionId,
        number_of_guests,
        reservation_status,
        check_in_date,
        check_out_date,
        created_at,
        total_price
    )
    VALUES (
        p_guestUserId,
        p_campLocationId,
        v_promotionId,
        p_num_guests,
        'pending',
        p_check_in,
        p_check_out,
        LEAST(CURRENT_DATE, p_check_in - 1),
        v_total_price
    )
    RETURNING reservationId INTO v_new_res_id;

    RAISE NOTICE 'Reservation is successfully created! ID: %, Total price: % EUR',
        v_new_res_id, v_total_price;

    COMMIT;
END;
$$;

--test
--guest
SELECT user_id FROM "User" WHERE type = 'guest' LIMIT 5;
--camplocation
SELECT campLocationId, min_nights_stay, max_guests FROM CampLocation LIMIT 5;
--za price vo toj period
SELECT * FROM PriceHistory WHERE CampLocationcampLocationId = 1 LIMIT 5;

CALL make_reservation(
    423,
    1,
    '2023-04-11',
    '2023-05-01',
    2,
    NULL
);


-- 2. procedura za dodavanje promotion_code
CREATE OR REPLACE PROCEDURE add_promotion(
    p_hostUserId        INTEGER,
    p_promo_code        VARCHAR(50),
    p_valid_from        DATE,
    p_valid_to          DATE,
    p_discount_amount   NUMERIC(10,2) DEFAULT 0,
    p_discount_percent  NUMERIC(5,2)  DEFAULT 0
)
LANGUAGE plpgsql AS $$
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Host WHERE UseruserId = p_hostUserId) THEN
        RAISE EXCEPTION 'Host with ID % does not exist!', p_hostUserId;
    END IF;

    IF EXISTS (SELECT 1 FROM Promotion WHERE promo_code = p_promo_code) THEN
        RAISE EXCEPTION 'Promo code "%" already exists!', p_promo_code;
    END IF;

    IF p_valid_from > p_valid_to THEN
        RAISE EXCEPTION 'Invalid date range: valid_from > valid_to!';
    END IF;

    IF p_discount_percent = 0 AND p_discount_amount = 0 THEN
        RAISE EXCEPTION 'At least one discount must be provided!';
    END IF;

    IF p_discount_percent < 0 OR p_discount_percent > 100 THEN
        RAISE EXCEPTION 'Discount percent must be between 0 and 100!';
    END IF;

    IF p_discount_amount < 0 THEN
        RAISE EXCEPTION 'Discount amount cannot be negative!';
    END IF;

    INSERT INTO Promotion (
        HostUserUserId,
        promo_code,
        discount_amount,
        discount_percent,
        valid_from,
        valid_to
    )
    VALUES (
        p_hostUserId,
        p_promo_code,
        p_discount_amount,
        p_discount_percent,
        p_valid_from,
        p_valid_to
    );

    RAISE NOTICE 'Promotion "%" successfully created!', p_promo_code;

    COMMIT;
END;
$$;

--test
SELECT UseruserId FROM Host LIMIT 5;
CALL add_promotion(
    634,
    'SUMMER2026',
    '2026-01-01',
    '2026-12-31',
    0,
    10
);
CALL add_promotion(
    634,
    'SUMMER2026v2',
    '2026-01-01',
    '2026-12-31',
    30,
    0
);
--ist promo code
CALL add_promotion(
    634,
    'SUMMER2026',
    '2026-01-01',
    '2026-12-31',
    0,
    100
);
--bez discount_amount i discount_percent
CALL add_promotion(
    634,
    'SUMMER2026_promotion',
    '2026-01-01',
    '2026-12-31',
    0,
    0
);


-- 3. procedura za iznajmuvanje equipment za postoecka rezervacija
CREATE OR REPLACE PROCEDURE rent_equipment(
    p_reservationId  INTEGER,
    p_equipmentId    INTEGER,
    p_start_date     DATE,
    p_end_date       DATE,
    p_quantity       INTEGER
)
LANGUAGE plpgsql AS $$
DECLARE
    v_price_per_day  NUMERIC(10,2);
    v_deposit        NUMERIC(10,2);
    v_available_qty  INTEGER;
    v_days           INTEGER;
    v_total_price    NUMERIC(10,2);
    v_res_status     VARCHAR(20);
BEGIN

    SELECT reservation_status
    INTO v_res_status
    FROM Reservation
    WHERE reservationId = p_reservationId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation with ID % does not exist!', p_reservationId;
    END IF;

    IF v_res_status NOT IN ('pending', 'confirmed') THEN
        RAISE EXCEPTION 'Cannot rent equipment for reservation with status: %', v_res_status;
    END IF;

    SELECT rental_price_per_day, deposit_amount, available_quantity
    INTO v_price_per_day, v_deposit, v_available_qty
    FROM Equipment
    WHERE equipmentId = p_equipmentId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Equipment with ID % does not exist!', p_equipmentId;
    END IF;

    IF p_quantity > v_available_qty THEN
        RAISE EXCEPTION 'Not enough equipment available! Requested: %, Available: %',
            p_quantity, v_available_qty;
    END IF;

    IF p_start_date >= p_end_date THEN
        RAISE EXCEPTION 'Invalid rental period: end date must be after start date!';
    END IF;

    v_days        := p_end_date - p_start_date;
    v_total_price := v_days * v_price_per_day * p_quantity;

    INSERT INTO EquipmentRental (
        EquipmentequipmentId,
        ReservationreservationId,
        quantity,
        start_date,
        end_date,
        total_price,
        deposit_paid,
        status
    )
    VALUES (
        p_equipmentId,
        p_reservationId,
        p_quantity,
        p_start_date,
        p_end_date,
        v_total_price,
        v_deposit * p_quantity,
        'active'
    );

    UPDATE Equipment
    SET available_quantity = available_quantity - p_quantity
    WHERE equipmentId = p_equipmentId;

    RAISE NOTICE 'Equipment rented successfully. Total: % EUR', v_total_price;

    COMMIT;
END;
$$;

--test
SELECT equipmentId, available_quantity, rental_price_per_day FROM Equipment
WHERE available_quantity > 0 LIMIT 5;

SELECT reservationId FROM Reservation
WHERE reservation_status IN ('pending', 'confirmed')
LIMIT 5;

CALL rent_equipment(
    2,
    2,
    '2026-06-01',
    '2026-06-05',
    2
);

SELECT equipmentId, available_quantity
FROM Equipment
WHERE equipmentId = 2;

--4. procedura za koga kje se vrati equipmentrental, da se promeni statusot 'rented' -> 'returned' i da se zgolemi available_quantity na equipment
CREATE OR REPLACE PROCEDURE return_equipment(
    p_equipmentRentalId INTEGER
)
LANGUAGE plpgsql AS $$
DECLARE
    v_equipmentId INTEGER;
    v_quantity    INTEGER;
    v_status      VARCHAR(20);
BEGIN
    SELECT EquipmentequipmentId, quantity, status
    INTO v_equipmentId, v_quantity, v_status
    FROM EquipmentRental
    WHERE equipmentrentalid = p_equipmentRentalId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Equipment rental with ID % does not exist!', p_equipmentRentalId;
    END IF;

    IF v_status = 'returned' THEN
        RAISE EXCEPTION 'Equipment is already returned!';
    END IF;

    UPDATE EquipmentRental
    SET status = 'returned'
    WHERE equipmentrentalid = p_equipmentRentalId;

    UPDATE Equipment
    SET available_quantity = LEAST(available_quantity + v_quantity, total_quantity)
    WHERE equipmentId = v_equipmentId;

    RAISE NOTICE 'Equipment ID % returned successfully. Quantity restored: %.',
        v_equipmentId, v_quantity;

    COMMIT;
END;
$$;

--test
SELECT er.equipmentrentalid, er.EquipmentequipmentId, er.quantity, e.available_quantity, e.total_quantity
FROM EquipmentRental er
JOIN Equipment e ON e.equipmentId = er.EquipmentequipmentId
WHERE er.status = 'active'
AND e.available_quantity < e.total_quantity
LIMIT 5;
--equipmentrentalId=35,equipmentId=36, quantity=2
--quantity pred e 0
SELECT equipmentId, available_quantity
FROM Equipment
WHERE equipmentId = 36;
---
CALL return_equipment(35);
--proverk posle, quantity se zgolemi za 2
SELECT equipmentId, available_quantity, total_quantity
FROM Equipment
WHERE equipmentId = 36;
--proverka na status
SELECT equipmentrentalid, status
FROM EquipmentRental
WHERE equipmentrentalid = 35;


--5. procedura za da se zgolemi num_reservations koga kje se kreira nova rezervacija kaj Guest
CREATE OR REPLACE PROCEDURE add_reservation_count(
    p_guestUserId INTEGER
)
LANGUAGE plpgsql AS $$
DECLARE
    v_current_count INTEGER;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Guest WHERE UseruserId = p_guestUserId) THEN
        RAISE EXCEPTION 'Guest with ID % does not exist!', p_guestUserId;
    END IF;

    SELECT num_reservations
    INTO v_current_count
    FROM Guest
    WHERE UseruserId = p_guestUserId;

    UPDATE Guest
    SET num_reservations = num_reservations + 1
    WHERE UseruserId = p_guestUserId;

    RAISE NOTICE 'Guest % reservation count updated from % to %.',
        p_guestUserId, v_current_count, v_current_count + 1;

    COMMIT;
END;
$$;

--test
SELECT UseruserId, num_reservations
FROM Guest
WHERE UseruserId = 1663;
--num_reservations=22

CALL add_reservation_count(1663);

SELECT UseruserId, num_reservations
FROM Guest
WHERE UseruserId = 1663;
--num_reservations=23



--6.
CREATE OR REPLACE PROCEDURE refund_payment(
    p_paymentId INTEGER,
    p_refund_amount NUMERIC(12,2) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    v_payment_status     VARCHAR(30);
    v_amount             NUMERIC(12,2);
    v_reservationId      INTEGER;
    v_reservation_status VARCHAR(20);
    v_refund_amount      NUMERIC(12,2);
BEGIN
    SELECT payment_status, amount, ReservationreservationId
    INTO v_payment_status, v_amount, v_reservationId
    FROM Payment
    WHERE paymentId = p_paymentId;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Payment with ID % does not exist!', p_paymentId;
    END IF;

    IF v_payment_status NOT IN ('completed', 'partially_refunded') THEN
        RAISE EXCEPTION 'Payment with status "%" cannot be refunded!', v_payment_status;
    END IF;

    SELECT reservation_status
    INTO v_reservation_status
    FROM Reservation
    WHERE reservationId = v_reservationId;

    IF v_reservation_status != 'cancelled' THEN
        RAISE EXCEPTION 'Refund is only allowed for cancelled reservations!';
    END IF;

    IF p_refund_amount IS NULL THEN
        v_refund_amount := v_amount;
    ELSE
        v_refund_amount := p_refund_amount;
    END IF;

    IF v_refund_amount > v_amount THEN
        RAISE EXCEPTION 'Refund amount (%) cannot exceed payment amount (%)!',
            v_refund_amount, v_amount;
    END IF;

    IF v_refund_amount <= 0 THEN
        RAISE EXCEPTION 'Refund amount must be greater than 0!';
    END IF;

    UPDATE Payment
    SET payment_status = CASE
        WHEN v_refund_amount = v_amount THEN 'refunded'
        ELSE 'partially_refunded'
    END
    WHERE paymentId = p_paymentId;

    UPDATE ReservationStatus
    SET refund_amount = v_refund_amount,
        cancellation_date = CURRENT_DATE
    WHERE ReservationreservationId = v_reservationId;

    RAISE NOTICE 'Payment % refunded successfully. Refund amount: % EUR.',
        p_paymentId, v_refund_amount;

    COMMIT;
END;
$$;

--test
SELECT p.paymentId, p.amount, p.payment_status, r.reservation_status
FROM Payment p
JOIN Reservation r ON r.reservationId = p.ReservationreservationId
WHERE r.reservation_status = 'cancelled'
AND p.payment_status = 'completed'
LIMIT 5;
--paymentId=156, amount 317
CALL refund_payment(156);
--proverka na status
SELECT paymentId, amount, payment_status
FROM Payment
WHERE paymentId = 156;
-- proveri refund_amount vo ReservationStatus
SELECT rs.ReservationreservationId, rs.refund_amount, rs.cancellation_date
FROM ReservationStatus rs
JOIN Payment p ON p.ReservationreservationId = rs.ReservationreservationId
WHERE p.paymentId = 156;

-------------------------------------------------------------------------------------trigeri-----------------------------------------------------------------------------------------------------------
-- 1. triger za avtomatsko azuriranje na average rating na Host, koga kje se vnese review se presmetuva nov average rating za Host

CREATE OR REPLACE FUNCTION update_host_rating()
RETURNS TRIGGER AS $$
DECLARE
    v_host_id INTEGER;
    v_avg NUMERIC(3,2);
BEGIN
    SELECT h.HostUseruserid
    INTO v_host_id
    FROM Host_Host h
    WHERE h.CampLocationcampLocationId = NEW.CampLocationcampLocationId
    LIMIT 1;

    SELECT ROUND(AVG(r.rating), 2)
    INTO v_avg
    FROM Review r
    WHERE r.CampLocationcampLocationId = NEW.CampLocationcampLocationId;

    UPDATE Host
    SET average_score = v_avg
    WHERE UseruserId = v_host_id;

   REFRESH MATERIALIZED VIEW view_camp_avg_rating;

   RAISE NOTICE 'Host % average score updated to %. Materialized view refreshed.',
        v_host_id, v_avg;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_update_host_rating
AFTER INSERT ON Review
FOR EACH ROW
EXECUTE FUNCTION update_host_rating();

--test
--barame camp sho imat reviews
SELECT CampLocationcampLocationId, COUNT(*), AVG(rating)
FROM Review
GROUP BY CampLocationcampLocationId
LIMIT 5;
--barame current host rating
SELECT UseruserId, average_score
FROM Host
WHERE UseruserId = (
    SELECT HostUseruserid
    FROM Host_Host
    WHERE CampLocationcampLocationId = 39224
    limit 1
);
--avg_score e 4
INSERT INTO Review (
    guestuseruserid,
    CampLocationcampLocationId,
    review_date,
    comment,
    rating
)
VALUES (
    1663,
    39224,
    CURRENT_DATE,
    'Great experience!',
    5
);
--sega avg_score e 3
SELECT UseruserId, average_score
FROM Host
WHERE UseruserId = (
    SELECT HostUseruserid
    FROM Host_Host
    WHERE CampLocationcampLocationId = 39224
    limit 1
);