-- 교차 조인 (cross join)
create table mydb.table_a( num int );
create table mydb.table_b( name varchar (50) );
insert into mydb.table_a values (101), (102), (103); -- insert 3번 사용과 동일
insert into mydb.table_b values
('홍길동'),
('이순신'),
('강감찬');

select * from mydb.table_a;
select * from mydb.table_b;

-- insert into mydb.table_a values (101);
-- insert into mydb.table_a values (102);
-- insert into mydb.table_a values (103);

select a.num, b.name
from mydb.table_a as a
	cross join mydb.table_b as b
order by a.num;

select a.num, b.name
from mydb.table_a as a
	cross join mydb.table_b as b
where a.num = 101;

-- Self join (같은 테이블 별칭을 부여해서 Join 하는 방법)

select a.customer_id, b.customer_id
from sakila.customer as a
	inner join sakila.customer as b
		on a.customer_id = b.customer_id;
        
select a.customer_id as a_cutomer_id,
       b.customer_id as b_customer_id
from sakila.customer as a
	inner join sakila.customer as b
		on a.customer_id = b.customer_id;
        
select a.payment_id, a.amount,
	   b.payment_id, b.amount,
       b.amount - a.amount as profit_amount
from sakila.payment as a
	left outer join sakila.payment as b
    on a.payment_id = b.payment_id -1;
    
SELECT a.payment_id, a.amount,  -- 첫 번째 테이블(a)의 payment_id와 amount
       b.payment_id, b.amount,  -- 두 번째 테이블(b)의 payment_id와 amount
       b.amount - a.amount AS profit_amount  -- 두 개의 amount 차이를 계산하여 profit_amount 생성
FROM sakila.payment AS a  -- 첫 번째 테이블 a
LEFT OUTER JOIN sakila.payment AS b  -- 같은 테이블을 다시 사용하여 b로 조인
    ON a.payment_id = b.payment_id - 1;  -- a의 payment_id가 b의 payment_id보다 1 작은 경우 매칭



