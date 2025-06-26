# 🧾 Employee Management SQL Project

This project contains SQL scripts for managing and querying an employee database consisting of three main tables: `WORKER_ONE`, `B` (Bonus), and `Title`.

---

## 📁 Database Schema

### 1. `WORKER_ONE`
Stores worker details.

| Column         | Type         | Description               |
|----------------|--------------|---------------------------|
| WORKER_ID      | INT (PK)     | Unique ID for each worker |
| FIRST_NAME     | CHAR(25)     | Worker's first name       |
| LAST_NAME      | CHAR(25)     | Worker's last name        |
| SALARY         | INT          | Worker's salary           |
| JOINING_DATE   | DATETIME     | Date of joining           |
| DEPARTMENT     | CHAR(25)     | Department name           |

---

### 2. `B` (Bonus)
Stores bonus information for each worker.

| Column         | Type         | Description                       |
|----------------|--------------|-----------------------------------|
| WORKER_REF_ID  | INT (FK)     | Foreign key to `WORKER_ONE`       |
| BONUS_AMOUNT   | INT          | Bonus amount given                |
| BONUS_DATE     | DATETIME     | Date of bonus                     |

---

### 3. `Title`
Stores title assignment details for workers.

| Column         | Type         | Description                       |
|----------------|--------------|-----------------------------------|
| WORKER_REF_ID  | INT (FK)     | Foreign key to `WORKER_ONE`       |
| WORKER_TITLE   | CHAR(25)     | Job title                         |
| AFFECTED_FROM  | DATETIME     | Title effective date              |

---

## 📌 Features

- Table creation with foreign key constraints
- Sample data insertion for all 3 tables
- 25 real-world SQL queries using **subqueries**, `JOIN`s, `GROUP BY`, `HAVING`, `IN`, and `ALL/ANY`
- Clean query formatting and question-based documentation

---

## 💡 Topics Covered

- Subqueries (correlated and scalar)
- Aggregation functions (`MAX`, `AVG`, `SUM`, `COUNT`)
- Filtering using `WHERE`, `IN`, `EXISTS`
- Data relationships via `JOIN`
- Real-world query scenarios

---

## 📂 Files Included

- `create_tables.sql` – All table creation scripts
- `insert_data.sql` – Sample data for each table
- `subquery_questions.sql` – 25 advanced subquery-based problems with solutions
- `README.md` – Project overview and documentation

---

## 🚀 How to Run

1. Import the SQL files into your MySQL workbench or CLI.
2. Run `create_tables.sql` to create all tables.
3. Run `insert_data.sql` to populate them with data.
4. Execute queries from `subquery_questions.sql`.

---

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 📧 Contact

Project by **Hemanth Gowda**  
For feedback or questions, feel free to reach out on [GitHub](https://github.com/GowdaHemannth)

