select *  from pizza.pizza_sales;

-- 1. Total Revenue:
select sum(total_price) as Total_Revenue from pizza.pizza_sales;

-- 2. Average Order Value:
select sum(total_price)/count(distinct(order_id)) as average_order_value from pizza.pizza_sales;

-- 3. Total Pizzas Sold
select sum(quantity) as total_pizzas_sold from pizza.pizza_sales;

-- 4. Total Orders
select count(distinct(order_id)) as total_orders from pizza.pizza_sales;






