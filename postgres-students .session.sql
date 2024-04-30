-- Ключ - ознака (найчастіше штучна) яка відрізняє один запис у таблиці від іншого
-- Первинний ключ (PRIMARY KEY) - використовується для того, щоб ключу дати обмеження унікальності (UNIQUE) і обмеження NOT NULL
-- Потенційний ключ - стовпець (група стовпців) які могли стати первинним ключем, але ще не обрані як такі.
-- Зовнішній ключ (foreign key) - стовпець (група стовпців) які містять значення, які посилаються на ідентифікатори в інших таблицях
-- Каскадне видалення - якщо ви видаляєте запис у батьківській таблиці, то автоматично будуть видалені всі записи у дочірніх таблицях, які мають посилання на цей видалений запис.
-- Каскадне оновлення - якщо значення у записі батьківської таблиці змінюється, то всі відповідні записи у дочірніх таблицях автоматично змінюються згідно цих змін

CREATE TABLE orders(
    ...
    user_id int REFERENCES user(id) ON UPDATE CASCADE ON DELETE RESTRICT 
    ...
);

DROP TABLE reactions;

CREATE TABLE reactions(
    content_id int REFERENCES contents(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id),
    is_liked boolean
);

INSERT INTO reactions VALUES
(1, 1, false);

DELETE FROM contents WHERE id = 1;