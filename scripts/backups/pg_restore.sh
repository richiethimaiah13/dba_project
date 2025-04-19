#!/bin/bash

# Configuration
DB_NAME="dba_project"
DB_USER="admin"
BACKUP_DIR="/home/ubuntu/postgres-dba-project/scripts/backups"

# List available backups
echo "Available backups:"
ls -lh $BACKUP_DIR/${DB_NAME}_backup_*

# Prompt for backup file
read -p "Enter backup filename to restore: " BACKUP_FILE

# Verify file exists
if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo "Backup file not found!" >&2
    exit 1
fi

# Drop and recreate database
psql -h localhost -U $DB_USER -d postgres -c "DROP DATABASE IF EXISTS $DB_NAME;"
psql -h localhost -U $DB_USER -d postgres -c "CREATE DATABASE $DB_NAME;"

# Restore backup
echo "Restoring database from $BACKUP_FILE"
psql -h localhost -U $DB_USER -d $DB_NAME < "$BACKUP_DIR/$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Restore completed successfully"
else
    echo "Restore failed!" >&2
    exit 1
fi
