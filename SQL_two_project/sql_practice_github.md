# SQL Practice: Employee, Project & Manager Tables

MySQL Workbench 8.0 practice notes covering table setup and 55 SQL
exercises, from basic `SELECT` queries to joins and subqueries.

## Contents

-   [Database setup](#database-setup)
-   [SQL exercises](#sql-exercises)

## Database setup

Run this section first to create `company_db`, the `Employee`,
`Project`, and `Employee_Manager` tables, and insert sample data.

``` sql
CREATE DATABASE company_db;

USE company_db;

DROP TABLE IF EXISTS Employee; 

CREATE TABLE Employee (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (Employee_ID, Name, Department, Salary)
VALUES
('E001', 'Rahul Sharma', 'IT', 55000),
('E002', 'Priya Verma', 'HR', 45000),
('E003', 'Amit Kumar', 'Finance', 60000),
('E004', 'Sneha Patel', 'Marketing', 48000),
('E005', 'Vikram Singh', 'Sales', 42000),
('E006', 'Anjali Gupta', 'IT', 65000),
('E007', 'Rohit Mehta', 'Operations', 50000),
('E008', 'Neha Reddy', 'HR', 47000),
('E009', 'Arjun Das', 'Finance', 58000),
('E010', 'Pooja Nair', 'Sales', 44000),
('E011', 'Karan Joshi', 'IT', 70000),
('E012', 'Meera Shah', 'Marketing', 52000),
('E013', 'Suresh Yadav', 'Operations', 46000),
('E014', 'Divya Rao', 'Finance', 62000),
('E015', 'Manish Jain', 'IT', 57000);


DROP TABLE IF EXISTS Project; 

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Employee_ID VARCHAR(10),
    Budget DECIMAL(12, 2),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Project (Project_ID, Project_Name, Employee_ID, Budget)
VALUES
(101, 'Website Development', 'E001', 200000),
(102, 'Employee Management System', 'E006', 150000),
(103, 'Financial Dashboard', 'E003', 180000),
(104, 'Marketing Campaign', 'E004', 100000),
(105, 'Sales Analytics', 'E005', 120000),
(106, 'Cloud Migration', 'E011', 250000),
(107, 'HR Portal', 'E002', 90000),
(108, 'Mobile Application', 'E015', 220000),
(109, 'Inventory System', 'E009', 175000),
(110, 'Data Analytics', 'E014', 160000),
(111, 'AI Chatbot', 'E001', 300000),
(112, 'Customer Portal', 'E010', 80000);

DROP TABLE IF EXISTS Employee_Manager;

CREATE TABLE Employee_Manager (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Manager_ID VARCHAR(10),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Employee_Manager
    (Employee_ID,  Manager_ID)
VALUES
('E001', NULL),
('E002', 'E001'),
('E003', 'E001'),
('E004', 'E002'),
('E005', 'E002'),
('E006', 'E003'),
('E007', 'E003'),
('E008', 'E004'),
('E009', 'E004'),
('E010', 'E005');
```

## SQL exercises

### 1. Write a query to get all records from the employee table

``` sql
SELECT
    *
FROM
    employee;
```

### 2. Write a query to get only name and salary of all employee

``` sql
SELECT
    name,
    salary
FROM
    employee;
```

### 3. Write a query to get all unique department from the employee tale

``` sql
SELECT
    DISTINCT department
FROM
    employee;
```

### 4. Write a query to get the first 5 record from the employee table

``` sql
SELECT
    *
FROM
    employee
LIMIT 5;
```

### 5. Write a query to get employees with salary greater than 60000.

``` sql
SELECT
    *
FROM
    employee
WHERE
    salary > 60000;
```

### 6. Write a query to get employees from the IT department.

``` sql
SELECT
    *
FROM
    employee
WHERE
    department = 'IT';
```

### 7. Write a query to get employees with salary between 50000 and 70000.

``` sql
SELECT
    *
FROM
    employee
WHERE
    salary BETWEEN 50000 AND 70000;
```

### 8. Write a query to get employees whose name starts with 'A'.

``` sql
SELECT
    *
FROM
    employee
WHERE
    Name LIKE 'A%';
```

### 9. Write a query to sort employees by salary in descending order.

``` sql
SELECT
    *
FROM
    employee
ORDER BY
    salary DESC;
```

### 10. Write a query to get the total number of employees in the table.

``` sql
SELECT
    count(*) AS total_employees
FROM
    employee;
```

### 11. Write a query to get the name and department of all employees.

``` sql
SELECT
    name,
    department
FROM
    employee;
```

### 12. Write a query to get employees with salary greater than 50000.

``` sql
SELECT
    *
FROM
    employee
WHERE
    salary > 50000;
```

### 13. Write a query to get employees from the IT department.

``` sql
SELECT
    *
FROM
    employee
WHERE
    department = 'HR';
```

### 14. Write a query to get employees with salary less than or equal to 50000.

``` sql
SELECT
    *
FROM
    employee
WHERE
    salary <= 50000;
```

### 15. Write a query to get employees whose name contains 'd' (case insensitive).

``` sql
SELECT
    *
FROM
    employee
WHERE
    name LIKE '%d%';
```

### 16. Write a query to get employees from HR or Finance department.

``` sql
SELECT
    *
FROM
    employee
WHERE
    department IN('HR', 'Finance');

SELECT
    *
FROM
    employee
WHERE
    department = 'HR'
    OR department = 'Finance';
```

### 17. Write a query to get employees whose name starts with 'R'.

``` sql
SELECT
    *
FROM
    employee
WHERE
    name LIKE 'R%';
```

### 18. Write a query to get employees whose salary is between 50000 and 70000 (notinclusive).

``` sql
SELECT
    *
FROM
    employee
WHERE
    salary > 50000
    AND salary < 70000;
```

### 19. Write a query to get employees ordered by salary in ascending order.

``` sql
SELECT
    *
FROM
    employee
ORDER BY
    salary ASC;
```

### 20. Write a query to get employees ordered by salary in descending order.

``` sql
SELECT
    *
FROM
    employee
ORDER BY
    salary DESC;
```

### 21. Write a query to get unique salaries from the employees table.

``` sql
SELECT
    DISTINCT salary
FROM
    employee;
```

### 22. Write a query to get unique combinations of department and salary.

``` sql
SELECT
    DISTINCT department,
    salary
FROM
    employee;
```

### 23. Write a query to get the top 3 highest salaries using LIMIT.

``` sql
SELECT
    *
FROM
    employee
ORDER BY
    salary DESC
LIMIT 3;
```

### 24. Write a query to get the first 4 employees from the table.

``` sql
SELECT
    *
FROM
    employee
LIMIT 4;
```

### 25. Write a query to get the 2nd highest salary using LIMIT (without subquery)

``` sql
SELECT
    DISTINCT salary AS 'Second highest salary'
FROM
    employee
ORDER BY
    salary DESC
LIMIT 1,
1;
```

### 26. Write a query to display employee names with a salary category using CASE.

``` sql
SELECT
    name,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'low'
    END AS salary_category
FROM
    employee;
```

### 27. Write a query to show 'Yes' if salary is greater than 60000 otherwise 'No' using CASE.

``` sql
SELECT
    name,
    salary,
    CASE
        WHEN salary > 60000 THEN 'Yes'
        ELSE 'No'
    END AS high_salary
FROM
    employee;
```

### 28. Write a query to display department with a custom label using CASE.

``` sql
SELECT
    name,
    department,
    CASE
        department
        WHEN 'IT' THEN 'Tech Department'
        WHEN 'HR' THEN 'Human Resource Department'
        ELSE department
    END AS department_type
FROM
    employee;
```

### 29. Write a query to get the top 3 employees from each department using LIMIT and a simple approach (assume you need top 3 overall for example).

``` sql
SELECT
    *
FROM
    employee
ORDER BY
    department,
    salary DESC
LIMIT 3;
```

### 30. Write a query to get the total salary paid to all employees.

``` sql
SELECT
    SUM(salary) AS toatal_salary_paid
FROM
    employee;
```

### 31. Write a query to get the average salary of all employees.

``` sql
SELECT
    AVG(salary) AS avg_salary
FROM
    employee;
```

### 32. Write a query to get the highest salary in the company.

``` sql
SELECT
    MAX(salary) AS highest_salary
FROM
    employee;
```

### 33. Write a query to get the lowest salary in the company.

``` sql
SELECT
    MIN(salary) AS lowest_salary
FROM
    employee;
```

### 34. Write a query to get the number of employees in each department.

``` sql
SELECT
    department,
    COUNT(*) AS emp_count
FROM
    employee
GROUP BY
    department;
```

### 35. Write a query to get the total salary in each department.

``` sql
SELECT
    department,
    SUM(salary) AS total_salary
FROM
    employee
GROUP BY
    department;
```

### 36. Write a query to get the average salary in each department.

``` sql
SELECT
    department,
    AVG(salary) AS avg_salary
FROM
    employee
GROUP BY
    department;
```

### 37. Write a query to get the total number of employees with salary greater than 60000.

``` sql
SELECT
    COUNT(*) AS high_salary_count
FROM
    employee
WHERE
    salary > 60000;
```

### 38. Write a query to get the total number of distinct departments in the table.

``` sql
SELECT
    COUNT(DISTINCT department) AS dep_count
FROM
    employee;
```

### 39. Write a query to get the highest salary in each department.

``` sql
SELECT
    department,
    MAX(salary) AS high_salary
FROM
    employee
GROUP BY
    department;
```

### 40. Write a query to get the lowest salary in each department.

``` sql
SELECT
    department,
    MIN(salary) AS lowest_salary
FROM
    employee
GROUP BY
    department;
```

### 41. Write a query to get departments having more than 2 employees.

``` sql
SELECT
    department,
    COUNT(*) AS emp_count
FROM
    employee
GROUP BY
    department
HAVING
    COUNT(*) > 2;
```

### 42. Write a query to get departments whose total salary is greater than 100000.

``` sql
SELECT
    department,
    SUM(salary) AS total_salary
FROM
    employee
GROUP BY
    department
HAVING
    SUM(salary) > 100000;
```

### 43. Write a query to get departments with average salary greater than 55000

``` sql
SELECT
    department,
    AVG(salary) AS avg_salary
FROM
    employee
GROUP BY
    department
HAVING
    AVG(salary) > 55000;
```

### 44. Write a query to get departments with at least 2 employees and total salary greater than 100000.

``` sql
SELECT
    department,
    COUNT(*) AS emp_count,
    SUM(salary) AS total_salary
FROM
    employee
GROUP BY
    department
HAVING
    COUNT(*) > 2
    AND SUM(salary) > 100000;
```

### 45. Write a query to get departments where the highest salary is greater than 60000

``` sql
SELECT
    department,
    MAX(salary) AS highest_salary
FROM
    employee
GROUP BY
    department
HAVING
    MAX(salary) > 60000;
```

### 46. Write a query to get employee names with their project names using INNER JOIN.

``` sql
SELECT
    e.Name,
    p.Project_Name
FROM
    Employee e
INNER JOIN Project p
    ON
    e.Employee_ID = p.Employee_ID;
```

### 47. Write a query to get all employees and their project names using LEFT JOIN.

``` sql
SELECT
    e.Name,
    p.Project_Name
FROM
    Employee e
LEFT JOIN Project p
    ON
    e.Employee_ID = p.Employee_ID;
```

### 48. Write a query to get all project and their employees using RIGHT JOIN.

``` sql
SELECT
    p.Project_Name,
    e.Name
FROM
    Employee e
RIGHT JOIN Project p
    ON
    e.Employee_ID = p.Employee_ID;
```

### 49. Write a query to get employees who do not have a project using LEFT JOIN.

``` sql
SELECT
    e.Name
FROM
    Employee e
LEFT JOIN Project p
    ON
    e.Employee_ID = p.Employee_ID
WHERE
    p.Employee_ID IS NULL;
```

### 50. Write a query to get project that do not have any employees using LEFT JOIN.

``` sql
SELECT
    p.Project_ID
FROM
    Project p
LEFT JOIN Employee e
    ON
    p.Employee_ID = e.Employee_ID
WHERE
    e.Employee_ID IS NULL;
```

### 51. Write a query to get employees names and their manager names using self join.

``` sql
SELECT
    e.Name AS Employee_Name,
    m.Name AS Manager_Name
FROM
    Employee e
LEFT JOIN Employee_Manager em
    ON
    e.Employee_ID = em.Employee_ID
LEFT JOIN Employee m
    ON
    em.Manager_ID = m.Employee_ID;
```

### 52. Write a query to get the count of employees in each project using JOIN.

``` sql
SELECT
    p.Project_Name,
    COUNT(e.Employee_ID) AS Employee_Count
FROM
    Project p
LEFT JOIN Employee e
    ON
    p.Employee_ID = e.Employee_ID
GROUP BY
    p.Project_ID,
    p.Project_Name;
```

### 53. Write a query to get employees whose salary is greater than the average salary of all employees using a subquery.

``` sql
SELECT
    *
FROM
    Employee
WHERE
    Salary > (
    SELECT
        AVG(Salary)
    FROM
        Employee
);
```

### 54. Write a query to get employees who work in the department with the highest average salary using a subquery.

``` sql
SELECT
    *
FROM
    Employee
WHERE
    Department = (
    SELECT
        Department
    FROM
        Employee
    GROUP BY
        Department
    ORDER BY
        AVG(Salary) DESC
    LIMIT 1
);
```

### 55. Write a query to get employees who have a salary greater than the average salary of their department using a correlated subquery.

``` sql
SELECT
    *
FROM
    Employee e
WHERE
    Salary > (
    SELECT
        AVG(Salary)
    FROM
        Employee
    WHERE
        Department = e.Department
);
```
