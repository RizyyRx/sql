--DATA MANIPULATION LANGUAGE

USE college;

INSERT INTO student (roll_no, name, cgpa, city) VALUES
(101, 'Alice', 8.45, 'New York'),
(102, 'Bob', 7.90, 'Los Angeles'),
(103, 'Charlie', 7.86, 'Chicago'),
(104, 'Diana', 9.10, 'New York'),
(105, 'Ethan', 6.75, 'Houston');

SELECT DISTINCT(city) FROM student; -- will not show duplicate entries, only unique from city

-- Added fees column with values
ALTER TABLE student ADD COLUMN fees int;

-- update, not insert, since rows already present
UPDATE student SET fees=8500 WHERE roll_no=101;
UPDATE student SET fees=8000 WHERE roll_no=102;
UPDATE student SET fees=7500 WHERE roll_no=103;
UPDATE student SET fees=8570 WHERE roll_no=104;
UPDATE student SET fees=9000 WHERE roll_no=105;

-- select is used like this also, AS will display a new column with new column name you've given
SELECT *,(fees+2000) AS pending_updated_fees FROM student;

--if u are going to enter values for all columns, use this syntax. If u leave a value for a column, this method will throw error
INSERT INTO student VALUES(106,'Tommy',8.43,'Brimingham',9500);

--since idk Jimmy's city, we have to use typecasting and mention what is the name of the values we are inserting
INSERT INTO student (roll_no,name,cgpa,fees) VALUES(107,'Jimmy',8.73,8780);

--update Jimmy's city
UPDATE student SET city='chennai' WHERE roll_no='107';

--new column
ALTER TABLE student ADD COLUMN college_name varchar(20);

-- this will update all rows and set the same value for all rows
UPDATE student SET college_name='Bullworth Academy';

--delete Jimmy's row
DELETE FROM student WHERE name='Jimmy';

--CLAUSE statements

-- ORDER BY will display columns in ascending order
SELECT name,city,fees FROM student ORDER BY fees;

-- for descending, use DESC
SELECT name,city,fees FROM student ORDER BY fees DESC;

-- we can also use column number instead of its name (column 3 is cgpa)
SELECT name,city,cgpa FROM student ORDER BY 3;

--Aggregation and GROUP BY
-- An aggregate function performs a calculation on a set of values and returns a single summary value
-- Exa: SUM(),AVG(),COUNT(),MAX(),MIN()	
-- GROUP BY organizes rows into groups based on one or more columns so that aggregate functions (like SUM, COUNT, etc.) can be applied to each group separately.
-- below cmd will sum the fees based on city and displays city with total_fees

SELECT city, SUM(fees) AS total_fees FROM student GROUP BY city;

--WHERE clause, filter using conditions

SELECT * FROM student WHERE city = "Birmingham";

-- operators like =, !=, >, <, >=, <= can also be used

SELECT * FROM student WHERE fees > 8000;

-- AND, OR, NOT is also used

SELECT * FROM student WHERE fees > 8000 AND city = "Birmingham";
SELECT * FROM student WHERE fees > 8000 OR city = "Birmingham";
SELECT * FROM student WHERE NOT city = "Birmingham";

-- LIKE used to filter using 1st character, not case sensitive

SELECT * FROM student WHERE city LIKE 'B%';

--BETWEEN used to find within a range

SELECT * FROM student WHERE fees BETWEEN 8500 AND 9000;

--IN, filter using multiple values in a column

SELECT * FROM student WHERE city IN ('New York','Birmingham');

-- Some Aggregate functions
-- this will display the count value, it will not consider null values
SELECT COUNT(name) FROM student;

--UCASE and LCASE can be used to display as per the cases we want
-- this will display all city names as lowercase
SELECT LCASE(city) FROM student;

-- using MID, we can partition values using range and display them
-- this will display only first 9 chars of college name
SELECT MID(college_name,1,9) AS college_first_name FROM student;

-- round off values, the number 1 decides how many decimal values to show
SELECT ROUND(cgpa,1) AS rounded_cgpa FROM student WHERE name='Charlie';

-- will display current time and date
SELECT NOW();

-- GROUP BY clause

SELECT city, COUNT(*) AS city_count FROM student GROUP BY city;

-- HAVING is used to filter based on aggregate values
--Diff btn WHERE and HAVING? -> 
--WHERE, used to filter rows before grouping, HAVING, used to filter groups after grouping
SELECT city, COUNT(*) AS city_count FROM student GROUP BY city HAVING COUNT(*)>=2;

--A complex query using multiple clauses
-- will show the average fees > 9000 by city groups, where cgpa is > 8
-- WHERE used to filter row before grouping, HAVING used to filter groups after grouping
SELECT city, AVG(fees) as avg_fees 
FROM student 
WHERE cgpa>8.00 
GROUP BY city 
HAVING avg_fees > 9000;

/*
LIST of funtions and their definitions

STRING FUNCTIONS:

    UPPER(str) – Converts text to uppercase.
    LOWER(str) – Converts text to lowercase.
    LENGTH(str) – Returns the number of characters in a string.
    SUBSTRING(str, start, length) – Extracts part of a string.
    CONCAT(str1, str2, ...) – Joins multiple strings into one.
    TRIM(str) – Removes spaces from both ends of a string.
    REPLACE(str, from, to) – Replaces part of a string with something else.

Numeric Functions:

    ABS(x) – Returns the absolute (positive) value of a number.
    ROUND(x, d) – Rounds a number to d decimal places.
    FLOOR(x) – Rounds down to the nearest whole number.
    CEIL(x) / CEILING(x) – Rounds up to the nearest whole number.
    MOD(x, y) – Returns the remainder of x ÷ y.

Date and Time Functions:

    NOW() – Returns the current date and time.
    CURDATE() – Returns the current date only.
    CURTIME() – Returns the current time only.
    DATEDIFF(d1, d2) – Returns the number of days between two dates.
    DATE_ADD(date, INTERVAL n unit) – Adds time to a date.
    DATE_SUB(date, INTERVAL n unit) – Subtracts time from a date.
    YEAR(date), MONTH(date), DAY(date) – Extracts parts of a date.

Aggregate Functions:

    COUNT(column) – Counts the number of non-null values.
    SUM(column) – Adds up all values in a column.
    AVG(column) – Calculates the average of values.
    MAX(column) – Returns the highest value.
    MIN(column) – Returns the lowest value.
*/