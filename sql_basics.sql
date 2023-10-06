         ----------- SQL -----------

/* Язык структурированных запросов (сокр. «SQL» от англ. «Structured Query Language») — это стандартный язык запросов, используемый для работы с реляционными базами данных. SQL используется для создания и удаления баз данных, создания и удаления таблиц в базе данных, чтения, вставки, обновления и удаления данных из таблиц, а также во многих других операций с базами данных. 
База данных (сокр. «БД») — это организованная коллекция данных, к которой можно легко получить доступ. Для управления базами данных используются системы управления базами данных (сокр. «СУБД»).
Есть два распространенных типа баз данных:
   Нереляционные.
   Реляционные.

--- Нереляционные СУБД
В нереляционных СУБД данные хранятся в парах ключ-значение. 
Популярные нереляционные СУБД: MongoDB, Amazon DynamoDB, Redis и др.

--- Реляционные СУБД
В реляционных СУБД данные хранятся в табличном формате.
Первая строка — это атрибуты таблицы. Каждая последующая строка содержит фактические данные. В реляционных СУБД две или более таблиц могут быть связаны друг с другом. Отсюда и термин «реляционные» (англ. «relation» = «связь»).
Популярные реляционные СУБД: MySQL, PostgreSQL, MSSQL, Oracle и др.
*/

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

/* 5. Ограничение количества извлекаемых строк. ----- LIMIT и OFFSET -----

Указания LIMIT и OFFSET позволяют получить только часть строк из тех, что выдал остальной запрос.
Ключевое слово LIMIT используется для выбора фиксированного количества строк в MySQL, PostgreSQL и SQLite.
Например: выбрать (вывести) первые 2 строки из таблицы Customers.*/
SELECT first_name, age
FROM Customers
LIMIT 2;

/* Вывести только уникальные значения из столбца hair из таблицы superheroes и ограничить результат только первыми 10-ю строками */
SELECT DISTINCT(hair) 
FROM superheroes
LIMIT 10;

/* ========================================================================== */
---------------- /* Data filtration(WHERE)*/ ----------------

/* 6. Оператор SQL WHERE используется для фильтрации результатов и применения условий в предложениях SELECT, INSERT, UPDATE или DELETE.
/* Указать, какие строки хотим выбрать. Вывести все строки из таблицы superheroes, в которых значение в столбце gender = 'Female Characters' */
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


------------ Использование BETWEEN в WHERE -----------
/* BETWEEN – это логический оператор языка SQL, который определяет диапазон для проверки. 
Другими словами, с помощью BETWEEN мы можем проверить, входит ли значение в определённый диапазон. */
/* Вывести все строки из таблицы superheroes, в которых значение в столбце year находится 
в диапазоне от 2000 до 2005 */
SELECT * 
FROM superheroes
WHERE year BETWEEN 2000 AND 2005;

/* С помощью ключевого слова NOT мы можем инвертировать результат, иными словами, NOT BETWEEN означает, что мы хотим проверить значение на предмет того, что оно не входит в заданный диапазон.

/* Вывести все строки из таблицы superheroes, в которых значение в столбце year НЕ находится 
в диапазоне от 2000 до 2005 */
SELECT * 
FROM superheroes
WHERE year NOT BETWEEN 2000 AND 2005;


----------- Использование IN в WHERE ------------
/* Оператор IN позволяет легко проверить, соответствует ли выражение какому-либо значению в списке значений. Он используется, чтобы помочь уменьшить потребность в нескольких условиях OR в операторе SELECT, INSERT, UPDATE или DELETE.

Синтаксис оператора IN в SQL:
expression IN (value1, value2, .... value_n);
	Или
expression IN (subquery); */

/* Вывести все строки из таблицы superheroes, в которых значение в столбце hair входит в список (перечисление) */
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

/* Создать таблицу superheroes с указанными столбцами (список столбцов указывается в скобках, для каждого столбца указывается ИМЯ столбца (например, id, name, hair, eye и т.д.) и ТИП данных для данного столбца (например, INT, VARCHAR и т.д. */
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

/* Подзапросы - это такие запросы, которые используются внутри другого запроса в SQL. 
Они оформляются в круглых скобках */

/* Вывести id, name и price из таблицы products, где price равен подзапросу */
SELECT id, name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products)  -- <--- данное вырежение в скобках является подзапросом


/* Вывести информацию о продуктах, которые были проданы хотя бы один раз.
Информация о продуктах хранится в таблице products, а информация о продажах в таблице sales */
SELECT id, name, price
FROM products
WHERE id IN (SELECT product_id FROM sales) 
/* здесь подзапрос возвращает не одно значение, а список. Поэтому простое сравнение использовать нельзя, а вместо этого мы используем оператор IN. */

