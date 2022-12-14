select * from EMPLOYEES;

-- LOWER : minuscula
select EMAIL,LOWER(EMAIL) as "MINUSCULA" from EMPLOYEES;
-- UPPER : mayuscula
select FIRST_NAME,UPPER(FIRST_NAME) as "MAYUSCULA" from EMPLOYEES;
--INITCAP : PRIMERA LETRA EN MAYUSCULA
select EMAIL,INITCAP(EMAIL) as "PRIMERA MAYUSCULA" from EMPLOYEES;
--CONCAT : CONCATENAR
select FIRST_NAME,LAST_NAME,CONCAT(FIRST_NAME||' ',LAST_NAME) as "NOMBRE COMPLETO" from EMPLOYEES;
--SUBSTR :  RECUPERA UN SUB-STRING
select FIRST_NAME,SUBSTR(FIRST_NAME,1,2) as "TROZO DE TEXTO" from EMPLOYEES -- SUBSTR(TEXTO,POS-INICIAL,CANT.CARACTERES);
--LENGHT : LARGO DE UN CAMPO
select FIRST_NAME,LENGT(FIRST_NAME) as "LARGO" from EMPLOYEES;

select FIRST_NAME,SUBSTR(FIRST_NAME,LENGTH(FIRST_NAME)-2,3) AS "ULTIMOS TRES" from EMPLOYEES;
--TRIM :  LIMPIA DE ESPACIO O CARACTER UN TEXTO
select FIRST_NAME,TRIM('s' from FIRST_NAME) as "ELIMINA LA LETRA" from EMPLOYEES;
--REPLACE : PERMITE REMPLAZAR EL TROZO DE UN TEXTO
select FIRST_NAME,REPLACE(FIRST_NAME,'e','a') as "CAMBIO DE LETRA" from EMPLOYEES;
--LPAD :  CREA UNA CELDA ALINEADA A LA IZQUIERDA
select FIRST_NAME,LPAD(FIRST_NAME,40) as "CELDA EN 40" from EMPLOYEES;
select FIRST_NAME,LPAD(FIRST_NAME,40,'-') as "CELDA EN 40 CON RELLENO" from EMPLOYEES;
--RPAD : CREA UNA CELDA ALINEADA A LA DERECHA
select FIRST_NAME,RPAD(FIRST_NAME,30) as "CELDA EN 30" from EMPLOYEES;
select FIRST_NAME,RPAD(FIRST_NAME,30,'-') as "CELDA EN 30" from EMPLOYEES;
--INSTR : BUSCA UN TEXTO PRESENTANDO LA POSICION INICIAL
select FIRST_NAME,INSTR(FIRST_NAME,'e',1,1) as "POSICION LETRA" from EMPLOYEES; -- INSTR(TEXTO,VALOR BUSCADO,POS.INICIAL,COINCI)
--TRUNC : TRUNCAR DECIMALES
select SALARY,TRUNC(SALARY * 0,52) as "BONO" from EMPLOYEES;
--ROUND : APROXIMAR DECIMALES
select SALARY,ROUND(SALARY+0.58) as "BONO" from EMPLOYEES;
--MOD : RESTO DE DIVISION
select MOD (15,2) as "RESTO" from DUAL;
--SYSDATE : FECHA ACTUAL
select SYSDATE from DUAL;
select (56-6*8) from DUAL;
--ADD_MONTHS : PERMITE AGREGAR MESES A UNA FECHA
select HIRE_DATE,ADD_MONTHS(HIRE_DATE,2) as "DOS MESES MAS" from EMPLOYEES;
--NEXT_DAY : ENTREGA EL PROXIMO DIA ESPECIFICADO (LUNES A DOMINGO)
select SYSDATE,NEXT_DAY(SYSDATE,'martes') as "PROXIMO DOMINGO" from DUAL;
select NEXT_DAY('15/08/1978','DOMINGO') as "DOMINGO DE 1978" from DUAL;
--SUMAR Y RESTAR DIAS
select SYSDATE+3 as "3 DIAS MAS" from DUAL;
select SYSDATE-3 as "3 DIAS MENOS" from DUAL;
select (SYSDATE-HIRE_DATE/365) as "POR JUBILAR",HIRE_DATE from EMPLOYEES;
--LAST DAYS : ULTIMO DIA DEL MES
select LAST_DAYS(SYSDATE) as "ULTIMO DIA DEL MES" from DUAL;
select LAST_DAYS('15/01/1999') as "ULTIMO DIA DEL MES" from DUAL;
select LAST_DAYS(HIRE_DATE) as "ULTIMO DIA DEL MES" from EMPLOYEES;
--TO_NUMBER : TRANSFORMA A NUMERO
select TO_NUMBER ('33'),'33' from DUAL;
--TO_DATE : TRANSFORMA A FECHA
select TO_DATE('12/10/2015') as "FECHA" from DUAL;
--TO_CHAR : TRANSFORM A CARACTER CON FORMATO
select SYSDATE,TO_CHAR(SYSDATE,'dd, "del" MM "del" yyyy') as "FECHA FORMATO" from DUAL;
select SYSDATE,TO_CHAR(SYSDATE,'Hh:mi:ss') as "HORA ACTUAL" from DUAL;

select SYSDATE,TO_CHAR(SALARY,'$99,999,999.99') as "PESO CON FORMATO" from EMPLOYEES;
select SYSDATE,TO_CHAR(SALARY,'$00,000,999.99') as "PESO CON FORMATO" from EMPLOYEES;

--NVL : PRESENTA EL PRIMER VALOR NO NULO
select NVL(NULL,4) from DUAL;
select NVL(COMMISSION_PCT,1) as "COMISION",COMMISSION_PCT from EMPLOYEES;
--CASE : PERMITE GENERAR UNA EVALUACION DE UN VALOR
select SALARY,CASE WHEN SALARY <10000 THEN 'POBRE'
              WHEN SALARY >=10000 THEN 'CLASE MEDIA' END "CATALOGO" from EMPLOYEES;
--DECODE : PERMITE EVALUAR UN CAMPO Y EFECTUAR UNA ACCION
select SALARY,DECODE(SALARY,9000,'BINGO',17000,'MUCHO',0) as "CATALOGO" from EMPLOYEES;