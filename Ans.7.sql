SELECT monthname(fsm.date) as month_name, fsm.fiscal_year, dc.customer, 
SUM(fgp.gross_price*fsm.sold_quantity)/1000000 as total_gross_price_mln
FROM fact_sales_monthly fsm
JOIN dim_customer dc
ON dc.customer_code = fsm.customer_code
JOIN fact_gross_price fgp
ON fgp.product_code=fsm.product_code
WHERE customer = "Atliq Exclusive"
GROUP BY  MONTH(fsm.date),month_name, fsm.fiscal_year
ORDER BY fsm.fiscal_year, MONTH(fsm.date)


