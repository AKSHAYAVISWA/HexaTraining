CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(30)
);

INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'Hyderabad', '9876543210'),
(2, 'Priya Reddy', 'Bangalore', '9876543211'),
(3, 'Amit Kumar', 'Mumbai', NULL),
(4, 'Sneha Patel', 'Chennai', '9876543213'),
(5, 'Arjun Verma', NULL, '9876543214'),
(6, 'Neha Singh', 'Delhi', '9876543215');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000, 'Delivered'),
(102, 1, 'Mouse', 700, 'Delivered'),
(103, 2, 'Mobile', 25000, 'Shipped'),
(104, 3, 'Keyboard', NULL, 'Pending'), 
(105, 7, 'Printer', 18000, 'Delivered'), 
(106, NULL, 'Office Chair', 7500, 'Pending'), 
(107, 4, NULL, 12000, 'Cancelled'), 
(108, 8, 'Monitor', 15000, NULL);

SELECT
	c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_amount,
    o.order_status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
	c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_amount,
    o.order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
	c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_amount,	
    o.order_status
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


SELECT
	c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_amount,
    o.order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT
	c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.order_amount,
    o.order_status
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
	c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT *
FROM customers
WHERE customer_id in
(
	SELECT customer_id
    FROM orders
    );

SELECT *
FROM customers
WHERE customer_id in
(
	SELECT customer_id
    FROM orders
    WHERE customer_id is not null
    );

SELECT *
FROM orders
WHERE order_amount >
(
	SELECT AVG(order_amount)
    FROM orders
    );
    
SELECT *
FROM orders
WHERE order_amount =
(
SELECT MAX(order_amount)
FROM orders
);
