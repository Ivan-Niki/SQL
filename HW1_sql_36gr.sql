/* 1. Вывести все поля и все строки. */
SELECT * FROM students;

/* 2. Вывести всех студентов в таблице */
SELECT name FROM students;

/* 3. Вывести только id пользователей */
SELECT id FROM students;

/* 4. Вывести только имя пользователей */
SELECT name FROM students;

/* 5. Вывести только email пользователей */
SELECT email FROM students;

/* 6. Вывести имя и email пользователей */
SELECT name, email FROM students;

/* 7. Вывести id, имя, email и дату создания пользователей */
SELECT id, name, email FROM students;

/* 8. Вывести пользователей, где password 12333 */
SELECT name FROM students
WHERE PASSWORD = '12333';

/* 9. Вывести пользователей, которые были созданы 2021-03-26 00:00:00 */
SELECT name FROM students
WHERE created_on = '2021-03-26 00:00:00';

/* 10. Вывести пользователей, где в имени есть слово Анна */
SELECT name FROM students
WHERE name LIKE '%Анна%';
