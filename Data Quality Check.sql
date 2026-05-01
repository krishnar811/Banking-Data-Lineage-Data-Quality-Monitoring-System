CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    dob DATE,
    gender TEXT,
    pan_number TEXT,
    phone TEXT,
    email TEXT,
    created_at DATE
);

--

CREATE TABLE accounts (
    account_id TEXT PRIMARY KEY,
    customer_id TEXT,
    account_type TEXT,
    balance NUMERIC,
    status TEXT,
    opened_date DATE,
    branch_id TEXT
);

--

CREATE TABLE transactions (
    txn_id TEXT PRIMARY KEY,
    account_id TEXT,
    txn_date DATE,
    txn_type TEXT,
    amount NUMERIC,
    channel TEXT
);

--

CREATE TABLE loans (
    loan_id TEXT PRIMARY KEY,
    customer_id TEXT,
    loan_type TEXT,
    loan_amount NUMERIC,
    interest_rate NUMERIC,
    start_date DATE,
    status TEXT
);

--

SELECT * FROM accounts
SELECT * FROM customers
SELECT * FROM loans
SELECT * FROM transactions

--

--Negative Balance

SELECT * FROM accounts
WHERE balance < 0;

--Invalid Customer Reference

SELECT a.*
FROM accounts a
LEFT JOIN customers c
ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

--Negative Loans

SELECT * FROM loans
WHERE loan_amount < 0;

--Negative Transactions

SELECT * FROM transactions
WHERE amount < 0;

--Invalid Account

SELECT t.*
FROM transactions t
LEFT JOIN accounts a
ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

--Duplicate Customer Detection

SELECT email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

--Multiple Transactions In Short Time

SELECT account_id, txn_date, COUNT(*) AS txn_count
FROM transactions
GROUP BY account_id, txn_date
HAVING COUNT(*) > 2;

--Inactive Accounts With Transactions

SELECT t.*
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
WHERE a.status = 'inactive';

--Transaction flow per account

SELECT 
    account_id,
    txn_date,
    amount,
    SUM(amount) OVER (PARTITION BY account_id ORDER BY txn_date) AS running_balance
FROM transactions;

--Data Quality Score

SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN balance < 0 THEN 1 ELSE 0 END) AS error_count,
    ROUND(
        (COUNT(*) - SUM(CASE WHEN balance < 0 THEN 1 ELSE 0 END)) * 100.0 / COUNT(*),
        2
    ) AS quality_score
FROM accounts;

--Negative Balance Error

CREATE TABLE negative_balance_errors AS
SELECT * FROM accounts WHERE balance < 0;
