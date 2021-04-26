-- Extra Practice Problems for Module 5
USE orders;

-- Quick test
SELECT * FROM ordertbl;

-- Problem 1
SELECT OrdNo, OrdDate, Customer.CustNo, CustFirstName, CustLastName,
		Employee.EmpNo, EmpFirstName, EmpLastName
	FROM ordertbl, customer, employee
	WHERE CustState = 'CO' AND OrdDate BETWEEN '2017-01-01' AND '2017-01-31'
		AND ordertbl.CustNo = customer.CustNo
		AND ordertbl.EmpNo = employee.EmpNo;

-- Problem 2
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
SELECT OrderTbl.OrdNo, SUM(Qty*ProdPrice) AS TotOrdAmt
  FROM OrderTbl, OrdLine, Product
  WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND OrdLine.ProdNo = Product.ProdNo
  GROUP BY OrderTbl.OrdNo;

-- Problem 4
-- Note: Have to have all non operation cols in the Group By statement
SELECT OrderTbl.OrdNo, SUM(Qty*ProdPrice) AS TotOrdAmt,
	Customer.CustNo, CustFirstName, CustLastName
  FROM OrderTbl, OrdLine, Product, Customer
  WHERE OrdDate = '2017-01-23'
        AND OrderTbl.OrdNo = OrdLine.OrdNo
        AND ordertbl.CustNo = customer.CustNo
        AND OrdLine.ProdNo = Product.ProdNo
  GROUP BY OrderTbl.OrdNo, CustFirstName, CustLastName;
  
-- Problem 5
-- INSERT INTO customer
-- 	(CustNo, CustFirstName, CustLastName, CustStreet, 
-- 		CustCity, CustState, CustZip, CustBal)
-- VALUES ("999", "Max", "DeMaio", "Princeton", "Newport", "CT", "02888", 999);

-- Problem 6
-- INSERT INTO employee
-- 	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, 
-- 		EmpEMail, SupEmpNo, EmpCommRate)
-- VALUES ("77665432", "Max", "DeMaio", "860666", "max@max.com", NULL, 0.030);

-- Problem 7 
SET SQL_SAFE_UPDATES = 0;

UPDATE product 
  SET ProdPrice = ProdPrice * 1.1 
  WHERE ProdName LIKE '%Ink Jet%';

-- Problem 8 
DELETE FROM Customer
  WHERE CustNo = '999';
DELETE FROM Employee
  WHERE EmpNo = '77665432';

SET SQL_SAFE_UPDATES = 1;