DROP DATABASE IF EXISTS week5_db;

CREATE DATABASE week5_db;

USE week5_db;
CREATE TABLE physician (
    employeeid INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    ssn VARCHAR(20)
);
INSERT INTO physician VALUES
(1,'John Dorian','Staff Internist','111111111'),
(2,'Elliot Reid','Staff Internist','222222222'),
(3,'Bob Kelso','Head Chief of Medicine','555555555'),
(6,'Todd Quinlan','Surgical Attending Physician','666666666'),
(7,'John Wen','Surgical Attending Physician','777777777'),
(8,'Keith Dudemeister','MD Resident','888888888'),
(9,'Molly Clock','Attending Psychiatrist','999999999');

SELECT * FROM physician;
CREATE TABLE department (
    departmentid INT PRIMARY KEY,
    name VARCHAR(100),
    head INT
);

INSERT INTO department VALUES
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9);
SELECT * FROM department;
