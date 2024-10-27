-- stg_csv_S3_comments.sql
{{ config(enabled=true) }}


with raw_data as (
    select
        REVIEW_TITLE as review_title,
        REVIEW_TEXT as review_text,
        REVIEW_DATE as review_date,
        AUTHOR_TITLE as author
    from {{ source('csv_S3', 'judgeme_reviews') }}  -- Nom de votre table dans le schéma "csv"
)

select * from raw_data
