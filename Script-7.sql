CREATE DATABASE student_data;

USE student_data;


DROP TABLE IF EXISTS std;

CREATE TABLE std (
    std_ID Varchar(20) PRIMARY KEY,
    first_name Varchar(20) NOT NULL,
    last_name Varchar(20),
    age int NOT NULL,
    gender varchar(20),
    mobile_no CHAR(10),
     address Text, 
    CHECK (mobile_no REGEXP '^[0-9]{10}$')
);


DROP TABLE IF EXISTS sub;

CREATE TABLE sub (
    std_ID Varchar(20) PRIMARY KEY,
    English INT NOT NULL CHECK (English BETWEEN 0 AND 100),
    Chemistry INT NOT NULL CHECK (Chemistry BETWEEN 0 AND 100),
    Physics INT NOT NULL CHECK (Physics BETWEEN 0 AND 100),
    Mathematics INT NOT NULL CHECK (Mathematics BETWEEN 0 AND 100),
    Hindi INT NOT NULL CHECK (Hindi BETWEEN 0 AND 100),
    Sanskrit INT NOT NULL CHECK (Sanskrit BETWEEN 0 AND 100),
    FOREIGN KEY (std_ID) REFERENCES std (std_ID)
);

WITH result AS (
    SELECT 
        st.std_ID,
        CONCAT(st.first_name, ' ', st.last_name) AS full_name,
        st.age,
        CASE 
            WHEN st.gender = 'F' THEN 'Female'
            WHEN st.gender = 'M' THEN 'Male'
            ELSE 'Unknown'
        END AS gender,
        SUM(su.English + su.Chemistry + su.Physics + su.Mathematics + su.Hindi + su.Sanskrit) AS total_marks
    FROM std st
    JOIN sub su ON st.std_ID = su.std_ID
    GROUP BY st.std_ID, st.first_name, st.last_name, st.age, st.gender
),

graded AS (
    SELECT *,
           ROUND((total_marks / 600) * 100, 2) AS percentage,
           CASE
               WHEN (total_marks / 600) * 100 >= 80 THEN 'A+'
               WHEN (total_marks / 600) * 100 >= 70 THEN 'A'
               WHEN (total_marks / 600) * 100 >= 60 THEN 'B'
               WHEN (total_marks / 600) * 100 >= 50 THEN 'C'
               WHEN (total_marks / 600) * 100 >= 40 THEN 'D'
               ELSE 'F'
           END AS grade
    FROM result
)

SELECT *,
       CASE
           WHEN grade = 'A+' THEN 'Distinction'
           WHEN grade = 'A' THEN 'First Division'
           WHEN grade = 'B' THEN 'Second Division'
           WHEN grade = 'C' THEN 'Third Division'
           WHEN grade = 'D' THEN 'Third Division'
           ELSE 'Fail'
       END AS remarks
FROM graded;
