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