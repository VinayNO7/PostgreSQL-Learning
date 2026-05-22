--ALTER QUERY
--1.ADD COLUMN
SELECT * FROM person;

ALTER TABLE PERSON
DROP COLUMN age INT; --adds column age to the person table

ALTER TABLE PERSON
ADD COLUMN age INT DEFAULT 0; --adds columns and sets all values to 0 default

ALTER TABLE PERSON
DROP COLUMN age; --deletes the column only not table

--2.RENAME A COLUMN OR TABLE
ALTER TABLE person --renames column name 
RENAME COLUMN name to full_name;

ALTER TABLE person
RENAME TO contact_details; --renames table name

RENAME TABLE person TO contact_details; --alternative to rename a table for MySQL

--3.ALTER/MODIFY COLUMN ITEMS
--MODIFYING DATA TYPE SIZE
ALTER TABLE person
ALTER COLUMN full_name
SET DATA TYPE VARCHAR(150);

--SETTING DEFAULT
ALTER TABLE person
ALTER COLUMN full_name
SET DEFAULT 'unknown';

--SETTING NOT NULL AND DEFAULT
ALTER TABLE person
ALTER COLUMN full_name
SET DEFAULT NOT NULL;

--DROPING DEFAULT FROM COLUMN
ALTER TABLE person
ALTER COLUMN full_name
DROP DEFAULT;

--4.CHECK CONSTRAINT
ALTER TABLE person
ADD COLUMN 
mob VARCHAR(15) CHECK(LENGTH(mob)>=10); --check constraint applied on mob column

INSERT INTO person(mob)
VALUES(1234567890);

ALTER TABLE person
DROP CONSTRAINT person_mob_check;--deletes the current constraint

ALTER TABLE person
ADD CONSTRAINT mob_no_less_than_10
		CHECK(LENGTH(mob)>=10); --this adds the constraints that we give(very helpful for logging)

--5.CASE (LIKE IF ELSE)
SELECT fname,salary,
CASE 
	WHEN salary >= 50000 THEN 'HIGH SALARY'
ELSE
	'LOW SALARY'
END AS salary_category
FROM employees; --it actually creates a new column and sets the column item as per the condition

--MULTIPLE CASES
SELECT fname,salary,
CASE 
	WHEN salary >= 50000 THEN 'HIGH SALARY'
    --WHEN salary >=45000 AND salary < 50000 THEN 'MID'
    WHEN salary BETWEEN 45000 AND 50000 THEN 'MID' 
ELSE
	'LOW SALARY'
END AS salary_category
FROM employees;

--SIMPLE TASK 
SELECT fname,salary,
CASE 
	WHEN salary > 0 THEN Round(salary * 0.10)
END AS bonus
FROM employees;--creating bonus column 

--ANOTHER TASK
SELECT 
CASE 
	WHEN salary >= 50000 THEN 'HIGH SALARY'
	WHEN salary BETWEEN 48000 AND 50000 THEN 'MID'
ELSE
	'LOW SALARY'
END AS salary_category,COUNT(emp_id)
FROM employees GROUP BY salary_category;-- creating sal_cat column and grouping them by emp_id