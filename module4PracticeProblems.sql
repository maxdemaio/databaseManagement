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
SELECT eventno, dateheld, datereq, custno
	FROM EventRequest, Customer
	WHERE datereq > "2018-01-01"
		AND Customer.custno = EventRequest.custno;
