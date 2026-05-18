CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50)
);
--Assuming the above as a table

--1.WHERE CLAUSE--------------------------
SELECT *  FROM employees
WHERE department = 'IT'; --Basic WHERE

SELECT * FROM employees
WHERE salary > 50000; --WHERE with numbers
--OTHER OPERATIONS
WHERE salary < 50000
WHERE salary >= 60000
WHERE salary <= 45000
WHERE salary != 30000

--Using AND and OR Operators
SELECT * FROM employees
WHERE department = 'IT' AND salary > 50000;

SELECT * FROM employees
WHERE department = 'HR' OR department = 'Finance';

--Using IN and NOT IN
SELECT * FROM employees
WHERE dept IN ('IT','HR');

SELECT * FROM employees
WHERE dept NOT IN ('IT','Finance');

--BETWEEEN 
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;

--2.DISTINCT-----------------------
SELECT DISTINCT dept FROM employees;
   dept
-----------
 Marketing
 Finance
 IT
 HR

 --3.ORDER BY----------------------
 SELECT * FROM employees ORDER BY fname; --Sorts the column 
 SELECT * FROM employees ORDER BY fname desc; --sorts in descending order
 SELECT * FROM employees ORDER BY emp_id desc;

 --4.LIMIT-------------------------
  SELECT * FROM employees LIMIT 3; --it only gives the number of rows we mention

  --5.LIKE-------------------------
SELECT * FROM employees WHERE fname LIKE 'A%'; --name starting with A
SELECT * FROM employees WHERE fname LIKE '%a'; --name ending with a
SELECT * FROM employees WHERE fname LIKE '%i%'; --name contains i somewhere in the middle
SELECT * FROM employees WHERE dept LIKE '__'; --dept with two any letters
SELECT * FROM employees WHERE fname LIKE '_a%'; --name with second letter as a