{{ config(materialized="table") }}

WITH totals AS (
    SELECT search_term AS role, COUNT(*) AS postings
    FROM {{ ref('postings') }}
    GROUP BY search_term
),
salaries AS (
    SELECT role, COUNT(*) AS salary_postings
    FROM {{ ref('salary_posts') }}
    GROUP BY role
),
max_jobs AS (
    SELECT role, MAX(jobs) AS max_jobs
    FROM {{ ref('skills_by_role') }}
    GROUP BY role
),
top_skill AS (
    SELECT skills_by_role.role, skills_by_role.skill_keyword AS top_skill
    FROM {{ ref('skills_by_role') }} AS skills_by_role
    JOIN max_jobs
        ON skills_by_role.role = max_jobs.role
        AND skills_by_role.jobs = max_jobs.max_jobs
)
SELECT
    totals.role,
    totals.postings,
    remote_by_role.pct_remote,
    ROUND(100.0 * salaries.salary_postings / totals.postings, 1) AS pct_with_salary,
    top_skill.top_skill
FROM totals
JOIN {{ ref('remote_by_role') }} AS remote_by_role USING (role)
JOIN salaries USING (role)
JOIN top_skill USING (role)
ORDER BY totals.postings DESC