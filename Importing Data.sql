select * from df_orders;
DESCRIBE df_orders;

CREATE TABLE df_orders (
    order_id VARCHAR(25) NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    ship_mode ENUM('Standard Class', 'Second Class', 'First Class', 'Same Day'),
    segment ENUM('Consumer', 'Corporate', 'Home Office'),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region ENUM('South', 'Central', 'West', 'East', 'North'),
    category ENUM('Furniture', 'Office Supplies', 'Technology'),
    sub_category VARCHAR(50),
    product_id VARCHAR(25) NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,
    discount DECIMAL(3, 2),
    sale_price DECIMAL(10, 2) NOT NULL,
    profit DECIMAL(10, 2) NOT NULL,

    -- Add indexes for faster queries
    INDEX idx_product_id (product_id),
    INDEX idx_order_date (order_date)
);

-- ALTER TABLE df_orders
-- MODIFY COLUMN discount DECIMAL(10, 2);




