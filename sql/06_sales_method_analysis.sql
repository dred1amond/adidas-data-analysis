SELECT
    sales_method,
    COUNT(*) AS transactions,
    SUM(total_sales) AS revenue,
    SUM(operating_profit) AS profit,
    ROUND(AVG(operating_margin), 2) AS avg_margin
FROM sales_clean
GROUP BY sales_method
ORDER BY avg_margin DESC;
