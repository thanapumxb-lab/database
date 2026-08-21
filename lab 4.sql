-- lab ในชั้นเรียน
select orderID,ProductID, UnitPrice,Quantity,Discount,UnitPrice*Quantity*(1-Discount)as TotalPrice
from [Order Details]
order by Quantity desc

select employeeid,TitleOfCourtesy+FirstName+space(2)+lastname as Empname,title,HomePhone
from Employees

select productid,sum(quantity)as จำนวนที่ขายได้
,cast (sum (UnitPrice*Quantity*(1-Discount))as numeric (10,2))as ยอดเงินที่ขายได้
from [Order Details]
group by productid
order by sum(UnitPrice*Quantity*(1-Discount))desc

select TitleOfCourtesy+FirstName+space(2)+lastname as Empname,year(hiredate)+543[ปีที่ พ.ศ.เข้าทำงาน]
from Employees

select productid,productname,unitprice,
	case when UnitPrice >=75 then 'High'
		 when UnitPrice >=35 then 'Medium'
		 else 'Low'
		 end as prielevel
from products

select  productname, CategoryName,c.CategoryID
from Products as p join Categories as c 
on p.CategoryID=c.CategoryID
	   
select p.ProductName,s.CompanyName as supplier
from products as p join suppliers as s
on p.SupplierID=s.SupplierID

select o.OrderID,convert(varchar , orderdate,6)as [orderdate],c.CompanyName
from orders as o join customers as c
on o.CustomerID=c.CustomerID
order by 3

select CompanyName as ชื่อบริษัท,Country as ประเทศ,count(OrderID)as จำนวนใบเสร็จ
from Customers as c join  Orders as o
on c.CustomerID=o.CustomerID
group by CompanyName,Country
order by จำนวนใบเสร็จ


select s.companyname as shippername,
count (o.OrderID)
from orders as o
join shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName



select o.orderid,s.companyname as shipper
from orders as o
join shippers as s
on o.ShipVia = s.shipperid;

select orderid,convert(varchar,orderdate,6)as [order date],
c.CompanyName,e.FirstName + space(2) + e.LastName as empname
from orders as o 
join Customers as c on o.CustomerID=c.CustomerID
join Employees as e on o.EmployeeID=e.EmployeeID

select productid,productname,unitprice, CategoryName,CompanyName
from products p 
join categories c on p.CategoryID=c.CategoryID
join Suppliers s on p.SupplierID=s.SupplierID

select top 3 c.CategoryID ,c.CategoryName,cast (sum (o.UnitPrice*Quantity*(1-Discount)) as numeric(10,2)) as totalprice
from Categories c 
join Products p on c.CategoryID=p.CategoryID
join [Order Details] o on o.ProductID=p.ProductID
group by c.CategoryID ,c.CategoryName
order by 3 desc

select o.orderid,c.CompanyName,p.productname, od.quantity,od.unitprice*Quantity*(1-Discount)as totalsale
from orders o
join customers c on o.CustomerID=c.CustomerID
join [Order Details] od on o.OrderID=od.OrderID
join Products p on od.ProductID=p.ProductID

select c.CompanyName,s.Country
from Customers c
join Orders o on c.CustomerID=o.CustomerID
join [Order Details] od on o.OrderID=od.OrderID
join Products p on od.ProductID=p.ProductID
join Suppliers s on p.SupplierID=s.SupplierID
where s.Country = 'USA'
group by c.CompanyName,s.Country