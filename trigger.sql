--DROP SCHEMA public CASCADE;
--CREATE SCHEMA public;

CREATE TABLE products
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(50),
    producer VARCHAR(50),
    count    INTEGER DEFAULT 0,
    price    INTEGER
);

CREATE OR REPLACE FUNCTION add_tax_after_insert()
RETURNS TRIGGER AS
$$
BEGIN
    UPDATE products AS p
    SET price = p.price + p.price / 100 * 22
    FROM inserted_products AS ip
    WHERE p.id = ip.id;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_after_insert_tax
AFTER INSERT ON products
REFERENCING NEW TABLE AS inserted_products
FOR EACH STATEMENT
EXECUTE FUNCTION add_tax_after_insert();

CREATE OR REPLACE FUNCTION add_tax_before_insert()
RETURNS TRIGGER AS
$$
BEGIN
    NEW.price = NEW.price + NEW.price / 100 * 22;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_before_insert_tax
BEFORE INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION add_tax_before_insert();


CREATE TABLE history_of_price
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50),
    price INTEGER,
    date  TIMESTAMP
);

CREATE OR REPLACE FUNCTION save_product_price()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO history_of_price (name, price, date)
    VALUES (NEW.name, NEW.price, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_after_insert_history
AFTER INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION save_product_price();
