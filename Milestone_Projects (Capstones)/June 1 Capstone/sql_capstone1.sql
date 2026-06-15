-- CREATE DATABASE retail_capstone_db;
-- USE retail_capstone_db;

/*
CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    gender VARCHAR(10),
    membership_type VARCHAR(30)
);


CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE order_items
(
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


CREATE TABLE payments
(
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


CREATE TABLE deliveries
(
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_partner VARCHAR(50),
    delivery_status VARCHAR(30),
    delivery_city VARCHAR(50),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

*/

/*
INSERT INTO customers VALUES
(1,'Arun','Chennai','Tamil Nadu','Male','Gold'),
(2,'Priya','Mumbai','Maharashtra','Female','Silver'),
(3,'Rahul','Delhi','Delhi','Male','Gold'),
(4,'Sneha','Ahmedabad','Gujarat','Female','Silver'),
(5,'Vikram','Jaipur','Rajasthan','Male','Bronze'),
(6,'Anjali','Delhi','Delhi','Female','Gold'),
(7,'Karthik','Chennai','Tamil Nadu','Male','Silver'),
(8,'Neha','Pune','Maharashtra','Female','Gold'),
(9,'Ramesh','Bangalore','Karnataka','Male','Bronze'),
(10,'Pooja','Kochi','Kerala','Female','Silver');
*/

/*
INSERT INTO products VALUES
(101,'Laptop','Electronics',55000.00),
(102,'Smartphone','Electronics',25000.00),
(103,'Headphones','Electronics',3000.00),
(104,'Office Chair','Furniture',7000.00),
(105,'Study Table','Furniture',10000.00),
(106,'Running Shoes','Fashion',2500.00),
(107,'T-Shirt','Fashion',800.00),
(108,'Smart Watch','Electronics',5000.00),
(109,'Backpack','Accessories',1500.00),
(110,'Water Bottle','Accessories',500.00);
*/
/*
INSERT INTO orders VALUES
(1001,1,'2025-01-1','Delivered'),
(1002,2,'2025-01-11','Delivered'),
(1003,3,'2025-01-12','Cancelled'),
(1004,4,'2025-01-13','Delivered'),
(1005,5,'2025-01-14','Pending'),
(1006,1,'2025-01-15','Delivered'),
(1007,6,'2025-01-16','Delivered'),
(1008,7,'2025-01-17','Pending'),
(1009,8,'2025-01-18','Delivered'),
(1010,9,'2025-01-19','Cancelled'),
(1011,10,'2025-01-20','Delivered'),
(1012,2,'2025-01-21','Delivered'),
(1013,3,'2025-01-22','Pending'),
(1014,4,'2025-01-23','Delivered'),
(1015,8,'2025-01-24','Delivered');
*/

/*
INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1002,109,1),
(5,1003,108,1),
(6,1004,104,1),
(7,1004,105,1),
(8,1005,106,2),
(9,1006,102,1),
(10,1006,107,3),
(11,1007,108,1),
(12,1008,110,5),
(13,1009,101,1),
(14,1010,103,2),
(15,1011,105,1),
(16,1012,106,1),
(17,1013,109,2),
(18,1014,104,1),
(19,1015,108,1),
(20,1015,110,2);
*/
/*
INSERT INTO payments VALUES
(1,1001,'UPI','Success',61000.00),
(2,1002,'Credit Card','Success',26500.00),
(3,1003,'UPI','Failed',5000.00),
(4,1004,'Net Banking','Success',17000.00),
(5,1005,'Cash On Delivery','Pending',5000.00),
(6,1006,'UPI','Success',27400.00),
(7,1007,'Debit Card','Success',5000.00),
(8,1008,'Cash On Delivery','Pending',2500.00),
(9,1009,'Credit Card','Success',55000.00),
(10,1010,'UPI','Failed',6000.00),
(11,1011,'Net Banking','Success',10000.00),
(12,1012,'UPI','Success',2500.00),
(13,1013,'Debit Card','Pending',3000.00),
(14,1014,'Credit Card','Success',7000.00),
(15,1015,'UPI','Success',6000.00);
*/
/*
INSERT INTO deliveries VALUES
(1,1001,'Delhivery','Delivered','Chennai'),
(2,1002,'BlueDart','Delivered','Mumbai'),
(3,1003,'Ecom Express','Cancelled','Delhi'),
(4,1004,'Delhivery','Delivered','Ahmedabad'),
(5,1005,'BlueDart','Pending','Jaipur'),
(6,1006,'Delhivery','Delivered','Chennai'),
(7,1007,'Ecom Express','Delivered','Delhi'),
(8,1008,'BlueDart','Pending','Chennai'),
(9,1009,'Delhivery','Delivered','Pune'),
(10,1010,'Ecom Express','Cancelled','Bangalore'),
(11,1011,'BlueDart','Delivered','Kochi'),
(12,1012,'Delhivery','Delivered','Mumbai'),
(13,1013,'BlueDart','Pending','Delhi'),
(14,1014,'Ecom Express','Delivered','Ahmedabad'),
(15,1015,'Delhivery','Delivered','Pune');
*/

