# https://leetcode.com/problems/consecutive-numbers/description/

WITH table1 AS (SELECT id,
       LAG(num) OVER (ORDER BY id) AS pre, 
       num AS now,
       LEAD(num) OVER (ORDER BY id) AS post                                                                                
FROM Logs)

SELECT DISTINCT now AS ConsecutiveNums
FROM table1 
WHERE pre IS NOT NULL
  AND post IS NOT NULL
  AND pre = now
  AND post = now
