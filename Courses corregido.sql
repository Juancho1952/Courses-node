CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "id_teacher" uuid,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int
);

CREATE TABLE "users_courses" (
  "id" serial PRIMARY KEY,
  "name_user" uuid,
  "name_course" uuid,
  "advance" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "description" text,
  "level" varchar,
  "teacher" varchar,
  "name_course" varchar
);

CREATE TABLE "levels" (
  "id" int PRIMARY KEY,
  "id_user" uuid,
  "name_level" varchar,
  "description" text
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name_teacher" varchar,
  "description" text
);

CREATE TABLE "course_videos" (
  "id" serial PRIMARY KEY,
  "id_courses" uuid,
  "url" varchar,
  "description" text,
  "duration" int,
  "score" float
);

CREATE TABLE "users_categories" (
  "id" serial PRIMARY KEY,
  "id_user" uuid,
  "id_categories" serial
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name_categories" varchar,
  "schools" varchar
);

CREATE TABLE "users_roles" (
  "id" serial,
  "id_user" uuid,
  "id_role" int
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name_roles" varchar,
  "access" varchar,
  "description" text
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("name_user") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("name_course") REFERENCES "courses" ("id");

ALTER TABLE "levels" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("id_courses") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id_teacher") REFERENCES "teachers" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id");

ALTER TABLE "users_categories" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_categories" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("id");

insert into teachers (
	id,
	name_teacher,
	description 
) values (
	'5669b80e-22f9-47dd-a776-c2ed8450e57f',
	'Pedro',
	'Profesor Especialista en diferentes campos de TI con enfacis en el desarrollo web'
);

insert into teachers (
	id,
	name_teacher,
	description 
) values (
	'a9c7d375-f977-435d-a015-60331f537cd7',
	'Jessica',
	'Profesora licenciada en diferentes campos administrativos con enfacis en cuentas T'
);

insert into users  (
	id,
	id_teacher,
	name,
	email,
	"password", 
	age
) values (
	'91d986f6-ec1f-4345-b5c3-c1ee42b9e69f',
	'5669b80e-22f9-47dd-a776-c2ed8450e57f',
	'Camilo',
	'camilo@gmail.com',
	'root',
	23
), (
	'f53421cd-6547-476b-92f2-23e0c66934d6',
	'a9c7d375-f977-435d-a015-60331f537cd7',
	'Andres',
	'andres@gmail.com',
	'root',
	22
);

insert into roles  (
	name_roles,
	"access",
	description 
) values (
	'administrador',
	'admin',
	'Este usuario tendra acceso al 100% de las categorias, modificaciones, actualziaciones de datos entre otras caracteristicas.'
), (
	'Estudiante',
	'Student',
	'Este usurio solamente tendra acceso a los certificados despues de aprobados los cursos'
), (
	'Invitado',
	'guest',
	'Este usuario solo podra ver los cursos ofertados en la plataforma.'
);


UPDATE teachers 
SET description = 'Teacher with a degree in different administrative fields with emphasis on T accounts.' 
WHERE id = 'a9c7d375-f977-435d-a015-60331f537cd7';

UPDATE roles 
SET description = 'This user will have access to 100% of the categories, modifications, data updates and other features.' 
WHERE id = 1;

UPDATE roles 
SET description = 'This user will only have access to the certificates after passing the courses.' 
WHERE id = 2;

UPDATE roles 
SET description = 'This user will only be able to see the courses offered on the platform.' 
WHERE id = 3;




insert into levels (
	id,
	id_user,
	name_level,
	description
) values (
	1,
	'91d986f6-ec1f-4345-b5c3-c1ee42b9e69f',
	'Basic',
	'above this level are users who have not completed more than 20 courses since their enrollment.'
), (
	2,
	'f53421cd-6547-476b-92f2-23e0c66934d6',
	'Advance',
	'at this level will be the users who have completed more than 20 courses since their enrollment.'
);


insert into courses (
	id,
	description,
	"level",
	teacher,
	name_course 
)
values (
	'7b8b6af3-686b-49f8-99f2-d65b63a93238',
	'The student will learn to create web applications with React JS, achieving a great interaction with the user using previous knowledge of HTML, CSS and Javascript.',
	'Basic',
	'Jessica',
	'Desarrollo de Aplicaciones Web con React'
), (
	'63ad1ca3-be5d-4ca8-88d1-4649e7405386',
	'The student will learn how to build a server-side application with Node and Express from 0 to deployment on a server. They will have the ability to build an API Rest using a relational database, user authentication, security against XSS and CSRF attacks, validate the data received by the server and build custom middlewares with Express.',
	'Advance',
	'Pedro',
	'Back-End Node'
);

insert into categories (
	name_categories,
	schools
) values (
	'engineering',
	'Data science'
), (

	'finance',
	'cryptocurrency investment'
);

insert into course_videos (
	id_courses,
	url,
	description,
	duration, 
	score
) values (
	'7b8b6af3-686b-49f8-99f2-d65b63a93238',
	'https://academlo.react.com',
	'You will learn about the different hooks and the function of each one of them.'
	'1',
	4,2
), (
	'7b8b6af3-686b-49f8-99f2-d65b63a93238',
	'https://academlo.nodejs.com',
	'You will learn about normalization and cardinality in databases.'
	'2',
	4,6
);

insert into users_categories (
	id_user,
	id_categories 
) values (
	'91d986f6-ec1f-4345-b5c3-c1ee42b9e69f',
	1
), (
	'f53421cd-6547-476b-92f2-23e0c66934d6',
	2
);


insert into users_roles (
	id_user,
	id_role 
) values (
	'91d986f6-ec1f-4345-b5c3-c1ee42b9e69f',
	1
), (
	'f53421cd-6547-476b-92f2-23e0c66934d6',
	3
);

insert into users_courses (
	name_user,
	name_course 
) values (
	'f53421cd-6547-476b-92f2-23e0c66934d6',
	'63ad1ca3-be5d-4ca8-88d1-4649e7405386'
), (
	'91d986f6-ec1f-4345-b5c3-c1ee42b9e69f',
	'7b8b6af3-686b-49f8-99f2-d65b63a93238'
);
