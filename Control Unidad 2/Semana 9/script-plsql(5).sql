-- CREACIÓN TABLAS DEL MODELO

create table USUARIO(
rut varchar2(20) primary key not null,
nombre varchar2(60),
direccion varchar2(65),
EDAD number(10),
TELEFONO NUMBER(20));


insert into usuario values('1349-0','pedro solis','las torres 566',23,5666656);
insert into usuario values('5678-9','marta luna','miramar 7859',19,7666689);
insert into usuario values('1456-7','francisca acuña','villaviencio 213',27,1234567);


create table libro(
codigo number primary key,
nombre varchar2(90),
autor varchar2(90),
editorial varchar2(200),
cantidad number(5));


insert into libro values(3030,'el nombre de la rosa','umberto eco','lumen',13);
insert into libro values(3031,'la miseria del hombre','gonzalo rojas','universitaria',8);
insert into libro values(3032,'como agua para chocolate','laura esquivel','roca',15);
insert into libro values(3033,'el codigo da vinci','dan brow','planeta',25);
insert into libro values(3034,'quijote de la mancha','miguel de cervantes','planeta',11);


create table prestamo(
id number(20) primary key,
fecha_prestamo date,
codigo number(6),
rut varchar2(20),
foreign key(codigo) references libro(codigo),
foreign key(rut) references usuario(rut));



insert into prestamo values(100,'23-11-2013',3031,'1456-7');
insert into prestamo values(200,'15-12-2013',3034,'1349-0');
insert into prestamo values(300,'17-03-2013',3033,'5678-9');
insert into prestamo values(400,'21-05-2013',3031,'1349-0');
insert into prestamo values(500,'28-04-2012',3033,'1456-7');

COMMIT;



