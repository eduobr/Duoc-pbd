SELECT * FROM EMPLEADOS;
SELECT * FROM ISAPRES;
SELECT * FROM SUCURSALES;
SELECT * FROM COMUNAS;
SELECT * FROM VENTAS;
SELECT * FROM DETALLE_VENTAS;
SELECT * FROM REPORTE_SUELDOS;
SELECT * FROM CARGOS;
SELECT * FROM AFPS;

SELECT NOMBRE,4 FROM EMPLEADOS;

SELECT e.EMPLEADO_ID "IDEMPLEADO",EXTRACT(YEAR FROM v.FECHA)"A�O",EXTRACT(MONTH FROM v.FECHA) "MES"
  FROM EMPLEADOS e
  LEFT OUTER JOIN VENTAS v ON(e.EMPLEADO_ID=v.VENDEDOR_ID)
  LEFT OUTER JOIN DETALLE_VENTAS d ON (v.VENTA_ID=d.VENTA_ID)
  LEFT OUTER JOIN SUCURSALES s ON(v.SUCURSAL_ID=s.SUCURSAL_ID)
  LEFT OUTER JOIN COMUNAS c ON(s.COMUNA_ID=c.COMUNA_ID)
  JOIN ISAPRES i ON(i.ISAPRE_ID=e.ISAPRE_ID)
  GROUP BY e.EMPLEADO_ID,EXTRACT(YEAR FROM v.FECHA),EXTRACT(MONTH FROM v.FECHA),c.COMUNA,
  e.SUELDO_BASE
  ORDER BY EMPLEADO_ID;
  
CREATE OR REPLACE PROCEDURE comision(sueldo IN INT,total OUT INT)
IS
BEGIN
total := sueldo * 0.25;
DBMS_OUTPUT.PUT_LINE(total);
END comision;

DECLARE
CURSOR cr_reporte IS
SELECT e.EMPLEADO_ID "IDEMPLEADO",e.SUELDO_BASE "SUELDO",EXTRACT(YEAR FROM v.FECHA)"A�O",EXTRACT(MONTH FROM v.FECHA) "MES"
  FROM EMPLEADOS e
  LEFT OUTER JOIN VENTAS v ON(e.EMPLEADO_ID=v.VENDEDOR_ID)
  LEFT OUTER JOIN DETALLE_VENTAS d ON (v.VENTA_ID=d.VENTA_ID)
  LEFT OUTER JOIN SUCURSALES s ON(v.SUCURSAL_ID=s.SUCURSAL_ID)
  LEFT OUTER JOIN COMUNAS c ON(s.COMUNA_ID=c.COMUNA_ID)
  JOIN ISAPRES i ON(i.ISAPRE_ID=e.ISAPRE_ID)
  GROUP BY e.EMPLEADO_ID,EXTRACT(YEAR FROM v.FECHA),EXTRACT(MONTH FROM v.FECHA),c.COMUNA,
  e.SUELDO_BASE
  ORDER BY EMPLEADO_ID;
  v_total NUMBER(8);
BEGIN
FOR reg_datos IN cr_reporte
LOOP
comision(reg_datos.sueldo,v_total);
END LOOP;
END;
