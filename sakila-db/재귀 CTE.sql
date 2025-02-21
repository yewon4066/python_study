-- 재귀 CTE (  앵커 멤버와 재귀 멤버 )
use sakila;
-- CTE를 활용한 피보나치 수열 만들기
WITH RECURSIVE fibonacci_number (n, fibonacci_n, next_fibonacci_n)
AS(
 SELECT 1, 0, 1
 UNION ALL
 SELECT n + 1, next_fibonacci_n, fibonacci_n + next_fibonacci_n
 FROM fibonacci_number WHERE n < 20
)
SELECT * FROM fibonacci_number;

-- SQL function(함수)
-- 문자열 함수 concat

-- 문자열을 한문장으로 표현해줌
select concat('나는', '당신을', '사랑합니다') as a_col;

select concat(first_name, ' ', last_name) as 고객명 from customer;

select concat(first_name, ' ', last_name,' ', email) as 고객명 from customer;

-- 컬럼과 CONCAT_WS를 사용하면 컬럼과 컬럼사이에 구분자를 넣을 수 있음
select concat_ws(',', first_name, last_name,email ) as 고객정보 from customer;

-- NULL 시작 컬럼으로 구성할 경우 전체 컬럼이 NULL로 변경
select concat_ws(NULL, first_name, last_name,email ) as 고객정보 from customer;
-- 컬럼과 컬럼 사이의 NULL 값은 무시됨
select concat_ws(',', first_name,NULL, last_name,email ) as 고객정보 from customer;

-- 데이터 형 변환 함수 (CAST, CONVERT)
-- CAST 함수를 사용해서 문자열 '2' 를 부호없는 정수형 2로 변경
select 4 / '2', 4 / 2, 4 / cast('2' as unsigned) as 정수변환;

select now();

-- cast 함수로 날짜형을 숫자형으로 변경
select cast(now() as signed);

-- cast 함수로 숫자형을 날짜형으로 변경
select cast(20250221 as date) as date;

-- cast 함수로 숫자형을 문자열로 변경
select cast(20250221 as char) as xchar;

-- cast > convert 함수로 날짜형을 숫자형으로 변경
select convert(now(), signed);

-- cast > convert 함수로 숫자형을 날짜형으로 변경
select convert(20250221, date) as xdate;

-- cast > convert 함수로 숫자형을 문자열로 변경
select convert(20250221, char) as xchar;

-- cast > convert 함수로 숫자형을 문자열로 변경 : 문자열 크기를 선택 가능
select convert(20250221, char(6)) as xchar;

-- 매우 큰 숫자를 선택해서 메모리 오버 플로우
select 9223372036854775807 + 1;

select cast(9223372036854775807 as unsigned) + 1;

select convert(9223372036854775807, unsigned) + 1;

-- NULL을 대체 하는 함수 - IFNULL, COALESCE
create table tbl_null(
	a_col int,
    b_col varchar(10),
    c_col varchar(10),
    d_col varchar(10),
    e_col varchar(10)
);

insert into tbl_null values(1, NULL, 'c_col', 'd_col', 'e_col');
insert into tbl_null values(2, NULL, NULL, NULL, 'e_col');
insert into tbl_null values(3, NULL, NULL, NULL, NULL);

select * from tbl_null;

-- IFNULL 함수로 b_col 열의 NULL값을 ''로 대체
select a_col, ifnull(b_col, '') as b_col, c_col, d_col, e_col
from tbl_null 
where a_col = 1;

-- IFNULL 함수로 b_col 열의 NULL값을 c_col로 대체
select a_col, ifnull(b_col, c_col) as b_col, c_col, d_col, e_col
from tbl_null 
where a_col = 1;

-- coalesce 함수로 null을 다른 데이터로 대체; 마지막 인가에 데이터가 있는 경우
select a_col, coalesce(b_col, c_col, d_col, e_col)
from tbl_null
where a_col = 2;

select a_col, coalesce(b_col, c_col, d_col, e_col)
from tbl_null
where a_col = 3;

-- 영문 소문자 혹은 대문자로 변경하는 함수
-- LOWER 함수는 소문자로, UPPER 함수는 대문자로 변경
select 'Do it, RUN', lower('Do it, RUN'), upper ('Do it, Run');

select email, lower(email), upper(email) from customer;

-- 공백을 제거하는 함수 - LTRIM, RTRIM, TRIM
-- LTRIM 함수로 왼쪽의 공백을 제거
select '   Do it , RUN  'as a, LTRIM('   Do it , RUN  ')as b;
-- RTRIM 함수로 왼쪽의 공백을 제거
select '   Do it , RUN          'as a, RTRIM('   Do it , RUN            ')as b;
-- TRIM 함수로 왼쪽의 공백을 모두 제거
select '   Do it , RUN          'as a, TRIM('   Do it , RUN            ')as b;

-- TRIM 함수로 왼쪽의 '#'을 모두 제거
select '###Do i#t## , ##RU##N#!'as a, TRIM(BOTH '#' FROM '###Do i#t## , ##RU##N#!')as b;

-- 문자열 크기 또는 개수를 반환하는 함수 - LENGTH, CHAR_LENGTH
-- LENGTH 함수로 문자열의 크기 반환
select length('Do it! Run'), length('두잇런');

-- 영어 및 공백은 1 byte, 한글과 한자는 3 byte, 특수문자는 3 byte
select length ('A'), length('강'), length('家'), length('☎'), length(' ');

-- CHAR_LENGTH 함수로 문자열의 크기 반환
select char_length('Do it! Run'), CHAR_length('두잇런');

-- 데이터에서 LENGTH, CHAR_LENGTH 비교
select first_name, length(first_name), char_length(first_name) from customer;

-- 특정 문자까지 문자열의 길이를 반환하는 함수 - position
-- 탐색하고자 하는 문자가 없으면 0 반납
select 'Do it! RUN', position('#' in 'Do it!, RUN');

-- 탐색하고자 하는 문자가 있으면 위치를 반납
select 'Do it! RUN', position('!' in 'Do it!, RUN');
