CREATE TABLE Pizza_dataa(
pizza_id INT,
order_id INT,
pizza_name_id VARCHAR(90),
quantity INT,
order_date DATE,
order_time TIME,
unit_price NUMERIC(10,2),
total_price NUMERIC(10,2),
pizza_size VARCHAR(900),
pizza_category VARCHAR(600),
pizza_ingredients VARCHAR(100),
pizza_name VARCHAR(90)
)

select * from Pizza_dataa

-- Q 1) Find Out Total Revenue

        SELECT SUM(total_price) AS Total_Revenue FROM Pizza_dataa;

-- Q 2) Find Average Order Per Value

         SELECT  SUM(total_price)/COUNT(DISTINCT order_id) AS Average_order FROM Pizza_dataa;

-- Q 3) Find Out Total Pizza Sold

        SELECT SUM(quantity) AS total_sold FROM Pizza_dataa;

-- Q 4) Find Out Total Orders Place 

		SELECT COUNT(DISTINCT order_id) as Total_orders FROM pizza_dataa;

-- Q 5) Find Average Pizzas Sold  Per Order

        SELECT (SUM(quantity)::DECIMAL(10,2)/COUNT(DISTINCT order_id)::DECIMAL(10,2)) :: DECIMAL(10,2) AS average_pizzas_sold 
		FROM pizza_dataa;


-- Q 5) Write a Query to Find daily Trend for total_orders :

        SELECT TO_CHAR(order_date,'Day') AS Day,COUNT(DISTINCT order_id) AS tota_order FROM pizza_dataa
		GROUP BY Day;

-- Q 6)  Write a Query to Find Hourly Trend for total_orders :

		 SELECT EXTRACT(HOUR FROM order_time ) AS hour,COUNT( DISTINCT order_id ) AS total_orders FROM pizza_dataa
		 GROUP BY hour
		 ORDER BY hour;

-- Q 7) Write a query percentage of total sales by pizza category

        SELECT pizza_category,SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_dataa) AS total_sales_percentage
		FROM pizza_dataa
		GROUP BY pizza_category;

-- Q 8) Write a query percentage of total sales by pizza size

        SELECT pizza_size,SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_dataa ) AS total_pct
		FROM pizza_dataa
		GROUP BY pizza_size;

-- Q 9) Write a query percentage of total sales by pizza category In Feb Month

        SELECT pizza_size,SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_dataa ) AS total_pct
		FROM pizza_dataa
		WHERE EXTRACT(MONTH FROM order_date)=1
		GROUP BY pizza_size;


-- Q 10) Write a query to total pizza sold by category

		 SELECT pizza_category,SUM(quantity) AS total_sold
		 FROM pizza_dataa
		 GROUP BY 1

-- Q 11) Write a query to top 5 best pizza seller by total pizza sold

         SELECT pizza_name_id,SUM(quantity) AS total_sold
		 FROM pizza_dataa
		 GROUP BY 1
		 ORDER BY total_sold DESC
		 LIMIT 5


--	Q 12) Write a query to top 5 best pizza seller by total pizza sold
		
         SELECT pizza_name_id,SUM(quantity) AS total_sold
		 FROM pizza_dataa
		 GROUP BY 1
		 ORDER BY total_sold ASC
		 LIMIT 5

        
--Q 13) Write a query to top 5 best pizza seller by total pizza sold In "NOVEMBER" Month

         SELECT pizza_name_id,SUM(quantity) AS total_sold
		 FROM pizza_dataa
		 WHERE EXTRACT(MONTH FROM order_date)= 11
		 GROUP BY pizza_name_id
		 ORDER BY total_sold ASC
		 LIMIT 5


-- Q 14) Write a query to find total order by hourly

         SELECT EXTRACT(HOUR FROM order_time),COUNT( DISTINCT order_id) AS total_order
		 FROM pizza_dataa
		 GROUP BY 1
		 ORDER BY 2 DESC


