SELECT * FROM users;
SELECT * FROM posts;

--Добавляем лишь одну запись
INSERT INTO users (first_name, last_name, username, birth_date) 
VALUES('Ruslan', 'Kan', 'PricePepel', '25-11-2008');

--Добавляем несколько записей
INSERT INTO users (first_name, last_name, username, birth_date) 
VALUES
('Akbar', 'Khasonov', 'akhasanov', '17-12-2008'),
('Jahongir', 'Nuratdinov', 'jmlb', '6-10-2009'),
('Temur', 'Abbasov', 'abbasovtoolate', '12-02-2009')
;

--Добавляем посты

--Акбар
INSERT INTO posts(content, user_id) 
VALUES('LAKEEEEEERRRS LOSE',2),
('BASSSSSKEEET',2),
('I AM NOT THAT OLD',2)

--Я
INSERT INTO posts(content, user_id) 
VALUES('IELTS 8.5',1),
('SAT хочу 1600',1),
('Поменяю фамилию на Ли',1),
('Я не интересуюсь футболом', 1)

--Джахангир
INSERT INTO posts(content, user_id) 
VALUES('МАБЛА ТОП',3),
('ROBLOX ONE LOVE',3)


--Тимур
INSERT INTO posts(content, user_id) 
VALUES('Я не буду ОПАЗДЫВАТЬ, но это не точно',4)