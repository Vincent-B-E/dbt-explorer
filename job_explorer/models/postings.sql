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
FROM '../data/raw/raw_job_postings_*.parquet'
WHERE error IS NULL
