use  MiniProject_Shop

Create table Category
(Category_Id int identity(1,1) Primary Key,
Category_Name varchar(20))


create table Retailers
(Retail_Id int identity(1000,1) Primary Key,
Company_Name varchar(40),
Retail_Name varchar(40) unique,
Retail_Password nvarchar(40),
Retail_Phone varchar(40),
Retail_Email nvarchar(40),
Retail_Status varchar(40))



Create table Products
(Prod_Id int identity(101,1) Primary Key,
Category_Id int FOREIGN KEY REFERENCES Category(Category_Id),
Prod_Name varchar(20),
Prod_Price decimal,
Prod_Image nvarchar(Max),
Prod_Description varchar(Max),
Prod_Quantity int,
Prod_Status varchar(30),
Retail_Id int FOREIGN KEY REFERENCES Retailers(Retail_Id))

create table Update_Products(
Update_Id int identity(1,1) Primary Key,
Prod_Id int FOREIGN KEY REFERENCES Products(Prod_Id),
Prod_Name varchar(20),
Prod_Price decimal,
Prod_Quantity int,
Update_Status varchar(30))

create table Users(
User_Id int identity(1,1) primary key,
User_Name varchar(50) unique,
User_Password varchar(30),
User_Email nvarchar(50),
User_Phone varchar(15),
User_Address varchar(Max),
User_City varchar(20),
User_Country varchar(30)	
)

create table Wishlist(
Wishlist_Id int identity(101,1) primary key,
User_Id int references Users(User_Id),
Prod_Id int references Products(Prod_Id)
)

create table Cart(
Cart_Id int identity(1,1) primary key,
User_Id int references Users(User_Id),
Prod_Id int references Products(Prod_Id),
Prod_Quantity int ,
Prod_Price decimal
)

create table Orders(
Order_Id int identity(1,1) primary key,
User_id int references Users(User_id),
Prod_id int references Products(Prod_id),
Prod_Price decimal ,
Prod_Quantity int,
Retail_id int references Retailers(Retail_id)
)

insert into Category values ('Glasses')
insert into Category values ('Books')
insert into Category values ('Mobile')
insert into Category values ('FootWear')
insert into Category values ('Games')
insert into Category values ('HomeAppliances')
insert into Category values ('Grocery')


insert into Retailers values ('GlassWorld','Sri','0000','9874563214','sri@gmail.com','Approved')
insert into Retailers values ('BookWorld','Ramu','1111','2563987456','ramu.@gmail.com','Approved')
insert into Retailers values ('MobileWorld','Abi','2222','1254789658','Abi@gmail.com','Approved')
insert into Retailers values ('FootWorld','Anu','3333','3366558899','Anu@gmail.com','Approved')
insert into Retailers values ('GroceryWorld','Zoya','4444','7778889999','Abi@gmail.com','Approved')
insert into Retailers values ('HomeAppWorld','Hari','5555','4589658795','Anu@gmail.com','Waiting')
insert into Retailers values ('GamesWorld','Roy','6666','7845986525','Roy@gmail.com','Waiting')




insert into Users(User_Name,User_Password,User_Email,User_Phone,User_Address,User_City,User_Country) 
values('Kavya','1111','kavya@gmail.com','9876543210','ramanagar colony','Ahmedabad','India'),
('Amarjeet','2222','amarjeet@gmail.com','4567892356','bharatpur','Nagpur','India'),
('Ramnath','3333','ramneeth@gmail.com','8976352165','janakpur','Mumbai','India'),
('Pallavi','4444','pallavi@hotmail.com','7895643678','krishi nagar','Patna','India'),
('Satish','5555','satish@gmail.com','5642466875','ramnagri','Kolkata','India'),
('Ramendra','6666','ramendra@yahoo.com','6789034567','Professor colony','Samastipur','India'),
('Rajani','7777','rajani@gmail.com','7854326789','motibag','Ahmedabad','India'),
('Nidhi','8888','nidhi@orkut.com','5678905332','kumarswamy layout','Bangalore','India'),
('Prasoon','9999','prasoon@gmail.com','6799034675','nandini layout','Bangalore','India'),
('Anand','0000','anand@yahoo.com','7853467886','rabba nagar','Lucknow','India'),
('Rajat','1234','rajat@gmail.com','7890345562','marina heights','Chennai','India'),
('Venkatraman','2345','venkat@yahoo.com','9876534566','boyapallam','Vishakatnam','India'),
('Ramesh','3456','ramesh@gmail.com','7890057868','bank colony','Hyderabad','India'),
('Susmita','4567','susmi@yahoo.com','6789432566','ameerganj colony','Pune','India'),
('Rajesh','5678','rajesh@gmail.com','5678945845','gumti','Mumbai','India')

insert into Products(Category_Id,Prod_Name,Prod_Price,Prod_Image,Prod_Description,Prod_Quantity,Prod_Status,Retail_Id)
values(1,'Rayban',5000,'img1','make your world brighter','4','approved',1000),
(1,'Titan',4050.50,'img2','make them stare','8','pending',1000),
(2,'Harry Potter',500,'img3','enter the world of magic','8','approved',1001),
(2,'Witcher',890,'img4','unfold the mystries of universe','6','approved',1001),
(3,'Samsung',10000,'img5','Ranked no 1','12','approved',1002),
(3,'MI',8000,'img6','makes everything affordable','4','Pending',1002),
(4,'Metro',1200,'img7','shoes for a new race','45','approved',1003),
(4,'Bata',500,'img8','shoes speak louder than words','23','approved',1003),
(5,'Clash O Titans',5000,'img9','survival of fittest','8','approved',1006),
(5,'Ball Blast',8000,'img10','rock it!!!','4','approved',1006),
(6,'Fridge',50000,'img11','intelligent,smart appliance','39','approved',1005),
(6,'Washing Machine',25000,'img12','the apparels expert','4','Pending',1005),
(7,'Sugar',100,'img13','sweet','4','approved',1004),
(7,'Tea',76,'img14','leaves','4','approved',1004)


insert into Update_Products(Prod_Id,Prod_Name,Prod_Price,Prod_Quantity,Update_Status)
values(101,'Rayban',3456,50,'pending'),
(103,'Harry Potter',346.5,5,'pending'),
(105,'Samsung',30000,56,'pending'),
(107,'Metro',1567,35,'pending'),
(109,'Clash O Titans',9456,12,'pending'),
(102,'Titan',300,50,'pending')



select * from Category
select * from Orders
select * from Products

select * from Cart

select * from Retailers
select * from Update_Products
select * from Users
select * from Wishlist

create procedure GetAllPdts
as
begin
select * from Products where Prod_Status='approved'
end

exec GetAllPdts

alter procedure GetOneCategory @catid int as
begin

select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Quantity,c.Category_Name from Products p inner join Category c
on p.Category_Id=c.Category_Id
where p.Prod_Status='approved' and p.Prod_Quantity!=0 and c.Category_Id= @catid
end

exec GetOneCategory 3


select 










	insert into Retailers values ('ElectronicsWorld','SriDharshini','0000','9874563214','sri@gmail.com','Approved')

	select * from Products
	select * from Retailers

	delete from Retailers where Retail_Id=1007

	insert into Products(Category_Id,Prod_Name,Prod_Price,Prod_Image,Prod_Description,Prod_Quantity,Prod_Status,Retail_Id)
values(3,'Samsung',5050,'img1','make your world brighter','10','approved',1009)

select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,c.Category_Id,
c.Category_Name,r.Retail_Name,r.Retail_Id,r.Company_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id





select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Id,Category_Name,Retail_Id,Retail_Name,Company_Name,
row_number() over (partition by Prod_Name order by Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,c.Category_Id,
c.Category_Name,r.Retail_Name,r.Retail_Id,r.Company_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id) cd

------------------------------------------------------------------
create procedure sp_GetOnePdtfromdb @id int
as
begin
select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Id,Category_Name,Retail_Id,Retail_Name,Company_Name,
row_number() over (partition by Prod_Name order by Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,c.Category_Id,
c.Category_Name,r.Retail_Name,r.Retail_Id,r.Company_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id
where p.Prod_Id=@id
)cd
end


exec sp_GetOnePdtfromdb 115
exec sp_GetOnePdtfromdb 101
----------------------------------------------------------
create procedure sp_GetAllPdtfromdb
as
begin
select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Id,Category_Name,Retail_Id,Retail_Name,Company_Name,
row_number() over (partition by Prod_Name order by Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,c.Category_Id,
c.Category_Name,r.Retail_Name,r.Retail_Id,r.Company_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id) cd
end

exec sp_GetAllPdtfromdb
----------------------------------------------------------------------
create procedure sp_GetAllCategoryfromdb
as
begin
select * from Category 
end

exec sp_GetAllCategoryfromdb
--------------------------------------------------------------------
create procedure sp_PdtsOfOneCategoryfromdb @cat_id int
as
begin
select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Id,Category_Name,Retail_Id,Retail_Name,Company_Name,
row_number() over (partition by Prod_Name order by Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,c.Category_Id,
c.Category_Name,r.Retail_Name,r.Retail_Id,r.Company_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id
where c.Category_Id= @cat_id) as cd
end

exec sp_PdtsOfOneCategoryfromdb 3
---------------------------------------------------------------------






drop procedure sp_GetAllProducts

exec sp_GetAllPdt
--------------------------------------------------------------------------

create procedure GetWishlist @userid int
as
begin
select * from Wishlist where User_Id = @userid
end

