/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

WITH YEARLY_PRODUCT_SALES AS
(
SELECT
    P.PRODUCT_NAME,
    YEAR(F.ORDER_DATE) AS ORDERYEAR,
    SUM(F.SALES_AMOUNT) AS TOTALSALES
FROM GOLD.fact_sales F
    LEFT JOIN GOLD.DIM_PRODUCTS P
    ON F.product_key = P.PRODUCT_KEY
    WHERE YEAR(F.ORDER_DATE) IS NOT NULL
GROUP BY 
    P.PRODUCT_NAME,
    YEAR(F.ORDER_DATE)
)
SELECT
    ORDERYEAR,
    PRODUCT_NAME,
    TOTALSALES,
    AVG(TOTALSALES) OVER (PARTITION BY PRODUCT_NAME) AS AVG_SALES_BY_PRODUCT,
    TOTALSALES - AVG(TOTALSALES) OVER (PARTITION BY PRODUCT_NAME) AS DIFFAVG,
CASE WHEN TOTALSALES - AVG(TOTALSALES) OVER (PARTITION BY PRODUCT_NAME) > 0 THEN 'ABOVE AVG'
     WHEN TOTALSALES - AVG(TOTALSALES) OVER (PARTITION BY PRODUCT_NAME) < 0 THEN 'BELOW AVG'
     ELSE 'AVG'
END AVG_CHANGE,
LAG(TOTALSALES) OVER(PARTITION BY PRODUCT_NAME ORDER BY ORDERYEAR) PY_SALES,
TOTALSALES - LAG(TOTALSALES) OVER(PARTITION BY PRODUCT_NAME ORDER BY ORDERYEAR) AS YEAR_DIFF,
CASE WHEN TOTALSALES - LAG(TOTALSALES) OVER(PARTITION BY PRODUCT_NAME ORDER BY ORDERYEAR) > 0 THEN 'IMPROVEMENT'
     WHEN TOTALSALES - LAG(TOTALSALES) OVER(PARTITION BY PRODUCT_NAME ORDER BY ORDERYEAR) < 0 THEN 'DROP'
     ELSE 'NO CHANGE'
END YEAR_CHANGE
FROM YEARLY_PRODUCT_SALES