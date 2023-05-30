#Create database hola;
#use hola;
#create table hola(
#Hola varchar (300)
#);

##select*from hola;
drop database if exists EverythingWorks;

create database EverythingWorks;
use EverythingWorks;

create table Usuario (
Id_Usu int primary key not null auto_increment,
Nom_Usu	Varchar	(30),
Apellido_Usu Varchar(30),
Edad_Usu Int,
Tel_Usu	varchar(10),
Correo_Usu varchar	(30),
Contrasena_Usu varchar(20),
Sexo_Usu varchar (10),
Local_Usu varchar (120),
Foto_Usu varchar (80));
insert into Usuario values(1,"Dylan","Isaac",19,"5513774294","dylanisaac@gmail.com","con00","Masculino","Tlalpan","no hay fotito");
insert into Usuario values(2,'Diego','Cabrera',17,'55693102','cabrero@gmail.com','con01','Masculino','Azcapotzalco','');
insert into Usuario values(3,'Cristobal','Jimenez',17,'55302478','apocosi@gmail.com','con02','Masculino','Azcapotzalco','');
insert into Usuario values(4,'Christopher','Aguilera',17,'55478889','faqsnojala@gmail.com','con03','Masculino','Azcapotzalco','');
insert into Usuario values(5,'Axel','Granados',17,'5523062547','axelmargra@gmail.com','con00','Masculino','Azcapotzalco','');
insert into Usuario values(6,'Joseph','Fabrizzio',17,'5583837450','cesarin@gmail.com','con05','Siempre','Tlalpan','');
insert into Usuario values(7,'Joseph','Fabrizzio',17,'5583837450','x@gmail.com','x','Siempre','Tlalpan','');

select * from Usuario;

create table Zona(
Id_Zona int not null auto_increment primary key,
nombreZona varchar(15));
select * from Zona;

create table Vendedor(
Id_Vend	Int	primary key not null auto_increment,
Nom_Vend Varchar (30),
Apellido_Vend Varchar (30),
Edad_Vend Int,
Tel_Vend varchar(10),
Correo_Vend	varchar	(40),
Contrasena_Vend varchar(15),
Sexo_Vend varchar (10),
Local_Vend varchar (30),
Cate_Vend varchar (30),
Descr_Vend varchar (150),
Foto_Vend varchar (80),
Cal_Vend int,
Comentarios int);
insert into Vendedor values(1,"Larry","Cabrera", 27, "5587058727", "cabrera.aquino.diego@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",1,1);
insert into Vendedor values(2,"Licenciado","Pubrizio", 98, "5587058727", "axelgranados@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",2,1);
insert into Vendedor values(3,"Aguila","Poderosa", 64, "5587058727", "carreritas@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",3,1);
insert into Vendedor values(4,"Larry","Cabrera", 27, "5587058727", "original@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",4,1);
insert into Vendedor values(5,"Licenciado","Pubrizio", 98, "5587058727", "pa2010@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",5,1);
insert into Vendedor values(6,"Aguila","Poderosa", 64, "5587058727", "amarilloamarilloamarillo@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",1,1);
insert into Vendedor values(7,"Larry","Cabrera", 27, "5587058727", "loplatano@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",2,1);
insert into Vendedor values(8,"Licenciado","Pubrizio", 98, "5587058727", "fifufifufuo@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",3,1);
insert into Vendedor values(9,"Aguila","Poderosa", 64, "5587058727", "otrocorreoigual@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",4,1);
insert into Vendedor values(10,"Larry","Cabrera", 27, "5587058727", "muchoojocuate@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",5,1);
insert into Vendedor values(11,"Licenciado","Pubrizio", 98, "5587058727", "tacodeojo@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",0,0);
insert into Vendedor values(12,"Aguila","Poderosa", 64, "5587058727", "tacodesi@gmail.com", "123456" , "Masculino" , "Coyoacan","","Vendo servicios a domiciolio","no hay foto",0,0);
select * from Vendedor;


create table VendedorZona(
Id_Vend int,
Id_Zona int,
foreign key(Id_Vend) references Vendedor(Id_Vend),
foreign key(id_zona) references Zona(id_zona));
select * from VendedorZona;

create table Foro (
id_foro int not null auto_increment primary key,
id_zona int,
foreign key(id_zona) references Zona(id_zona));
select * from Foro;

create table Post (
id_post int not null auto_increment primary key,
autor_post varchar(40),
mesaje varchar(3000),
Id_Usu int,
Id_Vend int,
id_foro int,
foreign key (Id_Usu) references Usuario(Id_Usu) on update cascade on delete cascade,
foreign key (Id_Vend) references Vendedor (Id_Vend) on update cascade on delete cascade,
foreign key(id_foro) references Foro(id_foro));
select * from Post;

