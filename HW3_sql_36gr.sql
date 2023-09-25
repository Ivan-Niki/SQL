
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
