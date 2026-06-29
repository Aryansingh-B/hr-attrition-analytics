# Executive Summary — HR Attrition Analysis

**Prepared for:** HR Leadership & People Analytics Team  
**Analyst:** Aryan Singh  
**Dataset:** IBM HR Analytics — 1,470 Employee Records  

---

## Overview

Analysis of 1,470 employee records reveals an overall attrition rate of **16.1%** (237 employees). This is above the industry benchmark of 10–12%, indicating an active retention risk that requires targeted intervention.

---

## Top 5 Findings

### 1. Early Tenure is the Highest Risk Window
Employees with **less than 2 years at the company** attrite at **32.6%** — nearly **3× the rate** of employees with 10+ years (11.2%). The first 18 months are the most critical retention period.

**Recommendation:** Implement a structured 90-day and 12-month onboarding program with milestone check-ins and mentorship assignment.

---

### 2. Compensation is a Primary Driver
Employees in the **lowest salary band (<$3,000/month)** have a **26.5% attrition rate**, compared to just **6.8%** in the highest band. The income distribution of employees who left skews significantly lower (median: $3,202 vs $6,833 for those who stayed).

**Recommendation:** Conduct a salary benchmarking study. Prioritize compensation reviews for junior roles in Sales and R&D departments.

---

### 3. Sales Department Needs Immediate Attention
The **Sales department** has the highest attrition rate at **20.6%**, driven by Sales Representatives (39.8% attrition). The combination of overtime demands and lower satisfaction scores in this department creates compounding risk.

**Recommendation:** Review Sales incentive structure, quota expectations, and work-life balance policies specific to field roles.

---

### 4. Overtime is a Retention Red Flag
Employees working overtime attrite at **30.5%** versus **10.4%** for those who don't. This suggests workload imbalance is a material risk, particularly in combination with low satisfaction scores.

**Recommendation:** Audit overtime frequency by department. Set policy thresholds and add workload capacity planning to quarterly HR reviews.

---

### 5. Job Satisfaction is Predictive at the Margins
Employees with a satisfaction score of **1 (Low)** attrite at **22.8%**, compared to **11.3%** for score 4 (Very High). A bi-annual engagement pulse survey with automated risk flagging for scores ≤ 2 would allow proactive intervention.

**Recommendation:** Deploy quarterly micro-surveys for teams with <2 years average tenure. Route alerts to direct managers.

---

## Risk Segmentation

| Risk Tier | Criteria | Employees | Attrition Rate |
|---|---|---|---|
| 🔴 High Risk | < 2 yrs tenure + Low salary + Overtime | ~87 | ~48% |
| 🟡 Medium Risk | < 2 yrs tenure OR Low salary | ~320 | ~28% |
| 🟢 Low Risk | 5+ yrs + High salary + No overtime | ~380 | ~8% |

---

## Projected Impact

If attrition in the **High Risk** segment is reduced by 30% through targeted interventions:
- ~26 employees retained
- Estimated cost saving: **$2.3M–$3.1M** (using 1.5–2× average salary replacement cost)

---

## Next Steps

1. Implement risk scoring into HRIS for real-time flagging
2. Quarterly attrition review cadence with this dashboard
3. Manager training program focused on early-career retention
4. Compensation audit for bottom two salary bands

---

*Analysis conducted using Python (pandas, scipy, statsmodels), PostgreSQL, and Power BI.*