# https://leetcode.com/problems/trips-and-users/description/
       
SELECT request_at AS Day,
       ROUND(COUNT(DISTINCT CASE WHEN status = 'completed' THEN NULL ELSE id END) / COUNT(DISTINCT id),2) AS 'Cancellation Rate'
FROM Trips
WHERE client_id IN (SELECT users_id
                    FROM Users
                    WHERE banned = 'No')
AND driver_id IN (SELECT users_id
                    FROM Users
                    WHERE banned = 'No')
AND request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY request_at
