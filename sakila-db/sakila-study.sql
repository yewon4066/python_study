use sakila;

select *
from actor
where first_name = 'Fay'
order by actor_id desc;

select count(*)
from sakila.customer;

select *
from sakila.customer;

show columns from sakila.customer;

select *
from sakila.customer
where first_name = 'MARIA';

select *
from sakila.customer
where address_id < 200;

select *
from sakila.customer
where first_name < 'MARIA'
order by first_name asc;

select *
from payment
where payment_date ='2005-06-15 21:08:46';

select *
from payment
where payment_date < '2005-07-05';

select *
from sakila.customer
where (address_id between 1 and 10)
or (address_id between 20 and 30);

select *
from sakila.payment
where payment_date between '2005-06-17 00:00:00.000' and '2005-07-19 00:00:00.000';

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
where first_name in ('MARIA','LINDA','NANCY');

select *
from city
where country_id = 103 or country_id =86
and city in ('Cheju','Sunnyvale','Dallas');

select *
from city
where country_id in (103,86)
and city in ('Cheju','Sunnyvale','Dallas');

select * from sakila.address;

select * from sakila.address
where address2 = NULL;

select * from sakila.address
where address2 = ' ';

select * from sakila.customer 
order by last_name;

select * from sakila.customer 
order by first_name, last_name;

select * from sakila.customer 
order by first_name,store_id;

select * from sakila.customer 
order by first_name desc;