create proc AddToWishlist @userid int, @prodid int
as
begin
	insert into Wishlist values (@userid,@prodid)
end

exec AddToWishlist 1,101
delete Wishlist

create proc GetWishItem @prodid int
as
begin
	select * from Products where Prod_Id= @prodid
end


create proc AddTOCart @userid int ,@prodid int , @prod_qty int , @prod_price decimal
as
begin
	insert into Cart values (@userid,@prodid,@prod_qty,@prod_price)
end 



create procedure GetCart @userid int
as
begin
select * from Cart where User_Id = @userid
end

exec AddTOCart 1, 101,2,3456

exec AddTOCart 2, 106,2,3456

select * from Cart
select * from Wishlist
---------------------------------------------------------


select * from Users


ALTER TABLE Users
DROP CONSTRAINT [UQ__Users__681E8A60CEFCBEC8];

ALTER TABLE Users
ADD CONSTRAINT [UQ__Users__681E8A60CEFCBEC8] Unique (User_Email);

delete from Users where User_Id=31

sp_rename 'Cart.Quantity', 'Prod_Quantity', 'COLUMN';
select * from Cart
sp_rename 'Orders.Quantity', 'Prod_Quantity', 'COLUMN';

Quantity   Prod_Quantity

select * from Products
select * from Cart
select * from Orders


drop table Cart
drop table Orders

INSERT INTO Orders values ()
SELECT name, age, sex, city, p.id, number, n.nationality
FROM table1 p
INNER JOIN table2 c ON c.Id = p.Id
INNER JOIN table3 n ON p.Id = n.Id


create view view_ord_ins
as
select p.Prod_Id,p.Prod_Name,p.Prod_Price,p.Retail_Id,c.Quantity from Products p inner join Cart c
on c.Prod_Id=p.Prod_Id
select * from Orders
select * from view_ord_ins

insert into view_ord_ins values (103,'Harry Potter',500,1001,1)

insert into Orders values(
)


select * from Orders

alter procedure sp_ins_ord @id int
as 
begin
insert into Orders 
select c.User_Id,c.Prod_Id,c.Prod_Price,c.Quantity,p.Retail_Id from Products p inner join Cart c
on c.Prod_Id=p.Prod_Id
where c.User_Id=@id
UPDATE P
SET 
   p.Prod_Quantity=p.Prod_Quantity-o.Quantity
FROM Products p
INNER JOIN
orders o
ON p.Prod_Id=o.Prod_Id
delete from Cart where User_Id=@id
end

exec sp_ins_ord 1

select * from Users
select Prod_Quantity from Cart where Prod_Id=101
select * from Products
Select * from Orders
select* from Cart

update Products 
set Prod_Quantity=5 where Prod_Id In
(select Prod_Id from orders) 

select * from orders;
select * from Products

UPDATE P
SET 
   p.Prod_Quantity=p.Prod_Quantity-o.Quantity
FROM Products p
INNER JOIN
orders o
ON p.Prod_Id=o.Prod_Id



select * from Products where Prod_Id In
(select  p.Prod_Id,(P.Prod_Quantity-c.Prod_Quantity)as diff from Products p inner join Cart c
on p.Prod_Id=c.Prod_Id)


insert into Products 
select p.Prod_id,p.Category_Id,p.Prod_Name,p.Prod_Price,p.Prod_Description,P.Prod_Quantity-c.Prod_Quantity,p.Prod_Status
,p.Retail_Id  from Products p inner join Cart c
on p.Prod_Id=c.Prod_Id

