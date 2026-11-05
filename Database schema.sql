-- ====================================
-- CRITICAL FIX: Drop and recreate all tables
-- Run this in MySQL immediately!
-- ====================================

USE smart_bank;

-- Drop all tables
DROP TABLE IF EXISTS otp_details;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

-- Recreate customers table with CORRECT column names
CREATE TABLE customers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mobile VARCHAR(10) NOT NULL UNIQUE,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL DEFAULT '',
    temp_password VARCHAR(50),
    temp_password_active BOOLEAN NOT NULL DEFAULT TRUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    balance DOUBLE NOT NULL DEFAULT 0.0,
    INDEX idx_account_number (account_number),
    INDEX idx_email (email),
    INDEX idx_mobile (mobile)
);

-- Recreate transactions table
CREATE TABLE transactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    from_account VARCHAR(20) NOT NULL,
    to_account VARCHAR(20) NOT NULL,
    amount DOUBLE NOT NULL,
    type VARCHAR(20) NOT NULL,
    transaction_date DATETIME NOT NULL,
    INDEX idx_from_account (from_account),
    INDEX idx_to_account (to_account),
    INDEX idx_transaction_date (transaction_date)
);

-- Recreate loans table
CREATE TABLE loans (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    loan_type VARCHAR(20) NOT NULL,
    amount DOUBLE NOT NULL,
    tenure_months INT NOT NULL,
    interest_rate DOUBLE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    applied_date DATE NOT NULL,
    INDEX idx_account_number (account_number),
    INDEX idx_status (status)
);

-- Recreate otp_details table
CREATE TABLE otp_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    otp VARCHAR(6) NOT NULL,
    expiry_time DATETIME NOT NULL,
    INDEX idx_account_number (account_number),
    INDEX idx_expiry_time (expiry_time)
);

-- Verify tables were created
SHOW TABLES;

-- Verify customers table structure
DESCRIBE customers;
