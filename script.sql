DROP TABLE roles;
CREATE TABLE roles (
    id SERIAL PRIMARY KEY, 
    name TEXT
);
INSERT INTO roles (name) VALUES ('petr'), ('slava');
SELECT * FROM roles;
UPDATE roles SET name = 'vova' WHERE name = 'petr';
SELECT * FROM roles;
DELETE FROM roles where name = 'vova';
SELECT * FROM roles;