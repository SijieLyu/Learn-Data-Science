create database DBEx1;
use DBEx1;
show tables;

create table Employees(	LName varchar(20), 
IDN int, Salary decimal(20, 2), 
Deduction decimal(20, 2));	
# Create the Employees table  
	

insert into Employees values ('Peter', 1, 1000, 10), 
('Mary', 12, 2000, 0), ('Tony', 22, 4000, 32);	
/*  Insert three rows into the Employees table   */  

select * from employees;


create table IRAs(	IDN int, 
IRA_acct varchar(12), 
Balance decimal(20, 2)); 
 /* Create the IRAs table  */

describe iras;

insert into IRAs values(1, 'A1', 100), (22, 'A2', 200), (22, 'A3', 400), (93, 'A4', 500);
select * from iras;

create table AddressCity(	IDN int, 
CompanyCity varchar(22), 
HomeCity varchar(22) );  
/* Create the AddressCity table  */

describe addresscity;

insert into addresscity values (1, 'Saint Louis', 'Saint Louis'), 
(12, 'Saint Louis', 'Chesterfield'), (22, 'Chesterfield', 'Saint Louis'), 
(93, 'Chesterfield', 'Chesterfield');

select * from AddressCity;

select 	lname, idn, salary, deduction, salary - deduction as netpay 
from employees;

show tables;    ## No table NetPayTable yet

create table NetPayTable 
select lname, idn, salary, deduction, salary - deduction as netpay 
from employees;  
-- Create a table called NetPayTable containing the query result of Example1

show tables;    # Now we have the table NetPayTable in the database

select * from NetPayTable;  

select * from NetPayTable order by lname;  

select * from NetPayTable order by lname desc;    # desc is in descending order  
  
# write a query statement to find the total number of ira accounts. See below
select count(IRA_Acct) as NumofAccts from iras;

# write a query statement to find the total number of cities where employees live. Use "distict" argument. 
select count(distinct homecity) as NumofDistinctHomeCities from AddressCity; 

# Example 6: Write a query statement to list all records of NetPayTable from highest salary to lowest salary.
select * from NetPayTable order by salary desc;     --  desc is in descending order 

#   Example 7:  Write a query statement to find the total number of people who have IRA accounts.
select count(distinct idn) as NumofIDNs from iras; 

# Example 8:  Write a query statement to find the average salary of all employees.
select avg(salary) as AverageSalary from Employees;	


## Add more records into tables
# Example 9:  Add rows into tables.
insert into Employees values ('Mike', 17, 4000, 10);
select * from Employees;

insert into addresscity values (17, 'Fenton', 'Fenton');
select * from AddressCity;  # the new row has been added to the table Employees

insert into iras values(93, "A4", 500);
select * from iras;

#Example 10:  Write a query statement to find the records of all employees with salary no higher than $3000.
Select * from employees where salary <= 3000;   

# Example 11:  Write a query statement to find the records of all IRA accounts with balance below $500 and at least $200.
select * from iras where balance < 500 and balance >=200;

# Example 12:  Write a query statement to find the highest/lowest salary of all employees.
select max(salary) as HighestSalary from employees;  # the highest Salary
select min(salary) as LowestSalary from employees;  # the lowest Salary

# Write a query statement to find the total number of salary earners.
select count(salary) as NumofSalaryEarners from employees where Salary is not NULL;	
select count(LName) as NumofSalaryEarners from employees where Salary is not NULL;	
select count(*) as NumofSalaryEarners from employees where Salary is not NULL;	

# Example 14:  Write a query statement to find total amount of all salaries paid to all employees.
select sum(salary) as TotalSalary from employees;  # the SUM of all salaries

# Write a query statement to find the average balance all IRA accounts.
select avg(Balance) as AVGBalance from IRAs;	# the average balance

# Example 16:  Write a query statement to find the min/max/avg balance of all accounts.
select Min(Balance) as Min_Balance, 
Max(Balance) as Max_Balance, avg(Balance) as Average_Balance from iras; 

-- Examples of how to use wildcards “%”, “_”, and ESCAPE keyword:
-- [1]	% ---> to specify a pattern of zero (0) or more characters. 
-- [2]	_ underscore wildcard:  ----> to match exactly one character. 
-- [3]	NOT Like:  The NOT logical operator can be used together with the wildcards to return rows that do not match the specified pattern
-- [4]	Escape keyword:  The ESCAPE keyword is used to escape pattern matching characters such as the (%) percentage and underscore (_) if they form part of the data.

#  Suppose I need the record of someone for whom I forgot the name and I only remember the letter “T” followed by another letter in the name.  So, I need to write a query statement to search the records with the letter “T” followed by one letter somewhere in the last name. 
select * from employees where Lname like '%T_%';
select * from employees where Lname like'T%';





