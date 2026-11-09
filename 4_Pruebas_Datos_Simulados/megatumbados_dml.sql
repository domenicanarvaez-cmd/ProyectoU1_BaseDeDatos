USE megatumbados;

INSERT INTO Producto (codigo, nombre, marca, precio_unitario, unidad_medida, stock) VALUES
('P001', 'Plancha de gypsum', 'PANEL REY', 11.50, 'unidad', 120),
('P002', 'Plancha PVC blanco', 'VEKA', 6.80, 'unidad', 200),
('P003', 'Tornillo de plancha 1"', 'Stanley', 4.25, 'funda', 100),
('P004', 'Espátula para masilla', 'Stanley', 3.90, 'unidad', 40),
('P005', 'Taladro', 'DeWALT', 150.75, 'unidad', 8);

INSERT INTO Proveedor (codigo, nombre) VALUES
('PR01', 'Distribuidora Ferretera del Sur'),
('PR02', 'SICON'),
('PR03', 'DeWALT'),
('PR04', 'STANLEY'),
('PR05', 'General');

INSERT INTO Producto_proveedor (codigo_proveedor, codigo_producto) VALUES
('PR01', 'P003'),
('PR02', 'P004'),
('PR05', 'P002'),
('PR02', 'P003'),
('PR01', 'P004');

INSERT INTO Cliente (cedula_ruc, nombre, telefono, direccion, correo) VALUES
('1104567890', 'Carlos Jaramillo', '0991234567', 'Av. Universitaria y Azuay', 'carlos.j@mail.com'),
('1105678901', 'María Ordóñez', '0987654321', 'Barrio Época, calle Lauro Guerrero', 'maria.o@mail.com'),
('1100987654001', 'Constructora Andina', '072570123', 'Av. Cuxibamba y Ambato', 'ventas@andina.com'),
('1103456789', 'Lucía Castillo', '0998765432', 'Calle Bolívar y Rocafuerte', 'lucia.c@mail.com'),
('1191234567001', 'Comercial El Valle', '072585456', 'Av. Salvador Bustamante Celi y Guayaquil', 'info@elvalle.com');

INSERT INTO Cotizacion (fecha, tipo_trabajo, metros, cedula_cliente) VALUES
('2026-09-15', 'GYPSUM', 100.00, '1104567890'),
('2026-09-22', 'PVC', 145.00, '1105678901'),
('2026-10-01', 'PVC', 60.00, '1100987654001'),
('2026-10-03', 'GYPSUM', 200.00, '1191234567001'),
('2026-10-10', 'PVC', 150.00, '1103456789');

INSERT INTO Producto_cotizacion (numero_cotizacion, codigo_producto, cantidad, precio_unitario) VALUES
(1, 'P001', 34, 11.50),
(1, 'P003', 10, 4.25),
(2, 'P002', 97, 6.80),
(2, 'P003', 6, 4.25),
(3, 'P002', 40, 6.80),
(4, 'P001', 68, 11.50),
(4, 'P003', 20, 4.25),
(4, 'P004', 4, 3.90),
(5, 'P002', 100, 6.80),
(5, 'P003', 6, 4.25);

INSERT INTO Factura (fecha, total, estado_entrega, cedula_cliente, numero_cotizacion) VALUES
('2026-09-18', 433.50, 'COMPLETA', '1104567890', 1),
('2026-09-25', 685.10, 'COMPLETA', '1105678901', 2),
('2026-10-06', 882.60, 'PENDIENTE', '1191234567001', 4),
('2026-10-14', 705.50, 'PENDIENTE', '1103456789', 5),
('2026-10-24', 623.00, 'COMPLETA', '1105678901', NULL),
('2026-10-28', 158.55, 'COMPLETA', '1104567890', NULL);

INSERT INTO Producto_factura (numero_factura, codigo_producto, cantidad, precio_unitario) VALUES
(1, 'P001', 34, 11.50),
(1, 'P003', 10, 4.25),
(2, 'P002', 97, 6.80),
(2, 'P003', 6, 4.25),
(3, 'P001', 68, 11.50),
(3, 'P003', 20, 4.25),
(3, 'P004', 4, 3.90),
(4, 'P002', 100, 6.80),
(4, 'P003', 6, 4.25),
(5, 'P001', 49, 11.50),
(5, 'P003', 14, 4.25),
(6, 'P005', 1, 150.75),
(6, 'P004', 2, 3.90);

INSERT INTO Instalacion (direccion, tipo_trabajo, metros, precio_metro, fecha_inicio, fecha_fin_estimada, fecha_fin_real, estado, fecha_pago, numero_factura) VALUES
('Av. Universitaria y Azuay', 'GYPSUM', 100.00, 12.00, '2026-09-22', '2026-09-29', '2026-09-30', 'TERMINADA', '2026-09-30', 1),
('Barrio Época, calle Lauro Guerrero', 'PVC', 145.00, 9.00, '2026-09-29', '2026-10-06', '2026-10-05', 'TERMINADA', '2026-10-05', 2),
('Av. Salvador Bustamante Celi y Guayaquil', 'GYPSUM', 200.00, 11.00, '2026-10-12', '2026-10-26', NULL, 'EN_CURSO', NULL, 3),
('Calle Bolívar y Rocafuerte', 'PVC', 150.00, 9.00, '2026-11-16', '2026-11-23', NULL, 'POR_INICIAR', NULL, 4),
('Barrio La Tebaida, calle Argentina', 'GYPSUM', 145.00, 12.00, '2026-10-27', '2026-11-05', '2026-11-06', 'TERMINADA', '2026-11-06', 5);
