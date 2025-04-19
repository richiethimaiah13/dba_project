 Postgres Setup on Server
1. Installed PostgreSQL:
   \bash
   sudo apt install postgresql postgresql-contrib -y

2. Created database user:
   \sql
   CREATE USER admin WITH PASSWORD 'password';

3. Created database:
   \sql
   CREATE DATABASE dba_project;
   GRANT ALL PRIVILEGES ON DATABASE dba_project TO admin;
   GRANT ALL PRIVILEGES ON SCHEMA public TO admin;
   GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

4. Updated pg-_hba.conf:
   \bash
   sudo nano /etc/postgresql/*/main/pg_hba.conf
   host    dba_project    admin    127.0.0.1/32    md5

