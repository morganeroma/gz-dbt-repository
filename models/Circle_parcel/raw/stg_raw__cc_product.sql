with 

source as (

    select * from {{ source('raw', 'cc_product') }}

),

renamed as (

    select
        parcel_id,
        model_mame,
        quantity

    from source

)

select * from renamed
