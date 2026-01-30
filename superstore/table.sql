DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    order_date TEXT NOT NULL,
    ship_date TEXT NOT NULL,
    ship_mode VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    segment VARCHAR(20) NOT NULL,
    country VARCHAR(30) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10),
    region VARCHAR(10) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    category VARCHAR(20) NOT NULL,
    sub_category VARCHAR(20) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    sales DECIMAL(10,2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount DECIMAL(5,2) NOT NULL,
    profit DECIMAL(10,2)
	)