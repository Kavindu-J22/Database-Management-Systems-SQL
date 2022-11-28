create table student(
id int primary key,
name varchar(50),
NIC char(15) unique,
GPA float
)

select * from student

create table emp
(
	eid integer primary key,
	ename varchar(25),
	age int,
	salary float
)

insert into emp values(1000,'Lakmal',33,90000)
insert into emp values(1001,'Nadeeka',24,28000)
insert into emp values(1002,'Amila',26,35000)
insert into emp values(1003,'Nishani',28,60000)
insert into emp values(1004,'Krishan',36,95000)
insert into emp values(1005,'Surangi',37,22000)
insert into emp values(1006,'Shanika',24,18000)
insert into emp values(1007,'Amali',21,20000)
insert into emp values(1008,'Charith',28,35000)
insert into emp values(1009,'Prasad',40,95000)

create table dept
(
did char(12) primary key,
budget float,
managerId int foreign key references emp
)

insert into dept values('Academic',900000,1002)
insert into dept values('Admin',120000,1000)
insert into dept values('Finance',3000000,1008)
insert into dept values('ITSD',4500000,1000)
insert into dept values('Maintenance',40000,1004)
insert into dept values('SESD',20000,1004)
insert into dept values('Marketing',90000,1008)

create table works
(
eid int foreign key references emp,
did Char(12) foreign key references dept,
pct_time int,
primary key(eid,did)
)

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

create table newone(
id int primary key,
name varchar(10)
)

alter table newone add age int

select * from newone

alter table newone add constraint chk_ag check (age>18)

insert into newone values(100,'kavindu',19)

alter table newone drop column age

alter table newone drop constraint chk_ag

drop table newone

insert into newone(id,name)values(100,'kavi')
insert into newone(id,name)values(101,'pasi')

delete newone where id=101

update newone 
set id = 1000
where id = 100

alter table newone add age int null
alter table newone drop column age


select Sname
from Student
where Sname like 'A%'

select * from Student


select SID
from Student
where cid is null

select distinct cid
from Student
where cid like 'c%'

select * from emp

select eid,salary
from emp 
where salary between 15000 and 20000


select ename,salary
from emp
order by salary desc


select * from emp
select * from dept
select * from works


select e.ename,d.budget,d.did
from emp e,dept d
where e.eid = d.managerId 
order by d.budget desc


select e.ename,d.budget,d.did
from emp e inner join dept d on
e.eid = d.managerId
where e.ename like 'A%'
order by d.budget desc


select e.ename,w.pct_time
from emp e left outer join works w  on
						e.eid = w.eid

select e.ename,d.did
from emp e right outer join dept d on
						d.managerId = e.eid

select e.ename
from emp e
where e.eid in(select d.managerId
				from dept d
				where d.did like 'a%'
						)
order by e.salary


