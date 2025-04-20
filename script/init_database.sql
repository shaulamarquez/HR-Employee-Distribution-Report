USE master;
GO

-- Drop and recreate the 'HR' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'HR')
BEGIN
	ALTER DATABASE HR SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
END;
GO

--Create the 'HumanResources' database

CREATE DATABASE HR;

USE HR;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

USE master;
GO

