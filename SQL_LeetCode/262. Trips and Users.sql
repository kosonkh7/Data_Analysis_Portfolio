# https://leetcode.com/problems/trips-and-users/description/
# Write your MySQL query statement below
# SELECT users_id
# FROM Users
# Where banned = 'Yes'


SELECT request_at AS Day, 
       ROUND(COUNT(CASE WHEN status = 'completed' THEN NULL ELSE id END) / COUNT(DISTINCT id), 2) AS "Cancellation Rate"
FROM Trips
WHERE client_id != (SELECT users_id
                    FROM Users
                    WHERE banned = 'Yes')
GROUP BY request_at

