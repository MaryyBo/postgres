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