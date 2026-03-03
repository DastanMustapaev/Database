-- Lab 15: Advanced querying
-- create employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);

-- insert data
INSERT INTO employees (first_name, department, salary, manager_id) VALUES
('Aibek','Sales',70000,NULL),
('Meerim','Engineering',120000,NULL),
('Nursultan','Engineering',90000,2),
('Bakyt','HR',50000,NULL),
('Ainura','Sales',65000,1);

-- Subquery (salary above average)
SELECT first_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- CTE example
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.first_name, e.department, e.salary, d.avg_salary
FROM employees e
JOIN dept_avg d ON e.department = d.department;

-- Recursive CTE (hierarchy)
WITH RECURSIVE org_chart AS (
    SELECT employee_id, first_name, manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.first_name, e.manager_id
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.employee_id
)
SELECT * FROM org_chart;

-- Window Function
SELECT first_name,
       department,
       salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- Set Operation (UNION)
SELECT first_name FROM employees WHERE department = 'Sales'
UNION
SELECT first_name FROM employees WHERE department = 'HR';
