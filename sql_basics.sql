/* SELECT */

/* 1. Вывести все столбцы из таблицы superheroes */
SELECT * FROM superheroes;

/* 2. Вывести столбцы name и appearances из таблицы superheroes */
SELECT name, appearances 
FROM superheroes;

/* 3. Псевдонимы столбцов в SELECT. */
/* в результате столбец с именем будет называться в выводе не name, а hero_name */
SELECT name AS hero_name, appearances 
FROM superheroes;


/* 4. Вывести только уникальные значения из столбца align из таблицы superheroes */
SELECT DISTINCT(align) 
FROM superheroes;

/* 5. Ограничение количества извлекаемых строк. Вывести только уникальные значения из столбца hair из таблицы superheroes и ограничить результат только первыми 10-ю строками */
SELECT DISTINCT(hair) 
FROM superheroes
LIMIT 10;

/* ========================================================================== */

/* Data filtration */

/* 6. Указать, какие строки хотим выбрать. Вывести все строки из таблицы superheroes, в которых значение в столбце gender = 'Female Characters' */
SELECT * 
FROM superheroes
WHERE gender = 'Female Characters';


/* 7. Операторы для использования в фильтрах */
/*
    =          --->      Равно
    <>, !=     --->      Неравно
    >          --->      Больше
    >=         --->      Больше или равно
    <          --->      Меньше
    <=         --->      Меньше или равно
    between    --->      Проверка нахождения в указанном диапазоне
    in         --->      Проверка вхождения в список
    like       --->      Проверка строки на соответствие шаблону
*/


/* Использование BETWEEN в WHERE
Вывести все строки из таблицы superheroes, в которых значение в столбце year находится в диапазоне от 2000 до 2005 */
SELECT * 
FROM superheroes
WHERE year BETWEEN 2000 AND 2005;


/* Использование IN в WHERE
Вывести все строки из таблицы superheroes, в которых значение в столбце hair входит в список (перечисление) */
SELECT * 
FROM superheroes
WHERE hair IN ('Strawberry Blond Hair', 'Red Hair', 'Auburn Hair');


/* Использование LIKE в WHERE
LIKE используется для того, чтобы сравнить нужные строки с шаблоном. В шаблонах используются два специальных символа:
% (процент) - любое количество символов (в том числе 0);
_ (нижнее подчеркивание) - обозначает ровно один символ;

Вывести все строки из таблицы superheroes, в которых значение в столбце hair содержит вхождение Blond */
SELECT * 
FROM superheroes
WHERE hair LIKE ('%Blond%');



/* 8. Логические операции для использования в фильтрах с WHERE */
/*
    AND         --->     Логическое И
    OR          --->     Логическое ИЛИ 
    NOT         --->     Логическое НЕ 
*/

/* Использование AND в WHERE
AND будет верным в случае выполнения обоих выражений, которые входят в условие.
/* Вывести все строки из таблицы superheroes, в которых значение в столбце gender = 'Female Characters' и одновременно с этим значение в столбце align = 'Bad Characters' */
SELECT * 
FROM superheroes
WHERE gender = 'Female Characters'
      AND 
	  align = 'Bad Characters';
	  

/* Использование OR в WHERE
OR будет верным в случае выполнения хотя бы одного из выражений, которые входят в условие.
/* Вывести все строки из таблицы superheroes, в которых значение в столбце gender = 'Female Characters' ЛИБО значение в столбце align = 'Bad Characters' */
SELECT * 
FROM superheroes
WHERE hair = 'Red Hair'
 OR hair = 'Strawberry Blond Hair'
 OR hair = 'Auburn Hair';   /* то же самое можно выполнить при помощи IN (см. выше)*/
 
/* Использование NOT в WHERE 
Вывести все строки из таблицы superheroes, в которых значение в столбце hair НЕ ВХОДИТ в список (перечисление) */
SELECT * 
FROM superheroes
WHERE hair NOT IN ('Blond Hair', 'Black Hair', 'Brown Hair', 'Red Hair');


/* ========================================================================== */

/* Sorting of Data (ORDER BY) */

/* 9. Вывести все данные из таблицы superheroes и отсортировать их по столбцу year */
SELECT * 
FROM superheroes
ORDER BY year;

/* Порядок сортировки в ORDER BY */
/*
    ASC  (ascending)    --->   Сортировка по возрастанию
    DESC (descending)   --->   Сортировка по убыванию
    
	по умолчанию применяется сортировка по возрастанию (ASC)
*/


