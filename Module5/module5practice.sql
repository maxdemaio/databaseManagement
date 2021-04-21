USE test;

SELECT Enrollment.OfferNo, CourseNo, FacFirstName, 
       FacLastName, AVG(StdGPA) AS AvgGPA
 FROM Offering, Enrollment, Student, Faculty
 WHERE Offering.OfferNo = Enrollment.OfferNo
   AND Student.StdNo = Enrollment.StdNo
   AND Faculty.FacNo = Offering.FacNo    
   AND OffYear = 2016 AND OffTerm = 'FALL' 
 GROUP BY Enrollment.OfferNo, CourseNo, 
       FacFirstName, FacLastName
 HAVING AVG(StdGPA) > 3.0;