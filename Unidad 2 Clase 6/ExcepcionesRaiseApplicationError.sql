-- Excepciones con código y mensaje personalizado
-- El rango de valores permitido es: -20.999 y -20.000 (incluyente)

-- Descripción:
-- Para manejar las excepciones personalizadas en la sección EXCEPTION,
-- se debe utilizar la variable del sistema SQLCODE que devuelve
-- el número de error que ocurrió
BEGIN
     -- Puedes descomentar cualquiera de las 2 exepciones personalizadas
     -- para probar el código
     RAISE_APPLICATION_ERROR(-20000, 'Mi error 20 MIL personalizado.');
     --RAISE_APPLICATION_ERROR(-20999, 'Mi error 20999 personalizado.');
     
     -- -----------------------------------------------------------------------
     -- si utilizo un valor fuera del ranto permitido
     -- ORACLE lanza el siguiente error:
     -- ORA-21000: error number argument to raise_application_error of -19999 is out of range
     --RAISE_APPLICATION_ERROR(-19999, 'Valor fuera del rango permitido');
EXCEPTION
     -- Solo para mostrar como quedaría un código con más excepciones
     -- no cumple ningún otro rol en el código
     WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('El SELECT no devolvió ninguna fila!');
     WHEN OTHERS THEN
          CASE SQLCODE 
               WHEN -20000 THEN
                    DBMS_OUTPUT.PUT_LINE('Error desconocido!');
               WHEN -20999 THEN
                    DBMS_OUTPUT.PUT_LINE('Error -20999!!!!!');
          END CASE;
END;