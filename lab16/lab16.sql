-- Lab 16: Transactions and ACID Properties
-- create accounts table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    owner VARCHAR(50),
    balance DECIMAL(10,2)
);

-- insert sample data
INSERT INTO accounts (owner, balance) VALUES
('Aibek', 1000.00),
('Meerim', 500.00);

-- Example 1: COMMIT (successful transaction)

BEGIN;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 200
WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

-- Example 2: ROLLBACK (failed transaction)

BEGIN;

UPDATE accounts
SET balance = balance - 300
WHERE account_id = 1;

-- mistake happens --> rollback
ROLLBACK;

SELECT * FROM accounts;

-- Example 3: Savepoint

BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

SELECT * FROM accounts;
