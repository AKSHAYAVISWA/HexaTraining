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

