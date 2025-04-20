
-- age group
SELECT
    CASE WHEN age BETWEEN 18 AND 24 THEN '18-24'
         WHEN age BETWEEN 25 AND 34 THEN '25-34'
         WHEN age BETWEEN 35 AND 44 THEN '35-44'
         WHEN age BETWEEN 45 AND 54 THEN '45-54'
         WHEN age BETWEEN 55 AND 64 THEN '55-64'
         ELSE '65+'
    END AS age_group,
    COUNT(*) AS number_employees
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY
    CASE WHEN age BETWEEN 18 AND 24 THEN '18-24'
         WHEN age BETWEEN 25 AND 34 THEN '25-34'
         WHEN age BETWEEN 35 AND 44 THEN '35-44'
         WHEN age BETWEEN 45 AND 54 THEN '45-54'
         WHEN age BETWEEN 55 AND 64 THEN '55-64'
         ELSE '65+'    
    END
ORDER BY age_group


-------------------------------------------------
-- checks the accuracy

SELECT 
COUNT(age) AS total_number
FROM gold.dim_employee
WHERE 
	termdate IS NULL AND
	age >= 55

---------------------------------------
-- Check Total Employees per Department
SELECT 
    department,
    COUNT(*) AS total_employees
FROM gold.dim_employee
GROUP BY department;

-- Check Terminated Employees per Department
SELECT 
    department,
    SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated_employees
FROM gold.dim_employee
GROUP BY department;

-- Calculate the turnover rate and which department has the highest turnover rate 
SELECT TOP 1
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated_employees,
    CAST(SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) AS turnover_rate
FROM gold.dim_employee
GROUP BY department 
ORDER BY turnover_rate DESC;

-- 


      