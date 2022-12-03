--Lecture 3
--Creating tables from the diagram
CREATE TABLE instructorsCoarses__instructors (id integer PRIMARY KEY AUTO_INCREMENT, name varchar(50), department varchar(50));
CREATE TABLE instructorsCoarses__courses (name varchar(50) PRIMARY KEY, time datetime);
CREATE TABLE instructorsCoarses__textBook (ISBN integer PRIMARY KEY AUTO_INCREMENT, name varchar(50), publisher varchar(50), author varchar(50));
CREATE TABLE instructorsCoarses__instructorTeachesCoarses (instructorId integer, coursesName varchar(50));
CREATE TABLE instructorsCoarses__coursesUsesTextBook (coursesName varchar(50), textBookISBN integer);