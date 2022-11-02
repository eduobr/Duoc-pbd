--5.- Para captar más clientes el departamento de marketing ha decidido implantar 
--un promoción que otorgue un descuento al precio de lista de los automóviles este
--descuento se aplica a todos los automóviles modelo runner4, de acuerdo al año 
--del automóvil. Si el año es 2011 el descuento corresponde a un 10%, si el año 
--es 2012 el descuento al precio es 8%, si el año está entre 2008 y 2010 el 
--descuento es un 15%, si el año es otro el descuento es 6%. Se debe mostrar 
--el precio antiguo y el precio con el descuento. Se muestra la información 
--actualizada como sigue
DECLARE
  CURSOR c_runner IS
    SELECT 
      * 
    FROM automovil
    WHERE
      modelo = 'runner4'
    ;
BEGIN
  FOR rowauto IN c_runner
  LOOP
    DBMS_OUTPUT.PUT_LINE('el precio antiguo es:'||rowauto.precio);
  
    IF rowauto."AÑO" = 2011 THEN      
      DBMS_OUTPUT.PUT_LINE('el precio dscto es:'||rowauto.precio*0.9);
    ELSIF rowauto."AÑO" = 201 THEN      
      DBMS_OUTPUT.PUT_LINE('el precio dscto es:'||rowauto.precio*0.92);
    END IF;
  END LOOP;
END;


