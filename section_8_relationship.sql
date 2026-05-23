--Understanding Relationships and foreign key
--to maintain relation between two or more tables

--Creating two tables in a same database
--ONE TO MANY RELATION--------------------

CREATE TABLE customers (
	cust_id SERIAL PRIMARY KEY,
	cust_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
		ord_id SERIAL PRIMARY KEY,
		ord_date DATE NOT NULL,
		price NUMERIC NOT NULL,
		cust_id INTEGER NOT NULL,
		FOREIGN KEY (cust_id) REFERENCES
		customers(cust_id)
);

--Inserting data into the two tables
INSERT INTO customers (cust_name)
VALUES 
('Raju'), ('Sham'), ('Paul'), ('Alex');

INSERT INTO orders (ord_date, cust_id, price)
VALUES 
('2024-01-01', 1, 250.00),  
('2024-01-15', 1, 300.00),  
('2024-02-01', 2, 150.00),
('2024-03-01', 3, 450.00),
('2024-04-04', 2, 550.00);

--Now both the columns are related, it is done by using Foreign key

--1.CROSS JOIN
SELECT * FROM customers CROSS JOIN orders;

--2.INNER JOIN
SELECT * FROM customers c
INNER JOIN
orders o
ON c.cust_id=o.cust_id;

--INNER JOIN USING GROUP BY
SELECT c.cust_name,COUNT(o.ord_id),SUM(o.price) FROM customers c
INNER JOIN
orders o
ON c.cust_id=o.cust_id
GROUP BY cust_name;

--3.LEFT JOIN
SELECT * FROM customers c
LEFT JOIN
orders o
ON c.cust_id=o.cust_id;

--4.RIGHT JOIN
SELECT * FROM customers c
RIGHT JOIN
orders o
ON c.cust_id=o.cust_id;

SELECT * FROM orders o
RIGHT JOIN
customers c
ON c.cust_id=o.cust_id; --by varying the tables left one to right and vice versa

--MANY TO MANY RELATION
CREATE TABLE students (
    s_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    c_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    fee NUMERIC NOT NULL
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    s_id INT NOT NULL,
    c_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (s_id) REFERENCES students(s_id),
    FOREIGN KEY (c_id) REFERENCES courses(c_id)
);

INSERT INTO Students (name) VALUES
('Raju'),
('Sham'),
('Alex');

INSERT INTO courses (name, fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);

INSERT INTO enrollment (s_id, c_id, enrollment_date)
VALUES
(1, 1, '2024-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2024-01-15'), -- Raju enrolled in Physics
(2, 1, '2024-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2024-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2024-03-25'); -- Alex enrolled in Chemistry

SELECT s.name, c.name, e.enrollment_date, c.fee FROM enrollment e
JOIN students s ON e.s_id=s.s_id
JOIN courses c ON c.c_id=e.c_id;

