import psycopg2
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
import os

load_dotenv()

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    port=os.getenv("DB_PORT"),
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD")
)
cursor = conn.cursor()

model = SentenceTransformer('all-MiniLM-L6-v2')

# Activity - name + description
print("Generating embeddings for activities...")
cursor.execute("SELECT activity_id, name || ' - ' || COALESCE(description, name) FROM Activity")
activities = cursor.fetchall()

for activity_id, description in activities:
    embedding = model.encode(description).tolist()
    cursor.execute(
        "UPDATE Activity SET embedding = %s WHERE activity_id = %s",
        (embedding, activity_id)
    )

conn.commit()
print(f"Done! {len(activities)} activities executed.")

# Service
print("Generating embeddings for services...")
cursor.execute("SELECT serviceId, description FROM Service WHERE description IS NOT NULL")
services = cursor.fetchall()

for service_id, description in services:
    embedding = model.encode(description).tolist()
    cursor.execute(
        "UPDATE Service SET embedding = %s WHERE serviceId = %s",
        (embedding, service_id)
    )

conn.commit()
print(f"Done! {len(services)} services executed.")

# Equipment - name + description
print("Generating embeddings for equipments...")
cursor.execute("SELECT equipmentId, name || ' - ' || COALESCE(description, name) FROM Equipment")
equipments = cursor.fetchall()

for equipment_id, description in equipments:
    embedding = model.encode(description).tolist()
    cursor.execute(
        "UPDATE Equipment SET embedding = %s WHERE equipmentId = %s",
        (embedding, equipment_id)
    )

conn.commit()
print(f"Done! {len(equipments)} equipments executed.")

cursor.close()
conn.close()