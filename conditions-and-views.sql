
CREATE SCHEMA new_schema;

CREATE TABLE new_schema.users(
    first_name varchar (20) NOT NULL CHECK (first_name != ''),
    last_name varchar (20) NOT NULL CHECK (last_name != ''),
    email varchar (20) NOT NULL CHECK (email != '')
);

DROP TABLE new_schema.users;

/* Задача 1

+ 1. Створіть нову схему
+ 2. Зробити дві ніяк не пов'язані між собою таблиці:
users: login, email, password
employees: salary, department, position, hire_date, name

*/

CREATE SCHEMA my_schema;

CREATE TABLE my_schema.users (
    login varchar(200) NOT NULL CHECK (login != ''),
    email varchar(200) NOT NULL CHECK (email != ''),
    password varchar(200) NOT NULL CHECK (password != '')
)

CREATE TABLE my_schema.employees (
    name varchar(200) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary >= 0),
    department varchar(200) NOT NULL CHECK (department != ''),
    position varchar(200) NOT NULL CHECK (position != ''),
    hire_date date DEFAULT current_date 
)

DROP TABLE my_schema.users;
DROP TABLE my_schema.employees;



/* + Задача 2

Вирішити проблеми з нормалізацією:
1. Відсутність ключа у юзерів. Ключем має бути мейл
2. Надлишкові дані про співробітників потребують нормалізації.
Декомпозиція таблиці employees на дві таблиці: співробітники та відділи


Підказки.
+ 1. Імейл в таблиці users призначити первинним ключем
+ 2. В таблицю employees додати id
+ 3. Створити окрему таблицю positions: id, department, position
+ 4. Видаляєте з таблиці employees стовпці department та position
+ 5. Пов'язати employees з таблицею positions

*/

CREATE TABLE my_schema.users (
    login varchar(200) NOT NULL CHECK (login != ''),
    email varchar(200) PRIMARY KEY,
    password varchar(200) NOT NULL CHECK (password != '')
)

CREATE TABLE my_schema.employees (
    id serial PRIMARY KEY,
    name varchar(200) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary >= 0),
    position int REFERENCES my_schema.positions(id),
    hire_date date DEFAULT current_date 
)

CREATE TABLE my_schema.positions (
    id serial PRIMARY KEY,
    department varchar(200) NOT NULL CHECK (department != ''),
    position varchar(200) NOT NULL CHECK (position != '')
)