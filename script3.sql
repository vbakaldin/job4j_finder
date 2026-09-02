CREATE TABLE departments
(
    id   SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    full_name     TEXT NOT NULL,
    department_id INT NOT NULL REFERENCES departments(id)
);

INSERT INTO departments (name)
VALUES
    ('Development'),
    ('Accounting'),
    ('Human resources');

INSERT INTO employees (full_name, department_id)
VALUES
    ('Petr Ivanov', 1),
    ('Anna Petrova', 1),
    ('Ivan Sidorov', 2),
    ('Olga Smirnova', 3);

SELECT e.id, e.full_name, d.name AS department
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.id;

SELECT e.full_name, d.name AS department
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.id
WHERE d.name = 'Development';

SELECT e.full_name, d.name AS department
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.id
WHERE e.id > 2;