/* Подзапросы в UPDATE */
/* Например, нам нужно увеличить стоимсоть каждой книги, которую продаёт онлайн-школа, на 500 рублей. */

UPDATE products
SET price = price + 500
WHERE type_id = (SELECT id FROM product_types WHERE type_name = 'Книга')


/* ========================================================================== */
/* TRANSACTIONS (ТРАНЗАКЦИИ) */
/* ТРАНЗАКЦИИ - это последовательность команд SQL, которые должны быть выполнены ПОЛНОСТЬЮ или не выполнены вообще */

START TRANSACTION;   --- начало транзакции

UPDATE accounts SET balance = balance - 15000   --- уменьшение баланса счёта клиента
WHERE account_number = 1234567;                  

UPDATE accounts SET balance = balance + 15000   --- увеличение баланса счёта онлайн-школы
WHERE account_number = 9876543;

COMMIT; --- 1-й вариант - зафиксировать транзакцию (изменения будут записаны в базу данных)

ROLLBACK; --- 2-й вариант - откат транзакции (если что-то пошло не так) - все команды, которые были введены со старта транзакции будут отменены.


/* ========================================================================== */
/* ФУНКЦИЯ TIMEDIFF */
/* Возвращает разницу во времени (datetime1 - datetime2) между DATETIME или TIME значениями. 
Результат возвращается в формате ЧЧ:ММ:СС.

TIMEDIFF(datetime1, datetime2)

Возвращает NULL, если одно из переданных значений равно NULL или оба значения имеют разный тип.

Примеры */

SELECT TIMEDIFF('2022-12-05 18:00:00','2022-12-05 14:00:00');

SELECT TIMEDIFF('2022-12-05 18:00:00','2021-12-01 14:00:00');

SELECT TIMEDIFF('2022-12-05 14:00:00','2022-12-05 18:00:00');

SELECT TIMEDIFF('18:00:00','14:00:00');

SELECT TIMEDIFF('18:00:00','2022-12-05 14:00:00');


/* ========================================================================== */
/* ОГРАНИЧЕНИЯ В БАЗАХ ДАННЫХ (CONSTRAINTS) */
/* Ограничения – это правила, применяемые к столбцам данных в таблице. Они используются для предотвращения ввода неверных данных в базу данных. Это обеспечивает точность и достоверность данных в базе данных. */

--------------------------  1. Ограничения NOT NULL  -------------------------
/* Ограничение NOT NULL просто указывает, что столбцу нельзя присваивать значение NULL. Пример синтаксиса: */

CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric
);

-----------------------  2. Ограничения-проверки (CHECK) -------------------------
/*Ограничение-проверка — наиболее общий тип ограничений. В его определении вы можете указать, что значение данного столбца должно удовлетворять логическому выражению (проверке истинности). Ограничение-проверка состоит из ключевого слова CHECK, за которым идёт выражение в скобках. Это выражение должно включать столбец, для которого задаётся ограничение, иначе оно не имеет большого смысла. Например, цену товара можно ограничить положительными значениями так: */

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0)
);

/* Вы можете также присвоить ограничению отдельное имя. Это улучшит сообщения об ошибках и позволит вам ссылаться на это ограничение, когда вам понадобится изменить его. Чтобы создать именованное ограничение, напишите ключевое слово CONSTRAINT, а за ним идентификатор и собственно определение ограничения. (Если вы не определите имя ограничения таким образом, система выберет для него имя за вас.) НАПРИМЕР: */

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CONSTRAINT positive_price CHECK (price > 0)
);

/* Ограничение-проверка может также ссылаться на несколько столбцов. Например, если вы храните обычную цену и цену со скидкой, так вы можете гарантировать, что цена со скидкой будет всегда меньше обычной: */

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0),
    discounted_price numeric CHECK (discounted_price > 0),
    CHECK (price > discounted_price)
);

/* Первые два ограничения определяются похожим образом, но для третьего используется новый синтаксис. Оно не связано с определённым столбцом, а представлено отдельным элементом в списке. Определения столбцов и такие определения ограничений можно переставлять в произвольном порядке.
Про первые два ограничения можно сказать, что это ограничения столбцов, тогда как третье является ограничением таблицы, так как оно написано отдельно от определений столбцов. Ограничения столбцов также можно записать в виде ограничений таблицы, тогда как обратное не всегда возможно, так как подразумевается, что ограничение столбца ссылается только на связанный столбец.

Ранее приведённый пример можно переписать и так: */

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric,
    CHECK (price > 0),
    discounted_price numeric,
    CHECK (discounted_price > 0),
    CHECK (price > discounted_price)
);


