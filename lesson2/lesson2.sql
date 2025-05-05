CREATE TABLE categories (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	description TEXT,
	rating REAL DEFAULT 10,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_active BLOB DEFAULT 1,
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

ALTER TABLE products ADD COLUMN category_id INTEGER

DROP TABLE categories;
DROP TABLE products;

INSERT INTO categories(name) VALUES(
	'Хоз-товары'
);
INSERT INTO categories(name) VALUES(
	'Электроника'
);
INSERT INTO categories(name) VALUES(
	'Хлебо-булочное'
);

SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM products WHERE products.category_id ==1;

INSERT INTO products (name, price, description, rating, category_id) VALUES(
	'БУЛЕЧКА', 3, 'БУЛЕЧКА-СЕРДЕЧКА',10, 3
)

SELECT 
	p.name AS 'Название продукта',
	c.name AS 'Название категории'
FROM products p INNER JOIN categories c ON c.id == p.category_id
WHERE p.category_id == 3;