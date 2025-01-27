# CartButler Database

This repository contains SQL scripts for setting up and populating the CartButler database. The database includes tables for products, customers, grocery stores, employees, users, and orders.

## Files

- Tables scripts.sql: Contains SQL scripts to create the database and its tables.
- Sample data.txt: Contains SQL scripts to insert sample data into the tables.

## Table Structure

### Categories Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| category_id   | INT AUTO_INCREMENT| Primary key                     |
| category_name | VARCHAR(255)      | Name of the category            |

### Products Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| product_id    | INT AUTO_INCREMENT| Primary key                     |
| product_name  | VARCHAR(255)      | Name of the product             |
| description   | TEXT              | Description of the product      |
| price         | DECIMAL(10, 2)    | Price of the product            |
| stock         | INT               | Stock quantity                  |
| category_id   | INT               | Foreign key referencing category_id |
| created_at    | TIMESTAMP         | Timestamp of creation           |

### Customers Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| customers_id  | INT AUTO_INCREMENT| Primary key                     |
| first_name    | VARCHAR(255)      | First name of the customer      |
| last_name     | VARCHAR(255)      | Last name of the customer       |
| email         | VARCHAR(255)      | Email of the customer           |
| phone_number  | VARCHAR(20)       | Phone number of the customer    |
| address       | TEXT              | Address of the customer         |
| premium_rank  | INT               | Premium rank of the customer    |
| date_joined   | TIMESTAMP         | Timestamp of joining            |

### Grocery Stores Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| store_id      | INT AUTO_INCREMENT| Primary key                     |
| store_name    | VARCHAR(255)      | Name of the store               |
| address       | TEXT              | Address of the store            |
| rank          | INT               | Rank of the store               |
| date_joined   | TIMESTAMP         | Timestamp of joining            |

### Employees Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| e_id          | INT AUTO_INCREMENT| Primary key                     |
| name          | VARCHAR(255)      | Name of the employee            |
| f_name        | VARCHAR(255)      | First name of the employee      |
| l_name        | VARCHAR(255)      | Last name of the employee       |
| email         | VARCHAR(255)      | Email of the employee           |
| phone         | VARCHAR(20)       | Phone number of the employee    |

### DB Users Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| user_id       | INT AUTO_INCREMENT| Primary key                     |
| username      | VARCHAR(255)      | Username of the database user   |
| password      | VARCHAR(255)      | Password of the database user   |

### Orders Table

| Column Name   | Data Type         | Description                     |
|---------------|-------------------|---------------------------------|
| order_id      | INT AUTO_INCREMENT| Primary key                     |
| customer_id   | INT               | Foreign key referencing customers_id |
| order_status  | VARCHAR(255)      | Status of the order             |
| order_day     | DATE              | Date of the order               |
| payment_method| VARCHAR(255)      | Payment method used             |

## Sample Data Scripts

### Products Table

```sql
INSERT INTO products (product_name, description, price, stock, category) VALUES
('Apple', 'Fresh red apples', 0.50, 100, 'Fruits'),
('Banana', 'Ripe yellow bananas', 0.30, 150, 'Fruits'),
('Milk', '1 liter of milk', 1.20, 50, 'Dairy'),
('Bread', 'Whole grain bread', 2.50, 80, 'Bakery'),
('Eggs', 'Dozen large eggs', 2.00, 60, 'Dairy'),
('Chicken Breast', 'Boneless skinless chicken breast', 5.00, 40, 'Meat'),
('Orange Juice', '1 liter of orange juice', 3.00, 30, 'Beverages'),
('Carrots', 'Fresh carrots', 1.00, 100, 'Vegetables'),
('Tomatoes', 'Fresh tomatoes', 1.50, 90, 'Vegetables'),
('Cheese', 'Cheddar cheese block', 4.00, 50, 'Dairy'),
('Yogurt', 'Greek yogurt', 1.00, 70, 'Dairy'),
('Pasta', '1 kg of pasta', 2.00, 120, 'Pantry'),
('Rice', '1 kg of rice', 1.50, 110, 'Pantry'),
('Cereal', 'Box of cereal', 3.00, 80, 'Pantry'),
('Butter', '200g of butter', 2.50, 60, 'Dairy');
```

### Customers table

```sql
INSERT INTO customers (first_name, last_name, email, phone_number, address, premium_rank) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 0),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St', 1);
```

### Grocery Stores Table

```sql
INSERT INTO grocery_stores (store_name, address, `rank`) VALUES
('SuperMart', '789 Oak St', 0),
('FreshMart', '321 Pine St', 1);
```

### Employees Table

```sql
INSERT INTO employees (name, f_name, l_name, email, phone) VALUES
('John', 'John', 'Doe', 'john.doe@company.com', '1234567890'),
('Jane', 'Jane', 'Smith', 'jane.smith@company.com', '0987654321');
```

### DB User Table

```sql
INSERT INTO db_users (username, password) VALUES
('admin', 'admin123'),
('user', 'user123');
```

### Orders table

```sql
INSERT INTO orders (customer_id, order_status, order_day, payment_method) VALUES
(1, 'Pending', '2023-10-01', 'Credit Card'),
(2, 'Completed', '2023-10-02', 'PayPal');
```
