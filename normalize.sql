-- 1 НФ : в кожній комірці зберігається атомарне значення( без списків і т.д)
-- 2 НФ : 1 НФ + таблиця повинна мати ключ; Ключ функціонально визначає всю строку

DROP TABLE employees;

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar (300) REFERENCES positions (name)
)

INSERT INTO employees (name, position) VALUES
('John', 'JS developer'),
('Jane', 'Sales manager'),
('Jake', 'Bodyguard for developers'),
('Andrew', 'Driver');

INSERT INTO employees (name, position) VALUES
('Milena', 'CFO'),
('Sergey', 'CEO'),
('Matthew', 'SMM/PR'),
('Timofey', 'Accountant');

CREATE TABLE positions (
    name varchar (300) PRIMARY KEY,
    department varchar (300),
    car_aviability boolean
)

INSERT INTO positions (name, car_aviability) VALUES
('JS developer', false),
('Sales manager', false),
('Bodyguard for developers', true),
('Driver', true)

INSERT INTO positions (name, car_aviability) VALUES
('CFO', true),
('CEO', true),
('SMM/PR', false),
('Accountant', false);

-------------------------------------------------------

SELECT * FROM employees
JOIN positions
ON employees.position = positions.name