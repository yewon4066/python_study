use sakila;

-- except 문으로 cte 결합해보기
    
SELECT customer_id, first_name, email
FROM customer
WHERE customer_id >= 10 AND customer_id <= 15

SELECT customer_id, first_name, email
FROM customer
WHERE customer_id >= 12 AND customer_id <= 20

-- except 문으로 CTE 결합 1 예제
WITH cte_customer(customer_id, first_name, email) 
AS
(
	select customer_id, first_name, email
	from customer
	where customer_id >= 10 and customer_id <= 15
	EXCEPT
	select customer_id, first_name, email
	FROM customer
	WHERE customer_id >= 12 AND customer_id <= 20
)
select * from cte_customer;
