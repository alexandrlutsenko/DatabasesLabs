CREATE DATABASE LAB6;

CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY ,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY ,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  department_id INTEGER REFERENCES departments
);

DROP TABLE employees;
DROP TABLE departments;
DROP TABLE locations;


SELECT E.first_name, E.last_name, E.department_id, D.department_name FROM employees E JOIN departments D ON E.department_id = D.department_id;

SELECT E.first_name, E.last_name, E.department_id, D.department_name FROM employees E JOIN departments D ON E.department_id = D.department_id AND E.department_id IN (80,40);

SELECT E.first_name,E.last_name,
   D.department_name, L.city, L.state_province
     FROM employees E
      JOIN departments D
        ON E.department_id = D.department_id
          JOIN locations L
           ON D.location_id = L.location_id;

SELECT E.first_name, E.last_name, D.department_id, D.department_name
 FROM employees E
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;

SELECT E.first_name, E.last_name, E.department_id, D.department_name
  FROM employees E
   LEFT OUTER JOIN departments D
     ON E.department_id = D.department_id;