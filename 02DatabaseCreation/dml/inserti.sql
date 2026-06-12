--Inserti

--1.User
SELECT conname
FROM pg_constraint
WHERE conrelid = 'public."User"'::regclass
AND contype = 'u';

ALTER TABLE "User" ALTER COLUMN ssn DROP NOT NULL;
CREATE TEMP TABLE first_names(name text);
CREATE TEMP TABLE last_names(surname text);

INSERT INTO first_names VALUES
('James'), ('Mary'), ('John'), ('Patricia'), ('Robert'),
('Jennifer'), ('Michael'), ('Linda'), ('William'), ('Elizabeth'),
('David'), ('Barbara'), ('Richard'), ('Susan'), ('Joseph'),
('Jessica'), ('Thomas'), ('Sarah'), ('Charles'), ('Karen'),
('Christopher'), ('Nancy'), ('Daniel'), ('Lisa'), ('Matthew'),
('Betty'), ('Anthony'), ('Margaret'), ('Mark'), ('Sandra'),
('Donald'), ('Ashley'), ('Steven'), ('Kimberly'), ('Paul'),
('Emily'), ('Andrew'), ('Donna'), ('Joshua'), ('Michelle'),
('Kenneth'), ('Dorothy'), ('Kevin'), ('Carol'), ('Brian'),
('Amanda'), ('George'), ('Melissa'), ('Edward'), ('Deborah'),
('Ronald'), ('Stephanie'), ('Timothy'), ('Rebecca'), ('Jason'),
('Laura'), ('Jeffrey'), ('Helen'), ('Ryan'), ('Sharon');

INSERT INTO last_names VALUES
('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'),
('Garcia'), ('Miller'), ('Davis'), ('Rodriguez'), ('Martinez'),
('Hernandez'), ('Lopez'), ('Gonzalez'), ('Wilson'), ('Anderson'),
('Thomas'), ('Taylor'), ('Moore'), ('Jackson'), ('Martin'),
('Lee'), ('Perez'), ('Thompson'), ('White'), ('Harris'),
('Sanchez'), ('Clark'), ('Ramirez'), ('Lewis'), ('Robinson'),
('Walker'), ('Young'), ('Allen'), ('King'), ('Wright'),
('Scott'), ('Torres'), ('Nguyen'), ('Hill'), ('Flores'),
('Green'), ('Adams'), ('Nelson'), ('Baker'), ('Hall'),
('Rivera'), ('Campbell'), ('Mitchell'), ('Carter'), ('Roberts'),
('Gomez'), ('Phillips'), ('Evans'), ('Turner'), ('Diaz'),
('Parker'), ('Cruz'), ('Edwards'), ('Collins'), ('Reyes');

create table if not exists temp_ssn (
    id bigserial primary key,
    ssn varchar(13)
);

insert into temp_ssn (ssn)
select
    to_char(data.date_birth, 'DDMM') ||
    to_char(extract(year from data.date_birth)::integer % 1000, 'FM099') ||
    '4' || place || gender ||
    to_char(number, 'FM099') as ssn
from (
    select
        (now() - interval '70 years' * random())::date as date_birth,
        (1 + random()*8)::integer as place,
        (random()*5)::integer as gender,
        (random()*100)::integer as number
    from generate_series(1, 200000) s(i)
) as data;

INSERT INTO "User" (
    name, surname, email, telephone_num, date_registration, type
)
SELECT
    (SELECT name FROM first_names ORDER BY random() + gs.n LIMIT 1),
    (SELECT surname FROM last_names ORDER BY random() + gs.n LIMIT 1),
    lower(
        (SELECT name FROM first_names ORDER BY random() + gs.n LIMIT 1)
        || '.' ||
        (SELECT surname FROM last_names ORDER BY random() + gs.n LIMIT 1)
        || gs.n || '@example.com'
    ),
    '+3897' || (100000 + (random()*899999)::int),
    CURRENT_DATE - ((random()*3650)::int),
    CASE
        WHEN random() < 0.5 THEN 'guest'
        ELSE 'host'
    END
FROM generate_series(1, 200000) gs(n);

UPDATE "User"
SET email = lower(name || '.' || surname || user_id || '@example.com');

WITH shuffled_ssn AS (
    SELECT ssn,
           row_number() OVER (ORDER BY random()) AS rn
    FROM temp_ssn
),
numbered_users AS (
    SELECT user_id,
           row_number() OVER (ORDER BY user_id) AS rn
    FROM "User"
)
UPDATE "User" u
SET ssn = s.ssn
FROM numbered_users nu
JOIN shuffled_ssn s ON nu.rn = s.rn
WHERE u.user_id = nu.user_id;

DELETE
FROM "User" u
WHERE user_id NOT IN (
    SELECT MIN(user_id)
    FROM "User"
    GROUP BY ssn
);

TRUNCATE TABLE "User" RESTART identity CASCADE;
DROP TABLE IF EXISTS first_names;
DROP TABLE IF EXISTS last_names;
DROP TABLE IF EXISTS temp_ssn;

SELECT * FROM "User" LIMIT 100;

TRUNCATE TABLE "User" RESTART identity CASCADE;
DROP TABLE IF EXISTS first_names;
DROP TABLE IF EXISTS last_names;
DROP TABLE IF EXISTS temp_ssn;

