# https://leetcode.com/problems/game-play-analysis-i

WITH table1 AS (
    SELECT player_id, 
           event_date, 
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
)

SELECT player_id, 
       event_date AS first_login
FROM table1
WHERE rn = 1
