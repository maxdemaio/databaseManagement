USE test;

SELECT FacNo AS PerNo, FacFirstName AS FirstName, 
       FacLastName AS LastName, FacCity AS City, FacState AS State
 FROM Faculty INNER JOIN Student 
   ON FacNo = StdNo AND FacFirstName = StdFirstName AND
      FacLastName = StdLastName AND FacCity = StdCity AND
      FacState = StdState;