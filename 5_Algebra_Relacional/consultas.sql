USE megatumbados;

SELECT c.nombre,
       f.numero_factura,
       f.fecha,
       p.nombre AS nombre_producto,
       pf.cantidad
FROM Cliente c
JOIN Factura f            ON c.cedula_ruc = f.cedula_cliente
JOIN Producto_factura pf  ON f.numero_factura = pf.numero_factura
JOIN Producto p           ON pf.codigo_producto = p.codigo
WHERE f.estado_entrega = 'PENDIENTE'
  AND YEAR(f.fecha) = 2026
  AND MONTH(f.fecha) = 10;

SELECT c.cedula_ruc, c.nombre
FROM Cliente c
WHERE c.cedula_ruc IN (SELECT cedula_cliente FROM Cotizacion)
  AND c.cedula_ruc NOT IN (SELECT cedula_cliente FROM Factura);

SELECT cedula_ruc, nombre, correo
FROM Cliente
WHERE cedula_ruc IN (SELECT cedula_cliente FROM Cotizacion
                     WHERE tipo_trabajo = 'PVC')
  AND cedula_ruc IN (SELECT cedula_cliente FROM Factura
                     WHERE estado_entrega = 'PENDIENTE');

SELECT pr.codigo, pr.nombre
FROM Proveedor pr
JOIN Producto_proveedor pp ON pr.codigo = pp.codigo_proveedor
JOIN Producto p ON pp.codigo_producto = p.codigo
WHERE p.marca = 'Stanley'
GROUP BY pr.codigo, pr.nombre
HAVING COUNT(*) = (SELECT COUNT(*) FROM Producto
                   WHERE marca = 'Stanley');

SELECT cedula_ruc, nombre
FROM Cliente
WHERE cedula_ruc IN (SELECT cedula_cliente FROM Cotizacion
                     WHERE tipo_trabajo = 'GYPSUM')
   OR cedula_ruc IN (SELECT f.cedula_cliente
                     FROM Instalacion i
                     JOIN Factura f ON i.numero_factura = f.numero_factura
                     WHERE i.tipo_trabajo = 'GYPSUM');
