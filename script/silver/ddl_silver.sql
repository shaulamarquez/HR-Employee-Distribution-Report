IF OBJECT_ID('silver.HR', 'U') IS NOT NULL
  DROP TABLE silver.HR;

GO

CREATE TABLE silver.HR (
	emp_id              NVARCHAR(50),
    first_name          NVARCHAR(50),
    last_name           NVARCHAR(50),
    birthdate           DATE,
    gender              NVARCHAR(50),
    race                NVARCHAR(50),
    department          NVARCHAR(50),
    jobtitle            NVARCHAR(50),
    location            NVARCHAR(50),
    hire_date           DATE,
    termdate            DATE,
    location_city       NVARCHAR(50),
    location_state      NVARCHAR(50)
);



