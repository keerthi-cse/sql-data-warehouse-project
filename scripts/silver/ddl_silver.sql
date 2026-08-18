/*
==========================================================================
ddl script: create silver tables
==========================================================================
script Purpose:
        This script creates the tables in 'silver' schema ,droping tables
        if they are already exist
        Run this script to redefine the ddl structure of th bronze Tables
==========================================================================
*/
if object_id('silver.crm_cust_info') is not null
drop table silver.crm_cust_info
create table silver.crm_cust_info(
cst_id int,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(50),
cst_gndr nvarchar(50),
cst_create_date date,
dwh_create_data datetime2 default getdate()
);

if object_id('silver.crm_prd_info') is not null
drop table silver.crm_prd_info
CREATE TABLE silver.crm_prd_info(
	prd_id int ,
	cat_id nvarchar(50),
	prd_key nvarchar(50) ,
	prd_nm nvarchar(50) ,
	prd_cost int ,
	prd_line nvarchar(50) ,
	prd_start_dt date ,
	prd_end_dt date,
	dwh_create_date datetime2 default getdate()
) ;

if object_id('silver.crm_sales_details') is not null
drop table silver.crm_sales_details
CREATE TABLE silver.crm_sales_details(
	sls_ord_num nvarchar (50),
	sls_prd_key nvarchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int ,
	sls_quantity int,
	sls_price int,
	dwh_create_date datetime2 default getdate()
) ;

if object_id('silver.erp_cust_az12') is not null
drop table silver.erp_cust_az12
CREATE TABLE silver.erp_cust_az12(
	cid nvarchar (50),
	bdate date,
	gen nvarchar (50),
	dwh_create_date datetime2 default getdate()
) ;

if object_id('silver.erp_loc_a101') is not null
drop table silver.erp_loc_a101
CREATE TABLE silver.erp_loc_a101(
	cid nvarchar (50),
	cntry nvarchar(50),
	dwh_create_date datetime2 default getdate()
) ;

if object_id('silver.erp_px_cat_g1v2') is not null
drop table silver.erp_px_cat_g1v2
CREATE TABLE silver.erp_px_cat_g1v2(
	id nvarchar(50) NULL,
	cat nvarchar(50),
	subcat nvarchar(50),
	maintenance nvarchar(50),
	dwh_create_date datetime2 default getdate()
) ;






   
