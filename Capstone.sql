DROP TABLE IF EXISTS sales;

CREATE TABLE sales(Segment VARCHAR(50),
				Country VARCHAR(50),
				Product VARCHAR(50),
				Discount_Band VARCHAR(20),
				Units_Sold NUMERIC(10,2),
				Manufacturing_Price NUMERIC(10,2),
				Sale_Price NUMERIC(10,2),
				Gross_Sales NUMERIC(10,2),
				Discounts NUMERIC(10,2),
				Sales NUMERIC(10,2),
				COGS NUMERIC(10,2),
				Profit NUMERIC(10,2),
				Date DATE,
				Month_Number INT,
				Month_Name VARCHAR(15),
				Year INT
				)

SELECT * FROM sales;

ALTER TABLE sales
DROP COLUMN month_number;

--Total records are in the dataset

SELECT COUNT(*)
	FROM sales;

--Distinct Products, Countries, Segments, and Discount Bands

SELECT DISTINCT(segment)
		FROM sales;

SELECT DISTINCT(country)
		FROM sales;
		
SELECT DISTINCT(product)
		FROM sales;
		
SELECT DISTINCT(discount_band)
		FROM sales;

--Date range of the dataset

SELECT MIN(date) AS earliest_date,
    	MAX(date) AS latest_date
FROM sales;

--Total Gross Sales, Discounts, Sales, COGS, and Profit

SELECT SUM(gross_sales) AS total_gross_sales,
		SUM(discounts) AS total_discounts,
		SUM(sales) AS total_sales,
		SUM(cogs) AS total_cogs,
		SUM(profit) AS total_profit
FROM sales;

--Total number of Units Sold

SELECT SUM(units_sold) AS total_unit_sold
FROM sales;

--Average Sales, COGS, and Profit per record

SELECT AVG(sales) AS average_sales,
		AVG(cogs) AS average_cogs,
		AVG(profit) AS average_profit
FROM sales;

--Which product generates the highest total Sales?

SELECT product, SUM(sales) AS total_sales
	FROM sales
	GROUP BY product
	ORDER BY total_sales DESC
LIMIT 1;

--Which product generates the highest total Profit?

SELECT product, SUM(profit) AS total_profit
	FROM sales
	GROUP BY product
	ORDER BY total_profit DESC
LIMIT 1;

--Which products have the highest and lowest Units Sold?

SELECT product, SUM(units_sold) AS highest_unit_solds
	FROM sales
	GROUP BY product
	ORDER BY highest_unit_solds DESC
LIMIT 1;

SELECT product, SUM(units_sold) AS lowest_unit_solds
	FROM sales
	GROUP BY product
	ORDER BY lowest_unit_solds
LIMIT 1;

--What is the total Sales, Profit, and Profit Margin for each product?

SELECT product, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit,
		ROUND((SUM(profit)/SUM(sales))*100 , 2) AS profit_margin
	FROM sales
	GROUP BY product;

--Which products have negative or zero Profit?

SELECT product,	SUM(profit) AS total_profit
	FROM sales
	GROUP BY product
	HAVING SUM(profit) <= 0;

--Which products generate high Sales but relatively low Profit?

WITH product_analysis AS(
						SELECT product, SUM(sales) AS total_sales,
						SUM(profit) AS total_profit,
						ROUND((SUM(profit)/SUM(sales))*100 , 2) AS profit_margin
					FROM sales
					GROUP BY product)
			SELECT * 
			FROM product_analysis
			WHERE profit_margin < (SELECT AVG(profit_margin)
									FROM product_analysis)
ORDER BY total_sales DESC;

--Which products contribute the highest percentage of total Sales?

WITH product_contribution 
AS ( SELECT product, SUM(sales) AS total_sales
	FROM sales
	GROUP BY product )
SELECT * , ROUND(((total_sales)/SUM(total_sales) OVER())* 100, 2) AS sales_contribution
	FROM product_contribution
ORDER BY sales_contribution DESC
LIMIT 1;

