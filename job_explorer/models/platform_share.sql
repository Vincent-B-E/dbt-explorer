SELECT 
    REGEXP_REPLACE(job_via, '^via ', '') AS platform, 
    COUNT(*) AS postings
FROM {{ ref('postings') }}
GROUP BY platform
ORDER BY postings DESC