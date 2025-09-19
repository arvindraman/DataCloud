-- Sample Query that shows how to use FILTER within Aggregate within Data Cloud Queries


-- https://help.salesforce.com/s/articleView?id=release-notes.rn_cdp_2025_summer_filter_clause.htm&release=256&type=5
--https://developer.salesforce.com/docs/data/data-cloud-query-guide/references/dc-sql-reference/aggregate.html


-- CTE to create list of Loan Assignments to Banker
WITH Car (Model,Color, Price) AS ( 
VALUES
('Tesla', 'Red', 50000),
('Tesla', 'Black', 85000),
('Tesla', 'White', 40000),
('Honda', 'Grey', 30000),
('Honda', 'Red', 25000),
('Ford', 'White', 35000),
('Ford' ,'Black', 40000)
)

-- select Model, Color, Price from Car

-- Get total number of cars and total number of tesla cars
/*
select count(*) as Number_of_Cars,
count(*) Filter (where Model='Tesla') as Number_of_Tesla_cars
from Car
*/


-- For each car color, get the average price of cars, count of cards, average price of Tesla cars, count of Tesla cars 
select Color,
AVG(price) as avg_price,
Count (*) as count_cars,
AVG(price) FILTER (where Model = 'Tesla') as Avg_Price_Tesla,
count (*) FILTER (where model = 'Tesla') as count_Tesla
from Car
Group by Color
