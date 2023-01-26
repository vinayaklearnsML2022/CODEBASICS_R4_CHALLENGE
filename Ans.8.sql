SELECT SUM(sold_quantity) as total_sold_qty ,get_qtr(date) as Quarters FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_qty DESC


