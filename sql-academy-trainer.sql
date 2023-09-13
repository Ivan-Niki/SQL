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
SELECT town_to, TIMEDIFF(time_in, time_out) AS flight_time
FROM trip
WHERE town_from = 'Paris'

/* Задание 9
Какие компании организуют перелеты из Владивостока (Vladivostok)? */
SELECT name FROM company JOIN trip
ON company.id = trip.company
WHERE town_from = 'Vladivostok'

/* Задание 10
Вывести вылеты, совершенные с 10 ч. по 14 ч. 1 января 1900 г. */
SELECT *
FROM trip
WHERE time_out BETWEEN '1900-01-01T10:00:00.000Z' AND '1900-01-01T14:00:00.000Z'


/* Задание 11
Выведите пассажиров с самым длинным ФИО. Пробелы, дефисы и точки считаются частью имени. */
SELECT name FROM passenger
ORDER BY LENGTH(name) DESC
LIMIT 1

/* Задание 12
Вывести id и количество пассажиров для всех прошедших полётов. */
SELECT trip, COUNT(passenger) AS count
FROM pass_in_trip
GROUP BY trip

/* Задание 13
Вывести имена людей, у которых есть полный тёзка среди пассажиров */
SELECT name
FROM passenger
GROUP BY name
HAVING COUNT(*) > 1;




