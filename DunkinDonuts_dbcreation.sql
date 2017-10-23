/*Group: Nadira Zahiruddin, Anushka Goyal, Christine Lee */
CREATE DATABASE DunkinDonutsDb;
GO

Use DunkinDonutsDb;
GO

-- Create the customer and order tables
CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(38) NOT NULL,
  Category varchar(38) NOT NULL,
  Price numeric(38) NOT NULL,
  Cost numeric(38) NOT NULL,
  Inventory numeric(38) NOT NULL);

  
CREATE TABLE Customers(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(38) NOT NULL,
  LastName varchar(38) NOT NULL,
  CustomerAddress varchar(38) NOT NULL,
  Email varchar(38) NOT NULL,
  PhoneNumber numeric(38) NOT NULL);

CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(38) NOT NULL,
  LastName varchar(38) NOT NULL,
  EmpAddress varchar(38) NOT NULL,
  StoreID bigint REFERENCES Store(StoreID) NOT NULL);

CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  City varchar(38) NOT NULL,
  State varchar(38) NOT NULL,
  ZipCode numeric(38) NOT NULL,
  Country varchar(38) NOT NULL,
  Region varchar(38) NOT NULL);

CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate numeric(38) NOT NULL,
  TotalPrice numeric(38) NOT NULL,
  EmployeeID bigint REFERENCES Employee(EmployeeID) NOT NULL);

CREATE TABLE OrderDetail(
  OrderDetailID bigint NOT NULL PRIMARY KEY,
  Price numeric(38) NOT NULL,
  Quantity numeric(38),
  CustomerID bigint REFERENCES Customers(CustomerID) NOT NULL,
  StoreID bigint REFERENCES Store(StoreID) NOT NULL,
  OrderID bigint REFERENCES Orders(OrderID) NOT NULL,
  ProductID bigint REFERENCES Product(ProductID) NOT NULL);
  

-- Create the relationship: the first FK in CourseEnrollment

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Employee 
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Orders 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
GO

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Product 
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO

-- We will use designer view to create another relationship: the second FK in CourseEnrollment


-- Add a few students
INSERT INTO Customers(CustomerID, FirstName, LastName, CustomerAddress, Email, PhoneNumber) VALUES 
(1, 'Jason', 'Lee', '1 Babson Drive, Wellesley, MA', 'jlee@babson.edu', '1234567890'),
(2, 'Evan', 'Lehrman', '2 Babson Drive, Wellesley, MA', 'elehrman@babson.edu', '2345678901'),
(3, 'Yating', 'Lu', '3 Babson Drive, Wellesley, MA', 'ylu@babson.edu', '3456789012'),
(4, 'Erica', 'Fishberg', '4 Babson Drive, Wellesley, MA', 'efishberg@babson.edu', '4567890123'),
(5, 'Jamie', 'Traverso', '5 Babson Drive, Wellesley, MA', 'jtraverso@babson.edu', '5678901234'),
(6, 'Kyle', 'Waldron', '6 Babson Drive, Wellesley, MA', 'kwaldron@babson.edu', '6789012345'),
(7, 'Nadira', 'Zahiruddin', '7 Babson Drive, Wellesley, MA', 'nzahiruddin@babson.edu', '7890123456'),
(8, 'Justin', 'Lee', '8 Babson Drive, Wellesley, MA', 'jlee1@babson.edu', '8901234567'),
(9, 'Christine', 'Lee', '9 Babson Drive, Wellesley, MA', 'clee@babson.edu', '9012345678'),
(10, 'Abbygail', 'Sardjono', '10 Babson Drive, Wellesley, MA', 'asardjono@babson.edu', '0123456789');
GO

INSERT INTO Employee(EmployeeID, FirstName, LastName, EmpAddress, StoreID) VALUES
(1, 'Anushka', 'Goyal', '11 Babson Drive, Wellesley, MA', 1),
(2, 'Tanisha', 'Jatia', '12 Babson Drive, Wellesley, MA', 2),
(3, 'Cynthia', 'Yong', '13 Babson Drive, Wellesley, MA', 3), 
(4, 'Clara', 'Linanda', '300 2nd Avenue, Needham, MA', 4),
(5, 'Sid', 'Goyal', '231 Forest Street, Wellesley, MA', 5),
(6, 'Tim', 'Zhi', '14 Babson Drive, Wellesley, MA', 1),
(7, 'Amina', 'Nguyen', '15 Babson Drive, Wellesley, MA', 2),
(8, 'Alastair', 'Ng', '44 Decatur Street, Arlington, MA', 3),
(9, 'Kwang', 'Jitsakula', '98 Babson Way, Wellesley, MA', 4),
(10, 'Mild', 'Thamparanon', '300 2nd Avenue, Wellesley, MA', 5);
GO

INSERT INTO Orders(OrderID, OrderDate, TotalPrice, EmployeeID) VALUES
(1, 02012009, 1.9, 3),
(2, 02022009, 3, 2),
(3, 02032009, 4.2, 1),
(4, 02042011, 7.8, 4),
(5, 02052011, 2.4, 5),
(6, 02062011, 3.4, 10),
(7, 02072011, 7.4, 9),
(8, 02082010, 6.8, 8),
(9, 02092010, 7.8, 7),
(10, 02102010, 4.8, 6);
GO

INSERT INTO Store(StoreID, City, State, ZipCode, Country, Region) VALUES
(1, 'Cochicuate', 'MA', 02789, 'USA', 'East Coast'),
(2, 'Framingham', 'MA', 02558, 'USA', 'East Coast'),
(3, 'Natick', 'MA', 02392, 'USA', 'East Coast'),
(4, 'Worcester', 'MA', 01607, 'USA', 'East Coast'),
(5, 'Westborough', 'MA', 90785, 'USA', 'East Coast');
GO

INSERT INTO OrderDetail(OrderDetailID, CustomerID, StoreID, OrderID, Price, Quantity, ProductID) VALUES
(1, 1, 1, 1, 1.9, 2, 1),
(2, 2, 2, 2, 3, 2, 2),
(3, 3, 3, 3, 4.2, 2, 3),
(4, 4, 4, 4, 7.8, 2, 4),
(5, 5, 5, 5, 2.4, 0, 5),
(6, 6, 1, 6, 3.2, 2, 1),
(7, 7, 2, 7, 7.4, 2, 2),
(8, 8, 3, 8, 6.8, 2, 3),
(9, 9, 4, 9, 7.8, 2, 4),
(10, 10, 5, 10, 4.8, 2, 5);
GO


INSERT INTO Product(ProductID, ProductName, Category, Price, Cost, Inventory) VALUES
(1, 'Hashbrowns', 'Breakfast', 0.95, 0.20, 5),
(2, 'DonutHoles', 'Donut', 1.5, 0.8, 8),
(3, 'Bagel', 'Breakfast', 2.1, 1.6, 7),
(4, 'CaramelLatte', 'Coffee', 3.9, 0.9, 10),
(5, 'ChocolateDonut', 'Donut', 1.2, 0.3, 5);
GO






-- Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 


-- We will use data view to add grade data


-- Some queries
SELECT * FROM Customers;
SELECT * FROM Product;
SELECT * FROM Store;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Employee;

GO

