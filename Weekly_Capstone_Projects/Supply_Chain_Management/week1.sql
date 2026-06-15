
CREATE DATABASE inventory_management;
USE inventory_management;

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE inventory (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    reorder_level INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id)
    REFERENCES inventory(product_id)
);

CREATE TABLE inventory_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_quantity INT,
    new_quantity INT,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- INSERT DATA

INSERT INTO suppliers
(supplier_name, contact_email, phone)
VALUES
('ABC Suppliers','abc@gmail.com','9876543210'),
('XYZ Traders','xyz@gmail.com','9876543211'),
('Global Supplies','global@gmail.com','9876543212');

INSERT INTO inventory
(product_name, quantity, reorder_level, supplier_id)
VALUES
('Laptop',50,10,1),
('Mouse',100,20,2),
('Keyboard',80,15,1),
('Monitor',30,5,3),
('Printer',25,8,2);

INSERT INTO orders
(product_id, quantity_ordered, order_date)
VALUES
(1,5,'2026-06-01'),
(2,10,'2026-06-02'),
(3,15,'2026-06-03'),
(4,3,'2026-06-04');


-- CRUD OPERATIONS
-- READ

SELECT * FROM suppliers;

SELECT * FROM inventory;

SELECT * FROM orders;

SELECT *
FROM inventory
WHERE quantity <= reorder_level;

SELECT *
FROM inventory
WHERE supplier_id = 1;

SELECT *
FROM orders
WHERE order_date > '2026-06-02';

SELECT *
FROM inventory
ORDER BY quantity DESC;

SELECT COUNT(*) AS total_products
FROM inventory;

SELECT AVG(quantity) AS average_stock
FROM inventory;

-- UPDATE

UPDATE inventory
SET quantity = 60
WHERE product_id = 1;

UPDATE inventory
SET reorder_level = 12
WHERE product_id = 2;

UPDATE suppliers
SET contact_email = 'newabc@gmail.com'
WHERE supplier_id = 1;

UPDATE inventory
SET quantity = quantity + 10;

-- DELETE

DELETE FROM orders
WHERE order_id = 4;

DELETE FROM orders
WHERE order_date < '2026-06-02';


-- JOINS

SELECT
i.product_name,
i.quantity,
s.supplier_name
FROM inventory i
JOIN suppliers s
ON i.supplier_id = s.supplier_id;

SELECT
o.order_id,
i.product_name,
o.quantity_ordered,
o.order_date
FROM orders o
JOIN inventory i
ON o.product_id = i.product_id;

SELECT
o.order_id,
i.product_name,
s.supplier_name,
o.quantity_ordered,
o.order_date
FROM orders o
JOIN inventory i
ON o.product_id = i.product_id
JOIN suppliers s
ON i.supplier_id = s.supplier_id;


-- AGGREGATE FUNCTIONS

SELECT SUM(quantity) AS total_stock
FROM inventory;

SELECT AVG(quantity) AS average_stock
FROM inventory;

SELECT MIN(quantity) AS minimum_stock
FROM inventory;

SELECT MAX(quantity) AS maximum_stock
FROM inventory;

SELECT
supplier_id,
COUNT(*) AS product_count
FROM inventory
GROUP BY supplier_id;


-- INDEXING

CREATE INDEX idx_product_name
ON inventory(product_name);

CREATE INDEX idx_supplier
ON inventory(supplier_id);

CREATE INDEX idx_order_date
ON orders(order_date);

SHOW INDEXES FROM inventory;

SHOW INDEXES FROM orders;


-- STORED PROCEDURES

DELIMITER //

CREATE PROCEDURE CheckReorder()
BEGIN
    SELECT *
    FROM inventory
    WHERE quantity <= reorder_level;
END //

DELIMITER ;

CALL CheckReorder();

DELIMITER //

CREATE PROCEDURE GetSupplierProducts(IN supplierId INT)
BEGIN
    SELECT *
    FROM inventory
    WHERE supplier_id = supplierId;
END //

DELIMITER ;

CALL GetSupplierProducts(1);

DELIMITER //

CREATE PROCEDURE InventorySummary()
BEGIN
    SELECT
        COUNT(*) AS TotalProducts,
        SUM(quantity) AS TotalStock;
END //

DELIMITER ;

CALL InventorySummary();


-- TRIGGERS

DELIMITER //

CREATE TRIGGER inventory_update_audit
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    INSERT INTO inventory_audit
    (product_id, old_quantity, new_quantity)
    VALUES
    (NEW.product_id, OLD.quantity, NEW.quantity);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER auto_reorder_trigger
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    IF NEW.quantity <= NEW.reorder_level THEN
        INSERT INTO orders
        (product_id, quantity_ordered, order_date)
        VALUES
        (NEW.product_id, 50, CURDATE());
    END IF;
END //

DELIMITER ;

UPDATE inventory
SET quantity = 5
WHERE product_id = 1;

SELECT * FROM inventory_audit;

SELECT * FROM orders;
