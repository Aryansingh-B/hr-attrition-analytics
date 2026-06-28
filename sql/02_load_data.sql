-- Step 1: Load raw data from CSV
-- UPDATE this path to where your CSV lives on disk
\COPY employees (
    age, attrition, business_travel, daily_rate, department,
    distance_from_home, education, education_field, employee_count,
    employee_number, environment_satisfaction, gender, hourly_rate,
    job_involvement, job_level, job_role, job_satisfaction,
    marital_status, monthly_income, monthly_rate, num_companies_worked,
    over_18, over_time, percent_salary_hike, performance_rating,
    relationship_satisfaction, standard_hours, stock_option_level,
    total_working_years, training_times_last_year, work_life_balance,
    years_at_company, years_in_current_role, years_since_last_promotion,
    years_with_curr_manager
)
FROM '"A:\DataScience_AI\NIT_hyd\Project\Resume_projects\hr-attrition-analytics\data\raw\WA_Fn-UseC_-HR-Employee-Attrition-selected-columns.csv"'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

--  Validate row count (expect 1470)
SELECT
    COUNT(*) AS total_records,
    SUM(attrition_flag) AS total_attritions,
    ROUND(AVG(attrition_flag) * 100, 1) AS overall_attrition_pct
FROM employees;

--  Check for nulls in key columns
SELECT
    COUNT(*) FILTER (WHERE department IS NULL)          AS null_department,
    COUNT(*) FILTER (WHERE monthly_income IS NULL)      AS null_income,
    COUNT(*) FILTER (WHERE job_satisfaction IS NULL)    AS null_satisfaction,
    COUNT(*) FILTER (WHERE years_at_company IS NULL)    AS null_tenure
FROM employees;

-- Quick distribution sanity check
SELECT attrition, COUNT(*) AS count
FROM employees
GROUP BY attrition
ORDER BY attrition;