/*
Задача : порахувати кількість замовлень
*/

CREATE MATERIALIZED VIEW total_orders AS (
    SELECT count(*) AS "загальна кількість замовлень" 
    FROM orders
)

SELECT * FROM total_orders; -- 2983 замовлення

INSERT INTO orders (customer_id, status)
VALUES (3000, false);

REFRESH MATERIALIZED VIEW total_orders;



CREATE FUNCTION refresh_materialized_view ()
RETURNS void
AS
$$
BEGIN
    REFRESH MATERIALIZED VIEW total_orders;
END;
$$
LANGUAGE plpgsql;

SELECT refresh_materialized_view ();

