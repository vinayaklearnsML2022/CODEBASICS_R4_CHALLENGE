WITH cte1 as
(
SELECT dc.channel, ROUND(SUM(fgp.gross_price*fsm.sold_quantity/1000000),2) AS total_gross_mln_chl FROM dim_customer dc
JOIN fact_sales_monthly fsm
ON fsm.customer_code = dc. customer_code
JOIN fact_gross_price fgp
ON fgp.product_code = fsm.product_code
WHERE fsm.fiscal_year=2021
GROUP BY dc.channel

),
cte2 as
(
SELECT SUM(total_gross_mln_chl) AS total_gross_mln FROM cte1
)

SELECT channel,total_gross_mln_chl,ROUND((total_gross_mln_chl/total_gross_mln)*100,2) AS percentage FROM cte1
JOIN cte2
ORDER BY percentage DESC

