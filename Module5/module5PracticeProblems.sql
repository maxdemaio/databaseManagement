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