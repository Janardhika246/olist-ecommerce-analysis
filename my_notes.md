2026-10-12
Set up my tools and GitHub repository.

The import wizard silently skipped rows with blank values. I found it by comparing row counts to the expected totals, then reloaded orders, products and reviews with LOAD DATA and converted blanks to NULL.

