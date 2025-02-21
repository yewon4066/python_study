select *
from sakila.actor
where first_name = 'FAY'
order by actor_id desc;

select count(*)
from sakila.customer;

select first_name
from sakila.customer;

select last_name, first_name 
from sakila.customer;

select *
from sakila.customer;

show columns from sakila.customer;

select * 
from sakila.customer
where first_name = 'MARIA';

select * 
from sakila.customer
where address_id > 200;

select * 
from sakila.customer
where first_name < 'MARIA';

select *
from payment
where payment_date = '2005-08-21 13:24:32';

select *
from payment
where payment_date < '2005-07-05';


select * 
from sakila.customer
where (address_id between 5 and 10) or (address_id between 20 and 30);

select * 
from sakila.payment
where payment_date between '2005-06-17' and '2005-07-19';

select * 
from sakila.customer
where first_name between 'M' and 'O';

select * 
from sakila.customer
where first_name not between 'M' and 'O';

select * 
from sakila.city
where city = 'Sunnyvale' and country_id = 103;

select * 
from sakila.payment
where payment_date >= '2005-06-17' and payment_date <= '2005-07-19';

select * 
from sakila.customer
where first_name = 'MARIA' or first_name = 'LINDA';

select * 
from sakila.customer
where first_name = 'MARIA' or first_name = 'LINDA' or first_name = 'NANCY';

select * 
from sakila.customer
where first_name in ('MARIA', 'LINDA', 'NANCY');

select * 
from city
where country_id = 103 or country_id = 86
and city in ('Cheju', 'Sunnyvale', 'Dallas');

select * 
from city
where country_id in (103, 86)
and city in ('Cheju', 'Sunnyvale', 'Dallas');

select * from sakila.address;

select * from sakila.address
where address2 = NULL;

select * from sakila.address
where address2 is NULL;

select * from sakila.address
where address2 is not NULL;

select * from sakila.address
where address2 = '';


select * 
from sakila.customer 
order by first_name;

select * 
from sakila.customer 
order by last_name;

select * 
from sakila.customer 
order by first_name, last_name;


select * 
from sakila.customer 
order by store_id, first_name;

select * 
from sakila.customer 
order by first_name, store_id;

select * 
from sakila.customer 
order by first_name  DESC;

select * 
from sakila.customer 
order by store_id DESC, first_name ASC;

select * 
from sakila.customer 
order by store_id DESC, first_name ASC limit 10;

select * 
from sakila.customer 
order by customer_id asc limit 50, 10;

select * 
from sakila.customer 
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

select * 
from sakila.customer 
where first_name like 'AM%';

select * 
from sakila.customer 
where first_name like '%RA';

select * 
from sakila.customer 
where first_name NOT like '%A';

with CTE(col_1) as (
 select 'A%BC' union all
 select 'A_BC' union all
 select 'ABC'
)
select * from CTE;

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
where first_name like '_____';

select * 
from sakila.customer 
where first_name like 'A_R%';

select * 
from sakila.customer 
where first_name like '__R%';

select * 
from sakila.customer 
where first_name like 'A%R_';


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
and first_name REGEXP 'O$';

select special_features 
from sakila.film
group by special_features;

select rating 
from sakila.film
group by rating;

select special_features, rating 
from sakila.film
group by special_features, rating;

select  rating, special_features
from sakila.film
group by rating, special_features;

select special_features, COUNT(*) as cnt 
from sakila.film
group by special_features;


select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating
order by special_features, rating;

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features;


select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating;

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

select special_features, rating, COUNT(*) as cnt
from sakila.film
group by special_features, rating
having rating = 'R' and cnt > 7;

-- DISTIONCT 문은 Group by와 같은 결과를 출력
select DISTINCT special_features, rating
from sakila.film;

-- DISTIONCT 문에 count(*) 실행 결과 ?
-- 데이터의 중복은 제거를 해주지만 count(*)를 실행 할 수 없다. - group by 사용 권장
select DISTINCT special_features, rating, count(*) as cnt
from sakila.film;

-- 테이블 생성 및 조작하기

drop database mydb;

create database if not exists mydb;

create table mydb.exam_tbl (
 a_col int auto_increment primary key,
 b_col varchar(50),
 c_col int
);

insert into mydb.exam_tbl(b_col, c_col) values('1. 자동입력', 1);
insert into mydb.exam_tbl(b_col, c_col) values('2. 자동입력', 2);
insert into mydb.exam_tbl(b_col, c_col) values('3. 자동입력', 3);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(a_col, b_col, c_col) values(4, '3. 자동입력', 3);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(a_col, b_col, c_col) values(30, '30. 자동입력', 30);

select * from mydb.exam_tbl;

insert into mydb.exam_tbl(b_col, c_col) values('7. 자동입력', 7);

select * from mydb.exam_tbl;


create table mydb.exam_tbl2 (
 a_col int,
 b_col varchar(50),
 c_col int
);

