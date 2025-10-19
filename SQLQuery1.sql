select * from [dbo].[pizza_sales_excel_file];


select distinct(count('[pizza_id]')) from [dbo].[pizza_sales_excel_file];

select distinct(count([order_id])) as total_order from [dbo].[pizza_sales_excel_file];

-- total revenue--
select round(sum([total_price]),2) as total_revenue from [dbo].[pizza_sales_excel_file];

-- average amt spend on per order--

select sum([total_price]) / count(distinct([order_id])) as avg_amt from [dbo].[pizza_sales_excel_file];


-- total pizza sold--
select sum([quantity]) as total_pizza_sold from [dbo].[pizza_sales_excel_file];


-- total order place --
select count(distinct([order_id])) as total_order from [dbo].[pizza_sales_excel_file];


-- average pizza sold in one order
select sum([quantity]) / count(distinct([order_id])) as avg_no_pizza from [dbo].[pizza_sales_excel_file];


-- daily no of order

select DATENAME(DW, [order_date]) as count_order ,Count(distinct([order_id])) as order_count
from [dbo].[pizza_sales_excel_file]
Group by DATENAME(DW, [order_date]);

--monthwise order--
select DATENAME(MONTH,[order_date]) as count_order ,Count(distinct([order_id])) as order_count
from [dbo].[pizza_sales_excel_file]
Group by DATENAME(MONTH,[order_date]);


-- PERCENTAGE SALES ACC TO PIZZA CATEOGRY

select [pizza_category],sum([total_price]) * 100 / (Select sum([total_price]) from [dbo].[pizza_sales_excel_file])
from [dbo].[pizza_sales_excel_file] 
group by [pizza_category]
order by sum([total_price]) desc;


-- PERCENTAGE SALES ACC TO PIZZA SIZE

select [pizza_size],sum([total_price]) * 100 / (Select sum([total_price]) from [dbo].[pizza_sales_excel_file])
from [dbo].[pizza_sales_excel_file] 
group by [pizza_size]
order by sum([total_price]) desc;


-- top 5 best selling pizza 

select top 5 sum([quantity]) as qty_sold,sum([total_price]) as total_sale,[pizza_name] 
from [dbo].[pizza_sales_excel_file]
group by [pizza_name]
order by sum([total_price]) desc;


-- bottom 5 pizza --
select top 5 sum([quantity]) as qty_sold,sum([total_price]) as total_sale,[pizza_name] 
from [dbo].[pizza_sales_excel_file]
group by [pizza_name]
order by sum([total_price]) asc;

-- top 5 sellers acc to revenue,total qty,total orders
select top 5 [pizza_name],sum([total_price]) as total_revenue
from [dbo].[pizza_sales_excel_file] 
group by [pizza_name]
order by sum([total_price]) desc;

-- top 5 acc to total order 
select top 5 [pizza_name],sum([order_id]) as total_order
from [dbo].[pizza_sales_excel_file] 
group by [pizza_name]
order by sum([order_id]) desc;


-- top 5 product on quantity basis -- 

select top 5 [pizza_name],sum([quantity]) as total_quantity
from [dbo].[pizza_sales_excel_file] 
group by [pizza_name]
order by sum([quantity]) desc;