--2. CampType ------------------------------------------------
INSERT INTO CampType (type_name, description)
VALUES
('camp', 'Basic camping area for outdoor activities'),
('bungalow', 'Wooden or luxury accommodation units'),
('tent', 'Accommodation in a tent in nature');

--3. EquipmentType---------------------------------------------------
INSERT INTO EquipmentType (type_name, description)
VALUES
('Shelter Equipment', 'Equipment used for protection and sleeping outdoors'),
('Sleeping Equipment', 'Items used for sleeping comfort and warmth'),
('Cooking Equipment', 'Tools for preparing food outdoors'),
('Lighting Equipment', 'Devices for illumination at night'),
('Furniture', 'Portable outdoor furniture for camping'),
('Safety Equipment', 'Emergency and protection gear'),
('Adventure Equipment', 'Gear for hiking and outdoor activities'),
('Water Equipment', 'Water storage and purification tools'),
('Climbing Equipment', 'Gear used for climbing and vertical activities'),
('Fishing Equipment', 'Tools and gear for fishing activities'),
('Winter Equipment', 'Equipment for cold weather camping'),
('Navigation Equipment', 'Tools for orientation and navigation like GPS and compasses'),
('Hygiene Equipment', 'Items for personal hygiene in outdoor conditions'),
('Entertainment Equipment', 'Gear for leisure and recreation during camping'),
('Power Equipment', 'Portable energy sources like generators and solar panels'),
('Repair Equipment', 'Tools for fixing and maintaining camping gear'),
('Storage Equipment', 'Containers and bags for organizing equipment'),
('Medical Equipment', 'Advanced medical and emergency care tools'),
('Fire Equipment', 'Tools for fire starting and fire safety like matches and fire starters'),
('Hiking Equipment', 'Essential gear for hiking and trekking activities'),
('Cycling Equipment', 'Gear used for biking and cycling trips'),
('Skiing Equipment', 'Equipment for snow skiing activities'),
('Cooking Accessories', 'Small accessories used in outdoor food preparation'),
('Camping Tools', 'General tools used for setting up and maintaining camp'),
('Electronics Equipment', 'Electronic devices used in camping such as chargers and radios'),
('Kids Equipment', 'Camping gear designed specifically for children'),
('Pet Equipment', 'Equipment and accessories for pets during camping'),
('Emergency Equipment', 'Critical survival and emergency response tools');


--4. Service-----------------------------------------------------------
INSERT INTO Service (service_name, description, additional_fee) VALUES
('WiFi', 'Internet access service', 15.00),
('Electricity', 'Power supply service (estimated monthly usage)', 60.00),
('Water Supply', 'Cold and hot water utility', 20.00),
('Heating', 'Central heating system usage', 50.00),
('Air Conditioning', 'Cooling system usage and maintenance', 25.00),
('Gas Supply', 'Gas utility for heating and cooking', 35.00),
('Waste Collection', 'Garbage removal and processing service', 10.00),
('Security Service', 'Building security and monitoring system', 40.00),
('Maintenance Service', 'General building maintenance support', 30.00),
('Cleaning Service', 'Regular cleaning of shared spaces', 18.00),
('Parking', 'Assigned parking space usage', 45.00),
('Elevator Service', 'Elevator maintenance and operation cost', 12.00),
('Lighting', 'Common area electricity usage', 22.00),
('Hot Water', 'Hot water system usage', 28.00),
('Internet Upgrade', 'High-speed internet package upgrade', 25.00),
('Laundry Service', 'Shared washing and drying facilities', 12.00),
('Gym Access', 'Access to fitness facilities', 35.00),
('Sauna Access', 'Use of sauna facilities', 20.00),
('Swimming Pool Access', 'Access to pool facilities', 30.00),
('Room Cleaning Extra', 'Deep cleaning service on request', 25.00),
('Trash Room Pickup', 'Direct waste pickup from unit', 6.00),
('Mail Handling', 'Receiving and handling mail/parcels', 4.00),
('Visitor Parking', 'Temporary parking for guests', 10.00);


--5. Availability------------------------------------------------------------
INSERT INTO Availability (available_from_date, available_to_date, status)
SELECT
    from_date,
    from_date + (1 + floor(random() * 14))::int,
    CASE
        WHEN random() < 0.75 THEN 'available'
        WHEN random() < 0.9  THEN 'booked'
        ELSE 'unavailable'
    END
FROM (
    SELECT CURRENT_DATE + (floor(random() * 365))::int AS from_date
    FROM generate_series(1, 2000000)
) dates;


--6. CampLocation---------------------------------------------
INSERT INTO CampLocation (
    CampTypetypeId, name, description, type,
    max_guests, min_nights_stay, status, season,
    opening_date, closing_date
)
SELECT
    floor(random()*3 + 1)::int,
    'Camp Location ' || n,
    'Auto generated camping location #' || n,

    (ARRAY['tent', 'cabin', 'bungalow'])[floor(random()*3)::int + 1],

    (floor(random()*12) + 2)::int,
    (floor(random()*7) + 1)::int,

    CASE
        WHEN random() < 0.8  THEN 'active'
        WHEN random() < 0.95 THEN 'inactive'
        ELSE 'closed'
    END,

    (ARRAY['spring','summer','autumn','winter','all'])[floor(random()*5)::int + 1],

    d1,
    d1 + (floor(random()*30) + 1)::int * INTERVAL '1 day'

