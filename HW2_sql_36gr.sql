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