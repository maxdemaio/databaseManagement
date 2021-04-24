USE Intercollegiateathletic;

-- Problem 1
SELECT Eventno, Dateheld, Eventrequest.Custno, Eventrequest.Facno,
	Customer.Custname, Facility.Facname, Customer.city
FROM Eventrequest, Customer, Facility
WHERE Eventrequest.Custno = Customer.Custno
	AND Eventrequest.Facno = Facility.Facno
    AND YEAR(dateheld)='2018'
    AND Customer.city = "Boulder";
    
-- Problem 2
SELECT Eventno, Dateheld, Eventrequest.Custno, Eventrequest.Facno,
	Customer.Custname, Facility.Facname,
    (Eventrequest.Estcost/Eventrequest.Estaudience) AS CostPerPerson
FROM Eventrequest, Customer, Facility
WHERE Eventrequest.Custno = Customer.Custno
	AND EventRequest.FacNo = Facility.FacNo
	AND EstCost/EstAudience < 0.2
    AND YEAR(dateheld) = '2018';
    
-- Problem 3
SELECT Customer.CustNo, CustName, SUM(EstCost) AS TotEstCost
  FROM EventRequest, Customer
  WHERE Status = 'Approved'
        AND EventRequest.CustNo = Customer.CustNo
  GROUP BY Customer.CustNo, CustName;

SELECT *
FROM Customer
WHERE Custno = "C999";

-- Problem 4
INSERT INTO Customer (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ("C999", "MMA", "Box 3445", "N", "Joe Rogan", 685699, "Las Vegas", "NV", 80977);

-- Problem 5S
SET SQL_SAFE_UPDATES = 0;

UPDATE Resourcetable
  SET Rate = Rate * 1.1 
  WHERE ResName = 'nurse';

-- Problem 6
DELETE FROM Customer
  WHERE CustNo = 'C999';

SET SQL_SAFE_UPDATES = 1;