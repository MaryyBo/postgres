/*

order -> status:
    -true = виконано
    -false = не виконано
    - ('new', 'processing', 'shipped', 'done', 'canceled')
    
*/

SELECT * FROM orders
WHERE status = true;

INSERT INTO orders (customer_id, status) VALUES
(2501, 'new');

CREATE TYPE order_status AS ENUM('new', 'processing', 'shipped', 'done', 'canceled');

ALTER TABLE orders
ALTER COLUMN status 
TYPE order_status
USING (
    CASE status
            WHEN false THEN 'processing'
            WHEN true THEN 'done'
            ELSE 'new' 
    END 
)::order_status;

SELECT * FROM orders
ORDER BY created_at DESC;

UPDATE orders
SET status = 'shipped'
WHERE id = 1
