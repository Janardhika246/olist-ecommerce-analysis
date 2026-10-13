USE olist_project;

-- Query 1: Total orders and revenue
-- Finding: 98,666 orders, about 13.59 million revenue, about 137.76 per order
SELECT COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(price), 2) AS total_revenue
FROM order_items;

-- Query 2: Monthly revenue
-- Finding: peaked at 1.01 million in Nov 2017; first and last months have little data
SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
       ROUND(SUM(oi.price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Query 3: Top 10 product categories by revenue
-- Finding: health and beauty first (about 1.26 million)
SELECT p.product_category_name,
       ROUND(SUM(oi.price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- Query 4: Cancellation rate
-- Finding: 0.63%, which is low
SELECT ROUND(100 * SUM(order_status = 'canceled') / COUNT(*), 2) AS cancel_rate_percent
FROM orders;

-- Query 5: Average delivery time in days
-- Finding: 12.5 days
SELECT ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 1) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Query 6: Late deliveries vs review score
-- Finding: late orders average 2.57 vs 4.29 for on-time orders
SELECT CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
            THEN 'Late' ELSE 'On time' END AS delivery_status,
       ROUND(AVG(r.review_score), 2) AS avg_review_score,
       COUNT(*) AS orders
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- Query 7: Payment methods
-- Finding: credit card is the largest, about 12.5 million
SELECT payment_type, COUNT(*) AS payments, ROUND(SUM(payment_value), 2) AS total
FROM payments
GROUP BY payment_type
ORDER BY total DESC;