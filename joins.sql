-- JOIN lets us to access two or more tables as display as per our needs


--INNER JOIN, returns only the rows where the values of the joined columns match in both tables.
-- To use INNER JOIN, we should have a similar column in both tables, like roll_no in below example.

SELECT student.name, department.id AS department_ID, department.name
FROM student
INNER JOIN department
ON student.roll_no = department.student_roll_no;