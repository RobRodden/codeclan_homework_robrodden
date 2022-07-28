/*
* Q1
*/

SELECT 
count(id)
FROM employees
WHERE salary IS NULL AND grade IS NULL

/*
* Q2
*/

SELECT 
concat (first_name , ' ', last_name) AS employees_full_name,
department 
FROM employees
ORDER BY department ASC NULLS LAST , last_name ASC NULLS LAST 

/*
* Q3
*/

SELECT 
salary,
last_name
FROM employees
WHERE last_name LIKE 'A%'
ORDER BY salary DESC NULLS LAST 
LIMIT 10

/*
* Q4
*/

SELECT
count(id) AS numbeer_of_employees_started_2003,
department 
FROM employees
WHERE start_date BETWEEN  '2003-01-01' AND '2003-12-31'
GROUP BY department
ORDER BY department ASC;

/*
* Q5
*/

SELECT
department,
fte_hours,
count(id) AS number_of_employees_fte_hours
FROM employees
GROUP BY fte_hours, department 
ORDER BY department ASC ,fte_hours asc;

/*
* Q6
*/

SELECT
count(id),
pension_enrol 
FROM employees 
GROUP BY pension_enrol  
ORDER BY count DESC , pension_enrol ;

-- alternative shared by other member of lab team

SELECT 
	count(id) AS pension_count,
	pension_enrol 
FROM 
	employees 
WHERE
	pension_enrol IS TRUE OR 
	pension_enrol IS FALSE OR 
	pension_enrol IS NULL
GROUP BY 
	pension_enrol
ORDER BY 
	pension_enrol;

/*
* Q7
*/


SELECT *
FROM employees 
WHERE department = 'Accounting' AND pension_enrol IS FALSE 
ORDER BY salary DESC NULLS LAST , first_name , last_name, pension_enrol 
LIMIT 1;

-- alternative shared by other member of lab team

SELECT 
	*
FROM 
	employees 
WHERE 
	department = 'Accounting' AND 
	pension_enrol IS FALSE
ORDER BY
	salary DESC NULLS LAST
LIMIT 1;

/*
* Q8
*/


SELECT 
country ,
count(id) AS number_of_employees,
round(avg(salary), 2) AS average_salary
FROM employees
GROUP BY country 
HAVING count(id) > 30
ORDER BY average_salary DESC;

/*
* Q9
*/

SELECT 
first_name,
last_name,
fte_hours,
salary,
fte_hours * salary AS effective_yearly_salary
FROM employees 
WHERE fte_hours * salary > 30000
ORDER BY effective_yearly_salary ASC

/*
* Q10
*/

SELECT *
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id 
WHERE t."name" = 'Data Team 1' OR t."name" = 'Data Team 2'
ORDER BY last_name 

/*
* Q11
*/

-- working formula to help me
SELECT *
FROM pay_details 

-- answer

SELECT
e.first_name,
e.last_name,
local_tax_code
FROM employees AS e
RIGHT JOIN pay_details AS pd ON e.id = pd.id 
WHERE pd.local_tax_code IS NULL
ORDER BY last_name ;

/*
* Q12
*/

-- working info
SELECT *
FROM employees 

SELECT *
FROM teams 

-- answer

SELECT 
e.id,
e.first_name,
e.last_name,
e.fte_hours,
e.salary,
t."name",
t.charge_cost,
((48 * 35 * CAST(t.charge_cost AS integer) - e.salary) * e.fte_hours) AS expected_profit
FROM employees AS e
LEFT JOIN teams AS t ON e.team_id = t.id
ORDER BY expected_profit DESC 



