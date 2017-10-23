/*Group: Nadira Zahiruddin, Christine Lee, Anushka Goyal */

USE DunkinDonutsdb;
GO

/*1. All records/tables from the database*/

SELECT * FROM Customers;
SELECT * FROM Product;
SELECT * FROM Store;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Employee;

/*2. Total number of products in each category */

SELECT Count(ProductName) AS NumberOfProducts, Category
FROM Product
GROUP BY Category;

/*3. Total Revenue by product */

SELECT sum(o.Price) AS TotalRevenue, p.ProductName
FROM Product AS P
INNER JOIN OrderDetail AS O
ON P.ProductID = o.ProductID
GROUP BY p.ProductName;

/*4. */

SELECT c.CustomerID, c.FirstName, c.LastName, o.Quantity
FROM OrderDetail AS O
FULL OUTER JOIN Customers AS C
ON o.CustomerID = c.CustomerID

/*5. Products with cost greater than the average cost */
SELECT ProductName, Cost
FROM Product
WHERE Cost > (
SELECT AVG(Cost) AS AverageCost
FROM Product
)
