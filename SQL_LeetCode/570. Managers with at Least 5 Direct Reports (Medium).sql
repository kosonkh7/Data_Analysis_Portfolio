# https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

WITH table1 AS (SELECT a.*, b.id AS employee
FROM Employee a
LEFT OUTER JOIN Employee b ON a.id = b.managerID)

SELECT name
FROM table1
GROUP BY id
HAVING COUNT(employee) >= 5
