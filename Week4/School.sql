--Homework 3

CREATE TABLE school__students(studentId integer PRIMARY KEY AUTO_INCREMENT, name varchar(40) NOT null);
CREATE TABLE school__professors(profId integer PRIMARY KEY AUTO_INCREMENT, name varchar(40) NOT null);
CREATE TABLE school__rooms(roomId integer PRIMARY KEY AUTO_INCREMENT, numberOfSeats integer NOT null);

CREATE TABLE school__classes (classId integer PRIMARY KEY AUTO_INCREMENT, profId integer, roomId integer, name varchar(50), limits integer, FOREIGN KEY(profId) REFERENCES school__professors(profId), FOREIGN KEY(roomId) REFERENCES school__rooms(roomId));

CREATE TABLE school__studentAttendanceLecture(studentId integer, classId integer, FOREIGN KEY(studentId) REFERENCES school__students(studentId), FOREIGN KEY(classId) REFERENCES school__classes(classId));


--Values
INSERT INTO school__students (name) VALUES ('Daniel'), ('Max'), ('Anna');
INSERT INTO school__professors (name) VALUES ('Borrmann'),('Rank'),('Kolbe');
INSERT INTO school__rooms (numberOfSeats) VALUES (80),(30),(200);

-- need to check this
INSERT INTO school__classes (profId,roomId,name,limits) VALUES ((SELECT profId FROM school__professors WHERE name 'Rank'),1,'Math',40)((SELECT profId FROM school__professors WHERE name='Rank'),2,'FEM',30),((SELECT profId FROM school__professors WHERE name'Borrmann'),2,'BIM',70);
INSERT INTO school__studentAttendanceLecture VALUES (1,1),(1,2),(2,3),(3,1),(3,2),(3,3);


--selection statements

SELECT school__professors.name FROM school__professors JOIN school__classes ON school__professors.profId=school__classes.classId;

SELECT school__classes.name FROM school__professors JOIN school__classes ON school__professors.profId=school__classes.classId WHERE school__professors.name='Rank';

SELECT name FROM school__professors UNION SELECT name FROM school__students;