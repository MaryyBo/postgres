/* 
Задача : Міні ЮТУБ 

Таблиця контенту:
-назва
-опис
-автор (юзер, який створив контент)
-дата створення

Таблиця Реакції:

-is_liked:
    - null - не ставив оцінку
    - true - лайк
    - false - дизлайк


У контента може бути багато реакцій від користувачів

 Реакції - зв'язки між користувачем та контентом   

*/

CREATE TABLE contents (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    description text,
    author_id int REFERENCES users (id),
    created_at timestamp DEFAULT current_timestamp
)

CREATE TABLE reactions (
    content_id int REFERENCES contents(id),
    user_id int REFERENCES users (id),
    is_liked boolean
)

INSERT INTO contents(name, author_id) VALUES --доравання контакту
('Funny dogs', 3);

INSERT INTO reactions  VALUES --доравання реакцій
(1, 1, true);
