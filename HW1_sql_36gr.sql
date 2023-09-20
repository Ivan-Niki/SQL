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

/* 11. Вывести пользователей, где в имени в конце есть 8 */
SELECT name FROM students
WHERE name LIKE '%8';

/* 12. Вывести пользователей, где в имени есть буква а */
SELECT name FROM students
WHERE name LIKE '%a%';

/* 13. Вывести пользователей, которые были созданы 2021-07-12 00:00:00 */
SELECT name FROM students
WHERE created_on = '2021-07-12 00:00:00';

/* 14. Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313 */
SELECT name FROM students
WHERE created_on = '2021-07-12 00:00:00' AND password = '1m313';

/* 15. Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey */
SELECT name FROM students
WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%Andrey%';

/* 16. Вывести пользователей, которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8 */
SELECT name FROM students
WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%8%';

/* 17. Вывести пользователя, у которого id равен 110 */
SELECT name FROM students
WHERE id = 110;

/* 18. Вывести пользователя, у которого id равен 153 */
SELECT name FROM students
WHERE id = 153;

/* 19. Вывести пользователей, у которых id больше 140 */
SELECT name FROM students
WHERE id > 140;

/* 20. Вывести пользователей, у которых id меньше 130 */
SELECT name FROM students
WHERE id < 130;

/* 21. Вывести пользователей, у которых id меньше 127 или больше 188 */
SELECT name, id FROM students
WHERE id < 127 OR id > 188;

/* 22. Вывести пользователей, у которых id меньше либо равно 137 */
SELECT name, id FROM students
WHERE id <= 137;

/* 23. Вывести пользователей, у которых id больше либо равно 137 */
SELECT name, id FROM students
WHERE id >= 137;
 
/* 24. Вывести пользователей, у которых id больше 180, но меньше 190 */
SELECT name, id FROM students
WHERE id > 180 AND id < 190;

/* 25. Вывести пользователей, у которых id между 180 и 190 */
SELECT name, id FROM students
WHERE id BETWEEN 180 AND 190;

/* 26. Вывести пользователей, где password равен 12333, 1m313, 123313 */
SELECT name FROM students
WHERE password IN ('12333', '1m313', '123313');

/* 27. Вывести пользователей, где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00 */
SELECT name FROM students
WHERE created_on IN ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

/* 28. Вывести минимальный id */
SELECT MIN(id) FROM students;

/* 29. Вывести максимальный id */
SELECT MAX(id) FROM students;

/* 30. Вывести количество пользователей */
SELECT COUNT(*) FROM students;

/* 31. Вывести id пользователя, имя, дату создания пользователя. 
Отсортировать по порядку возрастания даты добавления пользователя. */
SELECT id, name, created_on
FROM students
ORDER BY created_on;

/* 32. Вывести id пользователя, имя, дату создания пользователя. 
Отсортировать по порядку убывания даты добавления пользователя. */
SELECT id, name, created_on
FROM students
ORDER BY created_on DESC;
