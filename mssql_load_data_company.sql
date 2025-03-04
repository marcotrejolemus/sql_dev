-- Inserts para la tabla fecha
INSERT INTO fecha (clave_dia, clave_mes, clave_año)
VALUES
(26,2,2025),
(27,2,2025),
(10,1,2023),
(15,2,2024),
(18,4,2024),
(12,8,2024),
(11,8,2024),
(16,8,2024),
(30,6,2003),
(29,6,2003),
(28,6,2003),
(1,9,2004),
(2,9,2004),
(3,9,2004),
(4,9,2004);
-- Inserts para la tabla cliente
INSERT INTO cliente (clave_cliente, descripcion_cliente, clave_clasificacion, descripcion_clasificacion, clave_sector, descripcion_sector)
VALUES
(10,'Sugar Fds',1,'Food',4,'Norte'),
(20,'OrecHealth',1,'Healthcare',4,'Norte'),
(30,'GizerEner',1,'Batteries',4,'Norte'),
(40,'EBH',1,'Electronic',4,'Norte'),
(50,'MartWell',1, 'Grocery', 4, 'Norte');
-- Inserts para la tabla tienda
INSERT INTO tienda (clave_tienda, descripcion_tienda, clave_zona, descripcion_zona, clave_estado, descripcion_estado, clave_pais, descripcion_pais)
VALUES
(101, '101 Monterrey', 1, 'Zona 4', 11, 'Nuevo Leon', 101, 'Mexico'),
(102, '102 Reynosa', 2, 'Zona 4', 12, 'Tamaulipas', 102, 'Mexico'),
(103, '103 Saltillo', 3, 'Zona 4', 13, 'Chihuahua', 103, 'Mexico'),
(104, '104 Torreon', 4, 'Zona 4', 14, 'Chihuahua', 104, 'Mexico'),
(105, '105 Durango', 5, 'Zona 4', 15, 'Durango', 105, 'Mexico');

-- Inserts para la tabla vendedor
INSERT INTO vendedor (clave_vendedor, descripcion_vendedor, clave_supervisor, descripcion_supervisor)
VALUES
(10, 'Vendedor 10', 101, 'Supervisor A'),
(11, 'Vendedor 11', 102, 'Supervisor B'),
(12, 'Vendedor 12', 103, 'Supervisor C'),
(13, 'Vendedor 13', 104, 'Supervisor D'),
(14, 'Vendedor 14', 105, 'Supervisor E')
(15, 'Vendedor 15', 106, 'Supervisor F')
(16, 'Vendedor 16', 107, 'Supervisor G');
-- Inserts para la tabla producto
INSERT INTO producto (clave_producto, descripcion_producto, clave_subfamilia, descripcion_subfamilia, clave_familia, descripcion_familia, clave_departamento, descripcion_departamento)
VALUES
(1,'Sugar Sack 50 KG',1,'Sugar',1,'Food',10,'10 Comida'),
(2,'AAA Box 100 KG',2,'Consumables',2,'Batteries',20,'20 Oficina'),
(3,'Glucometer',3,'Devices',3,'HealthChecker',30,'30 Farmacia'),
(4,'TV SHARP 75',4,'Devices',4,'Electronicos',40,'40 Electronicos'),
(5,'Tablet Samsung Galaxy',4,'Devices',4,'Electronicos',40,'40 Electronicos'),
(6,'Papel Bond T Carta 500 Hojas',5,'Consumables',5,'Papeleria',15,'15 Papeleria'),
(7,'Paquete Zebra Pluma Lapicero Ngo',6,'Consumables',6,'Papeleria',15,'15 Papeleria'),
(8,'Paquete Prismacolor Colores Primarios',7,'Consumables',7,'Papeleria',15,'15 Papeleria'),
(9,'Paquete Borrador Sierra',8,'Consumables',8,'Papeleria',15,'15 Papeleria');



-- Inserts para la tabla tabla_hechos
INSERT INTO tabla_hechos (clave_dia, clave_tienda, clave_vendedor, clave_cliente, clave_producto, ventas, costos, unidades, descuentos, devoluciones, venta_objetivo, costo_presupuesto)
VALUES 
(26,101,12,10,1,10000,5000,10,0,10,'fidelizar','administrativo'),
(27,101,14,20,3,10000,500000,10,0,0,'retener','administrativo'),
(27,101,12,20,3,20000,10000,10,0,0,'inventario','produccion'),
(27,101,14,30,2,30000,15000,10,0,0,'aumentar volumen','produccion'),
(27,101,12,30,2,60000,30000,30,0,0,'fidelizar','administrativo'),
(27,102,15,10,1,20000,10000,10,0,0,'fidelizar','administrativo'),
(27,103,16,20,3,50000,25000,40,0,0,'retener','administrativo'),
(27,104,16,20,3,50000,25000,40,10,0,'fidelizar','administrativo'),
(10,101,12,30,5,12000,8000,1,20,0,'aumentar volumen','produccion'),
(10,103,14,40,4,20000,12000,1,20,0,'aumentar volumen','produccion'),
(15,101,12,10,6,40000,10000,500,0,0,'fidelizar','administrativo'),
(15,101,12,20,6,40000,10000,500,0,0,'fidelizar','administrativo'),
(18,101,12,30,6,80000,20000,1000,0,10,'fidelizar','administrativo'),
(18,101,12,40,6,80000,20000,2000,0,0,'fidelizar','administrativo'),
(12,101,12,40,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,101,12,30,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,101,12,30,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,101,12,30,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,102,12,30,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,103,12,40,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(12,103,12,40,6,160000,4000,3000,0,0,'fidelizar','administrativo'),
(11,101,12,40,7,170000,5000,3000,0,10,'fidelizar','administrativo'),
(16,102,12,40,8,599000,98000,20000,0,0,'fidelizar','administrativo'),
(16,101,12,40,9,1000,500,500,0,0,'fidelizar','administrativo'),
(16,101,12,40,7,99000,699000,20000,20,0,'retener','administrativo'),
(30,102,12,40,7,999000,9000,500000,20,0,'retener','administrativo'),
(30,102,12,40,8,999000,9900,500000,20,0,'retener','administrativo'),
(29,103,12,40,9,999000,9900,500000,20,100,'retener','administrativo'),
(29,103,12,40,9,999000,9900,500000,20,0,'retener','administrativo'),
(1,101,12,30,8,900000,9000,40000,0,0,'retener','administrativo'),
(1,102,12,20,7,900000,9000,40000,0,10,'retener','administrativo'),
(2,103,12,10,6,900000,9000,40000,0,0,'retener','administrativo'),
(2,102,12,20,6,900000,9000,40000,0,0,'retener','administrativo'),
(3,101,12,30,6,900000,9000,40000,0,0,'retener','administrativo'),
(3,104,12,40,6,900000,9000,40000,0,10,'retener','administrativo'),
(3,103,12,40,6,5000,300,8000,0,0,'retener','administrativo'),
(4,101,12,30,8,1000,100,300,0,0,'retener','administrativo');