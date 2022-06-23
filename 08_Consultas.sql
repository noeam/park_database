-- CONSULTA BASICA
--Dame el id, nss y sueldo de los empleados quienes ganan igual o mayor a 10,000
-- y que su rol es auxiliar (id_rol=2) o vigilante (id_rol=3).
SELECT id_empleado, nss, id_rol, sueldo
FROM empleado
WHERE sueldo >= 10000
AND id_rol = 2 OR id_rol = 3
GROUP BY sueldo, id_empleado, nss
ORDER BY sueldo DESC;

-- SUBCONSULTA
--- Nombre y apellidos de los clientes que compraron un alimento de entre $50 y $100 en el mes de enero
SELECT nombre, apellidopat, apellidomat
FROM persona
WHERE id_persona IN
      (
          SELECT id_persona
          FROM cliente
          WHERE id_cliente IN
                (
                    SELECT id_cliente
                    FROM orden_cliente
                    WHERE DATE_PART('MONTH', fecha_orden) = 01 AND id_orden IN
                          (
                              SELECT DISTINCT id_orden
                              FROM orden
                              WHERE id_articulo IN
                                    (SELECT DISTINCT id_articulo
                                     FROM articulo
                                     WHERE id_tipo_articulo = 2
                                    AND precio BETWEEN 50 AND 100)
                          )
                )
      );

-- CONSULTA COMPUESTA
-- Nombre del cliente, nombre del articulo y precio del articulo comprado por mujeres (id_sexo =2),
-- agrupados por articulo y precio de forma descendente
SELECT nombre, nombre_articulo, precio
FROM persona INNER JOIN
            (SELECT *
             FROM cliente INNER JOIN
                          (SELECT *
                           FROM orden_cliente INNER JOIN
                                              (SELECT *
                                               FROM orden INNER JOIN articulo a on orden.id_articulo = a.id_articulo) AS articulos
                           ON orden_cliente.id_orden = articulos.id_orden) AS ordenes
             ON cliente.id_cliente = ordenes.id_cliente) AS clienteorden
ON persona.id_persona = clienteorden.id_persona
WHERE persona.id_sexo=2
GROUP BY nombre, nombre_articulo, precio
ORDER BY precio DESC;

--- PAGINACIÓN
--¿Que articulo tipo mercancia puedo comprar de entre 100  y 350 pesos, que no sea un sueter?
--omite los primeros 3 articulos y solo da 10 registros
SELECT nombre_articulo, precio
FROM articulo
WHERE precio BETWEEN 100 AND 350
AND nombre_articulo NOT LIKE 'sueter%'
AND id_tipo_articulo = 3
ORDER BY precio DESC
OFFSET 3 ROWS FETCH NEXT 10 ROWS ONLY;

---CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;
-- Cuantas atracciones hay en cada estado de atraccion (funciona, no funciona, etc.) separadas por tipo de atraccion.
SELECT *
FROM CROSSTAB(
    'SELECT id_tipo_atraccion, id_estado_atraccion, count(id_estado_atraccion)
    FROM atraccion
    GROUP BY id_tipo_atraccion, id_estado_atraccion
    ORDER BY id_tipo_atraccion, id_estado_atraccion;'
    ) t_resultado (oTipo_Atraccion INT, ofunciona BIGINT, oNoDisponible BIGINT, oEnReparacion BIGINT, oMantenimiento BIGINT);

---FUNCIONES DE VENTANA
-- id de empleado, nombre, area y numero de empleados en esa area
SELECT T1.id_empleado, persona.nombre, T1.etiqueta_rol, COUNT(T1.etiqueta_rol) OVER(PARTITION BY T1.etiqueta_rol ORDER BY T1.etiqueta_rol) AS total
FROM (empleado JOIN crol c on empleado.id_rol = c.id_rol) AS T1 JOIN persona ON T1.id_persona = persona.id_persona
GROUP BY T1.id_empleado, T1.etiqueta_rol, persona.nombre;

--- AGRUPACION
-- Numero de empleados en cada rol
SELECT id_empleado, nombre, T2.etiqueta_rol, T2.total
FROM (persona
JOIN empleado e on persona.id_persona = e.id_persona ) AS T1
JOIN (
    SELECT c.id_rol, c.etiqueta_rol, COUNT (c.id_rol) total
    FROM (empleado JOIN crol c on empleado.id_rol = c.id_rol)
    GROUP BY c.id_rol,c.etiqueta_rol
    ORDER BY total DESC
    ) AS T2
ON T1.id_rol = T2.id_rol
ORDER BY etiqueta_rol;

