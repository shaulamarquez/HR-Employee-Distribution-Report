-- Checking 'HR'

-- Check for Uniqueness of Customer Key in HR
-- Expectation: No results 
SELECT 
    emp_id,
    COUNT(*) AS duplicate_count
FROM silver.HR
GROUP BY emp_id
HAVING COUNT(*) > 1;

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    first_name,
    last_name,
    gender,
    race,
    department,
    jobtitle,
    location,
    location_city,
    location_state
FROM silver.HR
WHERE first_name != TRIM(first_name) OR
      last_name != TRIM(last_name) OR
      gender != TRIM(gender) OR
      race != TRIM(race) OR
      department != TRIM(department) OR
      jobtitle != TRIM(jobtitle) OR
      location != TRIM(location) OR
      location_city != TRIM(location_city) OR
      location_state != TRIM(location_state);

-- Data Standardization & Consistency
SELECT DISTINCT 
    location_state 
FROM silver.HR;

-- Identify Out-of-Range Dates
-- Expectation: Birthdates between 1924-01-01 and Today
SELECT DISTINCT 
    birthdate 
FROM silver.HR
WHERE birthdate < '1924-01-01' 
   OR birthdate > GETDATE();

-- Check for Invalid Date Orders (hire_date > termdate)
-- Expectation: No Results
SELECT 
    * 
FROM silver.HR
WHERE hire_date > termdate;

-- add age
ALTER TABLE silver.HR ADD age INT;

UPDATE silver.HR
SET age = DATEDIFF(YEAR, birthdate, GETDATE()) 
    - CASE 
        WHEN MONTH(birthdate) > MONTH(GETDATE()) 
          OR (MONTH(birthdate) = MONTH(GETDATE()) AND DAY(birthdate) > DAY(GETDATE()))
        THEN 1 ELSE 0 
      END;

