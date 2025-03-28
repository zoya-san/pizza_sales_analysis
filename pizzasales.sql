select *  from pizza.pizza_sales;
-- A. KPI’s
-- 1. Total Revenue:
select sum(total_price) as Total_Revenue from pizza.pizza_sales;

-- 2. Average Order Value:
select sum(total_price)/count(distinct(order_id)) as average_order_value 
from pizza.pizza_sales;

-- 3. Total Pizzas Sold:
select sum(quantity) as total_pizzas_sold 
from pizza.pizza_sales;

-- 4. Total Orders:
select count(distinct(order_id)) as total_orders 
from pizza.pizza_sales;

-- 5. Average Pizzas Per Order:
select cast(sum(quantity)/count(distinct(order_id)) as decimal (10,2)) as average_pizzas_per_order 
from pizza.pizza_sales;

-- B. Daily Trend for Total Orders
select dayname(order_date) as order_days,  
       count(distinct(order_id)) as total_orders  
from pizza.pizza_sales  
group by dayname(order_date)
order by order_days desc;


-- C. Monthly Trend for Orders
select monthname(order_date) as order_months,  
       count(distinct(order_id)) as total_orders  
from pizza.pizza_sales  
group by monthname(order_date)
order by total_orders desc;

-- D. % of Sales by Pizza Category
-- select pizza_category, (count(distinct(pizza_name_id))/count(distinct(order_id)) *100)

select pizza_category, sum(total_price) * 100 / (select sum(total_price) as PCT from pizza.pizza_sales )
from pizza.pizza_sales  
group by pizza_category
order by pizza_category;

-- E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size


-- F Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as total_quantity_sold  
from pizza_sales  
where month(order_date) = 2  
group by pizza_category  
order by total_quantity_sold desc;


-- G Top 5 Pizzas by Revenue
select pizza_name, sum(total_price) AS Total_Revenue
from pizza_sales
group by pizza_name
order by sum(total_price) desc
limit 5;

-- H Bottom 5 Pizzas by Revenue
select pizza_name, sum(total_price) as total_revenue  
from pizza_sales  
group by pizza_name  
order by total_revenue asc  
limit 5;

-- I. Top 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_pizza_sold  
from pizza_sales  
group by pizza_name  
order by total_pizza_sold desc  
limit 5;

-- J. Bottom 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_pizza_sold  
from pizza_sales  
group by pizza_name  
order by total_pizza_sold asc  
limit 5;


-- K. Top 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as total_orders  
from pizza_sales  
group by pizza_name  
order by total_orders desc  
limit 5;

