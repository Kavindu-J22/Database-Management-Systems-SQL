Select *
from emp

Select *
from dept

Select *
from works

update emp
set salary = 100000
where eid = 1000

select e.ename,d.did
from emp e inner join dept d on e.eid = d.managerId 
where e.age >20

select e.ename,d.did
from emp e left outer join dept d on e.eid = d.managerId
where e.age > 20

select e.ename,w.did
from emp e right outer join works w on e.eid = w.eid
where e.salary between 25000 and 100000


Select eid,sum(pct_time)
from works
group by eid
having sum(pct_time) > 92


CREATE VIEW Dept_info(Dept_name,budget,manager_name)
as
Select d.did,d.budget,e.ename
from emp e,dept d
Where e.eid = d.managerId



drop view Dept_info

Select *
from Dept_info
where budget > 100000

Create view Emp_info(EmpID,Ename,Emp_salary,total_PCT_Time)
as
Select e.eid,e.ename,e.salary,sum(w.pct_time)
from emp e,works w
where e.eid = w.eid
group by e.eid,e.ename,e.salary

Select *
from Emp_info
----------------------

declare @eid int
set @eid = 1000

declare @salar real

Select @salar = salary
from emp
where eid = @eid

if(@salar > 50000)
begin
	print 'Inside the if condition'
	print 'Salary is greater than 50000'
end
else 
	print 'salary is less than 50000'
---------------------------------------------

Create table employee(
cnt int primary key,
ename varchar(20)
)

declare @count int
set @count = 0

while(@count <= 20 )
begin
	insert into employee values(@count,concat('Employee',@count))
	set @count = @count +1

end

drop table employee

Select * 
from employee
-----------------------------------------------------------

create procedure updateSalary(@prct int)
as
begin
	update emp
	set salary = salary + salary *@prct/100
end

exec updateSalary -10

select * from emp

drop procedure updateSalary
