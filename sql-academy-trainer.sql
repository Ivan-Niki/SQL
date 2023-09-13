/* Задание 1
Вывести имена всех людей, которые есть в базе данных авиакомпаний */
SELECT name FROM passenger;

/* Задание 2
Вывести названия всеx авиакомпаний */
SELECT name FROM company;

/* Задание 3
Вывести все рейсы, совершенные из Москвы */
SELECT * FROM trip
WHERE town_from = 'Moscow';

/* Задание 4
Вывести имена людей, которые заканчиваются на "man" */
SELECT name FROM passenger
WHERE name LIKE '%man';

/* Задание 5
Вывести количество рейсов, совершенных на TU-134 */
SELECT COUNT(*) AS count
FROM trip
WHERE plane = 'TU-134';

/* Задание 6
Какие компании совершали перелеты на Boeing */
SELECT DISTINCT name
FROM company INNER JOIN trip
ON company.id = trip.company
WHERE plane = 'Boeing'

/* Задание 7
Вывести все названия самолётов, на которых можно улететь в Москву (Moscow) */
SELECT DISTINCT plane FROM trip
WHERE town_to = 'Moscow'


/* Задание 8
В какие города можно улететь из Парижа (Paris) и сколько времени это займёт? */
