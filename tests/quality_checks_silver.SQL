/*
================================================================================
Quality Checks
================================================================================

Script Purpose:
    This script performs various quality checks to validate data consistency,
    accuracy, completeness, and standardization across the 'silver' schema.

    The checks include:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid or inconsistent date values.
    - Invalid numeric values.
    - Data consistency between related fields.
    - Validation of transformed and cleansed data.

Usage Notes:
    - Run these checks after loading data into the Silver Layer.
    - Review the results to identify any data quality issues.
    - Investigate and resolve any discrepancies found during validation.

================================================================================
*/
-- =============================================================================
-- checking silver.crm_cust_info
-- =============================================================================
-- check nulls or  duplicate values in primary key
-- expectation :no result
select* from silver.crm_cust_info;
select cst_id ,count(*) from silver.crm_cust_info 
group by cst_id
having count(*)>1 or cst_id is null;

-- check unwanted spaces
select cst_firstname from silver.crm_cust_info 
where cst_firstname!=trim(cst_firstname)

select cst_lastname from silver.crm_cust_info 
where cst_lastname!=trim(cst_lastname)

select cst_gndr from silver.crm_cust_info 
where cst_gndr!=trim(cst_gndr)
  
-- data standardization and consisteny
select distinct cst_gndr from silver.crm_cust_info

-- =============================================================================
-- checking  silver.crm_prd_info
-- =============================================================================

 -- checks for null and duplicates in primary key
 -- expectated result:NO result
 select prd_id ,count(*) from silver.crm_prd_info
 group by prd_id
 having count(*)>1 or prd_id is null;
 
 -- check unwanted spaces
 -- expectated result:NO result
 select prd_nm from silver.crm_prd_info
where  prd_nm!=trim( prd_nm)

 select prd_cost from silver.crm_prd_info
where  prd_cost <0 or prd_cost is null

  
-- data standardization and consisteny
select distinct prd_line from silver.crm_prd_info

-- check for invalid dates
select*from silver.crm_prd_info
where prd_end_dt<prd_start_dt

select * from silver.crm_prd_info

-- =============================================================================
-- checking  silver.crm_sales_details
-- =============================================================================
 -- check invalid dates orders
 -- order date must be smaller than ship date
 select sls_order_dt from silver.crm_sales_details
 where sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt

 -- checking the sales and price and quantity columns
 -- >> sales=quantity*price
 -- >> values must not be zeros or null or negative

 select  distinct sls_sales,sls_quantity,sls_price from  silver.crm_sales_details
 where sls_sales!=sls_quantity*sls_price 
 or sls_sales is null or sls_quantity is null or sls_price is null
 or sls_sales =0
 or sls_sales<0 or sls_quantity<=0 or sls_price<=0
 order by sls_sales,sls_quantity,sls_price

 -- 
 select distinct 
 sls_sales ,
 sls_price ,
  sls_quantity    
 from silver.crm_sales_details
  where sls_sales!=sls_quantity*sls_price 
 or sls_sales is null or sls_quantity is null or sls_price is null
 or sls_sales =0
 or sls_sales<0 or sls_quantity<=0 or sls_price<=0
 order by sls_sales,sls_quantity,sls_price

 select * from silver.crm_sales_details

-- =============================================================================
-- checking silver.erp_cust_az12
-- =============================================================================
-- identify out of range
select distinct bdate from silver.erp_cust_az12 where bdate > getdate() 

-- data standardization and consistency
select distinct
 gen
 from silver.erp_cust_az12 
 select * from silver.erp_cust_az12

-- =============================================================================
-- checking silver.erp_loc_a101
-- =============================================================================

 -- data standardization and consistency 
 select distinct cntry,
case when trim(cntry) in('US','USA') then 'United States' 
     when trim(cntry) ='DE' then 'Germany'
     when trim(cntry) ='' or cntry is null  then 'n/a'
     else trim(cntry)
end as cntry
from silver.erp_loc_a101

select * from silver.erp_loc_a101





