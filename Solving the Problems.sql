SELECT * FROM df_orders;

-- find top 10 highest reveue generating products 

SELECT 
	product_id,
    SUM(sale_price) as sales 
FROM 
	df_orders
GROUP BY
	product_id
ORDER BY
	sales DESC
LIMIT 10;



-- find top 5 highest selling products in each region

WITH CteSales AS (
    SELECT 
        region, 
        product_id, 
        SUM(sale_price) AS sales
    FROM
        df_orders
    GROUP BY 
        region, product_id
)
SELECT 
    region,
    product_id,
    sales,
    rn AS sales_rank
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY region ORDER BY sales DESC) AS rn
    FROM 
        CteSales
) AS RankedSales
WHERE 
    rn <= 5;



-- find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023

WITH cte AS (
SELECT YEAR(order_date) AS order_year,MONTH(order_date) AS order_month,
sum(sale_price) AS sales
FROM df_orders
GROUP BY YEAR(order_date),MONTH(order_date)
)
SELECT order_month, 
SUM(CASE WHEN order_year=2022 THEN sales ELSE 0 END) AS sales_2022,
SUM(CASE WHEN order_year=2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte 
GROUP BY order_month
ORDER BY order_month;



-- for each category which month had highest sales 

WITH MonthlySales AS (
    -- Calculate the total sales for each month and category
    SELECT
        category,
        DATE_FORMAT(order_date, '%Y-%m') AS sale_month,
        SUM(sale_price) AS total_sales
    FROM
        df_orders
    GROUP BY
        category,
        sale_month
),
RankedSales AS (
    -- Rank the months within each category based on sales
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_sales DESC) AS sales_rank
    FROM
        MonthlySales
)
-- Select only the top-ranked month for each category
SELECT
    category,
    sale_month,
    total_sales
FROM
    RankedSales
WHERE
    sales_rank = 1;



-- which sub category had highest growth by profit in 2023 compare to 2022

SELECT
    sub_category,
    -- Calculate sales for 2022
    SUM(CASE WHEN YEAR(order_date) = 2022 THEN sale_price ELSE 0 END) AS sales_2022,
    
    -- Calculate sales for 2023
    SUM(CASE WHEN YEAR(order_date) = 2023 THEN sale_price ELSE 0 END) AS sales_2023,
    
    -- Calculate the growth percentage
    (
        (SUM(CASE WHEN YEAR(order_date) = 2023 THEN sale_price ELSE 0 END) - 
         SUM(CASE WHEN YEAR(order_date) = 2022 THEN sale_price ELSE 0 END)) 
         * 100 / 
         SUM(CASE WHEN YEAR(order_date) = 2022 THEN sale_price ELSE 0 END)
    ) AS growth_percentage
FROM
    df_orders
GROUP BY
    sub_category
ORDER BY
    growth_percentage DESC
LIMIT 1;
