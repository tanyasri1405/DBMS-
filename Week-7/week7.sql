CREATE DATABASE IF NOT EXISTS BankDB;

USE BankDB;


CREATE DATABASE BankDB;
USE BankDB;

DROP VIEW IF EXISTS Customer_Banking_View;
DROP VIEW IF EXISTS Customer_Transaction_View;
DROP VIEW IF EXISTS High_Value_Transaction_View;
DROP VIEW IF EXISTS Withdrawal_Transaction_View;
DROP VIEW IF EXISTS Deposit_Transaction_View;
DROP VIEW IF EXISTS Loan_Total_Amount_View;
DROP VIEW IF EXISTS Loan_Interest_View;
DROP VIEW IF EXISTS Rich_Branches;
DROP VIEW IF EXISTS Multiple_Account_Branches;
DROP VIEW IF EXISTS Account_Type_Balance;
DROP VIEW IF EXISTS Branch_Total_Balance;
DROP VIEW IF EXISTS Branch_Account_Count;
DROP VIEW IF EXISTS Customer_Loan_View;
DROP VIEW IF EXISTS Customer_Account_View;
DROP VIEW IF EXISTS High_Balance_View;
DROP VIEW IF EXISTS Savings_Account_View;
DROP VIEW IF EXISTS Current_Account_View;
DROP VIEW IF EXISTS Customer_Basic_View;
DROP VIEW IF EXISTS Customer_View;

DROP TABLE IF EXISTS Bank_Transaction;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Account (
    Account_No INT PRIMARY KEY,
    Customer_ID INT,
    Account_Type VARCHAR(20),
    Balance DECIMAL(12,2),
    Branch VARCHAR(50),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Bank_Transaction (
    Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    Account_No INT,
    Transaction_Type VARCHAR(20),
    Amount DECIMAL(12,2),
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Account_No)
        REFERENCES Account(Account_No)
);

CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Customer_ID INT,
    Loan_Type VARCHAR(30),
    Loan_Amount DECIMAL(12,2),
    Interest_Rate DECIMAL(5,2),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);
SHOW TABLES;
INSERT INTO Customer
(Customer_ID, Customer_Name, Phone, Email, City)
VALUES
(101, 'Ravi Kumar', '9876543210', 'ravi@gmail.com', 'Hyderabad'),
(102, 'Priya Sharma', '9876543211', 'priya@gmail.com', 'Vijayawada'),
(103, 'Arjun Reddy', '9876543212', 'arjun@gmail.com', 'Bangalore'),
(104, 'Sneha Rao', '9876543213', 'sneha@gmail.com', 'Chennai'),
(105, 'Kiran Kumar', '9876543214', 'kiran@gmail.com', 'Hyderabad'),
(106, 'Anil Kumar', '9876543215', 'anil@gmail.com', 'Delhi'),
(107, 'Meena Reddy', '9876543216', 'meena@gmail.com', 'Mumbai'),
(108, 'Rahul Sharma', '9876543217', 'rahul@gmail.com', 'Pune'),
(109, 'Lakshmi Devi', '9876543218', 'lakshmi@gmail.com', 'Hyderabad'),
(110, 'Suresh Babu', '9876543219', 'suresh@gmail.com', 'Vijayawada');

INSERT INTO Account
(Account_No, Customer_ID, Account_Type, Balance, Branch)
VALUES
(10001, 101, 'Savings', 50000, 'Hyderabad'),
(10002, 102, 'Savings', 75000, 'Vijayawada'),
(10003, 103, 'Current', 120000, 'Bangalore'),
(10004, 104, 'Savings', 45000, 'Chennai'),
(10005, 105, 'Current', 90000, 'Hyderabad'),
(10006, 106, 'Savings', 65000, 'Delhi'),
(10007, 107, 'Current', 150000, 'Mumbai'),
(10008, 108, 'Savings', 35000, 'Pune'),
(10009, 109, 'Savings', 85000, 'Hyderabad'),
(10010, 110, 'Current', 110000, 'Vijayawada');
INSERT INTO Bank_Transaction
(Account_No, Transaction_Type, Amount)
VALUES
(10001, 'DEPOSIT', 10000),
(10001, 'WITHDRAW', 5000),
(10002, 'DEPOSIT', 15000),
(10003, 'WITHDRAW', 20000),
(10004, 'DEPOSIT', 5000),
(10005, 'WITHDRAW', 10000),
(10006, 'DEPOSIT', 12000),
(10007, 'DEPOSIT', 25000),
(10008, 'WITHDRAW', 5000),
(10009, 'DEPOSIT', 20000),
(10010, 'WITHDRAW', 15000);
INSERT INTO Loan
(Loan_ID, Customer_ID, Loan_Type, Loan_Amount, Interest_Rate)
VALUES
(501, 101, 'Home Loan', 5000000, 7.5),
(502, 102, 'Education Loan', 1000000, 6.5),
(503, 103, 'Car Loan', 800000, 8.2),
(504, 104, 'Personal Loan', 500000, 10.5),
(505, 105, 'Home Loan', 4000000, 7.2),
(506, 106, 'Car Loan', 900000, 8.5),
(507, 107, 'Business Loan', 3000000, 9.0),
(508, 109, 'Personal Loan', 600000, 10.0);
SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM Bank_Transaction;
SELECT * FROM Loan;
CREATE VIEW Customer_View AS
SELECT *
FROM Customer;

CREATE VIEW Customer_Basic_View AS
SELECT
    Customer_ID,
    Customer_Name,
    City
FROM Customer;

CREATE VIEW Account_View AS
SELECT
    Account_No,
    Account_Type,
    Balance,
    Branch
FROM Account;

CREATE VIEW Savings_Account_View AS
SELECT *
FROM Account
WHERE Account_Type = 'Savings';

CREATE VIEW Current_Account_View AS
SELECT *
FROM Account
WHERE Account_Type = 'Current';
CREATE OR REPLACE VIEW Savings_Account_View AS
SELECT *
FROM Account
WHERE Account_Type = 'Savings';

CREATE OR REPLACE VIEW Current_Account_View AS
SELECT *
FROM Account
WHERE Account_Type = 'Current';
