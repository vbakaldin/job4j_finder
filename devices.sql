CREATE TABLE devices
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(255),
    price FLOAT
);

CREATE TABLE people
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE devices_people
(
    id        SERIAL PRIMARY KEY,
    device_id INT REFERENCES devices(id),
    people_id INT REFERENCES people(id)
);

INSERT INTO devices (name, price)
VALUES
    ('Laptop', 70000),
    ('Phone', 30000),
    ('Keyboard', 3000),
    ('Mouse', 1500),
    ('Monitor', 25000);

INSERT INTO people (name)
VALUES
    ('Petr'),
    ('Anna'),
    ('Ivan');

INSERT INTO devices_people (device_id, people_id)
VALUES
    (1, 1),
    (3, 1),
    (3, 2),
    (4, 2),
    (2, 3),
    (5, 3);

SELECT AVG(d.price) AS average_price
FROM devices AS d;

SELECT p.name, AVG(d.price) AS average_price
FROM people AS p
INNER JOIN devices_people AS dp ON p.id = dp.people_id
INNER JOIN devices AS d ON dp.device_id = d.id
GROUP BY p.id, p.name;

SELECT p.name, AVG(d.price) AS average_price
FROM people AS p
INNER JOIN devices_people AS dp ON p.id = dp.people_id
INNER JOIN devices AS d ON dp.device_id = d.id
GROUP BY p.id, p.name
HAVING AVG(d.price) > 5000;
