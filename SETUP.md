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

4. Updated pg_hba.conf:
   \bash
   sudo nano /etc/postgresql/*/main/pg_hba.conf
   host    dba_project    admin    127.0.0.1/32    md5

5. Added ~/.pgpass:
   #No password needed! psql reads it from .pgpass
   \bash
   echo "localhost:5432:dba_project:admin:password" >> ~/.pgpass
   chmod 600 ~/.pgpass  # Critical! Restrict permissions.
