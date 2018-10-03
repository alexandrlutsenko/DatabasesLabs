CREATE DATABASE lab5;

CREATE TABLE customers(
  customer_id INT,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INT,
  salesman_id INT
);

INSERT INTO customers VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

SELECT * FROM customers WHERE grade > 100;

SELECT * FROM customers WHERE city = 'New York' AND grade > 100;

SELECT * FROM customers WHERE city = 'New York' OR grade > 100;

SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';

SELECT * FROM customers WHERE customers.cust_name LIKE 'B%';

CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  description VARCHAR(50),
  purch_amt INT
);

SELECT * FROM orders WHERE customer_id =
(SELECT customer_id FROM customers WHERE city = 'New York');

SELECT * FROM customers WHERE customer_id =
(SELECT customer_id FROM orders WHERE purch_amt > 10);

SELECT sum(purch_amt) FROM orders;

SELECT avg(purch_amt) FROM orders;

SELECT * FROM customers WHERE cust_name IS NOT NULL;

SELECT max(purch_amt) FROM orders;

