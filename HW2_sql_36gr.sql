	------- Таблица employees -------

/* 1.	Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null */

	CREATE TABLE employees (
		id SERIAL PRIMARY KEY,
		employee_name VARCHAR(50) NOT null
	);

	SELECT * FROM employees;

/* 2.	Наполнить таблицу employee 70 строками. */

	INSERT INTO employees (employee_name)
	VALUES  ('Jennifer King'),
			('Daniel Morris'),
			('Sean Martin'),
			('Jerome Davis'),
			('Joanne Smith'),
			('Emily Lawrence'),
			('Ralph Boyd'),
			('Nellie Joseph'),
			('Arnold White'),
			('Mary Bradley'),
			('Helen Henderson'),
			('Daniel Thompson'),
			('Maria Roberson'),
			('Minnie Keller'),
			('Roger Hall'),
			('Angela Murphy'),
			('Robert Johnson'),
			('Carol Davis'),
			('Kelly Bell'),
			('Mabel White'),
			('Martha Brown'),
			('Randy Barber'),
			('Agnes Jordan'),
			('Juanita Patterson'),
			('Albert Martin'),
			('Ana Garrett'),
			('Lena Wells'),
			('Rebecca Fuller'),
			('William Lee'),
			('Adam Alexander'),
			('Scott Powers'),
			('Diana Smith'),
			('Jessie Thomas'),
			('Andrea Thompson'),
			('Sara Walker'),
			('George Smith'),
			('Felicia Griffin'),
			('John Williams'),
			('Larry Klein'),
			('Brian Williams'),
			('Manuel Brown'),
			('Ruben Mitchell'),
			('Kimberly Smith'),
			('Zachary Gordon'),
			('Karl Clark'),
			('Martin Griffin'),
			('Joseph Newton'),
			('Judy Jackson'),
			('Steven Powell'),
			('James Castro'),
			('Jennifer Jordan'),
			('Joan Fuller'),
			('Angela Johnson'),
			('David Gonzales'),
			('Tony Owens'),
			('Debra Coleman'),
			('Richard McDaniel'),
			('Evelyn Neal'),
			('Carlos Davis'),
			('Marilyn Pena'),
			('Philip Berry'),
			('Patricia Perez'),
			('Clara Williams'),
			('Albert Coleman'),
			('Lisa Butler'),
			('Judy Herrera'),
			('David Lynch'),
			('Michael Castro'),
			('Willie Bailey'),
			('Bruce Evans');
	
	SELECT * FROM employees;

--------------------------------------------------------------------------------------------
	------- Таблица salary -------

/* 3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null */

	CREATE TABLE salary (
		id SERIAL PRIMARY KEY,
		monthly_salary INT NOT NULL
	);
	
	SELECT * FROM salary;

/* 4. Наполнить таблицу salary 15 строками: */

	INSERT INTO salary (monthly_salary)
	VALUES  (1000),
			(1100),
			(1200),
			(1300),
			(1400),
			(1500),
			(1600),
			(1700),
			(1800),
			(1900),
			(2000),
			(2100),
			(2200),
			(2300),
			(2400),
			(2500);


--------------------------------------------------------------------------------------------
	------- Таблица employee_salary -------

/* 5. Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null */

	CREATE TABLE employee_salary (
		id SERIAL PRIMARY KEY,
		employee_id INT NOT NULL UNIQUE,
		salary_id INT NOT NULL
	);
	
	SELECT * FROM employee_salary;
	
	
/* 6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id */

	INSERT INTO employee_salary (employee_id, salary_id)
	VALUES  (1, 3),
			(2, 5),
			(3, 1),
			(4, 7),
			(5, 12),
			(6, 2),
			(7, 3),
			(8, 6),
			(9, 2),
			(10, 1),
			(11, 13),
			(12, 7),
			(13, 4),
			(14, 9),
			(15, 3),
			(16, 10),
			(17, 2),
			(18, 6),
			(19, 8),
			(20, 5),
			(21, 9),
			(22, 2),
			(23, 14),
			(24, 7),
			(25, 3),
			(26, 5),
			(27, 8),
			(28, 12),
			(29, 1),
			(30, 6),
			(71, 4),
			(72, 1),
			(73, 15),
			(74, 6),
			(75, 8),
			(76, 10),
			(77, 3),
			(78, 5),
			(79, 3),
			(80, 7);

	SELECT * FROM employee_salary;
		

--------------------------------------------------------------------------------------------
------- Таблица roles -------

/* 7. Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique */
	
	 CREATE TABLE roles (
		id SERIAL PRIMARY KEY,
		role_name INT NOT NULL UNIQUE
	);

	
/* 8. Поменять тип столба role_name с int на varchar(30) */

	ALTER TABLE roles ALTER COLUMN role_name TYPE VARCHAR(30);
	
	
/* 9. Наполнить таблицу roles 20 строками: */

	INSERT INTO roles (role_name)
	VALUES  ('Junior Python developer'),
			('Middle Python developer'),
			('Senior Python developer'),
			('Junior Java developer'),
			('Middle Java developer'),
			('Senior Java developer'),
			('Junior JavaScript developer'),
			('Middle JavaScript developer'),
			('Senior JavaScript developer'),
			('Junior Manual QA engineer'),
			('Middle Manual QA engineer'),
			('Senior Manual QA engineer'),
			('Project Manager'),
			('Designer'),
			('HR'),
			('CEO'),
			('Sales manager'),
			('Junior Automation QA engineer'),
			('Middle Automation QA engineer'),
			('Senior Automation QA engineer');
			
		
--------------------------------------------------------------------------------------------
