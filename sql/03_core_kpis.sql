SELECT
    SUM(total_sales) AS total_revenue,
    SUM(operating_profit) AS total_operating_profit,
    ROUND(AVG(operating_margin), 2) AS avg_operating_margin,
    SUM(units_sold) AS total_units_sold
FROM sales_clean;
