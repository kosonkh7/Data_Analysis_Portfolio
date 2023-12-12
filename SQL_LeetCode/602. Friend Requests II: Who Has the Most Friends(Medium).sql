# https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/

WITH table1 AS (SELECT requester_id AS id, accept_date
FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id, accept_date
FROM RequestAccepted),

table2 AS (SELECT id, COUNT(id) AS num
FROM table1
GROUP BY id
ORDER BY num DESC)

SELECT *
FROM table2
WHERE num = (SELECT num FROM table2 LIMIT 1)