/* Вывести все данные из таблицы superheroes и отсортировать их по столбцу appearances в порядке убываения, т.е. сначала будут идти супергерои, у которых значение в столбце appearances максимальное */
SELECT * 
FROM superheroes
ORDER BY appearances DESC;

/* Можно использовать одновременно и сортировку и фильтры в SELECT */
/* Вывести все данные из таблицы superheroes, в которых значение в столбце align = 'Bad Characters' и отсортировать их по столбцу appearances в порядке убывания */
SELECT * 
FROM superheroes
WHERE align = 'Bad Characters'
ORDER BY appearances DESC;

/* Вывести все данные из таблицы superheroes, в которых значение в столбце align = 'Bad Characters' и одновременно с эти значение в столбце gender = 'Female Characters' и отсортировать их по столбцу appearances в порядке убывания и ограничить количество выводимых строк (5 строк) */
SELECT * 
FROM superheroes
WHERE align = 'Bad Characters'
AND gender = 'Female Characters'
ORDER BY appearances DESC
LIMIT 5;


/* Сортировка по нескольким столбцам */
/* Вывести все данные из таблицы superheroes и отсортировать их по году появления (year), а внутри каждого года по количеству появлений (appearances) в порядке возрастания (по умолчанию) */
SELECT * 
FROM superheroes
ORDER BY year, appearances;


/* ========================================================================== */

/* Creation and Modification (alteration) of tables (CREATE TABLE; ALTER TABLE; ...) */

/* Создать таблицу superheroes с указанными столбцами (список столбцов указывается в скобках, для каждого стобца указывается ИМЯ столбца (например, id, name, hair, eye и т.д.) и ТИП данных для данного столбца (например, INT, VARCHAR и т.д. */
CREATE TABLE superheroes (
	id INT,
	name VARCHAR(100),
	align VARCHAR(30),
	eye VARCHAR(30),
	hair VARCHAR(30),
	gender VARCHAR(30),
	appearances INT,
	year INT,
	universe VARCHAR(10)
)


/* ТИПЫ ДАННЫХ в SQL */

/*
   CHARACTER(n)         (CHAR(n))       --->   Строка фиксированной длины n
   CHARACTER VARYING(n) (VARCHAR(n))    --->   Строка переменной длины, максимальная длина n
   BOOLEAN                              --->   Логический тип данных
   INTEGER (INT)                        --->   Целое число
   NUMERIC(p,s)                         --->   Действительное число (p - количество згачащих цифр,
                                               s - количество цифр после запятой). Хранится точно.
   REAL                                 --->   Действительное число одинарной точности, формат IEEE 754
   DOUBLE PRECISION                     --->   Действительное число двойной точности, формат IEEE 754
   DATE                                 --->   Дата
   TIMESTAMP                            --->   Дата и время
*/


/* ПЕРВИЧНЫЙ КЛЮЧ В ТАБЛИЦЕ (PRIMARY KEY) */
CREATE TABLE superheroes (
	id INT PRIMARY KEY,
	name VARCHAR(100),
	align VARCHAR(30),
	eye VARCHAR(30),
	hair VARCHAR(30),
	gender VARCHAR(30),
	appearances INT,
	year INT,
	universe VARCHAR(10)
)

/* АВТОМАТИЧЕСКОЕ ЗАПОЛНЕНИЕ ПЕРВИЧНОГО КЛЮЧА В ТАБЛИЦЕ (ключевое слово SERIAL) */
/* SERIAL - каждый раз, когда мы вставлем запись в таблицу superheroes, идентификатор будет высчитываться автоматически (будет выбираться следующее значение целого числа (типа INT), которое ранее ещё не использовалось для вставки в таблицу) */
/* Другие базы данных для этой функциональности используют другие ключевые слова (например, в MySQL используется ключевое слово AUTO_INCREMENT */

CREATE TABLE superheroes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	align VARCHAR(30),
	eye VARCHAR(30),
	hair VARCHAR(30),
	gender VARCHAR(30),
	appearances INT,
	year INT,
	universe VARCHAR(10)
)

/* ПРОСМОТР СВЕДЕНИЙ О ТАБЛИЦЕ
В Postgres: \d superheroes; --- для просмотра информации о таблице superheroes в командной строке
В Oracle и MySQL: describe superheroes;
*/

/* УДАЛЕНИЕ ТАБЛИЦ */
/* Удалить таблицу superheroes */
DROP TABLE superheroes;



/* ИЗМЕНЕНИЕ ТАБЛИЦ */

/* Изменить таблицу superheroes */
ALTER TABLE superheroes ADD COLUMN alive BOOLEAN; -- добавить столбец alive с типом данных BOOLEAN

