--https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=internal-search

SELECT MAX(salary*months), COUNT(*)
FROM Employee
WHERE salary*months = 108064
