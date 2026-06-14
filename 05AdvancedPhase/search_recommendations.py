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

query = input("Enter description: ")
query_embedding = model.encode(query).tolist()

# Similar activities
cursor.execute("SELECT * FROM find_similar_activities(%s::vector, 1)", (query_embedding,))
results = cursor.fetchall()
print("\nMost similar activities:")
for row in results:
    print(f"- {row[1]} ({row[2]}) — similarity: {round(row[3], 3)}")

# Similar services
cursor.execute("SELECT * FROM find_similar_services(%s::vector, 5)", (query_embedding,))
results = cursor.fetchall()
print("\nMost similar services:")
for row in results:
    print(f"- {row[1]} ({row[2]}) — similarity: {round(row[3], 3)}")

# Similar equipment
cursor.execute("SELECT * FROM find_similar_equipment(%s::vector, 1)", (query_embedding,))
results = cursor.fetchall()
print("\nMost similar equipment:")
for row in results:
    print(f"- {row[1]} ({row[2]}) — similarity: {round(row[3], 3)}")

cursor.close()
conn.close()