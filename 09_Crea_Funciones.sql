--Función que devuelve un valor
--Validez de un boleto según su id
CREATE OR REPLACE FUNCTION fnc_validez(pidboleto INTEGER)
    RETURNS VARCHAR(16)
AS
    $$
    DECLARE fecha DATE;
    BEGIN
        fecha = (
        SELECT fecha_validez AS fecha
        FROM boleto
        WHERE boleto.id_boleto = pidboleto);

        IF (fecha < (SELECT CURRENT_DATE))
            THEN
                RETURN 'Vencido';
        ELSE
            RETURN 'Activo';
        END IF;
    END;
    $$
LANGUAGE 'plpgsql' VOLATILE;
--probamos la funcion
SELECT *
FROM fnc_validez(3);

--Función que devuelve el id y nombre completo de la persona según el boleto del que es dueño.
CREATE OR REPLACE FUNCTION fnc_datosp_boleto(pidboleto INTEGER, pl_inter INTEGER)
    RETURNS TABLE(idpersona INTEGER, nom VARCHAR(32), app VARCHAR(32), apm VARCHAR(32))
AS
    $$
      BEGIN
          RETURN QUERY SELECT persona.id_persona, nombre, apellidopat, apellidomat
          FROM (boleto JOIN cliente ON boleto.id_cliente = cliente.id_cliente) t1
                JOIN persona ON t1.id_persona = persona.id_persona
          WHERE id_boleto > pidboleto FETCH NEXT pl_inter ROWS ONLY;
      END;
    $$
LANGUAGE 'plpgsql' VOLATILE;
--probamos la funcion
SELECT *
FROM fnc_datosp_boleto(10, 6);

--Función que actualiza el nombre la persona dado su id.
CREATE OR REPLACE FUNCTION fnc_nombre_act(pid INTEGER, pvalor VARCHAR) RETURNS VARCHAR(16)
AS
$$
    BEGIN
        UPDATE persona SET nombre = pvalor WHERE id_persona = pid;
        RETURN 'Actualizado';
    END;
$$
LANGUAGE 'plpgsql' VOLATILE;
--probamos la funcion
UPDATE persona
SET nombre = 'Sebastian'
WHERE id_persona = 2;
-- Ahora actualizamos el nombre actual (Sebastián) y el nuevo será Ronaldo
SELECT *
FROM fnc_nombre_act(pid:=2, pvalor:='Ronaldo');








