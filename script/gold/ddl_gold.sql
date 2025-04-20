ALTER VIEW gold.dim_employee AS
SELECT 
	emp_id,
    first_name,
    last_name,
    birthdate,
    DATEDIFF(YEAR, birthdate, GETDATE()) 
        - CASE 
            WHEN MONTH(birthdate) > MONTH(GETDATE()) 
              OR (MONTH(birthdate) = MONTH(GETDATE()) AND DAY(birthdate) > DAY(GETDATE()))
            THEN 1 ELSE 0 
          END AS age,
    gender,
    race,
    department,
    jobtitle,
    location,
    hire_date,
    termdate,
    location_city,
    location_state
FROM silver.HR;
