--Фильтр
SELECT 
* 
FROM posts
WHERE user_id in (1,4);

--Поиск
SELECT 
*
FROM users 
WHERE first_name LIKE '%ba%';

--Cортировка
SELECT 
*
FROM posts 
ORDER BY content ASC;

--Фильтр и сортировка
SELECT 
*
FROM users
WHERE id in (1,3)
ORDER BY birth_date DESC;

--Объединение двух таблиц
SELECT 
p.id AS "ID", 
p.content AS "Контент",
p.created_at AS "Дата создания", 
p.user_id AS "ID Пользователя",
u.first_name || ' ' || u.last_name AS "ФИО",
u.username AS "Имя Пользователя"
FROM posts p
INNER JOIN users u ON u.id = p.user_id --Объединение
WHERE p.user_id in (1,2,4) AND p.id > 5-- Фильтрация
ORDER BY p.created_at ASC; --Сортировка

--Практическая работа

