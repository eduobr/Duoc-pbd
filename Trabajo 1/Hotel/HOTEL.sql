CREATE  TABLE Recepcionista (
  ID_Recepcionista INT NOT NULL ,
  Rut VARCHAR(45) NOT NULL ,
  RNombre VARCHAR(45) NOT NULL ,
  RApellido VARCHAR(45) NOT NULL ,
  Telefono INT NOT NULL ,
  Fecha_Contrato DATE NOT NULL,
  Sueldo INT NOT NULL,
  Horario VARCHAR(45));
  ALTER TABLE Recepcionista
  ADD CONSTRAINT PK_Recepcionista PRIMARY KEY (ID_Recepcionista);
---------------------------------------------------

CREATE  TABLE  Cliente (
  ID_Cliente INT NOT NULL ,
  Rut VARCHAR(45) NOT NULL ,
  CNombre VARCHAR(45) NOT NULL ,
  CApellido VARCHAR(45) NOT NULL ,
  Direccion VARCHAR(45) NOT NULL);
  ALTER TABLE Cliente
  ADD CONSTRAINT PK_Cliente PRIMARY KEY (ID_Cliente);

CREATE  TABLE Habitacion (
  NRO_Habitacion INT NOT NULL ,
  Tipo_Habitacion VARCHAR(45) NOT NULL ,
  Cant_Muebles INT NOT NULL ,
  Velocidad_Internet_Mb INT NOT NULL ,
  Serv_Habitacion VARCHAR(10) NOT NULL ,
  Costo INT NOT NULL );
  ALTER TABLE Habitacion 
  ADD CONSTRAINT PK_Habitacion PRIMARY KEY (NRO_Habitacion);


CREATE  TABLE Factura (
  NRO_Factura INT NOT NULL ,
  ID_Cliente INT NOT NULL ,
  ID_Recepcionista INT NOT NULL ,
  Estado VARCHAR(45) NOT NULL,
  Cuotas INT NOT NULL);
  ALTER TABLE Factura
  ADD CONSTRAINT PK_Factura PRIMARY KEY (NRO_Factura);
  
   ALTER TABLE Factura
   ADD CONSTRAINT FK_Factura_Cliente FOREIGN KEY (ID_Cliente)
   REFERENCES Cliente(ID_Cliente);
   ALTER TABLE Factura
   ADD CONSTRAINT FK_Factura_Recepcionista FOREIGN KEY (ID_Recepcionista)
   REFERENCES Recepcionista (ID_Recepcionista);


