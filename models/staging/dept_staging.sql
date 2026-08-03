{{ config(
    materialized='view'
) }}

SELECT
    DEPT_ID,
    TRIM(DEPARTMENT) AS DEPARTMENT,
    TRIM(LOCATION) AS LOCATION,
    COALESCE(MANAGER_NAME, 'UNKNOWN') AS MANAGER_NAME
FROM {{ source('note_source', 'DEPT') }}
WHERE DEPT_ID IS NOT NULL