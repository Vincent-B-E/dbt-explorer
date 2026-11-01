{% set top_n = 50 %}
-- Who hires the most data people? One row per company.
{# TODO: filter out job boards like Jobs via Dice #}
SELECT
	company_name,
    COUNT(*) as postings
FROM {{ ref('postings') }}
GROUP BY company_name
ORDER BY postings DESC
LIMIT {{ top_n }}