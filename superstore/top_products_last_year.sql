CREATE VIEW top_products_last_year AS
	SELECT
	    product_name,
	    category,
	    sub_category,
	    SUM(quantity) as units_sold,
	    SUM(sales) as revenue,
	    SUM(profit) as profit,
	    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 1) as profit_ratio,
	    DENSE_RANK() OVER (ORDER BY SUM(profit) DESC) as profit_rank
	FROM superstore
	WHERE order_date >= (
	    SELECT MAX(order_date) - INTERVAL '365 days'
	    FROM superstore
	)
	GROUP BY product_name, category, sub_category
	ORDER BY profit DESC
	LIMIT 15