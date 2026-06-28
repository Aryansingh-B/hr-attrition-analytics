-- ============================================================
-- HR Analytics: Analytical Queries
-- Each query answers a specific business question
-- ============================================================

-- ─────────────────────────────────────────
-- Q1: Overall attrition rate
-- ─────────────────────────────────────────
SELECT
    COUNT(*)                                        AS total_employees,
    SUM(attrition_flag)                             AS employees_left,
    ROUND(AVG(attrition_flag) * 100, 2)            AS attrition_rate_pct
FROM employees;


-- ─────────────────────────────────────────
-- Q2: Attrition by department
-- ─────────────────────────────────────────
SELECT
    department,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct
FROM employees
GROUP BY department
ORDER BY attrition_pct DESC;


-- ─────────────────────────────────────────
-- Q3: Attrition by tenure group (KEY FINDING)
-- Employees < 2 years have 3x higher attrition
-- ─────────────────────────────────────────
SELECT
    tenure_group,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct,
    ROUND(AVG(monthly_income), 0)                  AS avg_income
FROM employees
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '< 2 years'   THEN 1
        WHEN '2-5 years'   THEN 2
        WHEN '5-10 years'  THEN 3
        WHEN '10+ years'   THEN 4
    END;


-- ─────────────────────────────────────────
-- Q4: Attrition by salary band
-- ─────────────────────────────────────────
SELECT
    salary_band,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct,
    ROUND(AVG(job_satisfaction), 2)                AS avg_satisfaction
FROM employees
GROUP BY salary_band
ORDER BY AVG(monthly_income);


-- ─────────────────────────────────────────
-- Q5: Attrition by job satisfaction score
-- ─────────────────────────────────────────
SELECT
    job_satisfaction,
    CASE job_satisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END                                             AS satisfaction_label,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct
FROM employees
GROUP BY job_satisfaction
ORDER BY job_satisfaction;


-- ─────────────────────────────────────────
-- Q6: Overtime vs attrition
-- ─────────────────────────────────────────
SELECT
    over_time,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct
FROM employees
GROUP BY over_time
ORDER BY over_time;


-- ─────────────────────────────────────────
-- Q7: Top 10 highest-attrition job roles
-- ─────────────────────────────────────────
SELECT
    job_role,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct,
    ROUND(AVG(monthly_income), 0)                  AS avg_income,
    ROUND(AVG(job_satisfaction), 2)                AS avg_satisfaction
FROM employees
GROUP BY job_role
HAVING COUNT(*) > 20
ORDER BY attrition_pct DESC
LIMIT 10;


-- ─────────────────────────────────────────
-- Q8: Age group analysis
-- ─────────────────────────────────────────
SELECT
    CASE
        WHEN age < 25            THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END                                             AS age_group,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct,
    ROUND(AVG(monthly_income), 0)                  AS avg_income
FROM employees
GROUP BY age_group
ORDER BY MIN(age);


-- ─────────────────────────────────────────
-- Q9: Multi-factor high-risk profile
-- Employees most likely to attrite
-- ─────────────────────────────────────────
SELECT
    tenure_group,
    salary_band,
    CASE WHEN over_time = 'Yes' THEN 'Overtime' ELSE 'No Overtime' END AS overtime_status,
    COUNT(*)                                        AS total,
    SUM(attrition_flag)                             AS attrited,
    ROUND(AVG(attrition_flag) * 100, 1)            AS attrition_pct
FROM employees
GROUP BY tenure_group, salary_band, overtime_status
HAVING COUNT(*) >= 10
ORDER BY attrition_pct DESC
LIMIT 15;


-- ─────────────────────────────────────────
-- Q10: Export view for Power BI
-- ─────────────────────────────────────────
CREATE OR REPLACE VIEW vw_attrition_powerbi AS
SELECT
    employee_id,
    age,
    attrition,
    attrition_flag,
    department,
    job_role,
    gender,
    marital_status,
    education_field,
    business_travel,
    over_time,
    monthly_income,
    salary_band,
    years_at_company,
    tenure_group,
    job_satisfaction,
    environment_satisfaction,
    work_life_balance,
    job_involvement,
    performance_rating,
    total_working_years,
    years_since_last_promotion,
    distance_from_home
FROM employees;

SELECT 'View vw_attrition_powerbi created for Power BI connection' AS status;