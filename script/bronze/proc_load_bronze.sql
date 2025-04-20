EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		PRINT '=================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=================================';

		PRINT '---------------------------------';
		PRINT 'Loading Bronze HR';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.HR';
		TRUNCATE TABLE bronze.HR;

		PRINT '>> Inserting Data Into: bronze.HR';
		BULK INSERT bronze.HR
		FROM 'C:\Users\default.ASUS\OneDrive\Desktop\Projects\Microsoft Power BI Portfolio\HumanResources\database\Human Resources.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE()
		PRINT '========================================'
		PRINT'Loading Bronze Layer is Completed';
		PRINT'   -Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '========================================'
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR)
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END