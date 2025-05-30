CREATE database employees;
USE employees;

CREATE TABLE employee_info(
	employee_id INT auto_increment primary key, -- auto increment used here
    name varchar(50),
    email varchar(50)
);

INSERT INTO employee_info(name,email) VALUES('mary','mary@gmail.com');

SELECT * FROM employee_info;

ALTER TABLE employee_info auto_increment=1000; --custom start point

SET @@auto_increment_increment = 2; -- set increment step value