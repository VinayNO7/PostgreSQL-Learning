--Creating Table
CREATE TABLE students (
    id INT,
    name VARCHAR(100),
    marks INT
);

--Inserting data into the table
INSERT INTO students (id, name, marks)
VALUES (101, 'Vinay', 95);

--Reading a table 
SELECT * FROM students; --reads whole table

SELECT name FROM students; --reads name column from the table

SELECT name,marks FROM students; --reads two or more columns at once

SELECT * FROM students
WHERE id=101; --reads a specific row with condition 

SELECT * FROM students
WHERE marks>75; --reads rows with condition

--Updating a table
UPDATE students
SET marks = 98
WHERE id = 101; --updates the row with condition

--Deleting a table or a row
DELETE FROM students
WHERE id = 101; --deletes the row with given condition

DELETE FROM students
WHERE marks < 35; --deletes multiple rows with condition

--Nulcear Mistake
DELETE FROM students; --deletes the whole table cannot undo it
--Alternative
DROP TABLE students;

--Useful Queries(SQL shell)
\dt --show all tables
\d students --describe table
