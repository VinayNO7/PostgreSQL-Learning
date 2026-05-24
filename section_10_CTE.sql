--CTE (COMMON TABLE EXPRESSION) USAGE
WITH avg_sal AS (
SELECT dept,AVG(salary) AS avg_salary FROM employees GROUP BY dept
)

SELECT 
	e.emp_id,e.fname,e.dept,e.salary,a.avg_salary
FROM employees e
JOIN 
	avg_sal a ON e.dept=a.dept
WHERE 
	e.salary = a.avg_salary;
    

WITH max_sal AS (
SELECT dept,MAX(salary) AS max_salary FROM employees GROUP BY dept
)

SELECT 
	e.emp_id,e.fname,e.dept,e.salary,m.max_salary
FROM employees e
JOIN 
	max_sal m ON e.dept=m.dept
WHERE 
	e.salary = m.max_salary;

--TRIGGERS
CREATE TRIGGER trigger_name
{ BEFORE | AFTER | INSTEAD OF } { INSERT | UPDATE | DELETE | TRUNCATE }
ON table_name
FOR EACH { ROW | STATEMENT }
EXECUTE FUNCTION trigger_function_name();

CREATE OR REPLACE FUNCTION trigger_function_name ()
RETURNS TRIGGER AS $$
BEGIN
-- Trigger logic here
    RETURN NEW;
END ;
$$ LANGUAGE plpgsql;