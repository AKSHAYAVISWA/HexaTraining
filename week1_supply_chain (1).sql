
CREATE DATABASE customer_order_tracker;
USE customer_order_tracker;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE delivery_status (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    expected_date DATE,
    delivered_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);


INSERT INTO customers
(customer_name,email,phone,city)
VALUES
('Arun','arun@gmail.com','9876543210','Chennai'),
('Priya','priya@gmail.com','9876543211','Coimbatore'),
('Rahul','rahul@gmail.com','9876543212','Madurai'),
('Divya','divya@gmail.com','9876543213','Salem'),
('Karthik','karthik@gmail.com','9876543214','Trichy');

INSERT INTO orders
(customer_id,order_date,total_amount)
VALUES
(1,'2026-06-01',2500),
(2,'2026-06-02',1500),
(3,'2026-06-03',3500),
(4,'2026-06-04',4200),
(5,'2026-06-05',1800);

INSERT INTO delivery_status
(order_id,expected_date,delivered_date,status)
VALUES
(1,'2026-06-05','2026-06-07','Delayed'),
(2,'2026-06-06','2026-06-06','Delivered'),
(3,'2026-06-07',NULL,'In Transit'),
(4,'2026-06-08','2026-06-10','Delayed'),
(5,'2026-06-09','2026-06-09','Delivered');


SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM delivery_status;

SELECT * FROM customers
WHERE customer_id = 1;

SELECT * FROM customers
WHERE city = 'Chennai';

SELECT * FROM orders
WHERE total_amount > 2000;

SELECT * FROM delivery_status
WHERE status = 'Delayed';


--  UPDATE QUERIES

UPDATE customers
SET city = 'Trichy'
WHERE customer_id = 1;

UPDATE delivery_status
SET status = 'Delivered'
WHERE delivery_id = 3;

UPDATE orders
SET total_amount = 3000
WHERE order_id = 1;


--  DELETE QUERIES


DELETE FROM delivery_status
WHERE delivery_id = 5;

DELETE FROM orders
WHERE order_id = 5;


--  ORDER BY QUERIES


SELECT * FROM customers
ORDER BY customer_name ASC;

SELECT * FROM orders
ORDER BY total_amount DESC;

SELECT * FROM delivery_status
ORDER BY expected_date;


-- AGGREGATE FUNCTIONS


SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT MAX(total_amount) AS highest_order
FROM orders;

SELECT MIN(total_amount) AS lowest_order
FROM orders;

SELECT AVG(total_amount) AS average_order_value
FROM orders;

SELECT SUM(total_amount) AS total_revenue
FROM orders;


--  GROUP BY QUERIES


SELECT customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

SELECT customer_id,
SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

SELECT status,
COUNT(*) AS status_count
FROM delivery_status
GROUP BY status;


-- INNER JOIN QUERIES

SELECT
c.customer_name,
o.order_id,
o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
c.customer_name,
o.order_id,
o.order_date,
d.status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN delivery_status d
ON o.order_id = d.order_id;


-- 11. LEFT JOIN

SELECT
c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- 12. DELAYED DELIVERY ANALYSIS


SELECT
c.customer_name,
o.order_id,
d.expected_date,
d.delivered_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN delivery_status d
ON o.order_id = d.order_id
WHERE d.delivered_date > d.expected_date;

SELECT COUNT(*) AS delayed_orders
FROM delivery_status
WHERE status = 'Delayed';


-- 13. VIEW


CREATE VIEW delayed_orders_view AS
SELECT
c.customer_name,
o.order_id,
d.status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN delivery_status d
ON o.order_id = d.order_id
WHERE d.status = 'Delayed';

SELECT * FROM delayed_orders_view;


-- 14. STORED PROCEDURE


DELIMITER $$

CREATE PROCEDURE GetDelayedDeliveries(
IN cust_id INT
)
BEGIN

SELECT
c.customer_name,
o.order_id,
d.status,
d.expected_date,
d.delivered_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN delivery_status d
ON o.order_id = d.order_id
WHERE c.customer_id = cust_id
AND d.status = 'Delayed';

END $$

DELIMITER ;

CALL GetDelayedDeliveries(1);

-- 15. TRIGGER

DELIMITER $$

CREATE TRIGGER auto_update_status
BEFORE UPDATE
ON delivery_status
FOR EACH ROW
BEGIN

IF NEW.delivered_date IS NOT NULL THEN
SET NEW.status = 'Delivered';
END IF;

END $$

DELIMITER ;


-- 16. INDEXING

CREATE INDEX idx_customer_email
ON customers(email);

CREATE INDEX idx_order_date
ON orders(order_date);

CREATE INDEX idx_delivery_status
ON delivery_status(status);


-- 17. ADVANCED QUERIES


-- Top Spending Customer

SELECT
c.customer_name,
SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- Customers With Orders Greater Than Average

SELECT *
FROM orders
WHERE total_amount >
(
SELECT AVG(total_amount)
FROM orders
);

-- Total Revenue By City

SELECT
c.city,
SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Customer Order Count

SELECT
c.customer_name,
COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Find Customers Without Orders

SELECT
c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Show All Delayed Deliveries

SELECT
c.customer_name,
o.order_id,
d.status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN delivery_status d
ON o.order_id = d.order_id
WHERE d.status = 'Delayed';
