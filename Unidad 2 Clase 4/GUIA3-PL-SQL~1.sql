SELECT * FROM CONCESIONARIO;
SELECT * FROM AUTOMOVIL;
SELECT * FROM VENTA;

--1
DECLARE
 CURSOR cr_precio IS
   SELECT PRECIO 
   FROM AUTOMOVIL 
   WHERE MARCA = 'citroen'
   FOR UPDATE;
   precio_nuevo NUMBER(8);
BEGIN
 FOR reg_datos IN cr_precio
 LOOP
  IF reg_datos.precio<4100000 THEN
   precio_nuevo:=245500;
  ELSIF reg_datos.precio>=4100000 AND reg_datos.precio<=4600000 THEN
   precio_nuevo:=536490;
  ELSIF reg_datos.precio>4600000 AND reg_datos.precio<=6999999 THEN
   precio_nuevo:=699600;
  ELSIF reg_datos.precio>7000000 THEN
   precio_nuevo:=0;
  END IF;
  UPDATE AUTOMOVIL
  SET PRECIO = PRECIO+precio_nuevo
  WHERE MARCA='citroen';
 END LOOP;
END;

--2
DECLARE
 CURSOR cr_invent IS
 SELECT MODELO "MODELO",COLOR "COLOR",ROUND(COSTO) "COSTO",PRECIO "PRECIO"
 FROM AUTOMOVIL
 WHERE AÑO=2013;
BEGIN
 DBMS_OUTPUT.PUT_LINE('--INFORMACION CONTABLE--');
 FOR reg_datos IN cr_invent
  LOOP
  DBMS_OUTPUT.PUT_LINE('El modelo '||reg_datos.modelo||'  de color '||reg_datos.color||' tiene un costo de $ '||reg_datos.costo||' y su precio venta es $' ||reg_datos.precio);
 END LOOP;
END;

--3
SELECT v.NOMBRE_CLIENTE "NOMBRE",v.FECHA "FECHA",v.SUCURSAL "SUCURSAL",c.COMUNA
 FROM VENTA v
 JOIN CONCESIONARIO c ON(v.SUCURSAL=c.SUCURSAL);
DECLARE
 CURSOR cr_info IS
 SELECT v.NOMBRE_CLIENTE "NOMBRE",v.FECHA "FECHA",v.SUCURSAL "SUCURSAL",c.COMUNA "COMUNA"
 FROM VENTA v
 JOIN CONCESIONARIO c ON(v.SUCURSAL=c.SUCURSAL);
BEGIN
 DBMS_OUTPUT.PUT_LINE('-- DATOS CLIENTE --');
 FOR reg_datos IN cr_info
 LOOP
 DBMS_OUTPUT.PUT_LINE('El cliente '||reg_datos.nombre||' con fecha '||reg_datos.fecha||' adquirio un automvil en la sucursal '||reg_datos.sucursal||' de ' ||reg_Datos.comuna);
 END LOOP;
END;

--4
DECLARE
 CURSOR cr_reporte IS
 SELECT COUNT(v.SUCURSAL) "CANTIDAD",c.SUCURSAL "SUCURSAL",c.COMUNA "COMUNA",c.TELEFONO "TELEFONO"
 FROM CONCESIONARIO c JOIN VENTA v 
 ON(v.SUCURSAL=c.SUCURSAL)
 GROUP BY c.SUCURSAL,c.COMUNA,c.TELEFONO;
BEGIN
 DBMS_OUTPUT.PUT_LINE('-- CANTIDAD AUTOMOVILES VENDIDOS --');
 FOR reg_datos IN cr_reporte
 LOOP
 DBMS_OUTPUT.PUT_LINE('Se han vendido '||reg_datos.cantidad||' unidad en la sucursal de '||reg_datos.comuna||' con telefono '||reg_datos.telefono);
 END LOOP;
END;

--5
DECLARE
CURSOR cr_desc IS
 SELECT PRECIO "PRECIO",AÑO "AÑO" FROM AUTOMOVIL WHERE MODELO='runner4';
 datos cr_desc%ROWTYPE;
BEGIN
 OPEN cr_desc;
 FETCH cr_desc INTO datos;
 DBMS_OUTPUT.PUT_LINE('el precio antiguo es:'||TO_CHAR(datos.precio,'$999999999'));
 IF datos.año=2011 THEN
 datos.precio := datos.precio-(datos.precio*0.10);
 ELSIF datos.año=2012 THEN
 datos.precio := datos.precio-(datos.precio*0.08); 
 ELSIF datos.año>=2008 AND datos.año<=2010 THEN
 datos.precio := datos.precio-(datos.precio*0.15); 
 ELSE
 datos.precio := datos.precio-(datos.precio*0.06); 
 END IF;
 DBMS_OUTPUT.PUT_LINE('el precio con dscto es:'||TO_CHAR(datos.precio,'$999999999'));
 CLOSE cr_desc; 
END;

--6
DECLARE
 CURSOR cr_cliente IS
 SELECT NOMBRE_CLIENTE "NOMBRE",RUT "RUT" FROM VENTA;
 datos cr_cliente%ROWTYPE;
BEGIN
 OPEN cr_cliente;
 FETCH cr_cliente INTO datos;
 WHILE cr_cliente%found
 LOOP
 DBMS_OUTPUT.PUT_LINE('Nombre y rut cliente es: '||datos.nombre||' '||datos.rut);
 FETCH cr_cliente INTO datos;
 END LOOP;
 CLOSE cr_cliente;
END;

--7
DECLARE
 CURSOR cr_venta IS
 SELECT v.NUMERO_VENTA "VENTA",a.PATENTE "PATENTE",a.PRECIO "PRECIO"
 FROM AUTOMOVIL a
 JOIN VENTA v ON(a.PATENTE=v.PATENTE);
 pMax NUMBER(8);
BEGIN
 SELECT MAX(PRECIO) INTO pMax FROM AUTOMOVIL;
 FOR reg_datos IN cr_venta
 LOOP
 IF reg_datos.precio<pMax THEN
 DBMS_OUTPUT.PUT_LINE('Numero de Venta '||reg_datos.venta||' patente '||reg_datos.patente||' precio '||TO_CHAR(reg_datos.precio,'$999,999,999'));
 END IF;
 END LOOP;
END;