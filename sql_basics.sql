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

