
use temp;


CREATE TABLE Customer (
id integer PRIMARY KEY,
cname varchar(225),
Address varchar(225),
Gender char(2),
City varchar(225),
Pincode integer
) ;
insert into customer(id,cname,address,gender,city,pincode)
values(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002);
INSERT INTO Customer
VALUES (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(1300, 'Shayam Singh', 'Ludhiana H.O','M','Ludhiana', 141001),
(245, 'Neelabh Shukla','Ashok Nagar','M','Jalandhar', 144003),
(210, 'Barkha Singh','Dilbagh Nagar', 'F','Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

INSERT INTO Customer
VALUES (1252, 'Ram Kumar3','Dilbagh Nagar', 'M', 'Jalandhar', NULL);


CREATE TABLE Order_details (
Order_id integer,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) references Customer(id)
);

INSERT INTO Order_details
VALUES (1, '2019-03-11', 245);

DELETE FROM Customer WHERE id = 245;

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
