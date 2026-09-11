DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE products
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(50),
    producer VARCHAR(50),
    count    INTEGER default 0,
    price    INTEGER
);

INSERT INTO products (name, producer, count, price)
VALUES ('product_1', 'producer_1', 3, 50);
INSERT INTO products (name, producer, count, price)
VALUES ('product_2', 'producer_2', 15, 32);
INSERT INTO products (name, producer, count, price)
VALUES ('product_3', 'producer_3', 8, 115);

BEGIN TRANSACTION;

	INSERT INTO products (name, producer, count, price) VALUES ('product_5', 'producer_5', 17, 45);
	
	SAVEPOINT first_savepoint;
	
	DELETE FROM products WHERE price = 115;
	UPDATE products SET price = 999 WHERE name = 'product_1';
	
	ROLLBACK TO first_savepoint;

COMMIT TRANSACTION;

SELECT * FROM products;