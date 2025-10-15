-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS testr;
USE testr;

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    image_path VARCHAR(255)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price FLOAT NOT NULL,
    stock INT NOT NULL,
    category_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    category_name VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE INDEX products_category_id_fkey ON products(category_id);

CREATE TABLE customers (
    customers_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    premium_rank INT NOT NULL,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grocery_stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    store_rank INT NOT NULL,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    e_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE db_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_status VARCHAR(255) NOT NULL,
    order_day DATETIME NOT NULL,
    payment_method VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customers_id)
);

CREATE INDEX orders_customer_id_fkey ON orders(customer_id);

CREATE TABLE pSuggestions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    priority INT NOT NULL
);

CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    store_location VARCHAR(255) NOT NULL
);

CREATE TABLE product_store (
    product_store_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE INDEX product_id ON product_store(product_id);
CREATE INDEX store_id ON product_store(store_id);

-- Create the users table
CREATE TABLE users(
user_id INT AUTO_INCREMENT PRIMARY KEY
);

-- Create the Cart table
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Assuming you have a Users table
);

-- Create the CartItems table
CREATE TABLE cartItems (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Assuming you have a Products table
);

-- Create the CartStoreComplete view
CREATE VIEW cart_store_complete AS
SELECT 
    c.id as cart_id,
    c.user_id,
    s.store_id,
    s.store_name,
    s.store_location,
    s.store_address,
    s.latitude,
    s.longitude,
    s.store_image,
    SUM(ps.price * ci.quantity) as total,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'product_id', p.product_id,
            'product_name', p.product_name,
            'price', ps.price,
            'quantity', ci.quantity
        )
    ) as products
FROM cart c
INNER JOIN cart_items ci ON c.id = ci.cart_id
INNER JOIN products p ON ci.product_id = p.product_id
INNER JOIN product_store ps ON p.product_id = ps.product_id
INNER JOIN stores s ON ps.store_id = s.store_id
GROUP BY c.id, c.user_id, s.store_id, s.store_name, s.store_location, 
         s.store_address, s.latitude, s.longitude, s.store_image;