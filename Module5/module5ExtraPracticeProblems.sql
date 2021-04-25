-- Extra Practice Problems for Module 5
USE orders;

-- Quick test
SELECT * FROM customer;

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

