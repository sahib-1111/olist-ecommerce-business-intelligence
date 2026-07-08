-- RFM Analysis

-- Step 1: Create Customer RFM Table

CREATE TABLE customer_rfm AS
SELECT
    c.customer_unique_id,
    MAX(o.order_purchase_timestamp) AS last_purchase,
    COUNT(DISTINCT o.order_id) AS frequency,
    SUM(p.payment_value) AS monetary,
    '2018-09-03'::date - MAX(o.order_purchase_timestamp)::date AS recency
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY c.customer_unique_id;

-- Step 2: Generate RFM Scores

CREATE TABLE customer_rfm_scores AS
SELECT *,
       NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
       NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
       NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
FROM customer_rfm;

-- Step 3: Generate RFM Score

CREATE TABLE customer_rfm_final AS
SELECT *,
       CONCAT(r_score, f_score, m_score) AS rfm_score
FROM customer_rfm_scores;

-- Step 4: Customer Segmentation

CREATE TABLE customer_segments AS
SELECT *,
CASE
    WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
    WHEN r_score >= 3 AND f_score >= 4 THEN 'Loyal Customers'
    WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
    WHEN r_score <= 2 AND f_score >= 4 THEN 'At Risk'
    WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost Customers'
    ELSE 'Potential Loyalists'
END AS customer_segment
FROM customer_rfm_final;

-- Step 5: Segment Summary

SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM customer_segments
GROUP BY customer_segment
ORDER BY total_customers DESC;
