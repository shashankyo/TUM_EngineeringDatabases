--Lecture 3
--Creating tables from the diagram
CREATE TABLE instructorsCoarses__instructors (id integer PRIMARY KEY AUTO_INCREMENT, name varchar(50), department varchar(50));
CREATE TABLE instructorsCoarses__courses (name varchar(50) PRIMARY KEY, time datetime);
CREATE TABLE instructorsCoarses__textBook (ISBN integer PRIMARY KEY AUTO_INCREMENT, name varchar(50), publisher varchar(50), author varchar(50));
CREATE TABLE instructorsCoarses__instructorTeachesCoarses (instructorId integer, coursesName varchar(50));
CREATE TABLE instructorsCoarses__coursesUsesTextBook (coursesName varchar(50), textBookISBN integer);


--Values for the table instructors
INSERT INTO instructorsCoarses__instructors(name,department) VALUES ('Tom', 'CMS');
INSERT INTO instructorsCoarses__instructors(name,department) VALUES ('Alice', 'CIE');
INSERT INTO instructorsCoarses__instructors(name,department) VALUES ('Bob', 'CMS');
INSERT INTO instructorsCoarses__instructors(name,department) VALUES ('Rank', 'CIE');
INSERT INTO instructorsCoarses__instructors(name,department) VALUES ('Borrmann', 'CMS');

--selection and projection
SELECT name FROM (SELECT * FROM instructorsCoarses__instructors WHERE department ='CMS') as alias1;
SELECT name FROM instructorsCoarses__instructors where department = 'CMS'; -- same as above
SELECT * FROM (SELECT * FROM (SELECT id, department FROM instructorsCoarses__instructors) as alians2 WHERE department='CMS' )as alians1 WHERE id=1;
SELECT * FROM (SELECT id,department FROM instructorsCoarses__instructors) as alians1 WHERE department='CMS' AND id>2;
SELECT * FROM (SELECT department FROM (SELECT id,department FROM instructorsCoarses__instructors) AS alias1 ) AS alias2 WHERE id>2; -- wont work bc we have extracted only department from 2nd selection
