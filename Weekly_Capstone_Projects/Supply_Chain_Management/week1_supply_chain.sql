-- Create Database
CREATE DATABASE SupplyChainDB;
USE SupplyChainDB;

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact_email VARCHAR(100),
    city VARCHAR(50)
);

-- Inventory Table
CREATE TABLE Inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    stock_quantity INT,
    reorder_level INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Inventory(product_id)
);


-- INSERT (Create)


INSERT INTO Suppliers (supplier_name, contact_email, city)
VALUES
('ABC Suppliers','abc@gmail.com','Chennai'),
('XYZ Traders','xyz@gmail.com','Bangalore');

INSERT INTO Inventory (product_name, stock_quantity, reorder_level, supplier_id)
VALUES
('Laptop',50,20,1),
('Mouse',100,30,2),
('Keyboard',80,25,1);

INSERT INTO Orders (product_id, quantity, order_date, status)
VALUES
(1,5,'2026-06-01','Delivered'),
(2,10,'2026-06-02','Pending'),
(3,8,'2026-06-03','Shipped');


-- SELECT (Read)


SELECT * FROM Suppliers;
SELECT * FROM Inventory;
SELECT * FROM Orders;

SELECT product_name, stock_quantity
FROM Inventory;

SELECT *
FROM Orders
WHERE status='Pending';


-- UPDATE


UPDATE Inventory
SET stock_quantity = 70
WHERE product_id = 1;

UPDATE Orders
SET status='Delivered'
WHERE order_id = 2;


-- DELETE


DELETE FROM Orders
WHERE order_id = 3;


-- JOINS

SELECT
o.order_id,
i.product_name,
o.quantity,
o.status
FROM Orders o
JOIN Inventory i
ON o.product_id = i.product_id;

-- =====================================
-- AGGREGATE FUNCTIONS
-- =====================================

SELECT COUNT(*) AS TotalOrders
FROM Orders;

SELECT SUM(quantity) AS TotalQuantityOrdered
FROM Orders;

SELECT AVG(stock_quantity) AS AverageStock
FROM Inventory;


-- GROUP BY


SELECT status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY status;


-- INDEXES


CREATE INDEX idx_product_name
ON Inventory(product_name);

CREATE INDEX idx_order_status
ON Orders(status);


-- STORED PROCEDURE


DELIMITER //

CREATE PROCEDURE CheckReorder()
BEGIN
    SELECT
        product_id,
        product_name,
        stock_quantity,
        reorder_level
    FROM Inventory
    WHERE stock_quantity <= reorder_level;
END //

DELIMITER ;


CALL CheckReorder();