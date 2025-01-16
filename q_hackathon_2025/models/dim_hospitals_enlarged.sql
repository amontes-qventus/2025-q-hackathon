WITH enhanced_hospitals AS (
    SELECT 
        *,
        TRIM(
            REGEXP_REPLACE(
                hospital_name, 
                'Northwestern Medicine', 
                ''
            )
        ) AS cleaned_hospital_name
    FROM {{ ref("northwestern_enlarge_hospital_dataset") }}
)
SELECT 
    *
FROM {{source("q_lake_hospitals", "main_hospitals")}} AS mh
LEFT JOIN enhanced_hospitals AS ehd
ON mh.name LIKE ehd.cleaned_hospital_name