insert into Products(Category_Id,Prod_Name,Prod_Price,Prod_Image,Prod_Description,Prod_Quantity,Prod_Status,Retail_Id)
values(1,'Titan',5000,'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/4gxYSUNDX1BST0ZJTEUAAQEAAAxITGlubwIQAABtbnRyUkdCIFhZWiAHzgACAAkABgAxAABhY3NwTVNGVAAAAABJRUMgc1JHQgAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLUhQICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFjcHJ0AAABUAAAADNkZXNjAAABhAAAAGx3dHB0AAAB8AAAABRia3B0AAACBAAAABRyWFlaAAACGAAAABRnWFlaAAACLAAAABRiWFlaAAACQAAAABRkbW5kAAACVAAAAHBkbWRkAAACxAAAAIh2dWVkAAADTAAAAIZ2aWV3AAAD1AAAACRsdW1pAAAD+AAAABRtZWFzAAAEDAAAACR0ZWNoAAAEMAAAAAxyVFJDAAAEPAAACAxnVFJDAAAEPAAACAxiVFJDAAAEPAAACAx0ZXh0AAAAAENvcHlyaWdodCAoYykgMTk5OCBIZXdsZXR0LVBhY2thcmQgQ29tcGFueQAAZGVzYwAAAAAAAAASc1JHQiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAABJzUkdCIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWFlaIAAAAAAAAPNRAAEAAAABFsxYWVogAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z2Rlc2MAAAAAAAAAFklFQyBodHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAFklFQyBodHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABkZXNjAAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAtIHNSR0IAAAAAAAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAtIHNSR0IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZGVzYwAAAAAAAAAsUmVmZXJlbmNlIFZpZXdpbmcgQ29uZGl0aW9uIGluIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENvbmRpdGlvbiBpbiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHZpZXcAAAAAABOk/gAUXy4AEM8UAAPtzAAEEwsAA1yeAAAAAVhZWiAAAAAAAEwJVgBQAAAAVx/nbWVhcwAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAo8AAAACc2lnIAAAAABDUlQgY3VydgAAAAAAAAQAAAAABQAKAA8AFAAZAB4AIwAoAC0AMgA3ADsAQABFAEoATwBUAFkAXgBjAGgAbQByAHcAfACBAIYAiwCQAJUAmgCfAKQAqQCuALIAtwC8AMEAxgDLANAA1QDbAOAA5QDrAPAA9gD7AQEBBwENARMBGQEfASUBKwEyATgBPgFFAUwBUgFZAWABZwFuAXUBfAGDAYsBkgGaAaEBqQGxAbkBwQHJAdEB2QHhAekB8gH6AgMCDAIUAh0CJgIvAjgCQQJLAlQCXQJnAnECegKEAo4CmAKiAqwCtgLBAssC1QLgAusC9QMAAwsDFgMhAy0DOANDA08DWgNmA3IDfgOKA5YDogOuA7oDxwPTA+AD7AP5BAYEEwQgBC0EOwRIBFUEYwRxBH4EjASaBKgEtgTEBNME4QTwBP4FDQUcBSsFOgVJBVgFZwV3BYYFlgWmBbUFxQXVBeUF9gYGBhYGJwY3BkgGWQZqBnsGjAadBq8GwAbRBuMG9QcHBxkHKwc9B08HYQd0B4YHmQesB78H0gflB/gICwgfCDIIRghaCG4IggiWCKoIvgjSCOcI+wkQCSUJOglPCWQJeQmPCaQJugnPCeUJ+woRCicKPQpUCmoKgQqYCq4KxQrcCvMLCwsiCzkLUQtpC4ALmAuwC8gL4Qv5DBIMKgxDDFwMdQyODKcMwAzZDPMNDQ0mDUANWg10DY4NqQ3DDd4N+A4TDi4OSQ5kDn8Omw62DtIO7g8JDyUPQQ9eD3oPlg+zD88P7BAJECYQQxBhEH4QmxC5ENcQ9RETETERTxFtEYwRqhHJEegSBxImEkUSZBKEEqMSwxLjEwMTIxNDE2MTgxOkE8UT5RQGFCcUSRRqFIsUrRTOFPAVEhU0FVYVeBWbFb0V4BYDFiYWSRZsFo8WshbWFvoXHRdBF2UXiReuF9IX9xgbGEAYZRiKGK8Y1Rj6GSAZRRlrGZEZtxndGgQaKhpRGncanhrFGuwbFBs7G2MbihuyG9ocAhwqHFIcexyjHMwc9R0eHUcdcB2ZHcMd7B4WHkAeah6UHr4e6R8THz4faR+UH78f6iAVIEEgbCCYIMQg8CEcIUghdSGhIc4h+yInIlUigiKvIt0jCiM4I2YjlCPCI/AkHyRNJHwkqyTaJQklOCVoJZclxyX3JicmVyaHJrcm6CcYJ0kneierJ9woDSg/KHEooijUKQYpOClrKZ0p0CoCKjUqaCqbKs8rAis2K2krnSvRLAUsOSxuLKIs1y0MLUEtdi2rLeEuFi5MLoIuty7uLyQvWi+RL8cv/jA1MGwwpDDbMRIxSjGCMbox8jIqMmMymzLUMw0zRjN/M7gz8TQrNGU0njTYNRM1TTWHNcI1/TY3NnI2rjbpNyQ3YDecN9c4FDhQOIw4yDkFOUI5fzm8Ofk6Njp0OrI67zstO2s7qjvoPCc8ZTykPOM9Ij1hPaE94D4gPmA+oD7gPyE/YT+iP+JAI0BkQKZA50EpQWpBrEHuQjBCckK1QvdDOkN9Q8BEA0RHRIpEzkUSRVVFmkXeRiJGZ0arRvBHNUd7R8BIBUhLSJFI10kdSWNJqUnwSjdKfUrESwxLU0uaS+JMKkxyTLpNAk1KTZNN3E4lTm5Ot08AT0lPk0/dUCdQcVC7UQZRUFGbUeZSMVJ8UsdTE1NfU6pT9lRCVI9U21UoVXVVwlYPVlxWqVb3V0RXklfgWC9YfVjLWRpZaVm4WgdaVlqmWvVbRVuVW+VcNVyGXNZdJ114XcleGl5sXr1fD19hX7NgBWBXYKpg/GFPYaJh9WJJYpxi8GNDY5dj62RAZJRk6WU9ZZJl52Y9ZpJm6Gc9Z5Nn6Wg/aJZo7GlDaZpp8WpIap9q92tPa6dr/2xXbK9tCG1gbbluEm5rbsRvHm94b9FwK3CGcOBxOnGVcfByS3KmcwFzXXO4dBR0cHTMdSh1hXXhdj52m3b4d1Z3s3gReG54zHkqeYl553pGeqV7BHtje8J8IXyBfOF9QX2hfgF+Yn7CfyN/hH/lgEeAqIEKgWuBzYIwgpKC9INXg7qEHYSAhOOFR4Wrhg6GcobXhzuHn4gEiGmIzokziZmJ/opkisqLMIuWi/yMY4zKjTGNmI3/jmaOzo82j56QBpBukNaRP5GokhGSepLjk02TtpQglIqU9JVflcmWNJaflwqXdZfgmEyYuJkkmZCZ/JpomtWbQpuvnByciZz3nWSd0p5Anq6fHZ+Ln/qgaaDYoUehtqImopajBqN2o+akVqTHpTilqaYapoum/adup+CoUqjEqTepqaocqo+rAqt1q+msXKzQrUStuK4trqGvFq+LsACwdbDqsWCx1rJLssKzOLOutCW0nLUTtYq2AbZ5tvC3aLfguFm40blKucK6O7q1uy67p7whvJu9Fb2Pvgq+hL7/v3q/9cBwwOzBZ8Hjwl/C28NYw9TEUcTOxUvFyMZGxsPHQce/yD3IvMk6ybnKOMq3yzbLtsw1zLXNNc21zjbOts83z7jQOdC60TzRvtI/0sHTRNPG1EnUy9VO1dHWVdbY11zX4Nhk2OjZbNnx2nba+9uA3AXcit0Q3ZbeHN6i3ynfr+A24L3hROHM4lPi2+Nj4+vkc+T85YTmDeaW5x/nqegy6LzpRunQ6lvq5etw6/vshu0R7ZzuKO6070DvzPBY8OXxcvH/8ozzGfOn9DT0wvVQ9d72bfb794r4Gfio+Tj5x/pX+uf7d/wH/Jj9Kf26/kv+3P9t////2wCEAAMEBAQGBAYHBwYICQgJCAwLCgoLDBINDg0ODRIcERQRERQRHBgdGBYYHRgsIh4eIiwyKigqMj02Nj1MSUxkZIYBAwQEBAYEBgcHBggJCAkIDAsKCgsMEg0ODQ4NEhwRFBERFBEcGB0YFhgdGCwiHh4iLDIqKCoyPTY2PUxJTGRkhv/CABEIAU0B9AMBIgACEQEDEQH/xAAdAAABBQEBAQEAAAAAAAAAAAACAAEDBAUGBwgJ/9oACAEBAAAAAPzZJycyd06dIzTp06RE5ETpInYK9CmDokRmjROkhEIgIicjRJJycnNJJ0k7uZmTpmYWEY42AAFkwiLMwiIAGmTk5E5E7kTpkk6TpyOQ3TizMkwgEYRVYAZhFhSZhEB3XdyMzMknd0mSTuRunIknSTMhAYwAI69WtGwsyd0gBugJzMyd3c06SSdInJ2TkTpMzMIgICDCwwUqkQJETphXREZEREndOndJOknRNkTaEhJMKARFhEBFklDQoRJyIkzdciN0TsiIkyZk6TuxDyuXsdEbpMwiLCAiLMLJPFn0Yk7k69MRuRyKONmJgZhYBatnjuw1eSrdLsO6SAUDRgIMLC7J3joUIEkfsxzykSkFE8kACMEYZHHT3nqUtDS4oe4tIRYGGMIxYGFhZMkibPzYUvbTkIp5rRpRMBPHDHncB0kwsh5uLovPNb0IhEY44oYwjiARFo2ZChZDToV/bppzlmcYzkQDI4rI8t9Lti6EK3nuxb8+9C6mUVHBFBiZHWcLLqW3EIhERAQBDW9eRE8iJSTqMTcIPLOw6IRhjQRZvl/q/Mct6polHFBzfLamlMNXKzt7XFo2SFo44gD0RS2Jpp5HhElGhHE8/wDVbEIQtG8VfzbU7fga/p9lUvPqvbyxjGEVflpumhhxKlbqbjAAD2luaSaWVKMGeNRw+c9H1qFgREUHn/NewH5Nu+jxeZZHo5pRxDHWDk7Oly2S5djpCCjbuZnciIp5AY5Y4KfjHs+iIkMYRtW43h/QujbzqPT4703XAUIsdeGtwlON9HqbQtG8TdfLObqycsgFJI8vG+WfQk1avWFxCOhz3m3YdCMfJ8/Lu7e7KhTRtFi8hdz+p1TmjiiAA7K7MhRXprUpV4hx/HrWxMVm9f7+/wApjRc75p3PTy5HEZdqqp+o6WwIwPjcRLD6HpwVCKOII4+8mmO86FmnTtBxnk2rLTqp1o/SfG4PLx8l6JqR0fNrncYeBHMXS9FJDjcbe63jOw1bFjKaI4oA9Hmqu07ArMgThBled8jqHdrVI1qPklPlGAorh6dChNCcu3jV+p3A4/Z6ApbeZUETj7YCkndjhCIlIMfn2Hn+t0ZClzYY6GVjSQugeWNSX+rw7XK3s3r9hLj73UpS387PUZ9cpJHeVJwJRg3N1sLCbU1LtjYpc3zUMF/RzQr9FcCKWMSoZdVTb29yG7vOrolDkoOxe1PHNLGwSSmmjzq+rFg4GHho797Zvc3jU4kt70fosTnKkCramDzjDYj6TuNfU5qnIXPtH3ZE5lJXe1aY5pIzz72jLDUwuXwM9BZvqLQ2cnzrruwhrHq1DDD2uN5U6dvu+2oY8jXc3JftCtCV+252ooohd5K09y2dl6efzuVWceYyt3Slz+F1tnel2Xgrvu1+I4fMU+701o2s5VGT0WzJbs0op2knauwR2RnrTz6l6/LXoYWR6F55wmdAdTMzILd/R1dOToNTzPhqKR97s4la3s5tV/UI5bEcMxkUsdaBDIN07Umlsbt8snJxMyLh6ptZuY2Lj5lCJy9N4bNkkkEOk66/XpVcxpPQ3KUBawRWJa8MCexOdW1oamnt7sVPE4Lg7FgKst/qq9XKx82nmUq8Jx143s9pNNVgfoKPWVHOaWY5TrnVhCc0bnX1Z9/pOguZ/nPA5clhqD6+l1GPj59aCAKdbQ67j8crUsexNg149XoHOQzlpuJeibkAxlFDXpBdtWLulm5UU+dZtTRSWtXpuC4Sln16ccVWXSyZL0g5eV0t3CxpOuGZykIEPt327bJyJC/KcFq3+682j9Z88zez6liZCUsnivxhnVM2nUFr1yriacanqYtmfMp9snazWklnt/fHpRGRE7r5E903tP5h+lvGtf5w7r2T2dkIpaFf5v8AkkIM6jNHVj0W5TO3NjCggp37M954pCmsBN7V9uzym5Rzk3gfSeWeV/Q/0D8m5fpuXN9EoWZM7/N/xXuT5cFzLioYOzoc3StRV9ZqdnI6wUdixDLofd3qRnIZOTZ/lGPtdB4f6EPLdxm9h6mmTCyXzp8X7Vam1elDe5rMtVoL2oGeNSiPaxzHJajn9k+27xyHIVfxfivWuM3/ADv27jez8N9JsZ2jR7TtpBTJvnn4c0NSrg0alyjnxswK+FSvHG/YlNYOeXQ+1vX5CKUip+F9R5pR7bmMzm7nLejejZvo/wA09T9RXRZM/wA9/DwOVGjntWEo0cTxxjGl11i3OVpesfaWhj2diU5HShI3d2CWZpInNxQpfP8A8IZg2gqRBCo1PHAMIpk3aTXZ3t3frv2nxz5m9E+id91oaNHzE+42SjsWpKgyAq0kqr2bXzx8GuMcIQpHA0cMbxC7k/az2Dmten/YWrwPK7PaTQWbNyLnFp3a0N+/exYLhVqV2R4tDQ8E+E68cQM9cGhEIwMXlkaHtZJp7eh9Ue4yRsSJ5VXiRPIkbTELE9Z3dS2PC/hnNrGAxwDEiBSJxgAR9II3G39Ler7FtTTSySvWCSVxRTlLJXApYI2FWh+bPj+CAK6CEYxUsxjDThM37+pFNaeiGnca/ZvXbVq5Zns2pZJSirhEIx169eGKOj57z6ruMUYOSlII4ggM4w6s701mSKrKSIJrMkcDDI7HVo1GSjaKCIEEclhRRmMSKUo2jY0gUcUH/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/aAAgBAhAAAADkCQSQACGFkpIG6pimRA0IQMClV1QynzqUJACKJBtg3ps0h+YiaAbLb7OOQbY2PTVi+clQh09fQRo9vObd022271r5mZBOX6vCnXpxhxPbspvBU6uq8aModj6b5Gztq+A9LgHfbh29Hlqn58kQ4XteUm66/S8r0erzeQT19mODG6fmwlMPf6TFxwa32eX29Frg5NPTXlRdXXmVLZN+7XG722sIiaL8nbLmjopc0EtD26emxXvdeZnubduOPn8guuuGZiZEktOzrp68fp82HKdvZ2Y+Tln1V5EFEa1MLPKts/XvTr2UHRR5ETqvMZMmtxnWeWFekD530bbaGnPhdRzKXp07KU80VVOo86Lbmr0WmnE0r9egclJgB4/DoVpqW08jM7e4AlpzbaPI4XverrPTSuTKH7N0IaYmNHkYmlsd2HFjHf6QNoYwQzzOZt1dsh8SPV6GMGAAI8vF1dELVrGc+iksxivUKprBFKU23f8A/8QAGwEAAgMBAQEAAAAAAAAAAAAAAQIAAwUEBgf/2gAIAQMQAAAA7CxMLOZBDJItIsLGALWhJdixkkMMEEACUooAUdru0JkkJrjwAAACjmUyT0ZLVghQKguXqPAAoCwc9Ck+/Y2EKi8+I85pybqhK1QKqhaedfoheKUZMDXITAu6tZebLRV7ii1111eutssSsDhq0gsyFp1zh7RWrK7Mfj9E6LuMLHDzy++8Vc7A9HiZu9pNJy+Vt2+upF3rQSy8vh+mW6VQy/RZHJUdnT5/Pt6O5Erq3qyAGr8gmqtfLx1wX9NaRPS8fX22cqzReFSV5+DPqLU8Vaehu5ZyZd/TtaLNwLsFmLSFzTn59ddOng6Hd3jLy8m/0vZbwp6KyIprU2MxiWYtNGZym1uCuejusqb0ABeUVPaGZm4jJfOTm5KEr7uupX1CRTwcpZxZCK1CNtXVoClKNTVsKSnlkkjCGKJJ6TSrWUVSpWXuNkyceAx1MKrAfRdzc9SIr1Upq32zydQhkkkkEno+mVVrBTWo2uizHwXrgMEBkkm93KoWmgGyarTzPIJIJJJJIfQ9SJVXLpQG7Hu5EY2xIa6ZK1U9cCGwwIKf/8QAJRAAAgEEAgMBAQADAQAAAAAAAQIDAAQFEQYSBxATFCAVFzAW/9oACAEBAAECAP5A/wCIAGtf3v0P72SaaOSAwfH4/H5fL5CIRCPprfbuZPp9TKZTL9B/01rWv+goADWiPW/ZBXr1IJ7F+/fuXMn079+5fuXLl+/sfwBrr1661/y1rQAGvW9+tarXo+jTBqJLd/oX79+/btvey29j+BQoCh/3AA173/w3skkk0aNFWjZGUnfbe973vez6HoAADX8D/jr+N73/AHvdb9Ekk7/ghoniZSd72D/Gq6gUABrWq171qta96/g012L5W3/W9+j/AMN00MkDJ72D/Hy+Qj+fTqE6dOnQR9OnXr1C9evXrrWqYXcVWl0prf8ABGiKI96/rbwyW7R+979fD4fn/MLX8gtDam2Nv8Ph+c25g+PxMXzKdOskzZIZOxt6ngngFWM+ta11IIoijR/o+9aFbaGS1aL+NiNYxGIwtABDB+YWwtvzmH4fnNu1ubY295NJeRYpbJrRsc5tcjcWU0Ectu3zKFda1ojWiNdSNEa1/G9h2SW2aLXoMCGDaWNYlTYJOyaANMSDU95IIrL8/wAPz/mNrf4qwy19YzQ4u6VDB8Pzm2/MYDA0PyMZjMZQoU69SvXWta1Wyr27REKnzEYTav3L9lfdFhSg11IvrqJLe2EZjEZWiHXM2ODvcljnXD3oHWjRo0Q1T5J8y2dOVTLQXmvn8zEYvkYzF8yhQp10wMG+3bdCjQXoIwuiooGiWfPXmIsAlFWOyTRF3bxyW8+Vx1pPaXAPVhTVe5cvDhFx4t2tnsZcV2tciPR/nXQxlDGYzH9A1KAiKF66JFCj7Lby13g7NVNGjRXp0KkOMzDgrnrlcdi8hCxi+MtZPMY/FxQdDGY+jKVeK8x1jkKamafKHKJf281H0RrqkaxChQK0AW+pfey29vRPJLrAQq7SAlievz+PwaLksGojNa5TGYDILdm6zuaxdgItejRoK0ZBXI2OMvby5uch6RLSHZojRrYYEMXWQyrLSoY9FVi+W3aRp5LG1NsbUW3wMdM/0ac3OabeJyCZG4q4tFy8+dQYu2LFt7Lar6EMGW6illCk2uPgtuhorvZrasrACgAorssjSFhSBo1tjb8gubCOFjI8pct32QKemTLpWGh/Ibd5b+0A7RZiDNxTk72TvdNV9elmMMEOJVVFMDRGjWljihYdu4rqlsLP8nQM0gkd8hf5DI4Nf8x/6ReURcnXkceXxnFZuDXNiZmOaNYEGWKOYZOZKW2YVFcWmZinHo1stfX7NEwWCMNJb9a0QRTChKhMKWaRE/U3BmDlhRKrIvJjvEXd6JZdg+rTJcN5IPNF/wCSm5DlpBWLumuYcpd5ImCBrO6x7RlUKXNtmo5iXOTunFtYwW+QSwkIR2Qg1uijUaFC5aXuKSvoJFk+qy/YM9w9zdrkMGyo0cL2D2bQGLpHcXqrEqX97Rk36ShEkIuJJizwfM28brmri+hgtsaBWWGGfXZGJeLsaLA62JFkEi0KaIxdHcvtZQ5LLkaknWuIYc5H9gZrKTEDBtgTh7q1ZIYGhVPmY4VddCv0WeRn5eMllM/uNCbXLVsjL1hTXYlCs89saK72UB7Bv0Ctn0VEYiMJXu5kEuNnwZVL2LIx3iypcW2Sky97nmuJUqO/a8Ms8jiytfxlILmW/wC3yW1lsJE9RTwZWC4yb46TZbqsIoSXQBLGgwIjWNo0AZLhmLBQKjp0FvPiRj57X/Gz8Yn4jPx50EypHjIsTBFMZ8RLYSKBqsTd9bedbiQzWn+MGKOLgt0tDRO4GmfEImOTEmO6uxQW4iNbNddhmCRbY/M0sggFqYe6SG4Mv2F9Hc7KyW8+MuMHLgGxpj+8d4JzKz460GIvsFJHjcnJD+c2/wCRU+KpMZ3/AMPdYR4kFW72XIba9vb0kV2iORXtQj1HReNls/wx2scX6WXp80jZEVq6RhKSkQRSK8MllcY17NrX8UuAucf9bbNjkYzl68sEGYjykGTF8ssZmT5R4iaZbnItcH1G+JuVueoTUS30goVb2oxywKRNK5YMH6Rqyh5D27d66lu3SGkhW2OPONlxr2k1sUvcFNbm1Nn/AIybFvI9BkvI75Z4rmPLf5vF32afIcluLssBS1hLafjr4v8AbFf2t3cyiiXuTFHGXL9gin6RzqxQhZJHFPKrFBGkqLCtuYQDJFLBPaSQNGchdyCIQ9Hto8dPgbjjb8fkxT23b6/a38nXmQ+ItxbfmeGOCOwt7psg92Y7iDqqKBRPYUbhn7dwDFTj5fRj1QICTRWOdJYLtJYjHRgmtp7fK5E1DGIHo1FLA4jeCSN4pbd8fJhmwxwxw7YuPDPizadS8JhVQY2qS0g9NaCRrggx9KWlU0WDtI0hWuxcOaQvSkVG8D21RSI13kczfvYPDHGqSRPEEhaxuJIpYZYmhaLqVdBE0NhRF3O8f5Y4nAeMPG8MsEUqXyvvQRmjd5zOZ0miGP4QfGX+tj43/wBc/wCvzwZ+FPxA8PXiqcdXjww8WL+L2j8aPD04b/4QePh44HjP/VK+JF8SReJ7fxpm8FLHIrLICCvQp0mkECWceOkYSXdnEYLtavpBE1l12JPrpVNK268acagt9dQgT5/P5fHkmcsOeDlVlyG5kl55beQohfc1n5zgOSGH5fPp16hGiQ+V2nR1cOGQ0xESW5guW7RX88EcStJZSR295LdPcM6uYioUSFlYKBBbcIwY9AD+NV5jyeAuUz1zfR3WK435fwvjy4x+d5F5P8bcS16I16huHTy/Jb3UheKRGVLZ4g7TQzzi6hWra6KygXr3G0t7aCSFKYlxJQTRIPjfj0KUP40PRHJ/GVpwPyDYnIeH7Mnypl5eQcc8fc28f+K+Sf8ADfl2le2nkMtRIySWptJ6M1rdS1NDsXBiaOGnhIa4aUHvQpaK0HtIeD4YUPQ9j1u+uLjkL2WN4FybivFoL/P8c4by7hVjyfMScM4nW/78rCF0MtAOXlkykV6TeKGW5aRhbSkmmMly9wTvdCtpRCxlfH+FtohQIoe55s/5ExPkq/5fhufcv5hxjyFjeV3fNXy/NfIPFeYZV7nl78ywHkP/ANVG/o/x5QGoZlNxTzyBQJJblpCRR9Corh5neifQIIX5qRQS0tOEYUAfwDV3FlPHmH4TzfgPC/GXLuHx8Hw3Cst4yl4bdeOcHwe34pHwfKcaHi3C8Fs1o/z5LBRpFvmuXd3ILE61XUp62x2V1XVEChVjVSeE4ewgkmOdTLo+x760SpMZhWIxfD8qwa6UYuns/wAeR2uJmcAFnJYmiNMABRajRNGh7CqqChSpa2nC8Mtc8zmCzFtlsRffvbKxZZL5JbyW8y0OYsMj+03oyK3iTFmvP3i6/Z+05Nb4XbXZv4568j1KvTqTTCiApB9FzQamFaC9OmkUAUoB4ji8ZbO2YxVrxaPBwRsPnHAqxzzTyWkdjGmpF+a1DNJNLQCGno0lfRmFRyrN5Bq4UsXJPrTEMWJPo1qjQAUAt2CgrQRUtoeHYyMFfkYPgIPgIPl8nTr0CaWhWugXXQjQooVA1QoIq89N1T1rRPYk+iQaNdenz+JJfv6+ax9/u09heca5dBy6Lkn+d/zq5sZgZUZMZE3zXf6BOJTJ37q4k+iyNK0plWUzNN9vv+hblbyXI85zdwxBok1o0fRXQpUCUZHkd6A9NM0/ZAIzDJPHmYuSHlg5WnL15lHzQc0Xm6c4Xmy83XnK86XnQ50Oc/8Auf8A3Tc/PkM+RD5B/wBgnyGfIx8inyKfIh8jf7GPki48hZDPq7SmQHfYtQrQULsuWNFSiqRXbsoRAq0GcfEW/wCUWv5vyrai1FobUwGD4CA25h+T01MBEYvkYjC0JhMXx+Bt/wA6wqpJ9bJrQCqa323rVGiNNRo1/8QARBAAAgECBAQCBwUGAwcFAQAAAQIAAxEEEiExBRBBUSJhBhMgMlJxkTBCU4GhFCNDYpKxQFByBxUkM0SCwRY0NlSi0f/aAAgBAQADPwD/ACcH7MRYsWDmeZ5H/KDyEEEHIcx/np9sww+wf8xHMj/Nz7YPIwj/ACdRU12lIsADARp/hQYDDCPsj7Rhh+wP2ZVyeRBymAj/AA3eKdoYR9gOXlD2hnlD7JjRoY0MPIw8qNP3nUTCjqT+Uw9/vCYnGJVbDUalYUkz1MgzFV7kDpyDrGRjNZmGUw/4hGhjD2hBBBFggl+kvBBBFixYIIJ5QShh0zOfkOpmMxLlaSkDsP8AyYu9VyT2X/8Aswi7UQfmSZhz/BSUr5qbMjDYgziFDUsXXvvKVSyv4T+kFRI9JyCIUqAwVKYIhh5H/DU25EfYEmHkAIsHti3ITA0DfEVGVLE+EXY+QErcUxrVfVinSGiqPuqNhfqe5iU0CqLAczDDDY1KS2I3UdflGDhK1sp0v284lWmSN41NyDMlTKdoGW/sGGHkYeZhhhh9k+yYrdOTCGGHkAYo5H7MSlh6D1HOg/UzEcQxpLdTr5CU6dMIosByEEA9j1VQVVHhY6+RmdPUsfEouvmItRCyjWNTfzEFSmFJ15CCC3IclAJNpg6ema57CU+lMz0V/wDSi0xgsZ/vn9qJNXOP2f1HRcu+aV/gEH3qcw9XQGx84p9s8jDDyMB3EW8A9owxr/ZGvixRU+FD9TFoYYXHibUyw9i8HNa1B0PUSrQrgjR0aJWoK67MJcF1EejWBi1aYYGHlpyIlKjdV8T/AKCY/GPuSP0gGrt+QmGXZB+cpD7glM/dEw7D3BF3RrGYzDtre0p1NDofaEEEEHsjnpzEEFtoeWsHsjD4Oo/W1l+Zhr4rM2ttTDNOR5actJpyFLH5raOA0K1KlAnfxLAykERqTl1GkNKplJ0gqICseNaFL30AjOTTomy9W7xqtnqaL/eIi2VQB7asCCARGTxptCCEqfkZcX5KouTYRQbU1v5mVfUumRbtbx9RbtMQqhc2l7+cDrv7d4IORmnICCD2DDCYQIXrpSGyi5+Zgp4QP1aCLaKYvIw8ltEg9VRcdGK/WVMO2DxNxZ1zCx6oxUgym6qw2IBEpVaRUiVMNWJA0lUPkOoiMIBDXY0aRsg94jrDXrgW0GreQgUAAWAh9kGETXll/eINOszfu3OvSUqCXOrHYSpWopTKUxlZjmA8TZuhPYdObM1lFzGp0/EfEd/YPI8h3gHMxoxmnIX5ExQNYoizQkxsRjHbfMxtCuGprbZRGtyAiiAQ3jR4wEFoz4R+wYGXoW+F/wBGgGBpK266SnbeYfE0yrETE4LEZ0Jt3ErrUveU2wtRcrZ2WyEbDveAC5hoYUA++3iaGGH2bixgggYEEaGNh8Tp0N5UqOWY3JhMW2glWrqfCspU1soluevLXneHkSJeADkBBaDpGK7SpKjQdTKIG8WhgalvefwiFsSpsSBuYqqo/lEBi3l4eQm/IEQQfsFU+Q/vN4KlCqOzCARhs0qZcrrdZRVS6mwhJlnFtlmIXc3lNiAy2lOp7rRudvZFBSB75/SPUDXuTvOFDhlPL+0HFlznvlFJVG1upJlas2VATFogF/E36CaQctYeR5mGC8UaTTk52BlQiPfUymRq0oqNoltBCDYR40/Z8M9Ui+UbSvi6uZ9ANl7Rnx2QX1RtO5AnFAx6ziCe8glXrTEQt4qcwbbgiYOplVTqTbeekfEKbvhMBUqqpAJVl67T00pKWfgmOyjcikWG1+kx+H0rYavTP89Nl/uIlz4hLwDh9TzKj9eRGHqt3f8AsJpDUU2jgkGZquQbLv8AOWBMY0g3fpCDNJVQ3DGNtUF/OUqoujX9jXklFbDV/wC0Z2LMdTKhORRv2gFXK219ZSSkAigCIVAaGwK6iEHWa+2JUY7GVSe0HVphlXvKJ2AgTYCMescw6S1tId4sEYaxhw8juw5DDcRoVTsG1+RhXEvbbMYWAEPscQwpvh8VXpa/w6jJ/YzjFTg2Jer/ALQ8RgKwDWoVS759J/tPR/8A5DiHynTOqN/cT0rxub9qq4WtfcvhaV/qAJjWJvSoagDRMu3ymP8A2Sma+GaktUhqZIIDqOq33Esdp6N0+F0Fq4zFU8RmJqqKAemNehDAnSejxpEpxbxdEfDVF/UXnD6TXGLotcdmH9xMJkd1qU2IBsAYSSTKlWrTpKLsxnhC+rOmkcdD8iLR0axHLLKiPcGaAVBfz6ynUW6MDyUSpQRQLBnUMNdbHrbpGvdtzK1axPhTvKNBbIvzPUzLiWmfDJBCsp1VJtqJrtzB9iguyiCxsNozG0YCGxgAvKdtYvaLm2iaaROsBNhKfWUhtE7G8TEIVdbgz1etJh/pMZWsRYxqtLQ+JZimOiE/lMVbWiJVA1oNAN1YRAfelPvF8AybSm3iURzc20EF5iqy0KdWtUdaKZUDMSEB1sOwmtoD91YO3PxCZnbxoLdzaV7+Bh+Tzji08gesyXvlvnExIuKtI7dQREJ7QqB4lN5U+EmYgKGNJwDsSpsZXptfUfpHVLMA7d5iK3vNp2G0rVWsikymtmqnM3boIJaD19/KXoEdjyvCDKdRdRYx1J0gIg3EMvyQbtB2lm92Ek6Q5prrKZ1vFC+8IAdiTCPu2E0EtDBD2hyElgJjErk+8JRqrZ1se8em4ZTtOPccGMXhuE/aamFoeuq0VZRUyXsWRSQWt1AlC9irgjcTCEbtf5TDv94TCMPdUzDkE+rmHYeENEAJ9awle5C1RKuGUM9iM1hYaXGtrx/ePWI6kmoAb2C7k/PsIVYgmx7GHuJU6CON1Mu/y1hzMbdZ5S2xtMTsKr/UzG4aq7IwBYWbMivcfJgZUrUwlbhPCKmlswwi02+tMrOGZrvwmjvfwVaqf+TBiaNKhRTE0aFMeGi2KqVkBI1IDbXlPsTMF6pmqublTkVO/QsT0i5vCNPOYJlCVaXqT8VMXQ/Nen5RWXMjBweqm4mguJtP34HYQWccrS0OaWHlLeJNR18ob2MJAhDclG8p9NIDrlvbrGtsIwMc2NjBm3j62lSXXxEfKC+tpTIJhUgZRNdIIzgkkaTxm4zTD1V90AmYlL5L/IzGYepmHrKbajMpI38xK40Jzjs0o6XBX9RMO3VT8jb+8TpeVQNKkZEN8kwSkl7D5QvcUUyj4jvK9TIrO7lb5Rva+psJWRrVFZSfiFuVcIqOEqINlcXt8juJwZsNY4KqtbN7wqgpbtlK3/WYL8Jx8mlC5FL1mXKL5zrfrtBlQgdLH5ytWpsyVctuk4muoKmcRtrhlf5KDEpV1L4Cm2U7FSP7Th9WoWqYMA7aEicGbX1LA/OcK7Th7Ldcv1mpNM38o6bgg+fOrTN1Yj5SoNKguPoZQq+435HeZsS0DkWtcU1v+QhPWCHQbypk1Ww89JbpHuCDEyrb3iLtDpNoDE7xLj+0djothNBmYxCQS303lMdyR5wC5CRhe2nzlQ2N94ua2WErqsUAXbr0lwxN4oawG8UnUgQsStOm5+QMxrarRc/lOJCoAaD6DXSY1lQ+ocEjXwncSows1F9e6wVTpQYeY0mLBPq2vrpe04tS3oEjupBlambMGU/mJW+NvrK9T71/m0xLD3kH5ynfx1CflpMPSINMBT+sNVCtTxr2YXiE3pMR5HUTFodad/MaxgTdSPyl+fqa4vsdDGI33mGpYbxqDofrMOpYkB1IsRKRdhkveYfIdBEK6Jr5SlY+JgRKpUsrzilBatRUpVF9WysHsdGFjYHrMuDz1cIbG5DhrTWHk3rFhaoxPeH1qhNSyDQSs2rEKJRUqWcm+so00AVVFuuXWM7EDQCA6becC6T1iKyi+UEETLa0H5QX3mH10YnvsInuqunkIS1hcA9zGOWX1J+spIx1JJ02l9rwFjc310lm8RtF0sOsqkaUWI77D9ZVIsXpp/f9JQBs1UtbsJhNlpHzuZYMEQaHSwF5VB1difnCdbmVFq3DsT5HeYjLq7kb7yq1PV2sRsIGXRPIynYjLaU91Q+cosCSv5GYZj/yAPlEHuuw8t5jUPhqA/UTiCe9SJ+WsqruGB8xCbAm0FtIx6xgLXlGq9QtRRgB2mC3FCmPyi1ad0QI4+h+cq0qpVlKup2MuBTc6bfKBQATv9IoFpUZvDAbX1N4MlraW2niItFS+otbaKaZsLE9PnK+RE1yjYSrW4euKqYVTSbMA2xOXe0OXPROnwtvHViGBBHQzJTLdToOTK9wxUjqJiQoSqvrFvqyjxTC10DowPcS7ELffUy4h0hiht4Frkqxswzcj2EFtyAYOl/O001ACxQSbEAmNVcBUJ8hczFNvSy+bMBE8IfEU10+74jMMjZs9Rv0mHXagC19CxvK2gUBP9Oh/SMTdgTfe5jE2EJzajTtvHB7w2Ntz0EcNqlodwRAL269YNA30iKCLWHnEY2uLHqZTINvrEAAJB7gawuVN9LGKxJ1+dpR2ykaaiG5yg385XR/c1AjZxmDi+9xMDU8J0N9LrMIQctVlcG2UC8xVBre9/pOv5iODrK9GiKYRCsFrGioHzlFtWp/LWcOxVLxIyuNmEq0m/sRMSECM5sNpVy+/p9RGyWKKdNxMMz9VPnFyXUqR3vMpuQNZcA9pXYHKpt5yq9sz38hMbS4WuGsTTBJW+4vESgi1KIBtoZhDTY1FB7RGIt4VA0783BuGIM9RVdjexW2koOLZxAYxYDudIQ3yMu4jmu+lraTS0S2qzH1AAtMj+ZtJUD/ALyui27HNOHU75mqP8jKFvBh1A6ki/8AeNlsCR8tp3X6mBgASLeQlNdc2szABdI4BIbTqYCBrBa5WKGIAj/eJlnGUEDvtBfqYzDSDOL69IBre/lsIQxOkZyqx1IuNIbZgdIxWx/KBrWEBFwANJe4vpKKg5gSe4mGXUo5N+ptKdRh+5Fg04VVouwSmlRwPEYUZrUyU6MpvFzkItx1vMPrejMMTojD85QYeB2B7GYumARqJXS4ZT+YlJttDHQ6NGG4/MaRfi+olIgeJfyaVFGlVhMSoFmQgd1ExH3lUjqNpicXUC4fBYiuw3WijVP7CcQweFV8VgMRRW9g1RQovGq6aabASpVe7GEnnrOH1aGSoRnZpTNzSq/k04nQ2BI/lN5iUNnX6ixlLqLTD57lwBEeozAXudOQvtMVW76S+5igGym3aeEAqFEp+cJBAAGsYykBqtzEANha+0W1rExyuikCA38UZTcwknS5movATcfSNaw0huBrc94pS2t+8oqulyYq3FtxCTcwWJvaEgWYfmJSXU69oCOsYrDL7j67yw2nWerOtTwWtYz1lZnWmqg7RiD+pgGoaIT4r/MRygy2KzDVKWo1lBm9zWKBcEiYn7rAzGr9y/yldd6bCOO4lT4jKvxGentLBLhU4zXFBQAKfhygCcSxjXr4ln+Z0+k/mEX45T6tMP8AGZh8uh1i3F5Ta2StDTCruF6mX2SUHH7yiG+c4W++HA+RnCQAoVvrEA8MZtgZYbS+ssSY+m9oqg6iAgXtCywncx7CaRhrNgST5bRGNgbSn1JNot9BYXgLi5MbNqY1zoPnAATFIgItCGFjH+8Lxh5jtGzWFljFtNDeErvYy9M2IOkYprDaWBLCwEooClIZjtfoIzuSxvKZfW9p4jEXS2sv8oPMiOj5wPCekp1FDBZQA2vEP8MCUQCBvF67Sm5GgtMPr4BMP2IiEmzGP0eYgbMDMe4uqgzHrvTMrr7ysIR0jGVAwyk3h9WM5N4p7w5ddpUYBUUyqovKQbxJKZUAWtLnSBQTDewQmVSRfwwZgGbSItrLFYjSKAbAcrgWnhgvqINbMI1t4CNILQWE8pU22l0843nO0GaxMUJBcDaC4gA1I+UTtaC8wdEeJheftVLLTqZRKzHQiFSQTrLS57SnbzgHWbWlMIVPWPSfKR4TMyggCxjDWE3M8VowJEK30gaKE0lhGJhWpYnQyll2vpAzkKBaJfYSluVEpA2VBG7RU94/lKTgERxT8MxLHrKoF49M7ynl3tBbQR2G9p/NeNfWAyiOhiARjsI4WOVMqO1tbnacfxaBqeGIB6tpPSj8JP6p6U9cOv8AVPSf/wCsP6p6TBtcL9GnpKP+jP1E9JhvgWP5iek1rDAPPScLYcPqT0pA1wNWekQOvDq/0nHhvga/9M4wP+hr/wBBnGRtgaw/7DOMg3/Y6/8AQZxoKcuArn/tnpS40wOI/pnpPVa5wFc/lPSY7cPqz0qQXGAqfUT0rZyxwD/UT0sO2B//AEJ6Wt/0q/1CelZX/wBsn9c9K23o0v6p6U/BS+pnpSfwvqZ6UWAL0p6R06fjNJrfOcQwT5a1Ei/UbTIdQbw7hRCTABrBbWeHSPCGtGjeqCjeEC5EFTYwA6m8w1LcWMp1PdAgPiB1j02gK2MvK4O2kqudowO8IE13mUaQxzFA1MQiDpAOkG8GO4gK9Rb00MpU0CqoAEEEHaL2ETsInwiU/hEpfCJw3g3D3xNdVyqIMZh1rUeEs6NsY5OvB6n1EaviVpnhTID94kThmGoetrZEW19ZwIuVw2FevbcqNJ6OHFLQxFBqDsdA4tMBUoiqgQoRe84PSxTYfD0PX1RuF6SphKZqVuEkUxuRracI41h/XYbLbtKXwCU/hEXsIO0HaCCMtrrvtBMIOEI3qwtQHcdRAxvCYAIpghvCbQltox3i6RQLWhRrg2EQiwi1NzFpJEaC5IjqY4axlMx/uiVidYSYt7mLaeUMN4TBybEV6dJd2NpTwHCaYC2JH2SV8TguH5wBUrDN8hOAYLg+HpmvRtkE9HGawxFKcOo4N8QChVRe4mP9MeM1EDsuBpPbT7xE4XgcMtOnRXQdpw8+j9WsEC1EGZWG4ImLxfoYgqMcxpDWJ6MemGLFdhiEq1CQRqRfpMDxWl+wYWmlJ6mhLCDg/CwM+cuSxPct9gVQowzJ2MXdTp2h/wB2/kIpSxhJNhCRyLGDrKS9YFOkqBoCNYrDQayqLwrtBaxiNT3nq2uGj9YzXtDmgYaGBW8UoFowMJmsaG8JgAjGNaNiceK7jQbRURVGwHtNfnpMJxfitLFVGe6ec4dQpKGIsBOC4bh7LQqA1+gXe89JML6JuMQz2NE3vMPT4BTZbZiLmAC5MOPr0uGYc3LsA1u0xHD+H4bhmE8NRwFEwRQYjFoHqvqSd5wz9jbE0EVKlMXVhMXjMI1CsbmmxX7K+Ab/AEwjUS41EBnSAHWC0ZjvMu5jAHLKgeKd5TdYq9ZrKuWwlZt4ynURCu0pte2kqUm8opSPmOvLWDleHLyUR8RiEpqNzEwfD0NtbfYiVKVIlAC09I3YqlJFnpRjT+8ruFPQaTDiqKlc5289Zhsbweph1QWKET0p9HXNAIKtIHQntPSbF0jTpUlp3iUsQcTi2zVW6tMXU4rQxuEezU/oZxzD4dKdalSuBa5aekXFqRo3CU2+GUeFYbQanU/ZXwT/AOmILCJl0EbpH6ztMm8y7SpUaKRrEzG0KnSPbeMYYqnWX1WK+hEFN9J2jMNYe/M35m8YiHNqYghxGNWoV0vFp0VUdB7YpoWmGwWZbg5d7SrjMaUAOQ+6bGcPw2BDVWGa04ZicXk8OplHhmA9YKZAI0InEMQub1TMOswGIpEvUAYdDpOGf71XChULGcJoU1NkzGJQZfVHTNY2mAxmBT1oIJ7zgz4kMaIqeYO0wuCyUqVJbmYqhhPW1aS5SJQ4hiKih0CobG8wbYr1SMIHQN3Ht3wdT5QwiZoAI/QWjsLkxAdYijSPCZf2SohJhPtA8gByJhO89diEQDcxMNhEbLrb7A1KTATDYzHese9uomBwlLRF8pi+IACjVenr0h4dWzuxdu5lXiFBaYqkAdJiaPDmWnVam2WwtOL01qLUrM95xI8QTEUsQ6tPSJxTQYqp4RvOPVrCpVDWcHacaoPerii6WsEAtMUtB71GzGZsYlSo7NY7GYavw71WT7tpicPjaj0a9VFZr2Ex9Pinr6lerYbAmMmHRT0Ht3wtX5TU/OU184YGHImG8tCTyAHI8xNfa153EEsOTVsUrkQUsOqgdIlNbsZw4PlNUXmCY2DiKwBBh9gQASiTrYykNrCIx2lMj3RKa7KJTbdRKPwiUPgEpDZRF7RL7cqZ6CJ2H2H/AAtX5Txtr1MYwy3K/McjeGafaDmDDVrqo7xaNFGIlhK2DwdQoDtOIYjEs9QPqZjhiwoVt5W/ZEzA3MYEaRR90zMbZYCNoGEIQ2mLoVLqrEXmIcjPcXl1s0SUQLkyh3lIxG2MAEog2JmH7ykRvEvKVtZQiHYSnEEXtM3TlfC1flD65/nBb2DbkeYg9s8z7bVcQrEQUsOohAhxdNlZQQYtDLlpLFNcMaaiFVC5RD2jFtVmVj4YR0mXdYrAgiUm0sZQDAlTEUnwxSsQ9IuYGLKV4lojGANsYvaLFtaxi/CYMo0MG2UwEbQk+7Ao2gI2l8PVjCvU/wBUI+1PsrBPPmYZ3gesq+cVKaG0soEBggg9gwwy42gJ2nlLdOQ7QTyglxPLl5c9eRvtzJhn/D1PlP8AiKnz9gcj9iT0lt4o5nmBEWCGZMQCZhaNNVdhOGt/EE4a38RZw78QTh9v+YJgD/EEwP4gmC/EEwn4gmF/EEw3xiYc/wAQSj8YlH4xKXxiUj94RPiEX4hE+IRb+8InxCU/iET4hEv7wifEJT+ISlb3hKXxCUre+JRt74lH4xKAPviYcffEwqISagmHem4DCBq7kd4IPsTDyA5kn2RDGJhM0hImMp7EzHp1aY1D7zTHfG0x/wAbTG299pjb++0xn4hmK/EMxQ++ZifjMrfGZU/EMqfGZU/Ej/GY34kb8SH8SH8SAfxIw2qR/wASP+JH/Fj/AIkf8SP+JKn4kq/iSt+IZV/Elb8QzEOpAqGV8STqYeWvsH2RAOZh9o8hBzB3Epk7Sl2lHtKPaUu0pX2lLtKXaUbbSlKcSJeJFHUwX3MAG5hHUxu5hJ94z+YzzM/mM8zB3MHcwdzB3MHcxYkSLAPYPsiWHI2h+x1n/8QALxEAAgIBAgUDAgUFAQAAAAAAAAECEQMSIQQQMUFRExQgImEwMkJSgSMzcZGxYv/aAAgBAgEBPwD53+BZfwUmORrZqZbNymaTSaBQNHN8r+dl/Ky/ghJGk0lFFCRRZZf4aTY4tfGvkpCa5V8PVPVR6qPVieojWjWjWjWjUWJSfRM0T8MhKmNJoap/Cy/mpiafKii2b8nI1yNUhNmpimyLm2kj6Map7yHmb7izNdxZIT2ez8inLHOpdGZY3G0eoeoj1Ea0KSNRZZfK+amxST5WzcaKRsX8I1ixX+qQ5F8kyH9XE4vqjBlaemRxGLTK10fJEIyk6R6UI/nlv4RrwrpFmvC/0miEvyyJaoumama2a2axTNSNY6Gxt8kuSRRgxasqXY4iblkfhbckyzWjhcn9VLycWtM0/JgzQyR0S6mfHPHLpsYMeSc6rYyTjjWiHXuxyZqZqFIhNTWmX8McJKemiGBdzTCuiJVboXKxxKRty3vk276mqNnBqscpkpSbLkJPlt4MOlZI/wCUcRGLx7+TRC7TpmOeraSIwjFUkZOHy231GmiuVEIybSQu19SeWEer38GTLKQmLm5M1R8mvwmOUmNT8mkVGGMZZIryyUEsTil2PSxuvpR7bD+0fCYvucRihhjqbdXWyb/4Lg5+URwOOSNyXU4iMpY6S7noZa2icPjknbVGTJpojOMlsycISW6J8NNdNymiEHJ0iEYY49THlUpNJE19Tvya2uvNMtGhM0/YZ9JpTNCNBFJNGKctKt2ZHJK4pM9fMusD3ddYsXE4mt7FxONrqRSlUutdHytF7G9dRQp7KP8Aqic86kqxpr/O4sk26eKS++xkUH1jY7UPpiibm3ucP/cM6rLIotx6EZJ/C0WjfwblvyamKSFmj2ml/JDjGutMXE8NLq6Fjwz/ACzTPbR8oWPh4u7sfEtNVHYjlhLuaUIz5MkJ9qI57W8f9GtP9y/k1w/fIx5It/mTHGkt+qJQjJbox4VCbaZnpTHNG4mlJfFtJ7sWSKHk8I1s/llREojUfAmRm0Q4rIu7FxTfhjz4+8SE8Mns9/uZIZNNR6ijxcXdMi1ljUo0yWCa6MksvgTaZvdpilst3ZHLJUuojJihNboyYNM3VtDJJUY19Eb8cryeUh35bIw5U/BT8iiaTQUixyNchSl5IyEssHcZWQyzUVex7ifli4v9ysjxeJ7OxZMEukkPDF9z2sPse3j9qIxhE1o1qjLOSlcZv/Aszf5oJkvSltUkJJIsSbKXk+ktGplMUfJQ7ZpKtDihlkZO0Y9CWz3JP7kaGx2mRFNruLPlX6mLisvk93krsR4yb/Sj3Me8TJlU+1DsjJDVn1GxTKVEYrwJLwRw6j268nt15Parye0Xk9sPhfuez/8AQuBge0XkXCRXc9rHyLhorue3j5JcLBk4aJ0WJ8nIUj6+wkq+4p7UaSN10Pq8lFMpLlCNsiqXxfRCVr+aP+H6UvuPS3bHdu+vx4lXMt2JiZ1ex6ZGWw42xRRaNzTLyJcmjYwQ+L5PruNm/Xlfx4j8zKoSbI413KV7CuijsUxIS5MchyI22Y41FFr4LrZu3d78rZbKFa+OdNzYoJdeSsXJsViXwbGM4eFvk2r6fB/h5X9TN+Vm4kJCXJyNTLZZuKDsxUomqJqiWi0Wi1+FaMnVifxsci5CXKxQSHI1MhnaR7heD3C8DzrwPiD1z1j1z1xZZPuaz1D1ELIjWjXEcoj3FFGkobLKZRZqEUj/xAA1EQACAgECBAMFBgcBAQAAAAAAAQIRAwQSEyExURAUQQUgIlJhFSMyQnGBMDNDU5GhsWLB/9oACAEDAQE/APfS96/dsdDxoWNHDibIijE+E3I3o4g8g8pxPcSKQl79Fe5XvOxyZvZvN5uLLLNokKJRX8Gc1HqRnF9H/CaTJY+w00X7vlzy7PLyPLSHgkcFnBl2OFI4bNjNrJSguskLJjfSSMuPdETlCRCSlGyiiivCvdaTJYuw4te5SOXgoHDgOEBxj2NkR44mRYoRbdJIay53auOP/bFpYrpFD0yf5USwZsfOPNdmPFDPj3Q/EuqNPPbk2yOAzgSOBIeGQ8bOGxwZtNpTKK8JY0xwkvCkchMtnxe4ybeo1G3+nDr9WKCSSNq8GjLen1Kmvwy6o1mmU48SHazQ6jfDa+q8GZckIRuToeozZP5ePl3Zw9U+uRHB1K6ZLONlh/Mhy7ohw5q0PHE4UR4YjwoeEeNnC+gtzEhUWSfg6LNXn4eCT9eiNDiUMEe75s5DRtHBntDFenb7Uz2bPficX+X/AIzV6fJgnxYdPU0ufHlgnfPsarPixY7b5+i7mDFPPLiZOa9EKMUbEbESh3RlwzxPfj6eqI5ccsO+6XqZdZJ8ockcTI2viZictivr4NFIUy2W/D4aOQqroU6Pac7ywx/uyEYpIqBa8HddTVKbwz5/lZoZzWb4erRxc1VKKaM2NwuWNtLrXYnlyZGnJ3Rg1mn2qPONCkmrTL8GzLOMYty6E3bdco9aMOny5Oi5dzDpscPS33HEaGcyMI2VL0Q4d2hRii4djcO7NTOUMM5LqosWSTzKUnbvmzzOdX95IWv1S/OL2nqfWmabV5889sIQur5yS/7R9qL1gZNbGeHJUJfh69rNFOEM26TqkyOr0zfOaNdmg0owldmn07yX9DJhnB00YcuWEuUqMOvxydTVM3Jq0Zc0McbkzLky58lU/ojNp5Y8cW3bswtbItLk0cNPoUVZKJQ8jXY3X6iPiNzRxGcQm3JNPmjU48e91Fw+jMCxylU5OI9HpZdMp9mJ/hyJj9n6mL5OJLQahS5w69mTcoJw5q+qE5VSKZXNCeO1cH+zoebFKFOWZV0uSkv/AIQhpnB3kkn9Y8v9MeLEot8aDfZKV/8ADFPLFvbOiO2WT7yb/XqYY4lH4Krua5fcfujSO9PAsdS6klJOmdCo+CiynZS8FFdjYhwkSwN8njbX6GX2VCT+HdEeg12P8K3Iln1OP8eNr9VQvaGT0T/yS1GtmqS2ruR0KcW3P4ieDNDrH90OcvWv8DbbNHhwZcV3JSXWmT0lPlkf70zgzXThv9YIWLL/AGsZlwTSvhuP6cxN21TVGPLkg7jJozaqWTEk1Ts0bbwoUH6ioabgyyzn2R6CVrkh45MWPuzYjp0SLkWxOXcaJQTRPQ4JdYR/4S9nQXRyQtFmT5ZP8mXHqca5xtd07MGbDxE59F9LJT9nTg43H/FEoz0+S4S3RZj1uKXVUyE9O/zFRaQ6200ShzfLl2Mumg02vhHVmHPkxv4WYNUp41bSkIg3Zlf3kq7lG2H1ZGl6JEpFlruWuw5Dkby2VYolI5DrshrFJVJGTT45SfK/2PJYvWKJezE38EnEyey9SrapjwayHWEhanJHrFr/AELX5PqPWy9E7MmTLk6sWOX0FjlZgwpwUZ41yXJpnlnH8GRoj5iHNuDobblZtY3Fepul2Km+rNj7myJcSU16Firwbot+FG1GRTb6ciK+hJMin3FTRIljT6qyek07/pxJez9P8p9m4W/zIl7Lguk2fZ8uimafTPHdysTRKDYmkboFstFuyUpdxuXcy6rY6StnnZ/LE87P5Ii18/kR9oz+RHnpP8n+zz8v7f8AsXtF/wBsftKS/pn2hk+Rf5H7Rn8iPtCfyoevyP8ALE87k+VC9oZl6Iw5eJiUvUoa8FFFI+BdRybf0OHzs3UT6lQ7FlotvwySUYNk5OUm/d5FIbKdI5WPr7uhdYUciXg6rmziEopsTSQ5SKffw3rsN+CaFZrcvSPuUyj9kOzt8Jb6n6IaZXuaP+SjmjdXUnkfoW/UdHoeo2NslJ+CTFAjEm4xi2ZZ7pt+4mWJ0Jlllssbb9zRtLCiU2+ht7saQ0yqFElRJ+FeCQhGvy0tqF191fw9KvukchlHKxyQ5DbvwULFjSNsDaJx9WSyRS5Go3SyM2yKZTKZT/h0zSqsSHEY2/DmU2LGbYIlLsJNmwc5MUTYmT0yb5M8o+4tILSL6C0S+h5OK9EeUh2R5KHY8lDsh6bEvQenj2PLR7Hlo/KPAuyOD/5OD9ERxvsiPJDmzeW2KLNvhbY4ixqxm5n/2Q==','make your world brighter','4','approved',1000)



