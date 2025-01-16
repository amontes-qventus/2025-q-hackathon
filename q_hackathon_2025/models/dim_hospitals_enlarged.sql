SELECT 
    * 
FROM {{source("q_lake_hospitals", "main_hospitals")}} AS  mh
LEFT JOIN {{ ref("northwestern_enlarge_hospital_dataset")}} AS ehd
ON mh.name LIKE TRIM(
        REGEXP_REPLACE(
            ehd.hospital_name, 
            '(?i)\bNorthwestern Medicine\b|\b', 
            '', 
            'g'
        )
    ) 