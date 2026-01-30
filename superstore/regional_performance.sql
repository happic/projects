CREATE VIEW regional_performance AS
	SELECT
	    region,
	    state,
	    COUNT(DISTINCT customer_id) as unique_customers,
	    COUNT(DISTINCT order_id) as total_orders,
	    SUM(sales) as revenue,
	    SUM(profit) as profit,
	    ROUND(SUM(profit) * 100 / NULLIF(SUM(sales), 0), 1) as profit_ratio
	FROM superstore
	GROUP BY region, state
	ORDER BY region, profit DESC