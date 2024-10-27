{{ config(enabled=true) }}

with judgeme_reviews as (
    select 
        cast(review_title as varchar) as review_title,
        cast(review_text as varchar) as review_text,
        cast(review_date as date) as review_date,
        cast(author as varchar) as author,
        cast(product_title as varchar) as product_title
    from {{ ref('stg_judge_me_comments') }}
),

csv_reviews as (
    select
        cast(review_title as varchar) as review_title,
        cast(review_text as varchar) as review_text,
        cast(review_date as date) as review_date,
        cast(author as varchar) as author,
        null as product_title  -- Si `product_title` n'existe pas dans `csv`, on le met à null
    from {{ ref('stg_csv_S3_comments') }}
)

select
    review_title,
    review_text,
    review_date,
    author,
    product_title
from judgeme_reviews

union all

select
    review_title,
    review_text,
    review_date,
    author,
    product_title
from csv_reviews


