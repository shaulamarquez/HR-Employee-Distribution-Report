CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		PRINT '=================================';
		PRINT 'Loading Silver Layer';
		PRINT '=================================';

		PRINT '---------------------------------';
		PRINT 'Loading Silver HR';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.HR';
		TRUNCATE TABLE silver.HR;
        PRINT '>> Inserting Data Into: silver.HR';
        INSERT INTO silver.HR (
            emp_id,
            first_name,
            last_name,
            birthdate,
            gender,
            race,
            department,
            jobtitle,
            location,
            hire_date,
            termdate,
            location_city,
            location_state
        )
        SELECT 
            id AS emp_id,
            first_name,
            last_name,
            birthdate,
            gender,
            race,
            department,
            jobtitle,
            location,
            hire_date,
            CAST(SUBSTRING(termdate, 1, 10) AS DATE) AS termdate,
            location_city,
            location_state
        FROM bronze.HR;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE()
		PRINT '========================================'
		PRINT 'Loading Silver Layer is Completed';
		PRINT '   -Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
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


