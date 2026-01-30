create view kpi_per_year as
	SELECT
	    DATE_TRUNC('month', order_date) as month,
	    COUNT(DISTINCT order_id) as orders,
	    SUM(sales) as revenue,
	    SUM(profit) as profit,
	    round (SUM(profit) / SUM(sales) * 100, 1) as profit_ratio,
		LAG(SUM(profit), 1, 0) OVER (ORDER BY DATE_TRUNC('month', order_date)) as profit_previous_month,
		SUM(profit) - 
	    LAG(SUM(profit), 1, 0) OVER (ORDER BY DATE_TRUNC('month', order_date)) as profit_change
	FROM superstore
	WHERE order_date >= (
	    SELECT DATE_TRUNC('month', MAX(order_date)) - INTERVAL '11 months' 
	    FROM superstore
	)
	GROUP BY month
	ORDER BY month