-- select * from customers;

-- select customer_name, city, membership_type from  customers;

-- select * from products order by price desc;'

-- select * from customers where city = 'Hyderabad';

-- select * from customers where membership_type = 'Gold';

-- select* from products where price between 500 and 5000;

-- select * from products where category in('Electronics','Fashion');

-- update orders set order_date='2026-01-01' where order_id='1001';
-- select * from  orders where order_date = '2026-01-01';

-- select * from  payments where payment_mode = 'UPI';

-- select * from deliveries where delivery_status = 'Pending';

-- select count(*) as total_customers from customers;

-- select count(*) as total_orders from orders;

-- select count(*) as total_products from products;

-- select sum(amount) as total_revenue from payments where payment_status = 'Success';

-- select avg(amount) as average_amount from payments;

-- select max(amount) as highest_payment from payments;

-- select min(amount) as lowest_payment from payments;

-- select  city, count(*) as count_by_city from customers group by city; 

-- select category, count(*) as count_by_category from products group by category;

-- select order_status, count(*) as count_by_status from orders group by order_status;

/*
select  c.customer_name,
		o.order_id,
        o.order_date
from customers c
inner join orders o
on c.customer_id = o.customer_id;
*/

/*
SELECT oi.order_id,
       p.product_name,
       oi.quantity,
       p.price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;
*/

/*
SELECT c.customer_name,
       p.product_name,
       oi.quantity,
       o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id;
*/

-- select  order_id ,payment_mode, payment_status, amount from payments;

-- select order_id, delivery_partner ,delivery_status from deliveries;

/*
SELECT c.customer_name,
       c.city,
       o.order_id,
       o.order_date,
       p.product_name,
       p.category,
       oi.quantity,
       p.price,
       pay.payment_status,
       d.delivery_status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN payments pay
    ON o.order_id = pay.order_id
INNER JOIN deliveries d
    ON o.order_id = d.order_id;
*/

/*
SELECT c.city, SUM(p.amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY c.city;
*/

/*
SELECT c.customer_name, SUM(p.amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY c.customer_name;
*/

/*
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;
*/

/*
SELECT p.category, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category;
*/

/*
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
*/

/*
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;
*/
/*
SELECT p.category, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * p.price) > 10000;
*/
/*
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) > 3;
*/

/*
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
*/
/*
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);
*/
/*
SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM order_items
);
*/

/*
SELECT *
FROM payments
WHERE amount > (
    SELECT AVG(amount)
    FROM payments
);
*/

/*
SELECT c.customer_name, p.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM payments
);
*/
/*
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
*/

/*
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics';
*/

/*
SELECT *
FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM payments
    WHERE payment_status = 'Success'
);
*/

/*
SELECT *
FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM deliveries
    WHERE delivery_status <> 'Delivered'
);
*/

/*
SELECT c.customer_name,
       SUM(p.amount) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_name
HAVING SUM(p.amount) >
(
    SELECT AVG(total_spending)
    FROM (
        SELECT SUM(amount) AS total_spending
        FROM orders o
        JOIN payments p ON o.order_id = p.order_id
        GROUP BY customer_id
    ) t
);
*/

/*
SELECT *
FROM orders
WHERE order_id NOT IN (
    SELECT order_id
    FROM payments
);
*/

/*
SELECT *
FROM orders
WHERE order_id NOT IN (
    SELECT order_id
    FROM deliveries
);
*/

/*
SELECT *
FROM payments
WHERE amount IS NULL
OR amount = 0;

SELECT o.order_id,
       o.order_status,
       p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'Cancelled'
AND p.payment_status = 'Success';
*/
/*
SELECT o.order_id,
       o.order_status,
       p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'Delivered'
AND p.payment_status = 'Failed';
*/
/*
SELECT *
FROM order_items
WHERE product_id NOT IN (
    SELECT product_id
    FROM products
);
*/
/*
SELECT *
FROM orders
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM customers
);
*/
