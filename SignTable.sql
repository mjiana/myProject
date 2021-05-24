drop table mymember;
create table mymember(
	id varchar(20) not null primary key,
	pw varchar(100) not null,
	name varchar(20) not null,
	email varchar(30),
	phone varchar(20) not null,
	address varchar(60),
	trans varchar(30),
	birth varchar(20),
	gender varchar(5)
) engine=innodb default charset=euckr;
desc mymember;
insert into mymember values('aaa',password('aaa'),'aaa',null,'010-0000-0000','서울특별시 강남구','차량',null,null);
insert into mymember values('aa',password('aa'),'aa',null,'010-0000-0000','서울특별시 도봉구','도보',null,null);
insert into mymember values('a1','a1','aaa',null,'010-0000-0000','서울특별시 강남구','차량',null,null);
select * from mymember;
##############################
drop table address;
create table address(
	city char(10) not null,
	district char(10) not null
) engine=myisam default charset=euckr;
# engine=myisam : 입출력 속도 빠름 
# varchar보다 char가 검색속도가 빠르다.

desc address;

select * from address;

select district from address where city like '세종%';

select distinct city from address;
##########################################
#cmd창에서 insert_txt파일 넣기##################################
#위치 이동
#cd C:\java_bigdata\mysql-5.6.51-winx64\bin
#address.txt 위치 재확인
#dir *.txt
#mysql -ujspuser -p jspdb < address.txt 
#Enter password: 1234
# < : 출력방향 지시(zipcode.txt 내용을 jspdb에 넣어라) 
##########################################