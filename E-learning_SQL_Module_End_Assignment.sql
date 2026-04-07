create database e_learning;
use e_learning;
-- Table creation(learners,courses,purchases)


create table learners(
learner_id int primary key auto_increment,
full_name varchar(25),
country varchar(25)
);

create table courses (
course_id int primary key auto_increment,
course_name varchar(50),
category varchar(25),
unit_price decimal(10,2)
);

create table purchases(
purchase_id int primary key auto_increment, 
learner_id int,
course_id int,
quantity int,
purchase_date date,
foreign key(learner_id) references learners(learner_id),
foreign key(course_id)references courses(course_id)
);

ALTER TABLE purchases
ADD CONSTRAINT unique_purchase 
UNIQUE (learner_id, course_id);

INSERT INTO purchases (learner_id, course_id, quantity, purchase_date)
VALUES (1, 1, 1, '2026-04-10');
------------------------------------------------------------------------------------------------------------
-- insertion

INSERT INTO learners (full_name, country) VALUES
('Jency', 'USA'),
('Jeromi', 'India'),
('Ibrahim', 'UAE'),
('Maria', 'Spain'),
('Chen Wei', 'China');

set sql_safe_updates=1;

update learners
set full_name=case
when learner_id=6 then "Vennba"
when learner_id=7 then "Rani"
when learner_id=8 then "Fatima"
when learner_id=9 then "Sandra"
when learner_id=10 then "ching chai"
end
where learner_id in(6,7,8,9,10);

INSERT INTO learners (full_name, country) VALUES
('Aarav', 'India'),
('Sophia', 'USA'),
('Liam', 'UK'),
('Noah', 'Canada'),
('Emma', 'Australia'),
('Olivia', 'Germany'),
('Ethan', 'UAE'),
('Mia', 'France'),
('Lucas', 'Brazil'),
('Amelia', 'Italy');

select * from learners;

INSERT INTO courses (course_name, category, unit_price) VALUES
('SQL for Beginners', 'Database', 48909.99),
('Python Programming', 'Programming', 50059.90),
('Power BI Dashboard', 'Analytics', 39009.99),
('Excel Mastery', 'Productivity', 29000.99),
('Machine Learning Basics', 'AI', 78090.00);

INSERT INTO courses (course_name, category, unit_price) VALUES
-- Database
('Advanced SQL Queries', 'Database', 52000.00),
('Database Design Concepts', 'Database', 47000.00),

-- Programming
('Java Programming', 'Programming', 55000.00),
('Web Development Basics', 'Programming', 48000.00),

-- Analytics
('Tableau for Beginners', 'Analytics', 41000.00),
('Data Visualization Mastery', 'Analytics', 45000.00),

-- Productivity
('Advanced Excel Techniques', 'Productivity', 32000.00),
('Time Management Skills', 'Productivity', 25000.00),

-- AI
('Deep Learning Fundamentals', 'AI', 82000.00),
('AI for Business', 'AI', 76000.00);
INSERT INTO courses (course_name, category, unit_price)
VALUES ('Cloud Computing Basics', 'IT & Software', 45000.00);


select * from courses;


INSERT INTO purchases (learner_id, course_id, quantity, purchase_date) VALUES
(1, 1, 1, '2026-04-01'),
(2, 2, 1, '2025-04-01'),
(3, 3, 2, '2026-04-02'),
(4, 4, 1, '2022-04-02'),
(5, 5, 1, '2026-04-03'),
(1, 2, 1, '2026-04-03'),
(2, 3, 1, '2024-04-04'),
(3, 1, 3, '2025-04-04');
INSERT INTO purchases (learner_id, course_id, quantity, purchase_date) VALUES
(6, 1, 1, '2026-04-05'),
(7, 2, 2, '2026-04-05'),
(8, 3, 1, '2026-04-06'),
(9, 4, 3, '2026-04-06'),
(10, 5, 1, '2026-04-07');

INSERT INTO purchases (learner_id, course_id, quantity, purchase_date) VALUES
(11, 6, 1, '2026-04-08'),
(12, 7, 1, '2026-04-08'),

(13, 8, 1, '2026-04-09'),
(14, 9, 1, '2026-04-09'),

(15, 10, 1, '2026-04-10'),
(16, 11, 1, '2026-04-10'),

(17, 12, 1, '2026-04-11'),
(18, 13, 1, '2026-04-11'),

(19, 14, 1, '2026-04-12'),
(20, 15, 1, '2026-04-12');

INSERT INTO purchases (learner_id, course_id, quantity, purchase_date) VALUES
(1, 2, 1, '2026-04-15'),
(2, 2, 1, '2026-04-15'),
(3, 2, 1, '2026-04-15');
select * from purchases;

UPDATE purchases
SET quantity = CASE
    WHEN purchase_id IN (3, 8, 10, 12) THEN 1
    ELSE quantity
END
WHERE purchase_id IN (3, 8, 10, 12);


UPDATE purchases
SET purchase_date = CASE
    WHEN purchase_id = 1 THEN DATE_ADD(purchase_date, INTERVAL 1 MONTH)  -- May
    WHEN purchase_id = 2 THEN DATE_ADD(purchase_date, INTERVAL 2 MONTH)  -- June
    WHEN purchase_id = 3 THEN DATE_ADD(purchase_date, INTERVAL 3 MONTH)  -- July
    WHEN purchase_id = 4 THEN DATE_ADD(purchase_date, INTERVAL 4 MONTH)  -- August
    WHEN purchase_id = 5 THEN DATE_ADD(purchase_date, INTERVAL 5 MONTH)  -- September
