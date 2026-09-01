CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE rules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE roles_rules (
    role_id INT NOT NULL REFERENCES roles(id),
    rule_id INT NOT NULL REFERENCES rules(id),
    PRIMARY KEY (role_id, rule_id)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    role_id INT NOT NULL REFERENCES roles(id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL REFERENCES users(id),
    category_id INT NOT NULL REFERENCES categories(id),
    state_id INT NOT NULL REFERENCES states(id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    item_id INT NOT NULL REFERENCES items(id)
);

CREATE TABLE attachs (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    path TEXT NOT NULL,
    item_id INT NOT NULL REFERENCES items(id)
);
