-- Sample Query that shows how to use CTE within Data Cloud Queries
-- https://developer.salesforce.com/docs/data/data-cloud-query-guide/guide/common-table-expressions.html

-- This query can be run directly in Data Cloud Query Editor as it uses CTEs to initiatize the data 

-- CTE to create list of Employees	
WITH Employees(EmployeeID, FirstName, LastName, Title, ManagerId, Email) AS (
VALUES
(1001, 'Alice',   'Johnson',   'CEO',                 0,   'alice.johnson@example.com'),
(1002, 'Bob',     'Smith',     'CTO',                  1001,   'bob.smith@example.com'),
(1003, 'Carol',   'Williams',  'CFO',                  1001,   'carol.williams@example.com'),
(1004, 'David',   'Brown',     'VP Engineering',       1002,   'david.brown@example.com'),
(1005, 'Eve',     'Davis',     'VP Finance',           1003,   'eve.davis@example.com'),
(1006, 'Frank',   'Miller',    'Engineering Manager',  1004,   'frank.miller@example.com'),
(1007, 'Grace',   'Wilson',    'Engineering Manager',  1004,   'grace.wilson@example.com'),
(1008, 'Hank',    'Moore',     'Finance Manager',      1005,   'hank.moore@example.com'),
(1009, 'Ivy',     'Taylor',    'Software Engineer',    1006,   'ivy.taylor@example.com'),
(1010, 'Jack',    'Anderson',  'Software Engineer',    1006,   'jack.anderson@example.com'),
(1011, 'Kara',    'Thomas',    'Software Engineer',    1007,   'kara.thomas@example.com'),
(1012, 'Leo',     'Jackson',   'Software Engineer',    1007,   'leo.jackson@example.com'),
(1013, 'Mia',     'White',     'Accountant',           1008,   'mia.white@example.com'),
(1014, 'Noah',    'Harris',    'Accountant',           1008,   'noah.harris@example.com')
),
---- CTE to create list of Users
Users (UserId, FirstName, LastName, Email) AS ( 
	VALUES
(2001, 'Alice',   'Johnson',   'alice.johnson@example.com'),   -- matches Employee 1001
(2002, 'Bob',     'Smith',     'bob.smith@example.com') ,    -- matches Employee 1002
(2003, 'Sophia',  'Green',     'sophia.green@gmail.com'),      -- external user
(2004, 'Liam',    'Clark',     'liam.clark@yahoo.com') ,     -- external user
(2005, 'Mia',     'White',     'mia.white@example.com') ,      -- matches Employee 1013
(2006, 'Ethan',   'Hall',      'ethan.hall@example.com') ,     -- new user not in employees
(2007, 'Noah',    'Harris',    'noah.harris@example.com') ,    -- matches Employee 1014
(2008, 'Olivia',  'Martinez',  'olivia.martinez@gmail.com'),   -- external user
(2009, 'Jack',    'Anderson',  'jack.anderson@example.com') ,  -- matches Employee 1010
(2010, 'Ava',     'Lopez',     'ava.lopez@hotmail.com')       -- external user
),

-- CTE to find Users who are also Employees
EmpUsers (EmployeeId, UserId, FullName, Email) AS
(select E.EmployeeId, U.UserId, 
 		CONCAT (E.FirstName,' ', E.LastName) as FullName, 
 		E.Email
from Employees E JOIN Users U 
ON E.Email = U.Email)

-- Return the results

select EmployeeId, UserId, FullName, Email from EmpUsers;
