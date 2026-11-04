{{ config(materialized="ephemeral") }}

SELECT
    job_id,
    search_term AS role,
    company_name,
    job_salary,
    CASE
        WHEN job_salary LIKE '%a year' THEN 'year'
        WHEN job_salary LIKE '%an hour' THEN 'hour'
        WHEN job_salary LIKE '%a day' THEN 'day'
        WHEN job_salary LIKE '%a week' THEN 'week'
        WHEN job_salary LIKE '%a month' THEN 'month'
    END AS pay_period
FROM {{ ref('postings') }}
WHERE job_salary IS NOT NULL