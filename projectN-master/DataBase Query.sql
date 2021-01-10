
create database MiniProject_Shop
use MiniProject_Shop

Create table Category
(Category_Id int identity(1,1) Primary Key,
Category_Name varchar(20))

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


 

create table Retailers
(Retail_Id int identity(1000,1) Primary Key,
Company_Name varchar(40),
Retail_Name varchar(40) unique,
Retail_Password nvarchar(40),
Retail_Phone varchar(40),
Retail_Email nvarchar(40),
Retail_Status varchar(40))



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
User_Country varchar(30),
User_Type varchar(20)  check( User_Type in ('Customer','Admin','Retailer'))
	
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


