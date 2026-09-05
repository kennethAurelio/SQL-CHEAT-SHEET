CREATE DATABASE information;
USE information;

CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    position VARCHAR(100),
    salary INT,
    department VARCHAR(100),
    contact VARCHAR(100)
);

INSERT INTO employees (employeeID, firstName, lastName, position, salary, department, contact)
VALUES  
    (028818, "Yami", "Isuzu", "Developer", 9000, "Software Engineering", "Yami@gmail.com"),
    (038910, "Alan", "Reeves", "Developer", 9000, "Software Engineering", "AlanR@gmail.com"),
    (060827, "Roy", "Chang", "Lead", 15000, "Software Engineering", "RoyChang@gmail.com"),
    (042580, "Steve", "Brown", "Database Administrator", 9000, "Database Management", "Brown@gmail.com"),
    (098827, "Mario", "Star", "Database Administrator", 9000, "Database Management", "superMario@gmail.com"),
    (067280, "Tyler", "Smith", "Lead", 12500, "Database Management", "TySmith@gmail.com"),
    (071234, "Elena", "Garcia", "Analyst", 8500, "Business Intelligence", "ElenaG@gmail.com"),
    (081345, "James", "White", "Consultant", 11000, "Consulting", "JamesW@gmail.com"),
    (091456, "Anna", "Taylor", "Tester", 7500, "Quality Assurance", "AnnaT@gmail.com"),
    (101567, "Chris", "Walker", NULL, NULL, NULL, "ChrisW@gmail.com");

-- BASIC SQL STATEMENTS (DDL and DML) --

-- 1. CREATE - Creates a database or table (already shown above).
-- 2. ALTER - Modifies the structure of an existing table (examples below).
-- 3. DELETE - Removes rows from a table based on conditions.
-- 4. DROP - Deletes a table or database entirely.

-- RETRIEVING DATA FROM THE TABLE WITH SPECIFIC CONDITIONS --

-- 1. Retrieve employees whose first name starts with "R"
SELECT * FROM employees
WHERE firstName LIKE "R%";

-- 2. Retrieve employees whose first name ends with "N"
SELECT * FROM employees
WHERE firstName LIKE "%N";

-- 3. Retrieve employees whose first name contains the letter "Y"
SELECT * FROM employees
WHERE firstName LIKE "%Y%";

-- 4. Retrieve employees whose first name is exactly 4 letters long
SELECT * FROM employees
WHERE LENGTH(firstName) = 4;

-- 5. Retrieve employees with the position of "Lead"
SELECT * FROM employees
WHERE position = "Lead";

-- 6. Retrieve employees with the position of "Lead" AND salary of 15000
SELECT * FROM employees
WHERE position = "Lead" AND salary = 15000;

-- 7. Retrieve employees with the position of "Lead" OR salary greater than 15000
SELECT * FROM employees
WHERE position = "Lead" OR salary > 15000;

-- 8. Retrieve employees whose salary is between 5000 and 10000
SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

-- 9. Retrieve employees whose first name has "v" as the fourth character
SELECT * FROM employees
WHERE firstName LIKE "___v%";

-- 10. Retrieve employees who work in either "Software Engineering" or "Database Management"
SELECT * FROM employees
WHERE department IN ("Software Engineering", "Database Management");

-- 11. Retrieve 5 rows, skipping the first 4 rows
SELECT * FROM employees
LIMIT 5 OFFSET 4;

-- 12. Retrieve employees whose position is NULL
SELECT * FROM employees
WHERE position IS NULL;

-- 13. Retrieve employees who do not work in the "Business Intelligence" department
SELECT * FROM employees
WHERE NOT department = "Business Intelligence";

-- ALTERING TABLE STRUCTURE --

-- 1. Add a new column to the table
ALTER TABLE employees
ADD COLUMN dateOfEmployment DATE AFTER contact;

-- 2. Change column name (example: changing "contact" to "email")
ALTER TABLE employees
CHANGE COLUMN contact email VARCHAR(100);

-- DELETING DATA IN THE TABLE --

-- 1. Delete specific employee data by ID
DELETE FROM employees
WHERE employeeID = 101567;

-- UPDATING DATA IN THE TABLE --

-- Note: To update records, you may need to disable safe update mode:
-- SET SQL_SAFE_UPDATES = 0;

-- 1. Update salary for all Developers
UPDATE employees
SET salary = 9500
WHERE position = "Developer";

-- 2. Multiple updates at the same time
UPDATE employees
SET salary = 9300
WHERE employeeID IN (042580, 098827);

-- RETRIEVING DATA IN ORDER --

-- 1. Order employees by first name in descending order, Z-A or Highest to lowest for INT
SELECT * FROM employees
ORDER BY firstName DESC;

-- 2. Order employees by employeeID in ascending order, A-Z or Lowest to highest for INT
SELECT * FROM employees
ORDER BY employeeID ASC;

-- 3. Retrieve unique positions
SELECT DISTINCT position
FROM employees;

-- USING GROUP BY AND HAVING CLAUSES --

