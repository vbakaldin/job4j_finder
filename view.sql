-- Урок 2.3.2.3: Запрос, который выводит тип продуктов, которых осталось меньше 10 штук

CREATE VIEW types_with_less_than_10_products AS
SELECT t.name AS type_name, COUNT(p.id) AS product_count
FROM type AS t
INNER JOIN product AS p ON t.id = p.type_id
GROUP BY t.id, t.name
HAVING COUNT(p.id) < 10;