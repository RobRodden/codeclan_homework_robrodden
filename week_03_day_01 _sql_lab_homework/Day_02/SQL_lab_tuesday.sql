SELECT * 
FROM employees

/*
 * Q1 
 */

SELECT 
E.first_name,
E.last_name,
T.name
FROM employees AS E
INNER JOIN teams AS T ON E.team_id = t.id 

SELECT
E.first_name,
E.last_name,
T.name,
E.pension_enrol 
FROM employees AS E
INNER JOIN teams AS T ON E.team_id = T.id
WHERE e.pension_enrol IS TRUE ;

SELECT
E.first_name,
E.last_name,
T.name,
E.pension_enrol,
t.charge_cost
FROM employees AS E
INNER JOIN teams AS T ON E.team_id = T.id
WHERE (CAST(T.charge_cost AS Integer)) >80
ORDER BY (T.charge_cost, T.name, E.last_name) ;

SELECT
E.first_name,
E.last_name,
T.name AS team_name,
pd.local_account_no ,
pd.local_sort_code 
FROM employees AS E
LEFT JOIN pay_details AS pd ON E.id = pd.id
INNER JOIN teams AS T ON E.team_id = T.id 
ORDER BY (E.last_name) ;

SELECT
E.first_name,
E.last_name,
T.name AS team_name,
pd.local_account_no ,
pd.local_sort_code 
FROM employees AS E
LEFT JOIN pay_details AS pd ON E.id = pd.id
INNER JOIN teams AS T ON E.team_id = T.id 
ORDER BY (T."name" ,E.last_name) ;


SELECT
count(E.id) AS number_of_employees,
T.name AS team_name
FROM employees AS E
LEFT JOIN teams AS T ON E.team_id = T.id 
GROUP BY t.name;

SELECT
count(E.id) AS number_of_employees,
T.name AS team_name
FROM employees AS E
LEFT JOIN teams AS T ON E.team_id = T.id 
GROUP BY t.name
ORDER BY (number_of_employees) ;

SELECT
count(E.id) AS number_of_employees,
T.name,
t.id
FROM employees AS E
LEFT JOIN teams AS T ON E.team_id = T.id 
GROUP BY t.name, t.id
ORDER BY t.name, t.id, number_of_employees ;

SELECT
count(E.id) AS number_of_employees
FROM employees AS E;

SELECT
CAST(T.charge_cost AS Integer) * count(E.id) total_day_charge,
t.name,
t.id
FROM employees AS E
LEFT JOIN teams AS T ON E.team_id = T.id 
GROUP BY t.name, t.id;

SELECT
	count(E.id) * CAST(T.charge_cost AS INTEGER) AS total_day_charge,
	T.name,
	T.id
FROM employees AS E 
LEFT JOIN teams AS T ON E.team_id = T.id
GROUP BY T.name, T.id;

SELECT
	count(E.id) AS employees_count,
	count(E.id) * CAST(T.charge_cost AS INTEGER) AS total_day_charge,
	T.charge_cost, 
	T.name,
	T.id
FROM employees AS E 
LEFT JOIN teams AS T ON E.team_id = T.id
GROUP BY T.name, T.id, T.charge_cost ;

SELECT
Cast(T.charge_cost AS integer)*count(E.id) AS total_day_charge,
T."name",
T.id
FROM employees AS E
LEFT JOIN teams AS T ON E.team_id  = T.id
GROUP BY T."name", T.id 
HAVING (Cast(T.charge_cost AS integer)*count(E.id)) > 5000;


