# https://leetcode.com/problems/department-top-three-salaries/description/

WITH rank_table AS (
  SELECT d.name AS Department, 
         e.name AS Employee, 
         e.salary AS Salary,
         DENSE_RANK() OVER (PARTITION BY e.departmentID ORDER BY e.salary DESC) AS rk
  FROM Employee AS e
  LEFT JOIN Department AS d ON e.departmentID = d.id
  WHERE d.name IS NOT NULL
)

SELECT Department, Employee, Salary
FROM rank_table
WHERE rk <= 3
