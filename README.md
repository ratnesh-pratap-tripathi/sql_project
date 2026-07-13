# 📊 Student Result Processing System (SQL)

## 📌 Overview

This SQL project calculates:

- ✅ Total Marks
- ✅ Percentage
- ✅ Grade (A+, A, B, C, D, F)
- ✅ Final Remarks (Distinction, Division, Fail)

It uses **Common Table Expressions (CTEs)** to keep the query clean and readable.

---

## 🗂 Database Structure

### 1️⃣ `std` Table (Student Details)

| Column Name | Description |
|-------------|------------|
| std_ID | Student ID (Primary Key) |
| first_name | First Name |
| last_name | Last Name |
| age | Age |
| gender | Gender (M/F) |

---

### 2️⃣ `sub` Table (Subject Marks)

| Column Name | Description |
|-------------|------------|
| std_ID | Student ID (Foreign Key) |
| English | Marks (Out of 100) |
| Chemistry | Marks (Out of 100) |
| Physics | Marks (Out of 100) |
| Mathematics | Marks (Out of 100) |
| Hindi | Marks (Out of 100) |
| Sanskrit | Marks (Out of 100) |

✅ Total Subjects: 6  
✅ Maximum Marks: 600  

---

# 🧠 Query Explanation

## 🔹 Step 1: Calculate Basic Result (`result` CTE)

- Join `std` and `sub` tables
- Create full name using `CONCAT`
- Convert gender (M → Male, F → Female)
- Calculate total marks

