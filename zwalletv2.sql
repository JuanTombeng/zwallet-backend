CREATE DATABASE zwallet_app;

USE DATABASE zwallet_app;

CREATE TABLE users (
    id VARCHAR(64) NOT NULL PRIMARY KEY, 
    username VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    password VARCHAR(100) NOT NULL,
    pin INT(6) NOT NULL, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    profile_picture VARCHAR(128) NULL,
    role VARCHAR(64) NOT NULL DEFAULT 'user',
    active TINYINT(1) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL
);

CREATE TABLE accounts (
    id VARCHAR(64) NOT NULL PRIMARY KEY,
    id_user VARCHAR(64) NOT NULL, 
    balance INT(10) NOT NULL DEFAULT 0,
    income INT(10) NOT NULL DEFAULT 0,
    outcome INT(10) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (id_user) REFERENCES users(id)
    ON DELETE CASCADE
);

CREATE TABLE transactions (
    id VARCHAR(64) NOT NULL PRIMARY KEY, 
    from_user_id VARCHAR(64) NOT NULL, 
    to_user_id VARCHAR(64) NOT NULL,
    amount INT(10) NOT NULL DEFAULT 0, 
    transaction_type VARCHAR(50) NOT NULL,
    notes TEXT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (from_user_id) REFERENCES users(id)
    ON DELETE RESTRICT
);