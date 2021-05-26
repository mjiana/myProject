##########################################
drop table myboard;
create table myboard (
	idx int primary key auto_increment,
	name varchar(20),
	email varchar(50),
	title varchar(50),
	pwd varchar(10),
	content varchar(2000),
	wdate date,
	hit int 
) engine=innodb default charset=euckr;

desc myboard;
select * from myboard;
select * from myboard limit 10;
