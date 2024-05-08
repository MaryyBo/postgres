SELECT * FROM users;


------------------------------------------------------------

SELECT id, first_name, last_name FROM users;

------------------------------------------------------------

SELECT id, first_name, last_name FROM users WHERE id > 1000;

SELECT  first_name, last_name FROM users WHERE gender = 'male';

SELECT  first_name, last_name, email, is_subscribe FROM users WHERE is_subscribe = 'true';

------------------------------------------------------------

SELECT * FROM users WHERE height IS NOT NULL;

------------------------------------------------------------

SELECT first_name, last_name, email, is_subscribe FROM users WHERE is_subscribe IS FALSE;

------------------------------------------------------------

SELECT first_name, last_name, email FROM users WHERE first_name = 'William';

------------------------------------------------------------

/*
Є діапазон імен ['William', 'John', 'Jason']
Задача: знайти всіх юзерів, які входять у цей діапазон
*/

SELECT first_name, last_name, email FROM users WHERE first_name IN ('William', 'John', 'Jason');

------------------------------------------------------------

/*
Задача: знайти всіх юзерів,  у яких id між 2500 i 2600
*/

SELECT id, first_name, last_name FROM users WHERE id >= 2500 AND id <= 2600;

SELECT id, first_name, last_name FROM users WHERE id BETWEEN 2500 AND 2600;

------------------------------------------------------------

/*
Задача: знайти всіх юзерів, ім'я яких починається на букву 'K'
% - будь яка кількість будь яких символів
*/

SELECT first_name, last_name FROM users WHERE first_name LIKE 'K%'

------------------------------------------------------------

/*
Задача: знайти всіх юзерів, у яких рівно 5 символів у імені
_ - 1 будь який символ
*/

SELECT first_name, last_name FROM users WHERE first_name LIKE '_____';

------------------------------------------------------------

/*
Задача: знайти всіх юзерів, у яких iм'я складається з 3 символів і починається на букву 'A'

*/

SELECT first_name, last_name FROM users WHERE first_name LIKE 'A___';

------------------------------------------------------------

/*
Задача: знайти всіх юзерів, у яких iм'я закінчується на 'f' маленьке
*/

SELECT first_name, last_name FROM users WHERE first_name LIKE '%f';


------------------------------------------------------------

ALTER TABLE users 
ADD COLUMN weight int CHECK (weight != 0 AND weight > 0 );

UPDATE users 
SET weight = 60; --додали всім однакову вагу

UPDATE users 
SET weight = 100
WHERE id BETWEEN 3000 AND 3500;
 

 UPDATE users
 SET weight = 95
 WHERE id = 3100;

 SELECT * FROM users
 WHERE id = 3100;

 /*
 ЗАДАЧА
Потрібно створити невеличку таблицю співробітників (employees)
- id;
- name ;
- salary;
- work_hours (кількість відпрацьованих за місяць годин)

2. Вставити дані (INSERT) про 3 співробітників
3. Всім співробітникам які відпрацювали за місяць більше ніж 150 год, збільшити ім зп на 20%
 */

 CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar (256) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary >= 0),
    work_hours int NOT NULL CHECK (work_hours >= 0)
 );

 INSERT INTO employees (name, salary, work_hours) VALUES
 ('Ivanov', 400, 80),
 ('Petrov',750, 185),
 ('Sidorov', 0, 0)

 UPDATE employees
 SET salary = salary * 1.2
 WHERE work_hours > 150;


 ------------------------------------------------------------

 INSERT INTO users (first_name, last_name, email, gender, birthday, is_subscribe) VALUES
 ('Test', 'Testovich', 'test@gmail.com', 'male', '1800-12-12', false ) RETURNING *;

 DELETE FROM users
 WHERE id = 4001;

 SELECT id, first_name FROM users WHERE first_name = 'Test';

------------------------------------------------------------

SELECT id, first_name, last_name, birthday FROM users;

UPDATE users 
SET birthday = '2005-01-01'
WHERE (gender = 'female' AND is_subscribe);

------------------------------------------------------------

/*
Задача: Вивести всіх користувачів з інфою про них + вік
*/

SELECT id, first_name, last_name, birthday, age(birthday) FROM users; -- 1 варіант

SELECT id, first_name, last_name, birthday, extract ("years" FROM age(birthday)) FROM users; -- 2 варіант

------------------------------------------------------------

/*
Задача: Вивести всіх користувачів від 2 до 10 років
*/

SELECT id, first_name, last_name, birthday, extract ("years" FROM age(birthday)) AS years FROM users
WHERE extract  ("years" FROM age(birthday)) BETWEEN 2 AND 10;

------------------------------------------------------------ 

--- Aліаси (псевдоніми) - якщо кирилиця обов'язково лапки ""

SELECT first_name AS "Ім'я", last_name AS "Прізвище" , id AS "Особистий номер" FROM users;


------------------------------------------------------------

/*
Пагінація - це спосіб розділити великий обсяг інфо на менші частини

1. Нам потрібні сторінки
2. нам потрібно знати , яка кількість результатів буде відображатись на кожній сторінці

*/

-- LIMIT - задає кількість результатів яку я хочу отримати 

SELECT * FROM users
LIMIT 50;


SELECT * FROM users
LIMIT 15000; -- повернуться всі результати (1500)

SELECT * FROM users
LIMIT 50
OFFSET 50; -- перестрибуєм  через 50 записів

-- Як нам дізнатись скільки потірбно відступати?
/*
Перша сторінка буде вважатись 0
OFFSET = Limit * сторінку_яку_ми_запитуємо - 1
*/


------------------------------------------------------------

SELECT * FROM users;

--Склеювання стовпців - оператор ||

 SELECT id, first_name || last_name AS "full name", gender, email FROM users; --без пробілу
  
 SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users;

------------------------------------------------------------

--ПІДЗАПИТ

 /*
Задача:
Знайти всіх користувачів, повне ім'я яких (ім'я + прізвище) < 10 символів
*/

 SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
 WHERE char_length(concat(first_name, ' ', last_name)) < 10


 SELECT * FROM --основний запит
 ( -- підзапит
   SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
 ) AS "FN"
 WHERE char_length("FN"."full name") < 10;