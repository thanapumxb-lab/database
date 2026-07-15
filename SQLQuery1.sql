Create table Employees(
EmployeeID int identity(1,1) Primary key,
Title varchar(20),
FirstName varchar(50) not null,
LastName varchar(50),
Position varchar(50),
UserName varchar(50) unique,
PasswordHash varchar(255) not null,
IsActive bit not null Default 1
);


INSERT INTO Employees(
			Title,FirstName,LastName,
			Position,UserName,PasswordHash
)
VALUES 
	('นางสาว','กาญจนา','พวงแก้ว',
	  'Sale Manager', 'user2', 'hashed1');

SELECT * FROM Employees;

drop table Employees

ALTER DATABASE PhurinMiniMart
COLLATE Thai_CI_AS;

create table Categories(
	CategoryID int identity(1,1) primary key,
	CategoryName varchar (50) not null unique,
	Desciption varchar(200)
);
insert into Categories(CategoryName)values ('เครื่องปรุง')
insert into Categories(CategoryName)values ('เครื่องดื่มเย็น')
insert into Categories(CategoryName)values ('อาหารสำเร็จรูป')
insert into Categories(CategoryName)values ('เตรื่องสำอาง')
insert into Categories(CategoryName)values ('เวชภัณฑ์')

select * from Categories

create table Products(
	ProductID varchar(13) primary key,
	ProductName varchar(100) not null,
	UnitPrice decimal(10,2) default 0,
	UnitInStock int default 0,
	CategoryID int not null,
	Discontinued bit not null default 0,

	constraint CK_Unit
		check(UnitPrice >= 0),

	constraint CK_UnitInStock
		check(UnitInStock >= 0),

	constraint FK_CategoryID
		foreign key (CategoryID)
		references Categories(CategoryID)
)

insert into Products
	(ProductID, ProductName, UnitPrice,
	UnitInStock, CategoryID)
values
	('8858757009999','สินค้าทดสอบ',10.00,20,1);

insert into Products
	(ProductID, ProductName, UnitPrice,
	UnitInStock, CategoryID)
values
	('8858757001948','โค้ก',15.00,290,1);


select * from Products

drop table Categories

CREATE TABLE Receipts (
    ReceiptID INT IDENTITY(1,1) PRIMARY KEY,
    ReceiptDate DATETIME NOT NULL DEFAULT GETDATE(),
    EmployeeID INT NOT NULL,
    TotalCash DECIMAL(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT CK_Receipts_TotalCash CHECK (TotalCash >= 0),
    CONSTRAINT FK_Receipts_Employees FOREIGN KEY (EmployeeID) 
	REFERENCES employyees(EmployeeID)
);

insert into receipts
	(EmployeeID, TotalCash)
values
	(1, 115.00);
select *
from Receipts

CREATE TABLE Details (
    ReceiptID INT NOT NULL,
    ProductID VARCHAR(13) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT PK_Details PRIMARY KEY (ReceiptID, ProductID),
    
    CONSTRAINT CK_Details_UnitPrice CHECK (UnitPrice >= 0),
    CONSTRAINT CK_Details_Quantity CHECK (Quantity > 0),
    
    CONSTRAINT FK_Details_Receipts FOREIGN KEY (ReceiptID) REFERENCES Receipts(ReceiptID),
    CONSTRAINT FK_Details_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