FROM (
    SELECT
        n,
        CURRENT_DATE + (floor(random()*365)::int) * INTERVAL '1 day' AS d1
    FROM generate_series(1, 100000) n
) data;


--7. Activity------------------------------------------------------
INSERT INTO Activity (
    location_id,
    name,
    description,
    price_per_person,
    max_participants,
    duration_hours,
    difficulty_level,
    equipment_provided
)
SELECT
    (gs.n % 100000) AS location_id,
    CASE r
        WHEN 0 THEN 'Hiking'
        WHEN 1 THEN 'Camping'
        WHEN 2 THEN 'Running Tour'
        WHEN 3 THEN 'Kayaking'
        WHEN 4 THEN 'Cycling Tour'
        WHEN 5 THEN 'Picnic Experience'
        WHEN 6 THEN 'Rock Climbing'
        WHEN 7 THEN 'Fishing Trip'
        WHEN 8 THEN 'Mountain Trekking'
        WHEN 9 THEN 'Yoga in Nature'
        WHEN 10 THEN 'Horse Riding'
        WHEN 11 THEN 'Bird Watching'
        WHEN 12 THEN 'Paragliding'
        WHEN 13 THEN 'Ziplining'
        WHEN 14 THEN 'Rafting'
        WHEN 15 THEN 'Skiing'
        WHEN 16 THEN 'Snowboarding'
        WHEN 17 THEN 'Caving'
        WHEN 18 THEN 'Safari Tour'
        WHEN 19 THEN 'Photography Tour'
        WHEN 20 THEN 'Trail Running'
        WHEN 21 THEN 'Nature Walk'
        WHEN 22 THEN 'Meditation Retreat'
        WHEN 23 THEN 'Swimming Adventure'
        WHEN 24 THEN 'Cliff Jumping'
        WHEN 25 THEN 'Archery Practice'
        WHEN 26 THEN 'Stand Up Paddleboarding'
        WHEN 27 THEN 'Wildlife Exploration'
        WHEN 28 THEN 'Forest Survival Training'
        ELSE 'Sunset Watching Tour'
    END AS name,
    CASE r
        WHEN 0 THEN 'guided hiking in mountains'
        WHEN 1 THEN 'overnight camping in nature'
        WHEN 2 THEN 'city running tour experience'
        WHEN 3 THEN 'river kayaking adventure'
        WHEN 4 THEN 'cycling through scenic routes'
        WHEN 5 THEN 'relaxing picnic outdoors'
        WHEN 6 THEN 'rock climbing training session'
        WHEN 7 THEN 'fishing at lake or river'
        WHEN 8 THEN 'high altitude trekking experience'
        WHEN 9 THEN 'yoga session in nature'
        WHEN 10 THEN 'horse riding trail adventure'
        WHEN 11 THEN 'bird watching tour'
        WHEN 12 THEN 'paragliding flight experience'
        WHEN 13 THEN 'zipline adventure through forest'
        WHEN 14 THEN 'white water rafting experience'
        WHEN 15 THEN 'skiing on mountain slopes'
        WHEN 16 THEN 'snowboarding adventure'
        WHEN 17 THEN 'exploring natural caves'
        WHEN 18 THEN 'safari wildlife tour'
        WHEN 19 THEN 'guided nature photography tour'
        WHEN 20 THEN 'long distance trail running'
        WHEN 21 THEN 'easy nature walking tour'
        WHEN 22 THEN 'guided meditation retreat outdoors'
        WHEN 23 THEN 'open water swimming activity'
        WHEN 24 THEN 'jumping from cliffs into water'
        WHEN 25 THEN 'archery skill training'
        WHEN 26 THEN 'paddleboarding on calm waters'
        WHEN 27 THEN 'wildlife exploration trip'
        WHEN 28 THEN 'forest survival skill training'
        ELSE 'sunset viewing experience'
    END AS description,
    (10 + floor(random() * 200))::int AS price_per_person,
    (2 + floor(random() * 20))::int AS max_participants,
    (1 + floor(random() * 10))::int AS duration_hours,
    CASE
        WHEN random() < 0.2 THEN NULL
        ELSE (1 + floor(random() * 5))::int
    END AS difficulty_level,
    CASE
        WHEN random() < 0.3 THEN 'Provided'
        WHEN random() < 0.6 THEN 'Basic equipment included'
        ELSE 'Bring your own equipment'
    END AS equipment_provided
FROM (
    SELECT row_number() OVER () AS n, floor(random() * 30)::int AS r
    FROM generate_series(1, 250000)
) gs;


--------------------------------------------------------------
--temp_tables za proverka
CREATE TEMP TABLE test_user AS SELECT * FROM "User" LIMIT 1000;
CREATE TEMP TABLE test_guest AS SELECT * FROM Guest LIMIT 1;
CREATE TEMP TABLE test_host AS SELECT * FROM Host LIMIT 1;

UPDATE test_user SET type = 'guest';
UPDATE test_user SET type = 'host'
WHERE user_id IN
(SELECT user_id
FROM test_user
ORDER BY random()
LIMIT (SELECT COUNT(*) * 0.3
FROM test_user));

