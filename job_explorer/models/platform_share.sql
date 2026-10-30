SELECT 
    REGEXP_REPLACE(job_via, '^via ', '') AS platform, 
    COUNT(*) AS postings
FROM '../data/raw/raw_job_postings_*.parquet'
WHERE error IS NULL
GROUP BY platform
ORDER BY postings DESC