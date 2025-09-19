-- Sample Query that shows how to use Window Functions within Data Cloud Queries
-- https://developer.salesforce.com/docs/data/data-cloud-query-guide/references/dc-sql-reference/window.html

-- This query can be run directly in Data Cloud Query Editor as it uses CTEs to initiatize the data 

-- CTE to create list of Loan Assignments to Banker
WITH Loan (LoanID, Customer, Banker, LoanAmount) AS ( 
VALUES
(1, 'Alice Johnson', 'John Carter', 250000),
(2, 'Bob Smith', 'Margaret Lee', 185000),
(3, 'Carol Williams', 'Susan Patel', 420000),
(4, 'David Brown', 'John Carter', 360000),
(5, 'Eve Davis', 'Susan Patel', 420000),
(6, 'Frank Miller', 'Margaret Lee', 380000),
(7, 'Grace Wilson', 'John Carter', 360000),
(8, 'Hank Moore', 'Susan Patel', 150000),
(9, 'Ivy Taylor', 'Margaret Lee', 440000),
(10, 'Jack Anderson', 'John Carter', 335000),
(11, 'Kara Thomas', 'Susan Patel', 215000),
(12, 'Leo Jackson', 'Margaret Lee', 380000),
(13, 'Mia White', 'John Carter', 360000),
(14, 'Noah Harris', 'Susan Patel', 470000),
(15, 'Olivia Martinez', 'Margaret Lee', 195000),
(16, 'Liam Clark', 'John Carter', 425000),
(17, 'Sophia Green', 'Susan Patel', 345000),
(18, 'Ethan Hall', 'Margaret Lee', 265000),
(19, 'Ava Lopez', 'John Carter', 490000),
(20, 'Lucas King', 'Susan Patel', 305000)
)

-- Query to show the different Window Functions (ROW_Number, Rank, Dense_Rank, NTile etc)
select Banker, Customer,LoanAmount, 
ROW_NUMBER() over (partition by Banker order by LoanAmount desc) as rownumber, 
RANK() over (partition by Banker order by LoanAmount desc) as rank,
DENSE_RANK() over (partition by Banker order by LoanAmount desc) as denserank,
PERCENT_RANK() over (partition by Banker order by LoanAmount desc) as percentrank,
cume_dist() over (partition by Banker order by LoanAmount desc) as cume_dist,
NTILE(4) over (partition by Banker order by LoanAmount desc) as ntile
From Loan
Order by Banker, rownumber asc ;
