-- CREACI�N TABLAS DEL MODELO
CREATE TABLE TIPO_EMPLEADO 
(tipo_empleado      NUMBER(2)NOT NULL , 
 desc_tipo_empleado VARCHAR2(25) NOT NULL,
CONSTRAINT PK_TIPO_EMPLEADO PRIMARY KEY ( tipo_empleado )) ;

CREATE TABLE EMPLEADO 
(id_empleado    NUMBER(5) NOT NULL , 
 numrut         NUMBER(10) NOT NULL , 
 dvrut          VARCHAR2(1) NOT NULL , 
 pnombre        VARCHAR2(20) NOT NULL , 
 snombre        VARCHAR2(20), 
 appaterno      VARCHAR2(20) NOT NULL , 
 apmaterno      VARCHAR2(20) NOT NULL , 
 fecha_contrato DATE  NOT NULL , 
 tipo_empleado  NUMBER(2)  NOT NULL,
CONSTRAINT PK_EMPLEADO PRIMARY KEY ( id_empleado ),
CONSTRAINT FK_EMPLEADO_TIPO_EMPLEADO FOREIGN KEY (tipo_empleado) 
REFERENCES TIPO_EMPLEADO(tipo_empleado)) ;

CREATE TABLE VENTAS 
(nro_boleta   NUMBER(8) NOT NULL , 
 id_empleado  NUMBER(5) NOT NULL,
 fecha_boleta DATE  NOT NULL , 
 monto_total  NUMBER(8) NOT NULL,
CONSTRAINT PK_VENTAS PRIMARY KEY ( nro_boleta ),
CONSTRAINT FK_VENTAS_EMPLEADO FOREIGN KEY (id_empleado) 
REFERENCES EMPLEADO(id_empleado)) ;

CREATE TABLE COMISION_VENTAS 
(nro_boleta     NUMBER (8)  NOT NULL,
 monto_comision NUMBER (8)  NOT NULL,
CONSTRAINT PK_COMISION_VENTAS PRIMARY KEY ( nro_boleta ),
CONSTRAINT FK_COMISION_VENTAS FOREIGN KEY (nro_boleta) 
REFERENCES VENTAS (nro_boleta)) ;


-- INSERCI�N DE DATOS A LAS TABLAS DEL MODELO    
INSERT INTO tipo_empleado VALUES(1,'Administrativo');
INSERT INTO tipo_empleado VALUES(2,'Cocinero');
INSERT INTO tipo_empleado VALUES(3,'Vendedor');
INSERT INTO tipo_empleado VALUES(4,'Repartidor');

INSERT INTO empleado VALUES(4,5555555,5,'MARIA', NULL, 'ROMERO','ROJAS', '01/08/2012',1);
INSERT INTO empleado VALUES(5,6666666,6,'SONIA', 'EUGENIA', 'TAPIA','VEGA', '21/08/2012',2);
INSERT INTO empleado VALUES(1,2222222,2,'PABLO', NULL, 'PEREZ','SOTO', '01/03/2010',3);
INSERT INTO empleado VALUES(2,3333333,3,'PEDRO','JOSE','TORRES','TRONCOSO', '14/03/2011',3);
INSERT INTO empleado VALUES(3,4444444,4,'FRANCISCO','ALEJANDRO', 'AGUILAR','TAPIA','01/06/2011',3);

INSERT INTO ventas VALUES (100, 1, '01/03/2014', 200000);
INSERT INTO ventas VALUES (101, 1, '02/03/2014', 100000);
INSERT INTO ventas VALUES (102, 1, '02/03/2014', 75000);
INSERT INTO ventas VALUES (103, 3, '02/03/2014', 45200);
INSERT INTO ventas VALUES (90, 3, '02/02/2014', 75000);

INSERT INTO comision_ventas VALUES (100,26000);
INSERT INTO comision_ventas VALUES (101,13000);
INSERT INTO comision_ventas VALUES (102,9750);
INSERT INTO comision_ventas VALUES (103,5876);
INSERT INTO comision_ventas VALUES (90,9750);
COMMIT;


