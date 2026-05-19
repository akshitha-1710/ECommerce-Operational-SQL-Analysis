# E-Commerce Data Analytics Case Study: Operations & Revenue Optimization

## Project Overview
This project focuses on the backend relational database optimization for a growing e-commerce platform. Moving away from manual flat-file calculation spreadsheets, this analysis engineers structured, high-performance database queries to aggregate revenue streams, evaluate product category margins, isolate VIP shoppers, and partition leaderboard ranks.

## The STAR Framework Case Study

# 1. Situation
Operational leadership requires granular visibility into customer transactions and product inventory performance to drive targeted marketing campaigns and inventory restocks. Raw transaction logs are scattered across separate transactional tables (`orders`, `products`, `customers`), requiring dynamic relational mapping.

# 2. Task
* Establish a foundational schema modeling multi-table infrastructure dependencies.
* Filter and discard data pipeline noise (such as canceled or pending transactions).
* Calculate multi-layered business metrics including total revenue streams and category profit margins.
* Deploy advanced nested subqueries and partitioning window indices to benchmark specific catalog stock against standard global performance metrics.

# 3. Action (SQL Technical Application)
The analytical scripts deploy an advanced MySQL toolset:
   Relational Mapping: Integrated multi-table dependencies via `INNER JOIN` operations matching primary keys (`customer_id`, `product_id`).
   Conditional Logic & Aggregation: Combined string formatting (`CONCAT`) with categorical collapse filters (`GROUP BY`, `HAVING`) to segment distinct target parameters.
   Complex Data Architecture: Engineered Common Table Expressions (`WITH ... AS`) and independent scalar subqueries to construct fluid, dynamic performance baselines.
   Window Functions: Deployed advanced analytical partitions (`DENSE_RANK() OVER (PARTITION BY...)`) to isolate segmented categorical leadership positions without altering the core underlying grain of the dataset.

### 4. Results & Business Insights
   The Revenue Driver: The Electronics sector represents the company's highest financial engine, yielding $295.00 in net profit over 4 orders, outperforming both Furniture ($280.00 profit) and Accessories ($150.00 profit).
   Catalog Leadership: Within the high-volume Electronics space, window ranking proves the Smart Watch commands the #1 market position ($300.00 revenue), while Wireless Headphones secure the #2 position ($240.00 revenue).
   The Pareto Principle (VIPs): Cross-table loyalty analysis isolated Ananya Sharma ($420.00 total spend) and John Smith ($410.00 total spend) as the core tier of high-value consumers scaling beyond the $300 critical threshold for tailored retention initiatives.


## Technical Script Checklist

* Multi-Table Relational Join Queries
* Core Executive Financial Metrics Aggregation
* Customer VIP Segmentation Logic (`HAVING` Analysis)
* Baseline Benchmarking CTE & Nested Subquery Script
* Categorical Window Function Leaderboard Script
