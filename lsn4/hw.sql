CREATE TABLE authors(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL
);

CREATE TABLE books(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(512) NOT NULL,
	year INT NOT NULL,
	description VARCHAR(2025),
	rating INT NOT NULL,
	author_id BIGINT REFERENCES authors(id)
);

SELECT * FROM authors;
SELECT * FROM books;

DROP TABLE books;

INSERT INTO authors(first_name, last_name, birth_date)
VALUES
	('James', 'Clear', '01-01-1986'),
	('Napoleon', 'Hill', '26-10-1883'),
	('Lev', 'Tolstoy', '7-11-1910'),
	('Mihail', 'Lermontov', '15-07-1841'),
	('Jhoan', 'Rowling', '31-07-1965')

INSERT INTO books(name,year,description,rating, author_id) 
VALUES
('Atomic habits',2018, NULL, 10,1),
('clear-2',2017 , NULL, 9,1),
('clear-3', 2016, NULL, 8,1),
('clear-4',2015 , NULL, 7,1),
('hill-1', 1920, NULL, 6,2),
('hill-2', 1919, NULL, 5,2),
('hill-3', 1918, NULL, 4,2),
('hill-4', 1917, NULL, 3,2),
('tolstoy-1', 1940 , NULL, 2,3),
('tolstoy-2', 1939, NULL, 1,3),
('tolstoy-3', 1938, NULL, 10,3),
('tolstoy-4', 1937, NULL, 9,3),
('lermontov-1',1864 , NULL, 8,4),
('lermontov-2', 1863, NULL, 7,4),
('lermontov-3', 1862, NULL, 6,4),
('lermontov-4', 1861, NULL, 5,4),
('rowling-1',1991 , NULL, 4,5),
('rowling-2', 1990, NULL, 3,5),
('rowling-3', 1989, NULL, 2,5),
('rowling-4', 1988, NULL, 1,5)

SELECT 
b.id AS "ID",
b.name AS "Название книги",
a.first_name || ' ' || a.last_name AS "Имя автора",
b.year AS "Год выпуска",
b.rating AS "Рейтинг книги"
FROM books b
INNER JOIN authors a ON a.id = b.author_id
WHERE a.id IN (1,2,3,5) AND b.rating > 5
ORDER BY b.year ASC;