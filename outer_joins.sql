CREATE TABLE departments
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(255),
    department_id INT REFERENCES departments(id)
);

INSERT INTO departments (name)
VALUES
    ('Development'),
    ('Accounting'),
    ('Human resources'),
    ('Security');

INSERT INTO employees (name, department_id)
VALUES
    ('Petr', 1),
    ('Anna', 1),
    ('Ivan', 2),
    ('Maria', 3),
    ('Olga', NULL);

SELECT d.name AS department, e.name AS employee
FROM departments AS d
LEFT JOIN employees AS e ON d.id = e.department_id;

SELECT d.name AS department, e.name AS employee
FROM departments AS d
RIGHT JOIN employees AS e ON d.id = e.department_id;

SELECT d.name AS department, e.name AS employee
FROM departments AS d
FULL JOIN employees AS e ON d.id = e.department_id;

SELECT d.name AS department, e.name AS employee
FROM departments AS d
CROSS JOIN employees AS e;

SELECT d.name AS department
FROM departments AS d
LEFT JOIN employees AS e ON d.id = e.department_id
WHERE e.id IS NULL;

SELECT d.name AS department, e.name AS employee
FROM departments AS d
LEFT JOIN employees AS e ON d.id = e.department_id;

SELECT d.name AS department, e.name AS employee
FROM employees AS e
RIGHT JOIN departments AS d ON e.department_id = d.id;

CREATE TABLE teens
(
    name   VARCHAR(255),
    gender VARCHAR(10)
);

INSERT INTO teens (name, gender)
VALUES
    ('Вася', 'мужской'),
    ('Петя', 'мужской'),
    ('Маша', 'женский'),
    ('Оля', 'женский');

SELECT boys.name AS boy, girls.name AS girl
FROM teens AS boys
CROSS JOIN teens AS girls
WHERE boys.gender = 'мужской'
  AND girls.gender = 'женский';
