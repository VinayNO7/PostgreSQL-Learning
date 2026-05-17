--CREATING A SIMPLE TABLE AND DOING 'CRUD' OPERATIONS

--Creating a table Employees
CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	dept VARCHAR(50),
	salary DECIMAL(10,2) DEFAULT 30000.00,
	hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

--Inserting data into the table
INSERT INTO employees (fname, lname, email, dept, salary, hire_date) 
VALUES
('Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
('Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
('Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
('Kavit', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
('Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
('Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
('Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
('Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');

--Reading the whole table
SELECT * FROM employees;

--Updating the table
UPDATE employees
SET salary=50000
WHERE id=7;

--Deleting a table 
DROP TABLE  employees;