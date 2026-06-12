-- views

--1view за сите активни камп локации, заедно со нивниот тип, капацитет и тековна цена, при што цената се прикажува само доколку постои важечка цена за тековниот датум. (зато so left join)“
CREATE OR REPLACE VIEW view_available_camps AS
SELECT
    cl.campLocationId,
    cl.name,
    cl.description,
    ct.type_name,
    cl.max_guests,
    cl.min_nights_stay,
    cl.season,
    ph.price_per_night

FROM CampLocation cl

JOIN CampType ct
    ON cl.CampTypetypeId = ct.typeId
--sekoj kamp mora da imat tip

LEFT JOIN PriceHistory ph
    ON ph.CampLocationcampLocationId = cl.campLocationId
    AND CURRENT_DATE BETWEEN ph.date_from AND ph.date_to

WHERE cl.status = 'active';

--left join zsh ne sekoj kamp imat twkovna Cena vo daden moment,
-- ако нема цена → NULL ама кампот сепак се прикажува
-- CURRENT_DATE услов ја земаш само важечката цена за денес не сите историски


--2. View za pregled na site idni ili prethodni rezervacii so filter za guest ili host
CREATE OR REPLACE VIEW view_all_reservations AS
SELECT
    r.reservationId,
    r.GuestUseruserId AS guest_id,
    cl.campLocationId,
    cl.name AS camp_name,
    cl.description,
    r.check_in_date,
    r.check_out_date,
    r.number_of_guests,
    r.total_price,
    r.reservation_status,
    hh.HostUseruserid AS host_id,

    CASE
        WHEN r.check_in_date > CURRENT_DATE
             AND r.reservation_status IN ('confirmed', 'pending')
        THEN 'UPCOMING'

        WHEN r.check_out_date < CURRENT_DATE
             OR r.reservation_status = 'cancelled'
        THEN 'HISTORY'

        ELSE 'ACTIVE'
    END AS reservation_type

FROM Reservation r

JOIN CampLocation cl
    ON r.CampLocationcamplocationId = cl.campLocationId

LEFT JOIN Host_Host hh
    ON cl.campLocationId = hh.CampLocationcampLocationId;

--primer za da vidime idni rezervacii
--SELECT *
--FROM view_all_reservations
--WHERE reservation_type = 'UPCOMING'
--AND guest_id = 5;
--SELECT * FROM view_all_reservations WHERE host_id = 1 LIMIT 10;

--primer za da vidime prethodni rezervacii
--SELECT *
--FROM view_all_reservations
--WHERE reservation_type = 'HISTORY'
--AND host_id = 16823;


--3. За корисникот да мојт да ги видит сите достапни activities за некој камп
CREATE OR REPLACE VIEW view_available_activities AS
SELECT
    a.activity_id,
    a.name,
    a.description,
    a.price_per_person,
    a.max_participants,
    a.duration_hours,
    a.difficulty_level,
    cl.campLocationId,
    cl.name AS camp_name

FROM Activity a

JOIN Activity_Activity aa
    ON a.activity_id = aa.Activityactivity_id2

JOIN CampLocation cl
    ON aa.CampLocationcampLocationId = cl.campLocationId

WHERE cl.status = 'active';


--4. За корисникот да мојт да ги видит омилените камп локации со детали за кампот и приказ на цена
CREATE OR REPLACE VIEW view_favorite_camps AS
SELECT
    f.favorite_id,
    fg.GuestUseruserId,
    cl.campLocationId,
    cl.name,
    cl.description,
    cl.max_guests,
    cl.season,
    ph.price_per_night,
    f.date_added

FROM Favorites f

JOIN Favorites_Guest_saves fg
    ON f.favorite_id = fg.FavoritesfavoriteId

JOIN CampLocation cl
    ON f.locationId = cl.campLocationId

LEFT JOIN PriceHistory ph
    ON ph.CampLocationcampLocationId = cl.campLocationId
    AND CURRENT_DATE BETWEEN ph.date_from AND ph.date_to;

--left join zsh korisnikot sakat da gi vidit omilenite kamp lokacii , ama mojt nekoja da nemat Cena vo momentot ama pak sakame da se prikazit I kaj Cena kje imat null


--5. View za host da ima pregled za vkupna zarabotka od site camp locations so gi imat hostot
CREATE OR REPLACE VIEW view_host_total_earnings AS
SELECT
    h.UseruserId AS host_id,
    SUM(p.amount) AS total_earnings,
    COUNT(p.paymentId) AS total_payments

FROM Host h

