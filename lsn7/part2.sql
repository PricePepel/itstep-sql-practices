--Кол-во заказов
SELECT COUNT(*) FROM orders;
--Общая сумма заказов
SELECT SUM(price) FROM orders;
--Общая сумма заказов каждого клиента
SELECT
customer_id,
SUM(price * quantity)
FROM orders
GROUP BY customer_id
ORDER BY SUM(price) ASC;

SELECT
product,
SUM(quantity)
FROM orders
GROUP BY product;

SELECT 
id,
AVG(price*quantity)
FROM orders
GROUP BY id;

SELECT 
order_date,
COUNT(id)
FROM orders
GROUP BY order_date;

SELECT 
c.fullname,
SUM(o.price*o.quantity)
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.id
GROUP BY c.fullname;

SELECT 
c.fullname,
SUM(o.price*o.quantity)
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.id
GROUP BY c.fullname
HAVING SUM(o.price*o.quantity)>1000;