SELECT 
    DATE_TRUNC('month', search_date) AS month,
    COUNT(*) AS total_postings
FROM {{ ref('postings') }}
GROUP BY month
ORDER BY month