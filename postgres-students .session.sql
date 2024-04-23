DROP TABLE users;
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

/*
 numeric ( точність, масштаб)
 точність - загальна кількість цифр в числі
 масштаб -  кфлькфсть цифр після коми
 
 180.55
 точність - 5 цифр
 масштаб - 2 цифри
 */

 