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
group by dayname(order_date);


-- C. Monthly Trend for Orders
select monthname(order_date) as order_days,  
       count(distinct(order_id)) as total_orders  
from pizza.pizza_sales  
group by monthname(order_date);

-- D. % of Sales by Pizza Category








