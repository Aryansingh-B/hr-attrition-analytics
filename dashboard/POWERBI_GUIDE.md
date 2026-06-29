# Power BI Dashboard — Build Guide

## Data Source

Connect to: `data/processed/hr_cleaned.csv`  
Or connect via PostgreSQL using the view: `vw_attrition_powerbi`

**PostgreSQL connection string:**
```
Server: localhost
Database: hr_analytics
Query: SELECT * FROM vw_attrition_powerbi
```

---

## Page 1 — Executive Overview

### KPI Cards (top row)
| Card | Measure |
|---|---|
| Total Employees | `COUNTROWS(employees)` |
| Employees Left | `SUM(employees[AttritionFlag])` |
| Attrition Rate | `DIVIDE(SUM(employees[AttritionFlag]), COUNTROWS(employees))` — format as % |
| Avg Monthly Income | `AVERAGE(employees[MonthlyIncome])` |

### Visuals
1. **Donut Chart** — Attrition (Yes/No) breakdown
2. **Clustered Bar Chart** — Attrition rate by Department
3. **Stacked Column Chart** — Attrition by Tenure Group
4. **Card + Gauge** — Overall attrition rate vs 12% benchmark

### Filters (Slicers)
- Department (dropdown)
- Gender (button)
- Age Group (dropdown)
- Salary Band (list)

---

## Page 2 — Drill-Through Analysis

Enable drill-through on JobRole field from Page 1.

### Visuals
1. **Matrix Table** — Job Role × Satisfaction Score (attrition rate values)
2. **Scatter Plot** — Monthly Income vs Years at Company (colored by Attrition)
3. **Bar Chart** — Attrition by Overtime (Yes/No)
4. **Box Plot / Violin** (using custom visual) — Income distribution: Stayed vs Left
5. **100% Stacked Bar** — Attrition breakdown by Salary Band

---

## Page 3 — Risk Dashboard

### Visuals
1. **Heatmap** — Department × Tenure Group attrition rate
2. **Decomposition Tree** — Drill from Attrition → Department → Role → Tenure
3. **Ribbon Chart** — Attrition trend across Job Level
4. **Table** — Top 10 at-risk employee segments with attrition rate

---

## DAX Measures

```dax
-- Attrition Rate
Attrition Rate = 
DIVIDE(
    CALCULATE(COUNTROWS(employees), employees[Attrition] = "Yes"),
    COUNTROWS(employees)
)

-- Attrition Rate % (formatted)
Attrition Rate % = FORMAT([Attrition Rate], "0.0%")

-- Avg Income: Left vs Stayed
Avg Income Left = 
CALCULATE(
    AVERAGE(employees[MonthlyIncome]),
    employees[Attrition] = "Yes"
)

Avg Income Stayed = 
CALCULATE(
    AVERAGE(employees[MonthlyIncome]),
    employees[Attrition] = "No"
)

-- Tenure Risk Flag
High Tenure Risk Count = 
CALCULATE(
    COUNTROWS(employees),
    employees[TenureGroup] = "< 2 years",
    employees[Attrition] = "Yes"
)

-- YoY comparison placeholder (for future data)
Attrition Rate Benchmark = 0.12  -- 12% industry average
```

---

## Theme & Design

**Color Palette:**
- Attrition (Yes): `#5C4EDB` (purple)
- Attrition (No): `#B0AECB` (neutral gray)
- Highlight accent: `#E85D24` (orange-red for risk)
- Background: `#F8F8FF`
- Text: `#1A1A2E`

**Font:** Segoe UI (Power BI default — keeps it professional)

**Layout:** 
- 1280×720 canvas
- KPI cards: 4 across top (200px height)
- Main visual area: full width (500px height)
- Slicer panel: right side (200px wide)

---

## Sharing to GitHub

Power BI `.pbix` files **can** be committed to GitHub.  
Since the file is binary, GitHub shows "Stored with Git LFS" for large files.

**Steps:**
1. Save your `.pbix` to `dashboard/HR_Attrition_Dashboard.pbix`
2. Export screenshots: File → Export → Export to PNG for each page
3. Save PNGs to `dashboard/dashboard_screenshots/`
4. Commit all files — the `.pbix` will be downloadable from GitHub

**Important:** Anyone downloading the `.pbix` can open it in Power BI Desktop (free).  
You just need to update the data source path to their local machine.

---

## Publishing via Power BI Service (Optional)

1. Publish to Power BI Service (free account)
2. In Service: Share → Get a shareable link
3. Add the share link to your README under "Dashboard Preview"
4. Embed screenshot in README pointing to that link