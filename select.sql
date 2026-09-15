DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE customers
(
    id         SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name  TEXT,
    age        INT,
    country    TEXT
);

INSERT INTO customers (first_name, last_name, age, country)
VALUES ('Ivan', 'Petrov', 25, 'Russia'),
       ('Olga', 'Sidorova', 18, 'Russia'),
       ('Anna', 'Smirnova', 18, 'Belarus'),
       ('John', 'Smith', 35, 'USA');

SELECT *
FROM customers
WHERE age = (SELECT MIN(age) FROM customers);

CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    amount      INT,
    customer_id INT REFERENCES customers(id)
);

INSERT INTO orders (amount, customer_id)
VALUES (1500, 1),
       (2300, 1),
       (5000, 4);

SELECT *
FROM customers
WHERE id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE customer_id IS NOT NULL
);