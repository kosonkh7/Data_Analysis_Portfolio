-- https://www.hackerrank.com/challenges/placements/problem?h_r=internal-search

SELECT Students.Name
FROM Friends
    LEFT JOIN Students ON Friends.ID = Students.ID
    LEFT JOIN Packages AS s ON Friends.ID = s.ID
    LEFT JOIN Packages AS f ON Friends.Friend_ID = f.ID
WHERE s.Salary < f.Salary
ORDER BY f.Salary 