END
WHERE purchase_id IN (1, 2, 3, 4, 5);



-------------------------------------------------------------------------------------------
-- 2. Data Exploration Using Joins
-- combine learner,course,purchase data

select 
l.learner_id,
l.full_name,
l.country,
c.course_id,
c.course_name,
c.category,
c.unit_price,
p.quantity,
p.purchase_date
from learners l left join purchases p on l.learner_id=p.learner_id left join courses c on  p.course_id=c.course_id order by learner_id;
------------------------------------------------------------------------------------------------------------------------
-- Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).--RIGHT JOIN
select
 l.learner_id,
 l.full_name,
 c.course_name,
 c.category,
 p.quantity,
 p.quantity*c.unit_price as Total_Amount,
 p.purchase_date 
from
 learners l 
right join purchases p 
on l.learner_id = p.learner_id
right join courses c 
on p.course_id = c.course_id;
 -----------------------------------------------------------------------------------------------------------------------
 
 -- 3. Analytical Queries
		-- Write SQL queries to answer the following questions:
-- Q1. Display each learner’s total spending (quantity × unit_price) along with their country.

select l.learner_id,
l.full_name,
l.country,
sum(p.quantity*c.unit_price) as Tot_spend
from learners l
left join purchases p on l.learner_id=p.learner_id 
left join courses c on  p.course_id=c.course_id
 group by l.learner_id;
 ------------------------------------------------------------------------------------------------------------------------------
 -- Q2. Find the top 3 most purchased courses based on total quantity sold.
 select c.course_id,
 c.course_name,
 sum(p.quantity)as Total_Quantity_Sold 
 from  courses c
 left join  purchases p 
 on c.course_id=p.course_id
 group by c.course_id ,c.course_name order by Total_Quantity_Sold  desc limit 3;
 ----------------------------------------------------------------------------------------------------------------------
 
 --  Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category.

select c.category,
sum(p.quantity*c.unit_price) as Total_Revenue ,
count(distinct p.learner_id) as Total_Students,rank() over( order by sum(p.quantity*c.unit_price) desc ) as category_Rank
from courses c 
left join purchases p
 on c.course_id=p.course_id group by c.category ;
 ----------------------------------------------------------------------------------------------------------------------------

select * from purchases;
SELECT DISTINCT MONTH(purchase_date) FROM purchases;
select * from courses;
select * from learners;

-- Q4. List all learners who have purchased courses from more than one category.
select l.learner_id,l.full_name,count(distinct c.category)as Total_Category from learners l
 join purchases p
 on l.learner_id=p.learner_id 
 join courses c 
 on  c.course_id=p.course_id 
 group by l.learner_id,l.full_name 
 having count(distinct c.category)>1;
 -------------------------------------------------------------------------------------------------------------------------------
 
-- Q5. Identify courses that have not been purchased at all.

select c.course_id ,
c.course_name 
  from courses c 
  left join purchases p
  on c.course_id=p.course_id   where p.course_id is null;
  ----------------------------------------------------------------------------------------------------------------------------------
  
  -- 6.. Low-Performing Category (Lowest Revenue)
select c.category,
sum(p. quantity*c.unit_price)as Tot_Revenue 
from 
courses c 
join 
purchases p 
on
 c.course_id=p.course_id group by c.category order by Tot_Revenue Limit 1;
 ---------------------------------------------------------------------------------------------------------------------------------
-- 7.-- Revenue Trend Over Time (Monthly)
select date_format(p.purchase_date,'%y-%m')as month,
sum(p.quantity*c.unit_price)as Monthly_Revenue
 from 
 purchases p join courses c
 group by month order by month;
 -----------------------------------------------------------------------------------------------------------
-- 8.Most Popular Category-- Shows market demand trend
select 
c.category,
sum(p.quantity) as Total_Sales
from courses c
join purchases p on c.course_id = p.course_id
group by c.category
order by Total_Sales desc;
-------------------------------------------------------------------------------------------------------------
-- 9.Average Spending Per Learner ( Helps understand customer value)
select 
round(
avg(total_spend),2) as Avg_Spending
from (
    select 
    l.learner_id,
    sum(p.quantity*c.unit_price) as total_spend
    from learners l
    join purchases p on l.learner_id = p.learner_id
    join courses c on p.course_id = c.course_id
    group by l.learner_id
) as t;
--------------------------------------------------------------------------------------------------------------
-- 10. Repeat Customers (Retention)(Insight: Shows returning users )
select 
l.learner_id,
l.full_name,
count(*) as total_purchases
from purchases p
join learners l 
on p.learner_id = l.learner_id
group by l.learner_id, l.full_name
having count(*) > 1;
----------------------------------------------------------------------------------------------------------------
-- 11 Highest Priced Course Sold Most Times
select 
c.course_name,
c.unit_price,
count(p.purchase_id) as times_sold
from courses c
join purchases p on c.course_id = p.course_id
group by c.course_id
order by c.unit_price desc, times_sold desc;
------------------------------------------------------------------------------------------------------------------------------
-- 12.First Purchase Date Per Learner (Customer Journey)
select 
learner_id,
min(purchase_date) as first_purchase
from purchases
group by learner_id;
------------------------------------------------------------------------------------------------
  -- 13.Country-wise Revenue (Insight: Helps target high-value regions)
select 
l.country,
sum(p.quantity*c.unit_price) as revenue
from learners l
join purchases p on l.learner_id = p.learner_id
join courses c on p.course_id = c.course_id
group by l.country
order by revenue desc;
----------------------------------------------------------------------------------------------------


 





