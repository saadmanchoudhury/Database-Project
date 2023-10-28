use testdb;
show tables;
select * from authors;
DROP TABLE IF EXISTS User;


CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birthday DATE,
    address_street_num VARCHAR(255),
    address_street VARCHAR(255),
    address_city VARCHAR(255),
    address_state VARCHAR(255),
    address_zip_code VARCHAR(10),
    balance DECIMAL(10, 2) DEFAULT 1000.00,
    transactions DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE TreeRequest (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    submission_date DATE,
    note TEXT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Tree (
    tree_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT,
    size DECIMAL(8, 2),
    height DECIMAL(8, 2),
    location VARCHAR(100),
    is_near_house BOOLEAN,
    FOREIGN KEY (request_id) REFERENCES TreeRequest(request_id)
);

CREATE TABLE Quote (
    quote_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT,
    response_date DATE,
    initial_price DECIMAL(10, 2),
    work_period VARCHAR(50),
    note TEXT,
    FOREIGN KEY (request_id) REFERENCES TreeRequest(request_id)
);

CREATE TABLE OrderOfWork (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    quote_id INT,
    acceptance_date DATE,
    FOREIGN KEY (quote_id) REFERENCES Quote(quote_id)
);

CREATE TABLE Bill (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    generation_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES OrderOfWork(order_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    FOREIGN KEY (bill_id) REFERENCES Bill(bill_id)
);

