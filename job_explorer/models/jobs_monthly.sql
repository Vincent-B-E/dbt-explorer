SELECT 
    DATE_TRUNC('month', search_date) AS month,
    search_term AS role,
    COUNT(*) AS total_postings
FROM {{ ref('postings') }}
GROUP BY month, role
ORDER BY month, role