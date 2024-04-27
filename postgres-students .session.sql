--Ключ - ознака (штучна) яка відрізняє один запис у таблиці від іншого
--Первинний ключ (PRIMARY KEY) використов для тог, щоб ключу дати обмеження унікальності і обмеження NOT NULL
--Потенцфйний ключ стовпець (група стовпців) які могли б стати первинним ключем, але ще не обрані як такі
--Зовнішній ключ - стовпець (група стовпців) які містять значення,які посилаються на ідентифікатори в інших таблицях

CREATE TABLE orders (
id serial PRIMARY KEY,
created_at timestamp NOT NULL DEFAULT current_timestamp,
customer_id int REFERENCES users (id)
);

DROP TABLE orders;

ALTER TABLE users 
ADD COLUMN id serial PRIMARY KEY;


CREATE TABLE orders_to_products ( -- в цій таблиці нам будуть передавати товар
  product_id int REFERENCES products(id),
  order_id  int REFERENCES orders(id),
  quantity int,
  PRIMARY KEY (order_id, product_id)
)

-- Таблиця1_to_таблиця2



-- ОФОРМЛЕННЯ ЗАМОВЛЕННЯ ДЛЯ ЯКОГОСЬ ЮЗЕРА

-- 1. Створили замовлення 

INSERT INTO orders (customer_id) VALUES
(4);

-- 2. Наповнити замовлення 


INSERT INTO orders_to_products (product_id, order_id, quantity) VALUES 
(2, 1, 1),
(3, 1, 2),
(4, 1, 1);