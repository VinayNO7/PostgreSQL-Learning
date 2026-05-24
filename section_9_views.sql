--CREATES A VIEW 
--even after the select query has been deleted the one query will return the table

CREATE VIEW enrollement_info AS
SELECT s.name AS student_name, c.name AS course_name, e.enrollment_date, c.fee FROM enrollment e
JOIN students s ON e.s_id=s.s_id
JOIN courses c ON c.c_id=e.c_id;

SELECT * FROM enrollement_info; --this one line returns everything. and this doesn't store the whole data ,
--its just storing the whole query.

 \dv --in sql shell this is used to describe the view table

SELECT * FROM enrollement_info;

--Whenever you use group by do not use WHERE CLAUSE use HAVING CLAUSE
SELECT student_name,COUNT(course_name) FROM enrollement_info
		GROUP BY student_name;

SELECT student_name,COUNT(course_name) FROM enrollement_info
		GROUP BY student_name
		HAVING COUNT(course_name) > 1;--HAVING CLAUSE

--##GROUP ROLL-UP & COALESCE
--COALESCE - used to change or name the total column
--ROLL-UP - used to calculate or rollup the total of any numeric column
SELECT 
	COALESCE(student_name,'TOTAL'),SUM(fee) AS fees FROM enrollement_info
		GROUP BY ROLLUP(student_name)
		ORDER BY fees
;

----STORED PROCEDURE(Its like a function we use to call to execute a query)
--FOR UPDATE 
CREATE OR REPLACE PROCEDURE update_emp_salary(
	p_employee_id INT,
	p_new_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE employees
	SET salary = p_new_salary
	WHERE emp_id = p_employee_id;
END;
$$;

CALL update_emp_salary(3,71000);

SELECT * FROM employees ORDER BY emp_id;

--FOR INSERT
CREATE OR REPLACE PROCEDURE insert_emp(
	p_fname VARCHAR,
	p_lname VARCHAR,
	p_email VARCHAR,
	p_dept VARCHAR,
	p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO employees(fname,lname,email,dept,salary)
	VALUES(p_fname,p_lname,p_email,p_dept,p_salary);
END;
$$;

CALL insert_emp('Vinay','Olekar','vinay.86532823@gmail.com','CEO',500000);

--##USER DEFINED FUNCTIONS
CREATE OR REPLACE FUNCTION max_salary(dept_name VARCHAR)
RETURNS TABLE(emp_id INT,fname VARCHAR,salary NUMERIC)
AS $$
BEGIN
	RETURN QUERY
	SELECT 
		e.emp_id,e.fname,e.salary
	FROM
		employees e
	WHERE 
		e.dept=dept_name
		AND e.salary=(
			SELECT MAX(emp.salary)
			FROM employees emp
			WHERE emp.dept=dept_name
		);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM max_salary('IT');

--WINDOW FUNCTIONS - OVER()
SELECT fname,salary,
	SUM(salary) OVER(ORDER BY salary)
	FROM employees;

SELECT fname,salary,
	AVG(salary) OVER(ORDER BY salary)
	FROM employees;

--1.ROW_NUMBER
SELECT
	ROW_NUMBER() OVER(ORDER BY fname),
	fname,salary
	FROM employees;

SELECT
	ROW_NUMBER() OVER(PARTITION BY dept),
	fname,dept,salary
	FROM employees;

--2.RANK()
SELECT
	fname,salary,
	RANK() OVER(ORDER BY salary DESC)
	FROM employees;

--3.DENSE_RANK()
SELECT
	fname,salary,
	DENSE_RANK() OVER(ORDER BY salary DESC)
	FROM employees; --prevents duplicate ranking when two got same rank next one should go order wise

--4.LAG()
SELECT
	fname,salary,
	LAG(salary) OVER()
	FROM employees;

--5.LEAD()
SELECT
	fname,salary,
	LEAD(salary) OVER()
	FROM employees;

--USE CASE(SALARY DIFFERENCE)
SELECT
	fname,salary,
	salary - LEAD(salary) OVER(ORDER BY salary DESC) 
	AS sal_diff
	FROM employees;