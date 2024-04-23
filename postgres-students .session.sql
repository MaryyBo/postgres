
CREATE TABLE users (
    first_name varchar (64) NOT NULL CONSTRAINT first_name_not_empty CHECK(first_name != ''),
    last_name varchar (64) NOT NULL CONSTRAINT last_name_not_empty CHECK(last_name != ''),
    email varchar(64) CONSTRAINT email_not_empty CHECK(email != '') UNIQUE,
    gender varchar (30) NOT NULL CONSTRAINT gender_not_empty CHECK(gender != ''),
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday <= current_date),
    foot_size smallint,
    height numeric(5, 2) CONSTRAINT too_high_user CHECK (height < 2.4)
)

DROP TABLE users;

-- мусорний запис 

INSERT INTO users VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- дані 

INSERT INTO users VALUES 
('Susan', 'Doe', 'doesusan@gmail.com', 'female', 'true', '2001-01-19', 39, 1.55),
('Peter', 'Doe', 'doeggsusan@gmail.com', 'male', 'false', '2002-05-18', 40, 1.95);

INSERT INTO users VALUES ('Karen', 'Doe', 'doe@gmail.com', 'female', 'true', NULL, NULL, 2.3);

INSERT INTO users VALUES ('Oleh', 'Doe', 'doeddf@gmail.com', 'female', 'true', '2024-04-06', NULL, 1.78);

-- Легальний запис, але теж мусорний

INSERT INTO users VALUES ('', '', '', '', 'true', '1990-12-12', NULL, NULL); -- з Boolean не пройде

-- CONSTRAINT (Обмеження!)

