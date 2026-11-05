SELECT
    job_id,
    job_title, 
    company_name, 
    job_via, 
    job_schedule_type, 
    job_work_from_home, 
    job_salary, 
    search_term, 
    search_date
FROM {{ source('raw', 'job_postings') }}
WHERE error IS NULL
