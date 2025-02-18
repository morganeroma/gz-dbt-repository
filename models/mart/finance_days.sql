SELECT
    date_date
    , COUNT(orders_id) AS nb_transactions
    , SUM(revenue) AS revenue
    , SUM(revenue) / COUNT(orders_id) AS average_basket 
    , SUM(margin) AS margin
    , SUM(operational_margin) AS operational_margin
    , SUM(purchase_cost) AS total_purchase_cost
    , SUM(shipping_fee) AS total_shipping_fee
    , SUM(log_cost) AS total_log_cost
    , SUM(quantity) AS total_quantity_of_products_sold  
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date