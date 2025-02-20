WITH sub_1 AS(
    SELECT
    sales.*
    , product.purchase_price
    , (sales.quantity*product.purchase_price) AS purchase_cost
    FROM {{ ref('stg_raw__sales') }} AS sales
    LEFT JOIN {{ ref('stg_raw__product') }} AS product
    USING (products_id)

)
, sub_2 AS(
SELECT 
sub_1.*
, (sub_1.revenue - sub_1.purchase_cost) AS margin
FROM sub_1
)
SELECT
*
, {{margin_percent('revenue', 'purchase_cost')}} AS margin_percent
FROM sub_2