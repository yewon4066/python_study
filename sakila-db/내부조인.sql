INSERT INTO mydb.exam_collation VALUES ('a', 'a', 'a', 'a');
INSERT INTO mydb.exam_collation VALUES ('b', 'b', 'b', 'b');
INSERT INTO mydb.exam_collation VALUES ('A', 'A', 'A', 'A');
INSERT INTO mydb.exam_collation VALUES ('B', 'B', 'B', 'B');
INSERT INTO mydb.exam_collation VALUES ('*', '*', '*', '*');
INSERT INTO mydb.exam_collation VALUES ('_', '_', '_', '_');
INSERT INTO mydb.exam_collation VALUES ('!', '!', '!', '!');
INSERT INTO mydb.exam_collation VALUES ('1', '1', '1', '1');
INSERT INTO mydb.exam_collation VALUES ('2', '2', '2', '2');

SELECT col_latin1_general_ci FROM mydb.exam_collation ORDER BY col_latin1_general_ci;
SELECT col_latin1_general_cs FROM mydb.exam_collation ORDER BY col_latin1_general_cs;
SELECT col_latin1_bin FROM mydb.exam_collation ORDER BY col_latin1_bin;
SELECT col_latin7_general_ci FROM mydb.exam_collation ORDER BY col_latin7_general_ci;

CREATE TABLE mydb.date_table(
justdate DATE,
justtime TIME,
justdatetime DATETIME,
justtimestamp TIMESTAMP);
INSERT INTO mydb.date_table VALUES (now(), now(), now(), now());
SELECT * FROM mydb.date_table;

use sakila;

SELECT
	a.customer_id, a.store_id, a.first_name, a.last_name, a.email, a.address_id AS a_address_id, 
    b.address_id AS b_address_id, b.address, b.district, b.city_id, b.postal_code, b.phone, b.location
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
WHERE a.first_name = 'ROSA';

SELECT
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id and a.create_date = b.last_update
WHERE a.first_name = 'ROSA';

-- 3개 table inner join
SELECT
	a.customer_id, a.first_name, a.last_name,
    b.address_id, b.address, b.district, b.postal_code,
    c.city_id, c.city
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
    INNER JOIN city AS c ON b.city_id = c.city_id;

