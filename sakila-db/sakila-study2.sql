select * from sakila.city where country_id = 103;

select * from sakila.city
where country_id = 86 and city in ('Cheju', 'Sunnyvale','Dallas');

select *
from city
where (country_id = 103 or country_id =86)
and city in ('Cheju','Sunnyvale','Dallas');

select * from sakila.customer 
order by store_id DESC, first_name ASC limit 10;

select * from sakila.customer 
order by customer_id asc limit 50, 10;

select * from sakila.customer 
order by customer_id asc limit 10 OFFSET 100;

select * 
from sakila.customer 
where first_name like 'A%';

select * 
from sakila.customer 
where first_name like '%A';

select * 
from sakila.customer 
where first_name like '%A%';

with CTE(col_1) as (
	select 'A%BC' union all
    select 'A_BC' union all
    select 'ABC'
)
select * from CTE
where col_1 like '%#%%' escape '#';

with CTE(col_1) as (
	select 'A%BC' union all
    select 'A_BC' union all
    select 'ABC'
)
select * from CTE
where col_1 like '%!%%' escape '!';

create table sakila.exam_tbl (
	exam_col varchar(50)
);

insert into exam_tbl values('A%BC');
insert into exam_tbl values('A_BC');
insert into exam_tbl values('ABC');

select * from sakila.exam_tbl;

select * from sakila.exam_tbl
where exam_col like '%#%%' escape '#';

select * from sakila.exam_tbl
where exam_col like '%!%%' escape '!';

select *
from sakila.customer
where first_name like 'A__';

select *
from sakila.customer
where first_name like '__A';

select *
from sakila.customer
where first_name like 'A__A';

select *
from sakila.customer
where first_name like '______';

select *
from sakila.customer
where first_name like 'A_R%';

select *
from sakila.customer
where first_name like '__R%';

select *
from sakila.customer
where first_name like 'A%R';

select *
from sakila.customer
where first_name REGEXP '^K|N$';

select *
from sakila.customer
where first_name REGEXP 'K[L-N]';

select *
from sakila.customer
where first_name REGEXP 'K[^L-N]';

select *
from sakila.customer
where first_name like 'S%' and first_name REGEXP 'A[L-N]';

select *
from sakila.customer
where first_name like '_______'
and first_name REGEXP 'A[L-N]'
AND first_name REGEXP 'O$';

select rating from sakila.film
group by rating;

select special_features, rating
from sakila.film;

select rating, special_features
from sakila.film
group by rating, special_features;

select special_features, COUNT(*) as cnt
from sakila.film
group by special_features;

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating
order by special_features, rating, cnt;

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by rating;

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating
having rating = 'G';

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating
having special_features = 'Trailers' and rating = 'G';

select special_features, COUNT(*) as cnt
from sakila.film
group by special_features
having cnt > 70;

select special_features, COUNT(*) as cnt
from sakila.film
group by special_features
having rating = 'G';

select special_features, COUNT(*) as cnt
from sakila.film
group by special_features, rating
having rating = 'R' and cnt > 7;

-- DISTINCT 문은 GROUP BY와 같은 결과를 출력
select distinct special_features, rating
from sakila.film;

-- DISTINCT 문에 count(*) 실행 결과 ?
-- 데이터의 중복은 제거를 해주지만 count(*)는 실행 할 수 없다.
select Distinct special_features, rating, count(*) as cnt
from sakila.film;

-- 테이블 생성 및 조작하기

drop database mydb;

create database if not exists mydb;

create table mydb.exam_tbl (
a_col int auto_increment primary key,
b_col varchar(50),  -- 50자의 문자
c_col int
);

insert into mydb.exam_tbl(b_col, c_col) values('1. 자동 입력', 1);
insert into mydb.exam_tbl(b_col, c_col) values('2. 자동 입력', 2);
insert into mydb.exam_tbl(b_col, c_col) values('3. 자동 입력', 3);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(a_col, b_col, c_col) values(4, '3. 자동입력',3);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(a_col, b_col, c_col) values(30, '30. 자동입력',30);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(b_col, c_col) values('7. 자동입력',7);

select * from mydb.exam_tbl;

CREATE TABLE mydb.exam_tbl2 (
    a_col INT,
    b_col VARCHAR(50),
    c_col INT
);

use mydb;

select last_insert_id();

-- exam_tbl primary index 값 변경 
alter table mydb.exam_tbl auto_increment =100;

insert into mydb.exam_tbl(b_col, c_col) values('101. 자동 입력', 101);

select * from mydb.exam_tbl;

---- AUTO_INCREMENT 증가값을 5로 변경
set @@auto_increment_increment = 5;

insert into mydb.exam_tbl(b_col, c_col) values('101. 자동 입력', 105);

select * from mydb.exam_tbl;


-- 신규 테이블 생성 하면서 삭제?
delete from mydb.exam_tbl2;
select * from mydb.exam_tbl2;

create table mydb.exam_tbl3
as (select * from mydb.exam_tbl);

select * from mydb.exam_tbl3;

-- 기존 테이블에 데이터 복사하기 
insert into mydb.exam_tbl2
select * from mydb.exam_tbl;

select * from mydb.exam_tb2;


-- parent와 child를  연결 하는 외래키 생성 후 데이터 입력하기alter
create table mydb.exam_parent 
(a_col int primary key);

create table mydb.exam_child
(a_col int);

alter table mydb.exam_child
add foreign key(a_col) 
references mydb.exam_parent(a_col);

-- mydb.exam_parent에 데이터가 없어서 exam_child에 데이터를 입력할 수 없음
insert into exam_child values(1);

-- mydb.exam_parent에 데이터 입력 후
-- mydb.exam_child에 데이터 입력 가능
insert into mydb.exam_parent values(1);
insert into mydb.exam_child values(1);

select * from mydb.exam_parent;
select * from mydb.exam_child;


