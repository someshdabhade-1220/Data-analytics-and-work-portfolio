/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Retrieve a list of unique countries from which customers originate

SELECT DISTINCT COUNTRY FROM GOLD.dim_customers
ORDER BY COUNTRY

-- EXPLORE ALL CATEGORIES "MAJOR DIVISIONS"

SELECT 
CATEGORY, 
SUBCATEGORY, 
PRODUCT_NAME
FROM GOLD.dim_products
WHERE CATEGORY IS NOT NULL
ORDER BY category

-- COUNT THE TOTAL NUMBER OF CUSTOMER PER COUNTRY

SELECT 
COUNTRY,
COUNT(DISTINCT CUSTOMER_ID) TOTALCUSTOMERS 
FROM GOLD.dim_customers
GROUP BY COUNTRY
ORDER BY TOTALCUSTOMERS DESC

