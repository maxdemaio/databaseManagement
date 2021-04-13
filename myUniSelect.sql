USE test;
-- Need hyphens in constant
SELECT OfferNo, Offering.Courseno, Offdays,
	CrsUnits, Offlocation, Offtime
FROM Faculty, Course, Offering