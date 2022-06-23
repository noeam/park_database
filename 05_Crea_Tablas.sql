-- AQUI VA EL ESQUEMA (CREACION DE LAS TABLAS)
CREATE DATABASE parque_diversiones;

CREATE TABLE articulo (
  id_articulo SERIAL,
  nombre_articulo VARCHAR(50),
  precio DECIMAL,
  id_tipo_articulo INTEGER,
  id_boleto INTEGER
);

CREATE TABLE atraccion (
  id_atraccion SERIAL,
  capacidad INTEGER,
  id_fabricante INTEGER,
  id_estado_atraccion INTEGER,
  id_tipo_atraccion INTEGER
);

CREATE TABLE boleto (
  id_boleto SERIAL,
  fecha_validez DATE,
  id_cliente INTEGER,
  id_tipo_boleto INTEGER 
);

CREATE TABLE ccolonia (
  id_colonia SERIAL,
  etiqueta_colonia VARCHAR(64),
  id_municipio INTEGER
);

CREATE TABLE cestado (
  id_estado SERIAL,
  etiqueta_estado VARCHAR(25)
);

CREATE TABLE cestado_atraccion (
  id_estado_atraccion SERIAL,
  etiqueta_estado_atraccion VARCHAR(15)
);

CREATE TABLE cfabricante (
  id_fabricante SERIAL,
  etiqueta_fabricante VARCHAR(40)
);

CREATE TABLE cliente (
  id_cliente SERIAL,
  id_persona INTEGER
);

CREATE TABLE cmunicipio (
  id_municipio SERIAL,
  etiqueta_municipio VARCHAR(64),
  id_estado INTEGER
);

CREATE TABLE crol (
  id_rol SERIAL,
  etiqueta_rol VARCHAR(30)
);

CREATE TABLE csexo (
  id_sexo SERIAL,
  etiqueta_sexo VARCHAR(12)
);

CREATE TABLE ctipo_articulo (
  id_tipo_articulo SERIAL,
  etiqueta_tipo_articulo VARCHAR(40)
);

CREATE TABLE ctipo_atraccion (
  id_tipo_atraccion SERIAL,
  etiqueta_tipo VARCHAR(30)
);

CREATE TABLE ctipo_boleto (
  id_tipo_boleto SERIAL,
  etiqueta_tipo_boleto VARCHAR(15)
);

CREATE TABLE ctipo_de_pago (
  id_tipo_de_pago SERIAL,
  etiqueta_tipo_de_pago VARCHAR(20)
);

CREATE TABLE direccion (
  id_direccion SERIAL,
  calle VARCHAR(64),
  num_exterior INTEGER,
  codigo_postal INTEGER,
  id_colonia INTEGER
);

CREATE TABLE empleado (
  id_empleado SERIAL,
  sueldo DECIMAL,
  nss BIGINT,
  id_rol INTEGER,
  id_persona INTEGER
);

CREATE TABLE empleado_atraccion (
  id_empleado_atraccion SERIAL,
  numero_veces_uso INTEGER,
  fecha_uso DATE,
  id_empleado INTEGER,
  id_atraccion INTEGER
);

CREATE TABLE orden (
  id_orden SERIAL,
  id_articulo INTEGER,
  cantidad INTEGER
);

CREATE TABLE orden_cliente (
  id_orden_cliente SERIAL,
  fecha_orden DATE,
  hora_pago TIME,
  id_tipo_de_pago INTEGER,
  id_cliente INTEGER,
  id_orden INTEGER
);

CREATE  TABLE  persona (
  id_persona SERIAL,
  apellidopat VARCHAR(32),
  apellidomat VARCHAR(32),
  nombre VARCHAR(64),
  fecha_nacimiento DATE,
  telefono INTEGER,
  id_sexo INTEGER,
  id_direccion INTEGER
);
