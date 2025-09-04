
-- CTE to create list of Employees	
WITH RECURSIVE Employees(EmployeeID, FirstName, LastName, Title, ManagerId, Email) AS (
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

-- CREATE RECURSIVE CTE 
employee_recursive(distance,EmployeeId, ManagerId ) AS (
  SELECT 1,  e.EmployeeId as EmployeeId, e.ManagerId as ManagerId  
	FROM Employees e
  UNION ALL
    SELECT er.distance +1, e2.EmployeeId, e2.ManagerId 
	FROM employee_recursive er,Employees e2
    WHERE er.EmployeeId = e2.ManagerId