CREATE  TABLE Reserva (
  ID_Reserva INT NOT NULL ,
  ID_Cliente INT NOT NULL ,
  ID_Recepcionista INT NOT NULL ,
  NRO_Habitacion INT NOT NULL ,
  NRO_Factura INT NOT NULL ,
  Cant_Dias INT NOT NULL ,
  Fecha_Reserva DATE NOT NULL ,
  Motivo VARCHAR(45) NOT NULL);
  ALTER TABLE Reserva 
  ADD CONSTRAINT PK_Reserva PRIMARY KEY (ID_Reserva);
  
  ALTER TABLE Reserva
   ADD CONSTRAINT FK_Reserva_Cliente FOREIGN KEY (ID_Cliente)
   REFERENCES Cliente(ID_Cliente);
   ALTER TABLE Reserva
   ADD CONSTRAINT FK_Reserva_Recepcionista FOREIGN KEY (ID_Recepcionista)
   REFERENCES Recepcionista (ID_Recepcionista);
   ALTER TABLE Reserva
   ADD CONSTRAINT FK_Reserva_Habitacion FOREIGN KEY (NRO_Habitacion)
    REFERENCES Habitacion (NRO_Habitacion);
	ALTER TABLE Reserva
   ADD CONSTRAINT FK_Reserva_Factura FOREIGN KEY (NRO_Factura)
    REFERENCES Factura (NRO_Factura);


   
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('1','11111-1','Carlos','Rodriguez','12345','16/02/2000','15000','Diurno');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('2','22222-2','Felipe','Guajardo','54321','22/03/2001','32000','Vespertino');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('3','33333-3','Ricardo','Melo','21678','11/12/2002','24500','Part-Time');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('4','44444-4','Monica','Gonzalez','65487','17/09/2003','5439','Diurno');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('5','55555-5','Cecilia','Zapata','76543','01/03/2004','44300','Vespertino');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('6','66666-6','Martin','Diaz','92386','15/08/2005','21000','Vespertino');
Insert into Recepcionista (ID_Recepcionista,Rut,RNombre,RApellido,Telefono,Fecha_Contrato,Sueldo,Horario) values ('7','77777-7','Braulio','Perez','69875','18/08/2006','34560','Part-time');

Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('1','12121-1','Maria','Soto','av. Las Palmas');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('2','21212-2','Alexis','Reyes','av. Los Orientales');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('3','31313-3','Mauricio','Hidalgo','av. Las Palmas');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('4','41414-4','Eduardo','Masca','av. Los Orientales');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('5','51515-5','Catalina','Gajardo','psje. los triangulos');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('6','61616-6','Sonia','Pino','psje. los triangulos');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('7','71717-7','Vanesa','Palma','av. El Arbol');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('8','81818-8','Claudio','Parraguez','av. El Arbol');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('9','91919-9','Jose','Hevia','av. El Arbol');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('10','10101-8','Enrique','Sanhueza','av. El Arbol');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('11','11101-7','Luis','Uribe','av. Las Palmas');
Insert into Cliente (ID_Cliente,Rut,CNombre,CApellido,Direccion) values ('12','12122-6','Marta','Garrido','av. Los Orientales');

Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('11','Familiar','40','25','NO','75000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('21','Familiar','47','25','SI','82000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('31','Familiar','63','40','SI','105000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('41','Individual','15','10','NO','50000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('51','Individual','17','25','NO','60000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('61','Familiar','40','100','SI','120000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('71','Doble','22','45','NO','70000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('81','Triple','33','25','SI','94500');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('91','Familiar','46','10','NO','150000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('101','Suite','79','125','SI','575000');
Insert into Habitacion (NRO_Habitacion,Tipo_Habitacion,Cant_Muebles,Velocidad_Internet_Mb,Serv_Habitacion,Costo) values ('111','Suite','90','300','SI','995600');



Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('1','1','3','Pagado','1');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('2','1','2','Pagado','2');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('3','3','1','Pendiente','12');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('4','4','4','Pagado','1');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('5','2','1','Pagado','1');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('6','5','4','Pendiente','4');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('7','5','2','Pendiente','3');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('8','6','5','Pendiente','12');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('9','6','5','Pagado','1');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('10','7','5','Pendiente','4');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('11','1','3','Pagado','1');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('12','9','3','Pagado','3');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('13','10','3','Pendiente','6');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('14','11','3','Pagado','2');
Insert into Factura (NRO_Factura,ID_Cliente,ID_Recepcionista,Estado,Cuotas) values ('15','12','1','Pendiente','5');


Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('1','1','3','21','1','31','13/03/2008','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('2','3','1','41','3','14','22/04/2009','Descanso');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('3','12','1','51','15','31','01/01/2008','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('4','8','2','71','11','93','01/06/2015','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('5','4','4','61','4','62','01/01/2010','Trabajo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('6','1','3','31','1','31','25/05/2008','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('7','11','3','91','14','31','13/03/2008','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('8','10','3','81','13','1','31/07/2009','Trabajo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('9','5','2','111','7','15','01/02/2008','Vacaciones');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('10','4','4','11','4','31','12/03/2011','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('11','2','1','21','5','7','31/10/2008','Descanso');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('12','2','1','91','5','7','31/10/2008','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('13','4','4','71','4','31','12/03/2011','Arriendo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('14','5','4','21','6','7','01/05/2008','Vacaciones');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('15','6','5','81','8','62','02/03/2013','Trabajo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('16','6','5','71','9','62','02/03/2014','Trabajo');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('17','7','5','101','10','7','23/12/2014','Descanso');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('18','7','5','111','10','7','23/12/2014','Descanso');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('19','9','3','11','12','1','25/09/2015','Descanso');
Insert into Reserva (ID_Reserva,ID_Cliente,ID_Recepcionista,NRO_Habitacion,NRO_Factura,Cant_Dias,Fecha_Reserva,Motivo) values ('20','1','2','101','2','7','24/12/2009','Vacaciones');


SELECT * FROM FACTURA;
SELECT * FROM HABITACION;
SELECT * FROM RECEPCIONISTA;
SELECT * FROM CLIENTE;
SELECT * FROM RESERVA ORDER BY ID_RESERVA ASC;

/*El Hotel «STAR» necesita optimizar todo los procesos relacionados con la gestión de sus habitaciones y el servicio de hotelería ofrecido.
El Hotel se ha visto en la necesidad de tener que automatizar algunos de sus procesos  relativos al personal que trabaja en el hotel. 
Por esta razón ha decido crear el departamento de informática y lo ha contratado a Ud. para que sea parte de este nuevo departamento
y solucionar los requerimientos de información que permitirán la mejor administración de este Hotel.
*/

--1
/* La Gerencia desea contar con información en cuanto a la cantidad de clientes que reservan una habitacion
solo para arrendarla y conocer el promedio de dias que se solicitan. Para ello se necesita obtener
la cantidad de clientes con motivo de arriendo y el promerio de dias que se quedan alojados */
SELECT COUNT(*) "CANTIDAD DE CLIENTES",MOTIVO,ROUND(AVG(CANT_DIAS)) "PROMEDIO DE DIAS ALOJADOS"FROM RESERVA 
WHERE MOTIVO='Arriendo' GROUP BY MOTIVO;

--2
/* La Gerencia desea saber el nombre de los clientes y la cantidad de reservas que hayan realizado hasta 
la fecha para posibles beneficios a futuro, para esto se necesita lo requerido anteriormente y que este 
ordenado de manera  descendente por la cantidad de reservas */
SELECT  'El Cliente ' ||CONCAT(CNOMBRE,' '||CAPELLIDO)|| ' a realizado '||COUNT(ID_RESERVA)||' reservas' "INFORMACION "
FROM RESERVA JOIN CLIENTE USING(ID_CLIENTE) GROUP BY CNOMBRE,CAPELLIDO 
ORDER BY COUNT(ID_RESERVA) DESC ;

--3
/* La Gerencia a decidido otorgarles a sus recepcionistas un bono dependiendo de sus años trabajos 
en el hotel , ej. si el recepcionista a trabajado 15 años recibe un bono de 15%.Para esto se necesita 
el nombre el recepcionista ,su sueldo, la fecha de contrato, los años que lleva trabajando en el hotel, 
su porcentaje de aumento y finalmente su nuevo sueldo añadiéndole el aumento */
SELECT CONCAT(RNOMBRE,' '||RAPELLIDO) "NOMBRE RECEPCIONISTA",TO_CHAR(SUELDO,'$99,999') SUELDO,TO_CHAR(FECHA_CONTRATO,'DD/MM/YYYY') "FECHA CONTRATO",
TRUNC((SYSDATE-FECHA_CONTRATO)/365) AÑOS_TRABAJADOS,TO_CHAR(ROUND(((SYSDATE-FECHA_CONTRATO)/365)*SUELDO)/100,'$999,999') "AUMENTO",
TO_CHAR(ROUND((((SYSDATE-FECHA_CONTRATO)/365)*SUELDO)/100)+SUELDO,'$999,999')"SUELDO AUMENTADO"
FROM RECEPCIONISTA;

--4
/* La Gerencia a notado que no todos sus trabajadores han realizado reservas a sus clientes por lo que está buscando 
personal nuevo para reemplazarlos y necesita saber cuáles son estos recepcionistas. Para esto se pide el nombre del 
recepcionista, el Rut y la cantidad de clientes atendidos cumpliendo con la condición anterior */
SELECT CONCAT(RNOMBRE,' '||RAPELLIDO) "NOMBRE RECEPCIONISTA",RUT,COUNT(ID_RESERVA) "CLIENTES ATENDIDOS"
FROM RECEPCIONISTA LEFT OUTER JOIN RESERVA USING(ID_RECEPCIONISTA)
GROUP BY RNOMBRE,RAPELLIDO,RUT HAVING COUNT(ID_RESERVA)=0;

--5
/* La Srta. Javiera  encargada de la administracion del hotel, requiere contar con información de todas las reservas que se han efectuado
hasta la fecha. Para esto se a definido que esta información será visualizada a través
de la vista V_INFO_RESERVAS La información que se requiere es el numero de la habitacion,la fecha de la reserva
el motivo y si cuenta con servicio a la habitacion. Todo esto ordenado por el numero de la habitanion acendente. */
CREATE OR REPLACE VIEW V_INFO_RESERVAS
AS SELECT NRO_HABITACION,FECHA_RESERVA,MOTIVO,SERV_HABITACION
FROM RESERVA JOIN HABITACION USING(NRO_HABITACION) 
ORDER BY NRO_HABITACION,FECHA_RESERVA ASC;
SELECT * FROM V_INFO_RESERVAS;

--6
/* La Srta. Javiera desea saber que tipo de habitacion del hotel le proporciona mayor ganancia monetaria
para asi construir mas habitaciones de ese tipo,para esto se requiere conocer
la la ganancia total obtenida sumando todos los costos de las habitaciones segun su clase/tipo
de habitacion */
SELECT TIPO_HABITACION,TO_CHAR(SUM(COSTO),'$9,999,999') GANANCIA_TOTAL 
FROM HABITACION 
GROUP BY TIPO_HABITACION;

--7
/* La Gerencia necesita saber cuantas reservas se han realizado en el mes de Marzo y conocer el 
nombre del cliente y el recepcionista por el que fue atendido para así otorgarles unos materiales 
escolares de regalo para sus hijos */
SELECT 'El cliente '||CONCAT(CNOMBRE,' '||CAPELLIDO)||' fue atendido por ' ||CONCAT(RNOMBRE,' '||RAPELLIDO)||' durante ' ||COUNT(*)|| ' reservas en el mes de Marzo' "DETALLES"
FROM CLIENTE  JOIN RESERVA USING(ID_CLIENTE) JOIN RECEPCIONISTA USING(ID_RECEPCIONISTA)
WHERE extract(month from FECHA_RESERVA) = 3
GROUP BY CNOMBRE,CAPELLIDO,RNOMBRE,RAPELLIDO;

--8
/* La Gerencia está Molesta con los clientes que no han pagado sus reservas. Por esto se ha decidido 
aumentar el precio dependiendo de los días que se quede hospedado ej. Si se queda 15 días 
aumenta un 15% del valor del costo de la habitación para esto se necesita saber el nombre del 
cliente, su estado de pago (debe estar pendiente), la cantidad de días hospedado, el precio actual,
el aumento según lo dicho anteriormente, y el precio final sumado el aumento */
SELECT CONCAT(CNOMBRE,' '||CAPELLIDO) NOMBRE_CLIENTE,ESTADO "ESTADO DE PAGO",CANT_DIAS "CANTIDAD DE DIAS HOSPEDADO",TO_CHAR(COSTO,'$999,999') "PRECIO ACTUAL X DIA",
TO_CHAR(ROUND((COSTO*CANT_DIAS)/100),'$999,999') AUMENTO,TO_CHAR(ROUND(((COSTO*CANT_DIAS)/100)+COSTO),'$9,999,999') PRECIO_FINAL FROM CLIENTE
JOIN RESERVA USING(ID_CLIENTE) JOIN FACTURA USING(NRO_FACTURA) JOIN HABITACION USING(NRO_HABITACION)
WHERE ESTADO ='Pendiente';

--9
/* La Gerencia desea conocer durante que horario se han efectuado más reservas, para esto se necesita 
saber la cantidad de reservas según su horario.*/
SELECT HORARIO,COUNT(ID_RESERVA) "CANTIDAD DE RESERVAS ATENDIDAD"
FROM RECEPCIONISTA JOIN RESERVA USING(ID_RECEPCIONISTA)
GROUP BY HORARIO 
ORDER BY COUNT(ID_RESERVA) DESC;

--10
/* La Srta. Javiera desea saber con claridad cuantos dias,meses y años llevan trabajando los recepcionistas
del hotel. Para esto se requiere el nombre del recepcionista,su rut, su fecha de contrato
los años, los meses  y los dias que lleva contratado.
Todo esto en una vista que se llame V_TODO_RECEP
*/
CREATE OR REPLACE VIEW V_TODO_RECEP
AS SELECT CONCAT(RNOMBRE,' '||RAPELLIDO) NOMBRE_RECEPCIONISTA,RUT,TO_CHAR(FECHA_CONTRATO,'dd" de "Month" del "YYYY') FECHA_CONTRATO,
ROUND((SYSDATE-FECHA_CONTRATO)/365) AÑOS_CONTRATADO,ROUND((SYSDATE-FECHA_CONTRATO)/12) MESES_CONTRATADO,ROUND(SYSDATE-FECHA_CONTRATO) DIAS_CONTRATADO
FROM RECEPCIONISTA;
SELECT * FROM V_TODO_RECEP;

--11
/*La gerencia desea saber el monto total que cada cliente ha gastado en reservas
para esto se requiere el id del cliente, el nombre completo del cliente y el monto total
ordenado en forma ascendente por id del cliente y el monto total*/
SELECT c.ID_CLIENTE,c.CNOMBRE||' '||c.CAPELLIDO "CLIENTE",SUM(h.COSTO) "MONTO TOTAL" FROM CLIENTE c 
JOIN RESERVA r ON (c.ID_CLIENTE = r.ID_CLIENTE)
JOIN HABITACION h ON (r.NRO_HABITACION = h.NRO_HABITACION)
GROUP BY c.ID_CLIENTE,c.CNOMBRE, c.CAPELLIDO
ORDER BY c.ID_CLIENTE,SUM(h.COSTO) ASC;

--12
/*La Gerencia fue avisada que la habitacion 21 tiene algunos problemas por lo que decidio descontarle un
porcentaje dependiendo de la cantidad de dias, este porcentaje sera igual a la mitad de los dias en que se alojo 
ej si estuvo 10 el porcentaje sera de un 5%. Para esto se requiere el nombre completo del cliente, nro de habitacion, cantidad de dias,
porc de descuento, costo y el costo final de los clientes que hallan reservado la habitacion 21*/

SELECT c.CNOMBRE||' '||c.CAPELLIDO "CLIENTE",r.NRO_HABITACION,r.CANT_DIAS,
ROUND(r.CANT_DIAS/2) "PORCENTAJE DESCUENTO",TO_CHAR(h.COSTO,'$99,999,999') "COSTO", TO_CHAR(h.COSTO-h.COSTO*(ROUND(r.CANT_DIAS/2)/100),'$99,999,999') "COSTO FINAL" FROM CLIENTE c 
JOIN RESERVA r ON (c.ID_CLIENTE = r.ID_CLIENTE)
JOIN HABITACION h ON (r.NRO_HABITACION = h.NRO_HABITACION)
WHERE r.NRO_HABITACION=21;

--13
/*La gerencia para motivar a sus trabajadores desea añadir un bono por reserva, por cada reserva 
tendra un bono de $2500 por lo que desea saber el nombre completo de todos los trabajadores,
la cantidad de reservas, la bonificacion total, el sueldo y el sueldo con la bonificacion y ordenada en
forma descendente por el sueldo total*/
SELECT rp.RNOMBRE||' '||rp.RAPELLIDO "NOMBRE",COUNT(r.ID_RESERVA) "RESERVAS",COUNT(r.ID_RESERVA)*2500 "BONO",TO_CHAR(rp.SUELDO,'$99,999,999') "SUELDO",
TO_CHAR((COUNT(r.ID_RESERVA)*2500)+rp.SUELDO,'$99,999,999') "SUELDO MAS BONIFICACION"
FROM RECEPCIONISTA rp
LEFT OUTER JOIN RESERVA r ON(rp.ID_RECEPCIONISTA = r.ID_RECEPCIONISTA)
GROUP BY rp.RNOMBRE,rp.RAPELLIDO,rp.SUELDO
ORDER BY "SUELDO MAS BONIFICACION" DESC;

--14
/*La gerencia desea saber el tipo de habitacion que cuenta con menos de 4 
reservas para bajar los precios de estas para esto se requiere el tipo de habitacion
y el numero de reservas*/
SELECT h.TIPO_HABITACION,COUNT(r.NRO_HABITACION) "NUMERO DE RESERVAS" FROM HABITACION h 
JOIN RESERVA r ON(h.NRO_HABITACION = r.NRO_HABITACION)
GROUP BY h.TIPO_HABITACION HAVING COUNT(r.NRO_HABITACION)<4;

--15
/*La gerencia desea saber quienes son los clientes que han hecho mas reservas para mas adelante
darles algun descuento para esto se requiere el nombre completo del cliente y la cantidad de reservas*/
SELECT c.CNOMBRE||' '||c.CAPELLIDO "NOMBRE",COUNT(r.ID_RESERVA)"RESERVAS" FROM CLIENTE c
JOIN RESERVA r ON(c.ID_CLIENTE=r.ID_CLIENTE)
GROUP BY c.CNOMBRE,c.CAPELLIDO 
HAVING (SELECT MAX(COUNT(r.ID_RESERVA)) FROM CLIENTE c
JOIN RESERVA r ON(c.ID_CLIENTE=r.ID_CLIENTE)
GROUP BY c.ID_CLIENTE)=COUNT(r.ID_RESERVA);