--1--
DECLARE
v_empleado_nombre EMPLOYEES.FIRST_NAME%TYPE;
v_empleado_apellido EMPLOYEES.LAST_NAME%TYPE;
v_empleado_contratacion EMPLOYEES.HIRE_dATE%TYPE;
BEGIN
SELECT FIRST_NAME,LAST_NAME,HIRE_DATE
INTO v_empleado_nombre,
v_empleado_apellido,
v_empleado_contratacion
FROM EMPLOYEES e
WHERE e.MANAGER_ID IS NULL;
DBMS_OUTPUT.put_line('El empleado '||v_empleado_nombre||' fue contratado el '||v_empleado_contratacion);
END;

--2--
DECLARE
v_total_emp NUMBER(3):=0;
v_depto VARCHAR(30);
BEGIN
SELECT d.DEPARTMENT_NAME,COUNT(*)
INTO v_depto,v_total_emp
FROM EMPLOYEES e 
JOIN DEPARTMENTS d 
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
WHERE d.DEPARTMENT_ID = 50 GROUP BY d.DEPARTMENT_NAME;
DBMS_OUTPUT.put_line('En el departamento '||v_depto||' trabajan '||v_total_emp||' empleados');
END;

--3--
SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY = MIN(SALARY);

