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

 -------------------------------------------------------------

 --ДЗ

 /*
Створити таблицю workers:
- id
- name
- salary
- birthday
*/

CREATE TABLE workers (
   id serial PRIMARY KEY,
   name varchar (64) NOT NULL CHECK (name != ''),
   salary int NOT NULL CHECK (salary >= 0),
   birthday date NOT NULL CHECK (birthday <= current_date)
)
 
--1. Додайте робітника з ім'ям Олег, з/п 300

INSERT INTO workers (name, salary, birthday) VALUES
('Oleh', 500, '1968-12-12')

--2. Додайте робітницю Ярославу, з/п 700

INSERT INTO workers (name, salary, birthday) VALUES
('Yaroslava', 700, '1978-10-08')

/*3. Додайте двох нових працівників одним запитом -
Сашу, з/п 1000
Машу, з/п 200
*/

INSERT INTO workers (name, salary, birthday) VALUES
('Sasha', 1000, '1990-05-23'),
('Masha', 200, '1987-09-14');

--4. Встановити Олегу з/п 600

UPDATE workers 
SET salary = 600
WHERE id = 1;

--5. Всім, у кого з/п більше 500, врізати з/п до 400

UPDATE workers 
SET salary = 400
WHERE salary > 500;


--6. Вибрати (SELECT) всіх робітників, чия з/п більше 400

SELECT * FROM workers
WHERE salary > 400;

--7. Вибрати робітника з id = 4

SELECT * FROM workers
WHERE id = 4;

--8. Дізнатися (SELECT) з/п та вік Олега

SELECT *, extract ('years' from age(birthday)) FROM workers
WHERE id = 1;


--9. Спробувати знайти робітника з ім'ям "Petya"

SELECT * FROM workers
WHERE name = 'Petya';

/*10. Вибрати робітників у віці 30 років АБО з з/п > 800
WHERE _кількість_років_ = 30 OR salary > 800;
*/

SELECT * FROM workers
WHERE extract ('years' from age(birthday)) = 30 OR salary > 800;


--11. Вибрати всіх робітників у віці від 25 до 28 років

SELECT * FROM workers
WHERE extract ('years' from age(birthday)) BETWEEN 25 AND 28;

--- варіант 2 
SELECT *, extract ('years' from age(birthday)) BETWEEN 25 AND 28;


--12. Вибрати всіх співробітників, що народились у вересні

SELECT *, extract ('month' from birthday) FROM workers
WHERE extract ('month' from birthday) = 9;

--13. Видалити робітника з id = 4

DELETE FROM workers
WHERE id = 4;

--14. Видалити Олега

DELETE FROM workers
WHERE name = 'Oleh';


--15. Видалити всіх робітників старших за 30 років

DELETE FROM workers
WHERE extract ('years' from age(birthday)) > 30;


-- Агрегатні функції - функції які виконують якусь операцію над групою рядків (в межах стовпця) і повертають одне єдине значення
-- COUNT, SUM, AVG, MIN, MAX

SELECT max(weight) FROM users;

SELECT min(weight) FROM users;

SELECT sum(weight) FROM users;

SELECT avg(weight) FROM users;

/*
Задача:

Підрахувати кількість записів в таблиці

*/

SELECT count(id) FROM users; -- передати стовпчик де немає NULL


/*
Задача:

Знайти середню вагу окремо чоловіків та жінок

*/

SELECT gender, avg(weight) FROM users
GROUP BY gender;


--Знайти середню вагу чоловіків 

SELECT avg(weight) FROM users
WHERE gender = 'male';

--Знайти середню вагу користувачів, старших за 10 років

SELECT avg(weight) FROM users
WHERE extract ('years' from age(birthday)) > 10; 