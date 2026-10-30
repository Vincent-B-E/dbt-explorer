SELECT 
    job_id,
    search_term AS role,
    company_name,
    job_salary,
    CASE
        WHEN job_salary LIKE '%a year' THEN 'year'
        WHEN job_salary LIKE '%an hour' THEN 'hour'
    END AS pay_period
FROM '../data/raw/raw_job_postings_*.parquet'
WHERE error IS NULL
  AND job_salary IS NOT NULL