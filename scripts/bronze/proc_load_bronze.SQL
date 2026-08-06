/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================

Script Purpose:
    This stored procedure loads raw data into the 'bronze' schema
    from external CSV files.

    It performs the following actions:
    - Truncates all Bronze tables before loading new data.
    - Uses the BULK INSERT command to import data from CSV files.
    - Loads CRM and ERP source data into the corresponding Bronze tables.
    - Stores the data in its original format without any transformations.

Source Files:
    - cust_info.csv
    - prd_info.csv
    - sales_details.csv
    - cust_az12.csv
    - loc_a101.csv
    - px_cat_g1v2.csv

Parameters:
    None.

This stored procedure does not accept any parameters
or return any values.

Usage Example:

    EXEC bronze.load_bronze;

===============================================================================

*/

create or alter procedure bronze.load_bronze as
begin
declare @start_time datetime,@end_time datetime,@batch_start_time datetime,@batch_end_time datetime
set @batch_start_time=GETDATE();
begin try
print '=========================================================';
print 'loading bronze layer';
print '=========================================================';


print'-----------------------------------------------------------';
print'loading CRM tables'
print'------------------------------------------------------------';

set @start_time=GETDATE();
print'>> Truncating the table:bronze.crm_cust_info';
truncate table bronze.crm_cust_info;
print'>> Inserting Data Into: bronze.crm_cust_info';
bulk insert bronze.crm_cust_info
from 'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';

set @start_time=GETDATE();
print'>> Truncating the table:bronze.crm_prd_info';
truncate table bronze.crm_prd_info;
print'>> Inserting Data Into:bronze.crm_prd_info';
bulk insert bronze.crm_prd_info
from 'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
with (
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';

set @start_time=GETDATE();
print'>> Truncating the table:bronze.crm_sales_details';
truncate table bronze.crm_sales_details;
print'>> Inserting Data Into:bronze.crm_sales_details';
bulk  insert bronze.crm_sales_details
from 'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';


print'-----------------------------------------------------------';
print'loading ERP tables'
print'------------------------------------------------------------';

set @start_time=GETDATE();
print'>> Truncating the table:bronze.erp_cust_az12';
truncate table bronze.erp_cust_az12;
print'Inserting Data Into:bronze.erp_cust_az12';
bulk insert bronze.erp_cust_az12
from'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';

set @start_time=GETDATE();
print'>> Truncating the table:bronze.erp_loc_a101';
truncate table bronze.erp_loc_a101;
print'Inserting Data Into :bronze.erp_loc_a101';
bulk insert bronze.erp_loc_a101
from'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';

set @start_time=GETDATE();
print'>> Truncating the table: bronze.erp_px_cat_g1v2';
truncate table bronze.erp_px_cat_g1v2;
print'Inserting Data Into: bronze.erp_px_cat_g1v2';
bulk insert bronze.erp_px_cat_g1v2
from'C:\Users\keert\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
)
set @end_time=GETDATE();
print'>> load duration:'+cast(datediff(second,@start_time,@end_time) as nvarchar)+'seconds';
print'-------------------------';

set @batch_end_time=GETDATE();
print'>> Total load duration:'+cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar)+'seconds';
print'-------------------------';

end try
begin catch
print'=======================================================';
print'Error occured during loading bronze layer';
print'=======================================================';
end catch
end



