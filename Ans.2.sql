
WITH CTE1 as(
SELECT DISTINCT dp.product_code, fsm.fiscal_year FROM dim_product dp
JOIN fact_sales_monthly fsm
ON fsm.product_code = dp.product_code

),

CTE2 AS(
SELECT COUNT(*) unique_products_2020 FROM CTE1
WHERE fiscal_year=2020
),

CTE3 AS(
SELECT COUNT(*) unique_products_2021 FROM CTE1
WHERE fiscal_year=2021
)

SELECT *, (unique_products_2021-unique_products_2020)/unique_products_2021*100 AS percentage_chg FROM CTE2
JOIN CTE3