select * from test_user;
SELECT type, COUNT(*) FROM test_user GROUP BY type;

INSERT INTO test_guest (UseruserId, num_reservations, preference_type)
SELECT
    user_id,
    floor(random() * 30)::int,
    CASE (floor(random() * 5))::int
        WHEN 0 THEN 'mountain'
        WHEN 1 THEN 'forest'
        WHEN 2 THEN 'lake'
        WHEN 3 THEN 'beach'
        ELSE 'luxury'
    END
FROM test_user
WHERE type = 'guest';

INSERT INTO test_host (UseruserId, IBAN, average_score, is_verified)
SELECT
    user_id,
    'MK' || (100000000000000000 + floor(random() * 899999999999999999))::text,
    (1 + floor(random() * 5))::int,
    CASE
        WHEN random() < 0.7 THEN 'yes'
        ELSE 'no'
    END
FROM test_user
WHERE type = 'host';

SELECT * FROM test_guest LIMIT 5;
SELECT * FROM test_host LIMIT 5;
-----------------------------------
UPDATE "User" SET type = 'guest';

UPDATE "User" SET type = 'host'
WHERE user_id IN
(SELECT user_id
FROM "User"
ORDER BY random()
LIMIT (SELECT COUNT(*) * 0.3 FROM "User"));

SELECT type, COUNT(*) FROM "User" GROUP BY type;

--8. Guest----------------------------------------------------
INSERT INTO Guest (UseruserId, num_reservations, preference_type)
SELECT
    user_id,
    floor(random() * 30)::int,
    CASE (floor(random() * 5))::int
        WHEN 0 THEN 'mountain'
        WHEN 1 THEN 'forest'
        WHEN 2 THEN 'lake'
        WHEN 3 THEN 'beach'
        ELSE 'luxury'
    END
FROM "User"
WHERE type = 'guest';


--9. Host-----------------------------------------------------
INSERT INTO Host (UseruserId, IBAN, average_score, is_verified)
SELECT
    user_id,
    'MK' || to_char(floor(random() * 100000000)::bigint, 'FM00000000') ||
            to_char(floor(random() * 100000000)::bigint, 'FM00000000'),
    (1 + floor(random() * 5))::int,
    CASE
        WHEN random() < 0.7 THEN 'yes'
        ELSE 'no'
    END
FROM "User"
WHERE type = 'host';

SELECT COUNT(*) FROM Guest;
SELECT COUNT(*) FROM Host;

--10. Promotion---------------------------------------------------------------
DROP TABLE IF EXISTS temp_promo_hosts;

CREATE TEMP TABLE temp_promo_hosts AS
WITH host_array AS (
    SELECT array_agg(UseruserId ORDER BY random()) AS hosts
    FROM Host
)
SELECT
    gs.n,
    hosts[((gs.n - 1) % array_length(hosts, 1)) + 1] AS UseruserId
FROM generate_series(1, 300000) gs(n)
CROSS JOIN host_array;

SELECT COUNT(DISTINCT UseruserId) FROM temp_promo_hosts;

INSERT INTO Promotion (
    HostUserUserId,
    promo_code,
    discount_percent,
    discount_amount,
    valid_from,
    valid_to,
    description
)
WITH base AS (
    SELECT
        gs.n,
        h.UseruserId,
        random() AS r,
        CURRENT_DATE - (floor(random() * 365))::int AS d1
    FROM generate_series(1, 300000) gs(n)
    JOIN temp_promo_hosts h ON h.n = gs.n
)
SELECT
    UseruserId,
    'PROMO-' || n,
    CASE WHEN r < 0.6 THEN (floor(random() * 8) + 1)::int * 10 ELSE 0 END,
    CASE WHEN r >= 0.6 THEN ((floor(random() * 20) + 1)::int * 100)::numeric ELSE 0 END,
    d1,
    d1 + (1 + floor(random() * 30))::int,
    'Promotion offer ' || n
FROM base;


--11.Host_Host-----------------------------------------
INSERT INTO Host_Host (CampLocationcampLocationId, HostUseruserid)
SELECT
    cl.campLocationId,
    h.UseruserId
FROM CampLocation cl
JOIN LATERAL (
    SELECT UseruserId
    FROM Host
    ORDER BY random()
    LIMIT (1 + floor(random() * 3))::int
) h ON true;

--12.camp_location_service-----------------------------------
INSERT INTO camp_location_service (ServiceserviceId, CampLocationcampLocationId)
SELECT
    s.serviceId,
    cl.campLocationId
FROM CampLocation cl
JOIN LATERAL (
    SELECT serviceId
    FROM Service
    ORDER BY random()
    LIMIT (1 + floor(random() * 5))::int
) s ON TRUE;


--13.Activity_Activity-----------------------------------------
INSERT INTO Activity_Activity (
    Activityactivity_id2,
    CampLocationcampLocationId
)
SELECT
    act.activity_id,
    cl.campLocationId
FROM CampLocation cl
JOIN LATERAL (
    SELECT activity_id
    FROM Activity
    ORDER BY random()
    LIMIT (2 + floor(random() * 5))::int
) act ON TRUE;

