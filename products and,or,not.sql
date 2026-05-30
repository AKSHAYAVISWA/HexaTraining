SELECT *
FROM products
WHERE category = 'Electronics'
AND price>20000;

SELECT *
FROM products 
WHERE supplier_city='Hyderabad'
OR supplier_city='Banglore';

SELECT *
FROM products
WHERE NOT category = 'Electronics';
