
------- 1. Вывести всех работников, чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name, monthly_salary
FROM employees
JOIN employee_salary
	ON employees.id = employee_salary.employee_id
JOIN salary
	ON employee_salary.salary_id = salary.id;


------- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name
FROM employees
JOIN employee_salary
	ON employees.id = employee_salary.employee_id
JOIN salary
	ON employee_salary.salary_id = salary.id
WHERE monthly_salary < 2000;


--- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT salary_id, employee_name, monthly_salary
FROM employee_salary
LEFT JOIN employees
	ON employee_salary.employee_id = employees.id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
--WHERE employee_name is NULL;
	
/* 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) */
SELECT salary_id, employee_name, monthly_salary
FROM employee_salary
LEFT JOIN employees
	ON employee_salary.employee_id = employees.id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
WHERE monthly_salary < 2000;
--WHERE employee_name is NULL;
