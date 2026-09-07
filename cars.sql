CREATE TABLE car_bodies
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE car_engines
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE car_transmissions
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE cars
(
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(255),
    body_id         INT REFERENCES car_bodies(id),
    engine_id       INT REFERENCES car_engines(id),
    transmission_id INT REFERENCES car_transmissions(id)
);

INSERT INTO car_bodies (name)
VALUES
    ('Sedan'),
    ('Hatchback'),
    ('Pickup');

INSERT INTO car_engines (name)
VALUES
    ('Petrol'),
    ('Diesel'),
    ('Electric');

INSERT INTO car_transmissions (name)
VALUES
    ('Automatic'),
    ('Manual'),
    ('Robot');

INSERT INTO cars (name, body_id, engine_id, transmission_id)
VALUES
    ('Toyota Camry', 1, 1, 1),
    ('Volkswagen Golf', 2, 2, 2),
    ('Incomplete car', 1, NULL, NULL);

SELECT c.id,
       c.name AS car_name,
       cb.name AS body_name,
       ce.name AS engine_name,
       ct.name AS transmission_name
FROM cars AS c
LEFT JOIN car_bodies AS cb ON c.body_id = cb.id
LEFT JOIN car_engines AS ce ON c.engine_id = ce.id
LEFT JOIN car_transmissions AS ct ON c.transmission_id = ct.id;

SELECT cb.id, cb.name
FROM car_bodies AS cb
LEFT JOIN cars AS c ON cb.id = c.body_id
WHERE c.id IS NULL;

SELECT ce.id, ce.name
FROM car_engines AS ce
LEFT JOIN cars AS c ON ce.id = c.engine_id
WHERE c.id IS NULL;

SELECT ct.id, ct.name
FROM car_transmissions AS ct
LEFT JOIN cars AS c ON ct.id = c.transmission_id
WHERE c.id IS NULL;
