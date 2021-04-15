USE test;

SELECT StdMajor, AVG(StdGPA) AS AvgGpa 
 FROM Student
 WHERE StdClass IN ('JR', 'SR')
 GROUP BY StdMajor
 HAVING AVG(StdGPA) > 3.1;
