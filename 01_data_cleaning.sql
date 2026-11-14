USE layoffes;

--  CREATE TABLE layoffs_staging              #3-4= for back up we created new table
-- LIKE layoffe

-- SELECT count(*) from layoffs_staging;

-- INSERT layoffs_staging                    #insert values from our table 
-- SELECT * FROM layoffe;

-- SELECT * FROM layoffs_staging;

-- ALTER TABLE layoffs_staging
-- ADD DATE VARCHAR(100);              #13-17 = we crated new row and merged three columns and add into New created vales.

-- UPDATE layoffs_staging
-- SET DATE = CONCAT_ws('-',month,year,period_ym);

-- ALTER TABLE layoffs_staging
-- DROP COLUMN month;
-- DESCRIBE layoffs_staging

-- SHOW CREATE TABLE layoffs_staging;

-- ALTER TABLE layoffs_staging
-- DROP CHECK layoffs_staging_chk_16;         #25-26= drop the constraints


-- ALTER TABLE layoffs_staging
-- DROP COLUMN month
-- DROP column year             #29-32=DROP the three columns which we merged
-- DROP column period_ym;

-- SELECT * FROM layoffs_staging

-- UPDATE layoffs_staging
-- SET DATE = STR_TO_DATE(CONCAT(RIGHT(DATE,7),'-01'), '%Y-%m-%d');  #36-37= it gives year-mm-dd

-- UPDATE layoffs_staging      #39-40=it keeps the first 7 characters
-- SET DATE =LEFT(DATE,7);

#1. checking the duplicate rows.
-- SELECT *,
-- ROW_NUMBER() OVER(PARTITION BY company_name,industry,country,company_size,layoffs_count,layoff_percentage) AS row_num
-- FROM layoffs_staging;

-- WITH duplicate_cte AS (
--     SELECT *,
--     ROW_NUMBER() OVER(PARTITION BY company_name,industry,country,company_size,layoffs_count,layoff_percentage ) AS row_num
--     FROM layoffs_staging
-- )
-- SELECT *
-- FROM duplicate_cte
-- WHERE row_num > 1;

#NOTE:- in this data set we note find any type of duplicate values.
         #if we got any duplicate value then we could DELETE 

#2.STANDARDIZING data. 
--  SELECT record_id,company_name FROM layoffe LIMIT 13000;

-- SELECT company_name, TRIM(company_name)
-- FROM layoffs_staging                      #by using TRIM(company_name) we trim the uneven space between the elements of company names. 

-- UPDATE layoffs_staging
-- SET company_name = TRIM(company_name);   #we inserted all trim company name properly in TABLE.   
 
--  SELECT DISTINCT industry
--  FROM layoffs_staging
--  ORDER BY 1;

-- SELECT * from layoffs_staging;
-- SHOW COLUMNS FROM layoffs_staging LIKE 'DATE' ;  # to see the data type of date column

-- ALTER TABLE layoffs_staging
-- RENAME COLUMN `DATE`  to layoff_date;

#3.DEALING WITH NULL and blank VALUES. 

-- SELECT * from layoffs_staging;

-- SELECT * from layoffs_staging;

-- SELECT * from layoffs_staging LIMIT 13000;

-- SELECT * from layoffs_staging
-- WHERE company_name IS NULL AND company_name =''            # Finding where company_name and industry Name is blank.
-- OR INDUSTRY IS  NULL LIMIT 13000;



#4. we have to remove unecessary columns. 

-- CREATE TABLE layoffs_staging2
-- like layoffs_staging;             
-- INSERT into layoffs_staging2     #we created TABLE with name layoffs_staging2
-- SELECT * from layoffs_staging;

SELECT * from layoffs_staging2;

-- ALTER TABLE layoffs_staging2
-- DROP COLUMN stock_growth_percent,
-- DROP COLUMN revenue_growth_percent
-- DROP column salary_budget_change,       # I drop the columns which is not essential fro exploratory DATA analysis.
-- DROP column employee_sentiment,
-- DROP COLUMN job_security_score
-- DROP column market_condition;



