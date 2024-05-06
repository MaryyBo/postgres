
CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name varchar (64) NOT NULL CHECK (first_name != ''),
    last_name varchar (64) NOT NULL CHECK (last_name != ''),
    email text NOT NULL CHECK (email != ''), -- тут ще має бути UNIQUE
    gender varchar (30),
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday <= current_date),
    foot_size smallint,
    height numeric (5,2) CHECK (height < 3.0)
)

CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar (200) NOT NULL CHECK (brand !=''),
    model varchar (300) NOT NULL CHECK (model !=''),
    description text,
    category varchar (200) NOT NULL CHECK (category !=''),
    price numeric (10, 2) NOT NULL CHECK (price > 0),
    discounted_price numeric (10, 2) CHECK (discounted_price < price),
    quantity int CHECK (quantity >= 0)
)

CREATE TABLE orders (
    id serial PRIMARY KEY,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    customer_id int REFERENCES users(id)
)

--- зв'язок багато до багатьох

CREATE TABLE orders_to_products ( -- orders_items
    order_id int REFERENCES orders(id),
    products_id int REFERENCES products(id),
    quantity int NOT NULL DEFAULT 1,
    PRIMARY KEY (order_id, products_id)
)


DELETE FROM users;


DELETE FROM orders;