-----------------------------------------------------------

create procedure GetWishlist @userid int
as
begin
select w.User_Id,w.Wishlist_Id,p.Prod_Id,p.Prod_Name,p.Prod_Price,p.Prod_Image from Wishlist w inner join Products p
on p.Prod_Id=w.Prod_Id
where w.User_Id = @userid
end

drop procedure GetWishlist


exec GetWishlist 34

drop procedure GetWishlist

create proc AddToWishlist @userid int, @prodid int
as
begin
	insert into Wishlist values (@userid,@prodid)
end

exec AddToWishlist 2,101

drop procedure GetWishItem

create proc GetWishItem @prodid int
as
begin
	select * from Products where Prod_Id= @prodid
end

drop procedure AddTOCart
create proc AddTOCart @userid int ,@prodid int , @prod_qty int , @prod_price decimal
as
begin
	insert into Cart values (@userid,@prodid,1,@prod_price)
end  


create procedure GetCartItems @userid int
as
begin
select c.Cart_Id, c.User_Id,c.Prod_Id, p.Prod_Name Prod_Name, p.Prod_Image Prod_Image,p.Prod_Description Prod_Description, c.Prod_Quantity,c.Prod_Price from Cart c join Products p
on c.Prod_Id=p.Prod_Id
 where User_Id = @userid
