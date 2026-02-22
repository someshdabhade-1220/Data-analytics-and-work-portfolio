/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/


-- RETREIVE A LIST OF ALL TABLES IN THE DATABASE

SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- RETREIVE LIST OF ALL COLUMNS IN A SPECIFIC TABLE (DIM_CUSTOMERS)

SELECT * FROM GOLD.dim_customers