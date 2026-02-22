/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales

SELECT SUM(SALES_AMOUNT) TOTALSALES FROM GOLD.fact_sales

-- Find how many items are sold

SELECT COUNT(QUANTITY) TOTALITEMS FROM GOLD.fact_sales

-- Find the average selling price

SELECT AVG(PRICE) AVGPRICE FROM GOLD.fact_sales

-- Find the Total number of Orders

SELECT COUNT(ORDER_NUMBER) TOTALORDERS FROM GOLD.fact_sales
SELECT COUNT(DISTINCT ORDER_NUMBER) TOTALORDERS FROM GOLD.fact_sales

-- Find the total number of products

SELECT COUNT(PRODUCT_KEY) TOTALPRODUCTS FROM GOLD.dim_products

-- Find the total number of customers

SELECT COUNT(customer_key) TOTALCUSTOMERS FROM GOLD.dim_customers


-- Find the total number of customers that has placed an order

SELECT COUNT(DISTINCT CUSTOMER_KEY) CUSTOMERS_ORDERPLACED FROM GOLD.fact_sales

-- Generate a Report that shows all key metrics of the business

SELECT 'TOTAL SALES' AS MEASURE_NAME, SUM(SALES_AMOUNT) AS MEASURE_VALUE FROM GOLD.fact_sales
UNION ALL
SELECT 'TOTAL QUANTITY', SUM(QUANTITY) FROM GOLD.fact_sales
UNION ALL
SELECT 'AVG PRICE', AVG(PRICE) FROM GOLD.fact_sales
UNION ALL
SELECT 'TOTAL NR ORDERS', COUNT(DISTINCT ORDER_NUMBER) FROM GOLD.fact_sales
UNION ALL
SELECT 'TOTAL NR PRODUCTS', COUNT(DISTINCT PRODUCT_ID) FROM GOLD.dim_products
UNION ALL
SELECT 'TOTAL NR CUSTOMERS', COUNT(customer_key) FROM GOLD.dim_customers
UNION ALL
SELECT 'TOTAL NR CUST ORDERS', COUNT(DISTINCT customer_key) FROM GOLD.fact_sales;