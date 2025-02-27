CREATE TABLE `producto` (
  `clave_producto` integer PRIMARY KEY,
  `descripcion_producto` varchar(255),
  `clave_subfamilia` integer,
  `descripcion_subfamilia` varchar(255),
  `clave_familia` integer,
  `descripcion_familia` varchar(255),
  `clave_departamento` integer,
  `descripcion_departament` varchar(255)
);

CREATE TABLE `cliente` (
  `clave_cliente` integer PRIMARY KEY,
  `descripcion_cliente` varchar(255),
  `clave_clasificacion` integer,
  `descripcion_clasificacion` varchar(255),
  `clave_sector` integer,
  `descripcion_sector` varchar(255)
);

CREATE TABLE `tienda` (
  `clave_tienda` integer PRIMARY KEY,
  `descripcion_tienda` varchar(255),
  `clave_zona` integer,
  `descripcion_zona` varchar(255),
  `clave_estado` integer,
  `descripcion_estado` varchar(255),
  `clave_pais` integer,
  `descripcion_pais` varchar(255)
);

CREATE TABLE `vendedor` (
  `clave_vendedor` integer PRIMARY KEY,
  `descripcion_vendedor` varchar(255),
  `clave_supervisor` integer,
  `descripcion_supervisor` varchar(255)
);

CREATE TABLE `fecha` (
  `clave_dia` integer PRIMARY KEY,
  `clave_mes` integer,
  `clave_año` integer
);

CREATE TABLE `tabla_hechos` (
  `clave_dia` integer,
  `clave_tienda` integer,
  `clave_vendedor` integer,
  `clave_cliente` integer,
  `clave_producto` integer,
  `ventas` bigint,
  `costos` bigint,
  `unidades` varchar(255),
  `descuentos` varchar(255),
  `devoluciones` varchar(255),
  `venta_objetivo` varchar(255),
  `costo_presupuesto` varchar(255)
);

ALTER TABLE `tabla_hechos` ADD FOREIGN KEY (`clave_dia`) REFERENCES `fecha` (`clave_dia`);

ALTER TABLE `tabla_hechos` ADD FOREIGN KEY (`clave_tienda`) REFERENCES `tienda` (`clave_tienda`);

ALTER TABLE `tabla_hechos` ADD FOREIGN KEY (`clave_vendedor`) REFERENCES `vendedor` (`clave_vendedor`);

ALTER TABLE `tabla_hechos` ADD FOREIGN KEY (`clave_cliente`) REFERENCES `cliente` (`clave_cliente`);

ALTER TABLE `tabla_hechos` ADD FOREIGN KEY (`clave_producto`) REFERENCES `producto` (`clave_producto`);

