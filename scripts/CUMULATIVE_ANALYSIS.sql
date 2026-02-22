/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

SELECT 
SUM(SALES_AMOUNT) AS TOTALSALES, 
DATETRUNC(MONTH, ORDER_DATE) AS ORDER_BY_MONTH
FROM GOLD.fact_sales
GROUP BY DATETRUNC(MONTH, ORDER_DATE)
ORDER BY TOTALSALES DESC

--  

SELECT
ORDER_BY_MONTH,
TOTALSALES,
SUM(TOTALSALES) OVER (ORDER BY ORDER_BY_MONTH) AS RUNNINGTOTAL,
AVG(AVGPRICE) OVER (ORDER BY ORDER_BY_MONTH) AS MOVING_AVG
FROM
(
SELECT 
DATETRUNC(MONTH, ORDER_DATE) AS ORDER_BY_MONTH,
SUM(SALES_AMOUNT) AS TOTALSALES, 
AVG(price) AS AVGPRICE
FROM GOLD.fact_sales
WHERE DATETRUNC(MONTH, ORDER_DATE) IS NOT NULL
GROUP BY DATETRUNC(MONTH, ORDER_DATE)
)T

