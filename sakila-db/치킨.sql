create database yewon;
use yewon;

create table kitchen (
순번 INT,
예약번호 VARCHAR(50),
예약시간 DATETIME
);

CREATE TABLE MENU (
메뉴 VARCHAR(50),
가격 INT,
포장시간 DATETIME
);

INSERT INTO MENU (메뉴, 가격, 포장시간) VALUES ('핫크리스피치킨',9000,'2025-02-20');

select * from yewon.MENU;

INSERT INTO MENU VALUES ('매콤간장치킨',8000,'2025-02-20');

select * from yewon.MENU;

Insert into MENU (메뉴,가격) values ('겁나비싼치킨', 12000);

select * from yewon.MENU;