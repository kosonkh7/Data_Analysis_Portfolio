-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem

SELECT CASE 
            WHEN (A = B) AND (B = C) THEN 'Equilateral'
            WHEN (A = B AND A + B > C) OR (B = C AND B + C > A) OR (C = A AND C + A > B) THEN 'Isosceles'
            WHEN (A + B > C) AND (B + C > A) AND (C + A > B) THEN 'Scalene'
            ELSE 'Not A Triangle' END
FROM Triangles
