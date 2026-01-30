CREATE VIEW category_analysis AS
	SELECT
	    category,
	    sub_category,
	    COUNT(*) as items_sold,
	    SUM(sales) as revenue,
	    SUM(profit) as profit,
	    round(AVG(discount) * 100, 2) as avg_discount_pct,
	    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 1) as profit_ratio,
		ROUND(SUM(profit) / SUM(SUM(profit)) OVER(PARTITION BY category) * 100, 1) as share_in_category
	FROM superstore
	GROUP BY category, sub_category
	ORDER BY category, profit DESC