use mydb;

select last_insert_id();

-- exam_tbl primary index 값 변경
alter table mydb.exam_tbl auto_increment = 100;

insert into mydb.exam_tbl(b_col, c_col) values('101. 자동입력', 101);

select * from mydb.exam_tbl;

select last_insert_id();

-- AUTO_INCREMENT 증가값을 5로 변경
set @@auto_increment_increment = 5;

insert into mydb.exam_tbl(b_col, c_col) values('105. 자동입력', 105);
select * from mydb.exam_tbl;

insert into mydb.exam_tbl(b_col, c_col) values('105. 자동입력', 105);
select * from mydb.exam_tbl;

-- 신규 table 생성하면서 복사후 저장할 테이블 공간 비우기
delete from mydb.exam_tbl2;
select * from mydb.exam_tbl2;

create table mydb.exam_tbl3
as (select * from mydb.exam_tbl);

select * from mydb.exam_tbl3;

-- 기본 테이블에 데이터 복사하기
delete from mydb.exam_tbl2;

insert into mydb.exam_tbl2 
select * from mydb.exam_tbl; 

select * from mydb.exam_tbl2;


-- parent와 chaild를 연결하는 외래키 생성후 데이터 입력하기
drop table mydb.exam_child;
drop table mydb.exam_parent;

create table mydb.exam_parent 
(a_col int primary key);

create table mydb.exam_parent 
(a_col int,
 b_col int);

create table mydb.exam_child
(a_col int);

alter table mydb.exam_child 
add foreign key(a_col) 
references mydb.exam_parent(a_col);

-- mydb.exam_parent에 데이터가 없어서 exam_child 데이터를 입력할 수 없음
insert into exam_child values(1);

-- mydb.exam_parent에 데이터 입력후
-- mydb.exam_child에 데이터 입력 가능
insert into mydb.exam_parent values(1);
insert into exam_child values(1,1);
insert into exam_child values(2,1);

select * from mydb.exam_parent;
select * from mydb.exam_child;

delete from mydb.exam_parent
where a_col=1;

delete from mydb.exam_child
where a_col=2;

delete from mydb.exam_child
where a_col=1;

select * from mydb.exam_child;

delete from mydb.exam_parent
where a_col=1;

select * from mydb.exam_parent;
select * from mydb.exam_child;

drop table mydb.exam_parent;

drop table mydb.exam_child;
drop table mydb.exam_parent;

-- 외래키로 연결되어있는 테이블 상태 확인alter
show create table mydb.exam_child;

alter table mydb.exam_child
drop constraint exam_child_ibfk_1;

show create table mydb.exam_child;

drop table mydb.exam_child;
drop table mydb.exam_parent;


-- MYSQL 데이터 유형 정리하기
-- 정수형(int), 실수 (float)

-- 실수형 데이터가 있는 table table 생성해서 초월하기
create table mydb.exam_float ( a_col float );

insert into mydb.exam_float values(0.7);

select * from mydb.exam_float where a_col = 0.7;

select * from mydb.exam_float;

-- 유형 문자열의 크기
create table mydb.exam_char_varchar (
	a_col char(5),
	b_col varchar(5)
);

insert into mydb.exam_char_varchar values('12345','12345');
insert into mydb.exam_char_varchar values('ABCDE','ABCDE');
insert into mydb.exam_char_varchar values('가나다라마','가나다라마');
insert into mydb.exam_char_varchar values('HELLO','안녕하세요');

select 
a_col, char_length(a_col) as char_length, length(a_col) as char_byte,
b_col, char_length(b_col) as char_length, length(b_col) as char_byte
from mydb.exam_char_varchar;

-- 사용하는 문자 집합 확인 
show character set;

CREATE TABLE mydb.exam_collation (
col_latin1_general_ci VARCHAR(10) COLLATE latin1_general_ci,
col_latin1_general_cs VARCHAR(10) COLLATE latin1_general_cs,
col_latin1_bin VARCHAR(10) COLLATE latin1_bin,
col_latin7_general_ci VARCHAR(10) COLLATE latin7_general_ci
);

INSERT INTO mydb.exam_collation VALUES ('a', 'a', 'a', 'a');
INSERT INTO mydb.exam_collation VALUES ('b', 'b', 'b', 'b');
INSERT INTO mydb.exam_collation VALUES ('A', 'A', 'A', 'A');
INSERT INTO mydb.exam_collation VALUES ('B', 'B', 'B', 'B');
INSERT INTO mydb.exam_collation VALUES ('*', '*', '*', '*');
INSERT INTO mydb.exam_collation VALUES ('_', '_', '_', '_');
INSERT INTO mydb.exam_collation VALUES ('!', '!', '!', '!');
INSERT INTO mydb.exam_collation VALUES ('1', '1', '1', '1');
INSERT INTO mydb.exam_collation VALUES ('2', '2', '2', '2');