--Which country generates the highest Sales and Profit?

--Country that generates Highest Proft
SELECT country , SUM(sales) AS total_sales,
		SUM(profit) AS total_profits
	FROM sales
	GROUP BY country
	ORDER BY total_profits DESC
LIMIT 1;

--Country that generate Highest Sales
SELECT country , SUM(sales) AS total_sales,
		SUM(profit) AS total_profits
	FROM sales
	GROUP BY country
	ORDER BY total_sales DESC
LIMIT 1;

--Which country has the highest Profit Margin?

SELECT country, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit,
		ROUND((SUM(profit)/SUM(sales)* 100), 2) AS profit_margin
	FROM sales
	GROUP BY country
	ORDER BY profit_margin DESC
LIMIT 1;
--Which segment generates the highest Sales and Profit?

SELECT segment, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit
		FROM sales
	GROUP BY segment
	ORDER BY total_sales DESC
LIMIT 1;

--What percentage of total Sales is contributed by each segment?

WITH segment_contribution
AS ( SELECT segment, SUM(sales) AS total_sales
	FROM sales
	GROUP BY segment
	)
SELECT * , ROUND((total_sales/SUM(total_sales) OVER () ) * 100, 2) AS contribution
	FROM segment_contribution
	ORDER BY contribution DESC;
	
--Which country–segment combination generates the highest Profit?

SELECT segment, country, SUM(profit) AS total_profit
	FROM sales
	GROUP BY segment, country
	ORDER BY total_profit DESC
LIMIT 1;

--How do Sales, Units Sold, and Profit differ across Discount Bands?

SELECT discount_band, 
		SUM(sales) AS total_sales,
		SUM(units_sold) AS total_unit_sold,
		SUM(profit) AS total_profit
FROM sales
GROUP BY discount_band;

--Which Discount Band generates the highest total Sales?

SELECT discount_band, SUM(sales) AS total_sales
	FROM sales
	GROUP BY discount_band
	ORDER BY total_sales DESC
LIMIT 1;

--Which Discount Band generates the highest total Profit?

SELECT discount_band, SUM(sales) AS total_sales,
	SUM(profit) AS total_profit
	FROM sales
	GROUP BY discount_band
	ORDER BY total_profit DESC
LIMIT 1;

--Does a higher Discount Band lead to higher Sales but lower Profit Margin?

SELECT discount_band, SUM(sales) AS total_sales,
		ROUND((SUM(profit)/SUM(sales))*100, 2)
		FROM sales
		GROUP BY discount_band;
		
--What are the total Sales and Profit for each year?

SELECT year, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit
	FROM sales
GROUP BY year;

--Which month generates the highest Sales and Profit?
--Highest Sale
SELECT month_name, year, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit
	FROM sales
	GROUP BY month_name, year
	ORDER BY total_sales DESC;

--Highest Profit 
SELECT month_name, year, SUM(sales) AS total_sales,
		SUM(profit) AS total_profit
	FROM sales
	GROUP BY month_name, year
	ORDER BY total_profit DESC;
	
--Rank products by total Sales using a window function.

SELECT product, SUM(sales) AS total_sales,
		DENSE_RANK() OVER(ORDER BY SUM(sales) DESC) AS ranking
		FROM sales
		GROUP BY product;
	
--Find the Top 3 products by Sales in each year.

WITH ranks AS (
	SELECT year, product, SUM(sales) AS total_sales,
	DENSE_RANK() OVER(PARTITION by year ORDER BY SUM(sales) DESC) AS ranking
		FROM sales
		GROUP BY product, year)
SELECT * 
	 FROM ranks
	 WHERE ranking BETWEEN 1 AND 3;
		
--Calculate each product's percentage contribution to total Sales.

WITH product_contribution AS (
	SELECT product, SUM(sales) AS total_sale
	FROM sales
	GROUP BY product)
SELECT * , ROUND(((total_sale/SUM(total_sale) OVER())* 100), 2) AS contribution
	FROM product_contribution;
	
