-- full code to construct example db

CREATE DATABASE customers;
USE customers;

-- 1. Create the table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    zip_code VARCHAR(10),
    email VARCHAR(100)
);

-- 2. Insert 10 rows into the table
INSERT INTO customers (customer_id, first_name, last_name, address, city, state, zip_code, email) VALUES
(1, 'Windham', 'McKevitt', '73 Namekagon Park', 'Washington', 'DC', '20525', 'wmckevitt0@example.com'),
(2, 'Wallis', 'Breawood', '91869 Dexter Parkway', 'Pomona', 'CA', '91797', 'wbreawood1@nhs.uk'),
(3, 'Valerie', 'Merkel', '35 Longview Alley', 'Bonita Springs', 'FL', '34135', 'vmerkel2@123-reg.co.uk'),
(4, 'Brigid', 'Southwood', '568 Kropf Parkway', 'Indianapolis', 'IN', '46216', 'bsouthwood3@privacy.gov.au'),
(5, 'Tucker', 'Du Pre', '521 Bonner Park', 'Miami', 'FL', '33175', 'tdupre4@thetimes.co.uk'),
(6, 'Tabbie', 'Maxwaile', '3824 Sunnyside Pass', 'Pittsburgh', 'PA', '15261', 'tmaxwaile5@joomla.org'),
(7, 'Graham', 'Turner', '84 Lincoln Court', 'Austin', 'TX', '73301', 'gturner6@outlook.com'),
(8, 'Elaine', 'Yardley', '19 Garden Hill', 'Denver', 'CO', '80201', 'eyardley7@protonmail.com'),
(9, 'Lukas', 'Bennett', '99 Ridgeview Lane', 'Phoenix', 'AZ', '85001', 'lbennett8@gmail.com'),
(10, 'Nora', 'Quinn', '230 Elm Street', 'Seattle', 'WA', '98101', 'nquinn9@yahoo.com');

-- 1. Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Additional orders using all 10 customers
INSERT INTO orders (order_id, order_date, amount, customer_id) VALUES
(35, '2020-07-15', 129.99, 5),
(36, '2020-07-15', 349.49, 6),
(37, '2020-07-17', 45.00, 7),
(38, '2020-07-17', 267.88, 8),
(39, '2020-07-18', 312.65, 9),
(40, '2020-07-18', 75.25, 10),
(41, '2020-07-19', 145.67, 1),
(42, '2020-07-20', 99.99, 2),
(43, '2020-07-20', 53.10, 5),
(44, '2020-07-21', 189.95, 6);

-- Example for joins start beyond here
--You can visualize all joins using venn diagram, where each cirles represent a table


--INNER JOIN - (the intersection part only in venn diagram of two circles)
-- customer_id is common in both tables, so we can use inner join on that
--we can see only the customers who made orders and its details

SELECT first_name,last_name,order_date,amount
FROM customers c    -- giving an object c for reference
INNER JOIN orders o -- o object
ON c.customer_id = o.customer_id -- accessing column using objects
ORDER BY order_date;

--OUTER JOINS, has 3 types-> LEFT, RIGHT, FULL

--LEFT JOIN (the full left circle part)
-- this will display all of customers table and only the matching values of the orders table
-- That means, if any customer didnt place order, they will also be displayed, with order details as null

SELECT first_name,last_name,order_date,amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY order_date;

--RIGHT JOIN (the full right circle part) (vice versa of LEFT JOIN)
-- this will display all of orders table and only the matching values of the customers table
-- might not be useful in current example since there will be no orders without any customers

SELECT first_name,last_name,order_date,amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY order_date;

--FULL OUTER JOIN - (every part of all the cicles)
-- this will display all the values from all the tables, even if its null
-- NOTE: full outer join is not present in MySQL


