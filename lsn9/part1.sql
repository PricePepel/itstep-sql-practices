CREATE TABLE users (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(512) NOT NULL,
	username VARCHAR(320) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profiles (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
	bio TEXT
);

--Хранимая процедура для создания пользователя и его профиля

CREATE PROCEDURE add_user (u_full_name VARCHAR(512), u_username VARCHAR(320))
LANGUAGE plpgsql
AS $$
--Создаем переменную
DECLARE new_user_id BIGINT;
BEGIN
	-- Создание пользователя
	INSERT INTO users (full_name, username)
	VALUES (u_full_name, u_username)
	RETURNING id INTO new_user_id; -- Засовываем id созданного пользователя в переменную
	-- Создание профиля
	INSERT INTO profiles(user_id)
	VALUES (new_user_id);
END;
$$;

CALL add_user('Ruslan Kan', 'kan2008');

SELECT * FROM users;
SELECT * FROM profiles;

