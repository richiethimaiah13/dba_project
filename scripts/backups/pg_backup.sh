#!/bin/bash

# Configuration
DB_NAME="dba_project"
DB_USER="admin"
BACKUP_DIR="/home/ubuntu/postgres-dba-project/scripts/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Create backup
echo "Creating backup of $DB_NAME to $BACKUP_FILE"
pg_dump -h localhost -U $DB_USER -d $DB_NAME -F p > $BACKUP_FILE

# Verify backup
if [ $? -eq 0 ]; then
    echo "Backup completed successfully"
    echo "Backup file: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
    exit 1
fi
