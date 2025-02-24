 CREATE TABLE Source (EmployeeID INT, EmployeeName VARCHAR(20))
 INSERT INTO SOURCE VALUES(103, 'Bob'), (104, 'tia')


 CREATE TABLE Target (EmployeeID INT, EmployeeName VARCHAR(20))

 SELECT * FROM Source
 SELECT * FROM Target

 SELECT @@SERVERNAME


 CREATE TABLE PART13 (ID INT, PRODUCT VARCHAR(100), SALESYEAR INT, QUANTITY INT)
 INSERT INTO PART13 VALUES (1, 'Laptop', 1998, 2500),(2, 'Laptop', 1999, 3600),(3, 'Laptop', 2000, 4200),
						   (4, 'Keyboard', 1998, 2300),(5, 'Keyboard', 1999, 4800),(6, 'Keyboard', 2000, 5000),
						   (7, 'Mouse', 1998, 6000),(8, 'Mouse', 1999, 3400),(9, 'Mouse', 2000, 4600)

SELECT 'TOTALSALES' AS TotalSales, [1998], [1999], [2000] FROM
(SELECT SALESYEAR, QUANTITY FROM PART13)p
PIVOT (
SUM(QUANTITY) FOR SALESYEAR IN([1998], [1999], [2000])
) AS PIVOTTABLE


create procedure [dbo].[LOAD_TARGET]
as
begin
merge dbo.TARGET as T
using dbo.SOURCE as S
on (T.EmployeeID = S.EmployeeID )
when MATCHED then 
update set T.EmployeeName = S.EmployeeName
when NOT MATCHED by TARGET then 
insert (EmployeeID, EmployeeName)
values (S.EmployeeID, S.EmployeeName);
end 
go


create table OLTP(
empid int,
ename varchar(50),
esalary money,
egender char(1),
ecity char(10))

insert into OLTP values (1,'Ram', 10000, 'M', 'HYD'),(2,'Anu', 30000, 'F', 'CHN'),(3,'Kiran', 40000, 'M', 'BLR')

create table OLAP(
empid int,
ename varchar(50),
esalary money,
egender char(1),
ecity char(10),
IsCurrent varchar(50))

select * from OLTP
select * from OLAP

