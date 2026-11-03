WITH totals AS (
    SELECT search_term AS role, COUNT(*) AS postings
    FROM {{ ref('postings') }}
    GROUP BY search_term
),
salaries AS (
    SELECT role, COUNT(*) AS salary_postings
    FROM {{ ref('salary_posts') }}
    GROUP BY role
)
SELECT
    totals.role,
    totals.postings,
    remote_by_role.pct_remote,
    ROUND(100.0 * salaries.salary_postings / totals.postings, 1) AS pct_with_salary
FROM totals
JOIN {{ ref('remote_by_role') }} AS remote_by_role USING (role)
JOIN salaries USING (role)
ORDER BY totals.postings DESC