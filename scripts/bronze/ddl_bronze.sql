/*
====================================================================
DDL Script: Create Bronze Tables
====================================================================

Script Purpose:
    This script creates all tables required for the Bronze layer.
    Existing tables are dropped before recreation to ensure a clean
    environment for loading raw CRM and ERP source data.

Tables Created:
    - bronze.crm_cust_info
    - bronze.crm_prd_info
    - bronze.crm_sales_details
    - bronze.erp_cust_az12
    - bronze.erp_loc_a101
    - bronze.erp_px_cat_g1v2

Notes:
    - The Bronze layer stores raw data exactly as received from
      the source systems.
    - No data cleansing or transformations are performed in this layer.
    - These tables are populated using BULK INSERT operations.
====================================================================
*/
/*
==============================================================
DDL Script: Create CRM Customer Info Table
==============================================================
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info
(
    cst_id           INT,
    cst_key          NVARCHAR(50),
    cst_firstname    NVARCHAR(50),
    cst_lastname     NVARCHAR(50),
    cst_marital_status NVARCHAR(20),
    cst_gndr         NVARCHAR(10),
    cst_create_date  DATE
);
GO

/*
==============================================================
DDL Script: Create CRM Product Info Table
==============================================================
*/


IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info
(
    prd_id         INT,
    prd_key        NVARCHAR(50),
    prd_nm         NVARCHAR(100),
    prd_cost       int,
    prd_line       NVARCHAR(10),
    prd_start_dt   DATE,
    prd_end_dt     DATE
);
GO

/*
==============================================================
DDL Script: Create CRM Sales Details Table
==============================================================
*/

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num    NVARCHAR(50),
    sls_prd_key    NVARCHAR(50),
    sls_cust_id    INT,
    sls_order_dt   INT,
    sls_ship_dt    INT,
    sls_due_dt     INT,
    sls_sales      int,
    sls_quantity   INT,
    sls_price      int
);
GO

/*
==============================================================
DDL Script: Create ERP Customer Table
==============================================================
*/

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12
(
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(10)
);
GO

/*
==============================================================
DDL Script: Create ERP Location Table
==============================================================
*/

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101
(
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

/*
==============================================================
DDL Script: Create ERP Product Category Table
==============================================================
*/

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2
(
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(20)
);
GO
