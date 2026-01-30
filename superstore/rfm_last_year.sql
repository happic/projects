CREATE VIEW rfm_last_year AS
	SELECT
	    customer_id,
	    MAX(order_date) as last_purchase,
	    COUNT(DISTINCT order_id) as frequency,
	    SUM(sales) as monetary,
	    NTILE(3) OVER (ORDER BY MAX(order_date) DESC) as recency_score,
	    NTILE(3) OVER (ORDER BY COUNT(DISTINCT order_id) DESC) as frequency_score,
	    NTILE(3) OVER (ORDER BY SUM(sales) DESC) as monetary_score
	FROM superstore
	WHERE order_date >= (
	    SELECT DATE_TRUNC('month', MAX(order_date)) - INTERVAL '365 days'
	    FROM superstore
	)
	GROUP BY customer_id
	ORDER BY recency_score, frequency_score, monetary_score