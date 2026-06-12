CREATE EXTENSION IF NOT EXISTS vector;

--dodavanje nova kolona vo tabelite
ALTER TABLE Activity ADD COLUMN embedding vector(384);
ALTER TABLE Service ADD COLUMN embedding vector(384);
ALTER TABLE Equipment ADD COLUMN embedding vector(384);

--kreiranje indeksi
CREATE INDEX ON Activity USING ivfflat (embedding vector_cosine_ops);
CREATE INDEX ON Service USING ivfflat (embedding vector_cosine_ops);
CREATE INDEX ON Equipment USING ivfflat (embedding vector_cosine_ops);

--check
SELECT activity_id, description, embedding
FROM Activity
WHERE embedding IS NOT NULL
LIMIT 5;

--funkcija za slicni activities
CREATE OR REPLACE FUNCTION find_similar_activities(query_embedding vector, top_n INT DEFAULT 5)
RETURNS TABLE (activity_id INT, name VARCHAR, description VARCHAR, similarity FLOAT) AS $$
    SELECT activity_id, name, description,
           1 - (embedding <=> query_embedding) AS similarity
    FROM Activity
    WHERE embedding IS NOT NULL
    ORDER BY embedding <=> query_embedding
    LIMIT top_n;
$$ LANGUAGE sql;

--zemame embedding za nekoj activity
SELECT activity_id, name, description, embedding
FROM Activity
WHERE embedding IS NOT NULL and name='Skiing'
LIMIT 30;

SELECT * FROM find_similar_activities(
    (SELECT embedding FROM Activity WHERE activity_id = 41982),
    1000
);

-------------------------------------------------------
--funckija za slicni services
CREATE OR REPLACE FUNCTION find_similar_services(query_embedding vector, top_n INT DEFAULT 5)
RETURNS TABLE (serviceId INT, service_name VARCHAR, description VARCHAR, similarity FLOAT) AS $$
    SELECT serviceId, service_name, description,
           1 - (embedding <=> query_embedding) AS similarity
    FROM Service
    WHERE embedding IS NOT NULL
    ORDER BY embedding <=> query_embedding
    LIMIT top_n;
$$ LANGUAGE sql;
--test
SELECT * FROM find_similar_services(
    (SELECT embedding FROM Service WHERE embedding IS NOT NULL LIMIT 1),
    5
);

------------------------------------------------------------
--funckija za slicni equipments
CREATE OR REPLACE FUNCTION find_similar_equipment(
    query_embedding vector,
    top_n INT DEFAULT 5
)
RETURNS TABLE (equipmentId INT, name VARCHAR, description VARCHAR, similarity FLOAT) AS $$
    SELECT equipmentId, name, description,
           1 - (embedding <=> query_embedding) AS similarity
    FROM Equipment
    WHERE embedding IS NOT NULL
    ORDER BY embedding <=> query_embedding
    LIMIT top_n;
$$ LANGUAGE sql;

--test
--zemame equipment so embedding
SELECT equipmentId, name, description
FROM Equipment
WHERE embedding IS NOT NULL
LIMIT 15;
--
SELECT * FROM find_similar_equipment(
    (SELECT embedding FROM Equipment WHERE equipmentId = 207879),
    5
);