end

exec AddTOCart 1, 101,2,3456

exec AddTOCart 2, 101,4,1231



exec GetCartItems 1

create proc incQty(@id int)
as
begin
	update Cart 
	set Prod_Quantity +=1
	where Cart_Id=@id
end

create proc decQty(@id int)
as
begin
	update Cart 
	set Prod_Quantity -=1
	where Cart_Id=@id
end

exec  decQty 8


select * from Cart
exec AddToWishlist 2,103
select * from Wishlist

create proc CalTotal(@id int)
as
begin
	select sum(Prod_Quantity*Prod_Price) from Cart where User_Id = @id
end
exec CalTotal 2


select * from Products
select * from Cart
exec AddTOCart 1,103,1,1200
select * from Wishlist
truncate table Wishlist
select * from Users


--------------------------------------------------------------------------
---------------------------------------------------get orders of one particular user-----------------------
create procedure sp_getOrders
(@userid int)
as
begin
select p.Prod_Name,p.Prod_Price,p.Prod_Image,o.Order_Id,o.Prod_Quantity from Products p inner join Orders o
on p.Prod_Id=o.Prod_id
where o.User_id=@userid
end

exec sp_getOrders 1

---------------------------------------------------for displaying orders of particular user in checkout page---------------

create procedure sp_getOrdersfromCart
(@userid int)
as
begin
select p.Prod_Name,p.Prod_Price,c.Cart_Id from Products p inner join Cart c
on p.Prod_Id=c.Prod_Id
where c.User_Id=@userid
end

