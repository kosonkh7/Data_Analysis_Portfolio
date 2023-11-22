-- https://www.hackerrank.com/challenges/the-report/problem

SELECT IF(FLOOR(Marks/10)+1 >=8, Name, NULL) AS NAME, Marks, IF(Marks = 100, 10, IF(Marks =0, 1, FLOOR(Marks/10)+1)) AS Grade
FROM Students
ORDER BY Grade DESC, NAME, Marks DESC
