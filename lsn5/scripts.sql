INSERT INTO users (first_name, last_name, password, username) 
VALUES 
	('Rashid', 'Galiev', '1234', 'rashid'),
	('Yusuf', 'Ronaldo', 'cr7', 'cristiano'),
	('Malika', 'Raximbardieva', '111', 'pashtet');


SELECT * FROM users;

INSERT INTO profiles (user_id) 
VALUES (1), (2), (3)

INSERT INTO categories (name) 
VALUES ('Фрукты'), ('Овощи'), ('Напитки')

SELECT * FROM categories;

--Фрукты ID 1
INSERT INTO products(name, price, category_id) 
VALUES 
	('Банан', 10000, 1),
	('Яблоко', 7000, 1),
	('Персик', 15000, 1),
	('Груша', 8000, 1);

--Овощи ID 2
INSERT INTO products(name, price, category_id) 
VALUES 
	('Морковь', 10000, 2),
	('Огурец', 25000, 2),
	('Баклажан', 20000, 2);

--Напитки ID 3
INSERT INTO products(name, price, category_id) 
VALUES 
	('Кола', 18000, 3),
	('FuseTea', 11000, 3),
	('Fanta', 18000, 3);

SELECT * FROM products;

INSERT INTO orders (user_id) 
VALUES (1), (1), (2), (2), (2), (3)

SELECT * FROM orders;

INSERT INTO order_products (product_id, order_id, quantity)
VALUES 
	(1, 1, 5),
	(7,1,2),
	(5,2,1),
	(6,6,10),
	(7,3,3),
	(8,4,4),
	(10,5,1)
	
SELECT * FROM order_products;

SELECT * FROM profiles;
DELETE FROM users WHERE id = 1;

DELETE FROM categories WHERE id = 2;

