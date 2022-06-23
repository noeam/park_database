------------------  LLAVES PRIMARIAS ----------------------------------
ALTER TABLE articulo
ADD CONSTRAINT pk_articulo_id_articulo PRIMARY KEY (id_articulo);

ALTER TABLE atraccion
ADD CONSTRAINT pk_atraccion_id_atraccion PRIMARY KEY (id_atraccion);

ALTER TABLE boleto
ADD CONSTRAINT pk_boleto_id_boleto PRIMARY KEY (id_boleto);

ALTER TABLE ccolonia
ADD CONSTRAINT pk_ccolonia_id_colonia PRIMARY KEY (id_colonia);

ALTER TABLE cestado
ADD CONSTRAINT pk_cestado_id_estado PRIMARY KEY (id_estado);

ALTER TABLE cestado_atraccion
ADD CONSTRAINT pk_cestado_atraccion_id_estado_atraccion PRIMARY KEY (id_estado_atraccion);

ALTER TABLE cfabricante
ADD CONSTRAINT pk_cfabricante_id_fabricante PRIMARY KEY (id_fabricante);

ALTER TABLE cliente 
ADD CONSTRAINT pk_cliente_id_cliente PRIMARY KEY (id_cliente);

ALTER TABLE cmunicipio
ADD CONSTRAINT pk_cmunicipio_id_municipio PRIMARY KEY (id_municipio);

ALTER TABLE crol
ADD CONSTRAINT pk_crol_id_rol PRIMARY KEY (id_rol);

ALTER TABLE csexo
ADD CONSTRAINT pk_csexo_id_sexo PRIMARY KEY (id_sexo);

ALTER TABLE ctipo_articulo 
ADD CONSTRAINT pk_ctipo_articulo_id_tipo_articulo PRIMARY KEY (id_tipo_articulo);

ALTER TABLE ctipo_atraccion
ADD CONSTRAINT pk_ctipo_atraccion_id_tipo_atraccion PRIMARY KEY (id_tipo_atraccion);

ALTER TABLE ctipo_boleto 
ADD CONSTRAINT pk_ctipo_boleto_id_tipo_boleto PRIMARY KEY (id_tipo_boleto);

ALTER TABLE ctipo_de_pago
ADD CONSTRAINT pk_ctipo_de_pago_id_tipo_de_pago PRIMARY KEY (id_tipo_de_pago);

ALTER TABLE direccion 
ADD CONSTRAINT pk_direccion_id_direccion PRIMARY KEY (id_direccion);

ALTER TABLE empleado
ADD CONSTRAINT pk_empleado_id_empleado PRIMARY KEY (id_empleado);
  
ALTER TABLE empleado_atraccion
ADD CONSTRAINT pk_empleado_atraccion_id_empleado_atraccion PRIMARY KEY (id_empleado_atraccion);

ALTER TABLE orden
ADD CONSTRAINT pk_orden_id_orden PRIMARY KEY (id_orden);

ALTER TABLE orden_cliente
ADD CONSTRAINT pk_orden_cliente_id_orden_cliente PRIMARY KEY (id_orden_cliente);

ALTER TABLE persona
ADD CONSTRAINT pk_persona_id_persona PRIMARY KEY (id_persona);

---COMPLETAS---

------------------  LLAVES SECUNDARIAS ----------------------------------
ALTER TABLE atraccion
ADD CONSTRAINT fk_atraccion_id_frabricante_cfabricante_id_fabricante
    FOREIGN KEY (id_fabricante) REFERENCES cfabricante(id_fabricante);

ALTER TABLE atraccion
ADD CONSTRAINT fk_atraccion_id_estado_cestado_atraccion_id_estado_atraccion
FOREIGN KEY (id_estado_atraccion) REFERENCES cestado_atraccion(id_estado_atraccion);

ALTER TABLE atraccion
ADD CONSTRAINT fk_atraccion_id_tipo_atraccion_ctipoatraccion_id_tipo_atraccion
FOREIGN KEY (id_tipo_atraccion) REFERENCES ctipo_atraccion(id_tipo_atraccion);

ALTER TABLE cliente 
ADD CONSTRAINT fk_cliente_id_persona_persona_id_persona
FOREIGN KEY (id_persona) REFERENCES persona(id_persona);

ALTER TABLE direccion
ADD CONSTRAINT fk_direccion_id_colonia_ccolonia_id_colonia
FOREIGN KEY (id_colonia) REFERENCES ccolonia(id_colonia);

ALTER TABLE empleado_atraccion 
ADD CONSTRAINT fk_empleado_atraccion_id_empleado_empleado_id_empleado
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);

ALTER TABLE empleado_atraccion 
ADD CONSTRAINT fk_empleado_atraccion_id_atraccion_atraccion_id_atraccion
FOREIGN KEY (id_atraccion) REFERENCES atraccion(id_atraccion);

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_id_persona_persona_id_persona
FOREIGN KEY (id_persona) REFERENCES persona(id_persona);

ALTER TABLE empleado 
ADD CONSTRAINT fk_empleado_id_rol_crol_id_rol
FOREIGN KEY (id_rol) REFERENCES crol(id_rol);

ALTER TABLE orden_cliente
ADD CONSTRAINT fk_orden_cliente_id_cliente_cliente_id_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE orden_cliente
ADD CONSTRAINT fk_orden_cliente_id_orden_orden_id_orden
FOREIGN KEY (id_orden) REFERENCES orden(id_orden);

