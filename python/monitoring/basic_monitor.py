import os
import psycopg2
from datetime import datetime
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Function to get database connection info
def get_db_config():
    return {
        "host": os.getenv("DB_HOST"),
        "database": os.getenv("DB_NAME"),
        "user": os.getenv("DB_USER"),
        "password": os.getenv("DB_PASSWORD"),
        "port": os.getenv("DB_PORT", "5432")  # Use 5432 if no port is set
    }

# Main function to check the database
def check_database():
    try:
        # Get DB config details
        config = get_db_config()

        # Manually assign each value for clarity
        host = config["host"]
        database = config["database"]
        user = config["user"]
        password = config["password"]
        port = config["port"]

        # Connect to the database using the manually assigned variables
        conn = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        cur = conn.cursor()

        print("=== PostgreSQL Database Health Check ===")
        print("Check time:", datetime.now())
        print()

        # Test basic connection
        cur.execute("SELECT 1;")
        result = cur.fetchone()
        if result[0] == 1:
            print("Connection test passed")
        else:
            print("Connection test returned unexpected result")

        # Check number of rows in some tables
        tables = ["users", "products", "orders"]
        for table in tables:
            try:
                cur.execute(f"SELECT COUNT(*) FROM {table};")
                count = cur.fetchone()[0]
                print(f"{table} table: {count} rows")
            except Exception as e:
                print(f"Could not get count for table '{table}': {e}")

        # Check database size
        cur.execute("SELECT pg_size_pretty(pg_database_size(current_database()));")
        size = cur.fetchone()[0]
        print(f"Database size: {size}")

        # Check number of active connections
        cur.execute("SELECT COUNT(*) FROM pg_stat_activity;")
        connections = cur.fetchone()[0]
        print(f"Active connections: {connections}")

        # Close the cursor and connection
        cur.close()
        conn.close()

        print("\nAll checks completed successfully")

    except Exception as error:
        print("\nFailed to check database")
        print("Error:", error)

# Run the function when script is run directly
if __name__ == "__main__":
    check_database()
