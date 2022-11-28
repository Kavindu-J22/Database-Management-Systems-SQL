create table emp(
	eid int primary key,
	ename varchar(30) not null,
	age int,
	salary real,
)

alter table emp add constraint emp_sal_chk check(salary>0)

create table dept(
	did varchar(20),
	budget real,
	managerID int references emp,
	primary key(did)
)

create table works(
	eid integer,
	did varchar(20),
	pct_time integer,
	constraint works_pk primary key(eid,did),
	constraint works_emp_fk foreign key(eid)references emp,
	constraint works_dept_fk foreign key(did)references dept
)

insert into emp values(1000,'Ruwan',33,40000)

Select * from emp;

alter table emp add hiredate date default getdate()
insert into emp(eid,ename,salary)values(1001,'Bhagya',35000)

update emp set hiredate='1-Jan-2010' where eid=1000

delete emp where eid = 1000

alter table emp drop constraint DF__emp__hiredate__34C8D9D1
alter table emp drop column hiredate

insert into works values(1000,'Admin',40)
insert into works values(1000,'ITSD',50)
insert into works values(1001,'Admin',100)
insert into works values(1002,'Academic',100)
insert into works values(1003,'Admin',20)
insert into works values(1003,'Academic',30)
insert into works values(1003,'ITSD',45)
insert into works values(1004,'Admin',60)
insert into works values(1004,'Finance',30)
insert into works values(1006,'Finance',45)
insert into works values(1006,'Maintenance',52)
insert into works values(1008,'Maintenance',30)
insert into works values(1008,'ITSD',30)
insert into works values(1008,'Finance',35)
insert into works values(1009,'Admin',100)


update emp set age=26 where eid=1001

