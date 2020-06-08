--Solutions for Select Statements Using Different Functions
--Q[1]
--Using count function
select count(BookID) BooksNumber
from TbBooks


--Q[2]
--Using sum function
select sum([Price ($)]) as summation
from TbBooks


--Q[3]
--Using max function
select max([Price ($)])MaximumPrice
from TbBooks


--Q[4]
--Using min function
select min([Price ($)]) as MinimumPrice
from TbBooks


--Q[5]
--Using SYSTEM_USER function
Select SYSTEM_USER as SystemUser


--Q[6]
--Using avg function
select avg ([Price ($)]) as AveragePrice
from TbBooks


--Q[7]
--Using NCHAR function
select NCHAR(77) as NumberCodeToUnicode 


--Q[8]
--Using DAY function
select DAY(OrderDate) as Day
from TbOrders
where OrderID = 1


--Q[9]
--Using SESSION_USER function
select SESSION_USER  AS CurrentUserName


--Q[10]
--Using CAST function
select CAST([Price ($)] as VARCHAR) as DecToVarchar
from TbBooks
where BookID = 2


--Q[11]
--Using year function
select year(OrderDate) as Year
from TbOrders
where OrderID =2


--Q[12]
--Using ISDATE function
--ISDATE(return 1 if it is true or 0 if it is false)
select ISDATE('6-10-2013') as DateValidation


--Q[13]
--Using MONTH function
select MONTH(OrderDate) as Month
from TbOrders
where OrderID =5


--Q[14]
--Using UNICODE function
select UNICODE(BookName) as CharacterUNICODE
from TbBooks
where BookID = 3
--The first character in book number 3 is "T" which it's unicode is 84


--Q[15]
--Using str function
select str(143.786, 5, 2) as StringNumber


--Q[16]
--Using len function
select len(CustomerName) as NameLength
from TbCustomers
where CustomerID = 1
--The length of "Ahmed Ehab" is 10

--Q[17]
--Using REVERSE function
select reverse(CustomerName) as ReversedName
from TbCustomers
where CustomerID = 4
--revrsing the name "Mohamed Ali"

--Q[18]
--Using STUFF function
select stuff(CustomerName,1,5,'Mahmoud') as NewName
from TbCustomers
where CustomerID = 1


--Q[19]
--Using GET_DATE function
select GETDATE() as CurrentDateTime
--Shows the current date and time for database


--Q[20]
--Using UPPER function
select UPPER(CustomerName) as NoSpaceName
from TbCustomers
where CustomerID = 5



--Select Statements using Sub Query
--[1]
select BookName, [Price ($)] as Books
from TbBooks
where [Price ($)] > (select [Price ($)] 
from TbBooks where BookID = 3)

--[2]
select CustomerName, Country
from TbCustomers
where Country <> (select Country 
from TbCustomers where CustomerID = 1)


--[3]
select BookName, [Price ($)]
from TbBooks
where [Price ($)]< all (select [Price ($)]
from TbBooks where BookID = 6 or BookID = 1 )

--[4]
select * from TbBooks
where BookID > any (select BookID 
from TbBooks where BookID = 4)



--Select Statements using Count and Group Functions 
--[1]
select count(CustomerID) as CustomersCount, Country
from TbCustomers
group by Country

--[2]
select count(BookName) as BooksCount, [Price ($)]
from TbBooks
where [Price ($)] between 20 and 40
group by [Price ($)]



--Select Statements using Different Joins 
--[1]
select BookName, AuthorName
from TbBooks inner join TbAuthor
on TbBooks.AuthorID = TbAuthor.AuthorID

--[2]
select *
from TbBooks right join TbCategories
on TbBooks.CategoryID = TbCategories.CategoryID

--[3]
select * 
from TbCustomers left join TbOrders
on TbCustomers.CustomerID = TbOrders.CustomerID

--[4]
select BookName , CategoryName
from TbBooks join TbCategories
on TbBooks.CategoryID = TbCategories.CategoryID

--[5]
select CustomerName, BookName
from TbBooks join TbOrders 
on TbOrders.BookID = TbBooks.BookID
join TbCustomers
on TbOrders.CustomerID = TbCustomers.CustomerID



--Insert Statement 
--[1]
insert into TbAuthor
values (
'Emily Henry'
)

--[2]
insert into TbBooks
values (
'Beach Read',
9781984806734,
12,
11,
7
)

--[3]
insert into TbCustomers
values (
'Ahmed Alaa',
'Bor Saeed',
'01089447165'
)

--[4]
insert into TbOrders
values (
1,
10,
3,
'9-18-2019'
)

--[5]
insert into TbCategories
values (
'Fairy Tale'
)



--Update Statement 
--[1]
update TbCategories
set CategoryName = 'Programming'
where CategoryID = 1

--[2]
update TbCustomers
set CustomerName = 'Esam El Mahdy'
where CustomerID = 3

--[3]
update TbBooks
set BookName = 'Tiger Woods'
where BookID = 7

--[4]
update TbAuthor
set AuthorName = 'Jeff Benedict'
where AuthorID = 7

--[5]
update TbOrders
set BookID = 5, Quantity = 9
where OrderID = 1



--Delete Statement 
--[1]
delete from TbCategories
where CategoryID = 6

--[2]
delete from TbOrders
where OrderID = 3

--[3]
delete from TbCustomers
where CustomerID = 6

--[4]
delete from TbBooks
where BookID = 2

--[5]
delete from TbAuthor
where AuthorID = 2
