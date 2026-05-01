# Banking Data Lineage & Data Quality Monitoring System

Project Overview

This project simulates a **real-world banking data quality and lineage monitoring system**.
It focuses on ensuring **data accuracy, integrity, and traceability** across multiple banking datasets such as customers, accounts, transactions, and loans.

The system performs **automated data validation using SQL**, executes checks through a **Python pipeline**, and tracks **data lineage and historical quality metrics**.

---

Objectives

* Validate and monitor **data quality**
* Detect **data anomalies and fraud patterns**
* Implement **data lineage tracking**
* Automate workflows using a **Python pipeline**
* Prepare data for **dashboard visualization (Power BI)**

---

Architecture

```
CSV Files → SQLite Database → SQL Validation → Python Pipeline → Output Reports → Dashboard
```

---

Dataset Description

1. Customers

| Column      | Description                |
| ----------- | -------------------------- |
| customer_id | Unique customer identifier |
| first_name  | Customer first name        |
| last_name   | Customer last name         |
| dob         | Date of birth              |
| gender      | Gender                     |
| pan_number  | Unique PAN number          |
| phone       | Contact number             |
| email       | Email address              |
| created_at  | Account creation date      |

---

2. Accounts

| Column       | Description          |
| ------------ | -------------------- |
| account_id   | Unique account ID    |
| customer_id  | Linked customer      |
| account_type | Savings / Current    |
| balance      | Account balance      |
| status       | Active / Inactive    |
| opened_date  | Account opening date |
| branch_id    | Bank branch          |

---

3. Transactions

| Column     | Description           |
| ---------- | --------------------- |
| txn_id     | Transaction ID        |
| account_id | Linked account        |
| txn_date   | Transaction date      |
| txn_type   | Credit / Debit        |
| amount     | Transaction amount    |
| channel    | ATM / Online / Branch |

---

4. Loans

| Column        | Description     |
| ------------- | --------------- |
| loan_id       | Loan ID         |
| customer_id   | Linked customer |
| loan_type     | Loan category   |
| loan_amount   | Loan value      |
| interest_rate | Interest rate   |
| start_date    | Loan start date |
| status        | Active / Closed |

---

Data Quality Checks Implemented

Data Validation

* Negative account balance detection
* Invalid customer-account relationships
* Negative transaction amounts
* Invalid account references

Data Integrity

* Duplicate PAN detection
* Transactions on inactive accounts
* Accounts with no transactions

Fraud & Risk Detection

* High-value transactions (>100000)
* Multiple transactions per day
* Loan-to-balance risk analysis

Analytical Queries

* Top customers by transaction volume
* Daily transaction summary
* Transaction spike detection using window functions (`LAG`)

---

Python Pipeline

The pipeline automates:

* Running SQL data quality checks
* Extracting results from SQLite
* Generating CSV error reports
* Maintaining historical quality scores
* Logging data lineage

Pipeline Flow

```
Connect DB → Run Queries → Generate Outputs → Save Reports → Track History
```

---

Output Files

Generated in `/output` folder:

* `negative_balance.csv`
* `invalid_customer.csv`
* `duplicate_pan.csv`
* `high_value_transactions.csv`
* `accounts_no_txn.csv`
* `quality_history.csv`

---

Data Lineage

A lineage table tracks:

| Source    | Target        | Transformation |
| --------- | ------------- | -------------- |
| CSV Files | SQLite Tables | Data Load      |
| Tables    | Output CSVs   | SQL Validation |

This enables **traceability and governance**.

---

Tech Stack

* **Python** (Pandas, SQLite3)
* **SQL** (Advanced queries, joins, window functions)
* **SQLite** (Database)
* **Power BI** (Dashboard - upcoming)
* **GitHub** (Version control)

---

Key Features

* Automated **data quality monitoring system**
* Realistic **banking domain dataset**
* **Advanced SQL queries** (joins, aggregations, window functions)
* **Fraud detection logic**
* **Pipeline automation**
* **Data lineage tracking**

---

Future Enhancements

* Power BI dashboard for visualization
* Real-time data ingestion
* Integration with PostgreSQL / Cloud (AWS)
* Advanced analytics and ML models

---

Business Impact

* Improves **data reliability**
* Enables **fraud detection**
* Supports **data-driven decision making**
* Enhances **data governance and traceability**

---

Skills Demonstrated

* SQL (Advanced)
* Python (Data Processing & Automation)
* Data Quality & Validation
* Data Lineage & Governance
* Pipeline Design
* Banking Domain Understanding

---

Conclusion

This project demonstrates an **end-to-end data quality and lineage system**, simulating real-world banking analytics workflows and aligning with modern data engineering and analytics practices.

---

Author

Krishna Rathi

---
