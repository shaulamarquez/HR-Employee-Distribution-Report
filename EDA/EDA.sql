SELECT * FROM gold.dim_employee


-- What is the gender breakdown of employees in the company?

SELECT 
    gender,
    COUNT(*) AS COUNT
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY gender;

-- What is the race/ethnecity breakdown of employees in the company?

SELECT
    race,
    COUNT(*) AS COUNT
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY race
ORDER BY COUNT(*) DESC;

-- What is the age distribution of employees in the company?

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

-- What is the age distribution of employees by gender in the company?

SELECT
    CASE WHEN age BETWEEN 18 AND 24 THEN '18-24'
         WHEN age BETWEEN 25 AND 34 THEN '25-34'
         WHEN age BETWEEN 35 AND 44 THEN '35-44'
         WHEN age BETWEEN 45 AND 54 THEN '45-54'
         WHEN age BETWEEN 55 AND 64 THEN '55-64'
         ELSE '65+'
    END AS age_group, gender,
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
    END,
    gender
ORDER BY age_group, gender

-- How many employees work at headquarters versus remote locations?

SELECT 
    location,
    COUNT(*) AS number_employees
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY location;

-- What is the average length of employment for employees who have been terminated?

SELECT 
    AVG(DATEDIFF(year, hire_date, termdate)) AS avg_length_employment
FROM gold.dim_employee
WHERE termdate IS NOT NULL AND termdate <= GETDATE();

-- How does the gender distribution vary across departments and job titles?

SELECT 
    department,
    gender,
    COUNT(*) AS number_employees
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY
    department,
    gender
ORDER BY department

-- What is the distribution of job titles across the company?

SELECT 
    jobtitle,
    COUNT(*) number_employees
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle DESC;

-- Which department has the highest turnover rate?

SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated_employees,
    CAST(SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) AS turnover_rate
FROM gold.dim_employee
GROUP BY department
ORDER BY turnover_rate DESC;

-- What is the ditribution of employees across locations by city and state

SELECT 
    location_state,
    COUNT(*) AS total
FROM gold.dim_employee
WHERE termdate IS NULL
GROUP BY location_state
ORDER BY total DESC;

-- How has the company's employee count changed over time based on hire and term dates?

SELECT
    year,
    hires,
    terminations,
    net_change,
    net_change_percent
FROM(
    SELECT 
        YEAR(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE WHEN termdate IS NOT NULL AND YEAR(termdate) = YEAR(hire_date) THEN 1 ELSE 0 END) AS terminations,
        COUNT(*) - SUM(CASE WHEN termdate IS NOT NULL AND YEAR(termdate) = YEAR(hire_date) THEN 1 ELSE 0 END) AS net_change,
        ROUND(CAST(COUNT(*) - SUM(CASE WHEN termdate IS NOT NULL AND YEAR(termdate) = YEAR(hire_date) THEN 1 ELSE 0 END) AS FLOAT) 
            / COUNT(*) * 100, 2) AS net_change_percent
    FROM gold.dim_employee
    GROUP BY YEAR(hire_date)
) AS employee_changes
ORDER BY year;

-- What is the tenure distribution for each department?
SELECT 
    department,
    ROUND(AVG(DATEDIFF(YEAR, hire_date, termdate)), 2) AS avg_tenure
FROM gold.dim_employee
WHERE termdate IS NOT NULL AND termdate <= GETDATE()
GROUP BY department;




   
    
    

