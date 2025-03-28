Create table clientes(
Num_clie integer not null PRIMARY KEY,
Empresas char(20) not null,
Repclie  integer,
Limites_credito numeric
);


CREATE TABLE repventas(
Num_empl integer not null PRIMARY KEY,
Nombre char(15) not null,
Edad integer,
Oficina_rep integer,
Titulo char(10),
Contrato date not null,
Director integer,
Cuota numeric,
Ventas numeric not null
);

CREATE TABLE oficinas (
Oficina integer not null PRIMARY KEY,
Ciudad char(15) not null,
Region char (10) not null,
Dir integer REFERENCES repventas (Num_empl),
Objetivo number,
Ventas number not null
);

CREATE TABLE productos(
Id_fab char(3) not null,
Id_producto char(5) not null,
Descripcion char(20) not null,
Precio number not null,
Existencias integer not null,
CONSTRAINT productos_Id_fab_Id_producto PRIMARY KEY (Id_fab, Id_producto)
);


CREATE TABLE pedidos (
Num_pedido integer not null PRIMARY KEY,
Fecha_pedido date not null,
Clie integer not null REFERENCES clientes (Num_clie),
Rep integer REFERENCES repventas (Num_empl),
Fab char(3) not null,
Producto char(5) not null,
Cant integer not null,
Importe number not null
);

CREATE TABLE departamento(
Dept char(4) not null PRIMARY KEY,
Dedif char(2) not null,
Ddespacho integer not null, 
Dchfno char(3)
);

CREATE TABLE curso (
Cno char(3) not null PRIMARY KEY,
Cnombre char(22)  not null,
Cdescp char(25) not null,
Cred integer not null, 
Ctarifa number not null, 
Cdept char(4) not null REFERENCES departamento (Dept)
);

CREATE TABLE claustro(
Fno char(3) not null PRIMARY KEY,
Fnombre char(15) not null,
Fdomi char(20) not null,
Fcanti date not null,
Fnumdep integer,
Fsueldo number not null,
Fdept char(4) not null REFERENCES departamento (Dept)
);

CREATE TABLE clase (
Cno char(3) not null REFERENCES curso (Cno),
Sec char(2) not null,
Cinstrfno char(2) not null,
Cdia char(2) not null,
Chora char(14) not null,
Cedif char(2) not null,
Cdespacho integer not null, 
CONSTRAINT clase_Cno_Sec PRIMARY KEY(Cno, Sec)
);