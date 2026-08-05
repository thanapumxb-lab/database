

select * from Employees
select TitleOfCourtesy,firstName,LastName,City
from Employees
where city = 'London'
order by firstName

select
ProductID,ProductName,UnitPrice,UnitsInStock
from Products
where UnitPrice<30
order by UnitsInStock desc



select * from Customers
where Fax is null

select * from Products
where UnitsInStock < ReorderLevel and UnitsOnOrder >0

select firstName, lastname
from Employees
where Year(HireDate)=1993;

select * from Products
where UnitPrice between 50 and 100

select * from Customers
where CompanyName like 'M%'

select * from Customers
where ContactTitle like '%manager%'


select count(*) as จำนวน,
avg(unitprice)as ราคาเฉลี่ย,
max(unitprice)as ราคาสูงสุด,
min(unitprice)as ราคาต่ำสุด,
sum(unitsInStock)as จำนวนทั้งหมด
from Products
where categoryid =1

select categoryid,count(*) as จำนวน from products 
group by categoryid

select ReceiptID,sum (UnitPrice*Quantity)as ยอดเงินรวม
from details
group by ReceiptID

select categoryid,count(*) as จำนวน from products 
group by categoryid
having count(*)>2

select ReceiptID,sum (UnitPrice*Quantity)as ยอดเงินรวม
from details
group by ReceiptID
having sum (UnitPrice*Quantity) <100

select country,count(*)as จำนวนลูกค้า
from customers
group by country
having count(*)>3
order by count(*) desc

select top(5) orderid,count(*)as จำนวนรายการ
from [Order details]
group by orderid
having count(*) =1
order by orderid desc

select CategoryID,avg(unitprice)as ค่าเฉลี่ย,max(unitprice)as ราคาสูงสุด,min(unitprice)as ราคาต่ำสุด
from products
where supplierid<10
group by categoryid
having avg(unitprice)<20

select Employeeid,count(*) as จำนวนใบเสร็จ
from Orders
where Year(orderdate)=1997 and shipcountry ='USA'
group by Employeeid
having count(*) >=10
order by Employeeid;


