-- 1-topshiriq

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);


-- 2-topshiriq

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    price DECIMAL(10,2),
    genre VARCHAR(50),
    rating INT,
    discount DECIMAL(10,2)
);


-- 3-topshiriq

INSERT INTO books (title, price, genre, rating, discount)
VALUES
('Clean Code', 35, 'Programming', 5, NULL),
('The Pragmatic Programmer', 40, 'Programming', 5, 5),
('Atomic Habits', 20, 'Self-help', 5, NULL),
('Deep Work', 25, 'Self-help', 4, 3),
('Sapiens', 30, 'History', 5, 4),
('Python Crash Course', 45, 'Programming', 4, 10),
('Rich Dad Poor Dad', 18, 'Business', 4, NULL),
('Zero to One', 28, 'Business', 5, 2);


-- 4-topshiriq

INSERT INTO authors (name)
VALUES
('James Clear'),
('Cal Newport'),
('Robert Martin'),
('Yuval Harari');


-- 5-topshiriq

ALTER TABLE books
ADD COLUMN author_id INT REFERENCES authors(id);


-- 6-topshiriq

UPDATE books
SET author_id = 3
WHERE title = 'Clean Code';

UPDATE books
SET author_id = 1
WHERE title = 'Atomic Habits';

UPDATE books
SET author_id = 2
WHERE title = 'Deep Work';

UPDATE books
SET author_id = 4
WHERE title = 'Sapiens';


-- 7-topshiriq

SELECT * FROM books
ORDER BY price ASC;


-- 8-topshiriq

SELECT * FROM books
ORDER BY price DESC
LIMIT 3;


-- 9-topshiriq

SELECT * FROM books
WHERE price > 25 AND rating = 5;


-- 10-topshiriq

SELECT * FROM books
WHERE genre = 'Business' OR genre = 'History';


-- 11-topshiriq

SELECT * FROM books
WHERE genre IN ('Business', 'History');


-- 12-topshiriq

SELECT * FROM books
WHERE title LIKE 'P%';


-- 13-topshiriq

SELECT * FROM books
WHERE title LIKE '%o%';


-- 14-topshiriq

SELECT * FROM books
WHERE title LIKE '%Work';


-- 15-topshiriq

SELECT * FROM books
WHERE price BETWEEN 20 AND 35;


-- 16-topshiriq

SELECT * FROM books
WHERE discount IS NULL;


-- 17-topshiriq

SELECT * FROM books
WHERE genre = 'Programming'
ORDER BY price ASC
LIMIT 2;


-- 18-topshiriq

SELECT authors.name, books.title
FROM authors
JOIN books
ON authors.id = books.author_id;


-- 19-topshiriq

-- JOIN natijasida 4 ta qator chiqadi.
-- Chunki faqat 4 ta kitobda author_id bor.
-- Qolgan 4 ta kitobda author_id NULL.


-- 20-topshiriq

SELECT authors.name, books.title
FROM authors
JOIN books
ON authors.id = books.author_id
WHERE books.price > 25;


-- 21-topshiriq

SELECT COUNT(*) AS total_books
FROM books;


-- 22-topshiriq

SELECT SUM(price) AS total_price
FROM books;


-- 23-topshiriq

SELECT AVG(price) AS average_price
FROM books;


-- 24-topshiriq

SELECT AVG(price) AS average_price
FROM books
WHERE genre = 'Programming';


-- 25-topshiriq

-- PRIMARY KEY har bir qatorni ajratib turadi.
-- Uning qiymati takrorlanmaydi va NULL bo'lmaydi.


-- 26-topshiriq

-- FOREIGN KEY ikkita jadvalni bog'laydi.
-- Agar mavjud bo'lmagan id yozilsa, xato beradi.


-- 27-topshiriq

-- NULL oddiy qiymat emas.
-- Shuning uchun = NULL emas, IS NULL ishlatiladi.


-- 28-topshiriq

-- UPDATE da WHERE bo'lmasa, barcha qatorlar o'zgaradi.
-- Bu xavfli, chunki kerakli bo'lmagan ma'lumotlar ham o'zgaradi.


-- 29-topshiriq

SELECT * FROM books
WHERE discount IS NOT NULL;


-- 30-topshiriq

SELECT
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM books;


-- 31-topshiriq

SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;