-----------------------  3. Ограничения уникальности (UNIQUE) -------------------------
/* Ограничения уникальности гарантируют, что данные в определённом столбце или группе столбцов уникальны среди всех строк таблицы. Ограничение записывается так: */

-- 1) в виде ограничения столбца:
CREATE TABLE products (
    product_no integer UNIQUE,
    name text,
    price numeric
);

-- 2) в виде ограничения таблицы:
CREATE TABLE products (
    product_no integer,
    name text,
    price numeric,
    UNIQUE (product_no)
);

-----------------------  4. Первичные ключи (PRIMARY KEY) -------------------------
/* Ограничение первичного ключа означает, что образующий его столбец или группа столбцов может быть уникальным идентификатором строк в таблице. Для этого требуется, чтобы значения были одновременно уникальными и отличными от NULL. Таким образом, таблицы со следующими двумя определениями будут принимать одинаковые данные: */

CREATE TABLE products (
    product_no integer UNIQUE NOT NULL,
    name text,
    price numeric
);

CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);


/* Первичные ключи могут включать несколько столбцов; синтаксис следующий: */
CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    PRIMARY KEY (a, c)
);


-----------------------  5. Первичные ключи (FOREIGN KEY) -------------------------
/* Ограничение внешнего ключа указывает, что значения столбца (или группы столбцов) должны соответствовать значениям в некоторой строке другой таблицы. Это называется ссылочной целостностью двух связанных таблиц. */

-- Пусть у вас уже есть таблица продуктов
CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);

/* Давайте предположим, что у вас есть таблица с заказами этих продуктов. Мы хотим, чтобы в таблице заказов содержались только заказы действительно существующих продуктов. Поэтому мы определим в ней ограничение внешнего ключа, ссылающееся на таблицу продуктов: */
CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products (product_no),
    quantity integer
);

/* С таким ограничением создать заказ со значением product_no, отсутствующим в таблице products (и не равным NULL), будет невозможно. */

/* В такой схеме таблицу orders называют подчинённой таблицей, а products — главной. Соответственно, столбцы называют так же подчинённым и главным (или ссылающимся и целевым).

Предыдущую команду можно сократить так: */

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products,
    quantity integer
);

/* то есть, если опустить список столбцов, внешний ключ будет неявно связан с первичным ключом главной таблицы. */


-----------------------  6. Значение по умолчанию (DEFAULT) -------------------------
/* Ограничение DEFAULT используется для предоставления значения по умолчанию для столбца. Значение по умолчанию будет добавлено ко всем новым записям, если другое значение не указано.
Следующий SQL устанавливает значение DEFAULT для столбца «country», когда создается таблица «users»: */
CREATE TABLE users (
    user_id int NOT NULL,
    name varchar(255) NOT NULL,
    fullname varchar(255),
    gender int,
    country varchar(255) DEFAULT 'Spain'
);

/* Чтобы создать ограничение DEFAULT в столбце «country», когда таблица уже создана, используйте следующее: */
ALTER TABLE users
ALTER country SET DEFAULT 'Spain';


/* Чтобы удалить ограничение DEFAULT, используйте следующее: */
ALTER TABLE users
ALTER country DROP DEFAULT;



/* ========================================================================== */
------------------- ПРЕДСТАВЛЕНИЯ в SQL (VIEW) ---------------------
/* Представление — это способ задать ИМЯ для запроса SELECT на выборку данных и по этому ИМЕНИ быстро получать нужную «собранную» таблицу. То есть можно создать сложный запрос в базу данных и дать ему имя, чтобы каждый раз не расписывать полный SELECT. */

-- Например, можно создать представление, содержащее нужные нам поля из одной таблицы.
CREATE VIEW customers_v AS
SELECT id, name FROM customers;

/* Пример №2. У нас в базе данных есть три связанных таблицы: 1) Products; 2) Customers; 3) Orders. 
Добавим в базу данных, в которой содержатся 3 данные таблицы, представление OrdersProductsCustomers: */
CREATE VIEW OrdersProductsCustomers AS
SELECT Orders.CreatedAt AS OrderDate,
       Customers.FirstName AS Customer,
       Products.ProductName As Product  
FROM Orders 
INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id;

-- данное представление фактически будет возвращать сводные данные из трех таблиц.

-- Теперь используем созданное выше представление для получения данных:
SELECT * FROM OrdersProductsCustomers;

