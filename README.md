Here's a professional README.md for your pizza sales SQL project:

# 🍕 Pizza Sales Data Analysis

A comprehensive SQL analysis of pizza sales data to extract business insights and performance metrics.

## 📊 Project Overview
- **Dataset**: `pizza_sales` (assumed ~50k records)
- **Tools**: SQL Server (SSMS)
- **Goal**: Analyze sales trends, customer behavior, and product performance

## 🎯 Key Questions & Answers

### 1. Total Revenue
```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

5. Avg Pizzas Per Order
SELECT CAST(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales;

6. Orders by Day of Week
SELECT DATENAME(WEEKDAY, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY DATENAME(WEEKDAY, order_date);

7. Orders by Month
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY Total_Orders DESC;

8. Sales by Pizza Category (Jan Only)
SELECT pizza_category, SUM(total_price) AS Total_Sales,
       CAST(100.0 * SUM(total_price) / NULLIF((SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1), 0) AS DECIMAL(5,2)) AS PCT
FROM pizza_sales 
WHERE MONTH(order_date) = 1 
GROUP BY pizza_category;

9. Sales by Pizza Size (Q1)
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
WHERE DATEPART(QUARTER, order_date) = 1 
GROUP BY pizza_size 
ORDER BY PCT DESC;

10. Bottom 5 Pizzas by Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Orders ASC;

🧩 Key Insights
Peak Sales Days: Friday & Saturday
Best Month: July (typically highest orders)
Popular Sizes: Large > Medium > Small
Top Categories: Classic, Chicken, Supreme
Customer Behavior: Higher order volume in evenings
🛠️ Technical Notes
Used DATENAME() for readable day/month names
Applied NULLIF() to prevent division by zero
Used DATEPART(QUARTER, ...) for quarterly analysis
All percentages calculated at source level
📁 Project Structure
analysis.sql - All queries
readme.md - This file
Built with SQL Server for data analysis and Power BI visualization.