exec sp_getOrdersfromCart 1

------------renaming the column names of cart and orders table to quantity

--sp_rename 'Cart.Quantity','Prod_Quantity','COLUMN'
--sp_rename 'Orders.Quantity','Prod_Quantity','COLUMN'

--------------------create a stored procedure for inserting into orders table and--------------------
--------------------deleting from cart while the user clicks on checkout-----------------------------

create procedure sp_ins_order(@id int)
as
begin
insert into Orders
select c.User_Id,c.Prod_Id,c.Prod_Price,c.Prod_Quantity,p.Retail_Id from Products p inner join Cart c
on c.Prod_Id=p.Prod_Id
where c.User_Id=@id
UPDATE P
SET 
   p.Prod_Quantity=p.Prod_Quantity-o.Prod_Quantity
FROM Products p
INNER JOIN
orders o
ON p.Prod_Id=o.Prod_Id
delete from Cart where User_Id=@id
end

exec sp_ins_order 10

select * from Products
select * from Orders

select * from Cart

--------------------------------------------------------------
create procedure sp_Pdts_Of_One_Category @cat_id int
as
begin
select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Name,Retail_Name,
row_number() over (partition by Prod_Name order by Prod_Price,Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,
c.Category_Name,r.Retail_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id
where c.Category_Id= @cat_id) as cd
end

exec sp_Pdts_Of_One_Category 3


select * from Products

select * from Users

-------------------create a stored procedure for displaying the user details in his/her profile--------

create procedure GetUserDetails(@uid int)
as
begin
select User_Name,User_Email,User_Phone,User_Address,User_City,User_Country from Users
where User_Id=@uid
end

exec GetUserDetails 1

select * from Orders
select * from Cart