JOIN Host_Host hh
    ON h.UseruserId = hh.HostUseruserid

JOIN CampLocation cl
    ON hh.CampLocationcampLocationId = cl.campLocationId

JOIN Reservation r
    ON r.CampLocationcamplocationId = cl.campLocationId

JOIN Payment p
    ON p.ReservationreservationId = r.reservationId

WHERE p.payment_status = 'completed'

GROUP BY
    h.UseruserId;


--6.View za avg rating po kamp
CREATE MATERIALIZED VIEW view_camp_avg_rating AS
SELECT
    cl.campLocationId,
    cl.name,
    AVG(r.rating) AS average_rating,
    COUNT(r.reviewId) AS total_reviews

FROM CampLocation cl

LEFT JOIN Review r
    ON cl.campLocationId = r.CampLocationcampLocationId

GROUP BY
    cl.campLocationId,
    cl.name;

--left join za Ako nekoj kamp se uste nemat ratings da se zemit vo predvid, a ne da se skoknit, kje se prikazit primer no reviews yet , zsh AK e 0 to znacit dek e mn losho( a ne e losho tuku samo nemat ratings )?


--7.View za pregled na dostapna oprema po kamp
CREATE OR REPLACE VIEW view_available_equipment AS
SELECT
    e.equipmentId,
    e.name,
    e.description,
    et.type_name AS equipment_type,
    cl.campLocationId,
    cl.name AS camp_name,
    e.available_quantity,
    e.total_quantity,
    e.rental_price_per_day,
    e.deposit_amount,

    CASE
        WHEN e.available_quantity = 0 THEN 'out_of_stock'
        WHEN e.available_quantity < e.total_quantity THEN 'limited'
        ELSE 'available'
    END AS availability_status

FROM Equipment e

JOIN EquipmentType et
    ON e.EquipmentTypeEquipmentTypeId = et.EquipmentTypeId

LEFT JOIN CampLocation cl
    ON e.CampLocationcampLocationId = cl.campLocationId

WHERE
    e.is_available = 'yes';

--LEFT JOIN е искористен бидејќи опремата може да не биде поврзана со конкретна камп локација, но сепак треба да биде прикажана како достапна


--8. View za reservation payment + statusot dali e payed ili ne e...
CREATE OR REPLACE VIEW view_reservation_payment_status AS
SELECT
    r.reservationId,
    r.GuestUseruserId AS guest_id,
    cl.campLocationId,
    cl.name AS camp_name,
    r.total_price,

    CASE
        WHEN SUM(p.amount) IS NULL THEN 0
        ELSE SUM(p.amount)
    END AS total_paid,

    r.total_price -
    CASE
        WHEN SUM(p.amount) IS NULL THEN 0
        ELSE SUM(p.amount)
    END AS remaining_amount,

    CASE
        WHEN SUM(p.amount) IS NULL THEN 'not_paid'
        WHEN SUM(p.amount) < r.total_price THEN 'partially_paid'
        ELSE 'paid'
    END AS payment_summary_status

FROM Reservation r

JOIN CampLocation cl
    ON r.CampLocationcamplocationId = cl.campLocationId

LEFT JOIN Payment p
    ON r.reservationId = p.ReservationreservationId
    AND p.payment_status = 'completed'

GROUP BY
    r.reservationId,
    r.GuestUseruserId,
    cl.campLocationId,
    cl.name,
    r.total_price;


--9. Овој view прикажува преглед на сите камп локации со нивните основни информации и статистика за резервации и рецензии, при што секој камп се категоризира според неговата популарност како „top_rated“, „popular“ или „standard“.
CREATE OR REPLACE VIEW view_popular_camps AS
SELECT
    cl.campLocationId,
    cl.name,
    cl.description,

    COUNT(DISTINCT r.reservationId) AS total_reservations,

    ROUND(AVG(rv.rating), 2) AS avg_rating,

    COUNT(DISTINCT rv.reviewId) AS total_reviews,

    CASE
        WHEN COUNT(DISTINCT r.reservationId) > 50
             AND COALESCE(AVG(rv.rating), 0) >= 4.5
        THEN 'top_rated'

        WHEN COUNT(DISTINCT r.reservationId) > 20
        THEN 'popular'

        ELSE 'standard'
    END AS popularity_status

FROM CampLocation cl

LEFT JOIN Reservation r
    ON r.CampLocationcamplocationId = cl.campLocationId

LEFT JOIN Review rv
    ON rv.CampLocationcampLocationId = cl.campLocationId


GROUP BY
    cl.campLocationId,
    cl.name,
    cl.description;