USE test;

SELECT OfferNo, CourseNo 
  FROM Offering 
  WHERE FacNo IS NULL AND OffTerm = 'SUMMER' AND OffYear = 2017;