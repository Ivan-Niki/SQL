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

