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
HAVING COUNT(*) > 1

/* Задание 14
В какие города летал Bruce Willis */
SELECT town_to
FROM trip
JOIN pass_in_trip 
	ON trip.id = pass_in_trip.trip
JOIN passenger 
	ON pass_in_trip.passenger = passenger.id
WHERE name = 'Bruce Willis'

/* Задание 15
Выведите дату и время прилёта пассажира Стив Мартин (Steve Martin) в Лондон (London) */
SELECT time_in
FROM trip
JOIN pass_in_trip 
	ON trip.id = pass_in_trip.trip
JOIN passenger 
	ON pass_in_trip.passenger = passenger.id
WHERE name = 'Steve Martin' AND town_to = 'London'


/* Задание 16
Вывести отсортированный по количеству перелетов (по убыванию) и имени (по возрастанию) список пассажиров, совершивших хотя бы 1 полет. */
SELECT name, COUNT(*) AS count
FROM passenger
JOIN pass_in_trip
    ON passenger.id = pass_in_trip.passenger
GROUP BY passenger
HAVING count > 0
ORDER BY count DESC, name;

/* Задание 17
Определить, сколько потратил в 2005 году каждый из членов семьи. В результирующей выборке не выводите тех членов семьи, которые ничего не потратили. */
SELECT member_name, status, SUM(amount*unit_price ) AS costs
FROM FamilyMembers
JOIN Payments
ON FamilyMembers.member_id = Payments.family_member
WHERE date BETWEEN '2005-01-01T00:00:00.000Z' AND '2005-12-31T00:00:00.000Z'
GROUP BY member_name, status
HAVING costs > 0


/* Задание 18
Узнать, кто старше всех в семьe */
SELECT member_name
FROM FamilyMembers
ORDER BY birthday
LIMIT 1

/* Задание 19
Определить, кто из членов семьи покупал картошку (potato) */
SELECT DISTINCT status
FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN goods ON Payments.good = Goods.good_id
WHERE good_name = 'potato'

/* Задание 20
Сколько и кто из семьи потратил на развлечения (entertainment). Вывести статус в семье, имя, сумму */
SELECT status, member_name, SUM(amount*unit_price) AS costs
FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN Goods ON Payments.good = Goods.good_id
JOIN GoodTypes ON Goods.type = GoodTypes.good_type_id
WHERE good_type_name = 'entertainment'
GROUP BY status, member_name

/* Задание 21
Определить товары, которые покупали более 1 раза */
SELECT good_name
FROM Goods JOIN Payments
ON Goods.good_id = Payments.good
GROUP BY good
HAVING COUNT(good) > 1

/* Задание 22
Найти имена всех матерей (mother) */
SELECT member_name FROM FamilyMembers
WHERE status = 'mother'

/* Задание 23
Найдите самый дорогой деликатес (delicacies) и выведите его цену */
SELECT good_name, unit_price
FROM Goods
JOIN Payments
    ON Goods.good_id = Payments.good
JOIN GoodTypes
    ON Goods.type = GoodTypes.good_type_id
WHERE good_type_name = 'delicacies'
ORDER BY unit_price DESC
LIMIT 1


/* Задание 23 - вторая версия (с использованием подзапроса) */
SELECT good_name, unit_price
FROM Goods
JOIN Payments
    ON Goods.good_id = Payments.good
JOIN GoodTypes
    ON Goods.type = GoodTypes.good_type_id
WHERE unit_price = (SELECT MAX(unit_price)
						FROM Payments
						JOIN Goods ON Goods.good_id = Payments.good
						JOIN GoodTypes ON Goods.type = GoodTypes.good_type_id
						WHERE GoodTypes.good_type_name = 'delicacies');

/* Задание 24
Определить кто и сколько потратил в июне 2005 */
SELECT member_name, SUM(unit_price * amount ) AS costs
FROM FamilyMembers
JOIN Payments
    ON FamilyMembers.member_id = Payments.family_member
WHERE date BETWEEN '2005-06-01T00:00:00.000Z' AND '2005-06-30T00:00:00.000Z'
GROUP BY member_name

