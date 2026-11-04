{{ config(materialized="table") }}


{% set top_n = 50 %}
-- Who hires the most data people? One row per company.
SELECT
	company_name,
    COUNT(*) as postings
FROM {{ ref('postings') }}
WHERE company_name NOT IN ('Jobs via Dice', 'beBeeData', 'Online Surveys', 'ExecutivePlacements.com', 'The Elite Job', 'VirtualVocations')
GROUP BY company_name
ORDER BY postings DESC
LIMIT {{ top_n }}