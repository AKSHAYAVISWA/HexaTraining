
set sql_safe_updates=0; 

update customers 
set city = 'Chennai'
where customer_id = 1;

set sql_safe_updates=1; 
