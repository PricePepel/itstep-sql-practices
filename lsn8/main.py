import sqlite3

def create_users_table () :
    # подключаемся к БД
    conn = sqlite3.connect("lsn8.db")
    # для управления БД
    cursor = conn.cursor()
    # метод execute нужен для запуска SQL кода
    cursor.execute(
        """
        CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username VARCHAR(255) NOT NULL
        )
        """
    )
    # нужен чтобы сохранить изменение
    conn.commit()
    conn.close()

def add_user (username) :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
        INSERT INTO users (username)
        VALUES (?)
        """, (username, )
    )
    conn.commit()
    conn.close()

def get_all_users():
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
        SELECT * FROM users WHERE id = ?
        """, (1,)
    )
    # users = cursor.fetchall() #берет все
    user = cursor.fetchone() #берет только один
    print(user)
    # print(users)


# create_users_table()

# add_user("Ruslan")
# add_user("Akbar")
# add_user("Yusuf")

# get_all_users()

def create_authors_table () :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
        CREATE TABLE authors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(255) NOT NULL,
            last_name VARCHAR (255) NOT NULL,
            date_of_birth INTEGER NOT NULL
        )
        """
    )
    conn.commit()
    conn.close()

# def drop_authors_table () :
#     conn = sqlite3.connect("lsn8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         """
#         DROP TABLE books
#         """
#     )
#     conn.commit()
#     conn.close()
#
# drop_authors_table()

def create_books_table () :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
        CREATE TABLE books (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            rating INTEGER,
            year INTEGER NOT NULL,
            author_id INTEGER NOT NULL,
            FOREIGN KEY(author_id) REFERENCES authors(id)
        )
        """
    )

    conn.commit()
    conn.close()

# create_authors_table()
# create_books_table()

def add_authors (first_name, last_name, date_of_birth) :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            INSERT INTO authors (first_name, last_name, date_of_birth)
            VALUES (?, ?, ?)
        """, (first_name, last_name, date_of_birth)
    )
    conn.commit()
    conn.close()

# add_authors("James", "Clear", "1986")
# add_authors("Napoleon", "Hill", "1883")
# add_authors("Lev", "Tolstoy", "1828")
# add_authors("Robert", "Green", "1959")
# add_authors("George", "Orwell", "1903")

def add_books (name, year, author_id, rating) :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            INSERT INTO books (name, year, author_id, rating)
            VALUES (?, ?, ?, ?)
        """, (name, year, author_id, rating)
    )
    conn.commit()
    conn.close()

# add_books("Atomic Habits", 2018,1, 10)
# add_books("Eat the frog", 2001, 1, 8)
# add_books("Transform Your Habits", 2020, 1, 9)
# add_books("Mastering Creativity", 2015, 1, 10)
# add_books("Success through a positive mental", 1959, 2, 6)
# add_books("Think and grow rich", 1937, 2, 6)
# add_books("Richest man in Babylon", 1926, 2, 8)
# add_books("War and peace", 1867, 3, 10)
# add_books("Anna Karenina", 1878, 3, 5)
# add_books("Path of life", 1906, 3, 3)
# add_books("The 48 laws of power", 1998, 4, 10)
# add_books("Mastery", 2012, 4, 2)
# add_books("The art of seduction", 2004, 4, 2)
# add_books("Keep the Aspidistra Flying",1936 , 5, 4)
# add_books("Animal Farm",1945 , 5, 6)
# add_books("1984", 1949, 5, 10)

def get_authors_by_date () :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
             SELECT * FROM authors
             WHERE date_of_birth > 1945 AND date_of_birth < 2000
        """
    )
    authors = cursor.fetchall()
    print(authors)

# get_authors_by_date()

# def find_authors_by_name (first_name) :
#     conn = sqlite3.connect("lsn8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         f"""
#              SELECT * FROM authors
#              WHERE first_name LIKE '{first_name}'
#         """
#     )
#     authors = cursor.fetchall()
#     print(authors)
#
# find_authors_by_name("Robert")

# def find_books_by_name (name) :
#     conn = sqlite3.connect("lsn8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         f"""
#              SELECT * FROM books
#              WHERE name LIKE '%{name}%'
#         """
#     )
#     books = cursor.fetchall()
#     print(books)
#
# find_books_by_name("48")

def get_books_by_rating () :
    conn = sqlite3.connect("lsn8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
             SELECT * FROM books
             WHERE rating > 6 AND rating <= 10
        """
    )
    books = cursor.fetchall()
    print(books)

get_books_by_rating()