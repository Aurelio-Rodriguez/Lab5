import sqlite3

def execute_sql_file(db_name, sql_file):
    """Executes an SQL file on the given SQLite database."""
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    with open(sql_file, 'r', encoding='utf-8') as file:
        sql_script = file.read()
    
    try:
        cursor.executescript(sql_script)
        conn.commit()
        print(f"Executed {sql_file} on {db_name} successfully.")
    except Exception as e:
        print(f"Error executing {sql_file}: {e}")
    finally:
        conn.close()

# Create and initialize databases
execute_sql_file("solmaris.db", "/mnt/data/PostLab2.sql")
execute_sql_file("adventure_trips.db", "/mnt/data/PostLab3.sql")

# Function to connect and query databases
def query_database(db_name, query):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    conn.close()
    return results

# Example query: Fetch all renters
renters = query_database("solmaris.db", "SELECT * FROM Renters;")
print("Renters:", renters)

# Example query: Fetch all adventure trips
trips = query_database("adventure_trips.db", "SELECT * FROM ADVENTURE_TRIP;")
print("Adventure Trips:", trips)
