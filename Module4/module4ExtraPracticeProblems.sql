-- MGD MySQL Responses

USE Orders;

-- Problem 1
-- List the customer number, the name (first and last), and the balance of customers.
SELECT CustFirstName, CustLastName, CustBal
FROM Customer;

-- Problem 2
-- List the customer number, the name (first and last), 
-- and the balance of customers who reside in Colorado (CustState is CO).
SELECT CustFirstName, CustLastName, CustBal, CustState
FROM Customer
WHERE CustState = "CO";

-- Problem 3
-- List all columns of the Product table for 
-- products costing more than $50.  Order the result by product 
-- manufacturer (ProdMfg) and product name.
SELECT *
FROM Product
WHERE ProdPrice > 50
ORDER BY ProdMfg;

-- Problem 4
-- List the customer number, the name (first and last), the city, 
-- and the balance of customers who reside in Denver with a 
-- balance greater than $150 or who reside in Seattle with a balance greater than $300.
SELECT CustFirstName, CustLastName, CustBal, CustState
FROM Customer
WHERE (CustCity = "Denver" AND CustBal > 150) OR (CustCity = "Seattle" AND CustBal > 300);

-- Problem 5
-- Cross product style join
-- ***************
-- List the order number, order date, customer number, and 
-- customer name (first and last) of orders placed in January 2013 sent to Colorado recipients.
SELECT OrdNo, OrdDate, Ordertbl.Custno, CustFirstName
FROM OrderTbl, Customer
WHERE CustState = "CO"
	AND OrderTbl.CustNo = Customer.CustNo;
    
-- Problem 6
-- List the average balance of customers by city. 
-- Include only customers residing in Washington state (WA).
SELECT CustNo, AVG(CustBal) AS AvgCustBal, CustCity, CustState
  FROM Customer
  WHERE CustState = "WA"
  GROUP BY CustCity;

-- Problem 7
-- List the average balance and number of customers by city. 
-- Only include customers residing in Washington State (WA).  
-- Eliminate cities in the result with less than two customers.
SELECT *, COUNT(*), AVG(CustBal) AS AvgCustBal
  FROM Customer
  WHERE CustState = "WA"
  GROUP BY CustCity
  HAVING COUNT(*) > 1;
  