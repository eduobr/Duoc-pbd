-- /////////////////////////////////////////////////////////////////////////////
-- Ejemplo de manejo de Excepciones con Bloque Anidado

-- Descripción resultado:
-- Recorre todo el loop a pesar de que se lanza una excepción al llegar al
-- número 5
-- /////////////////////////////////////////////////////////////////////////////

DECLARE
     -- Declaración excepción personalizada
     e_cinco EXCEPTION;
BEGIN
     FOR i IN 1..10 LOOP
          -- Bloque anónimo anidado que permite manejar la excepción
          -- y continuar con la ejecución del For Loop
          BEGIN
               IF i = 5 THEN
                    -- Lanzamiento de excepción personalizada
                    RAISE e_cinco;                    
               END IF;
               DBMS_OUTPUT.PUT_LINE('El valor de i es: '||i);
          -- manejo de excepciones
          EXCEPTION
               WHEN e_cinco THEN
                    DBMS_OUTPUT.PUT_LINE('Exception 5');
               WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('Se produjo una excepcion desconocida');
          END;
     END LOOP;
END;

-- /////////////////////////////////////////////////////////////////////////////
-- Ejemplo de manejo de Excepciones SIN uso de Bloques Anidados

-- Descripción resultado:
-- Recorre solo hasta el número 5 del Loop, que es donde se lanza la excepción, 
-- luego la excepción es maneja por el fragmento de código "WHEN e_cinco THEN"
-- y la ejecución NO vuelve al Loop
-- /////////////////////////////////////////////////////////////////////////////

DECLARE
     e_cinco EXCEPTION;
BEGIN
     FOR i IN 1..10 LOOP          
          IF i = 5 THEN
               RAISE e_cinco;                    
          END IF;
          DBMS_OUTPUT.PUT_LINE('El valor de i es: '||i);
     END LOOP;
-- Manejo de excepciones de todo el bloque anónimo
EXCEPTION
     WHEN e_cinco THEN
          DBMS_OUTPUT.PUT_LINE('Exception 5');
     WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('Se produjo una excepcion desconocida');
END;