--14.Availability_CampLocation_has-------------------------------
INSERT INTO Availability_CampLocation_has (
    AvailabilityavailabilityId,
    CampLocationcampLocationId
)
WITH avail_array AS (
    SELECT array_agg(availabilityId) AS ids
    FROM Availability
)
SELECT
    ids[1 + floor(random() * array_length(ids, 1))::int] AS availabilityId,
    cl.campLocationId
FROM CampLocation cl
CROSS JOIN avail_array;


--15.Favorites----------------------------------------
INSERT INTO Favorites (locationId, date_added)
WITH cl_array AS (
    SELECT array_agg(campLocationId) AS ids
    FROM CampLocation
)
SELECT
    ids[1 + floor(random() * array_length(ids, 1))::int],
    CURRENT_DATE - (floor(random() * 365))::int
FROM generate_series(1, 300000)
CROSS JOIN cl_array;


--16.Favorites_Guest_saves-----------------------------
INSERT INTO Favorites_Guest_saves (FavoritesfavoriteId, GuestUseruserId)
SELECT
    f.favorite_id,
    g.UseruserId
FROM Favorites f
JOIN LATERAL (
    SELECT  UseruserId
    FROM Guest
    ORDER BY random()
    LIMIT (1 + floor(random() * 3))::int
) g ON true;

--17.EmergancyContact---------------------------
INSERT INTO EmergencyContact (
    CampLocationcampLocationId,
    contact_name,
    phone_number,
    created_at
)
WITH cl_array AS (
    SELECT array_agg(campLocationId) AS ids,
           array_agg(name) AS names
    FROM CampLocation
)
SELECT
    ids[1 + floor(random() * array_length(ids, 1))::int],
    'Emergency Contact ' || gs.n,
    '+3897' || lpad((floor(random() * 10000000))::text, 7, '0'),
    CURRENT_DATE - (floor(random() * 365))::int
FROM generate_series(1, 100000) gs(n)
CROSS JOIN cl_array;
select * from emergencycontact;


--18.PriceHistory----------------------------------
INSERT INTO PriceHistory (
    CampLocationcampLocationId,
    price_per_night,
    date_from,
    date_to
)
WITH cl_array AS (
    SELECT array_agg(campLocationId) AS ids
    FROM CampLocation
),
base AS (
    SELECT
        ids[1 + floor(random() * array_length(ids, 1))::int] AS campLocationId,
        (floor(random() * 30) + 1)::int * 10 AS price,
        DATE '2020-01-01' + (floor(random() * 1500))::int AS date_from
    FROM generate_series(1, 5000000) gs
    CROSS JOIN cl_array
)
SELECT
    campLocationId,
    price,
    date_from,
    date_from + (1 + floor(random() * 30))::int
FROM base;


