CREATE USER app_user WITH password 'app_user';
CREATE DATABASE app_database;
GRANT ALL privileges ON DATABASE app_database TO app_user;

\c app_database