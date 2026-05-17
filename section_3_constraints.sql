--PostgreSQL constraints and column keywords

--1.PRIMARY KEY - Unique and Not NULL automatically
id INT PRIMARY KEY --syntax
--example:
CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    marks INT
);

--2.SERIAL - Auto-Incrementing
id SERIAL PRIMARY KEY --syntax
--example:
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    marks INT
);
INSERT INTO students(name, marks)
VALUES('Vinay', 95);--Now when inserting No need to give id.

--3.NOT NULL - Column cannot be empty
name VARCHAR(50) NOT NULL --syntax
--example:
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    marks INT
);

--4.UNIQUE - No duplicates allowed
email VARCHAR(100) UNIQUE --syntax
--example:
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);--Two same emails cannot exist

--5.DEFAULT - gives default value if user don't provide
marks INT DEFAULT 0 --syntax
--example:
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    marks INT DEFAULT 0 --default marks will be 0
);

--Combined Example
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    marks INT DEFAULT 0
);
