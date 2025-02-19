with 

source as (

    select * from {{ source('raw', 'cc_parcel') }}

),

renamed as (

    select
        parcel_id,
        parcel_tracking,
        transporter,
        priority,
        CAST(date_purchase AS DATE) AS date_purchase ,
        CAST(date_shipping AS DATE) AS date_shipping,
        CAST(date_delivery AS DATE) AS date_delivery,
        CAST(datecancelled AS DATE) AS date_cancelled

    from source

)

select * from renamed
