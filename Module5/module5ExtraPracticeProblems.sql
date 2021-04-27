-- Extra Practice Problems for Module 5
-- MGD MySQL Responses

USE orders;

-- Quick test
SELECT * FROM ordertbl;

-- Problem 1
-- List the order number, order date, customer 
-- number, customer name (first and last), employee number, 
-- and employee name (first and last) of January 2017 orders placed by Colorado customers.
SELECT OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName,
		Employee.EmpNo, EmpFirstName, EmpLastName
	FROM ordertbl, customer, employee
	WHERE CustState = 'CO' AND OrdDate BETWEEN '2017-01-01' AND '2017-01-31'
		AND ordertbl.CustNo = customer.CustNo
		AND ordertbl.EmpNo = employee.EmpNo;

-- Problem 2
-- List the customer number, name (first and last), order number, 
-- order date, employee number, employee name (first and last), 
-- product number, product name, and order cost (OrdLine.Qty * ProdPrice) for 
-- products ordered on January 23, 2017, in which the order cost exceeds $150.
SELECT OrdDate, Customer.CustNo, CustFirstName, CustLastName,
		Employee.EmpNo, EmpFirstName, EmpLastName,
        Ordline.OrdNo,
        Product.ProdNo, ProdName, (ProdPrice * Qty) AS OrderCost
	FROM ordertbl, customer, employee, ordline, product
	WHERE OrdDate = '2017-01-23' AND (ProdPrice * Qty) > 150
		AND ordertbl.CustNo = customer.CustNo
		AND ordertbl.EmpNo = employee.EmpNo
        AND ordertbl.OrdNo = ordline.OrdNo
        AND ordline.ProdNo = product.ProdNo;

-- Problem 3
-- OrderTbl has OrdNos unique, so when we take the sum from the orderline table,
-- we grab all quantities and sum them for each unique ordno (multiple exist)
-- ************
-- List the order number and total amount 
-- for orders placed on January 23, 2017. The total amount of an 
-- order is the sum of the quantity times the product price of each product on the order.
SELECT OrderTbl.OrdNo, SUM(Qty*ProdPrice) AS TotOrdAmt
  FROM OrderTbl, OrdLine, Product
  WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND OrdLine.ProdNo = Product.ProdNo
  GROUP BY OrderTbl.OrdNo;

-- Problem 4
-- Note: Have to have all non operation cols in the Group By statement
-- ************
-- List the order number, order date, customer name 
-- (first and last), and total amount for orders placed on January 23, 2017. 
-- The total amount of an order is the sum of the quantity times the product price 
-- of each product on the order.
SELECT OrderTbl.OrdNo, SUM(Qty*ProdPrice) AS TotOrdAmt,
	Customer.CustNo, CustFirstName, CustLastName
  FROM OrderTbl, OrdLine, Product, Customer
  WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND ordertbl.CustNo = customer.CustNo
        AND OrdLine.ProdNo = Product.ProdNo
  GROUP BY OrderTbl.OrdNo, CustFirstName, CustLastName;
  
-- Problem 5
-- Insert yourself as a new row in the Customer table.
-- INSERT INTO customer
-- 	(CustNo, CustFirstName, CustLastName, CustStreet, 
-- 		CustCity, CustState, CustZip, CustBal)
-- VALUES ("999", "Max", "DeMaio", "Princeton", "Newport", "CT", "02888", 999);

-- Problem 6
-- Insert an imaginary friend as a new row in the Employee table.
-- INSERT INTO employee
-- 	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, 
-- 		EmpEMail, SupEmpNo, EmpCommRate)
-- VALUES ("77665432", "Max", "DeMaio", "860666", "max@max.com", NULL, 0.030);

-- Problem 7
-- Increase the price by 10 percent of products containing 
-- the words Ink Jet. In MySQL, you need to place the 
-- UPDATE statement between two SET statements.
SET SQL_SAFE_UPDATES = 0;

UPDATE product 
  SET ProdPrice = ProdPrice * 1.1 
  WHERE ProdName LIKE '%Ink Jet%';

-- Problem 8 
-- Delete the new rows added to the Customer and Employee tables.
DELETE FROM Customer
  WHERE CustNo = '999';
DELETE FROM Employee
  WHERE EmpNo = '77665432';

SET SQL_SAFE_UPDATES = 1;