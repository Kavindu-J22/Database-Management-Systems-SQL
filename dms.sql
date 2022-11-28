
create table menuitem(

ItemNo int  ,
Size varchar(5),
Name varchar(5) ,
Description varchar(50),
Price real

constraint pk_menu primary key (ItemNo ,size)

)

create table Ingredient(

Ingredient varchar(50) primary key,
Supplier varchar(50),
Metric varchar(10),
AvailableAmount float

)


create table MenuIngredient(

ItemNo int,
Size varchar(5),
Ingredient varchar(50),
Amount real

constraint pk_menuing primary key (ItemNo ,size,Ingredient)
constraint fk_menuing foreign  key (ItemNo ,size) references menuitem,
constraint fk_menuing1 foreign  key (Ingredient) references Ingredient

)

create table Orderr(

CustomerNo int , 
ItemNo int ,
Size varchar(5),
AmountOrdered Date

constraint pk_order primary key (CustomerNo,ItemNo ,size)
constraint fk_order foreign  key (ItemNo ,size) references menuitem,
constraint fk_order1 foreign  key (CustomerNo) references Customer


)

alter table orderr drop column AmountOrdered
alter table orderr add AmountOrdered float

create table Customer(

 CustomerNo int primary key,
 CustomerName varchar(30),
 Phone varchar(10)

)

select * from menuitem
select * from Orderr



--answers





-- find the itme name which has more than 5000 total amount 
--finance manager

select mi.name ,mi.ItemNo, sum(o.AmountOrdered)
from Orderr o , menuitem mi
where o.ItemNo = mi.ItemNo and o.Size = mi.Size
group by mi.name ,mi.ItemNo
having sum(o.AmountOrdered) > 5000





-- find the customer number and name who bougth more than 5 items 
--manager 
select c.CustomerNo ,c.CustomerName ,count(o.ItemNo)
from Customer c , Orderr o 
where c.CustomerNo =o.CustomerNo
group by c.CustomerNo,c.CustomerName
having count(o.ItemNo) > 5




-- find customer name ,item no and AmountOrdered that customerNo is between 1 and 10 
--find customer name ,item no and AmountOrdered that customers bought in  some situation 

select c.CustomerName ,o.ItemNo, o.AmountOrdered 
from Customer c , Orderr o
where c.CustomerNo in (select CustomerNo
					  from Customer
					  where CustomerNo between 1 and 10)






-- find customer name ,item no and AmountOrdered that phone number is equal to  
-- find customer name ,customerNO ,item no and AmountOrdered that a purticular customer 

select c.CustomerName ,c.CustomerNo,o.ItemNo, o.AmountOrdered 
from Customer c , Orderr o
where exists (select *
			  from Customer c , Orderr o
			  where c.CustomerNo = o.CustomerNo and c.Phone = 0759124951)


-- Quantity of goods received per item number per customer

create function getcustomertotal (@CustomerNo int , @itemno int) returns int
as 
begin

 declare @total int
 select @total = count(@itemno)
 from orderr 
 where CustomerNo = @CustomerNo and ItemNo = @itemno

 return @total
end


--Value of goods obtained in relation to a customer number

create function getcustomeramount (@CustomerNo int , @AmountOrdered real) returns real
as 
begin

 declare @amount real
 select @amount = sum(@AmountOrdered)
 from orderr 
 where CustomerNo = @CustomerNo

 return @amount
end



CREATE TRIGGER checkCustomerOrder
ON Order
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @cus_no int
	DECLARE @item_no int
	DECLARE @tot int
	SELECT @cus_no = CustomerNo AND @item_no = ItemNo
	FROM inserted
	SELECT @tot = SUM(o.AmountOrdered)
	FROM Order o
	WHERE @cus_no = o.CustomerNo AND @item_no = o.ItemNo

	if @tot < 5
	BEGIN 
		PRINT 'One customer cannot order more than 5'
		ROLLBACK TRANSACTION
	END
END



