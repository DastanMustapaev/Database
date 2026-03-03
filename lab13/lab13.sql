-- Lab 13: Aggregate functions
-- create table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT
);

-- insert data
INSERT INTO employees (name, department, salary, age) VALUES
('Aibek','Sales',70000,22),
('Nursultan','Engineering',90000,24),
('Meerim','Engineering',120000,23),
('Bakyt','HR',50000,25),
('Ainura','Sales',65000,21);

-- COUNT
SELECT COUNT(*) AS total_employees FROM employees;

-- SUM
SELECT SUM(salary) AS total_salary FROM employees;

-- AVG
SELECT AVG(salary) AS average_salary FROM employees;

-- MAX / MIN
SELECT MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
FROM employees;

-- GROUP BY
SELECT department,
       COUNT(*) AS employee_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- HAVING
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;
