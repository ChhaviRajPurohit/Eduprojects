use online_food;
show tables;

/* finding total number of rows in a table*/ 
describe swiggy;

/* declaring primary key to swiggy database using ALTER command*/
alter table swiggy 
add primary key (ID);

/* total number of rows in a table*/
select count(ID) from swiggy;

/* find total number of cities*/
select count(distinct(city)) from swiggy;

/* find total restaurant from each city */
select City, count(distinct(Restaurant)) as tot_hotel
from swiggy
group by City
order by tot_hotel desc;

/* Find total orders made from each restaurant from Bangalore*/
select Restaurant,count(ID) as tot_orders
from swiggy
where City='Bangalore'
group by Restaurant
order by count(ID) desc;

/* Finding restaurant with max orders*/
select Restaurant,City,  tot_orders from(
select Restaurant,City, count(ID) as tot_orders,
dense_rank() over (order by count(ID) desc) as rankk
from swiggy
group by Restaurant, City) as ranking
where rankk = 1;

/* Finding top 2 restaurant with max order*/
select Restaurant,City,  tot_orders, rankk from(
select Restaurant,City, count(ID) as tot_orders,
dense_rank() over (order by count(ID) desc) as rankk
from swiggy
group by Restaurant, City) as ranking
where rankk between 1 and 2;

/* finding restaurant frim Kormangala area which serve chinese food*/
select Restaurant
from swiggy
where Area=Kormangala and City='Bangalore' and Food_type like '%Chinese%';

/* find average Deliver time taken by Swiggy*/
select avg(Delivery_time) from swiggy;

/* find average Deliver time taken by each city*/
select City, avg(Delivery_time) from swiggy
group by City
order by avg(Delivery_time) desc;


/* find average price of food from Powai Area of Mumbai*/
select City,Area, avg(Price)
from swiggy
where City='Mumbai' and Area='Powai';
#OR
select City,Area, avg(Price)
from swiggy
group by City,Area
having Area= 'Powai' and City= 'Mumbai';
 #HOMEWORK
 /* find top three cities with least avg delivery time*/
 select City,avg(delivery_time) as avg_time
 from swiggy
 group by City
 order by avg_time asc
 limit 3;
 /* Find all Restaurants from Mumbai,Kolkata,Surat who serve North Indian or Mughlai or South Indian food or Fast food*/
 select*from swiggy
 where City in ('Mumbai','Kolkata','Surat')
 and Food_type in('North Indian','Moghlai', 'South Indian','Fast Food');
 
 select * from Swiggy;
