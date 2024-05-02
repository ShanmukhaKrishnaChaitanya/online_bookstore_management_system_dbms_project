create database bookstore_test;

create table Book(
ISBN int primary key,
Title varchar(20),
Genre varchar(20),
Author varchar(20),
Price int 
);

insert into Book values(123,"Harry Potter","Fiction","J.K. Rowling",450);
insert into Book values(234,"Make Epic Money","Non-Fiction","Ankur Warikoo",500);
insert into Book values(345,"Wings On Fire","Biography","Arun Tiwari",550);
insert into Book values(456,"Book Of Nature","Poetry","Arjit Trivedi",600);
insert into Book values(567,"The Visitor","Thriller","KL Slater",650);

select * from Book;





update Book set Genre="Auto Biography" where ISBN=345;
delete from Book where ISBN=123 or Genre="Thriller";
insert into Book values(789,"The Destiny","Non-Fiction","DK Gupta",700);
alter table Book add Year int;
select sum(Price) as TotalCost from Book;




CREATE VIEW BooksView AS
SELECT ISBN, Title, Genre, Author, Price
FROM Books;

SELECT * FROM BooksView;




CREATE VIEW CustomerOrdersView AS
SELECT o.OrderID, o.CustomerID, c.Name AS CustomerName, o.OrderDate, o.TotalPrice, o.Status
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID;

SELECT * FROM CustomerOrdersView;






CREATE VIEW PaymentDetailsView AS
SELECT p.PaymentID, p.OrderID, o.CustomerID, c.Name AS CustomerName, p.TotalAmount, p.PatmentDate, p.PaymentMethod, p.Status
FROM Payment p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID;

select * from PaymentDetailsView;











drop view AdministratorBooksView;


CREATE VIEW AdministratorBooksView AS
SELECT ab.AdminID, a.Name AS AdminName, ab.ISBN, b.Title, b.Author, b.Price
FROM AdminBooks ab
JOIN Administrator a ON ab.AdminID = a.AdminID
LEFT JOIN Books b ON ab.ISBN = b.ISBN;

select * from AdministratorBooksView;

SELECT * FROM AdminBooks;

INSERT INTO AdminBooks (AdminID, ISBN) VALUES (1, 345);
INSERT INTO AdminBooks (AdminID, ISBN) VALUES (2, 456);



CREATE VIEW AdminCustomersView AS
SELECT ac.AdminID, a.Name AS AdminName, c.CustomerID, c.Name AS CustomerName, c.PhoneNumber, c.Address, c.UserName
FROM AdminCustomers ac
JOIN Administrator a ON ac.AdminID = a.AdminID
JOIN Customer c ON ac.CustomerID = c.CustomerID;

INSERT INTO AdminCustomers (AdminID, CustomerID) VALUES (1, 1);
INSERT INTO AdminCustomers (AdminID, CustomerID) VALUES (1, 2);
INSERT INTO AdminCustomers (AdminID, CustomerID) VALUES (2, 3);
INSERT INTO AdminCustomers (AdminID, CustomerID) VALUES (2, 4);
INSERT INTO AdminCustomers (AdminID, CustomerID) VALUES (2, 5);

select * from AdminCustomersView;







