
WITH cte1 as(
SELECT dp.segment, COUNT(DISTINCT dp.product_code) as product_count_2020 FROM dim_product dp
JOIN fact_sales_monthly fsm
ON fsm.product_code=dp.product_code
WHERE fsm.fiscal_year=2020
GROUP BY segment
ORDER BY product_count_2020 DESC),

cte2 as(
SELECT dp.segment,  COUNT(DISTINCT dp.product_code) as product_count_2021 FROM dim_product dp
JOIN fact_sales_monthly fsm
ON fsm.product_code=dp.product_code
WHERE fsm.fiscal_year=2021
GROUP BY segment
ORDER BY product_count_2021 DESC)

SELECT c1.segment, c1.product_count_2020,c2.product_count_2021,(c2.product_count_2021-c1.product_count_2020 )as difference 
FROM cte1 c1
JOIN cte2 c2
ON c1.segment=c2.segment
ORDER BY difference DESC






