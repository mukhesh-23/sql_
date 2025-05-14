create database org;
show databases;
use org;
create table worker(
worker_id int not null primary key auto_increment,
first_name char(25),
last_name char(25),
salary int(15),
joining_date datetime,
department char(25)
);
insert into worker(
worker_id,first_name,last_name,salary,joining_date,department) values
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishat', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');


select * from worker;




create table Bonus(
worker_ref_id int,
bonus_amount int(10),
bonus_date datetime,
foreign key (worker_ref_id)
  references worker(worker_id)
on delete cascade
); 

insert into Bonus(worker_ref_id,bonus_amount,bonus_date) values
(001,5000,'16-02-20'),
(002,3000,'16-06-11'),
(003,4000,'16-02-20'),
(001,4500,'16-02-20'),
(002,3500,'16-06-11');


create table Title(
worker_ref_id int,
worker_title char(25),
affected_from datetime,
foreign key (worker_ref_id)
references Worker(worker_id)
on delete cascade
);
INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

select first_name,salary from Worker;

select 55+11;

select now();

select ucase('sarvani');


select * from Worker where salary>100000;

select * from Worker where department='HR';

-- inclusive (80000 and 300000 will also print if in salary)
select * from Worker where salary between 80000 and 300000;


-- reduce OR statements
-- HR, ADMIN
select * from Worker where department='HR' or department='ADMIN';

-- REPLACING MULTIPLE ORs with single IN keyword
select * from Worker where department in ('HR','ADMIN','ACCOUNT');

-- using NOT keyword
select * from Worker where department not in('HR','ADMIN');

-- is NULL
select * from Worker where salary is null;


-- pattern searching/wildcard('%','_')
-- worker name which contains "i"
select * from worker where first_name like '%i%';

-- worker name whose second letter is "i"
select * from worker where first_name like '_i%';

-- sorting
select * from worker order by salary; -- by default ascending order

-- descending order
select * from worker order by salary desc;

-- distinct values
select DISTINCT department from worker;

-- data grouping(GROUP BY -> AGGREGATION -> COUNT,SUM,MIN,MAX)
select department from worker group by department; -- bydefault distinct keyword

-- find no of employees working in different department
select department,count(department) from worker group by department;

-- AVG salary per department
select department,AVG(salary) from worker group by department;

-- MIN
select department,MIN(salary) from worker group by department;

-- MAX
select department,MAX(salary) from worker group by department;

-- SUM
select department,SUM(salary) from worker group by department;

-- HAVING
-- just like whenever using where for filteration,we use select
-- we use having keyword to filter whenever group by is used

-- department,count having more than 2 workers
-- GROUP BY HAVING
select department,count(department) from worker group by department having count(department)>1;


-- DEFAULT
use temp;
create table account(
id int primary key,
name varchar(255) unique,
balance int not null default 0,
constraint acc_balance_chk check(balance>1000)
);
select * from account;
insert into account(id,name) values(1,"A");
insert into account(id,name,balance) values(2,"B",100000);

DROP TABLE ACCOUNT;

-- adding new column in an existing table
alter table account add interest float not null default 0;

-- modify datatype of existing column in a table
alter table account modify interest double not null default 0;
select * from account;

-- describe table
desc account;

-- renaming column name in a table
-- alter table table_name change column old_columnname new_columnname datatype
alter table account change column interest saving_interest float not null default 0;

-- drop column
alter table account drop column saving_interest;

-- rename table
alter table account rename to account_details;
desc account_details;


-- DATA MODIFICATION LANGUAGE (INSERT,UPDATE,DELETE,REPLACE)

-- update
update Customer set address="Mumbai", gender='M' where id=121;

select * from customer;

-- update multiple rows
update Customer set pincode=110000;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- to get rid of above error use the below line for updation of whole rows
set sql_safe_updates=0;
update Customer set pincode=110000;

set sql_safe_updates=1;

-- DELETE
delete from Customer where id=210;

-- delete whole entries of customer table
-- before executing below command,enable set sql_safe_updates to 1 for the execution of below command
delete from customer;


-- foreign key can have null value

-- REPLACE
-- if there's no data it will insert else it will replace the exisiting with new data
replace into customer(id,city) values(1251,'Colony');



