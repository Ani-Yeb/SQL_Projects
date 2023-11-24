/*lecture 6*/
/* combining multiple joins*/
/*dropping students, student_projects, sstudents*/

CREATE TABLE students (id INTEGER PRIMARY KEY AUTO_INCREMENT, first_name TEXT, last_name TEXT, email
TEXT, phone TEXT, birthdate TEXT);
INSERT INTO students (first_name, last_name, email, phone, birthdate) VALUES ("Theo", "Rabbit", "theo@rabbit.com", "555-6666", "2002-06-24");
INSERT INTO students (first_name, last_name, email, phone, birthdate) VALUES ("Naa", "Wonderland", "naa@wonderland.com", "555-4444", "2002-07-04");
INSERT INTO students (first_name, last_name, email, phone, birthdate) VALUES ("Fatima", "Lampland", "fatima@lampland.com", "555-3333", "2001-05-10");
INSERT INTO students (first_name, last_name, email, phone, birthdate) VALUES ("Sam", "Kingston", "sam@kingston.com", "555-1111", "2001-12-24");

CREATE TABLE student_projects (id INTEGER PRIMARY KEY AUTO_INCREMENT,student_id INTEGER,title TEXT);
 INSERT INTO student_projects (student_id, title) VALUES (1, "Carrotapault"); 
 INSERT INTO student_projects (student_id, title) VALUES (2, "Mad Hattery");
INSERT INTO student_projects (student_id, title) VALUES (3, "Carpet Physics");
INSERT INTO student_projects (student_id, title) VALUES (4, "Hyena Habitats");
 
 CREATE TABLE project_pairs (id INTEGER PRIMARY KEY AUTO_INCREMENT, project1_id INTEGER, project2_id INTEGER);
INSERT INTO project_pairs (project1_id, project2_id) VALUES(1, 2);
INSERT INTO project_pairs (project1_id, project2_id) VALUES(3, 4);

/*querying data from the tables*/
SELECT * FROM students;

SELECT * FROM student_projects;
SELECT * FROM project_pairs;

SELECT * FROM project_pairs
JOIN student_projects p1
JOIN student_projects p2;

/*THE WHOLE SHOW*/

SELECT student_projects.title, p2.title FROM project_pairs
JOIN student_projects
ON project_pairs.project1_id = student_projects.id
JOIN student_projects AS p2
ON project_pairs.project2_id = p2.id;

/*Friendbook Challenge*/

CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age 
INTEGER);
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER, 
name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER, 
person2_id INTEGER);
INSERT INTO friends (person1_id, person2_id) VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id) VALUES (2, 3);

SELECT * FROM persons;
SELECT * FROM hobbies;
SELECT * FROM friends;

SELECT persons.fullname, hobbies.name FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

SELECT p1.fullname AS Person, p2.fullname AS Friend
FROM friends
JOIN persons AS P1
ON friends.person1_id = p1.id
JOIN persons AS p2
ON friends.person2_id = p2.id;

/*Alternative*/
SELECT persons.fullname, persons2.fullname FROM friends
JOIN persons
ON friends.person1_id = persons.id
JOIN persons AS persons2
ON friends.person2_id = persons2.id;


