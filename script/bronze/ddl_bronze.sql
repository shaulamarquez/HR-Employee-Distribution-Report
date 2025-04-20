IF OBJECT_ID('bronze.HR', 'U') IS NOT NULL
  DROP TABLE bronze.HR;

GO

CREATE TABLE bronze.HR (
	id                  NVARCHAR(50),
    first_name          NVARCHAR(50),
    last_name           NVARCHAR(50),
    birthdate           NVARCHAR(50),
    gender              NVARCHAR(50),
    race                NVARCHAR(50),
    department          NVARCHAR(50),
    jobtitle            NVARCHAR(50),
    location            NVARCHAR(50),
    hire_date           DATE,
    termdate            NVARCHAR(50),
    location_city       NVARCHAR(50),
    location_state      NVARCHAR(50)
);