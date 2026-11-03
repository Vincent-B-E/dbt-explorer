SELECT
    postings.search_term AS role,
    skills.skill_keyword,
    COUNT(DISTINCT skills.job_id) AS jobs
FROM {{ source('raw', 'job_skills') }} AS skills
JOIN {{ ref('postings') }} AS postings
    ON skills.job_id = postings.job_id
GROUP BY ALL
ORDER BY role, jobs DESC