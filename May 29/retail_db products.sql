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
