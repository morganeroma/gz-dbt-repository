SELECT
    orders_margin.orders_id
    , orders_margin.date_date
    , SUM(orders_margin.revenue) AS revenue
    , SUM(orders_margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost) AS operational_margin
    , SUM(orders_margin.quantity) AS quantity  
    , SUM(orders_margin.purchase_cost) AS purchase_cost
    , SUM(ship.logcost) AS log_cost
    , SUM(ship.shipping_fee) AS shipping_fee     
    , SUM(orders_margin.margin) AS margin  
FROM {{ ref('int_orders_margin') }} AS orders_margin
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
    USING (orders_id)
GROUP BY orders_margin.orders_id, orders_margin.date_date