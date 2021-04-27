-- MGD MySQL responses

USE Intercollegiateathletic;

-- Problem 1
-- List the event number, date held, customer number, customer name, 
-- facility number, and facility name of 2018 events placed by Boulder customers.
SELECT Eventno, Dateheld, Eventrequest.Custno, Eventrequest.Facno,
	Customer.Custname, Facility.Facname, Customer.city
FROM Eventrequest, Customer, Facility
WHERE Eventrequest.Custno = Customer.Custno
	AND Eventrequest.Facno = Facility.Facno
    AND YEAR(dateheld)='2018'
    AND Customer.city = "Boulder";
    
-- Problem 2
-- List the customer number, customer name, event number, date held, 
-- facility number, facility name, and estimated audience 
-- cost per person (EstCost / EstAudience) for events held on 2018, in 
-- which the estimated cost per person is less than $0.2
SELECT Eventno, Dateheld, Eventrequest.Custno, Eventrequest.Facno,
	Customer.Custname, Facility.Facname,
    (Eventrequest.Estcost/Eventrequest.Estaudience) AS CostPerPerson
FROM Eventrequest, Customer, Facility
WHERE Eventrequest.Custno = Customer.Custno
	AND EventRequest.FacNo = Facility.FacNo
	AND EstCost/EstAudience < 0.2
    AND YEAR(dateheld) = '2018';
    
-- Problem 3
-- List the customer number, customer name, and total estimated 
-- costs for Approved events. The total amount of events is the sum of the estimated cost 
-- for each event. Group the results by customer number and customer name.
SELECT Customer.CustNo, CustName, SUM(EstCost) AS TotEstCost
  FROM EventRequest, Customer
  WHERE Status = 'Approved'
        AND EventRequest.CustNo = Customer.CustNo
  GROUP BY Customer.CustNo, CustName;

SELECT *
FROM Customer
WHERE Custno = "C999";

-- Problem 4
-- Insert yourself as a new row in the Customer table.
INSERT INTO Customer (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ("C999", "MMA", "Box 3445", "N", "Joe Rogan", 685699, "Las Vegas", "NV", 80977);

-- Problem 5S
-- Increase the rate by 10 percent of resource names equal to nurse. 
-- In MySQL, you need to place the UPDATE statement between two SET statements.
SET SQL_SAFE_UPDATES = 0;

UPDATE Resourcetable
  SET Rate = Rate * 1.1 
  WHERE ResName = 'nurse';

-- Problem 6
-- Delete the new row added to the Customer table.
DELETE FROM Customer
  WHERE CustNo = 'C999';

SET SQL_SAFE_UPDATES = 1;