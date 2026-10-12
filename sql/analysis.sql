USE olist_project;

SELECT COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(price), 2) AS total_revenue
FROM order_items;