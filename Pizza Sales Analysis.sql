select * from pizza_sales
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales
select sum(quantity) as Total_Pizza_Sold from pizza_sales
select count(distinct order_id) as total_orders from pizza_sales
select Cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as Decimal(10,2)) as Avg_Pizza_Per_Order from pizza_sales
select datename(dw, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
Group by datename(dw, order_date)
select datename(month,order_date) as Month_Name, count(distinct order_id) as Total_orders from pizza_sales
Group by datename(month,order_date)
order by total_orders desc
select datename(year,order_date) as Year_name, count(distinct order_id) as Total_orders from pizza_sales
Group by datename(year,order_date)
order by total_orders desc
SELECT pizza_category,
  SUM(total_price) AS Total_Sales,
  CAST(100.0 * SUM(total_price) / NULLIF((SELECT SUM(total_price) FROM dbo.pizza_sales WHERE MONTH(order_date) = 1), 0) AS DECIMAL(5,2)) AS PCT
FROM dbo.pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)
* 100 / (select sum(total_price) from pizza_sales WHERE datepart(quarter, order_DATE)=1) as decimal
(10,2)) as PCT from pizza_sales WHERE datepart(quarter, order_DATE)=1 Group by Pizza_size
order by PCT desc
SELECT top 5 pizza_name, count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders asc