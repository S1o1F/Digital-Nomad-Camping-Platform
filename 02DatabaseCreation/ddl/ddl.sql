-- 1. User
CREATE TABLE "User" (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL DEFAULT 'Unknown',
    surname VARCHAR(255) NOT NULL DEFAULT 'Unknown',
    email VARCHAR(255) UNIQUE,
    telephone_num VARCHAR(20),
    date_registration DATE,
    type VARCHAR(10) NOT NULL,
    ssn varchar(13) NOT NULL UNIQUE,
    CHECK (length(trim(name)) > 0 AND length(trim(surname)) > 0),
    CHECK (type IN ('guest', 'host')),
    CHECK (date_registration <= CURRENT_DATE),
    CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

-- 2. Guest
CREATE TABLE Guest (
    UseruserId int4 PRIMARY KEY,
    num_reservations int4 NOT NULL DEFAULT 0,
    preference_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
    CHECK (num_reservations >= 0)
);

-- 3. Host
CREATE TABLE Host (
    UseruserId int4 PRIMARY KEY,
    IBAN VARCHAR(34) NOT NULL,
    average_score int4,
    is_verified VARCHAR(3) NOT NULL DEFAULT 'no',
    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
    CHECK (is_verified IN ('yes', 'no')),
    CHECK (average_score BETWEEN 1 AND 5 OR average_score IS NULL),
    CHECK (IBAN ~ '^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$')
);

-- 4. CampType
CREATE TABLE CampType (
    typeId SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- 5. CampLocation
CREATE TABLE CampLocation (
    campLocationId SERIAL PRIMARY KEY,
    CampTypetypeId int4 NOT NULL,
    name VARCHAR(255) NOT NULL,
    description varchar(255),
    type VARCHAR(20) NOT NULL,
    max_guests int4 NOT NULL,
    min_nights_stay int4 NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    season VARCHAR(20) NOT NULL,
    opening_date DATE NOT NULL,
    closing_date DATE NOT NULL,
    FOREIGN KEY (CampTypetypeId) REFERENCES CampType(typeId) ON DELETE CASCADE,
    CHECK (closing_date > opening_date),
    CHECK (max_guests > 0),
    CHECK (min_nights_stay > 0),
    CHECK (status IN ('active', 'inactive', 'closed')),
    CHECK (season IN ('spring', 'summer', 'autumn', 'winter', 'all')),
    CHECK (type IN ('tent', 'cabin', 'bungalow')),
    CHECK (length(trim(name)) > 0)
);

-- 6. Promotion
CREATE TABLE Promotion (
    promotionId SERIAL PRIMARY KEY,
    HostUserUserId int4 NOT NULL,
    promo_code VARCHAR(50) NOT NULL UNIQUE,
    discount_percent int4 NOT NULL DEFAULT 0,
    discount_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    description varchar(255),
    FOREIGN KEY (HostUserUserId) REFERENCES Host(UseruserId) ON DELETE CASCADE,
   	CHECK (valid_to >= valid_from),
    CHECK (
        (discount_percent>0 AND discount_amount = 0)
        OR
        (discount_amount>0 AND discount_percent = 0)
    ),
    CHECK (discount_percent BETWEEN 0 AND 100),
    CHECK (discount_amount >= 0)
);

CREATE EXTENSION IF NOT EXISTS btree_gist;
-- 7. Reservation
CREATE TABLE Reservation (
    reservationId SERIAL PRIMARY KEY,
    GuestUseruserId int4,
    PromotionpromotionId int4,
    CampLocationcamplocationId int4 NOT NULL,
    number_of_guests int4 NOT NULL,
    reservation_status VARCHAR(20) NOT NULL DEFAULT 'pending',
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    total_price NUMERIC(12,2) NOT NULL,
    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
    FOREIGN KEY (PromotionpromotionId) REFERENCES Promotion(promotionId) ON DELETE SET NULL,
    FOREIGN KEY (CampLocationcamplocationId) REFERENCES CampLocation(campLocationId) ON DELETE RESTRICT,
    CHECK (number_of_guests > 0),
    CHECK (total_price >= 0),
    CHECK (reservation_status IN ('pending', 'confirmed', 'cancelled', 'completed')),
    CHECK (check_out_date > check_in_date),
    CHECK (created_at <= check_in_date),
    EXCLUDE USING gist (
        CampLocationcamplocationId WITH =,
        daterange(check_in_date, check_out_date, '[]') WITH &&
    )
);

-- 8. Payment
CREATE TABLE Payment (
    paymentId SERIAL PRIMARY KEY,
    ReservationreservationId int4 NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_date DATE NOT NULL,
    transaction_reference VARCHAR(50),
    payment_status VARCHAR(30) NOT NULL,
    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
    CHECK (amount > 0),
    CHECK (payment_method IN ('online','cash')),
    CHECK (payment_status IN ('pending','completed','failed','refunded','partially_refunded')),
    CHECK (payment_date <= CURRENT_DATE)
);

-- 9. ReservationStatus
CREATE TABLE ReservationStatus (
    statusReservationId SERIAL PRIMARY KEY,
    ReservationreservationId int4 NOT NULL,
    refund_amount NUMERIC(12,2) NOT NULL DEFAULT 0,
    cancellation_date DATE,
    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
    CHECK (refund_amount >= 0),
    CHECK (cancellation_date IS NULL OR cancellation_date <= CURRENT_DATE)
);

-- 10. Activity
CREATE TABLE Activity (
    activity_id SERIAL PRIMARY KEY,
    location_id int4 NOT NULL,
    name VARCHAR(255) NOT NULL,
    description varchar(255),
    price_per_person int4 NOT NULL,
    max_participants int4 NOT NULL,
    duration_hours int4 NOT NULL,
    difficulty_level int4,
    equipment_provided varchar(255),
    CHECK (price_per_person >= 0),
    CHECK (max_participants > 0),
    CHECK (duration_hours > 0),
    CHECK (difficulty_level BETWEEN 1 AND 5 OR difficulty_level IS NULL)
);

-- 11. ReservationActivity
CREATE TABLE ReservationActivity (
    ReservationActivityId SERIAL PRIMARY KEY,
    Activityactivity_id int4 NOT NULL,
    ReservationreservationId int4 NOT NULL,
    number_of_participants int4 NOT NULL,
    total_price_for_activity NUMERIC(12,2) NOT NULL,
    status VARCHAR(20),
    booking_date DATE NOT NULL,
    FOREIGN KEY (Activityactivity_id) REFERENCES Activity(activity_id) ON DELETE RESTRICT,
    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
    CHECK (number_of_participants > 0),
    CHECK (status IN ('booked','completed','cancelled')),
    CHECK (booking_date <= CURRENT_DATE)
);

-- 12. ActivityReview
CREATE TABLE ActivityReview (
    activityReviewId SERIAL PRIMARY KEY,
    GuestUseruserId int4,
    Activityactivity_id int4 NOT NULL,
    rating int4 NOT NULL,
    comment varchar(255),
    review_date DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
    FOREIGN KEY (Activityactivity_id) REFERENCES Activity(activity_id) ON DELETE CASCADE,
    CHECK (rating BETWEEN 1 AND 5),
    CHECK (review_date <= CURRENT_DATE)
);

-- 13. Review
CREATE TABLE Review (
    reviewId SERIAL PRIMARY KEY,
    CampLocationcampLocationId int4 NOT NULL,
    GuestUseruserId int4,
    review_date DATE NOT NULL DEFAULT CURRENT_DATE,
    comment varchar(255),
    rating int4,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE,
    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE SET NULL,
    CHECK (rating BETWEEN 1 AND 5),
    CHECK (review_date <= CURRENT_DATE)
);

-- 14. EquipmentType
CREATE TABLE EquipmentType (
    EquipmentTypeId SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- 15. Equipment
CREATE TABLE Equipment (
    equipmentId SERIAL PRIMARY KEY,
    EquipmentTypeEquipmentTypeId int4 NOT NULL,
    CampLocationcampLocationId int4,
    name VARCHAR(255) NOT NULL,
    description varchar(255),
    total_quantity int4 NOT NULL,
    available_quantity int4 NOT NULL,
    rental_price_per_day NUMERIC(10,2) NOT NULL,
    deposit_amount NUMERIC(10,2) NOT NULL DEFAULT 0,
    condition_status VARCHAR(20),
    is_available VARCHAR(3) NOT NULL DEFAULT 'yes',
    FOREIGN KEY (EquipmentTypeEquipmentTypeId) REFERENCES EquipmentType(EquipmentTypeId) ON DELETE CASCADE,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE SET NULL,
    CHECK (available_quantity <= total_quantity),
    CHECK (total_quantity > 0 AND available_quantity >= 0),
    CHECK (condition_status IN ('new','good','fair','poor','under_repair')),
    CHECK (is_available IN ('yes','no')),
    CHECK (deposit_amount >= 0)
);

-- 16. EquipmentRental
CREATE TABLE EquipmentRental (
    equipmentRentalId SERIAL PRIMARY KEY,
    EquipmentequipmentId int4 NOT NULL DEFAULT 0,
    ReservationreservationId int4,
    quantity int4 NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price NUMERIC(12,2) NOT NULL,
    deposit_paid NUMERIC(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL ,
    FOREIGN KEY (EquipmentequipmentId) REFERENCES Equipment(equipmentId) ON DELETE SET DEFAULT,
    FOREIGN KEY (ReservationreservationId) REFERENCES Reservation(reservationId) ON DELETE RESTRICT,
    CHECK (quantity > 0),
    CHECK (end_date > start_date),
    CHECK (status IN ('active','returned','overdue','cancelled','damaged')),
    CHECK (deposit_paid >= 0),
    CHECK (total_price >= 0)
);

-- 17. Service
CREATE TABLE Service (
    serviceId SERIAL PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description varchar(255),
    additional_fee NUMERIC(10,2) NOT NULL
);

-- 18. Availability
CREATE TABLE Availability (
    availabilityId SERIAL PRIMARY KEY,
    available_from_date DATE NOT NULL,
    available_to_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CHECK (available_to_date >= available_from_date)
);

-- 19. EmergencyContact
CREATE TABLE EmergencyContact (
    emergencyContactId SERIAL PRIMARY KEY,
    CampLocationcampLocationId int4 NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    created_at DATE NOT NULL,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
);

-- 20. PriceHistory
CREATE TABLE PriceHistory (
    priceHistoryId SERIAL PRIMARY KEY,
    CampLocationcampLocationId int4,
    price_per_night NUMERIC(12,2) NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE SET NULL,
    CHECK (date_to >= date_from),
    CHECK (price_per_night>=0)
);

-- 21. Message
CREATE TABLE "Message" (
    messageId SERIAL NOT NULL,
    UseruserId int4 NOT NULL DEFAULT 0,
    senderId int4 NOT NULL,
    receiverId int4 NOT NULL,
    content varchar(1500) NOT NULL,
    sent_time time(7) NOT NULL,
    PRIMARY KEY (messageId),
    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE SET DEFAULT,
    CHECK (senderId != receiverId),
    CHECK (length(trim(content)) > 0)
);


-- 22. CampLocation - Host
CREATE TABLE Host_Host (
    CampLocationcampLocationId int4 NOT NULL,
    HostUseruserid int4 NOT NULL,
    PRIMARY KEY (CampLocationcampLocationId, HostUseruserid),
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE,
    FOREIGN KEY (HostUseruserid) REFERENCES Host(UseruserId) ON DELETE CASCADE
);

-- 23. CampLocation - Service
CREATE TABLE camp_location_service (
    ServiceserviceId int4 NOT NULL,
    CampLocationcampLocationId int4 NOT NULL,
    PRIMARY KEY (ServiceserviceId, CampLocationcampLocationId),
    FOREIGN KEY (ServiceserviceId) REFERENCES Service(serviceId) ON DELETE CASCADE,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
);

-- 24. Activity - CampLocation
CREATE TABLE Activity_Activity (
    Activityactivity_id2 int4 NOT NULL,
    CampLocationcampLocationId int4 NOT NULL,
    PRIMARY KEY (Activityactivity_id2, CampLocationcampLocationId),
    FOREIGN KEY (Activityactivity_id2) REFERENCES Activity(activity_id) ON DELETE CASCADE,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
);

-- 25. Guest Favorites
CREATE TABLE Favorites (
    favorite_id SERIAL PRIMARY KEY,
    locationId int4 NOT NULL,
    date_added DATE NOT NULL DEFAULT CURRENT_DATE

);

-- 26. Favorites_Guest_saves (old style - kept for compatibility if needed)
CREATE TABLE Favorites_Guest_saves (
    FavoritesfavoriteId int4 NOT NULL,
    GuestUseruserId int4 NOT NULL,
    PRIMARY KEY (FavoritesfavoriteId, GuestUseruserId),
    FOREIGN KEY (FavoritesfavoriteId) REFERENCES Favorites(favorite_id) ON DELETE CASCADE,
    FOREIGN KEY (GuestUseruserId) REFERENCES Guest(UseruserId) ON DELETE CASCADE
);

-- 27. User_Message_receiver
CREATE TABLE user_message_receiver (
    UseruserId int4 NOT NULL,
    MessagemessageId int4 NOT NULL,
    PRIMARY KEY (UseruserId, MessagemessageId),
    FOREIGN KEY (UseruserId) REFERENCES "User"(user_id) ON DELETE CASCADE,
    FOREIGN KEY (MessagemessageId) REFERENCES "Message"(messageId) ON DELETE CASCADE
);


--28.Availability_CampLocation_has
CREATE TABLE Availability_CampLocation_has (
    AvailabilityavailabilityId int4 NOT NULL,
    CampLocationcampLocationId int4 NOT NULL,
    PRIMARY KEY (AvailabilityavailabilityId, CampLocationcampLocationId),
    FOREIGN KEY (AvailabilityavailabilityId) REFERENCES Availability(availabilityId) ON DELETE CASCADE,
    FOREIGN KEY (CampLocationcampLocationId) REFERENCES CampLocation(campLocationId) ON DELETE CASCADE
);

ALTER TABLE "User"
ADD CONSTRAINT ssn_length_check
CHECK (length(ssn) = 13);

ALTER TABLE Favorites
ADD CONSTRAINT fk_favorites_camp
FOREIGN KEY (locationId)
REFERENCES CampLocation(campLocationId)
ON DELETE CASCADE;