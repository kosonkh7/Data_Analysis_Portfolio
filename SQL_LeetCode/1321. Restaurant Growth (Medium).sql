# https://leetcode.com/problems/restaurant-growth/description/
  
SELECT DISTINCT visited_on, 
       ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW), 2) AS amount,
       ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) / 7, 2) AS average_amount
FROM Customer
ORDER BY visited_on
LIMIT 99999
OFFSET 6
