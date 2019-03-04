CREATE DATABASE PeliculasySalas
GO

USE PeliculasySalas

create table PELICULAS
(
Codigo int identity (1,2),
Nombre nvarchar (100),
CalificacionEdad int,
primary key (Codigo)
)

create table SALAS
(
Codigo int identity (1,2),
Nombre nvarchar (100),
Pelicula int,
primary key (Codigo),
foreign key (Pelicula)references PELICULAS(Codigo)
)

insert into PELICULAS (Nombre,CalificacionEdad) values ('JACK REACHER SIN REGRESO',16);
insert into PELICULAS (Nombre,CalificacionEdad) values ('ROGUE ONE STAR WARS', 10);
insert into PELICULAS (Nombre,CalificacionEdad) values ('DOCTOR STRANGE',13);
insert into PELICULAS (Nombre,CalificacionEdad) values ('ANIMALES FANTASTICOS',13);
insert into PELICULAS (Nombre,CalificacionEdad) values ('OUIJA EL ORIGEN DEL MAL',16);
insert into PELICULAS (Nombre,CalificacionEdad) values (' Cigüeñas',8);
insert into PELICULAS (Nombre,CalificacionEdad) values ('Assassin´s Creed',13);
insert into PELICULAS (Nombre,CalificacionEdad) values ('La maquina del tiempo');


insert into SALAS (Nombre, Pelicula) values ('Village Cines',1);
insert into SALAS (Nombre, Pelicula) values ('Cines Hoyts',3);
insert into SALAS (Nombre, Pelicula) values ('Cinemark',5);
insert into SALAS (Nombre, Pelicula) values ('Cinema Adrogue',7);
insert into SALAS (Nombre, Pelicula) values ('Cines Multiplex',9);
insert into SALAS (Nombre, Pelicula) values ('Cines Gran Rex',11);
insert into SALAS (Nombre, Pelicula) values ('Cinema Adrogue',13);


select * from PELICULAS

select * from SALAS

/*1*/
select * from PELICULAS

/*2*/
select distinct CalificacionEdad from PELICULAS

/*3*/
insert into PELICULAS (Nombre) values ('La maquina del tiempo');
insert into SALAS (Nombre, Pelicula) values ('Cinema Adrogue',13);

select * from PELICULAS where CalificacionEdad is null

/*4*/
insert into SALAS (Nombre) values ('Cinema Burzaco');

select * from SALAS where Pelicula is null

/*5*/
select * 
from SALAS left join PELICULAS
on SALAS.Pelicula = PELICULAS.Codigo  

/*6*/
select * 
from SALAS right join PELICULAS
on SALAS.Pelicula = PELICULAS.Codigo 

/*7*/
/*Con join*/
select PELICULAS.Nombre
from SALAS right join PELICULAS
on SALAS.Pelicula = PELICULAS.Codigo 
where SALAS.Pelicula is null

/*Con subconsult*/
select Nombre from PELICULAS
where Codigo not in
(
select Pelicula from SALAS
where Pelicula is not null
)

/*8*/
insert into PELICULAS (Nombre,CalificacionEdad) values ('Uno, Dos, Tres',7);

select * from PELICULAS

/*9*/
update PELICULAS set CalificacionEdad = 13 where CalificacionEdad is null

select * from PELICULAS

/*10*/
