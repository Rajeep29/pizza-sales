select * from pizza_sales;

select sum(total_price) as total_revenue from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select (sum(total_price)/count(distinct order_id)) as avg_order_value
from pizza_sales;

select count( distinct order_id) as total_order from pizza_sales;

select (cast(cast(sum(quantity)as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)))
as avg_per_order
from pizza_sales;

select DATENAME(WEEKDAY,order_date) ,
 COUNT(DISTINCT order_id) as total_order from pizza_sales
 group by DATENAME(WEEKDAY,order_date);

 select DATENAME(MONTH,order_date) ,
 COUNT(DISTINCT order_id) as total_order from pizza_sales
 group by DATENAME(MONTH,order_date)
 order by total_order desc;

 
 select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/
 (select sum(total_price)  from pizza_sales) as percent_total_sales
 from pizza_sales
 where MONTH(order_date)=1
 group by pizza_category;

 select pizza_size,sum(total_price) as total_sales,sum(total_price)*100/
 (select sum(total_price)  from pizza_sales) as percent_total_sales
 from pizza_sales
 group by pizza_size
 order by percent_total_sales desc;
 --top 5 by total_price
 select top 5 pizza_name,sum(total_price) as total
 from pizza_sales
 group by pizza_name
 order by total desc;
 -- bottom 5 by total_price
 select top 5 pizza_name,sum(total_price) as total
 from pizza_sales
 group by pizza_name
 order by total asc;
 --top 5 by by total_quantity
 select top 5 pizza_name,sum(quantity) as total
 from pizza_sales
 group by pizza_name
 order by total desc;
 --bottom 5 by by total_quantity
 select top 5 pizza_name,sum(quantity) as total
 from pizza_sales
 group by pizza_name
 order by total asc;

 select top 5 pizza_name,count(order_id) as total_count
 from pizza_sales
 group by pizza_name
 order by total_count desc;

 select top 5 pizza_name,count(order_id) as total_count
 from pizza_sales
 group by pizza_name
 order by total_count asc;


