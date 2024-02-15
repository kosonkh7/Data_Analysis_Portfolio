# https://leetcode.com/problems/duplicate-emails/

WITH temp AS (
    SELECT email, COUNT(*) AS cnt
    FROM Person
    GROUP BY email
)

SELECT email
FROM temp
WHERE cnt >= 2
