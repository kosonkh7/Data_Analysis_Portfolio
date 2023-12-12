# https://leetcode.com/problems/customers-who-bought-all-products/description/

SELECT c.customer_id
FROM Customer c
WHERE c.product_key IS NOT NULL
GROUP BY customer_id 
HAVING COUNT(distinct c.product_key) = (SELECT COUNT(distinct p.product_key) FROM Product p)
