-- ///////////////////////////////////////////////////////////////////////////
-- eliminacion de tablas
--drop table detalle_ventas cascade constraints;
--drop table ventas cascade constraints;
--drop table productos cascade constraints;
--drop table clientes cascade constraints;
--drop table empleados cascade constraints;
--drop table cargos cascade constraints;
--drop table sucursales cascade constraints;
--drop table comunas cascade constraints;
--drop table reporte_sueldos cascade constraints;
--drop table afps cascade constraints;
--drop table isapres cascade constraints;
--drop table registro cascade constraints;
--drop sequence seq_registro;

-- ///////////////////////////////////////////////////////////////////////////
-- tabla registro
create table registro (
  registro_id number(5) not null primary key
  , fecha date not null
  , descripcion varchar2(255) not null
);

create sequence seq_registro
     start with 1
     increment by 10
;

-- ///////////////////////////////////////////////////////////////////////////
-- tabla comunas
create table comunas (
  comuna_id number(5) not null primary key
  , comuna varchar2(20) not null
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla sucursales
create table sucursales (
  sucursal_id number(5) not null primary key
  , sucursal varchar2(20) not null
  , comuna_id number(5) not null
);

alter table sucursales
  add constraint fk_sucursal_comuna foreign key(comuna_id)
    references comunas(comuna_id);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla cargos
create table cargos (
  cargo_id number(5) not null primary key
  , nombre varchar2(20) not null
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla afp
create table afps(
  afp_id number(2) not null primary key
  , afp varchar2(255) not null
  , porcentaje number not null
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla salud
create table isapres(
  isapre_id number(2) not null primary key
  , isapre varchar2(255) not null
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla empleados
create table empleados (
  empleado_id number(5) not null primary key
  , nombre varchar2(20) not null
  , appaterno varchar2(20) not null
  , apmaterno varchar2(20) not null
  , fecha_contrato date not null
  , sueldo_base number(7) not null
  , cargo_id number(5) not null
  , afp_id number(2) default 1 not null
  , isapre_id number(2) default 1 not null  
);

alter table empleados
  add constraint fk_cargo_empleado foreign key(cargo_id)
    references cargos(cargo_id);
    
alter table empleados
  add constraint fk_empleado_afp foreign key(afp_id)
    references afps(afp_id);
    
alter table empleados
  add constraint fk_empleado_isapre foreign key(isapre_id)
    references isapres(isapre_id);
    
-- ///////////////////////////////////////////////////////////////////////////
-- tabla reporte_sueldos
create table reporte_sueldos(
  empleado_id number(5) not null
  , anno int not null
  , mes int not null
  , comision number
  , sueldo_base number
  , gratificacion number
  , afp number 
  , salud number
  , sueldo_liquido number
);

alter table reporte_sueldos
  add constraint pk_reporte_sueldos primary key(
      empleado_id
      , anno
      , mes
);

alter table reporte_sueldos
  add constraint fk_reporte_sueldos_empleado foreign key(empleado_id)
    references empleados(empleado_id);
  
-- ///////////////////////////////////////////////////////////////////////////
-- tabla clientes
create table clientes (
  cliente_id number(5) not null primary key
  , nombre varchar2(20) not null
  , appaterno varchar2(20) not null
  , apmaterno varchar2(20) not null
  , sexo CHAR(1) not null
  , fecha_nacimiento date
  , estado_civil varchar(20)
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla ventas
create table ventas (
  venta_id number(5) not null primary key
  , vendedor_id number(5) not null
  , cliente_id number(5) not null
  , sucursal_id number(5) not null
  , fecha date not null
  , tipo_documento varchar(10) not null
  , numero_documento number(5) not null
);

alter table ventas
  add constraint fk_venta_vendedor foreign key(vendedor_id)
    references empleados(empleado_id);
    
alter table ventas
  add constraint fk_venta_cliente foreign key(cliente_id)
    references clientes(cliente_id);
    
alter table ventas
  add constraint fk_venta_sucursal foreign key(sucursal_id)
    references sucursales(sucursal_id);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla productos
create table productos(
  producto_id number(5) not null primary key
  , nombre varchar2(20) not null
  , precio number(10) not null
  , descripcion varchar(100)
);

-- ///////////////////////////////////////////////////////////////////////////
-- tabla detalle_ventas
create table detalle_ventas(
  venta_id number(5) not null
  , producto_id number(5) not null
  , cantidad number(5) not null
  , precio_unitario number(10) not null
  , descuento number(5,2) not null 
  , iva number(10) default 0
);

alter table detalle_ventas
  add constraint fk_detalle_venta foreign key(venta_id)
    references ventas(venta_id);
    
alter table detalle_ventas
  add constraint fk_detalle_venta_producto foreign key(producto_id)
    references productos(producto_id);
    
alter table detalle_ventas
  add constraint pk_detalle_ventas primary key(venta_id, producto_id);
  
  -- #############################################################################
insert into comunas(comuna_id, comuna) values(1, 'Las Condes');
insert into comunas(comuna_id, comuna) values(2, 'Santiago');
insert into comunas(comuna_id, comuna) values(3, 'Viña del Mar');

select * from comunas;  
-- #############################################################################
insert into sucursales(sucursal_id, sucursal, comuna_id) values(1, 'Manquehue', 1);
insert into sucursales(sucursal_id, sucursal, comuna_id) values(2, 'Franklin', 2);
insert into sucursales(sucursal_id, sucursal, comuna_id) values(3, 'Viña', 3);
select * from sucursales;
-- #############################################################################
insert into cargos(cargo_id, nombre) values(1, 'vendedor');
insert into cargos(cargo_id, nombre) values(2, 'cajero');
insert into cargos(cargo_id, nombre) values(3, 'encargado despacho');
insert into cargos(cargo_id, nombre) values(4, 'bodeguero');
insert into cargos(cargo_id, nombre) values(5, 'mueblista');

select * from cargos;
-- #############################################################################
insert into afps(afp_id, afp, porcentaje) values(1, 'AFP Modelo', 0.1077);
insert into afps(afp_id, afp, porcentaje) values(2, 'AFP Habitat', 0.1127);
insert into afps(afp_id, afp, porcentaje) values(3, 'AFP Cuprum', 0.1148);
insert into afps(afp_id, afp, porcentaje) values(4, 'AFP Cuprum', 0.15);

select * from afps;
-- #############################################################################
insert into isapres(isapre_id, isapre) values(1, 'FONASA');
insert into isapres(isapre_id, isapre) values(2, 'Banmedica');
insert into isapres(isapre_id, isapre) values(3, 'Vida Tres');
insert into isapres(isapre_id, isapre) values(4, 'Más Vida');
insert into isapres(isapre_id, isapre) values(5, 'Cruz Blanca');

select * from isapres;
-- #############################################################################

insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(1, 'FabiÃ¡n',  'Cerda', 'Contreras', TO_DATE('03-10-2002','DD-MM-YYYY')
    , 300000, 5);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(2, 'Ricardo',  'Lunari', 'PÃ©rez', TO_DATE('01-02-2000','DD-MM-YYYY')
    , 300000, 5);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(3, 'Juan',  'Lorca', 'Rebolledo', TO_DATE('01-02-2010','DD-MM-YYYY')
    , 251000, 4);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(4, 'Lorena',  'Jaque', 'Mate', TO_DATE('15-02-2000','DD-MM-YYYY')
    , 251000, 1);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(5, 'Ramiro',  'Mendoza', 'Escalieri', TO_DATE('01-12-2010','DD-MM-YYYY')
    , 280000, 3);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(6, 'Alejandra',  'Luna', 'Ochoa', TO_DATE('13-06-2010','DD-MM-YYYY')
    , 251000, 1);
insert into empleados(empleado_id, nombre, appaterno, apmaterno, fecha_contrato
    , sueldo_base, cargo_id)
  values(7, 'Romina',  'Pulgar', 'Soto', TO_DATE('10-08-2012','DD-MM-YYYY')
    , 251000, 1);
    
update empleados set afp_id = 3 where empleado_id in (3,5,7);    
update empleados set afp_id = 2 where empleado_id in (1);    

update empleados set isapre_id = 2 where empleado_id in (1, 2); 
    
select * from EMPLEADOS e join afps a on a.afp_id = e.afp_id join isapres i on i.isapre_id = e.isapre_id;

-- #############################################################################

insert into clientes(cliente_id, nombre, appaterno, apmaterno, fecha_nacimiento
    , estado_civil, sexo)
  values(1, 'Alejandro', 'VÃ¡squez', 'Soto', null
    , null, 'M' );
insert into clientes(cliente_id, nombre, appaterno, apmaterno, fecha_nacimiento
    , estado_civil, sexo)
  values(2, 'Gonzalo', 'Soto', 'Soto', TO_DATE('22-06-1980','DD-MM-YYYY')
    , 'casado', 'M' );
insert into clientes(cliente_id, nombre, appaterno, apmaterno, fecha_nacimiento
    , estado_civil, sexo)
  values(3, 'Carlos', 'Paredes', 'Paredes', TO_DATE('30-08-1965','DD-MM-YYYY')
    , 'casado', 'M' );
insert into clientes(cliente_id, nombre, appaterno, apmaterno, fecha_nacimiento
    , estado_civil, sexo)
  values(4, 'Francisco', 'Herbias', 'Le-Roy', TO_DATE('15-11-1970','DD-MM-YYYY')
    , 'casado', 'M' );
insert into clientes(cliente_id, nombre, appaterno, apmaterno, fecha_nacimiento
    , estado_civil, sexo)
  values(5, 'Margarita', 'Barraza', 'Hermosilla', TO_DATE('01-03-1975','DD-MM-YYYY')
    , 'casado', 'F' );
    
select * from CLIENTES;

-- #############################################################################

insert into productos(producto_id, nombre, precio, descripcion)
  values(1, 'Mesa de Centro', 550000, 'Mesa centro de madera raulÃ­ 2.0x1.5 mts');
insert into productos(producto_id, nombre, precio, descripcion)
  values(2, 'Bar color chocolate', 459000, 'Bar color chocolate madera, puertas de corredera');
insert into productos(producto_id, nombre, precio, descripcion)
  values(3, 'Comedor circular', 789000, 'Comedor con cubierta de vidrio circular. 6 sillas con tapiz a elecciÃ³n');
insert into productos(producto_id, nombre, precio, descripcion)
  values(4, 'Cava de madera', 419000, 'Cava de madera hecha en raulÃ­ capacidad para 105 vinos');
insert into productos(producto_id, nombre, precio, descripcion)
  values(5, 'Mueble Rack Modular', 280000, 'Rack de madera de raulÃ­ color miel, 2 cajones y tamaÃ±o personalizado');
  
select * from PRODUCTOS;

-- #############################################################################

insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(1, 4, 1, 'boleta', 1000, TO_DATE('01-03-2016','DD-MM-YYYY'), 1);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(1, 1, 1, 550000, 0.00);
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(1, 5, 2, 280000, 0.05);
-- -----------------------------------------------------------------------------  
insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(2, 6, 3, 'boleta', 1001, TO_DATE('02-03-2016','DD-MM-YYYY'), 2);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(2, 2, 1, 459000, 0.05);
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(2, 3, 2, 789000, 0.05);
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(2, 4, 2, 419000, 0.05);
-- -----------------------------------------------------------------------------  
insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(3, 7, 5, 'factura', 1002, TO_DATE('02-03-2016','DD-MM-YYYY'), 3);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(3, 5, 2, 280000, 0.10);
-- -----------------------------------------------------------------------------  
insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(4, 4, 4, 'boleta', 1003, TO_DATE('03-03-2016','DD-MM-YYYY'), 1);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(4, 2, 1, 459000, 0.02);
-- -----------------------------------------------------------------------------  
insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(5, 6, 2, 'boleta', 1004, TO_DATE('05-04-2016','DD-MM-YYYY'), 2);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(5, 2, 1, 459000, 0.02);
-- -----------------------------------------------------------------------------  
insert into ventas(venta_id, vendedor_id, cliente_id, tipo_documento, numero_documento, fecha, sucursal_id)
  values(6, 7, 2, 'boleta', 1005, TO_DATE('18-04-2016','DD-MM-YYYY'), 3);
  
insert into detalle_ventas(venta_id, producto_id, cantidad, precio_unitario, descuento)
  values(6, 5, 2, 280000, 0.02);
-- -----------------------------------------------------------------------------  

select * from ventas;
select * from detalle_ventas;

-- #############################################################################
