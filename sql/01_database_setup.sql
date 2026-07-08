
-- OLIST E-COMMERCE BUSINESS INTELLIGENCE PROJECT
-- Database Setup


-- Tables Used

-- customers
-- orders
-- order_items
-- order_payments
-- order_reviews
-- products
-- sellers
-- geolocation
-- product_category_name_translation



SELECT COUNT(*) AS customers FROM customers;

SELECT COUNT(*) AS orders FROM orders;

SELECT COUNT(*) AS order_items FROM order_items;

SELECT COUNT(*) AS order_payments FROM order_payments;

SELECT COUNT(*) AS order_reviews FROM order_reviews;

SELECT COUNT(*) AS products FROM products;

SELECT COUNT(*) AS sellers FROM sellers;

SELECT COUNT(*) AS geolocation FROM geolocation;

SELECT COUNT(*) AS category_translation
FROM product_category_name_translation;
