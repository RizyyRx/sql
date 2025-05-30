-- DATA DEFINITION LANGUAGE (DDL)

CREATE DATABASE college; -- creates new database
USE college; -- use that db after creating


-- syntax -> (name, datatype, any keys, rules-not null)
CREATE TABLE student (
	roll_no INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    cgpa DECIMAL (3,2) -- 3 → Total number of digits (called precision), 2 → Number of digits after the decimal point (called scale)
);

describe student; -- will display the table visually

DROP table student; -- Deletes entire table

DROP database college; -- Deletes entire db

-- ALTER allows you to modify the structure of an existing table in many ways.

--add a column
ALTER TABLE student
ADD email varchar(100);

-- delete a column
ALTER TABLE student
DROP COLUMN email;

--rename a column
ALTER TABLE student
RENAME COLUMN name TO full_name;

-- Modify a column's datatype or size
ALTER TABLE student
MODIFY COLUMN name VARCHAR(50);

-- Add a NOT NULL constraint
ALTER TABLE student
MODIFY COLUMN email VARCHAR(100) NOT NULL;

-- Add a default value
ALTER TABLE student
ALTER COLUMN cgpa SET DEFAULT 0.00;

-- Drop default value
ALTER TABLE student
ALTER COLUMN cgpa DROP DEFAULT;

--  Add a primary key (if not already present)
ALTER TABLE student
ADD PRIMARY KEY (roll_no);

--To remove a primary key constraint from a column, 
-- you need to drop the primary key constraint, not just modify the column
ALTER TABLE table_name DROP PRIMARY KEY;


-- Rename table
RENAME TABLE student TO students;

-- Add a foreign key
ALTER TABLE student
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id) REFERENCES department(id);


-- Inserting values into a table
INSERT INTO student (roll_no,name,cgpa) VALUES(02,'hardy',7.94);

--will display as per query
SELECT * FROM student

-- truncate will delete all contents inside the table, but not the table itself
TRUNCATE TABLE student;

