SELECT
    product,
    SUM(total_sales) AS revenue,
    SUM(operating_profit) AS profit
FROM sales_clean
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;
