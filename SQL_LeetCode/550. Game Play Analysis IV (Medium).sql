# https://leetcode.com/problems/game-play-analysis-iv/description/

WITH first AS (SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS first_day
FROM Activity
GROUP BY player_id)

SELECT ROUND(COUNT(DISTINCT CASE WHEN a.event_date = b.first_day THEN a.player_id END) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a
LEFT JOIN first b ON a.player_id = b.player_id
