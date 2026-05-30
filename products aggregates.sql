SELECT
COUNT(*) AS TotalProducts,
SUM(price) AS TotalPrice,
AVG(price) AS AveragePrice,
MAX(price) AS HighestPrice,
MIN(price) AS LowestPrice
FROM products;

SELECT COUNT(*)
FROM products;

SELECT COUNT(*)
FROM products
WHERE category = 'Electronics';

SELECT SUM(price)
FROM products;

SELECT
    category,
    COUNT(*) AS ProductCount
FROM products
GROUP BY category;