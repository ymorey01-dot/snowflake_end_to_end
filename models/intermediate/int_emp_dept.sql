{{ config(
    materialized='view'
) }}

SELECT
    e.EMP_ID,
    e.EMP_NAME,
    e.DEPARTMENT,
    d.DEPT_ID,
    d.LOCATION,
    d.MANAGER_NAME,
    e.SALARY,
    e.HIRE_DATE,

    CASE
        WHEN e.SALARY >= 70000 THEN 'HIGH'
        WHEN e.SALARY >= 50000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS SALARY_BAND

FROM {{ ref('emp_staging') }} e
LEFT JOIN {{ ref('dept_staging') }} d
    ON e.DEPARTMENT = d.DEPARTMENT