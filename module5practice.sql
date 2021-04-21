USE test;

SELECT CourseNo, Enrollment.OfferNo, 
       Count(*) AS NumStudents
 FROM Offering, Enrollment
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND OffYear = 2017 AND OffTerm = 'SPRING' 
 GROUP BY Enrollment.OfferNo, CourseNo;