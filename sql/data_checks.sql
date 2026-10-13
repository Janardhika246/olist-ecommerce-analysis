-- Row count validation after loading the data
USE olist_project;

SELECT 'customers' AS tbl, COUNT(*) AS rows_loaded FROM customers   -- expected 99,441
UNION ALL SELECT 'orders', COUNT(*) FROM orders                     -- expected 99,441
UNION ALL SELECT 'products', COUNT(*) FROM products                 -- expected 32,951
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items           -- expected 112,650
UNION ALL SELECT 'payments', COUNT(*) FROM payments                 -- expected 103,886
UNION ALL SELECT 'reviews', COUNT(*) FROM reviews;                  -- expected about 99,223