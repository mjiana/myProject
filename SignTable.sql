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
insert into mymember values('aaa',password('aaa'),'aaa',null,'010-0000-0000','����Ư���� ������','����',null,null);
insert into mymember values('aa',password('aa'),'aa',null,'010-0000-0000','����Ư���� ������','����',null,null);
insert into mymember values('a1','a1','aaa',null,'010-0000-0000','����Ư���� ������','����',null,null);
##############################
drop table address;
create table address(
	city char(10) not null,
	district char(5) not null
) engine=myisam default charset=euckr;
# engine=myisam : ����� �ӵ� ���� 
# varchar���� char�� �˻��ӵ��� ������.

desc address;

select * from address;

select district from address where city = '����Ư����';

select distinct city from address;