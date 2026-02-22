/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking

SELECT TOP 5
    P.PRODUCT_NAME,
    SUM(F.SALES_AMOUNT) TOTALREVENUE
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_products P
    ON P.PRODUCT_KEY = F.product_key
GROUP BY P.PRODUCT_NAME
ORDER BY TOTALREVENUE DESC

-- What are the 5 worst-performing products in terms of sales?

SELECT TOP 5
    P.PRODUCT_NAME,
    SUM(F.SALES_AMOUNT) TOTALREVENUE
FROM GOLD.fact_sales F
LEFT JOIN GOLD.dim_products P
    ON P.PRODUCT_KEY = F.product_key
GROUP BY P.PRODUCT_NAME
ORDER BY TOTALREVENUE


-- Find the top 10 customers who have generated the highest revenue

SELECT TOP 10
    C.customer_id,
    C.FIRST_NAME,
    C.LAST_NAME,
    SUM(F.SALES_AMOUNT) TOTALREVENUE
FROM GOLD.FACT_SALES F
LEFT JOIN GOLD.dim_customers C
    ON C.CUSTOMER_KEY = F.CUSTOMER_KEY
GROUP BY 
    C.customer_id,
    C.FIRST_NAME,
    C.LAST_NAME
ORDER BY TOTALREVENUE DESC


-- The 3 customers with the fewest orders placed

SELECT TOP 3
    C.customer_id,
    C.FIRST_NAME,
    C.LAST_NAME,
    COUNT(DISTINCT F.ORDER_NUMBER) TOTALORDERS
FROM GOLD.FACT_SALES F
LEFT JOIN GOLD.dim_customers C
    ON C.CUSTOMER_KEY = F.CUSTOMER_KEY
GROUP BY 
    C.customer_id,
    C.FIRST_NAME,
    C.LAST_NAME
ORDER BY TOTALORDERS