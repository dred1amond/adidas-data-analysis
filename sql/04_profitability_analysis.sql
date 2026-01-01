SELECT
    region,
    SUM(total_sales) AS revenue,
    SUM(operating_profit) AS profit,
    ROUND(SUM(operating_profit) / NULLIF(SUM(total_sales), 0) * 100, 2) AS profit_margin
FROM sales_clean
GROUP BY region
ORDER BY profit_margin DESC;
