
-- Вивести інфу про всіх юзерів + скільки хто зробив замовлень

SELECT u.id, u.first_name, u.last_name, u.email, count(o.id) AS "orders_amount" FROM 
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id
ORDER BY "orders_amount";


CREATE VIEW users_with_orders_amount AS (
        SELECT u.id, u.first_name, u.last_name, u.email, count(o.id) AS "orders_amount" FROM 
        users AS u LEFT JOIN orders AS o
        ON u.id = o.customer_id
        GROUP BY u.id
        ORDER BY "orders_amount"
);

SELECT * FROM users_with_orders_amount;

-- Отримати email юзерів, які мають менше 2 замовлень

SELECT email, orders_amount FROM users_with_orders_amount
WHERE orders_amount < 2;

-- View можна видаляти 

DROP VIEW users_with_orders_amount;

-- Створити представлення, яке зберігає замовлення з їхньою вартістю
-- Додати до цієї view інформацію про замовлення (id замовника)

CREATE VIEW orders_with_price AS (
        SELECT o.id, o.customer_id, sum(p.price * otp.quantity) AS "order_sum", o.status FROM 
        orders AS o JOIN orders_to_products AS otp
        ON o.id = otp.order_id
        JOIN products AS p
        ON p.id = otp.products_id
        GROUP BY o.id
);

DROP VIEW orders_with_price;


-- Вивести юзерів з сумою коштів, яку вони витратили у нашому магазині

SELECT  u.id, u.email, sum(owp.order_sum) AS "sum" FROM 
users AS u LEFT JOIN orders_with_price AS owp
ON u.id = owp.customer_id
GROUP BY u.id
ORDER BY sum;
