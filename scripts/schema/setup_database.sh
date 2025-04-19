#!/bin/bash

DB_NAME="dba_project"
DB_USER="admin"

echo "Creating database schema..."
psql -h localhost -U $DB_USER -d $DB_NAME -f 01_create_tables.sql
psql -h localhost -U $DB_USER -d $DB_NAME -f 02_create_indexes.sql
psql -h localhost -U $DB_USER -d $DB_NAME -f 03_sample_data.sql

echo "Database setup complete!"
