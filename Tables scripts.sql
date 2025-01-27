-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS cartbutler;
USE cartbutler;

-- Create the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the customers table
CREATE TABLE customers (
    customers_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    address TEXT,
    premium_rank INT,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the grocery_stores table
CREATE TABLE grocery_stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    `rank` INT,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the employees table
CREATE TABLE employees (
    e_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Create the db_users table
CREATE TABLE db_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_status VARCHAR(255),
    order_day DATE,
    payment_method VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customers_id)
);