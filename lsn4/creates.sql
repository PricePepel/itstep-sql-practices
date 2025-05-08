-- Cоздание таблицы если ее нет
CREATE TABLE IF NOT EXISTS users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, -- Автоматически будет генерировать id
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	username VARCHAR(512) UNIQUE NOT NULL, --нужно давать уникальное значение
	birth_date DATE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- тот же самый DATETIME
);

CREATE TABLE IF NOT EXISTS posts (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	content VARCHAR(2048) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_id BIGINT REFERENCES users (id) -- связываем users и posts
)


