-- Create Database
CREATE DATABASE shopdb;

-- Create User
CREATE USER 'shopuser'@'%' IDENTIFIED BY 'Password@123';

-- Grant Privileges
GRANT ALL PRIVILEGES ON shopdb.* TO 'shopuser'@'%';
FLUSH PRIVILEGES;

-- Use Database
USE shopdb;

-- Create Products Table
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO products (name, price) VALUES
('Laptop', 50000.00),
('Mouse', 500.00);

-- Verify Data
SELECT * FROM products;