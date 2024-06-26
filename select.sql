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

-------------------------------------------------------------

--Cортування - це впорядкування даних за якимись ознаками 
-- ASC - за збільшенням (default)
-- DESC - за зменшенням
 
SELECT * FROM users
ORDER BY birthday ASC, -- початкове сортування
       first_name ASC; -- сортуємо по алфавітному порядку (якщо дати народження співпадають)

UPDATE users 
SET birthday = '2002-09-14'
WHERE id BETWEEN 3017 AND 3020;

-------------------------------------------------------------

SELECT * FROM products
ORDER BY quantity ASC; -- сортування за збільшенням

-------------------------------------------------------------
-- Вивести топ 3 телефони яких в нас залишилося найменше

SELECT * FROM products
ORDER BY quantity ASC
LIMIT 3


-------------------------------------------------------------

/*Задача
Зайти кількість користувачів у кожній віковій групі

10 - 15000
11 - 1000
*/

SELECT first_name, last_name, extract ('years' from age(birthday))
FROM users;


SELECT count (*), extract ('years' from age(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
ORDER BY "вікова група";

/*Задача
Модифікувати таким чином, щоб залишились групи менше 380 користувачів

*/

SELECT count (*) AS "кількість", extract ('years' from age(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
HAVING  count (*) < 380;

-------------------------------------------------------------

-- ДЗ - Всі дії виконуються над таблицею products

-- 1. Порахувати загальну кількість товарів

SELECT count(*) FROM products;

-- 2. Порахувати середню ціну товарів

SELECT avg(price) FROM products;

-- 3. Порахувати середню ціну кожного бренду (створити групу по бренду)

SELECT brand, avg(price) FROM products
GROUP BY brand

-- 4. Порахувати кількість моделей кожного бренду (по суті, той же запит, що в 3 завданні, тільки агрегатна функція тут буде count)

SELECT brand, count(price) FROM products
GROUP BY brand;

-- 5. Середня ціна бренду Huawei

SELECT avg(price) FROM products
WHERE brand = 'Huawei';

-- 6. Це завдання для таблиці users Відсортувати юзерів за віком (спочатку за збільшенням, потім за зменшенням)

SELECT * FROM users
ORDER BY birthday ASC;


SELECT *, extract ('years' from age(birthday))  FROM users
ORDER BY birthday DESC;

--7. Відсортуйте телефони за ціною, від найдорожчого до найдешевшого

SELECT * FROM products
ORDER BY price DESC;

-- 8. Виведіть топ-5 найдорожчих телефонів

SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

-------------------------------------------------------------

--РЕЛЯЦІЙНІ ОПЕРАЦІЇ

CREATE TABLE A (
   v char(3),
   t int
)

CREATE TABLE B (
   v char(3)
)

INSERT INTO A VALUES 
('XXX', 1),
('XXY', 1),
('XXZ', 1),
('XYX', 2),
('XYY', 2),
('XYZ', 2),
('YXX', 3),
('YXY', 3),
('YXZ', 3);

INSERT INTO B VALUES 

('ZXX'),
('XXX'), --- А
('ZXZ'),
('YXZ'), --- А
('YXY'); --- A


SELECT * FROM A, B;

-- UNION - об'єднання
-- (все те, що в А + все те, що в В. Те, що є і там і там, буде в 1 екземплярі(повторів не буде))

-- INTERSECT - перетин множин
-- (все те, що є і в А і в В в єдиному екземплярі)

-- Різниця
-- А мінус В - ми отримуємо все з А мінус спільні елементи для А і В
-- В мінус А -  все з В мінус спільні елементи для А і В 

SELECT v FROM A
UNION
SELECT * FROM B; -- отримаємо всі унікальні записи з двох таблиць без дублювань


SELECT v FROM A
INTERSECT 
SELECT * FROM B; -- отримано 3 елементи ,які повторюються в двух таблицях


SELECT v FROM A
EXCEPT 
SELECT * FROM B; -- значення з таблиці А, яких немає в таблиці B


-------------------------------------------------------------

INSERT INTO users (first_name, last_name, email, gender, is_subscribe, birthday)
VALUES 
('User 1', 'Test 1', 'email1@gmail.com', 'male', true, '1990-09-10'),
('User 2', 'Test 2', 'email2@gmail.com', 'female', true, '1990-09-10'),
('User 3', 'Test 3', 'email3@gmail.com', 'male', false, '1990-09-10');

--Задача:  Знайти id юзерів які робили замовлення

SELECT id FROM users
INTERSECT
SELECT customer_id FROM orders; 

--Задача:  Знайти id юзерів які НЕ робили замовлення

SELECT id FROM users
EXCEPT
SELECT customer_id FROM orders; 

-------------------------------------------------------------

-- З'єднання множин

/*
Це операція, яка об'єднує дві або більше множин в одну.
Результатом об'єднання буде таблиця
*/

SELECT * FROM A;

SELECT * FROM B;

SELECT * FROM A, B
WHERE A.v = B.v;

SELECT A.v  AS "id", A.t  AS "price",  B.v AS "phone.id" 
FROM A, B
WHERE A.v = B.v;

-- Переписуємо на JOIN

SELECT A.v  AS "id", A.t  AS "price",  B.v AS "phone.id" 
FROM A JOIN B
ON A.v = B.v;

-- Задача: Знайти всі замовлення юзера у якого id = 5

SELECT *
FROM users JOIN orders
ON orders.customer_id = users.id
WHERE users.id = 3456;

-- 2 variant

SELECT u.*, o.id AS "order_id"
FROM users AS u JOIN orders AS o
ON o.customer_id = u.id
WHERE u.id = 3456;

-------

SELECT *
FROM A JOIN B ON A.v = B.v
JOIN products ON A.t = products.id;

-- Знайти id всіх замовлень, де були замовлені телефони Samsung

SELECT *
FROM products JOIN orders_to_products 
ON products.id = orders_to_products.products_id
WHERE products.brand = 'Samsung';

-- Скорочений варіант

SELECT *
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.products_id
WHERE p.brand = 'Samsung';

-- Модифікуйте попередній запит: Порахуйте, скільки замовлень бренду Samsung

SELECT count (*)
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.products_id
WHERE p.brand = 'Samsung';

-- Зробити топ продажів.Який бренд найчастіше купували

SELECT brand, count (*) AS "quantity"
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.products_id
GROUP BY p.brand
ORDER BY "quantity" DESC;

----------------------------------------------------------------------

-- Знайти юзерів які нічого не замовляли 
-- Variant 1 (використовують частіше)

SELECT * FROM 
users AS u LEFT JOIN orders AS o 
ON u.id = o.customer_id
-- ORDER BY u.id DESC
WHERE o.customer_id IS NULL;

-- Variant 2

SELECT * FROM users
WHERE id IN (
   SELECT id FROM users
   EXCEPT
   SELECT customer_id FROM orders
); 


-- 1.Знайти всіх юзерів які хоча б раз щось замовляли 
-- 2.Знайти сумарну кількість їх замовлень  

SELECT * FROM 
users AS u JOIN orders AS o 
ON u.id = o.customer_id;

SELECT u.*, count(*) FROM users AS u JOIN orders AS o 
ON u.id = o.customer_id
GROUP BY u.id; 


--------------------------------------------------------------

INSERT INTO products (brand, model, category, price, quantity)
VALUES ('Microsoft', '12345', 'phones', 200, 2);



--------------------------------------------------------------

-- HOME WORK
/*
Задача 1. 
Знайти телефони, які ніхто не купував.
Підказка. Об'єднуйте таблицю orders_to_products і таблиця products
*/

SELECT * FROM 
products AS p LEFT JOIN orders_to_products AS otp
ON p.id = otp.products_id
WHERE otp.order_id IS NULL;

/*
Задача 2.
Кількість позицій у кожному замовленні.
Підказка. 
Тут не потрібно JOIN. Працюємо з таблицею orders_to_products.
Потрібно створити групу по order_id, та запустити на цій групі агрегатну функцію count
*/

SELECT order_id, count(*) FROM orders_to_products
GROUP BY order_id;

/*
Задача 3 (***).
Знайти найпопулярніший товар.
Підказка.
Учасники: products; orders_to_products
Створити групу по id з таблиці products.
Запустити агрегатну функцію sum по полю quantity з таблиці orders_to_products.
*/

SELECT p.id, p.brand, p.model, sum(otp.quantity) AS "customer_sum" 
FROM products AS p 
JOIN orders_to_products AS otp 
ON p.id = otp.products_id
GROUP BY p.id
ORDER BY customer_sum DESC
LIMIT 1;

--------------------------------------------------------------

/*
Задача 1.
Порахувати середній чек по всьому магазину
*/


SELECT avg(owc.cost) FROM (
   --Запит знаходить суму кожного замовлення
SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM 
orders_to_products AS otp JOIN products AS p
ON otp.products_id = p.id
GROUP BY otp.order_id
) AS owc -- orders with cost


/*
Задача 2.
Витягти всі замовлення вище середнього чека
*/
 --Variant 1

SELECT owc.* FROM (
   SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM 
   orders_to_products AS otp JOIN products AS p
   ON otp.products_id = p.id
   GROUP BY otp.order_id
) AS owc
WHERE owc.cost > (
   SELECT avg(owc.cost) FROM (
      SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM 
      orders_to_products AS otp JOIN products AS p
      ON otp.products_id = p.id
      GROUP BY otp.order_id
) AS owc
)

-- Variant 2

WITH orders_with_cost AS (
   SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM 
   orders_to_products AS otp JOIN products AS p
   ON otp.products_id = p.id
   GROUP BY otp.order_id
)
SELECT * FROM orders_with_cost
WHERE orders_with_cost.cost > (
   -- запит, який знаходить середній чек по всьому магазу
   SELECT avg(orders_with_cost.cost) FROM orders_with_cost
);



/*
Задача 3.
Витягти всіх користувачів в яких кількість замовлень вище середнього 
*/

WITH orders_with_counts AS (
   -- кількість замовлень кожного користувача
   SELECT customer_id, count (*) AS orders_count FROM orders
   GROUP BY customer_id
)

SELECT * FROM 
orders_with_counts JOIN users 
ON users.id = orders_with_counts.customer_id
WHERE orders_with_counts.orders_count > (
   SELECT avg(orders_with_counts.orders_count) FROM orders_with_counts
);

/*
Задача 4.
Витягти користувачів та кількість товаірв, які вони замовляли (кількість замовлень * quantity)
*/

SELECT u.id, u.first_name, u.last_name, sum (otp.quantity) AS "product_quantity" 
FROM users AS u JOIN orders AS o
ON u.id = o.customer_id
JOIN orders_to_products AS otp
ON o.id = otp.order_id
GROUP BY u.id
