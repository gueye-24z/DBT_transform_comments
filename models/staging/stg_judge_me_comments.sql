-- stg_judge_me_comments.sql
{{ config(enabled=true) }}


with raw_data as (
    select
        BODY as review_text,
        CREATED_AT as review_date,
        PRODUCT_TITLE as product_title,
        REVIEWER as author,
        TITLE as review_title
    from {{ source('judge_me', 'reviews') }}  -- Nom de votre table dans le schéma "judgeme"
)

select * from raw_data
