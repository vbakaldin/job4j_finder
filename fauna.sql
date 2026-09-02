CREATE TABLE fauna
(
    id             SERIAL PRIMARY KEY,
    name           TEXT,
    avg_age        INT,
    discovery_date DATE
);

INSERT INTO fauna (name, avg_age, discovery_date)
VALUES
    ('Goldfish', 3650, '1758-01-01'),
    ('Clownfish', 5475, '1830-01-01'),
    ('Blue whale', 18250, '1758-01-01'),
    ('Bald eagle', 10950, '1766-01-01'),
    ('African elephant', 25550, '1797-01-01'),
    ('Greenland shark', 54750, NULL),
    ('Unknown cave fish', 7300, NULL);

SELECT *
FROM fauna
WHERE name LIKE '%fish%';

SELECT *
FROM fauna
WHERE avg_age BETWEEN 10000 AND 21000;

SELECT *
FROM fauna
WHERE discovery_date IS NULL;

SELECT *
FROM fauna
WHERE discovery_date < '1950-01-01';
