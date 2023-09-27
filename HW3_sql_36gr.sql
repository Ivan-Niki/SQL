
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

------- 5. Найти всех работников кому не начислена ЗП.
SELECT employee_name, salary_id, monthly_salary
FROM employees
LEFT JOIN employee_salary
	ON employees.id = employee_salary.employee_id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id

------- 6. Вывести всех работников с названиями их должности.
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
	
------- 7. Вывести имена и должность только Java разработчиков.
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Java developer'


------- 8. Вывести имена и должность только Python разработчиков.
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Python developer%'


------- 9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%QA engineer%'


------- 10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Manual QA engineer%'


------- 11. Вывести имена и должность автоматизаторов QA
SELECT employee_name, role_name
FROM employees
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Automation QA engineer%'


------- 12. Вывести имена и зарплаты Junior специалистов
SELECT employee_name, monthly_salary --role_name
FROM employees
JOIN employee_salary
	ON employees.id = employee_salary.employee_id
JOIN salary
	ON employee_salary.salary_id = salary.id
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Junior%'


------- 13. Вывести имена и зарплаты Middle специалистов
SELECT employee_name, monthly_salary --role_name
FROM employees
JOIN employee_salary
	ON employees.id = employee_salary.employee_id
JOIN salary
	ON employee_salary.salary_id = salary.id
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Middle%'


------- 14. Вывести имена и зарплаты Senior специалистов
SELECT employee_name, monthly_salary --role_name
FROM employees
JOIN employee_salary
	ON employees.id = employee_salary.employee_id
JOIN salary
	ON employee_salary.salary_id = salary.id
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Senior%'


------- 15. Вывести зарплаты Java разработчиков
SELECT monthly_salary --role_name --employee_name
FROM salary
JOIN employee_salary
	ON salary.id = employee_salary.salary_id
JOIN employees
	ON employee_salary.employee_id = employees.id
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Java developer%'


------- 16. Вывести зарплаты Python разработчиков
SELECT monthly_salary --role_name --employee_name
FROM salary
JOIN employee_salary
	ON salary.id = employee_salary.salary_id
JOIN employees
	ON employee_salary.employee_id = employees.id
JOIN roles_employee
	ON employees.id = roles_employee.employee_id
JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Java developer%'


------- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary, role_name -- employees.id
FROM employees
LEFT JOIN employee_salary
	ON employees.id = employee_salary.employee_id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
LEFT JOIN roles_employee
	ON employees.id = roles_employee.employee_id
LEFT JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Junior Python developer%'


------- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary, role_name -- employees.id
FROM employees
LEFT JOIN employee_salary
	ON employees.id = employee_salary.employee_id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
LEFT JOIN roles_employee
	ON employees.id = roles_employee.employee_id
LEFT JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Middle JavaScript developer%'


------- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary, role_name -- employees.id
FROM employees
LEFT JOIN employee_salary
	ON employees.id = employee_salary.employee_id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
LEFT JOIN roles_employee
	ON employees.id = roles_employee.employee_id
LEFT JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Junior Java developer%'


------- 20. Вывести зарплаты Junior QA инженеров
SELECT employee_name, monthly_salary, role_name -- employees.id
FROM employees
LEFT JOIN employee_salary
	ON employees.id = employee_salary.employee_id
LEFT JOIN salary
	ON employee_salary.salary_id = salary.id
LEFT JOIN roles_employee
	ON employees.id = roles_employee.employee_id
LEFT JOIN roles
	ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Junior%QA engineer%'

