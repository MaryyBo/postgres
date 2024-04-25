CREATE TABLE messages (
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body != ''),
    author varchar (256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
) 

DROP TABLE messages;

-- INSERT INTO messages VALUES ('Hello John', 'Me'); цей запис вже не спрацює!

INSERT INTO messages(author, body) VALUES 
    ('John', 'Hello'),
    ('Me', 'Go for coffee'),
    ('John', 'Go');

INSERT INTO messages (id, body, author)
VALUES ( 3, 'message text 4', 'author4');

--Ключ - ознака (штучна) яка відрізняє один запис у таблиці від іншого
--Первинний ключ (PRIMARY KEY) використов для тог, щоб ключу дати обмеження унікальності і обмеження NOT NULL