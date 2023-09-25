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

/* Задание 25
Определить, какие товары НЕ покупались в 2005 году */
SELECT good_name
FROM Goods
WHERE good_id NOT IN (SELECT good FROM Payments
                        WHERE YEAR(date) = 2005);


/* Задание 26
Определить группы товаров, которые не приобретались в 2005 году */
SELECT good_type_name
FROM GoodTypes
WHERE good_type_id NOT IN (SELECT type FROM Goods
                            JOIN Payments
                                ON Goods.good_id = Payments.good
                            WHERE YEAR(date) = 2005);


/* Задание 27
Узнать, сколько потрачено на каждую из групп товаров в 2005 году. Вывести название группы и сумму */
SELECT good_type_name, SUM(amount*unit_price ) AS costs
FROM GoodTypes
JOIN Goods
    ON GoodTypes.good_type_id = Goods.type
JOIN Payments
    ON Goods.good_id = Payments.good
WHERE YEAR(date) = 2005
GROUP BY good_type_name;


/* Задание 28
Сколько рейсов совершили авиакомпании из Ростова (Rostov) в Москву (Moscow) ? */
SELECT COUNT(*) AS count
FROM trip
WHERE town_from = 'Rostov' AND town_to = 'Moscow';


/* Задание 29
Выведите имена пассажиров улетевших в Москву (Moscow) на самолете TU-134 */
SELECT DISTINCT name
FROM Passenger
JOIN Pass_in_trip
    ON Passenger.id = Pass_in_trip.passenger
JOIN trip
    ON Pass_in_trip.trip = Trip.id
WHERE plane = 'TU-134' AND town_to = 'Moscow';

/* Задание 30
Выведите нагруженность (число пассажиров) каждого рейса (trip). Результат вывести в отсортированном виде по убыванию нагруженности. */
SELECT trip, COUNT(passenger) AS count 
FROM Pass_in_trip
GROUP BY trip
ORDER BY count DESC;

/* Задание 31
Вывести всех членов семьи с фамилией Quincey. */
SELECT * FROM FamilyMembers
WHERE member_name LIKE '%Quincey';

/* Задание 32
Вывести средний возраст людей (в годах), хранящихся в базе данных. 
Результат округлите до целого в меньшую сторону. */
SELECT floor(AVG(TIMESTAMPDIFF(YEAR, birthday, NOW()))) AS age
FROM FamilyMembers;

/* Задание 33
Найдите среднюю стоимость икры. В базе данных хранятся данные о покупках 
красной (red caviar) и черной икры (black caviar). */
SELECT AVG(unit_price) AS cost
FROM Payments
JOIN Goods
    ON Payments.good = Goods.good_id
WHERE good_name = 'red caviar' OR good_name = 'black caviar';

/* Задание 34
Сколько всего 10-ых классов */
SELECT COUNT(name) AS count
FROM Class
WHERE name LIKE '10%';

/* Задание 35
Сколько различных кабинетов школы использовались 2.09.2019 в образовательных целях? */
SELECT DISTINCT COUNT(classroom) AS count
FROM Schedule
WHERE date = '2019-09-02T00:00:00.000Z';

/* Задание 36
Выведите информацию об обучающихся живущих на улице Пушкина (ul. Pushkina)? */
SELECT * FROM Student
WHERE address LIKE '%ul. Pushkina%'

