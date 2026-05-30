CREATE DATABASE retail_db;
USE retail_db;
CREATE TABLE customers
(
	customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customers
values
(1, 'Rahul','Hydrabad'),
(2,'Priya','Banglore'),
(3,'Amit','Mumbai');
select customer_id, customer_name,city from customers; 

set sql_safe_updates=0; 
update customers 
set city = 'Chennai'
where customer_id = 1;

set sql_safe_updates=1; 

set sql_safe_updates=0;

DELETE FROM customers
WHERE city = 'Banglore';

set sql_safe_updates=1;

CREATE TABLE products
(
	product_id INT PRIMARY key,
    product_name VARCHAR(100),
    category varchar(50),
    price decimal(10,2),
    stock_quantity INT,
    supplier_city varchar(50)
);

INSERT INTO products 
VALUES
(1,'Laptop','Electronics',55000,10,'Hydrabad'),
(2,'iphone','Electronics',65000,15,'delhi');

SELECT * FROM products;
delete from products where product_id = 1 ;
update products
set supplier_city = 'pune'
where product_id =2;


CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock_quantity INT,
    supplier_city VARCHAR(30)
);

INSERT INTO products VALUES
(1,'Laptop','Electronics',55000,10,'Hyderabad'),
(2,'Mobile','Electronics',25000,25,'Bangalore'),
(3,'Printer','Electronics',18000,8,'Pune'),
(4,'Office Chair','Furniture',7500,15,'Mumbai'),
(5,'Desk','Furniture',12000,5,'Chennai'),
(6,'Notebook','Stationery',80,200,'Hyderabad'),
(7,'Pen','Stationery',20,500,'Delhi'),
(8,'Water Bottle','Accessories',500,50,'Bangalore');

Select product_name, price
from products;
select distinct category
from products;

SELECT *
FROM products
WHERE price >10000;

SELECT*
from products
where stock_quantity < 20;

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

SELECT
product_name AS Product,
price AS ProductPrice
FROM products;

SELECT *
FROM products
order by price DESC;

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