--19.Equipment -------------------------------------
TRUNCATE TABLE equipment RESTART IDENTITY CASCADE;
INSERT INTO Equipment (
    EquipmentTypeEquipmentTypeId,
    CampLocationcampLocationId,
    name,
    description,
    total_quantity,
    available_quantity,
    rental_price_per_day,
    deposit_amount,
    condition_status,
    is_available
)
WITH et_array AS (
    SELECT array_agg(EquipmentTypeId) AS et_ids,
           array_agg(type_name) AS et_names,
           array_agg(description) AS et_descs
    FROM EquipmentType
),
cl_array AS (
    SELECT array_agg(campLocationId) AS cl_ids
    FROM CampLocation
),
base AS (
    SELECT
        gs.n,
        et_ids[1 + floor(random() * array_length(et_ids, 1))::int] AS et_id,
        et_names[1 + floor(random() * array_length(et_names, 1))::int] AS et_name,
        et_descs[1 + floor(random() * array_length(et_descs, 1))::int] AS et_desc,
        cl_ids[1 + floor(random() * array_length(cl_ids, 1))::int] AS cl_id,
        (floor(random()*20 + 1))::int AS total_qty,
        (floor(random() * (floor(random()*20 + 1))))::int AS avail_qty
    FROM generate_series(1, 1000000) gs(n)
    CROSS JOIN et_array
    CROSS JOIN cl_array
)
SELECT
    et_id,
    cl_id,
    CASE et_name
        WHEN 'Shelter Equipment' THEN (ARRAY['4-Person Tent','Ultralight Tent','Tarp Shelter','Tent Poles Set','Groundsheet'])[floor(random()*5 + 1)::int]
        WHEN 'Sleeping Equipment' THEN (ARRAY['Sleeping Bag - Winter','Sleeping Bag - Summer','Inflatable Mattress','Camping Pillow','Thermal Blanket'])[floor(random()*5 + 1)::int]
        WHEN 'Cooking Equipment' THEN (ARRAY['Portable Gas Stove','Camping Grill','Cooking Pot Set','Frying Pan Outdoor','Camping Kettle'])[floor(random()*5 + 1)::int]
        WHEN 'Lighting Equipment' THEN (ARRAY['LED Camping Lantern','Headlamp','Solar Lamp','Flashlight Pro','String Camping Lights'])[floor(random()*5 + 1)::int]
        WHEN 'Furniture' THEN (ARRAY['Camping Chair','Folding Table','Camping Stool','Portable Bench','Relax Chair Lounger'])[floor(random()*5 + 1)::int]
        WHEN 'Safety Equipment' THEN (ARRAY['First Aid Kit','Emergency Whistle','Survival Kit','Fire Extinguisher','Safety Helmet'])[floor(random()*5 + 1)::int]
        WHEN 'Adventure Equipment' THEN (ARRAY['Hiking Backpack','Climbing Harness','Rope Set','Adventure Helmet','Trail Gloves'])[floor(random()*5 + 1)::int]
        WHEN 'Water Equipment' THEN (ARRAY['Water Filter','Water Tank','Hydration Pack','Water Purification Tablets','Portable Shower'])[floor(random()*5 + 1)::int]
        WHEN 'Climbing Equipment' THEN (ARRAY['Climbing Rope','Carabiner Set','Climbing Shoes','Belay Device','Climbing Harness Pro'])[floor(random()*5 + 1)::int]
        WHEN 'Fishing Equipment' THEN (ARRAY['Fishing Rod','Fishing Net','Tackle Box','Fishing Reel','Bait Kit'])[floor(random()*5 + 1)::int]
        WHEN 'Winter Equipment' THEN (ARRAY['Snow Boots','Winter Sleeping Bag','Thermal Jacket','Hand Warmers','Ice Axe'])[floor(random()*5 + 1)::int]
        WHEN 'Navigation Equipment' THEN (ARRAY['GPS Device','Compass Pro','Topographic Map Kit','Altimeter','Navigation Watch'])[floor(random()*5 + 1)::int]
        WHEN 'Hygiene Equipment' THEN (ARRAY['Camping Shower','Portable Toilet','Soap Kit','Wet Wipes Pack','Toothbrush Kit'])[floor(random()*5 + 1)::int]
        WHEN 'Entertainment Equipment' THEN (ARRAY['Portable Speaker','Camping Cards','Board Game Set','Hammock','Projector Mini'])[floor(random()*5 + 1)::int]
        WHEN 'Power Equipment' THEN (ARRAY['Solar Panel','Portable Generator','Power Bank','Battery Pack','Inverter'])[floor(random()*5 + 1)::int]
        WHEN 'Repair Equipment' THEN (ARRAY['Multi-tool Kit','Repair Tape','Toolbox Set','Hammer Outdoor','Screwdriver Kit'])[floor(random()*5 + 1)::int]
        WHEN 'Storage Equipment' THEN (ARRAY['Dry Bag','Storage Box','Backpack Organizer','Waterproof Container','Compression Sack'])[floor(random()*5 + 1)::int]
        WHEN 'Medical Equipment' THEN (ARRAY['First Aid Advanced Kit','Bandage Set','Pain Relief Kit','Emergency Medical Kit','Thermometer Kit'])[floor(random()*5 + 1)::int]
        WHEN 'Fire Equipment' THEN (ARRAY['Fire Starter Kit','Magnesium Rod','Waterproof Matches','Fire Steel','Emergency Torch'])[floor(random()*5 + 1)::int]
        WHEN 'Hiking Equipment' THEN (ARRAY['Trekking Poles','Hiking Backpack','Trail Shoes','Rain Jacket','Hiking Map Kit'])[floor(random()*5 + 1)::int]
        WHEN 'Cycling Equipment' THEN (ARRAY['Mountain Bike Helmet','Bike Repair Kit','Cycling Gloves','Bike Pump','Reflective Vest'])[floor(random()*5 + 1)::int]
        WHEN 'Skiing Equipment' THEN (ARRAY['Ski Poles','Ski Helmet','Ski Goggles','Ski Boots','Ski Jacket'])[floor(random()*5 + 1)::int]
        WHEN 'Cooking Accessories' THEN (ARRAY['Camping Spoon Set','Portable Knife Set','Cutting Board','Spice Kit','Cooking Utensil Set'])[floor(random()*5 + 1)::int]
        WHEN 'Camping Tools' THEN (ARRAY['Hammer','Tent Peg Extractor','Camping Axe','Saw Folding','Multi-purpose Tool'])[floor(random()*5 + 1)::int]
        WHEN 'Electronics Equipment' THEN (ARRAY['Camping Radio','Portable Charger','Walkie Talkie','LED Charger Lamp','Smartwatch Outdoor'])[floor(random()*5 + 1)::int]
        WHEN 'Kids Equipment' THEN (ARRAY['Kids Sleeping Bag','Mini Backpack','Kids Chair','Outdoor Toy Set','Kids Lantern'])[floor(random()*5 + 1)::int]
        WHEN 'Pet Equipment' THEN (ARRAY['Dog Leash Set','Pet Tent','Pet Food Container','Portable Water Bowl','Pet Harness'])[floor(random()*5 + 1)::int]
        WHEN 'Emergency Equipment' THEN (ARRAY['Emergency Shelter','Survival Blanket','Rescue Whistle','Signal Mirror','Emergency Kit Pro'])[floor(random()*5 + 1)::int]
        ELSE 'Generic Equipment'
    END,
    et_desc,
    total_qty,
    CASE WHEN avail_qty > total_qty THEN total_qty ELSE avail_qty END,
    (floor(random() * 16) + 1)::int * 5,
    (floor(random() * 25))::int * 10,
    (ARRAY['new','good','fair','poor','under_repair'])[floor(random()*5 + 1)::int],
    CASE WHEN avail_qty = 0 THEN 'no' ELSE CASE WHEN random() < 0.75 THEN 'yes' ELSE 'no' END END
