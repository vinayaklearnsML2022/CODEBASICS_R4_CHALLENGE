SELECT fmc.product_code, fmc.manufacturing_cost, dp.product FROM fact_manufacturing_cost fmc
JOIN dim_product dp
ON dp.product_code=fmc.product_code
WHERE manufacturing_cost IN ((SELECT MIN(manufacturing_cost)  FROM fact_manufacturing_cost),
(SELECT MAX(manufacturing_cost)  FROM fact_manufacturing_cost))
ORDER BY manufacturing_cost DESC

