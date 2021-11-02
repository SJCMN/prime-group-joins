-- 1. Get all customers and their addresses.

SELECT "customers"."first_name", "customers"."last_name", "addresses"."street", "addresses"."city", "addresses"."state", "addresses"."zip" FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"

-- 2. Get all orders and their line items (orders, quantity and product).

SELECT "orders"."id", "line_items"."quantity", "products".description
FROM "orders" JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id
;

-- 3. Which warehouses have cheetos?

SELECT "warehouse".warehouse, "products".description
FROM "warehouse" JOIN "warehouse_product" on "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" on "products".id = "warehouse_product".product_id
WHERE "products".id = 5
;

-- 4. Which warehouses have diet pepsi?

SELECT "warehouse".warehouse, "products".description
FROM "warehouse" JOIN "warehouse_product" on "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" on "products".id = "warehouse_product".product_id
WHERE "products".id = 6
;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers".first_name, SUM("line_items".quantity)
FROM "customers" JOIN "orders" ON "customers".id = "orders".id
JOIN "line_items" on "line_items".order_id = "customers".id
GROUP BY "customers".first_name
;

-- 6. How many customers do we have?

SELECT COUNT ("customers".id)
FROM "customers";

-- 7. How many products do we carry?

SELECT COUNT("orders".id)
FROM "orders";

-- 8. What is the total available on-hand quantity of diet pepsi?

SELECT "products".description, SUM("warehouse_product".on_hand)
FROM "products" JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description
;


-- STRETCH
-- 9. How much was the total cost for each order?


-- 10. How much has each customer spent in total?



-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).


