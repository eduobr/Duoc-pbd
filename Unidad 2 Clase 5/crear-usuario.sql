--DROP USER prueba2;
CREATE USER prueba2 IDENTIFIED BY "prueba2"
  DEFAULT TABLESPACE "USERS"
  TEMPORARY TABLESPACE "TEMP";
GRANT "RESOURCE" TO prueba2;
GRANT "CONNECT" TO prueba2;