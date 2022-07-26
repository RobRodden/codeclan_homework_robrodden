/*
 * Q1
 */

SELECT *
FROM employees 
WHERE (department = 'Human Resources');


/*
 * Q2
 */

SELECT
first_name,
last_name,
country
FROM employees 
WHERE (department = 'Legal');

/*
 * Q3
 */

SELECT 
count(employees) AS number_of_employees
FROM employees 
WHERE (country = 'Portugal'); 

/*
 * Q4
 */

SELECT 
count(employees)
FROM employees 
WHERE (country = 'Portugal') OR (country = 'Spain');

/*
 * Q5
 */

SELECT 
count(*)
FROM pay_details 
WHERE (local_account_no) IS NULL;

/*
 * Q6
 */

SELECT 
local_account_no ,
iban 
FROM pay_details
WHERE local_account_no IS NULL 
AND iban IS NULL;

/*
 * Q7
 */

SELECT 
first_name,
last_name
FROM employees
ORDER BY last_name ASC NULLS LAST;

/*
 * Q8
 */

SELECT 
first_name,
last_name ,
country 
FROM employees 
ORDER BY country ASC NULLS LAST ;

/*
 * Q9
 */

SELECT 
first_name ,
last_name ,
salary 
FROM employees
ORDER BY salary DESC NULLS LAST 
LIMIT 10 ;

/*
 * Q10
 */

SELECT 