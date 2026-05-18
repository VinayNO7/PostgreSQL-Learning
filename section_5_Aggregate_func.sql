--Aggregate Functions

SELECT * FROM employees;
 emp_id | fname  | lname  |          email           |   dept    |  salary  | hire_date
--------+--------+--------+--------------------------+-----------+----------+------------
      1 | Raj    | Sharma | raj.sharma@example.com   | IT        | 50000.00 | 2020-01-15
      2 | Priya  | Singh  | priya.singh@example.com  | HR        | 45000.00 | 2019-03-22
      3 | Arjun  | Verma  | arjun.verma@example.com  | IT        | 55000.00 | 2021-06-01
      4 | Suman  | Patel  | suman.patel@example.com  | Finance   | 60000.00 | 2018-07-30
      5 | Kavit  | Rao    | kavita.rao@example.com   | HR        | 47000.00 | 2020-11-10
      6 | Amit   | Gupta  | amit.gupta@example.com   | Marketing | 52000.00 | 2020-09-25
      7 | Neha   | Desai  | neha.desai@example.com   | IT        | 48000.00 | 2019-05-18
      8 | Rahul  | Kumar  | rahul.kumar@example.com  | IT        | 53000.00 | 2021-02-14
      9 | Anjali | Mehta  | anjali.mehta@example.com | Finance   | 61000.00 | 2018-12-03
     10 | Vijay  | Nair   | vijay.nair@example.com   | Marketing | 50000.00 | 2020-04-19

--Assume this is a table to perform these actions
--1.COUNT()
SELECT COUNT(emp_id) from employees; --gives count of rows or id's(10)
SELECT COUNT(fname) from employees;

--2.SUM()
SELECT SUM(salary) from employees;--gives sum of salary(521000.00)

--3.AVG()
SELECT AVG(salary) from employees;--gives average of salary(52100.000000000000)

--4.MIN()
SELECT MIN(salary) from employees;--gives minimum of salary(45000.00)

--5.MAX()
SELECT MAX(salary) from employees;--gives maximum of salary(61000.00)


--##GROUP BY ------------------------
SELECT dept FROM employees GROUP BY dept; --makes group by dept
   dept
-----------
 Marketing
 Finance
 IT
 HR

SELECT dept,COUNT(emp_id) FROM employees GROUP BY dept;
   dept    | count
-----------+-------
 Marketing |     2
 Finance   |     2
 IT        |     4
 HR        |     2

SELECT dept,SUM(salary) FROM employees GROUP BY dept;
   dept    |    sum
-----------+-----------
 Marketing | 102000.00
 Finance   | 121000.00
 IT        | 206000.00
 HR        |  92000.00