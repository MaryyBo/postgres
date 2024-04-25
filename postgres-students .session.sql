--Ключ - ознака (штучна) яка відрізняє один запис у таблиці від іншого
--Первинний ключ (PRIMARY KEY) використов для тог, щоб ключу дати обмеження унікальності і обмеження NOT NULL

/*ALTER - для внесення змін*/

CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL CHECK (brand != '') ,
    model varchar (300) NOT NULL CHECK (model != '') ,
    description text,
    category varchar (200) NOT NULL CHECK (category != ''),
    price numeric(10,2) NOT NULL CHECK (price > 0),
    discoubted_price numeric (10,2) CHECK (discoubted_price <= price)
)

DROP TABLE products;

INSERT INTO products (brand,model, category, price) VALUES 
('Samsung', 'S10', 'smartphones', 200),
('Iphone', '15Pro', 'smartphones', 1200),
('Sony', '456', 'TV', 300),
('Sony', '567', 'TV', 600)

ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE (brand, model);


INSERT INTO products (brand,model, category, price) VALUES 
('Iphone', '15Pro', 'smartphones', 500) -- клон

ALTER TABLE products
ADD COLUMN quantity int;

ALTER TABLE products
ADD CONSTRAINT "product_quantity_check" CHECK (quantity >= 0);

ALTER TABLE products 
DROP CONSTRAINT "product_quantity_check"; -- видаляем CONSTRAINT який створили раніше

ALTER TABLE products
DROP COLUMN quantity; -- видалити колонку




/*Створити таблицю books

В книги є:
1. Порядковий номер
2. Автор книги
3. Назва книги
4. Рік випуску
5. Видавництво
6. Категорія
7. Синопсис
8. Кількість примірників
9. Статус  -- книга видана / не видана (надрукували її чи ні)

ALTER:

1. Додати до таблиці обмеження, що кількість примірників (пункт 8) не може бути менше 0

* 2. Додати до таблиці обмеження, що автор + назва книги не може бути пустим рядком і має бути унікальним

*/

CREATE TABLE books (
    id serial PRIMARY KEY,
    author varchar (256),
    title varchar (256),
    year varchar (4),
    publisher varchar (256),
    category varchar (200),
    synopsis text ,
    quantity int,
    status boolean

)

DROP TABLE books;

ALTER TABLE books
ADD CONSTRAINT "quantity_more_zero" CHECK (quantity >= 0);

ALTER TABLE books
ADD CONSTRAINT "author_title_unique" UNIQUE (author, title);

INSERT INTO books(author, title, quantity) VALUES
('Оноре Де Бальзак', 'Гобсек', 1500);

INSERT INTO books(author, title, quantity) VALUES
('Оскар Уайльд', 'Портрет Доріана Грея', 0);

INSERT INTO books(author, title, quantity) VALUES
('Оноре Де Бальзак', 'Шагренева шкіра', 345);

