
--given data

select *
from [Pizza Business].dbo.pizza_sales$

--Problem statements
-- KPI requirements:

--what is the total revenuse of the pizza sales?

--select sum(total_price) as total_revenue
--from [Pizza Business].dbo.pizza_sales$

-- what is the average order value?

-- select sum(total_price)/count(distinct order_id) as averagesales
 --from [Pizza Business].dbo.pizza_sales$

 --what is the sum of total pizzas sold ?
  
 -- select sum(quantity) as total_pizzas_sold
 -- from [Pizza Business].dbo.pizza_sales$
 
 -- what is the total number of orders placed ?

 --select count(distinct order_id) as total_orders
 --from [Pizza Business].dbo.pizza_sales$

 -- what is the average pizzas sold per order?
 --select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as avg_pizzas_sold
-- from [Pizza Business].dbo.pizza_sales$
 
 -- Chart Requirements
 -- daily Trend for total orders
-- select DATENAME(dw,order_date) as order_day, count(distinct order_id) as total_order
-- from [Pizza Business].dbo.pizza_sales$
-- group by DATENAME(dw,order_date) 
-- order by count(distinct order_id) desc

 -- Monthly trend of orders
 -- select datename(month,order_date) as order_month, count(distinct order_id) as total_orders
 -- from [Pizza Business].dbo.pizza_sales$
 -- group by datename(month,order_date)
 -- order by count(distinct order_id) desc

 -- percentage of total sales by pizza category
  
 -- select pizza_category, sum(total_price) as total_sales, sum(total_price)* 100/(select sum(total_price) from [Pizza Business].dbo.pizza_sales$) as PCT
 -- from [Pizza Business].dbo.pizza_sales$
 -- group by pizza_category

 -- percentage of sales by Pixxa size

 --select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales, 
 --cast(sum(total_price) *100/(select sum(total_price)  from [Pizza Business].dbo.pizza_sales$ where datepart(quarter,order_date) = 1 )as decimal(10,2)) as PCT
 --from [Pizza Business].dbo.pizza_sales$
-- where datepart(quarter,order_date) = 1 
 --group by pizza_size 
 --order by pct desc

 -- Top 5 best sellers by revenue  and total orders

 select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as total_revenue
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_revenue desc
 

 --bottom 5 sellers by total_revenue
 select top 5 pizza_name, cast(sum(total_price) as decimal (10,2)) as total_revenue
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_revenue 

 -- Top 5 best sellers by total quantity
 select top 5 pizza_name, sum(quantity) as total_quantity
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_quantity desc
 
 --bottom 5 sellers by total_qunatity

  select top 5 pizza_name, sum(quantity) as total_quantity
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_quantity 

 -- Top 5 best sellers by total_orders

 select top 5 pizza_name, count(distinct order_id) as total_orders
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_orders desc

 --bottom 5 sellers by total_orders

 select top 5 pizza_name, count(distinct order_id) as total_orders
 from [Pizza Business].dbo.pizza_sales$
 group by pizza_name
 order by total_orders 




 