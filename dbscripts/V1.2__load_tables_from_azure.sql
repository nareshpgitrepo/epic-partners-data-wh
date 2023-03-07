-- Set the database and schema context
USE SCHEMA DEV_CIH_RAW_DB.HUBSPOT;

-- Load the trips data
COPY INTO CIH_EMPLOYEE
  FROM
  (SELECT
        S.$1 AS EMPLOYEE_ID,
        S.$2 AS FIRST_NAME,
        S.$3 AS LAST_NAME,
        S.$4 AS EMAIL,
        S.$5 AS PHONE_NUMBER,
        S.$6 AS HIRE_DATE,
        S.$7 AS JOB_ID,
        S.$8 AS SALARY,
        S.$9 AS COMMISSION_PCT,
        S.$10 AS MANAGER_ID,
        S.$11 AS DEPARTMENT_ID  
    FROM @CIH_AZURE_STAGE 
   (FILE_FORMAT => CIH_CSV_FF,PATTERN => '.*employees.csv') S);