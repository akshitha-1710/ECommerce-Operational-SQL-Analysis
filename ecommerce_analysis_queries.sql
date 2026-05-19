-- Query 1 Operational Filtering & Sorting (Shipped Orders by Quantity)

SELECT order_id, order_date, quantity, status
FROM orders
WHERE status = 'Shipped'
ORDER BY quantity DESC;


-- Query 2 Multi-Table Relational Join (Individual Order Revenue Analysis)

SELECT 
    o.order_id,
    p.product_name,
    o.quantity,
    (p.price * o.quantity) AS total_revenue
FROM orders o
INNER JOIN products p 
    ON o.product_id = p.product_id
WHERE o.status = 'Shipped'
ORDER BY total_revenue DESC;


-- Query 3 Executive Categorical Aggregation (Revenue & Net Profit Margins)

SELECT 
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(p.price * o.quantity) AS total_revenue,
    SUM((p.price - p.cost_price) * o.quantity) AS total_profit
FROM orders o
INNER JOIN products p 
    ON o.product_id = p.product_id
WHERE o.status = 'Shipped'
GROUP BY p.category
ORDER BY total_profit DESC;


-- Query 4 Customer Segmentation Logic (Isolating High-Value Loyalty Tiers via HAVING)

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.price * o.quantity) AS total_spent
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Shipped'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_spent >= 300.00
ORDER BY total_spent DESC;


-- Query 5 Complex Benchmarking Architecture (Using CTEs & Subqueries for Performance Baselines)

WITH ProductRevenue AS (
    SELECT 
        p.product_name,
        SUM(p.price * o.quantity) AS total_revenue
    FROM orders o
    INNER JOIN products p ON o.product_id = p.product_id
    WHERE o.status = 'Shipped'
    GROUP BY p.product_name
)
SELECT 
    product_name,
    total_revenue,
    (SELECT AVG(total_revenue) FROM ProductRevenue) AS benchmark_average_revenue
FROM ProductRevenue
ORDER BY total_revenue DESC;


-- Query 6 Advanced Window Analytics (Partitioned Leaderboards via DENSE_RANK)

SELECT 
    p.category,
    p.product_name,
    SUM(p.price * o.quantity) AS product_revenue,
    DENSE_RANK() OVER(
        PARTITION BY p.category 
        ORDER BY SUM(p.price * o.quantity) DESC
    ) AS product_rank_in_category
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Shipped'
GROUP BY p.category, p.product_name
ORDER BY p.category, product_rank_in_category;

