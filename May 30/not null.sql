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
