-- PSQL CLI Commands
\list 
\! cls --To clear the screen in sql shell or psql

--DATABASE(SQL shell and PGAdmin4)
CREATE DATABASE db_name; --Creates the database

SELECT datname FROM pg_database; --Listing or existing databases 
--OR
\l -- shortcut to list the databases

\c db_name --to change from one database to another

DROP DATABASE db_name; --Deletes the database(to delete a database you have to be in other database)