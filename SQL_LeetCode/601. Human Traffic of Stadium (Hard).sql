# https://leetcode.com/problems/human-traffic-of-stadium/

WITH step1 AS ( 
    SELECT id
    FROM Stadium
    WHERE people >= 100
), # 100명 이상인 날 id
step2 AS (
    SELECT id, 
            CASE 
                WHEN id IN (
                                SELECT id
                                FROM Stadium
                                WHERE people >= 100
                            ) AND id +1 IN (
                                SELECT id
                                FROM Stadium
                                WHERE people >= 100
                            ) AND id +2 IN (
                                SELECT id
                                FROM Stadium
                                WHERE people >= 100
                            ) THEN 1
            END AS consecutive
    FROM step1
) # 3연속 id가 존재하는 id 반환

SELECT *
FROM Stadium
WHERE id IN (SELECT id FROM step2 WHERE consecutive = 1)
OR id in (SELECT id+1 FROM step2 WHERE consecutive = 1)
OR id in (SELECT id+2 FROM step2 WHERE consecutive = 1)
