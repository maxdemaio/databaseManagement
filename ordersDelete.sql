USE orderstutorial2;

-- Check tables for data
SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM ordertbl;

-- Delete rows added
SET SQL_SAFE_UPDATES = 0;

DELETE FROM OrderTbl
  WHERE OrdNo = 'O9919699';
  
DELETE FROM Employee
  WHERE EmpNo = 'E8544399';
  
DELETE FROM Customer
  WHERE CustNo = 'C0954327';

SET SQL_SAFE_UPDATES = 1;