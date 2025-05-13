-- create database salesDB
-- SELECT checkNumber, paymentDate, amount
-- FROM payments;
-- SELECT orderDate, requiredDate, status
-- FROM orders
-- WHERE status = 'In Process'
-- ORDER BY orderDate DESC;
-- SELECT firstName, lastName, email
-- FROM employees
-- WHERE jobTitle = 'Sales Rep'
-- ORDER BY employeeNumber DESC;
-- SELECT * 
-- FROM offices;
-- SELECT productName, quantityInStock
-- FROM products
-- ORDER BY buyPrice ASC
-- LIMIT 5;

-- 

-- 5 latest total payment amount for Each Payment Date 
-- SELECT payment_date, SUM(amount) AS total_payment
-- FROM payments
-- GROUP BY payment_date
-- ORDER BY payment_date DESC
-- LIMIT 5;

-- -- Average credit limit of each customer
-- SELECT customer_name, country, AVG(credit_limit) AS avg_credit_limit
-- FROM customers
-- GROUP BY customer_name, country;

-- -- Total price of products ordered
-- SELECT product_code, quantity_ordered, SUM(quantity_ordered * price_each) AS total_price
-- FROM orderdetails
-- GROUP BY product_code, quantity_ordered;

-- -- Highest payment amount for each check number
-- SELECT check_number, MAX(amount) AS highest_payment
-- FROM payments
-- GROUP BY check_number;

-- -- Drop an index named IdxPhone from the customers table
-- DROP INDEX IdxPhone ON customers;

-- -- Create a user named bob with the password 'S$cu3r3!', restricted to localhost
-- CREATE USER 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- -- Grant the INSERT privilege to bob on the salesDB database
-- GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- -- Change the password for the user bob to 'P$55!23'
-- ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';


-- -- Get productName, productVendor, and productLine using a left join
-- SELECT 
--     p.productName,
--     p.productVendor,
--     p.productLine
-- FROM 
--     products p
-- LEFT JOIN 
--     productlines pl ON p.productLine = pl.productLine;

-- -- Retrieve orderDate, shippedDate, status, and customerNumber for the first 10 orders using a right join
-- SELECT 
--     o.orderDate,
--     o.shippedDate,
--     o.status,
--     o.customerNumber
-- FROM 
--     customers c
-- RIGHT JOIN 
--     orders o ON c.customerNumber = o.customerNumber
-- LIMIT 10;


-- Create database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Members table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_joined DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Categories table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year YEAR,
    category_id INT,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- BookAuthors table (many-to-many relationship between books and authors)
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- BorrowRecords table (tracks borrowing activity)
CREATE TABLE BorrowRecords (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


