-- Active: 1742742094218@@127.0.0.1@5432@bookstore_db

                                           -- 📂 Table Creation

-- 1️⃣ Create a "books" table

CREATE TABLE books(
    id SERIAL PRIMARY KEY ,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price>=0),
    stock INT CHECK (stock >= 0),
    published_year INT
)



-- 2️⃣ Create a "customers" table

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);



-- 3️⃣ Create an "orders" table 

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
    book_id INTEGER REFERENCES books(id),
    quantity INT CHECK(quantity>0),
    order_date DATE DEFAULT CURRENT_DATE
);


                                       -- 📂 Data Insert Into Table


-- 1️⃣ Insert sample data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);


-- 2️⃣ Insert sample data into customers table
INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');


-- 3️⃣ Insert sample data into orders table
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');




                                     -- 📂 SQL QUERY --


-- 1️⃣ Find books that are out of stock.
SELECT title from books 
WHERE stock = 0;

-- 2️⃣ Retrieve the most expensive book in the store.
SELECT * from books ORDER BY price DESC LIMIT 1;

-- 3️⃣ Find the total number of orders placed by each customer.
SELECT customers.name , COUNT(orders.id) AS total_order 
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

-- 4️⃣ Calculate the total revenue generated from book sales.
SELECT SUM(books.price * orders.quantity) AS avg_book_price
from orders 
JOIN books ON orders.book_id = books.id;

-- 5️⃣ List all customers who have placed more than one order.
SELECT customers.name, COUNT(orders.id) AS orders_count 
from customers 
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.id)>1 ;

-- 6️⃣ Find the average price of books in the store.
SELECT ROUND(AVG(price),2) as avg_book_price  
FROM books 

-- 7️⃣ Increase the price of all books published before 2000 by 10%.
UPDATE books  SET price = price + (price * 0.10)
WHERE published_year < 2000;

-- 8️⃣ Delete customers who haven't placed any orders.
DELETE FROM customers 
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders); 

