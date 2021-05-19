drop table address;
create table address(
	city char(10) not null,
	district char(5) not null
) engine=myisam default charset=euckr;
# engine=myisam : 입출력 속도 빠름 
# varchar보다 char가 검색속도가 빠르다.

desc address;

select * from address;

select district from address where city = '서울특별시';

select distinct city from address;