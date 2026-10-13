2026-10-12
Set up my tools and GitHub repository.


## error correction
The import wizard silently skipped rows with blank values. I found it by comparing row counts to the expected totals, then reloaded orders, products and reviews with LOAD DATA and converted blanks to NULL.

## Query 1: Total orders and revenue
The result shows 98,666 orders and about 13.59 million in revenue,
which shows the overall size of the business in this dataset.
Average revenue per order is about 137.76.

## Query 2: Monthly revenue
Revenue grew from about 120k in January 2017 to a peak of 1.01 million
in November 2017, then stayed near 850k to 1 million per month in 2018,
so the business grew quickly and then levelled off. The first and last
months have very little data and should be ignored.

## Query 3: Top categories
Health and beauty earned the most revenue (about 1.26 million), followed
by watches and gifts and bed, bath and table, so these categories matter
most for stock planning.

## Query 4: Cancellation rate
The result shows 0.63% of orders were cancelled, which is low,
so cancellations are not a major problem for this business.

## Query 5: Delivery time
Orders took an average of 12.5 days to arrive. Combined with Query 6,
this suggests the delivery estimates need to be more realistic, since
late orders score much lower.

## Query 7: Payment methods
Credit card was the most used method, with about 12.5 million in value,
far more than boleto at 2.9 million, so credit card payments must work
smoothly at checkout.

## Query 6: Late deliveries vs review score
Late orders scored 2.57 on average compared with 4.29 for on-time orders,
a gap of 1.72 points, so late delivery strongly hurts customer satisfaction.

