create table automovil (patente varchar2(20), marca varchar2(100), modelo varchar2(70),
color varchar2(70), puertas number(3), año number(24), precio number(14),costo number(12,3),
constraints pk_automovil primary key(patente));

create table concesionario(sucursal varchar2(14), direccion varchar2(100), comuna varchar2(100),telefono number,
constraints pk_concesionario primary key(sucursal));


create table venta(numero_venta varchar2(14), fecha date, nombre_cliente varchar2(100), rut varchar2(100),
patente varchar2(20), sucursal varchar2(14),constraints pk_venta primary key(numero_venta),
constraints fk_venta foreign key(patente)references automovil(patente),
constraints fk_sucursal foreign key(sucursal)references concesionario(sucursal));


insert into concesionario(sucursal,direccion,comuna,telefono)values('1000','av.los leones 874','providencia',7451254);
insert into concesionario(sucursal,direccion,comuna,telefono)values('2000','san diego 1250','santiago',5784584);


insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('yy-55','toyota','yaris','gris',5,2008,4890000,3456789.67);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('zz-45','citroen','picasso','verde',5,2006,5790000,4123456.78);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('bb-65','suzuki','aerio','gris',3,2013,5020000,4034566.243);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('fg-17','hyundai','santa fe','rojo',5,2013,15020000,10045890.678);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('hk-14','hyundai','tucson','blanco',5,2013,9879900,6789089.456);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('gg-87','kia','rio','blanco',5,2012,7678900,5105679.723);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('jk-34','kia','soul','verde',5,2013,8456890,5789997.245);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('dl-76','toyota','runner4','plata',5,2013,12758900,8512479.124);
insert into automovil(patente,marca,modelo,color,puertas,año,precio,costo)values('ac-23','kia','elantra','rojo',5,2013,7412350,4122560.325);

insert into venta(numero_venta,fecha,nombre_cliente,rut,patente,sucursal)values('10','12-03-2014','luis soler','546-k','zz-45','2000');
insert into venta(numero_venta,fecha,nombre_cliente,rut,patente,sucursal)values('20','22-05-2013','isabel canto','234-6','fg-17','1000');
insert into venta(numero_venta,fecha,nombre_cliente,rut,patente,sucursal)values('30','17-11-2013','pedro tapia','788-5','gg-87','2000');
insert into venta(numero_venta,fecha,nombre_cliente,rut,patente,sucursal)values('40','25-01-2014','luis soto','567-8','jk-34','2000');

commit;

