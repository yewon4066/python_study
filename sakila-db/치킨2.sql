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

INSERT INTO MENU (메뉴, 가격, 포장시간)
VALUES ('레몬크림치킨',11000,'2025-02-21'), ('허니버터치킨',13000,'2025-02-21'), ('마라치킨',14000,'2025-02-21');

select * from yewon.MENU;

-- 데이터 수정
-- WHERE 절 생략 가능하지만 전체 데이터를 수정함

update MENU SET 메뉴 = '청양마라치킨'
WHERE 가격 = 14000;

select * from yewon.MENU;

-- WHERE 절 생략으로 데이터 변경
UPDATE MENU SET 포장시간 = '2025-02-19';

select * from yewon.MENU;

