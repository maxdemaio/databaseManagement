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
WHERE CustCity = "Denver"
	AND CustBal > 150;
