-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS DEV_CIH_RAW_DB;

-- Create the database if it doesn't exist
CREATE SCHEMA IF NOT EXISTS DEV_CIH_RAW_DB.HUBSPOT;

-- Set the database and schema context
USE SCHEMA DEV_CIH_RAW_DB.HUBSPOT;

-- Create the file formats
CREATE OR REPLACE FILE FORMAT CIH_CSV_FF
    TYPE='CSV'
    COMPRESSION = 'AUTO'
    FIELD_DELIMITER = ','
    SKIP_HEADER = 0
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    NULL_IF = ('NULL','\\N','\N', '');

CREATE OR REPLACE FILE FORMAT CIH_JSON_FF
    TYPE='JSON'
    COMPRESSION = 'AUTO'
    ENABLE_OCTAL = FALSE
    ALLOW_DUPLICATE = FALSE
    STRIP_OUTER_ARRAY = FALSE
    STRIP_NULL_VALUES = FALSE
    IGNORE_UTF8_ERRORS = FALSE;

-- Create the stages
CREATE OR REPLACE STAGE CIH_AZURE_STAGE
    URL = 'azure://sacihxdslabeuwe1.blob.core.windows.net/root/np/'
    storage_integration = azure_storage_integration;

-- Create the tables
CREATE OR REPLACE TABLE CIH_EMPLOYEE
(
    EMPLOYEE_ID    STRING,
    FIRST_NAME     STRING,
    LAST_NAME	   STRING,
    EMAIL	       STRING,
    PHONE_NUMBER   STRING,
    HIRE_DATE      STRING,
    JOB_ID	       STRING,
    SALARY	       STRING,
    COMMISSION_PCT STRING,
    MANAGER_ID	   STRING,
    DEPARTMENT_ID  STRING
);