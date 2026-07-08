
-- OLIST E-COMMERCE BUSINESS QUERIES



-- 1. Total Revenue

SELECT
ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments;


-- 2. Total Orders

SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM orders;


-- 3. Total Customers

SELECT
COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;


-- 4. Average Order Value

SELECT
ROUND(SUM(payment_value)/COUNT(DISTINCT order_id),2)
AS average_order_value
FROM order_payments;


-- 5. Monthly Revenue Trend

SELECT
DATE_TRUNC('month',o.order_purchase_timestamp) AS month,
ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN order_payments p
ON o.order_id=p.order_id
GROUP BY month
ORDER BY month;


-- 6. Revenue by Customer State

SELECT
c.customer_state,
ROUND(SUM(p.payment_value),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_payments p
ON o.order_id=p.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;


-- 7. Revenue by Product Category

SELECT
pct.product_category_name_english,
ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id
JOIN product_category_name_translation pct
ON p.product_category_name=pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY revenue DESC;


-- 8. Top 10 Products by Revenue

SELECT
product_id,
ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;


-- 9. Top 10 Sellers by Revenue

SELECT
seller_id,
ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;


-- 10. Top 10 Customers by Revenue

SELECT
c.customer_unique_id,
ROUND(SUM(p.payment_value),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_payments p
ON o.order_id=p.order_id
GROUP BY c.customer_unique_id
ORDER BY revenue DESC
LIMIT 10;


-- 11. Orders by Status

SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 12. Payment Type Distribution

SELECT
payment_type,
COUNT(*) AS transactions
FROM order_payments
GROUP BY payment_type
ORDER BY transactions DESC;


-- 13. Average Review Score

SELECT
ROUND(AVG(review_score),2) AS average_review
FROM order_reviews;


-- 14. Average Delivery Time

SELECT
ROUND(
AVG(order_delivered_customer_date::date -
order_purchase_timestamp::date),2)
AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- 15. Seller Distribution by State

SELECT
seller_state,
COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;
