CREATE TABLE type
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE product
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(255),
    type_id      INT REFERENCES type(id),
    expired_date DATE,
    price        FLOAT
);

INSERT INTO type (name)
VALUES
    ('СЫР'),
    ('МОЛОКО'),
    ('КОЛБАСА');

INSERT INTO product (name, type_id, expired_date, price)
VALUES
    ('Сыр плавленый', 1, CURRENT_DATE + 30, 120),
    ('Гауда', 1, CURRENT_DATE - 10, 250),
    ('Молоко 3.2%', 2, CURRENT_DATE + 7, 90),
    ('Мороженое пломбир', 2, CURRENT_DATE + 60, 150),
    ('Мороженое шоколадное', 2, CURRENT_DATE - 5, 140),
    ('Колбаса докторская', 3, CURRENT_DATE + 20, 210),
    ('Сервелат', 3, CURRENT_DATE - 3, 250);

SELECT p.*
FROM product AS p
INNER JOIN type AS t ON p.type_id = t.id
WHERE t.name = 'СЫР';

SELECT *
FROM product
WHERE name ILIKE '%мороженое%';

SELECT *
FROM product
WHERE expired_date < CURRENT_DATE;

SELECT *
FROM product
WHERE price = (SELECT MAX(price) FROM product);

SELECT t.name AS type_name, COUNT(p.id) AS product_count
FROM type AS t
INNER JOIN product AS p ON t.id = p.type_id
GROUP BY t.id, t.name;

SELECT p.*
FROM product AS p
INNER JOIN type AS t ON p.type_id = t.id
WHERE t.name IN ('СЫР', 'МОЛОКО');

SELECT t.name AS type_name, COUNT(p.id) AS product_count
FROM type AS t
INNER JOIN product AS p ON t.id = p.type_id
GROUP BY t.id, t.name
HAVING COUNT(p.id) < 10;

SELECT p.id, p.name, p.expired_date, p.price, t.name AS type_name
FROM product AS p
INNER JOIN type AS t ON p.type_id = t.id;
