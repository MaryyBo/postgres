
CREATE TABLE users (
    first_name varchar (64),
    last_name varchar (64),
    biography text,
    gender varchar (30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(5, 2)
)

--Як вставити дані в таблицю?

INSERT INTO users VALUES ('John', 'Doe', 'Тут може бути опис', 'male', 'true', '2004-09-14', 43, 1.75);

-- Декілька даних одночасно 

INSERT INTO users VALUES 
('Susan', 'Doe', 'Тут може бути опис', 'female', 'true', '2001-01-19', 39, 1.55),
('Peter', 'Doe', 'Тут може бути опис', 'male', 'true', '2002-05-18', 40, 1.95);


INSERT INTO users VALUES ('Blake', 'Doe', 'Тут може бути опис', 'male', 'false', '2004-09-14', NULL, NULL);
