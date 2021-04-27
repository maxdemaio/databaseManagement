-- MGD MySQL Responses

USE Intercollegiateathletic;

-- Problem 1
-- List the city, state, and zip codes in the customer table.  
-- Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)
SELECT distinct 
	city, state, zip
FROM Customer;

-- Problem 2
-- List the name, department, phone number, and 
-- email address of employees with a phone number beginning with “3-”.
SELECT empname, department, email, phone
FROM Employee
WHERE phone LIKE '3-%';

-- Problem 3
-- List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.
SELECT *
FROM Resourcetable
WHERE rate BETWEEN 	10 and 20
ORDER BY rate;

-- Problem 4
-- 	List the event requests with a status of “Approved” or “Denied” and an 
-- authorized date in July 2018. Include the event number, 
-- authorization date, and status in the output. 
-- (Hint: see the examples in Module 4 for date constants in Oracle and MySQL.)
SELECT *
FROM Eventrequest
WHERE dateauth BETWEEN CAST('2018-07-01' AS DATE) AND CAST('2018-07-31' AS DATE);

-- Problem 5
-- List the location number and name of locations that are 
-- part of the “Basketball arena”.  Your WHERE clause should not 
-- have a condition involving the facility number compared to a constant (“F101”). Instead, you 
-- should use a condition on the FacName column for the value of “Basketball arena”.
SELECT *
FROM Location
NATURAL JOIN Facility
WHERE facname = "Basketball arena";

-- Problem 6
-- For each event plan, list the plan number, count of the event plan lines, 
-- and sum of the number of resources assigned.  For example,
--  plan number “P100” has 4 lines and 7 resources assigned.  You only need to 
--  consider event plans that have at least one line.
SELECT planno, count(planno) AS count_of_plan_lines, sum(numberfld) AS sum_of_number_of_resources
FROM eventplanlines
GROUP BY planno;