-- Также при создании представления можно определить набор его столбцов:
CREATE VIEW OrdersProductsCustomers2 (OrderDate, Customer,Product)
AS SELECT Orders.CreatedAt,
        Customers.FirstName,
        Products.ProductName
FROM Orders INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id;


------------ /* Материализованные представления */ -----------
/* Представления не содержат данные. А когда происходят запросы к представлениям, данные извлекаются из исходных таблиц, на основе котрых созданы представления.
Однако существует другой вариант - материализованные представления, которые СОДЕРЖАТ данные. Данный вид представлений поддреживают не все СУБД, но PostgreSQL и Oracle поддерживают материализованные представления. */
CREATE MATERIALIZED VIEW products_v
AS SELECT Orders.CreatedAt AS OrderDate, 
        p.id AS id,
        p.name AS product_name,
        t.type_name AS product_type,
		p.price AS product_price
FROM products AS p
JOIN product_types AS t
	ON p.type_id = t.Id;

/* Недостаток в том, что данные в исходных таблицах обновляются, а в материализованном представлении эти изменения не учитываются. Поэтому для материализованного представления необходимо периодически запускать обновление с помощью команды REFRESH */
REFRESH MATERIALIZED VIEW products_v;

------------ /* Удаление представлений */ -----------
DROP VIEW products_v;
DROP MATERIALIZED VIEW products_v;


/* ========================================================================== */
-------------------------- Оператор UNION и UNION ALL в SQL --------------------------

/* UNION – это оператор SQL для объединения результирующего набора данных нескольких запросов, и данный оператор выводит только уникальные строки в запросах, т.е. например, Вы объединяете два запроса и в каждом из которых есть одинаковые данные, другими словами полностью идентичные, и оператор UNION объединит их в одну строку для того чтобы не было дублей;
UNION ALL – это оператор SQL для объединения результирующего набора данных нескольких запросов. Данный оператор выведет уже абсолютно все строки, даже дубли. */
SELECT model, price FROM PC
UNION
SELECT model, price FROM Laptop
ORDER BY price DESC;

/* Требования для UNION, которые должны соблюдаться, и особенности:
1) Каждый оператор SELECT в UNION должен иметь одинаковое количество столбцов;
2) Столбцы должны иметь одинаковые типы данных;
3) Столбцы в каждом заявлении SELECT также должны располагаться в том же порядке
4) В результирующих данных имена столбцов будут совпадать со столбцами первого запроса;
5) Можно применять ORDER BY ко всем результатам и указывать его можно только в конце всего запроса (после последнего SELECTа);
*/


------------------------- Оператор MINUS в SQL --------------------------
/* Оператор вычитает строки из двух наборов данных (т.е. из первого набора вычитается второй набор) */
SELECT phonenum FROM man
MINUS
SELECT phonenum FROM auto;
/* Из всех номеров телефона таблицы man вычитаем (исключаем) набор номеров телефона, которые есть в таблице auto. */


------------------------- Оператор INTERSECT в SQL --------------------------
/* Оператор INTERSECT выводит пересечение наборов данных (т.е. выводит только совпадающие строки) */
SELECT phonenum FROM man
INTERSECT
SELECT phonenum FROM auto;



/* ========================================================================== */
---------------------- Операторы ANY, ALL в SQL ---------------------
/* 1) Оператор ANY сравнивает значение первой таблицы со всеми значениями второй таблицы и возвращает строку, если есть совпадение с каким-либо значением. Например, если мы хотим найти учителей, чей возраст аналогичен возрасту любого ученика, мы можем использовать: */
SELECT *
FROM Teachers
WHERE age = ANY (
  SELECT age
  FROM Students
);

/* Подзапрос [SELECT age FROM Students] возвращает все возрасты из таблицы Students.
   А условие WHERE age = ANY (...) сравнивает возраст учащихся (возвращается от подзапроса) с возрастом учителя. При наличии совпадения выбирается соответствующая строка таблицы Teachers. /*


/*Оператор ALL сравнивает значение первой таблицы со всеми значениями второй таблицы и возвращает строку, если есть совпадение со всеми значениями. Например, если мы хотим найти учителей, чей возраст больше, чем у всех учеников, мы можем использовать: */
SELECT * 
FROM Teachers
WHERE age > ALL (
  SELECT age
  FROM Students
);

/* Подзапрос [SELECT age FROM Students] возвращает все возрасты из таблицы Students.
А условие WHERE age > ALL (...) сравнивает возраст учащихся (возвращается от подзапроса) с возрастом учителя. Если возраст учителя больше, чем возраст всех учеников, выбирается соответствующая строка таблицы Teachers.

