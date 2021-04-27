-- MGD MySQL Responses

USE intercollegiateathletic;

-- Problem 1
-- List the customer number, the name, the phone number, and the city of customers.
SELECT custno, custname, phone, city
FROM Customer;

-- Problem 2
-- List the customer number, the name, the 
-- phone number, and the city of customers who reside in Colorado (State is CO).
SELECT custno, custname, phone, city
FROM Customer
WHERE state = "CO";

-- Problem 3
-- List all columns of the EventRequest table for 
-- events costing more than $4000.  Order the result by the event date (DateHeld).
SELECT *
FROM EventRequest
WHERE estcost > 4000
ORDER BY dateheld;

-- Problem 4
-- List the event number, the event date (DateHeld), and the 
-- estimated audience number with approved status and audience greater 
-- than 9000 or with pending status and audience greater than 7000.
SELECT eventno, dateheld, estaudience, status
FROM EventRequest
WHERE (status = "approved" AND estaudience > 9000) OR (status = "pending" AND estaudience > 7000);

-- Problem 5
-- Join from customer and event request table
-- we need to grab the customer names /cities using the custno
-- ***********
-- List the event number, event date (DateHeld), customer number and 
-- customer name of events placed in January 2018 by customers from Boulder.
SELECT eventno, dateheld, datereq, custno, city
	FROM EventRequest
    NATURAL JOIN Customer
	WHERE datereq > '2008-01-01'
		AND city = "Boulder";
    
-- Problem 6
-- List the average number of resources used 
-- (NumberFld) by plan number. Include only location number L100.
SELECT planno, AVG(numberfld) as avgnumber
	FROM Eventplanlines
    WHERE locno = "L100"
    GROUP BY planno;
    
-- Problem 7
-- List the average number of resources used (NumberFld) 
-- by plan number. Only include location number L100. 
-- Eliminate plans with less than two event lines containing location number L100.
SELECT PlanNo, AVG(NumberFld) AS AvgNumResources, 
COUNT(*) AS NumEventLines
  FROM EventPlanLine
  WHERE LocNo = 'L100'
  GROUP BY PlanNo
  HAVING COUNT(*) > 1;
