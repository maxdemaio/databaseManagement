USE Orders;

-- Problem 1
SELECT CustFirstName, CustLastName, CustBal
FROM Customer;

-- Problem 2
SELECT CustFirstName, CustLastName, CustBal, CustState
FROM Customer
WHERE CustState = "CO";

-- Problem 3
SELECT *
FROM Product
WHERE ProdPrice > 50
ORDER BY ProdMfg;

-- Problem 4
SELECT CustFirstName, CustLastName, CustBal, CustState
FROM Customer
WHERE (CustCity = "Denver" AND CustBal > 150) OR (CustCity = "Seattle" AND CustBal > 300);

-- Problem 5
-- Cross product style join
SELECT OrdNo, OrdDate, Ordertbl.Custno, CustFirstName
FROM OrderTbl, Customer
WHERE CustState = "CO"
	AND OrderTbl.CustNo = Customer.CustNo;
    
-- Problem 6
SELECT CustNo, AVG(CustBal) AS AvgCustBal, CustCity, CustState
  FROM Customer
  WHERE CustState = "WA"
  GROUP BY CustCity;
