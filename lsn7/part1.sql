CREATE TABLE students (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	date_of_birth DATE NOT NULL
);

CREATE TABLE grade (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	grade INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students(fullname, date_of_birth) 
VALUES 
('Ruslan', '2008-11-25'),
('Jahangir', '2009-10-06'),
('Rashid', '2008-07-13'),
('Malika', '1999-02-21');

SELECT * FROM students;

INSERT INTO grade(grade,student_id) 
VALUES
-- Ruslan
(12,1),
(11,1),
(12,1),
--Jahangir
(10,2),
(8,2),
(9,2),
(0,2),
(12,2),
--Rashid,
(8,3),
(0,3),
(0,3),
(11,3),
--Malika 
(12,4),
(12,4),
(12,4),
(12,4);

-- COUNT считает общее кол-во
SELECT COUNT (*) FROM students;
-- AVG находит среднее значение
SELECT
s.fullname,
AVG(g.grade)
FROM students s
INNER JOIN grade g
ON g.student_id = s.id
GROUP BY s.fullname
HAVING AVG(	g.grade) > 7;

