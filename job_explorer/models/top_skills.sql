
SELECT skill_keyword, COUNT(DISTINCT job_id) AS jobs
FROM {{ source('raw', 'job_skills') }}
GROUP BY skill_keyword
ORDER BY jobs DESC