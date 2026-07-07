# 📊 HR Analytics Dashboard — Employee Attrition Insights

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-15-336791?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Complete-success?style=for-the-badge"/>
</p>

> **An end-to-end HR analytics solution** — from raw PostgreSQL ingestion to an interactive Power BI dashboard — identifying attrition risk factors across 1,400+ employee records and delivering actionable retention recommendations for executive stakeholders.

---

## 🎯 Business Problem

Employee attrition costs organizations **1.5–2× an employee's annual salary** in recruiting, onboarding, and lost productivity. HR leadership needed data-driven answers to:

- Which departments and roles have the highest attrition rates?
- What employee segments are most at risk of leaving?
- How do satisfaction scores, salary bands, and tenure correlate with attrition?
- What targeted interventions can reduce turnover?

---

## 📸 Dashboard Preview

| Overview Page | Drill-Through Analysis |
|---|---|
| ![Overview](dashboard/dashboard_screenshots/overview.png) | ![Drillthrough](dashboard/dashboard_screenshots/drillthrough.png) |

---

## 🔍 Key Findings

| Insight | Impact |
|---|---|
| 🚨 Employees with **< 2 years tenure** have **3× higher attrition** | Largest single risk factor |
| 💰 Employees in the **lowest salary band** attrite at **26%** vs 6% in top band | Strong compensation signal |
| 😞 Job satisfaction score **≤ 2** correlates with **41% attrition rate** | Engagement drives retention |
| 🏢 **Sales** department shows **20.6%** attrition — highest across all departments | Targeted intervention needed |
| 🕐 **Overtime workers** attrite at **30.5%** vs **10.4%** non-overtime | Work-life balance critical |

---

## 🏗️ Project Architecture

```
hr-attrition-analytics/
│
├── data/
│   ├── raw/                    # Original IBM HR dataset (1,470 records)
│   └── processed/              # Cleaned, feature-engineered dataset
│
├── sql/
│   ├── 01_create_schema.sql    # PostgreSQL table schema
│   ├── 02_load_data.sql        # Data loading + validation
│   └── 03_analytical_queries.sql  # Business insight queries
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb  # Missing values, type casting, feature engineering
│   ├── 02_eda_analysis.ipynb   # Visualizations, distribution analysis
│   └── 03_statistical_analysis.ipynb  # Correlation, chi-square, significance tests
│
├── dashboard/
│   ├── HR_Attrition_Dashboard.pbix   # Power BI dashboard file
│   └── dashboard_screenshots/        # PNG previews for GitHub
│
├── reports/
│   ├── HR_Attrition_Business_Report.pdf  # Executive business report
│   └── executive_summary.md              # Key findings summary
│
├── requirements.txt
└── README.md
```

---

## 🛠️ Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| **Storage** | PostgreSQL 15 | Structured data storage, SQL analytics |
| **Processing** | Python 3.11, pandas | Data cleaning, transformation |
| **Analysis** | scipy, statsmodels, seaborn | Statistical testing, visualization |
| **Dashboard** | Power BI Desktop | Interactive business dashboard |
| **Reporting** | Markdown, PDF | Executive stakeholder deliverable |

---

## 🚀 How to Run This Project

### Prerequisites
```bash
# Python dependencies
pip install -r requirements.txt

# PostgreSQL (ensure it's running)
psql --version  # should be 14+
```

### 1. Set up the database
```bash
psql -U postgres -c "CREATE DATABASE hr_analytics;"
psql -U postgres -d hr_analytics -f sql/01_create_schema.sql
psql -U postgres -d hr_analytics -f sql/02_load_data.sql
```

### 2. Download the dataset
Download [IBM HR Analytics Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) and place it in `data/raw/HR_Employee_Attrition.csv`.

### 3. Run notebooks (in order)
```bash
jupyter lab
# Open and run notebooks 01 → 02 → 03
```

### 4. Open Power BI Dashboard
Open `dashboard/HR_Attrition_Dashboard.pbix` in Power BI Desktop. Update the data source path to your local `data/processed/hr_cleaned.csv`.

---

## 📊 Statistical Methodology

- **Chi-Square Tests** — independence between categorical variables (department × attrition)
- **Point-Biserial Correlation** — relationship between continuous features and binary attrition
- **Distribution Analysis** — KDE plots, box plots for salary and satisfaction score segmentation
- **Cohort Analysis** — tenure-based segmentation to identify high-risk early-career window

---

## 📁 Dataset

**IBM HR Analytics Employee Attrition & Performance**  
- Source: [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)  
- Records: 1,470 employees  
- Features: 35 columns (demographics, job info, satisfaction scores, attrition flag)

---

## 👨‍💻 Author

**Aryan Singh**  
[![GitHub](https://img.shields.io/badge/GitHub-Aryansingh--B-181717?style=flat&logo=github)](https://github.com/Aryansingh-B)

---

## 📄 License

This project is for educational and portfolio purposes. Dataset © IBM (via Kaggle).