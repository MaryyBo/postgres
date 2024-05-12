SELECT * FROM users 
WHERE gender IS NULL;

ALTER TABLE orders
ADD column status boolean;

UPDATE orders
SET status = true
WHERE id % 2 = 0;

UPDATE orders
SET status = false
WHERE id % 2 = 1;

SELECT id, created_at, customer_id, status AS order_status FROM orders

-- 1 syntax CASE

-- CASE 
--     WHEN condition1 = true 
--     THEN result1
--     WHEN condition2 = true 
--     THEN result2
--     ...
--     ELSE result3
-- END

--Задача. Вивести всі замовлення. Твам де стату true, написати "виконано", де false - "нове"

SELECT id, created_at, customer_id, status, (
    CASE
    WHEN status = true
    THEN 'виконано'
    WHEN status = false
    THEN 'нове'
    ELSE 'шнший статус'
    END
) AS order_status 
FROM orders
ORDER BY id;


-- 2 syntax CASE

/*
    CASE condition1 WHEN value1 THEN result1
                    WHEN value2 THEN result2
                    ...
             ELSE default_result
    END;   
*/   

-- Витягти місяць народження юзера і на його основі вивести, народився він восени, навесні, влітку чи взимку


SELECT *, (
    CASE EXTRACT('month' from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'autumn'
        WHEN 10 THEN 'autumn'
        WHEN 11 THEN 'autumn'
        WHEN 12 THEN 'winter'
        ELSE 'unknown'
    END
) FROM users



