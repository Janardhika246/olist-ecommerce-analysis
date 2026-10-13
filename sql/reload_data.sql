-- Reload orders, products and reviews with LOAD DATA
-- Reason: the Table Data Import Wizard skipped rows with blank values.
-- Blank values are converted to NULL.
-- Replace YOUR_PATH with the folder containing the Olist CSV files.
-- Warning: TRUNCATE deletes all rows in the table before reloading.

USE olist_project;

-- 1. Orders (expected 99,441 rows)
TRUNCATE TABLE orders;
LOAD DATA LOCAL INFILE 'YOUR_PATH/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, order_purchase_timestamp,
 @approved, @carrier, @delivered, order_estimated_delivery_date)
SET order_approved_at = NULLIF(TRIM(@approved), ''),
    order_delivered_carrier_date = NULLIF(TRIM(@carrier), ''),
    order_delivered_customer_date = NULLIF(TRIM(@delivered), '');

-- 2. Products (expected 32,951 rows)
TRUNCATE TABLE products;
LOAD DATA LOCAL INFILE 'YOUR_PATH/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, @cat, @nl, @dl, @pq, @w, @l, @h, @wd)
SET product_category_name = NULLIF(TRIM(@cat), ''),
    product_name_lenght = NULLIF(TRIM(@nl), ''),
    product_description_lenght = NULLIF(TRIM(@dl), ''),
    product_photos_qty = NULLIF(TRIM(@pq), ''),
    product_weight_g = NULLIF(TRIM(@w), ''),
    product_length_cm = NULLIF(TRIM(@l), ''),
    product_height_cm = NULLIF(TRIM(@h), ''),
    product_width_cm = NULLIF(TRIM(@wd), '');

-- 3. Reviews (about 99,223 rows)
TRUNCATE TABLE reviews;
LOAD DATA LOCAL INFILE 'YOUR_PATH/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id, order_id, review_score, @title, @message, @created, @answered)
SET review_comment_title = NULLIF(@title, ''),
    review_comment_message = NULLIF(@message, ''),
    review_creation_date = NULLIF(TRIM(@created), ''),
    review_answer_timestamp = NULLIF(TRIM(@answered), '');