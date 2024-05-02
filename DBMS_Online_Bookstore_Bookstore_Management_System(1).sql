create database Bookstore;
use Bookstore;

create table Books(
ISBN int primary key,
Title varchar(20),
Genre varchar(20),
Author varchar(20),
Price int 
);

insert into Books values(123,"Harry Potter","Fiction","J.K. Rowling",450);
insert into Books values(234,"Make Epic Money","Non-Fiction","Ankur Warikoo",500);
insert into Books values(345,"Wings On Fire","Biography","Arun Tiwari",550);
insert into Books values(456,"Book Of Nature","Poetry","Arjit Trivedi",600);
insert into Books values(567,"The Visitor","Thriller","KL Slater",650);

select * from Books;





create table Customer(
CustomerID int primary key,
Name varchar(20),
PhoneNumber int,
Address varchar(20),
UserName varchar(20)
);

INSERT INTO Customer VALUES(1, 'John Doe', 12345678, '123 Main St', 'johndoe123');
INSERT INTO Customer VALUES(2, 'Jane Smith', 98765432, '456 Elm St', 'janesmith456');
INSERT INTO Customer VALUES(3, 'Michael Johnson', 55512345, '789 Oak St', 'michaelj');
INSERT INTO Customer VALUES(4, 'Emily Davis', 11122233, '321 Pine St', 'emilyd');
INSERT INTO Customer VALUES(5, 'Chris Brown', 99988877, '654 Birch St', 'chrisb');

select * from Customer;








create table Orders(
OrderID int primary key,
CustomerID int,       
OrderDate date,                            
TotalPrice int,
Status varchar(20),
foreign key(CustomerID) references Customer(CustomerID)
);

INSERT INTO Orders VALUES(1, 1, '2024-04-23', 100, 'Pending');
INSERT INTO Orders VALUES(2, 2, '2024-04-22', 150, 'Completed');
INSERT INTO Orders VALUES(3, 3, '2024-04-21', 200, 'Pending');                         
INSERT INTO Orders VALUES(4, 1, '2024-04-20', 120, 'Completed');

select * from Orders;








create table Payment(
PaymentID int primary key,
OrderID int,
TotalAmount int,
PatmentDate date,
PaymentMethod varchar(10),
Status varchar(20),
foreign key(OrderID) references Orders(OrderID)
);

INSERT INTO Payment VALUES(1, 1, 100, '2024-04-23', 'Credit', 'Completed');
INSERT INTO Payment VALUES(2, 2, 150, '2024-04-22', 'Debit', 'Completed');
INSERT INTO Payment VALUES(3, 3, 200, '2024-04-21', 'Cash', 'Pending');
INSERT INTO Payment VALUES(4, 4, 120, '2024-04-20', 'Credit', 'Completed');
INSERT INTO Payment VALUES(5, 5, 90, '2024-04-19', 'Debit', 'Pending');

select * from Payment;








create table Administrator(
AdminID int primary key,
Name varchar(20),
UserName varchar(20)
);

INSERT INTO Administrator VALUES(1, 'John Doe', 'johndoe_admin');
INSERT INTO Administrator VALUES(2, 'Jane Smith', 'janesmith_admin');
INSERT INTO Administrator VALUES(3, 'Michael Johnson', 'michaelj_admin');
INSERT INTO Administrator VALUES(4, 'Emily Davis', 'emilyd_admin');
INSERT INTO Administrator VALUES(5, 'David Brown', 'davidb_admin');

select * from Administrator;










create table OrderDetails(
OrderID int,
ISBN int,
Quantity int,
foreign key(OrderID) references Orders(OrderID),
foreign key(ISBN) references Books(ISBN)
);



create table AdminBooks(
AdminID int,
ISBN int,
foreign key(AdminID) references Administrator(AdminID),
foreign key(ISBN) references Books(ISBN)
);





create table AdminCustomers(
AdminID int,
CustomerID int,
foreign key(AdminID) references Administrator(AdminID),
foreign key(CustomerID) references Customer(CustomerID)
);




