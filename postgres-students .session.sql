--Ключ - ознака (штучна) яка відрізняє один запис у таблиці від іншого
--Первинний ключ (PRIMARY KEY) використов для тог, щоб ключу дати обмеження унікальності і обмеження NOT NULL

/*Первинні ключі на 2 стовпці*/


CREATE TABLE coordinates (
    x int,
    y int,
    z int,
    CONSTRAINT "unique coord" PRIMARY KEY(x,y,z)
);

--(111,22,36)
--(252,76,88)
--(111,22,36) <---- тут має повернутися помилка

INSERT INTO coordinates VALUES 
(111,22,36),
(252,76,88);

INSERT INTO coordinates VALUES 
(111,22,36); -- Повернеться помилка

INSERT INTO coordinates VALUES 
(231,45,56),
(252,76,88); -- також звалимось на помилці на етапі аналізу
