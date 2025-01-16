SELECT
    cases.*,
    hospitals.name,
    hospitals.abbreviation,
    hospitals.location,
    hospitals.latitude,
    hospitals.longitude,
    hospitals.zip_code,
    hospitals.cms_certification_number,
    hospitals.type_of_facility,
    hospitals.type_of_control,
    hospitals.total_staffed_beds,
    hospitals.total_patient_revenue,
    hospitals.total_discharges,
    hospitals.total_patient_days,
    hospitals.tps_quality_score,
    hospitals.patient_experience_rating_count
FROM
{{source("q_lake_or_cases", "or_cases_golden_scheduled_after_oct_2024")}} AS cases
LEFT JOIN {{ ref('dim_hospitals_enlarged') }} AS hospitals
ON cases.hospital = hospitals.id