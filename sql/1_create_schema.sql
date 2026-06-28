DROP TABLE IF EXISTS employees CASCADE;

-- Main employee table
CREATE TABLE employees (
    employee_id         SERIAL PRIMARY KEY,
    age                 INTEGER NOT NULL,
    attrition           VARCHAR(3) NOT NULL,        -- 'Yes' / 'No'
    business_travel     VARCHAR(50),
    daily_rate          INTEGER,
    department          VARCHAR(100),
    distance_from_home  INTEGER,
    education           INTEGER CHECK (education BETWEEN 1 AND 5),
    education_field     VARCHAR(100),
    employee_count      INTEGER DEFAULT 1,
    employee_number     INTEGER UNIQUE,
    environment_satisfaction INTEGER CHECK (environment_satisfaction BETWEEN 1 AND 4),
    gender              VARCHAR(10),
    hourly_rate         INTEGER,
    job_involvement     INTEGER CHECK (job_involvement BETWEEN 1 AND 4),
    job_level           INTEGER CHECK (job_level BETWEEN 1 AND 5),
    job_role            VARCHAR(100),
    job_satisfaction    INTEGER CHECK (job_satisfaction BETWEEN 1 AND 4),
    marital_status      VARCHAR(20),
    monthly_income      INTEGER,
    monthly_rate        INTEGER,
    num_companies_worked INTEGER,
    over_18             VARCHAR(1) DEFAULT 'Y',
    over_time           VARCHAR(3),                 -- 'Yes' / 'No'
    percent_salary_hike INTEGER,
    performance_rating  INTEGER CHECK (performance_rating BETWEEN 1 AND 4),
    relationship_satisfaction INTEGER CHECK (relationship_satisfaction BETWEEN 1 AND 4),
    standard_hours      INTEGER DEFAULT 80,
    stock_option_level  INTEGER CHECK (stock_option_level BETWEEN 0 AND 3),
    total_working_years INTEGER,
    training_times_last_year INTEGER,
    work_life_balance   INTEGER CHECK (work_life_balance BETWEEN 1 AND 4),
    years_at_company    INTEGER,
    years_in_current_role INTEGER,
    years_since_last_promotion INTEGER,
    years_with_curr_manager INTEGER,

    -- Derived columns for easier analysis
    attrition_flag      INTEGER GENERATED ALWAYS AS (
                            CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END
                        ) STORED,

    salary_band         VARCHAR(20) GENERATED ALWAYS AS (
                            CASE
                                WHEN monthly_income < 3000  THEN 'Low (<3K)'
                                WHEN monthly_income < 6000  THEN 'Mid (3K-6K)'
                                WHEN monthly_income < 10000 THEN 'High (6K-10K)'
                                ELSE 'Very High (10K+)'
                            END
                        ) STORED,

    tenure_group        VARCHAR(30) GENERATED ALWAYS AS (
                            CASE
                                WHEN years_at_company < 2  THEN '< 2 years'
                                WHEN years_at_company < 5  THEN '2-5 years'
                                WHEN years_at_company < 10 THEN '5-10 years'
                                ELSE '10+ years'
                            END
                        ) STORED
);

-- Indexes for frequent query columns
CREATE INDEX idx_department    ON employees (department);
CREATE INDEX idx_attrition     ON employees (attrition);
CREATE INDEX idx_job_role      ON employees (job_role);
CREATE INDEX idx_tenure_group  ON employees (tenure_group);
CREATE INDEX idx_salary_band   ON employees (salary_band);

-- Confirm
SELECT 'Schema created successfully. Table: employees' AS status;