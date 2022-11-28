CREATE FUNCTION getPctTime(@eide int) returns int
as
begin
	declare @Tpct int
	select @Tpct = sum(pct_time) 
	from works w
	where w.eid = @eide
	return @Tpct
end

declare @answer int
exec @answer = getPctTime 1003
print @answer

drop function getPctTime


create procedure getedeptinfo(@did char(12))
as
begin
	select count(did)
	from works
	where did = @did
end

exec getedeptinfo 'admin'

create procedure updateSalary(@prct int)
as
begin
	update emp
	set salary = salary + salary *(@prct/100)
end

exec updateSalary -10

select * from emp

create procedure getMgrInfo(@deptID char(12),@mgrname char(20) output,@sal real output)
as
begin
	select @mgrname = e.ename,@sal = e.salary
	from emp e,dept d
	where e.eid = d.managerId and d.did = @deptID
end

declare @mname char(12),@salar real
exec getMgrInfo 'SESD',@mname output,@salar output
print @mname
print @salar

drop procedure getMgrInfo
-----------------------------------

Select *
from works

create trigger chknumOfempDept
on works
for insert,update
as
begin
declare @eid int
select @eid = eid from inserted
declare @totdept int
select @totdept = count(did)
from works
where eid = @eid
if @totdept > 2
begin
	Print'cant add more than 3 department'
	rollback transaction
end
end

insert into works(eid,did,pct_time)values(1001,'finance',25)
-----------------------------------------------------------------
insert into works values(1002,'finance',10)

update works
set pct_time = 110
where eid = 1000 and did = 'admin'

create trigger chkempPcttime
on works
for insert,update
as
begin
	declare @emid int
	select @emid = eid from inserted
	declare @totPct int
	select @totPct = sum(pct_time)
	from works
	where eid = @emid
	if @totPct > 100
	begin
		print'cant work more than 100% Pct_time'
		Rollback transaction
	end
end
----------------------------------------------------------------
create table transactions
( 
tid int primary key,
account_no int not null,
type varchar(10) default 'credit',
amount real,
datee date,
)

insert into transactions values(111,1234,'debit',100000,'2022-05-10')
insert into transactions values(112,1235,'credit',200000,'2022-06-11')
insert into transactions values(113,1236,'debit',300000,'2022-06-12')
insert into transactions values(114,1237,'credit',350000,'2022-05-13')
insert into transactions values(115,1238,'debit',375000,'2022-05-14')

drop table transactions

select *
from transactions

create trigger chkamounPerday
on transactions
for insert,update
as
begin
	declare @aid int
	select @aid = account_no from inserted
	declare @totamount real
	select @totamount = sum(amount)
	from transactions
	where account_no = @aid and year(getdate()) = year(datee) and month(getdate()) = month(datee) and day(getdate()) = day(datee) 
	if @totamount > 400000
	begin
		print'You canot deposit mere than RS:400000 pre day'
		Rollback transaction
	end
end

insert into transactions values(117,1238,'debit',150000,'2022-06-27')
insert into transactions values(118,1238,'debit',100000,'2022-06-27')
insert into transactions values(119,1238,'debit',375000,'2022-06-27')

drop trigger chkamounPerday

delete transactions where account_no = 1238
----------------------------------------------------------------------------
create trigger chekempsal
on employee
for insert,update
as
begin
	declare @esal real
	declare @msal real
	declare @dnom int
	select @esal = salary,@dnom = dno from inserted
	select @msal = e.salary
	from employee e,dept d
	where d.dno = @dnom and d.mgrnic = e.nic
	if @esal > @msal
	begin 
		print 'cant get salary more than his manager'
		rollback transaction
	end
end
