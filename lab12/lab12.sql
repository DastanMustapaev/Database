--  Querying Data
-- create table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    email VARCHAR(100)
);

-- insert sample data
INSERT INTO employees (name, department, salary, email) VALUES
('Aibek', 'Sales', 70000, 'aibek@gmail.com'),
('Nursultan', 'Engineering', 90000, 'nur@gmail.com'),
('Meerim', 'Engineering', 120000, 'meerim@yahoo.com'),
('Bakyt', 'HR', 50000, 'bakyt@gmail.com');

-- SELECT examples
SELECT * FROM employees;

-- WHERE condition
SELECT name, salary
FROM employees
WHERE department = 'Engineering';

-- calculation + alias
SELECT name, salary, salary * 0.10 AS bonus
FROM employees;

-- LIKE / ILIKE
SELECT email
FROM employees
WHERE email ILIKE '%@gmail.com';

-- CASE statement
SELECT name, salary,
CASE
    WHEN salary > 100000 THEN 'Senior'
    WHEN salary >= 60000 THEN 'Mid'
    ELSE 'Junior'
END AS level
FROM employees;

-- CTE example
WITH avg_salary AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT name, salary
FROM employees, avg_salary
WHERE salary > average_salary;
