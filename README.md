# HR Employee Distribution Report

![image](https://github.com/user-attachments/assets/940a9e25-0198-4a8e-ad1f-29ff8adfe5fb)
![image](https://github.com/user-attachments/assets/63b8a4c9-e64e-43ec-9d6f-d4b0425b3654)
![image](https://github.com/user-attachments/assets/583a01c2-c3f3-4fe6-9bef-099b8e4d2b44)
![image](https://github.com/user-attachments/assets/e9c45583-8717-4788-8970-f918f29f985f)

# Data warehouse and HR Employee Distribution Report Project
The HR Employee Distribution Report project showcases a full data warehousing pipeline—from sourcing and transforming HR data into a star schema, to running analytics with SQL and visualizing insights in Power BI. It emphasizes best practices like dimensional modeling, ETL workflows, and KPI reporting to deliver actionable business intelligence on employee demographics and department structures.

# Data Artchitecture
* Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
* Silver Layer: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
* Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.

# Microsoft Power BI 

SQL Analytics Insights
This project uses SQL to generate actionable HR analytics for both Present and Terminated employees. The goal is to support data-driven decision-making in workforce planning and diversity tracking.

Key Insights Delivered:
Age Group Distribution
Categorizes employees into defined age brackets to identify generational representation in the workforce.

Age Group by Gender
Analyzes demographic diversity by breaking down age groups across genders.

Average Length of Employment
Measures employee retention and tenure by computing average years of service for both current and former employees.

Race Distribution
Highlights racial diversity and representation within the company.

Headquarters vs Remote
Compares workforce distribution between remote and headquarters-based employees.

Each metric is powered by optimized SQL queries and visualized through clean dashboards for stakeholder clarity.

[View SQL codes](https://github.com/shaulamarquez/HR-Employee-Distribution-Report/blob/main/EDA/EDA.sql)

