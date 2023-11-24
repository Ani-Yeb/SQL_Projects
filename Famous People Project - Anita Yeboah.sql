/* creating table 1*/
CREATE TABLE famous_people (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age INTEGER);
INSERT INTO famous_people (name, age) VALUES ("Will Smith", 50);
INSERT INTO famous_people (name, age) VALUES ("Jennifer Hudson", 40);
INSERT INTO famous_people (name, age) VALUES ("Sophie Kinsella", 53);
INSERT INTO famous_people (name, age) VALUES ("Jennifer Aniston", 54);
INSERT INTO famous_people (name, age) VALUES ("Joyce Meyer", 80);


/*creating table 2*/
CREATE TABLE careers (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER, talent TEXT);
INSERT INTO careers (person_id, talent) VALUES (1, "actor");
INSERT INTO careers(person_id, talent) VALUES (2, "singer");
INSERT INTO careers (person_id, talent) VALUES (3, "writer");
INSERT INTO careers (person_id, talent) VALUES (2, "actor");
INSERT INTO careers (person_id, talent) VALUES (4, "actor");
INSERT INTO careers (person_id, talent) VALUES (5, "writer");


CREATE TABLE origin (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER, country TEXT);
INSERT INTO origin (person_id, country) VALUES (1, "America");
INSERT INTO origin (person_id, country) VALUES (2, "America");
INSERT INTO origin (person_id, country) VALUES (3, "United Kingdom");
INSERT INTO origin (person_id, country) VALUES (4, "America");
INSERT INTO origin (person_id, country) VALUES (5, "America");

/*selecting tables*/
SELECT * FROM famous_people;
SELECT * FROM careers;
SELECT * FROM origin;

/*joining tables*/
SELECT famous_people.name, famous_people.age, careers.talent, origin.country FROM famous_people LEFT OUTER JOIN careers
ON famous_people.id = careers.person_id LEFT OUTER JOIN origin ON careers.person_id = origin.person_id;