# End-to-End Retail Sales Analysis with Python and MySQL

## Project Overview

This project performs a comprehensive analysis of a retail orders dataset. The entire pipeline—from data extraction to final analysis—is covered. The process involves fetching the dataset from Kaggle using its API, performing data cleaning and transformation with Python (Pandas), loading the clean data into a MySQL database, and finally, answering key business questions by writing complex SQL queries.

This project is an adaptation of a tutorial by Ankit Bansal, with the key difference being the use of **MySQL** as the database backend instead of SQL Server.

---

## Key Business Questions Answered

This analysis provides insights into several critical business questions:

1.  **Top 10 Highest Revenue Products:** Identified the products generating the most revenue.
2.  **Top 5 Selling Products per Region:** Determined the best-selling products within each geographical region.
3.  **Month-over-Month Sales Growth:** Compared sales performance between 2022 and 2023 for each month.
4.  **Highest Sales Month per Category:** Found the single month with the highest sales for each product category.
5.  **Sub-Category with Highest Profit Growth:** Identified which sub-category saw the highest percentage growth in profit from 2022 to 2023.

---

## Tools & Technologies

* **Data Source:** Kaggle API
* **Data Cleaning & Transformation:** Python, Pandas, Jupyter Notebook
* **Database:** MySQL
* **Python-to-SQL Connection:** SQLAlchemy, PyMySQL

---

## Project Pipeline

1.  **Data Extraction:** The retail orders dataset was downloaded directly from Kaggle into the project environment using the official Kaggle API.
2.  **Data Cleaning (Pandas):**
    * Handled inconsistent null values (e.g., 'Not Available', 'Unknown').
    * Standardized all column names to a consistent `snake_case` format.
    * Derived new, insightful columns such as `discount_value`, `sale_price`, and `profit`.
    * Converted the `order_date` column to the correct datetime format.
3.  **Database Loading (Python & MySQL):**
    * Established a connection to a local MySQL server using SQLAlchemy.
    * Created an optimized table schema in MySQL with appropriate data types (`ENUM`, `DECIMAL`, `DATE`, etc.) to ensure data integrity and efficient storage.
    * Loaded the cleaned Pandas DataFrame into the MySQL table.
4.  **Data Analysis (SQL):**
    * Executed complex SQL queries, including CTEs (Common Table Expressions) and Window Functions (`ROW_NUMBER()`), to answer the key business questions.

---

## How to Run This Project

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/sidsingh70083/Retail_Analysis_python_sql.git
    ```
2.  **Set up the environment:**
    * It is recommended to use a virtual environment.
    ```bash
    python -m venv venv
    .\venv\Scripts\activate
    ```
3.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
4.  **Set up Kaggle API:**
    * Download your `kaggle.json` API token from your Kaggle account page.
    * Place it in the correct directory (e.g., `C:\Users\<Your-Username>\.kaggle\`).
5.  **Configure Database Connection:**
    * Update the database connection string in the Jupyter Notebook to point to your local MySQL instance.
6.  **Run the Notebook:**
    * Launch the Jupyter Notebook (`retail_sales_analysis.ipynb`) and execute the cells.
