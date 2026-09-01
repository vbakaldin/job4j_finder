CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    department_id INT NOT NULL REFERENCES departments(id)
);


CREATE TABLE personal_files (
    id SERIAL PRIMARY KEY,
    passport_number TEXT,
    employee_id INT NOT NULL UNIQUE REFERENCES employees(id)
);

CREATE TABLE employees_projects (
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id),
    PRIMARY KEY (employee_id, project_id)
);
