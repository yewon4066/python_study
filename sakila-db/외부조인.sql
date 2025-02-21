---- 외부 조인(outer join)
select a.address, a.address_id as a_address_id, 
       b.address_id as b_address_id
from address as a
	left outer join store as b on a.address_id = b.address_id;

---- 외부 조인(outer join)
-- outer join left
select a.address, a.address_id as a_address_id, 
       b.address_id as b_address_id, b.store_id
from address as a
	left outer join store as b on a.address_id = b.address_id
where b.address_id is Null;

------ 외부 조인(outer join)
-- outer join right
select a.address, a.address_id as a_address_id, 
       b.address_id as b_address_id, b.store_id
from address as a
	right outer join store as b on a.address_id = b.address_id;

------ 외부 조인(outer join)
-- outer join full (MySQL에서 지원하지 않음) LEFT join과 RIGHT 조인 결과를 합한 것과 동일
-- ***유니온 사용***
select a.address, a.address_id as a_address_id, 
       b.address_id as b_address_id, b.store_id
from address as a
	left outer join store as b on a.address_id = b.address_id
    where b.address_id is Null
    
union

select a.address, a.address_id as a_address_id, 
       b.address_id as b_address_id, b.store_id
from address as a
	right outer join store as b on a.address_id = b.address_id
    where a.address_id is Null;
    
    
    
    
    
    