-- 1. Group employees by position and calculate total salary for each position
SELECT position, SUM(salary) AS TotalSalary
FROM employees
GROUP BY position;

-- 2. Retrieve departments with more than one employee in each position
SELECT department, position, COUNT(*) AS NumberOfEmployees
FROM employees
GROUP BY department, position
HAVING COUNT(*) > 1;

-- AGGREGATE FUNCTIONS --

-- 1. COUNT - Count the number of rows
SELECT COUNT(*) AS totalEmployees
FROM employees;

-- 2. MIN - Find the minimum salary
SELECT MIN(salary) AS MinSalary
FROM employees;

-- 3. MAX - Find the maximum salary
SELECT MAX(salary) AS MaxSalary
FROM employees;

-- 4. SUM - Calculate the total salary
SELECT SUM(salary) AS TotalSalary
FROM employees;

-- 5. AVG - Calculate the average salary
SELECT AVG(salary) AS AvgSalary
FROM employees;

-- USING COMPARISON OPERATORS --

-- 1. Retrieve employees with a salary greater than 10000
SELECT * FROM employees
WHERE salary > 10000;

-- 2. Retrieve employees with a salary less than 10000
SELECT * FROM employees
WHERE salary < 10000;

-- 3. Retrieve employees with a salary greater than or equal to 10000
SELECT * FROM employees
WHERE salary >= 10000;

-- 4. Retrieve employees with a salary less than or equal to 10000
SELECT * FROM employees
WHERE salary <= 10000;

-- 5. Retrieve employees whose salary is not 9000
SELECT * FROM employees
WHERE salary <> 9000;

-- USING IS NOT NULL -- 

-- 1. Retrieve employees whose position is not NULL
SELECT * FROM employees
WHERE position IS NOT NULL;

-- USING NOT IN --

-- 1. Retrieve employees who are not Developers or Testers
SELECT * FROM employees
WHERE position NOT IN ("Developer", "Tester");

-- USING ALIASES --

-- 1. Rename a column in the result
SELECT firstName AS FirstName
FROM employees;

-- 2. Rename multiple columns in the result
SELECT firstName AS FirstName, lastName AS LastName, salary AS Salary
FROM employees;

-- USING MULTIPLE CONDITIONS --

-- 1. Retrieve Developers with a salary greater than 9000
SELECT * FROM employees
WHERE position = "Developer" AND salary > 9000;

-- 2. Retrieve employees who are Developers or Leads
SELECT * FROM employees
WHERE position = "Developer" OR position = "Lead";

-- 3. Retrieve employees who are not Developers
SELECT * FROM employees
WHERE NOT position = "Developer";

-- USING ORDER BY WITH MULTIPLE COLUMNS --

-- 1. Order employees by department and then by salary
SELECT * FROM employees
ORDER BY department ASC, salary DESC;

-- USING DISTINCT WITH MULTIPLE COLUMNS

-- 1. Retrieve unique combinations of position and department
SELECT DISTINCT position, department
FROM employees;

-- USING STRING FUNCTIONS -- 

-- 1. Convert first names to uppercase
SELECT UPPER(firstName) AS FirstName
FROM employees;

-- 2. Convert first names to lowercase
SELECT LOWER(firstName) AS FirstName
FROM employees;

-- 3. Combine first name and last name
SELECT CONCAT(firstName, " ", lastName) AS FullName
FROM employees;

-- USING MATHEMATICAL OPERATIONS --

-- 1. Add 1000 to the salary
SELECT firstName, salary, salary + 1000 AS NewSalary
FROM employees;

-- 2. Subtract 1000 from the salary
SELECT firstName, salary, salary - 1000 AS NewSalary
FROM employees;

-- 3. Multiply salary by 12 to calculate yearly salary
SELECT firstName, salary, salary * 12 AS YearlySalary
FROM employees;

-- 4. Divide salary by 2
SELECT firstName, salary, salary / 2 AS HalfSalary;

-- USING CASE --

-- 1. Categorize employees based on their salary
SELECT firstName, lastName, salary,
    CASE
        WHEN salary >= 15000 THEN "High Salary"
        WHEN salary >= 10000 THEN "Medium Salary"
        WHEN salary < 10000 THEN "Low Salary"
        ELSE "No Salary"
    END AS SalaryCategory
FROM employees;

-- USING COALESCE --

-- 1. Replace NULL position with "No Position"
SELECT firstName, lastName,
    COALESCE(position, "No Position") AS position
FROM employees;

-- 2. Replace NULL salary with 0
SELECT firstName, lastName,
    COALESCE(salary, 0) AS salary
FROM employees;

-- USING JOINS --

-- 1. INNER JOIN - Returns matching records from both tables
-- Example:
SELECT *
FROM employees
INNER JOIN departments
ON employees.department = departments.departmentName;

-- 2. LEFT JOIN - Returns all records from the left table
SELECT *
FROM employees
LEFT JOIN departments
ON employees.department = departments.departmentName;

-- 3. RIGHT JOIN - Returns all records from the right table
SELECT *
FROM employees
RIGHT JOIN departments
ON employees.department = departments.departmentName;
