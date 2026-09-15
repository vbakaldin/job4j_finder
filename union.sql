DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE movies
(
    id       SERIAL PRIMARY KEY,
    name     TEXT,
    director TEXT
);

CREATE TABLE books
(
    id     SERIAL PRIMARY KEY,
    title  TEXT,
    author TEXT
);

INSERT INTO movies (name, director)
VALUES ('Марсианин', 'Ридли Скотт'),
       ('Матрица', 'Братья Вачовски'),
       ('Властелин колец', 'Питер Джексон'),
       ('Гарри Поттер и узник Азкабана', 'Альфонсо Куарон'),
       ('Железный человек', 'Джон Фавро');

INSERT INTO books (title, author)
VALUES ('Гарри Поттер и узник Азкабана', 'Джоан Роулинг'),
       ('Властелин колец', 'Джон Толкин'),
       ('1984', 'Джордж Оруэлл'),
       ('Марсианин', 'Энди Уир'),
       ('Божественная комедия', 'Данте Алигьери');

SELECT name
FROM movies
WHERE name IN (SELECT title FROM books);

SELECT title
FROM books
WHERE title NOT IN (SELECT name FROM movies);

SELECT name AS title
FROM movies
WHERE name NOT IN (SELECT title FROM books)
UNION
SELECT title
FROM books
WHERE title NOT IN (SELECT name FROM movies);