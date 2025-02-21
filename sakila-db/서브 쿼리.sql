-- 쿼리 안에 또 다른 쿼리, 서브 쿼리
-- insert into mydb.table_a values (101), (102), (103),

-- 단일행 서브 쿼리 사용하기
select * from mydb.table_a
where num in (101, 102);


select * from mydb.table_a
where num = (
	select * from mydb.table_a
    where num = 101
);

-- 여러개 행 서브 쿼리 사용하기
select * from mydb.table_a
where num in (
	select * from mydb.table_a
);

select * 
from sakila.customer
where customer_id =
 (select customer_id
  from sakila.customer
  where first_name ='ROSA'
 );

-- 위의 괄호와
-- select * 
-- from sakila.customer
-- where customer_id = 112 와 같다

-- 다중행 서브 쿼리 사용하기

-- in, '=' 에 따라 달라짐
select * 
from sakila.customer
where customer_id in
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA', 'ANA')
  );
  
SELECT
 a.film_id, a.title
FROM sakila.film AS a
 INNER JOIN sakila.film_category AS b ON a.film_id = b.film_id
 INNER JOIN sakila.category AS c ON b.category_id = c.category_id
WHERE c.name = 'Action';

SELECT film_id, title
FROM sakila.film
where film_id in (
	select a.film_id
    from sakila.film_category AS a 
		INNER JOIN sakila.category AS b 
        ON a.category_id = b.category_id
		WHERE b.name = 'Action'
	);

select a.film_id
from sakila.film_category AS a 
	INNER JOIN sakila.category AS b 
	ON a.category_id = b.category_id
	WHERE b.name = 'Action' ;

SELECT film_id, title
FROM sakila.film
where film_id = any (
	select a.film_id
    from sakila.film_category AS a 
		INNER JOIN sakila.category AS b 
        ON a.category_id = b.category_id
		WHERE b.name = 'Action'
	);
    
select * 
from sakila.customer
where customer_id = any
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA', 'ANA')
  );
  
select * 
from sakila.customer
where customer_id < any
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA', 'ANA')
  );
  
select * 
from sakila.customer
where customer_id > ANY -- 113, 181
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA', 'ANA')
  );
  
  
select * 
from sakila.customer
where exists    -- 결과값이 하나라도 있는지 확인 True, False 판단 (True이면 본 문장 수행)
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA', 'ANA')
  );
  
select * 
from sakila.customer
where exists    -- 결과값이 하나라도 있는지 확인 True, False 판단 (False이면 결과값이 없음)
 (select customer_id
  from sakila.customer
  where first_name in ('Kimu')
  );
  
select * 
from sakila.customer
where not exists    -- 결과값이 하나라도 있는지 확인 True, False 판단 (False이면 본 문장 수행)
 (select customer_id
  from sakila.customer
  where first_name in ('Kimu')
  );
  
select * 
from sakila.customer
where customer_id = all -- CUSTOMER_ID = 'ROSA' AND CUSTOMER_ID ='ANA'로 조회한 것과 같음
-- =ALL로 되어있는데 결과는 2개라서 값이 나오지 않음
 (select customer_id
  from sakila.customer
  where first_name in ('ROSA','ANA')
  );

-- FROM SUB QUERY 사용 ( inline View )

use sakila;

select b.film_id, c.name
	from film_category AS b
		INNER JOIN category AS c
			on b.category_id = c.category_id
	WHERE b.film_id > 10 AND b.film_id < 20;

SELECT
	a.film_id, a.title, a.special_features, x.name
FROM film AS a
	INNER JOIN
		( select b.film_id, c.name
		from film_category AS b
			INNER JOIN category AS c
				on b.category_id = c.category_id
		WHERE b.film_id > 10 AND b.film_id < 20) as x
    on a.film_id = x.film_id;

-- 공통 테이블 표현식 (Common Table Express) : 임시 테이블 생성 사용
with cte_customer(customer_id, first_name, email)
as
(
 select customer_id, first_name, last_name, email
 from customer
 where customer_id >= 10 and customer_id < 100
)
select * from cte_customer
where customer_id=70;

-- CTE 정의한 column과 select 문에서 조회한 column 다르면 Error 발생

with cte_customer(customer_id, first_name, email)
as
(
 select customer_id, first_name, last_name, email
 from customer
 where customer_id >= 10 and customer_id < 100
)
select * from cte_customer

-- union 문으로 CTE 결합해보기
with cte_customer(customer_id, first_name, email) as (
	select customer_id, first_name, email
	from customer
	where customer_id >= 10 and customer_id <= 15
	union
	select customer_id, first_name, email
	from customer
	where customer_id >= 25 and customer_id <= 30
)
select * from cte_customer;


WITH cte_customer(customer_id, first_name, email) AS (
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 10 AND customer_id <= 15
    UNION
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 25 AND customer_id <= 30
)
SELECT * FROM cte_customer;


with cte_customer(customer_id, first_name, email)
as
(
 select customer_id, first_name, email
 from customer
 where customer_id >= 10 and customer_id <= 15
 union
 select customer_id, first_name, email
 from customer
 where customer_id >= 25 and customer_id <= 30
)
select * from cte_customer;

WITH cte_customer(customer_id, first_name, email) AS (
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 10 AND customer_id <= 15
    intersect
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 12 AND customer_id <= 30
)
SELECT * FROM cte_customer;

WITH cte_customer(customer_id, first_name, email) AS (
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 10 AND customer_id <= 15
    union all
    SELECT customer_id, first_name, email
    FROM customer
    WHERE customer_id >= 12 AND customer_id <= 30
)
SELECT * FROM cte_customer;
