CREATE DATABASE IF NOT EXISTS week4_db;

USE week4_db;

DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class;

CREATE TABLE class (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE class_info (
    id INT,
    address VARCHAR(30)
);
SHOW TABLES;
DESC class;

DESC class_info;
USE week4_db;

INSERT INTO class VALUES
(1,'abhi'),
(2,'adam'),
(4,'alex');

INSERT INTO class_info VALUES
(1,'DELHI'),
(2,'MUMBAI'),
(3,'CHENNAI');
SELECT *
FROM class
CROSS JOIN class_info;
DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class;

CREATE TABLE class (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE class_info (
    id INT,
    address VARCHAR(30)
);

INSERT INTO class VALUES
(1,'abhi'),
(2,'adam'),
(3,'alex'),
(4,'anu');

INSERT INTO class_info VALUES
(1,'DELHI'),
(2,'MUMBAI'),
(3,'CHENNAI');
SELECT *
FROM class
INNER JOIN class_info
ON class.id = class_info.id;
SELECT class.name,
       class_info.address
FROM class
INNER JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
NATURAL JOIN class_info;
INSERT INTO class VALUES
(5,'ashish');

INSERT INTO class_info VALUES
(7,'NOIDA'),
(8,'PANIPAT');
SELECT *
FROM class
LEFT OUTER JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id
WHERE class_info.id IS NULL;
SELECT *
FROM class
RIGHT OUTER JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id

UNION

SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id;
SELECT id
FROM class

UNION

SELECT id
FROM class_info;
SELECT id
FROM class

UNION ALL

SELECT id
FROM class_info;
SELECT id
FROM class
WHERE id IN (
    SELECT id
    FROM class_info
);
SELECT id
FROM class
WHERE id NOT IN (
    SELECT id
    FROM class_info
);
SELECT
    id,
    name,
    CASE
        WHEN id <= 2 THEN 'Junior'
        ELSE 'Senior'
    END AS level
FROM class;
