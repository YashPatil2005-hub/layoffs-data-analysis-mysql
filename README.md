# Tech Layoffs Analysis in MySQL

This is my first SQL project. I took a tech layoffs dataset with about 12,000 rows, cleaned it in MySQL, and then explored it to see what patterns I could find.

One thing to know first: the numbers in this dataset are very large (58.5 million layoffs), much more than real-world figures, so I think the data is simulated. I used it to practice SQL, so please don't treat the findings as real trends.

## What I found

- Total layoffs came to about 58.5 million between 2024 and 2026.
- Layoffs went down by about 9.2% from 2024 (20.3M) to 2026 (18.4M). 2025 was 19.8M. The 2026 data only goes up to November, so this comparison isn't completely fair.
- The UK had the most layoffs (10.3M), then the USA (9.8M) and Singapore (9.7M).
- By industry, Social Media was first (8.76M), followed by AI (8.53M) and E-Commerce (8.41M).
- Restructuring (12.05M) and AI Automation (12.01M) were the top two reasons. Each made up about 20.5% of the total.
- The company with the most layoffs was different every year: Microsoft in 2024, Meta in 2025 and Databricks in 2026.
- The AI impact score was almost the same for every reason (between 6.36 and 6.41), so it didn't help much in telling them apart.

## About the data

- Source: https://www.kaggle.com/datasets/amaymishra11/tech-layoffs-and-hiring-trends-2026
- Raw rows: about 12,000
- Rows left after cleaning: 11,670
- Time period: January 2024 to November 2026
- Layoffs per record: from 2 to 19,988 employees, about 5,013 on average

## How I cleaned it

1. Made staging tables first, so the raw data stays safe.
2. Found and removed duplicates using `ROW_NUMBER()` inside a CTE.
3. Used `TRIM()` to fix extra spaces in text columns.
4. The date was stored as year and month text, so I converted it to a proper `DATE` with `STR_TO_DATE()`. I used the 1st of each month as the day.
5. Dealt with blank and NULL values.
6. Dropped columns I didn't need (company health columns and market condition).

## What I analysed

- Basic summary: row count, date range, minimum, maximum and average layoffs
- Total layoffs by company, industry, country, company size and reason
- Yearly trend and a monthly rolling total
- Top 5 companies for each year using `DENSE_RANK()`
- AI automation impact and replacement risk by reason
- Hiring trend compared with layoffs

## SQL I used

GROUP BY, JOIN, CTEs, window functions (ROW_NUMBER, DENSE_RANK, rolling SUM() OVER), STR_TO_DATE, TRIM, ALTER TABLE, UPDATE

## Files in this repo

- `01_data_cleaning.sql`: all the cleaning steps
- `02_exploratory_analysis.sql`: the analysis queries
- `Raw_tech_layoffs_hiring_trends_2026.csv`: the raw dataset

To run it yourself, import the CSV into MySQL, then run the two SQL files in order.

## About me

Yash Patil | [LinkedIn](https://linkedin.com/in/yash-patil-b452ab288)
