SELECT *
FROM products
WHERE supplier_city IN ('Hydrabad','Delhi');

SELECT *
FROM products
WHERE price BETWEEN 500 AND 20000;

SELECT *
FROM products
WHERE product_name LIKE 'P%';


SELECT *
FROM products
WHERE product_name LIKE '%k';

SELECT *
FROM products
WHERE product_name LIKE '%top%';