FROM base;
select * from equipment;



--20. Reservation --------------------------------------------
DROP TABLE IF EXISTS temp_reservation_data;

CREATE TEMP TABLE temp_reservation_data AS
WITH guest_array AS (
    SELECT array_agg(user_id ORDER BY random()) AS guests
    FROM "User"
    WHERE type = 'guest'
),
promo_array AS (
    SELECT array_agg(promotionId ORDER BY random()) AS promos
    FROM Promotion
),
camp_array AS (
    SELECT array_agg(campLocationId ORDER BY random()) AS camps
    FROM CampLocation
)
SELECT
    gs.n,
    ga.guests[((gs.n - 1) % array_length(ga.guests, 1)) + 1] AS guest_id,
    pa.promos[((gs.n - 1) % array_length(pa.promos, 1)) + 1] AS promo_id,
    ca.camps[((gs.n - 1) % array_length(ca.camps, 1)) + 1] AS camp_id,
    CURRENT_DATE - ((gs.n % 730) + 1) AS created_at
FROM generate_series(1, 5000000) gs(n)
CROSS JOIN guest_array ga
CROSS JOIN promo_array pa
CROSS JOIN camp_array ca;

INSERT INTO Reservation (
    GuestUseruserId,
    PromotionpromotionId,
    CampLocationcamplocationId,
    number_of_guests,
    reservation_status,
    check_in_date,
    check_out_date,
    created_at,
    total_price
)
WITH numbered AS (
    SELECT
        trd.*,
        ROW_NUMBER() OVER (PARTITION BY camp_id ORDER BY n) AS rn
    FROM temp_reservation_data trd
),
dates AS (
    SELECT
        n.*,
        cl.opening_date,
        cl.opening_date + (rn * 5) * INTERVAL '1 day' AS check_in_ts,
        cl.opening_date
        + (rn * 5) * INTERVAL '1 day'
        + (2 + (rn % 3)) * INTERVAL '1 day' AS check_out_ts,
        cl.closing_date
    FROM numbered n
    JOIN CampLocation cl ON cl.campLocationId = n.camp_id
)
SELECT
    d.guest_id,
    CASE WHEN d.n % 3 = 0 THEN d.promo_id ELSE NULL END,
    d.camp_id,
    (1 + (d.n % 5))::int,
    CASE
        WHEN d.check_in_ts::date > CURRENT_DATE THEN
            (ARRAY['pending','confirmed'])[(d.n % 2) + 1]
        ELSE
            (ARRAY['pending','confirmed','cancelled','completed'])[(d.n % 4) + 1]
    END,
    d.check_in_ts::date,
    d.check_out_ts::date,
    LEAST(d.created_at, d.check_in_ts::date - 1),
    (50 + (d.n % 500))::numeric(12,2)
FROM dates d
WHERE d.check_out_ts <= d.closing_date;

UPDATE Reservation
SET reservation_status = 'cancelled'
WHERE reservationId % 7 = 0;

--21. Payment ---------------------------------------
INSERT INTO Payment (
    ReservationreservationId,
    amount,
    payment_method,
    payment_date,
    transaction_reference,
    payment_status
)
WITH res_array AS (
    SELECT
        array_agg(reservationId ORDER BY random()) AS ids,
        array_agg(check_in_date ORDER BY random()) AS dates,
        array_length(array_agg(reservationId), 1) AS cnt
    FROM Reservation
)
SELECT
    ids[1 + (gs.i % cnt)],
    (50 + (abs(hashint4(gs.i * 7)) % 450))::numeric(12,2),
    (ARRAY['online', 'cash'])[(abs(hashint4(gs.i * 3)) % 2) + 1],
    LEAST(
        CURRENT_DATE,
        CURRENT_DATE - (abs(hashint4(gs.i * 11)) % 365)
    ),
    'TXN-' || upper(substr(md5(gs.i::text), 1, 10)),
    (ARRAY['pending','completed','failed','refunded','partially_refunded'])[(abs(hashint4(gs.i * 13)) % 5) + 1]
FROM generate_series(1, 1000000) gs(i)
CROSS JOIN res_array;

--22.ReservationSttaus-------------------------------
INSERT INTO ReservationStatus (
    ReservationreservationId,
    refund_amount,
    cancellation_date
)
SELECT
    r.reservationId,

    CASE
        WHEN r.reservation_status = 'cancelled'
            THEN round((r.total_price * random())::numeric, 2)
        ELSE 0
    END,

    CASE
        WHEN r.reservation_status = 'cancelled'
            THEN LEAST(
                r.created_at + (floor(random() * 5))::int,
                CURRENT_DATE
            )
        ELSE NULL
    END

FROM Reservation r;

SELECT COUNT(*) FROM Reservation WHERE reservation_status = 'cancelled';
select distinct count(cancellation_date) from reservationstatus;
SELECT * FROM ReservationStatus WHERE cancellation_date IS NOT NULL LIMIT 100;

--23. ReservationActivity------------------------------------
WITH
res AS (
    SELECT array_agg(reservationId) AS arr, count(*) AS cnt
    FROM Reservation
),
act AS (
    SELECT array_agg(activity_id) AS arr, count(*) AS cnt
    FROM Activity
)

