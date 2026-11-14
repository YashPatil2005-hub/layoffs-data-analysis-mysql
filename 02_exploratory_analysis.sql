USE layoffes;

-- select * from layoffs_staging2;

-- SELECT count(*)from layoffs_staging2;
-- SELECT MIN(layoff_date), MAX(layoff_date)
-- from layoffs_staging2;                                      #DATAset overview
-- SELECT MAX(layoffs_count),MIN(layoffs_count),AVG(layoffs_count)
-- FROM layoffs_staging2;


-- SELECT * from layoffs_staging2
-- ORDER BY layoffs_count DESC LIMIT 10;    #top 10 biggest layoffs

-- SELECT company_name,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY company_name                         # layoffs count by company_name
-- ORDER BY total DESC LIMIT 20;


-- SELECT industry,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY industry                         # layoffs count by industry
-- ORDER BY total DESC LIMIT 20;


-- SELECT country,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY country                        # layoffs count by country
-- ORDER BY total DESC LIMIT 20;

-- SELECT company_size,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY company_size                         # layoffs count by company_size
-- ORDER BY total DESC LIMIT 20;

-- SELECT reason_for_layoffs,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY reason_for_layoffs                    # layoffs count by reason_for_layoffs
-- ORDER BY total DESC LIMIT 20;

-- SELECT LEFT(layoff_date,4) AS yr,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY yr                    # layoffs count by year(layoff_date not converting in DATE format so we use another teachnique)
-- ORDER BY yr DESC;

-- SELECT RIGHT(layoff_date,2) AS month,SUM(layoffs_count) AS total
-- FROM layoffs_staging2
-- GROUP BY month                   # layoffs count by month(layoff_date not converting in DATE format so we use another teachnique)
-- ORDER BY month DESC;

-- WITH monthly AS (
--   SELECT LEFT(layoff_date,7) AS month, SUM(layoffs_count) AS total
--   FROM layoffs_staging2
--   GROUP BY month                     #Rolling total by month
-- )
-- SELECT month, total, SUM(total) OVER (ORDER BY month) AS rolling_total
-- FROM monthly;


-- SELECT reason_for_layoffs,
--        ROUND(AVG(ai_automation_impact), 2) AS avg_ai_impact,
--        ROUND(AVG(ai_replacement_risk), 2) AS avg_replacement_risk    #AI impact
-- FROM layoffs_staging2
-- GROUP BY reason_for_layoffs;

-- SELECT hiring_trend, SUM(layoffs_count) AS layoffs, SUM(open_roles) AS open_roles
-- FROM layoffs_staging2                     #HIRING VS layoffs
-- GROUP BY hiring_trend;



-- WITH yearly AS (
--   SELECT company_name, LEFT(layoff_date,4) AS yr, SUM(layoffs_count) AS total
--   FROM layoffs_staging2
--   GROUP BY company_name, yr
-- ),
-- ranked AS (
--   SELECT *, DENSE_RANK() OVER (PARTITION BY yr ORDER BY total DESC) AS rnk     #TOP 3 company year by year
--   FROM yearly
-- )
-- SELECT * FROM ranked WHERE rnk <= 5;