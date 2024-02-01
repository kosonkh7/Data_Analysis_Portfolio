# https://leetcode.com/problems/department-highest-salary/

WITH max_table AS (
  SELECT d.name, d.id, MAX(salary) AS max_salary
  FROM Employee AS e
  LEFT JOIN Department AS d ON e.departmentID = d.id
  WHERE d.name IS NOT NULL
  GROUP BY d.name, d.id
)

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee AS e
LEFT JOIN max_table AS d ON e.departmentID = d.id
WHERE d.name IS NOT NULL
  AND e.salary = d.max_salary
