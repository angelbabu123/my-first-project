CREATE DATABASE expense_tracker;
USE expense_tracker;
CREATE TABLE expenses (
    Date DATE,
    Category VARCHAR(50),
    Payment_Mode VARCHAR(20),
    Description VARCHAR(250),
    Amount_Paid decimal(19,2),
    Cashback decimal(19,2)
);
select*from expenses

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE payment_modes (
    payment_mode_id INT AUTO_INCREMENT PRIMARY KEY,
    mode_name VARCHAR(20) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE cashback_transactions (
    cashback_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT,
    cashback_amount DECIMAL(10,2) NOT NULL,
    cashback_date DATE,
    status ENUM('pending', 'processed', 'credited') DEFAULT 'pending',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (expense_id) REFERENCES expenses(expense_id)
);

SELECT Category, SUM(Amount_Paid)
FROM expenses
GROUP BY Category;
SELECT Payment_Mode, SUM(Amount_Paid)
FROM expenses
GROUP BY Payment_Mode;




