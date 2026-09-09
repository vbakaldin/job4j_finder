CREATE TABLE products
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(50),
    producer VARCHAR(50),
    count    INTEGER DEFAULT 0,
    price    INTEGER
);

INSERT INTO products (name, producer, count, price)
VALUES
    ('Milk', 'Farm', 10, 100),
    ('Bread', 'Bakery', 0, 50),
    ('Cheese', 'Farm', 5, 300),
    ('Yogurt', 'Farm', 0, 80);

CREATE OR REPLACE PROCEDURE delete_product_by_id(product_id INTEGER)
LANGUAGE plpgsql
AS
$$
BEGIN
    DELETE FROM products
    WHERE id = product_id;
END;
$$;

CREATE OR REPLACE FUNCTION delete_products_without_count()
RETURNS VOID
LANGUAGE plpgsql
AS
$$
BEGIN
    DELETE FROM products
    WHERE count = 0;
END;
$$;

CALL delete_product_by_id(1);

SELECT delete_products_without_count();

SELECT * FROM products;
