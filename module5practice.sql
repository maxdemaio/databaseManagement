USE test;

SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents 
  FROM Enrollment, Offering  
  WHERE Offering.OfferNo = Enrollment.OfferNo 
    AND OffYear = 2017
  GROUP BY Offering.OfferNo;

-- Equivalent version using the join operator style
 SELECT Offering.OfferNo, 
        COUNT(*) AS NumStudents 
  FROM Enrollment INNER JOIN Offering ON Offering.OfferNo = Enrollment.OfferNo
  WHERE OffYear = 2017
  GROUP BY Offering.OfferNo;