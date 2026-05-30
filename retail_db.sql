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
select customer_id, customer_name,city from customers; OR SELECT * FROM customers;
