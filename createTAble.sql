CREATE RULE dept_name_rule2
AS @deptname NOT IN ('accounts','stores')


CREATE RULE min_price_rule2
AS @minprice >= $5000


CREATE RULE emp_code_rule3
AS @empcode LIKE '[F M][A-Z][0-9][0-9][0-9]'
drop rule emp_code_rule2

create table emp4
(
empcode varchar(5),
minprice float,
deptname varchar(50)
)


sp_bindrule 'dept_name_rule2','emp4.deptname'
sp_bindrule 'min_price_rule2','emp4.minprice'
sp_bindrule 'emp_code_rule3','emp4.empcode'

insert into emp4 values('FA343',7500.00,'Sales')

select * from emp4

-------------create user dedine datatype ----

create type DSCRP
from varchar (100) not null

create table Test 
(
id int primary key,
name DSCRP,
Address DSCRP
)

insert into Test values(1,'Abhay','Kanpur')

select * from Test


---------------Activity---------------

create table student 
(
RegNo int not null,
Name varchar(100),
Marks int
)

alter table student 
add primary key(RegNo)

alter table student 
add college varchar(100) default 'ou'

alter table student 
alter column Name varchar(100) not null

alter table student
add constraint ck check(Marks between 1 and 100) 

insert into student(RegNo, Name,Marks) values (1,'sa',32)
insert  into student values (2,'abc',78,'jntu')
insert  into student values (3,'efg',77,'ou')

select * from tblstudent

sp_rename 'student','tblstudent'

---------------create table---------



create table EmpData
(
EmpName varchar(20),
EmpNo int not null,
EmpAddress varchar(60),
Salary int 
)

INSERT EmpData
VALUES ('Anshu', 101, 'kanpur', 2500)
INSERT EmpData
VALUES ('Jerry', 102, 'London', 3500)

INSERT EmpData
VALUES ('Tom', 103, 'US', 4500)

INSERT EmpData
VALUES ('James', 104, 'England', 5500)

INSERT EmpData
VALUES ('Mack', 105, 'Iceland', 6500)

select * from EmpData

UPDATE EmpData
SET EmpAddress = '123 Shi Lu' 
WHERE EmpNo = 101

delete from EmpData
where EmpNo = 105

------------Copying data from an existing table into a new table:
SELECT * INTO PreferredEmployee
FROM HumanResources.EmployeePayHistory
WHERE Rate >= 35


------------insert the image in the table -------

USE TekSoft
INSERT INTO EmpDetails(EmployeeID, 
EmployeeName, EmployeeAddress, EmployeeDept, 
EmployeePhoto)
VALUES(NEWID(),'Mark', 'California', 
'Testing',cast('C:\Users\Public\Pictures\Sample Pictures\Koala.jpg'as 
varbinary(max)))

select * from EmpDetails

-----------------Stroring unstructured data into Table

USE TekSoft
INSERT INTO Country_Location(CountryID, 
CountryLocation) VALUES (1001, 
Geography::Parse('POINT(-83.0086 39.95954)'))

select * from Country_Location

SELECT CountryID, CountryLocation.ToString() AS 
Location FROM Country_Location



