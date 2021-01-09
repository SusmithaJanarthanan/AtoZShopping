



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


