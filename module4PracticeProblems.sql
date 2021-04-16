USE intercollegiateathletic;

-- Problem 1
SELECT custno, custname, phone, city
FROM Customer;

-- Problem 2
SELECT custno, custname, phone, city
FROM Customer
WHERE state = "CO";

-- Problem 3
SELECT *
FROM EventRequest
WHERE estcost > 4000
ORDER BY dateheld;

-- Problem 4
SELECT eventno, dateheld, estaudience, status
FROM EventRequest
WHERE estaudience > 9000 OR (status = "pending" AND estaudience > 7000);

-- Problem 5
-- Join from customer and event request table
-- we need to grab the customer names /cities using the custno
SELECT eventno, dateheld, datereq, custno, city
	FROM EventRequest
    NATURAL JOIN Customer
	WHERE datereq > '2008-01-01'
		AND city = "Boulder";
    
-- Problem 6
SELECT planno, AVG(numberfld) as avgnumber
	FROM Eventplanlines
    WHERE locno = "L100"
    GROUP BY planno;
    
-- Problem 7
SELECT planno, AVG(numberfld) as avgnumber
	FROM Eventplanlines
    WHERE locno = "L100"
		AND numberfld > 2
    GROUP BY planno;