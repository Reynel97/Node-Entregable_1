CREATE TABLE "inscription_courses" (
  "user_id" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "user_rol" (
  "user_id" int NOT NULL,
  "rol_id" int NOT NULL
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar(10) NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(15) NOT NULL,
  "description" varchar(30) NOT NULL,
  "level" varchar(30) NOT NULL,
  "teacher" varchar(30) NOT NULL,
  "categorie_id" int NOT NULL
);

CREATE TABLE "course_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(20) NOT NULL,
  "url" varchar(30) NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

ALTER TABLE "inscription_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "inscription_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "user_rol" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_rol" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

INSERT INTO roles (name) VALUES ('Student'), ('Teacher'), ('Administrative');
 
INSERT INTO users (name, email, password, age) VALUES
('Santiago', 'santy@gmail.com', 123, 18),
('Esther', 'esther@gmail.com', 123, 68),
('Reinaldo Jose', 'rey@gmail.com', 123, 26),
('Manuela', 'manuelle@gmail.com', 123, 28);

INSERT INTO user_rol (user_id, rol_id) VALUES
(1, 1),
(2, 3),
(3, 2),
(3, 3),
(4, 2),
(4, 1);

INSERT INTO categories (name) VALUES ('Development'), ('Music');

INSERT INTO courses (title, description, level, teacher_id, category_id) VALUES
('Fundamentos', 'Start HTML CSS and JavaScript', 'Essential', 3, 1),
('React', 'Ricky morty, CRUD, Whather', 'Medium', 4, 2);

INSERT INTO inscription_courses (user_id, course_id) VALUES
(1, 2),
(4, 1);

INSERT INTO course_videos (title, url, course_id) VALUES
('Introduction to HTML', 'https://www.academlo.com', 1),
('React', 'https://www.academlo.com', 2);