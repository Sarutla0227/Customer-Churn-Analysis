--  ======================================
--    CUSTOMER CHURN ANALYSIS
--  ======================================

-- 1. KPI ANALYSIS

-- 1. TOTAL CUSTOMERS
SELECT COUNT(*) AS total_customers
FROM churn;

-- 2. TOTAL CHURNED CUSTOMERS
SELECT COUNT(*) AS churned_customers
FROM churn
WHERE "Churn Label" = 'Yes';

-- 3. OVERALL CHURN RATE
SELECT 
    ROUND(100.0 * SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn;

-- 2. CHURN BY CONTRACT
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 3. CHURN BY PAYMENT METHOD
SELECT 
    "Payment Method",
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY "Payment Method"
ORDER BY churn_rate DESC;


-- 4. CHURN BY INTERNET SERVICE
SELECT""
    "Internet Service",
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY ["Internet Service"]
ORDER BY churn_rate DESC;


-- 5. CHURN BY DEMOGRAPHICS
-- CHURN BY SENIOR CITIZEN
SELECT 
    ["Senior Citizen"],
    COUNT(*) AS total_customers,
    SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY ["Senior Citizen"];

-- CHURN BY MARITAL STATUS
SELECT 
    Married,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY Married;

-- CHURN BY DEPENDENTS
SELECT 
    Dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY Dependents;


-- 6. SATISFACTION AND REVENUE ANALYSIS

-- SATISFACTION SCORE VS CHURN
SELECT 
    ["Satisfaction Score"],
    COUNT(*) AS total_customers,
    SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN ["Churn Label"] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM churn
GROUP BY ["Satisfaction Score"]
ORDER BY ["Satisfaction Score"];

-- AVERAGE CHARGES BY CHURN
SELECT 
    ["Churn Label"],
    ROUND(AVG(["Monthly Charge"]), 2) AS avg_monthly_charge,
    ROUND(AVG(["Total Charges"]), 2) AS avg_total_charges
FROM churn
GROUP BY ["Churn Label"];

-- TOTAL REVENUE LOST FROM CHURNED CUSTOMERS
SELECT 
    ROUND(SUM(["Total Revenue"]), 2) AS total_revenue_lost
FROM churn
WHERE ["Churn Label"] = 'Yes';


-- 7. CHURN REASONS

-- CHURN CATEGORY
SELECT 
    ["Churn Category"],
    COUNT(*) AS churn_count
FROM churn
WHERE ["Churn Label"] = 'Yes'
GROUP BY ["Churn Category"]
ORDER BY churn_count DESC;

-- TOP 10 CHURN REASONS
SELECT
    ["Churn Reason"],
    COUNT(*) AS churn_count
FROM churn
WHERE "Churn Label" = 'Yes'
GROUP BY "Churn Reason"
ORDER BY churn_count DESC;