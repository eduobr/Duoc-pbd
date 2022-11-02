CREATE OR REPLACE FUNCTION FN_AFP(rut EJECUTIVOS.EJE_RUT%TYPE)
RETURN NUMBER IS
afp NUMBER(8);
BEGIN
 SELECT (SUE_MONTO_BASE+SUE_COMISION+SUE_BONO)*0.10 "PAG_AFP" INTO afp
 FROM SUELDOS 
 WHERE EXTRACT (MONTH FROM SUE_PERIODO)=1 AND EJE_RUT =rut;
END;

DECLARE
v_funcion NUMBER(8);
BEGIN
v_funcion:=FN_AFP('18936554');
DBMS_OUTPUT.PUT_LINE(v_funcion);
END;

CREATE OR REPLACE FUNCTION F_ISAPRE(RUT VARCHAR2,FECHA DATE)
RETURN NUMBER
IS 
ISAPRE NUMBER;
BEGIN
SELECT (SUE_MONTO_BASE+SUE_COMISION+SUE_BONO)*0.07 INTO ISAPRE FROM SUELDOS WHERE EJE_RUT = RUT AND TO_CHAR(SUE_PERIODO,'MM/YYYY')=FECHA AND
SUE_PERIODO BETWEEN TO_DATE('01/01/2016', 'dd/mm/yyyy') AND TO_DATE('01/02/2016', 'dd/mm/yyyy');
RETURN ISAPRE;
END F_ISAPRE;
DECLARE
URETRE NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('---PROBANDO---');
URETRE:=F_ISAPRE('18936554','2016/01/01');
END;