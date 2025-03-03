-- ## Ventas de tiendas
SELECT clave_tienda,SUM(ventas) 
FROM tabla_hechos
GROUP BY clave_tienda;
## Ganancias x familia producto
SELECT the.clave_tienda,the.clave_producto, pro.clave_familia, pro.descripcion_familia, SUM(the.ventas) 
FROM tabla_hechos the, producto pro
WHERE the.clave_producto = pro.clave_producto
GROUP BY the.clave_tienda,the.clave_producto,pro.clave_familia, pro.descripcion_familia;

-- ## Descuentos por vendedor en el 2023
SELECT the.clave_dia, the.clave_vendedor, the.ventas, the.descuentos
FROM tabla_hechos the, fecha fc
WHERE the.clave_dia = fc.clave_dia
AND the.descuentos <> 'na'
AND fc.clave_año = '2023'

-- ## Ventas Mensuales x Cliente el 2024 en Nuevo Leon y Departamento 15 Papeleria
SELECT the.clave_dia, fc.clave_mes, fc.clave_año, the.clave_cliente, 
the.clave_vendedor,SUM(the.ventas), the.descuentos,tnd.descripcion_estado
FROM tabla_hechos the, fecha fc, tienda tnd
WHERE the.clave_dia = fc.clave_dia
AND the.clave_tienda = tnd.clave_tienda
AND fc.clave_año = '2024'
AND tnd.descripcion_estado ='Nuevo Leon'
GROUP BY the.clave_dia, fc.clave_mes, fc.clave_año, the.clave_cliente, 
the.clave_vendedor, the.ventas, the.descuentos,tnd.descripcion_estado

-- ## Productos Ganacia > 500,000 en Ago 2024
SELECT the.clave_dia, fc.clave_mes, fc.clave_año, the.clave_producto,
the.clave_vendedor,SUM(the.ventas) as ventas_total, SUM(the.ventas-the.costos) as ganancias, the.descuentos
FROM tabla_hechos the, producto prd, fecha fc
WHERE the.clave_dia = fc.clave_dia
AND the.clave_producto = prd.clave_producto
AND fc.clave_año = '2024'
AND fc.clave_mes = '8'
GROUP BY the.clave_dia, fc.clave_mes, fc.clave_año, the.clave_producto,
the.clave_vendedor, the.ventas, the.descuentos
HAVING SUM(the.ventas-the.costos) > 500000

-- ## Supervisores que rebasaron costos 
SELECT 
v.clave_supervisor, 
v.descripcion_supervisor,
SUM(th.costos) AS total_costos,
SUM(th.ventas) AS total_ventas,
(SUM(th.costos) / NULLIF(SUM(th.ventas), 0)) * 100 AS porcentaje_costos
FROM tabla_hechos th
JOIN vendedor v ON th.clave_vendedor = v.clave_vendedor
GROUP BY v.clave_supervisor, v.descripcion_supervisor
HAVING SUM(th.costos) > SUM(th.ventas) * 1.1  -- Costos mayores al 110% de ventas
ORDER BY porcentaje_costos DESC;

--## 5 Estados con > porcentaje de margen primeros 6 meses 2023
SELECT 
    t.clave_estado, 
    t.descripcion_estado,
    SUM(th.ventas) AS total_ventas,
    SUM(th.costos) AS total_costos,
    (SUM(th.ventas - th.costos) / NULLIF(SUM(th.ventas), 0)) * 100 AS porcentaje_margen
FROM tabla_hechos th
JOIN tienda t ON th.clave_tienda = t.clave_tienda
JOIN fecha f ON th.clave_dia = f.clave_dia
WHERE f.clave_año = 2003 
  AND f.clave_mes BETWEEN 1 AND 6  -- Primeros 6 meses
GROUP BY t.clave_estado, t.descripcion_estado
ORDER BY porcentaje_margen DESC
LIMIT 5;

-- ## Tiendas debajo promedio ventas mes septiembre 2004
SELECT 
   c.clave_sector, 
    c.descripcion_sector,
    SUM((th.devoluciones)) AS total_devoluciones
FROM tabla_hechos th
JOIN cliente c ON th.clave_cliente = c.clave_cliente
GROUP BY c.clave_sector, c.descripcion_sector
ORDER BY total_devoluciones DESC
LIMIT 3;

-- ## 3 sectores cte con > numero devoluciones
SELECT 
     t.clave_estado,t.descripcion_tienda, 
     t.descripcion_estado,
     SUM(th.ventas) AS total_ventas,
     SUM(th.costos) AS total_costos,
     (SUM(th.ventas) / NULLIF(COUNT(th.ventas), 0)) AS promedio_ventas, COUNT(th.ventas)
FROM tabla_hechos th
JOIN tienda t ON th.clave_tienda = t.clave_tienda
JOIN fecha f ON th.clave_dia = f.clave_dia
WHERE f.clave_año = 2004
  AND f.clave_mes = 9
  AND total_ventas < promedio_ventas 
GROUP BY t.clave_estado, descripcion_tienda, t.descripcion_estado
ORDER BY promedio_ventas DESC
LIMIT 5;
