-- 1 НФ : в кожній комірці зберігається атомарне значення( без списків і т.д)
-- 2 НФ : 1 НФ + таблиця повинна мати ключ; Ключ функціонально визначає всю строку
-- 3 НФ : 2 НФ + ми маємо прибрати транзитивні функціональні залежності атрибутів

DROP TABLE employees, positions, departments;

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar (200) REFERENCES positions(name) 
)

CREATE TABLE positions (
    name varchar (300) PRIMARY KEY,
    department varchar (300) REFERENCES departments(name),
    car_aviability boolean
)

CREATE TABLE departments (
    name varchar (200) PRIMARY KEY,
    phone_number varchar (15)
);

------------------------------------------------------------

INSERT INTO departments  VALUES
('Developers department', '11-222-45'),
('Top management', '23-56-888'),
('Operational department', '11-111-23'),
('Financial department', '34-45-111'); 

INSERT INTO positions VALUES
('JS developer', 'Developers department', false),
('Sales manager', 'Operational department', false),
('Bodyguard for developers', 'Operational department', true),
('Driver', 'Operational department', true),
('CFO', 'Top management', true),
('CEO', 'Top management', true),
('SMM/PR', 'Operational department', false),
('Accountant', 'Financial department', false);


INSERT INTO employees (name, position) VALUES
('John', 'JS developer'),
('Jane', 'Sales manager'),
('Jake', 'Bodyguard for developers'),
('Andrew', 'Driver'),
('Milena', 'CFO'),
('Sergey', 'CEO'),
('Matthew', 'SMM/PR'),
('Timofey', 'Accountant');

------------------------------------------------------------

SELECT employees.id, employees.name, employees.position, positions.car_aviability 
FROM employees
JOIN positions
ON employees.position = positions.name

-------------------------------------------------------------

SELECT employees.id, employees.name, employees.position, positions.car_aviability, departments.phone_number
FROM employees
JOIN positions
ON employees.position = positions.name
JOIN departments
ON positions.department = departments.name;





--------------------------------------------------------------

INSERT INTO employees (name, department, department_phone) VALUES
('John', 'Developers department', '11-222-45'),
('Jane', 'Operational department', '11-111-23'),
('Jake', 'Operational department', '11-111-23'),
('Andrew', 'Operational department', '11-111-23'),
('Milena', 'Top management', '23-56-888'),
('Sergey', 'Top management', '23-56-888'),
('Matthew', 'Operational department', '11-111-23'),
('Timofey', 'Financial department', '34-45-111'); 



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


