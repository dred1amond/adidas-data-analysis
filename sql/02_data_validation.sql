-- 1. Total number of records
SELECT
    COUNT(*) AS total_rows
FROM sales_clean;

-- 2. Check for NULL values in key analytical fields
SELECT
    COUNT(*) FILTER (WHERE total_sales IS NULL) AS null_total_sales,
    COUNT(*) FILTER (WHERE operating_profit IS NULL) AS null_operating_profit,
    COUNT(*) FILTER (WHERE operating_margin IS NULL) AS null_operating_margin
FROM sales_clean;

-- 3. Check for invalid or non-positive values
SELECT
    COUNT(*) FILTER (WHERE total_sales <= 0) AS non_positive_sales,
    COUNT(*) FILTER (WHERE units_sold <= 0) AS non_positive_units,
    COUNT(*) FILTER (WHERE operating_profit < 0) AS negative_profit
FROM sales_clean;

