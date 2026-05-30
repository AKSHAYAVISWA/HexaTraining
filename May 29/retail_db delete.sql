
set sql_safe_updates=0;

DELETE FROM customers
WHERE city = 'Banglore';

set sql_safe_updates=1;
