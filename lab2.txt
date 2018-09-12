CREATE DATABASE lab2;

CREATE TABLE countries (
country_id SERIAL CONSTRAINT countries_pkey PRIMARY KEY,
country_name VARCHAR(50),
region_id INT,
population INT
);

INSERT INTO countries (country_name, region_id, population) VALUES ('Kazakhstan', 1, 17000);

INSERT INTO countries (country_id, country_name) VALUES (7, 'Russia');

INSERT INTO countries (region_id) VALUES (NULL);

INSERT INTO countries (country_name, region_id, population) VALUES
('France', 2, 17017000),('China', 4, 71000000), ('USA', 3, 71071000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name, region_id, population) VALUES (DEFAULT, 11, 12000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING CONSTRAINTS);

INSERT INTO countries_new (SELECT * FROM countries);

UPDATE countries_new
SET region_id = 1
WHERE region_id ISNULL;

UPDATE countries_new
SET population = population * 1.1
RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population < 100000
RETURNING *;

DELETE FROM countries_new WHERE country_id = (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;



SELECT * FROM countries;
SELECT * FROM countries_new;

DROP DATABASE lab2;
DROP TABLE countries;
DROP TABLE countries_new;