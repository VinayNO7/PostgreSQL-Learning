--STRING FUNCTIONS
--1.CONCAT & CONCAT_WS
SELECT CONCAT('Hello','World');
SELECT CONCAT(fname,lname) FROM employees;
SELECT CONCAT(fname,lname) AS Fullname FROM employees;
SELECT emp_id,dept,CONCAT(fname,lname) AS Fullname FROM employees;
SELECT emp_id,dept,CONCAT(fname,' ',lname) AS Fullname FROM employees;

SELECT CONCAT_WS(':','ONE','TWO','THREE');
SELECT emp_id,dept,CONCAT_WS(' ',fname,lname) AS Fullname FROM employees;
SELECT emp_id,dept,CONCAT_WS(' ',fname,lname,salary) AS Fullname FROM employees;

--2.SUBSTR/SUBSTRING
SELECT SUBSTR('HELLO BUDDY',1,6);
SELECT SUBSTR('HELLO BUDDY',7,12);

--3.REPLACE
SELECT REPLACE('HELLO BUDDY!','HELLO','HEY');
SELECT REPLACE(dept,'IT','TECH') FROM employees;

--4.REVERSE
SELECT REVERSE('HELLO');
SELECT REVERSE(fname) FROM employees;

--5.LENGTH
SELECT LENGTH('HELLO');
SELECT LENGTH(fname) FROM  employees;
 SELECT * FROM employees WHERE LENGTH(fname) > 5;

--6.UPPER & LOWER
SELECT UPPER(fname) from employees;
SELECT LOWER(fname) from employees;

--7.LEFT & RIGHT
SELECT LEFT('HELLO WORLD',4);
SELECT RIGHT('HELLO WORLD',4);

--8.TRIM
SELECT TRIM('  ALRIGHT  ');
SELECT LENGTH(TRIM('  ALRIGHT  '));

--9.POSITION
SELECT POSITION('GH' in 'ALRIGHT');