create database TiendaDeInformatica
go
/*Ejerciocio realizado a base del PDF "Ejercicio SQL"*/
use TiendaDeInformatica

create table Fabricantes
(
Codigo int identity,
nombre nvarchar (100),
primary key (Codigo)
)

create table Articulo
(
Codigo int identity,
Nombre nvarchar (100),
Precio int,
Fabricante int,
primary key(Codigo),
foreign key (Fabricante)references Fabricantes(Codigo)
)

insert into Fabricantes (nombre) values ('Intel');
insert into Fabricantes (nombre) values ('AMD'); 
insert into Fabricantes (nombre) values ('Asus'); 
insert into Fabricantes (nombre) values ('Asrock'); 
insert into Fabricantes (nombre) values ('kingston'); 
insert into Fabricantes (nombre) values ('GeForce'); 
insert into Fabricantes (nombre) values ('Ati'); 
insert into Fabricantes (nombre) values ('Msi'); 
insert into Fabricantes (nombre) values ('Gigabyte'); 
insert into Fabricantes (nombre) values ('Genius'); 
insert into Fabricantes (nombre) values ('Sony'); 
insert into Fabricantes (nombre) values ('LG');
insert into Fabricantes (nombre) values ('EPSON');

select * from Fabricantes

insert into Articulo (Nombre, Precio, Fabricante) values ('i7',5000,1);
insert into Articulo (Nombre, Precio, Fabricante) values ('FX 6100',1500,2);
insert into Articulo (Nombre, Precio, Fabricante) values ('FX 6300',1700,2);
insert into Articulo (Nombre, Precio, Fabricante) values ('FX 8000',2500,2); 
insert into Articulo (Nombre, Precio, Fabricante) values ('H61m-k Intel Lga 1155',740,3); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Asrock Fatal1ty Fm2a88x',2999,4); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Kingston Hyperx Fury 8gb',1030,5); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Nvidia Geforce Gtx750ti 2gb Ddr5',3250,6);
insert into Articulo (Nombre, Precio, Fabricante) values ('Ati Sapphire Radeon R7',3500,7); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Msi 970 Gaming',2550,8); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Gigabyte Ga-z97x Gaming 3',3430,9); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Parlantes Pc Gamer Genius Gx Sw-g 2.1',2100,10);
insert into Articulo (Nombre, Precio, Fabricante) values ('Disco Rigido Externo 1 Terabyte',2000,11); 
insert into Articulo (Nombre, Precio, Fabricante) values ('Grabadora Dvd Cd Lg | 24x | Sata',270,12);
insert into Articulo (Nombre, Precio, Fabricante) values ('Impresora Multifuncion',5000,13);

select * from Articulo

/*Solo los nombre del articulo*/
select Nombre from Articulo

/*Obtener nombre y precios*/
select Nombre, Precio from Articulo

/*Obtener nombre de los que cuestan > $200*/
select Nombre from Articulo WHERE Precio > 200

/*Obtener nombre de los que >= 1000 y <= 2000 (CON AND)*/
select * from Articulo 
WHERE Precio >= 1000 and Precio <= 2000

/*Obtener nombre de los que >= 1000 y <= 2000 (CON BETWEEN)*/
select * from Articulo 
WHERE Precio BETWEEN  1000 and  2000


/*Obtener nombre y precio en pecetas*/
/*SIN AS*/
select Nombre, Precio * 166.386 from Articulo
/*CON AS*/
select Nombre, Precio * 166.386 AS PrecioPtas from Articulo


/*Precio medio de los productos*/
select AVG (Precio) from Articulo


/*Precio medio de los productos del fabricante Cod2*/
select AVG (Precio) from Articulo WHERE Fabricante = 2


/*Precio el numero de articulo que se >= 1800*/
select count (*) from Articulo WHERE Precio >= 1800


/*Obtener nombre y precio >= 1800*/
select Nombre, Precio from Articulo
WHERE Precio >= 1800

/*Obtener el listado completo de los articulos*/
/*Sin INNER JOIN*/
select * from Articulo, Fabricantes
where Articulo.Fabricante = Fabricantes.Codigo

/*Con INNER JOIN*/
select * from Articulo INNER JOIN Fabricantes
on Articulo.Fabricante = Fabricantes.Codigo

/*Obtener el listado completo de los articulos, nombre, precio,etc*/
/*Sin INNER JOIN*/
select Articulo.Nombre, Precio, Fabricantes.nombre
from Articulo,Fabricantes
where Articulo.Fabricante = Fabricantes.Codigo

/*Con INNER JOIN*/
select Articulo.Nombre, Precio, Fabricantes.nombre
from Articulo INNER JOIN Fabricantes
on Articulo.Fabricante = Fabricantes.Codigo


/*Precio medio de los productos del fabricante, 
mostrndo solo el codigo*/
select AVG (Precio), Fabricante from Articulo
group by Fabricante

/*Precio medio de los productos del fabricante, 
mostrndo solo el nombre del fabricante*/

/*sin inner join*/
select AVG (Precio), Fabricantes.nombre
from Articulo, Fabricantes
where Articulo.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre

/*con inner join*/
select AVG (Precio), Fabricantes.nombre
from Articulo inner join Fabricantes
on Articulo.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre

/*14*/
/*sin inner join*/
select AVG (Precio), Fabricantes.nombre
from Articulo, Fabricantes
where Articulo.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre
HAVING AVG (Precio) >= 1500

/*con inner join*/
select AVG (Precio), Fabricantes.nombre
from Articulo inner join Fabricantes
on Articulo.Fabricante = Fabricantes.Codigo
group by Fabricantes.nombre
HAVING AVG (Precio) >= 1500

/*15*/
select Nombre, Precio
from Articulo
where Precio = (SELECT MIN(Precio)from Articulo)

select Nombre, Precio
from Articulo
where Precio = (SELECT MAX(Precio)from Articulo)


/*16*/
/*sin inner join*/
select A.Nombre, A.Precio, F.Nombre
from Articulo A, Fabricantes F
where A.Fabricante = F.Codigo
and A.Precio =
(
SELECT MAX(A.Precio)
from Articulo A
where A.Fabricante = F.Codigo
) 

/*con inner join*/
select A.Nombre, A.Precio, F.Nombre
from Articulo A inner join Fabricantes F
on A.Fabricante = F.Codigo
and A.Precio =
(
SELECT MAX(A.Precio)
from Articulo A
where A.Fabricante = F.Codigo
) 
/*17*/
insert into Articulo (Nombre, Precio, Fabricante)
values ('Parlante Genius Sw-5.1',1650,10)

/*18*/
update Articulo
set Nombre = 'Impresora Laser'
where Codigo = 18

select * from Articulo

/*19*/
update Articulo
set Precio = Precio * 0.9

select * from Articulo

/*20*/
update Articulo
set Precio = Precio - 10
where Precio >= 1200

select * from Articulo