SELECT * FROM BITACORA_CONTACTO;
SELECT * FROM REGISTRO_LOG;
SELECT * FROM MEDIO_CONTACTO;
SELECT * FROM MOTIVOS;

CREATE SEQUENCE SEQ_ID_LOG;
DROP TRIGGER TRG_REG_BITACORA;
CREATE OR REPLACE TRIGGER TRG_REG_BITACORA
 BEFORE INSERT OR UPDATE OR DELETE ON BITACORA_CONTACTO
 FOR EACH ROW
BEGIN
 IF INSERTING THEN
  INSERT INTO REGISTRO_LOG VALUES(SEQ_ID_LOG.NEXTVAL,SYSDATE,'INGRESO BITACORA',:NEW.BIT_VIGENCIA);
 END IF;
END;

INSERT INTO BITACORA_CONTACTO(ID_BITACORA,BIT_FECHA,BIT_DESCRIPCION,BIT_VIGENCIA,ID_MEDIO,ID_MOTIVO,CLI_RUT) VALUES(203,SYSDATE,'REGISTRO BITACORA 89',1,1,1,6868859);
DELETE FROM BITACORA_CONTACTO WHERE ID_BITACORA = 203;
SELECT * FROM REGISTRO_LOG;