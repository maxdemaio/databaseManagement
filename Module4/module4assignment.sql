USE Intercollegiateathletic;

-- Problem 1
SELECT distinct 
	city, state, zip
FROM Customer;

-- Problem 2
SELECT empname, department, email, phone
FROM Employee
WHERE phone LIKE '3-%';

-- Problem 3
SELECT *
FROM Resourcetable
WHERE rate BETWEEN 	10 and 20
ORDER BY rate;

-- Problem 4
SELECT *
FROM Eventrequest
WHERE dateauth BETWEEN CAST('2018-07-01' AS DATE) AND CAST('2018-07-31' AS DATE);

-- Problem 5
SELECT *
FROM Location
NATURAL JOIN Facility
WHERE facname = "Basketball arena";

-- Problem 6
SELECT planno, count(planno) AS count_of_plan_lines, sum(numberfld) AS sum_of_number_of_resources
FROM eventplanlines
GROUP BY planno;
