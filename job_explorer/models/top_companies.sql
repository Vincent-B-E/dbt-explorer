-- Who hires the most data people? One row per company.
SELECT
	company_name,
    COUNT(*) as postings
FROM '../data/raw/raw_job_postings_*.parquet'
WHERE error IS NULL
GROUP BY company_name
ORDER BY postings DESC
LIMIT 50