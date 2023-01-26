
SELECT dc.customer_code,dc.customer, AVG(fpid.pre_invoice_discount_pct)*100 as average_pre_dct FROM fact_pre_invoice_deductions fpid
JOIN dim_customer dc
ON dc.customer_code = fpid.customer_code
WHERE fpid.fiscal_year=2021 AND dc.market="india"
GROUP BY dc.customer_code,dc.customer
ORDER BY average_pre_dct DESC LIMIT 5

