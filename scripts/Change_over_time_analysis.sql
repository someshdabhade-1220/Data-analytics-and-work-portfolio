/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions

SELECT
ORDER_DATE, 
SUM(SALES_AMOUNT) AS TOTALSALES
FROM GOLD.FACT_SALES
WHERE order_date IS NOT NULL
GROUP BY order_date
ORDER BY order_date

-- WITH DATE PART OR CHANGE IN DATE FORMAT 

SELECT
YEAR(ORDER_DATE) ORDER_YEAR, 
SUM(SALES_AMOUNT) AS TOTALSALES,
COUNT(CUSTOMER_KEY) AS NR_OF_CUSTOMERS,
SUM(QUANTITY) AS TOTALQUANTITY
FROM GOLD.FACT_SALES
WHERE order_date IS NOT NULL
GROUP BY YEAR(ORDER_DATE)
ORDER BY TOTALSALES DESC

-- USING DATETRUNC FUNCTION

SELECT
DATETRUNC(MONTH, ORDER_DATE) ORDER_YEAR,
SUM(SALES_AMOUNT) AS TOTALSALES,
COUNT(CUSTOMER_KEY) AS NR_OF_CUSTOMERS,
SUM(QUANTITY) AS TOTALQUANTITY
FROM GOLD.FACT_SALES
WHERE order_date IS NOT NULL
GROUP BY 
DATETRUNC(MONTH, ORDER_DATE)
ORDER BY TOTALSALES DESC

-- Format function ('yyyy MM')

SELECT
FORMAT(ORDER_DATE, 'yyyy') AS ORDER_YEAR,
SUM(SALES_AMOUNT) AS TOTALSALES,
COUNT(CUSTOMER_KEY) AS NR_OF_CUSTOMERS,
SUM(QUANTITY) AS TOTALQUANTITY
FROM GOLD.FACT_SALES
WHERE order_date IS NOT NULL
GROUP BY 
FORMAT(ORDER_DATE, 'yyyy')
ORDER BY TOTALSALES DESC