-- Cohort Analysis

-- Step 1: Identify First Purchase Date

CREATE TABLE customer_cohort AS
SELECT
    c.customer_unique_id,
    MIN(o.order_purchase_timestamp) AS first_purchase,
    DATE_TRUNC('month', MIN(o.order_purchase_timestamp)) AS cohort_month
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id;

-- Step 2: Create Purchase History with Cohort

CREATE TABLE cohort_data AS
SELECT
    cc.customer_unique_id,
    cc.cohort_month,
    DATE_TRUNC('month', o.order_purchase_timestamp) AS purchase_month,
    (
        (
            EXTRACT(YEAR FROM DATE_TRUNC('month', o.order_purchase_timestamp))
            - EXTRACT(YEAR FROM cc.cohort_month)
        ) * 12
        +
        (
            EXTRACT(MONTH FROM DATE_TRUNC('month', o.order_purchase_timestamp))
            - EXTRACT(MONTH FROM cc.cohort_month)
        )
    ) AS month_index
FROM customer_cohort cc
JOIN customers c
    ON cc.customer_unique_id = c.customer_unique_id
JOIN orders o
    ON c.customer_id = o.customer_id;

-- Step 3: Count Active Customers

CREATE TABLE cohort_retention AS
SELECT
    cohort_month,
    month_index,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM cohort_data
GROUP BY cohort_month, month_index
ORDER BY cohort_month, month_index;

-- Step 4: Calculate Retention Percentage

CREATE TABLE cohort_retention_percentage AS
WITH cohort_size AS
(
    SELECT
        cohort_month,
        customers AS cohort_customers
    FROM cohort_retention
    WHERE month_index = 0
)

SELECT
    cr.cohort_month,
    cr.month_index,
    cr.customers,
    cs.cohort_customers,
    ROUND(
        (cr.customers::NUMERIC / cs.cohort_customers) * 100,
        2
    ) AS retention_percentage
FROM cohort_retention cr
JOIN cohort_size cs
ON cr.cohort_month = cs.cohort_month
ORDER BY
    cr.cohort_month,
    cr.month_index;
