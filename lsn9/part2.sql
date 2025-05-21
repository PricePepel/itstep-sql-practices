-- DROP Удаление процедуры
DROP PROCEDURE add_user(VARCHAR, VARCHAR);

CREATE TABLE balances (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) DEFAULT 0
);

CREATE TABLE transactions (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) CHECK(amount> 1),
	sender_id BIGINT REFERENCES balances(id),
	getter_id BIGINT REFERENCES balances(id)
);


CREATE PROCEDURE add_balance (b_amount NUMERIC(10, 2)) 
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO balances (amount)
	VALUES(b_amount);
END;
$$;

CALL add_balance (2300);
CALL add_balance (1800);
SELECT * FROM balances;


CREATE PROCEDURE perevod (t_amount NUMERIC(10,2), t_sender_id BIGINT, t_getter_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO transactions (amount, sender_id, getter_id)
	VALUES (t_amount, t_sender_id, t_getter_id);
	
	UPDATE balances 
	SET amount = amount - t_amount
	WHERE id = t_sender_id;

	UPDATE balances
	SET amount = amount + t_amount
	WHERE id = t_getter_id;	
END;
$$;

CALL perevod(200, 1,3);
SELECT * FROM transactions;

CREATE TABLE authors (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    fullname VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    author_id BIGINT REFERENCES authors(id) ON DELETE CASCADE
);

CREATE PROCEDURE add_book_with_author (a_fullname VARCHAR(255), b_title VARCHAR(255)) 
LANGUAGE plpgsql
AS $$
DECLARE new_book_id BIGINT;
BEGIN
	INSERT INTO authors (fullname)
	VALUES (a_fullname)
	RETURNING id INTO new_book_id;

	INSERT INTO books (title, author_id)
	VALUES (b_title, new_book_id);
END;
$$;

DROP PROCEDURE add_book_with_author(VARCHAR(255),VARCHAR(255));

CALL add_book_with_author('Leo Tolstoy', 'War and Peace');
SELECT * FROM authors;
SELECT * FROM books;