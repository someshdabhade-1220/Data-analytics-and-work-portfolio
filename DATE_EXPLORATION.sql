/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months 

SELECT 
MAX(ORDER_DATE) LAST_ORDER,
MIN(ORDER_DATE) FIRST_ORDER,
DATEDIFF(MONTH,MIN(ORDER_DATE), MAX(ORDER_DATE)) RANGE_IN_MONTHS
FROM GOLD.fact_sales

-- FIND THE YOUNGEST AND THE OLDEST CUSTOMER AND THE AGE DIFFERENCE

SELECT
MIN(BIRTHDATE) OLDESTCUSTOMER,
MAX(BIRTHDATE) YOUNGESTCUSTOMER,
DATEDIFF(YEAR, MIN(BIRTHDATE), GETDATE()) AGEDIFFERENCE,
DATEDIFF(YEAR, MAX(BIRTHDATE), GETDATE()) YOUNGESTAGE
FROM GOLD.dim_customers