ALTER TABLE orden_cliente
ADD CONSTRAINT fk_orden_cliente_id_tipo_de_pago_ctipo_de_pago_id_tipo_de_pago
FOREIGN KEY (id_tipo_de_pago) REFERENCES ctipo_de_pago(id_tipo_de_pago);

ALTER TABLE boleto 
ADD CONSTRAINT fk_boleto_id_cliente_cliente_id_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE boleto 
ADD CONSTRAINT fk_boleto_id_tipo_boleto_ctipo_boleto_id_tipo_boleto
FOREIGN KEY (id_tipo_boleto) REFERENCES ctipo_boleto(id_tipo_boleto);

ALTER TABLE ccolonia 
ADD CONSTRAINT fk_ccolonia_id_municipio_cmunicipio_id_municipio
FOREIGN KEY (id_municipio) REFERENCES cmunicipio(id_municipio);

ALTER TABLE articulo 
ADD CONSTRAINT fk_articulo_id_tipo_articulo_ctipo_articulo_id_tipo_articulo
FOREIGN KEY (id_tipo_articulo) REFERENCES ctipo_articulo(id_tipo_articulo);

ALTER TABLE articulo 
ADD CONSTRAINT fk_articulo_id_boleto_boleto_id_boleto
FOREIGN KEY (id_boleto) REFERENCES boleto(id_boleto);

ALTER TABLE orden
ADD CONSTRAINT fk_orden_id_articulo_articulo_id_articulo
FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

ALTER TABLE persona
ADD CONSTRAINT fk_id_persona_id_sexo_csexo_id_sexo
FOREIGN KEY (id_sexo) REFERENCES csexo(id_sexo);

ALTER TABLE persona
ADD CONSTRAINT fk_id_persona_id_direccion_direccion_id_direccion
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion);

ALTER TABLE cmunicipio
ADD CONSTRAINT fk_cmunicipio_id_estado_cestado_id_estado
FOREIGN KEY (id_estado) REFERENCES cestado(id_estado);

---COMPLETAS


-------------------------NOT NULL----------------------------
ALTER TABLE articulo
ALTER COLUMN precio SET NOT NULL;

ALTER TABLE articulo
ALTER COLUMN nombre_articulo SET NOT NULL;

ALTER TABLE atraccion
ALTER COLUMN capacidad SET NOT NULL;

ALTER TABLE boleto 
ALTER COLUMN id_cliente SET NOT NULL;

ALTER TABLE boleto 
ALTER COLUMN id_tipo_boleto SET NOT NULL;

ALTER TABLE ccolonia 
ALTER COLUMN etiqueta_colonia SET NOT NULL;

ALTER TABLE ccolonia 
ALTER COLUMN id_municipio SET NOT NULL;

ALTER TABLE cestado_atraccion
ALTER COLUMN etiqueta_estado_atraccion SET NOT NULL;

ALTER TABLE cfabricante
ALTER COLUMN etiqueta_fabricante SET NOT NULL;

ALTER TABLE csexo
ALTER COLUMN etiqueta_sexo SET NOT NULL;

ALTER TABLE ctipo_articulo 
ALTER COLUMN etiqueta_tipo_articulo SET NOT NULL;

ALTER TABLE ctipo_boleto 
ALTER COLUMN etiqueta_tipo_boleto SET NOT NULL;

ALTER TABLE ctipo_atraccion
ALTER COLUMN etiqueta_tipo SET NOT NULL;

ALTER TABLE direccion
ALTER COLUMN calle SET NOT NULL;

ALTER TABLE direccion
ALTER COLUMN num_exterior SET NOT NULL;

ALTER TABLE direccion
ALTER COLUMN codigo_postal SET NOT NULL;

ALTER TABLE empleado_atraccion
ALTER COLUMN numero_veces_uso SET NOT NULL;

ALTER TABLE empleado
ALTER COLUMN sueldo SET NOT NULL;

ALTER TABLE empleado
ALTER COLUMN nss SET NOT NULL;

ALTER TABLE orden_cliente
ALTER COLUMN hora_pago SET NOT NULL;

ALTER TABLE orden_cliente
ALTER COLUMN id_tipo_de_pago SET NOT NULL;

ALTER TABLE orden_cliente
ALTER COLUMN id_cliente SET NOT NULL;

ALTER TABLE orden_cliente
ALTER COLUMN id_orden SET NOT NULL;

ALTER TABLE orden
ALTER COLUMN id_articulo SET NOT NULL;

ALTER TABLE orden
ALTER COLUMN cantidad SET NOT NULL;

ALTER TABLE atraccion
ALTER COLUMN id_fabricante SET NOT NULL;

ALTER TABLE atraccion
ALTER COLUMN id_estado_atraccion SET NOT NULL;

ALTER TABLE atraccion
ALTER COLUMN id_tipo_atraccion SET NOT NULL;

ALTER TABLE crol
ALTER COLUMN etiqueta_rol SET NOT NULL;

ALTER TABLE persona
ALTER COLUMN apellidopat SET NOT NULL;

ALTER TABLE persona
ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE persona
ALTER COLUMN id_sexo SET NOT NULL;

ALTER TABLE persona
ALTER COLUMN id_direccion SET NOT NULL;

ALTER TABLE persona  
ALTER COLUMN telefono SET NOT NULL;


---------------------------CHECKS----------------------------

ALTER TABLE atraccion
ADD CHECK (capacidad > 0);

ALTER TABLE direccion 
ADD CHECK (num_exterior > 0);

ALTER TABLE orden 
ADD CHECK (cantidad > 0);

ALTER TABLE csexo 
ADD CHECK (etiqueta_sexo IN ('M','F'));