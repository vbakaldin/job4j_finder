INSERT INTO roles (name)
VALUES ('Administrator'), ('User');

INSERT INTO rules (name)
VALUES
    ('Create item'),
    ('Edit item'),
    ('Delete item'),
    ('View item');

INSERT INTO roles_rules (role_id, rule_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 4);

INSERT INTO users (name, role_id)
VALUES
    ('Petr', 1),
    ('Anna', 2);

INSERT INTO categories (name)
VALUES ('Software'), ('Hardware');

INSERT INTO states (name)
VALUES ('New'), ('In progress'), ('Closed');

INSERT INTO items (name, description, user_id, category_id, state_id)
VALUES
    ('Install application', 'Install the accounting application', 1, 1, 1),
    ('Replace keyboard', 'The keyboard does not work', 2, 2, 2);

INSERT INTO comments (message, item_id)
VALUES
    ('The application has been downloaded', 1),
    ('A new keyboard has been ordered', 2);

INSERT INTO attachs (name, path, item_id)
VALUES
    ('error.png', 'files/error.png', 1),
    ('keyboard.jpg', 'files/keyboard.jpg', 2);
