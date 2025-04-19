# PostgreSQL DBA Project

## Features
- PostgreSQL database setup
- Basic CRUD operations
- Database monitoring
- Backup automation

## Technologies
- PostgreSQL
- Linux
- Python
- Bash scripting

## Database Schema

The database consists of 4 main tables:
- users: Stores user information
- products: Contains product inventory
- orders: Tracks customer orders
- order_items: Records items in each order

To set up the schema:
\bash
cd scripts/schema
./setup_database.sh

