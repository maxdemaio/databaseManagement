USE orderstutorial2;

-- Check tables for data
SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM ordertbl;

-- Insert new data into tables
INSERT INTO Customer
	(CustNo, CustFirstName, CustLastName, CustCity,
 	CustState, CustZip, CustBal) 
	VALUES('C0954327','Sheri','Gordon','Littleton','CO','80129-5543',230.00);

INSERT INTO Employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail)
	VALUES ('E8544399','Joe','Jenkins','(303) 221-9875','JJenkins@bigco.com');

INSERT INTO OrderTbl
	(OrdNo, OrdDate, CustNo, EmpNo)
	VALUES ('O9919699','2017-02-11','C9857432','E9954302');