/* Задание 37
Сколько лет самому молодому обучающемуся? */
SELECT MIN(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS year
FROM Student;

/* Задание 38
Сколько Анн (Anna) учится в школе? */
SELECT COUNT(first_name) AS count
FROM Student
WHERE first_name = 'Anna';

/* Задание 39
Сколько обучающихся в 10 B классе? */
SELECT COUNT(student) AS count
FROM Student_in_class
JOIN Class
    ON Student_in_class.class = Class.id
WHERE name = '10 B';

/* Задание 40
Выведите название предметов, которые преподает Ромашкин П.П. (Romashkin P.P.)? */
SELECT name  AS subjects
FROM Subject
JOIN Schedule
    ON Subject.id = Schedule.subject
JOIN Teacher
    ON Schedule.teacher = Teacher.id
WHERE Teacher.last_name = 'Romashkin'
	AND Teacher.first_name LIKE 'P%'
	AND Teacher.middle_name LIKE 'P%';

/* Задание 41
Во сколько начинается 4-ый учебный предмет по расписанию? */
SELECT start_pair FROM Timepair
WHERE id = 4

/* Задание 42
Сколько времени обучающийся будет находиться в школе, учась со 2-го по 4-ый уч. предмет? */
SELECT DISTINCT TIMEDIFF(
                (SELECT end_pair FROM Timepair WHERE id = 4),
                (SELECT start_pair FROM Timepair WHERE id = 2)
                ) AS time
FROM Timepair;

/* Задание 43
Выведите фамилии преподавателей, которые ведут физическую культуру (Physical Culture). 
Отcортируйте преподавателей по фамилии. */
SELECT last_name
FROM Teacher
JOIN Schedule
    ON Teacher.id = Schedule.teacher
JOIN Subject
    ON Schedule.subject = Subject.id
WHERE name =  'Physical Culture'
ORDER BY last_name;

/* Задание 44
Найдите максимальный возраст (колич. лет) среди обучающихся 10 классов? */
SELECT MAX(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS max_year
FROM Student
JOIN Student_in_class
    ON Student.id = Student_in_class.student
JOIN class
    ON Student_in_class.class = Class.id
WHERE Class.name LIKE '10%';




/* Задание 46
В каких классах введет занятия преподаватель "Krauze"? */
SELECT DISTINCT name FROM Class
JOIN Schedule
    ON Class.id = Schedule.class
JOIN Teacher
    ON Schedule.teacher = Teacher.id
WHERE Teacher.last_name = 'Krauze';


/* Задание 47
Сколько занятий провел Krauze 30 августа 2019 г.? */
SELECT COUNT(*) AS count
FROM Schedule
JOIN Teacher
    ON Schedule.teacher = Teacher.id
WHERE Schedule.date = '2019-08-30T00:00:00.000Z'
AND Teacher.last_name = 'Krauze';

/* Задание 48
Выведите заполненность классов в порядке убывания */
SELECT name, COUNT(student) AS count
FROM Class
JOIN Student_in_class
    ON Class.id = Student_in_class.class
GROUP BY name
ORDER BY count DESC;

/* Задание 49
Какой процент обучающихся учится в 10 A классе? */
SELECT COUNT(student) *100 /
(SELECT COUNT(student) FROM Student_in_class)
AS percent
FROM Student_in_class
JOIN Class
    ON Student_in_class.class = Class.id
WHERE Class.name = '10 A';


/* Задание 50
Какой процент обучающихся родился в 2000 году? 
Результат округлить до целого в меньшую сторону. */
SELECT FLOOR(COUNT(id)*100/(SELECT COUNT(id) FROM Student)) AS percent
FROM Student
WHERE YEAR(birthday) = 2000;

-- 2nd version:
SELECT FLOOR(COUNT(id)*100/(SELECT COUNT(id) FROM Student)) AS percent
FROM Student
WHERE birthday LIKE '2000%';

-- 3rd version:
SELECT FLOOR(COUNT(id)*100/(SELECT COUNT(id) FROM Student)) AS percent
FROM Student
WHERE birthday BETWEEN '2000-01-01T00:00:00.000Z' AND '2000-12-31T23:59:59.000Z';



/* Задание 51
Добавьте товар с именем "Cheese" и типом "food" в список товаров (Goods).
В качестве первичного ключа (good_id) укажите количество записей в таблице + 1. */
INSERT INTO Goods (good_id, good_name, type)
VALUES (17, 'Cheese', 2);

/* Задание 52
Добавьте в список типов товаров (GoodTypes) новый тип "auto". */
INSERT INTO GoodTypes (good_type_id, good_type_name)
VALUES (9, 'auto');


/* Задание 53
Измените имя "Andie Quincey" на новое "Andie Anthony". */
UPDATE FamilyMembers
SET member_name = 'Andie Anthony'
WHERE member_name = 'Andie Quincey';


/* Задание 54
Удалить всех членов семьи с фамилией "Quincey". */
DELETE FROM FamilyMembers
WHERE member_name LIKE '%Quincey';




/* Задание 56
Удалить все перелеты, совершенные из Москвы (Moscow). */
DELETE FROM Trip
WHERE town_from = 'Moscow';

/* Задание 57
Перенести расписание всех занятий на 30 мин. вперед. */
UPDATE Timepair 
SET start_pair = start_pair + INTERVAL 30 MINUTE,
    end_pair = end_pair + INTERVAL 30 MINUTE;
	

/* Задание 59
Вывести пользователей, указавших, белорусский номер телефона. 
Телефонный код Белоруссии +375. */
SELECT * FROM Users
WHERE phone_number LIKE '+375%';



/* Задание 61
Выведите список комнат, которые были зарезервированы в течение 12 недели 2020 года. */
SELECT DISTINCT Rooms.*
FROM Rooms
JOIN Reservations 
    ON Rooms.id = Reservations.room_id
WHERE WEEK(start_date, 1) = 12
	AND YEAR(start_date) = 2020;
	