create table Comentarios (
id_com int not null auto_increment primary key,
autor_com varchar(40),
comentario varchar(3000),
calif_com int,
Id_Usu int,
Id_Vend int,
foreign key (Id_Usu) references Usuario(Id_Usu) on update cascade on delete cascade,
foreign key (Id_Vend) references Vendedor (Id_Vend) on update cascade on delete cascade);

insert into Comentarios values(1,'Axel','No me gusto como dio sus servicios, podria mejorar',1,1,1);
insert into Comentarios values(2,'Diego','No me gusto como dio sus servicios, podria mejorar',2,2,2);
insert into Comentarios values(3,'Cristobal','No me gusto como dio sus servicios, podria mejorar',3,3,3);
insert into Comentarios values(4,'Christopher','No me gusto como dio sus servicios, podria mejorar',4,4,4);
insert into Comentarios values(5,'Dylan','No me gusto como dio sus servicios, podria mejorar',5,5,5);
insert into Comentarios values(6,'Axel','Se tardo mas tiempo del que me hubiera gustado',1,1,6);
insert into Comentarios values(7,'Diego','Se tardo mas tiempo del que me hubiera gustado',2,2,7);
insert into Comentarios values(8,'Cristobal','Se tardo mas tiempo del que me hubiera gustado',3,3,8);
insert into Comentarios values(9,'Christopher','Se tardo mas tiempo del que me hubiera gustado',4,4,9);
insert into Comentarios values(10,'Dylan','Se tardo mas tiempo del que me hubiera gustado',5,5,10);

select * from Comentarios;

#Tabla de prueba del buscador xd
create table mi_tabla (
id_p int not null auto_increment primary key,
CURP varchar(300),
DESCRIPCION varchar(300),
IMAGEN varchar(300),
Id_Vend	Int,
foreign key (Id_Vend) references Vendedor (Id_Vend) on update cascade on delete cascade);
insert into mi_tabla values(1,"Programador web","Soy programador web con amplios conocimientos", "https://www.soyusuario.ift.org.mx/styles/imagen/Acceso%20Usuario%20Registrado_Mesa%20de%20trabajo%201.png","1");
insert into mi_tabla values(2,"Programador web CSS","Soy programador de CSS" , "https://img.freepik.com/vector-premium/icono-circulo-usuario-anonimo-ilustracion-vector-estilo-plano-sombra_520826-1931.jpg","5");
insert into mi_tabla values(3,"Programador de java","Soy programador de java", "https://img.freepik.com/vector-premium/icono-circulo-usuario-anonimo-ilustracion-vector-estilo-plano-sombra_520826-1931.jpg","3");
insert into mi_tabla values(4,"Reparador de computadoras","Reparo pcs", "https://cdn-icons-png.flaticon.com/512/16/16363.png","2");
insert into mi_tabla values(5,"Reparador de bicis","REPARO BICIS", "https://www.soyusuario.ift.org.mx/styles/imagen/Acceso%20Usuario%20Registrado_Mesa%20de%20trabajo%201.png","2");
insert into mi_tabla values(6,"Programador de computadoras","Soy programador de computadoras", "https://cdn-icons-png.flaticon.com/512/16/16363.png","1");

select * from mi_tabla where CURP like  "%3%";
select * from mi_tabla;

#create table Comentario(
#Id_Pub Int primary key not null,
#Id_Vend int,
#Id_Usu int,
#Publica Varchar	(120),
#Puntuacion	Int,
#foreign key (Id_Usu) references Usuario(Id_Usu) on update cascade on delete cascade,
#foreign key (Id_Vend) references Vendedor (Id_Vend) on update cascade on delete cascade);
#select * from Comentario;

create table Chat (
Id_Chat int,
Id_Usu	int,
Id_Usu2 int,
Mensaje varchar (80));
#foreign key (Id_Usu) references Usuario(Id_Usu) on update cascade on delete cascade);
insert into Chat values("1","1","2","Sexo");
insert into Chat values("1","2","1","Sexo pero del otro lado");
insert into Chat values("1","2","1","Sexo la pelicula");
Insert into chat (id_Usu,Id_Usu2,Mensaje) values ("1","2","Pruebita");
SELECT * FROM Chat where Id_Usu = "1" and Id_Usu2 = 2 or Id_Usu = 2 and Id_Usu2 = 1 ;

SELECT * FROM Chat2;