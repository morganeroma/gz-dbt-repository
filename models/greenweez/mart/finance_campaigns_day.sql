SELECT
finance_day.date_date
, ROUND(SUM(finance_day.operational_margin - campaigns_day.ads_cost),2) AS ads_margin
, ROUND(SUM(finance_day.average_basket),2) AS average_basket
, ROUND(SUM(finance_day.operational_margin),2) AS operational_margin
, ROUND(SUM(campaigns_day.ads_cost),2) AS ads_cost
, ROUND(SUM(campaigns_day.ads_impression),2) AS ads_impression
, ROUND(SUM(campaigns_day.ads_cliks),2) AS ads_clicks
, ROUND(SUM(finance_day.total_quantity_of_products_sold),2) AS quantity
, ROUND(SUM(finance_day.revenue),2) AS revenue
, ROUND(SUM(finance_day.total_purchase_cost),2) AS purchase_cost
, ROUND(SUM(finance_day.margin),2) AS margin
, ROUND(SUM(finance_day.total_shipping_fee),2) AS shipping_fee
, ROUND(SUM(finance_day.total_log_cost),2) AS total_log_cost
FROM {{ ref('finance_days') }} AS finance_day
LEFT JOIN {{ ref('int_campaigns_day') }} AS campaigns_day
ON finance_day.date_date = campaigns_day.date_date
GROUP BY finance_day.date_date
ORDER BY finance_day.date_date DESC