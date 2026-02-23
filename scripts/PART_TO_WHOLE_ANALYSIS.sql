/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- Which categories contribute the most to overall sales?

WITH CATEGORY_SALES AS
(
SELECT 
    P.CATEGORY,
    SUM(F.SALES_AMOUNT) AS TOTALSALES
FROM GOLD.fact_sales F
    LEFT JOIN GOLD.dim_products P
ON F.product_key = P.product_key
GROUP BY P.category
)
SELECT 
    CATEGORY, 
    TOTALSALES,
    SUM(TOTALSALES) OVER () CATEGORY_TOTAL,
    CONCAT(ROUND((CAST(TOTALSALES AS FLOAT) / SUM(TOTALSALES) OVER())*100,2),'%') AS PERCENTAGE_TOTAL
FROM CATEGORY_SALES