/* Добавить столбец first_appearance с типом данных TIMESTAMP (то есть столбец будет содержать информацию с днём, месяцем и годом) */
ALTER TABLE superheroes ADD COLUMN first_appearance TIMESTAMP;

/* Удалить столбец year */
ALTER TABLE superheroes DROP COLUMN year;

/* Переименовать столбец name в hero_name */
ALTER TABLE superheroes RENAME COLUMN name TO hero_name;

/* Переименовать таблицу superheroes (присвоить ей имя comic_characters)*/
ALTER TABLE superheroes RENAME TO comic_characters;


/* ========================================================================== */

/* Вставка и изменение данных в SQL (INSERT INTO (...) VALUES (...)) */

/* Вставить в таблицу superheroes (перечисляем поля, в которые хотим вставить данные) значения (перечисляем значения) */
INSERT INTO superheroes(name, appearances, universe) 
VALUES ('Spider-Man', 4043, 'marvel');

/* Изменить данные в таблице superheroes для одной строки (идентификатор id=1) */
UPDATE superheroes
SET name='Batman',
	universe='dc'
WHERE id=1;

/* Изменить данные в таблице superheroes для нескольких строк */
UPDATE superheroes
SET gender='Man',
WHERE gender='Male Characters';

/* Удаление данных из таблицы superheroes (удалить одну строку по id)*/
DELETE FROM superheroes
WHERE id=2;

/* Удаление данных из таблицы superheroes (удалить несколько строк по фильтру)*/
DELETE FROM superheroes
WHERE gender='Male Characters';

/* Удаление всех данных из таблицы superheroes */
DELETE FROM superheroes;


/* ========================================================================== */
/* АГРЕГАТНЫЕ ФУНКЦИИ */
/* Агрегатные функции используются совместно с группировкой */

/* Вывести группы супергероев по типу (align) и для каждой группы подсчитать общее количество супергероев в группе */
SELECT align, COUNT(*)
FROM superheroes
GROUP BY align;

/* АГРЕГАТНЫЕ ФУНКЦИИ В SQL */

/*
    COUNT(ключ)          --->     Количество элементов в заданной группе
	SUM(столбец)         --->     Сумма значений в заданной группе - только для числовых данных
	AVG(столбец)         --->     Среднее по заданным значениям в группе - только для числовых данных
    MAX(столбец)         --->     Максимальное значение в группе - только для числовых данных и дат
	MIN(столбец)         --->     Минимальное значение - только для числовых данных и дат
	
*/

/* Вывести группы супергероев по типу (align) и для каждой группы подсчитать общее количество супергероев в группе, а также сумму появлений супергероев этой группы  */
SELECT align, COUNT(*), SUM(appearances)
FROM superheroes
GROUP BY align;

/* Вывести группы супергероев по типу (align) и для каждой группы подсчитать общее количество супергероев в группе, а также среднее значение появлений супергероев этой группы  */
SELECT align, COUNT(*), AVG(appearances)
FROM superheroes
GROUP BY align;

/* Вывести группы супергероев по годам (year) и для каждой группы подсчитать минимальное количество появлений (appearances) супергероев в группе, а также максимальное количество появлений (appearances) супергероев этой группы  */
SELECT year, MIN(appearances), MAX(appearances)
FROM superheroes
GROUP BY year;

/* Вывести группы супергероев по годам (year) и для каждой группы подсчитать минимальное количество появлений (appearances) супергероев в группе, а также максимальное количество появлений (appearances) супергероев этой группы, а также отсортировать по годам в порядке убывания  */
SELECT year, MIN(appearances), MAX(appearances)
FROM superheroes
GROUP BY year
ORDER BY year DESC;

/* Вывести группы супергероев по годам (year) и для каждой группы подсчитать минимальное количество появлений (appearances) супергероев в группе, а также максимальное количество появлений (appearances) супергероев этой группы, а также отсортировать по столбцу со значениями MAX в порядке убывания  */
SELECT year, MIN(appearances), MAX(appearances)
FROM superheroes
GROUP BY year
ORDER BY MAX(appearances) DESC;


/* Использование Alias */
/* Вывести группы супергероев по годам (year) и для каждой группы подсчитать минимальное количество появлений (appearances) супергероев в группе, а также максимальное количество появлений (appearances) супергероев этой группы (как max_appear), а также отсортировать по столбцу со значениями MAX в порядке убывания, и ограничить количество выдаваемых строк 5-ю */
SELECT year, MIN(appearances), 
	MAX(appearances) AS max_appear
FROM superheroes
GROUP BY year
ORDER BY max_appear DESC
LIMIT 5;

