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