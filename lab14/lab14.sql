-- Lab 14: Joining tables
-- create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- insert customers
INSERT INTO customers (name, email) VALUES
('Aibek','aibek@gmail.com'),
('Meerim','meerim@gmail.com'),
('Nursultan','nur@gmail.com');

-- insert orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1,'2024-01-10',150.00),
(1,'2024-02-05',200.00),
(2,'2024-03-01',300.00);

-- INNER JOIN
SELECT c.name, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT c.name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.name, o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN
SELECT c.name, o.order_date
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;
