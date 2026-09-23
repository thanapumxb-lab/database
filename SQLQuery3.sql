/*แสดงข้อมูลพนักงาน รหัส ชื่อนามสกุล จำนวนใบสั่งซื้อ ยอดขายทั้งหมด ค่าคอม5%
ในปี1997 เฉพาะรายการที่ส่งไปประเทศ usa uk canada france */
select * from Employees
select * from orders
select * from [Order Details]

select e.EmployeeID,e.FirstName +space(2)+ e.LastName as 'Name',
count(o.OrderID) as จำนวนใบเสร็จ,count(distinct o.OrderID) as จำนวนใบเสร็จ1, cast(sum((od.UnitPrice*od.Quantity)*(1-od.Discount))as numeric(10,2)) as ยอดรวมทั้งหมด,
cast(sum(((od.UnitPrice*od.Quantity)*(1-od.Discount))*0.05)as numeric(10,2)) as 'ค่าคอม 5%'


from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
join [Order Details] od on o.OrderID = od.OrderID

where o.OrderDate >= '1997-01-01' and o.OrderDate <= '1997-12-31' and o.ShipCountry in ('USA','UK','Canada','France')
group by e.EmployeeID,e.FirstName,e.LastName
order by sum(((od.UnitPrice*od.Quantity)*od.Discount)*0.05) desc
 