INSERT INTO ReservationActivity (
    Activityactivity_id,
    ReservationreservationId,
    number_of_participants,
    total_price_for_activity,
    status,
    booking_date
)
SELECT
    act.arr[1 + (gs.i % act.cnt)],
    res.arr[1 + (gs.i % res.cnt)],

    (1 + floor(random() * 5))::int,
    round((10 + random() * 200)::numeric, 2),

    (ARRAY['booked','completed','cancelled'])
        [1 + floor(random() * 3)],

    CURRENT_DATE - (floor(random() * 365))::int

FROM generate_series(1, 15000000) gs(i)
CROSS JOIN act
CROSS JOIN res;

select * from reservationactivity;

--24. EquipmentRental--------------------------
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
WITH
eq AS (
    SELECT array_agg(equipmentId) AS arr, count(*) AS cnt
    FROM Equipment
),
res AS (
    SELECT array_agg(reservationId) AS arr, count(*) AS cnt
    FROM Reservation
)
SELECT
    eq.arr[1 + (gs.i % eq.cnt::int)],
    res.arr[1 + (gs.i % res.cnt::int)],
    (1 + abs(hashint4(gs.i * 3)) % 5)::int,
    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365),
    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365) + (1 + abs(hashint4(gs.i * 11)) % 14),
    (10 + abs(hashint4(gs.i * 13)) % 200)::numeric,
    (abs(hashint4(gs.i * 17)) % 100)::numeric,
    (ARRAY['active','returned','overdue','cancelled','damaged'])[(abs(hashint4(gs.i * 19)) % 5) + 1]
FROM generate_series(1, 5000000) gs(i)
CROSS JOIN eq
CROSS JOIN res;

--25.review---------------------------
INSERT INTO Review (
    CampLocationcampLocationId,
    GuestUseruserId,
    review_date,
    comment,
    rating
)
WITH guest_array AS (
    SELECT array_agg(UseruserId) AS ids, count(*) AS cnt
    FROM Guest
),
camp_array AS (
    SELECT array_agg(campLocationId) AS ids, count(*) AS cnt
    FROM CampLocation
)
SELECT
    ca.ids[1 + (gs.i % ca.cnt::int)],
    ga.ids[1 + (gs.i % ga.cnt::int)],
    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365),
    CASE (abs(hashint4(gs.i * 3)) % 5) + 1
        WHEN 5 THEN 'Amazing place! Everything was perfect'
        WHEN 4 THEN 'Very nice location, enjoyed the stay'
        WHEN 3 THEN 'Average experience'
        WHEN 2 THEN 'Could be better'
        WHEN 1 THEN 'Very disappointing stay'
    END,
    (abs(hashint4(gs.i * 3)) % 5) + 1
FROM generate_series(1, 100000) gs(i)
CROSS JOIN guest_array ga
CROSS JOIN camp_array ca;



--26. ActivityReview--------------------------
INSERT INTO ActivityReview (
    GuestUseruserId,
    Activityactivity_id,
    rating,
    comment,
    review_date
)
WITH guest_array AS (
    SELECT array_agg(UseruserId) AS ids, count(*) AS cnt
    FROM Guest
),
activity_array AS (
    SELECT array_agg(activity_id) AS ids, count(*) AS cnt
    FROM Activity
)
SELECT
    ga.ids[1 + (gs.i % ga.cnt::int)],
    aa.ids[1 + (gs.i % aa.cnt::int)],
    (abs(hashint4(gs.i * 3)) % 5) + 1,
    CASE (abs(hashint4(gs.i * 3)) % 5) + 1
        WHEN 5 THEN 'Amazing experience! Highly recommended!'
        WHEN 4 THEN 'Very good activity, would do again'
        WHEN 3 THEN 'It was okay, nothing special'
        WHEN 2 THEN 'Not very satisfied'
        WHEN 1 THEN 'Terrible experience'
    END,
    CURRENT_DATE - (abs(hashint4(gs.i * 7)) % 365)
FROM generate_series(1, 200000) gs(i)
CROSS JOIN guest_array ga
CROSS JOIN activity_array aa;


--27. Message------------------------------
INSERT INTO "Message" (
    UseruserId,
    senderId,
    receiverId,
    content,
    sent_time
)
WITH u AS (
    SELECT array_agg(user_id) AS arr, count(*) AS cnt
    FROM "User"
)
SELECT
    s.id,
    s.id,
    r.id,
    'M-' || gs.i,
    (now() - (abs(hashint4(gs.i * 7)) % 86400) * interval '1 second')::time
FROM generate_series(1, 10000000) gs(i)
CROSS JOIN u
JOIN LATERAL (SELECT u.arr[1 + (gs.i % u.cnt::int)] AS id) s ON true
JOIN LATERAL (SELECT u.arr[1 + ((gs.i + 7) % u.cnt::int)] AS id) r ON true
WHERE s.id <> r.id;


--28.user_message_receiver-----------------------------------
INSERT INTO user_message_receiver (UseruserId, MessagemessageId)
WITH user_array AS (
    SELECT array_agg(user_id) AS ids, count(*) AS cnt
    FROM "User"
)
SELECT
    ids[1 + (m.messageId % cnt::int)],
    m.messageId
FROM "Message" m
CROSS JOIN user_array;