-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: PostgreSQL
-- Generated at: 2025-03-04T05:04:05.650Z

CREATE TABLE "producto" (
  "clave_producto" integer PRIMARY KEY,
  "descripcion_producto" varchar,
  "clave_subfamilia" integer,
  "descripcion_subfamilia" varchar,
  "clave_familia" integer,
  "descripcion_familia" varchar,
  "clave_departamento" integer,
  "descripcion_departament" varchar
);

CREATE TABLE "cliente" (
  "clave_cliente" integer PRIMARY KEY,
  "descripcion_cliente" varchar,
  "clave_clasificacion" integer,
  "descripcion_clasificacion" varchar,
  "clave_sector" integer,
  "descripcion_sector" varchar
);

CREATE TABLE "tienda" (
  "clave_tienda" integer PRIMARY KEY,
  "descripcion_tienda" varchar,
  "clave_zona" integer,
  "descripcion_zona" varchar,
  "clave_estado" integer,
  "descripcion_estado" varchar,
  "clave_pais" integer,
  "descripcion_pais" varchar
);

CREATE TABLE "vendedor" (
  "clave_vendedor" integer PRIMARY KEY,
  "descripcion_vendedor" varchar,
  "clave_supervisor" integer,
  "descripcion_supervisor" varchar
);

CREATE TABLE "fecha" (
  "clave_dia" integer PRIMARY KEY,
  "clave_mes" integer,
  "clave_año" integer
);

CREATE TABLE "tabla_hechos" (
  "clave_dia" integer,
  "clave_tienda" integer,
  "clave_vendedor" integer,
  "clave_cliente" integer,
  "clave_producto" integer,
  "ventas" bigint,
  "costos" bigint,
  "unidades" varchar,
  "descuentos" varchar,
  "devoluciones" varchar,
  "venta_objetivo" varchar,
  "costo_presupuesto" varchar
);

ALTER TABLE "tabla_hechos" ADD FOREIGN KEY ("clave_dia") REFERENCES "fecha" ("clave_dia");

ALTER TABLE "tabla_hechos" ADD FOREIGN KEY ("clave_tienda") REFERENCES "tienda" ("clave_tienda");

ALTER TABLE "tabla_hechos" ADD FOREIGN KEY ("clave_vendedor") REFERENCES "vendedor" ("clave_vendedor");

ALTER TABLE "tabla_hechos" ADD FOREIGN KEY ("clave_cliente") REFERENCES "cliente" ("clave_cliente");

ALTER TABLE "tabla_hechos" ADD FOREIGN KEY ("clave_producto") REFERENCES "producto" ("clave_producto");
