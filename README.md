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


## Backup System

### Manual Backup
\bash
./scripts/backups/pg_backup.sh

### Manual Restore
\bash
./scripts/backups/pg_restore.sh

### Automated Backups
- Configured via cron to run daily at 6 pm every friday
- Logs to scripts/backups/backup.log

## Database Monitoring

### Monitoring Features:
- Connection health check
- Table size tracking
- Database size tracking
- Active connections

### Files:
- basic_monitor.py: Collects and logs metrics
- run_monitor.sh: script to run basic_monitor.py

### Usage:
\bash
./python/monitoring/run_monitor.sh