/* Использование АГРЕГАТНЫХ ФУНКЦИЙ без группировки. 
В таком случае вся таблица будет считаться как одна большая группа */
/* Рассчитать общее количество строк в таблице супергероев, минимальное количество появлений супергероя (по всей таблице), максимальное количество появлений супергероя (по всей таблице), общую сумму появлений всех супергероев в комиксах, и среднее значение появлений супергероев в комиксах для всей таблицы */
/* Результатом будет одна строка, так как у нас одна группа, которая соответствует всей таблице */
SELECT COUNT(*),
	MIN(appearances),
	MAX(appearances),
	SUM(appearances),
	AVG(appearances)
FROM superheroes;


/* ========================================================================== */
/* HAVING --> ФИЛЬТРАЦИЯ РЕЗУЛЬТАТОВ ГРУППИРОВКИ */
/* Вывести группы супергероев по волосам (hair) только ЖЕНСКОГО пола и для каждой группы подсчитать общее количество супергероев в группе */
SELECT hair, COUNT(*)
FROM superheroes WHERE gender='Female Characters'
GROUP BY hair;

/* Вывести группы супергероев по волосам (hair) только ЖЕНСКОГО пола и для каждой группы подсчитать общее количество супергероев в группе, и отфильтровать результаты группировки по количеству супергероев в группе (вывести только группы, в которых больше 10 супергероев) */
SELECT hair, COUNT(*)
FROM superheroes WHERE gender='Female Characters'
GROUP BY hair
HAVING COUNT(*) > 10;

/* Вывести группы супергероев по волосам (hair) только ЖЕНСКОГО пола и для каждой группы подсчитать общее количество супергероев в группе, и отфильтровать результаты группировки по количеству супергероев в группе (вывести только группы, в которых от 50 до 300 супергероев) */
SELECT hair, COUNT(*)
FROM superheroes WHERE gender='Female Characters'
GROUP BY hair
HAVING COUNT(*) BETWEEN 50 AND 300;

/* Таким образом, для фильтрации данных можно использовать два ключевых слова:
	WHERE    ---> Используется для фильтрации строк в исходной таблице;
	HAVING   ---> Используется для фильтрации результатов группировки;


	ПОРЯДОК ВЫПОЛНЕНИЯ SELECT:
		Выбор таблицы: FROM
		Фильтрация строк из таблицы: WHERE
		Группировка: GROUP BY
		Фильтрация результатов группировки: HAVING

*/

/* ========================================================================== */
/* СВЯЗЬ МЕЖДУ ТАБЛИЦАМИ */
/* Связь достигается с помощью дополнительного столбца (foreign key) (внешний ключ).
Например, есть две табьлицы: 1)superheroes; 2)movies. Для связи между двумя таблицами в таблице movies создан столбец superhero_id (foreign key), который содержит значения, которые находятся в столбце id таблицы superheros, на которые ссылается этот внешний ключ */



/* ========================================================================== */
/* JOIN --> ЗАПРОС ДАННЫХ ИЗ НЕСКОЛЬКИХ ТАБЛИЦ */

/* Есть две таблицы: 1)products; 2)product_types. Для связи между двумя таблицами в таблице products есть столбец type_id */

/* Вывести столбец name таблицы products и столбец type_name таблицы product_types */
SELECT products.name, product_types.type_name
FROM products JOIN product_types
ON products.type_id = product_types.id


/* ПСЕВДОНИМЫ ТАБЛИЦ для сокращения записи громоздких запросов JOIN */
SELECT p.name, t.type_name
FROM products AS p JOIN product_types AS t
ON p.type_id = t.id

/* ПСЕВДОНИМЫ столбцов и ТАБЛИЦ для сокращения записи громоздких запросов JOIN */
SELECT p.name AS product_name, 
       t.type_name AS product_type.
	   p.price AS product_price,
FROM products AS p JOIN product_types AS t
ON p.type_id = t.id

/* ЗАПРОС ДАННЫХ ИЗ НЕСКОЛЬКИХ ТАБЛИЦ (JOIN) с ФИЛЬТРАЦИЕЙ ДАННЫХ (WHERE) */
SELECT p.name AS product_name, 
       t.type_name AS product_type.
	   p.price AS product_price,
FROM products AS p JOIN product_types AS t
ON p.type_id = t.id
WHERE t.type_name = 'Вебинар'
AND p.price = 0



/* ========================================================================== */
/* SUBQUERIES (ПОДЗАПРОСЫ) */


SELECT id, name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products)  -- <--- данное вырежение в скобках является подзапросом

