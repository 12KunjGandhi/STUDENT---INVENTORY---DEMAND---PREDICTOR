CREATE DATABASE IF NOT EXISTS student_inventory_db;

USE student_inventory_db;

-- 1. Categories Table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products Table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    minimum_stock INT DEFAULT 5,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

-- 3. Sales Table
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- 4. Stock Transactions Table
CREATE TABLE IF NOT EXISTS stock_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    transaction_type ENUM('IN', 'OUT') NOT NULL,
    quantity INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    remarks VARCHAR(255),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- Categories Data
INSERT INTO categories (category_name)
VALUES
('Stationery'),
('Books'),
('Lab Supplies'),
('Art Supplies'),
('Practical Files');

INSERT INTO products
(product_name, category_id, price, stock_quantity, minimum_stock)
VALUES
('Blue Pen', 1, 10.00, 100, 20),
('Black Pen', 1, 10.00, 80, 20),
('Pencil', 1, 5.00, 120, 25),
('Eraser', 1, 5.00, 60, 15),
('Engineering Mathematics', 2, 450.00, 25, 5),
('Physics Textbook', 2, 350.00, 30, 5),
('Lab Coat', 3, 350.00, 15, 5),
('Microscope Slides', 3, 120.00, 40, 10),
('Drawing Sheets', 4, 20.00, 50, 10),
('Practical File', 5, 40.00, 12, 5);

-- Sample sales data
INSERT INTO sales
(product_id, quantity_sold, sale_price, sale_date, total_amount)
VALUES
(1, 10, 10.00, '2026-11-01', 100.00),
(1, 15, 10.00, '2026-11-03', 150.00),
(1, 12, 10.00, '2026-11-05', 120.00),
(2, 8, 10.00, '2026-11-02', 80.00),
(2, 12, 10.00, '2026-11-06', 120.00),
(3, 15, 5.00, '2026-11-03', 75.00),
(3, 20, 5.00, '2026-11-07', 100.00),
(5, 4, 450.00, '2026-11-04', 1800.00),
(5, 6, 450.00, '2026-11-09', 2700.00),
(6, 5, 350.00, '2026-11-05', 1750.00),
(6, 3, 350.00, '2026-11-10', 1050.00),
(7, 2, 350.00, '2026-11-06', 700.00),
(7, 4, 350.00, '2026-11-12', 1400.00),
(9, 10, 20.00, '2026-11-08', 200.00),
(9, 15, 20.00, '2026-11-13', 300.00),
(10, 5, 40.00, '2026-11-09', 200.00),
(10, 7, 40.00, '2026-11-14', 280.00);

