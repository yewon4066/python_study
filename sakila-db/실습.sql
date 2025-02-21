create database if not exists mydb2;

create table mydb2.exam_tbl (
 a_col int auto_increment primary key,
 b_col varchar (50),  -- 최대 50문자
 c_col int  -- 숫자 사용
);

insert into mydb2.exam_tbl(b_col, c_col) values('1. 자동 입력', 1);
insert into mydb2.exam_tbl(b_col, c_col) values('2. 자동 입력', 2);
insert into mydb2.exam_tbl(b_col, c_col) values('3. 자동 입력', 3);

select * from mydb2.exam_tbl;

insert into mydb2.exam_tbl(b_col, c_col) values('101. 자동 입력', 105);

select * from mydb2.exam_tbl;

insert into mydb2.exam_tbl(a_col,b_col, c_col) values(105,'105. 자동 입력', 105);

select * from mydb2.exam_tbl;

create table mydb2.exam_tbl2 (
 a_col int,
 b_col varchar(50),
 c_col int
);