/*Crear un curso*/
use studentdata

update course set icon='ingles.JPG' where id=9
update course set icon='fisica.JPG' where id=10
update course set icon='matematica.jpg' where id=11
update course set icon='productividad.JPG' where id=12
update course set icon='tecnologia.JPG' where id=13
update course set icon='arte.JPG' where id=14
update course set icon='cultura.JPG' where id=15
select * from course
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Ciencias Sociales',13,'ciencias_sociales.png');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Ciencias Naturales',13,'ciencias_naturales.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Comunicaci�n y Lenguaje Idioma Espa�ol',13,'espanol.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Comunicaci�n y Lenguaje Idioma Extranjero',13,'ingles.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Educaci�n F�sica',13,'fisica.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Matem�tica',13,'matematica.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Emprendimiento para la Productividad',13,'productividad.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Tecnologias del aprendizaje y la comunicaci�n',13,'tecnologia.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Educaci�n Art�stica',13,'arte.jpg');
insert into course (created_at,created_by,company_id,is_active,name,grade_degree_id,icon) values(getdate(),1,1,1,'Culturas e idiomas mayas, garifunas o xinka',13,'cultura.jpg');


select gd.id, d.name degree,g.id grade_id, g.name grade,
gd.is_active gradeDegree_is_active, g.is_active grade_is_active
from grade_degree gd, degree d, grade g
where gd.degree_id=d.id and gd.grade_id=g.id