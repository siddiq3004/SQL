Insert into Employee values
--(1002,'nick','vijuic',40,'male'),
--(1003,'shaik','siddiq',20,'male'),
--(1004,'sh','ashik',10,'male'),
--(1005,'morgan','rao',25,'male'),
--(1006,'ravi','dubey',24,'male'),
--(1007,'ranbir','kapoor',22,'male'),
--(1008,'milka','singh',45,'male'),
(1009,'sharukh','khan',21,'male')

insert into EmployeeSalary values
(101,'manager',25000),
(102,'director',100000),
(103,'workrer',20000),
(104,'developer',70000),
(105,'data scientist',250000),
(106,'software engineer',50000)

insert into Employee_details values
(1001,'manager',25000),
(1002,'director',100000),
(1003,'workrer',20000),
(1004,'developer',70000),
(1005,'data scientist',250000),
(1006,'software engineer',50000)

select * from Employee full Outer join EmployeeSalary on Employee.EmployeeID = EmployeeSalary.EmployeeID
select * from Employee full Outer join Employee_details on Employee.EmployeeID = Employee_details.Employee_ID
select * from Employee  Inner join Employee_details on Employee.EmployeeID = Employee_details.Employee_ID
select * from Employee Right Outer join Employee_details on Employee.EmployeeID = Employee_details.Employee_ID
select * from Employee Left Outer join Employee_details on Employee.EmployeeID = Employee_details.Employee_ID

--union 
select EmployeeID from Employee
union 
select Employee_ID from Employee_details

--case statements
select Salary,
case 
	when Salary between 30000 and 50000 then 'experience'
	when salary > 50000 then 'senior'
	else 'fresher'
end 
from EmployeeSalary
order by Salary

--Having clause
select avg(Salary) As AvgSalary from EmployeeSalary group by Salary Having Salary > 50000 

--update , delete
update Employee set EmployeeID = 1010 where FirstName = 'sharukh'
delete from Employee where EmployeeID = 1010

--CTE (common table expression)
with cte_table as (
select * from Employee emp full Outer join Employee_details emp_de on emp.EmployeeID = emp_de.Employee_ID
)

select * from cte_table

--#temp_table
drop table if exists #temp_Employee   -- tip
create table #temp_Employee (
Employee_ID int, city varchar(50) , salary int)

insert into #temp_Employee 
select * from Employee_details

--TRim , Ltrim , Rtrim 
--Replace 
--substring
--fuzzy matching
--upper , lower
---------------------------------
--stored procedure
--alter procedure

select EmployeeID , salary , (select avg(salary) from EmployeeSalary ) as Avgsalary from EmployeeSalary

subqueries , 
partition by vs group by,
subquery in form , 
subquery in where 
