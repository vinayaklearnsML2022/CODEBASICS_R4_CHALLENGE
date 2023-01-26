
WITH cte1 AS(
SELECT dp.division, dp.product_code,dp.product, SUM(fsm.sold_quantity) AS total_sold_qty FROM dim_product dp
JOIN fact_sales_monthly fsm
ON fsm.product_code = dp.product_code
WHERE fsm.fiscal_year=2021
GROUP BY dp.division,dp.product_code,dp.product
ORDER BY total_sold_qty DESC
),

cte2 AS (
SELECT  *,
RANK() OVER(PARTITION BY division ORDER BY total_sold_qty DESC ) AS RNK
FROM cte1
)

SELECT * FROM cte2
WHERE RNK<=3





