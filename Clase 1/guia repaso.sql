CREATE USER GUIAREPASO IDENTIFIED BY GUIAREPASO;
GRANT ALL PRIVILEGES TO GUIAREPASO;



create table empleado(
rut varchar2(20) not null,
nombre_apellido varchar2(40) not null,
direccion varchar2(80) not null,
comuna varchar2(60) not null,
telefono number(20)not null,
sueldo number(30) not null,
constraint pk_empleado primary key(rut));


insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('12345','julio escudero','el sauce 134','puente alto',266700,345600);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('32456','ignacio ampuero','violetas 445','santiago',367800,567000);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('67899','daniela torres','los andes 23','puente alto',523890,255900);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('34321','julio cruz','los alpes 78','santiago',5552355,350000);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('65788','cesar alfaro','antuco 55','maipu',858585,237000);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('43234','Ingrid correa','mercurio 223','la florida',566070,890000);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('34568','emilio cruz','los lagos 333','puente alto',6325414,456890);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('32123','jorge rojas','el volcan 333','santiago',501000,560000);
insert into empleado(rut,nombre_apellido,direccion,comuna,telefono,sueldo) values('78654','tania torres','tucanes 456','puente alto',2898958,750000);


commit;


create table cliente(
rut varchar2(20) not null,
nombre varchar2(40) not null,
direccion varchar2(30) not null,
comuna varchar2(30) not null,
telefono number(18)not null,
constraint pk_cliente primary key(rut));


create table cuenta(
numeroC number(20)not null,
tipo varchar2(40) not null,
saldo number(20) not null,
rut varchar2(20) not null,
constraint pk_cuenta primary key(numeroC),
constraint fk_cliente foreign key (rut) references cliente(rut));



insert into cliente values('10114567','antonio vera','ecuador 456','la florida',6543234);
insert into cliente values('9867543','jorge perez','salamanca 486','la florida',7654345);
insert into cliente values('8456567','ana muñoz','san francisco 77','macul',8325678);
insert into cliente values('12345654','ricardo jerez','san juan 44','la florida',6753456);


insert into cuenta values(10111111,'corriente',700000,'10114567');
insert into cuenta values(10123333,'ahorro',545000,'8456567');
insert into cuenta values(10134444,'corriente',890000,'9867543');
insert into cuenta values(10145555,'ahorro',450000,'10114567');
insert into cuenta values(10157777,'ahorro',370000,'12345654');

commit;

SELECT * FROM EMPLEADO;

--1)Seleccionar todos los nombres de los empleados
SELECT NOMBRE_APELLIDO FROM EMPLEADO;

--2)Seleccionar nombre y dirección de los empleados
SELECT NOMBRE_APELLIDO, DIRECCION  FROM EMPLEADO;

--3)Borrar el registro jorge rojas
DELETE FROM EMPLEADO WHERE NOMBRE_APELLIDO='jorge rojas';

--4)Crear una vista y consultar por nombre, direccion y teléfono ordenandos por nombre descendente 
CREATE OR REPLACE VIEW datos_emp
AS 
SELECT NOMBRE_APELLIDO, DIRECCION, TELEFONO FROM EMPLEADO ORDER BY NOMBRE_APELLIDO DESC;
SELECT * FROM datos_emp;

--5)Crear una vista que muestre rut, nombre y el sueldo de los empleados con un aumento del 20%.no olvidar usar alias
CREATE OR REPLACE VIEW datos_act
AS
SELECT RUT,NOMBRE_APELLIDO,SUELDO,SUELDO+(SUELDO*0.20) AS SUELDO_CON_AUMENTO FROM EMPLEADO;
SELECT * from datos_act;

--6)Obtener nombre y direccion de los empleados que viven en puente alto y poseen sueldos mayores a 300000 y menores a 700000
SELECT NOMBRE_APELLIDO,DIRECCION FROM EMPLEADO WHERE SUELDO BETWEEN '300000' AND '700000' AND COMUNA='puente alto';

--7)	Obtener la cantidad de registros de la tabla
SELECT COUNT(*) FROM EMPLEADO;

--8)Actualizar la dirección por mejillones 91 donde persona sea cesar Alfaro
UPDATE EMPLEADO SET DIRECCION='mejillones 91' WHERE NOMBRE_APELLIDO='cesar alfaro';

--9)Obtener direccion y rut  cuyo nombre comienza con J y ordenados por rut descendente
SELECT DIRECCION,RUT FROM EMPLEADO WHERE NOMBRE_APELLIDO LIKE 'j%';

--10)	Mostrar todos los datos ordenados por rut ascendente
SELECT * FROM EMPLEADO ORDER BY RUT ASC;

--11)	Eliminar a la persona con teléfono 6325414
DELETE FROM EMPLEADO WHERE TELEFONO='6325414';

--12)Actualizar el sueldo de julio cruz por 678000
UPDATE EMPLEADO SET SUELDO='678000' WHERE NOMBRE_APELLIDO='julio cruz';

--13)	Crear una vista y consultar el sueldo mínimo y máximo de los empleados
CREATE OR REPLACE VIEW sueldo_max_min
AS
SELECT MIN(SUELDO) AS SUELDO_MINIMO,MAX(SUELDO) AS SUELDO_MAXIMO FROM EMPLEADO;
SELECT * FROM sueldo_max_min;

--14)	Crear una vista que consulte las distintas comunas de la tabla 
CREATE OR REPLACE VIEW comunas
AS
SELECT COMUNA FROM EMPLEADO GROUP BY COMUNA;
SELECT * from comunas;

--II

--



