use negocio_antiguedades;

-- Roles
INSERT INTO Roles (nombre) VALUES ('Administrador');
INSERT INTO Roles (nombre) VALUES ('Vendedor');
INSERT INTO Roles (nombre) VALUES ('Comprador');
INSERT INTO Roles (nombre) VALUES ('Moderador');
INSERT INTO Roles (nombre) VALUES ('Visor');


-- Usuarios
INSERT INTO Usuarios (nombre, correo_electronico, contraseña, id_rol) VALUES ('Juan Pérez', 'juan.perez@example.com', 'password123', 2);
INSERT INTO Usuarios (nombre, correo_electronico, contraseña, id_rol) VALUES ('Ana Gómez', 'ana.gomez@example.com', 'password456', 3);
INSERT INTO Usuarios (nombre, correo_electronico, contraseña, id_rol) VALUES ('Carlos Martínez', 'carlos.martinez@example.com', 'password789', 1);
INSERT INTO Usuarios (nombre, correo_electronico, contraseña, id_rol) VALUES ('Laura Fernández', 'laura.fernandez@example.com', 'password101', 2);
INSERT INTO Usuarios (nombre, correo_electronico, contraseña, id_rol) VALUES ('Pedro López', 'pedro.lopez@example.com', 'password202', 3);

-- Antiguedades
INSERT INTO Antiguedades (descripcion, fotos, categoria, epoca, estado_conservacion, precio, estatus, id_usuario) VALUES 
('Cuadro antiguo de paisaje', 'foto1.jpg', 'Pinturas', 'Siglo XIX', 'Bueno', 1500.00, 'en venta', 1),
('Reloj de bolsillo', 'foto2.jpg', 'Relojes', 'Siglo XVIII', 'Excelente', 800.00, 'en venta', 2),
('Mesa de comedor victoriana', 'foto3.jpg', 'Muebles', 'Siglo XIX', 'Regular', 1200.00, 'en venta', 3),
('Jarrón chino de porcelana', 'foto4.jpg', 'Cerámica', 'Dinastía Qing', 'Bueno', 2000.00, 'en venta', 1),
('Antiguo mapa de navegación', 'foto5.jpg', 'Cartografía', 'Siglo XVII', 'Excelente', 1000.00, 'en venta', 2);

INSERT INTO Consultas (id_antiguedad, id_usuario, fecha_consulta) VALUES 
(1, 1, '2024-09-10 09:00:00'),
(1, 2, '2024-09-11 10:00:00'),
(2, 1, '2024-09-12 11:00:00'),
(2, 3, '2024-09-13 12:00:00'),
(3, 2, '2024-09-14 13:00:00'),
(3, 3, '2024-09-15 14:00:00'),
(4, 1, '2024-09-16 15:00:00'),
(4, 2, '2024-09-17 16:00:00'),
(5, 3, '2024-09-18 17:00:00'),
(5, 1, '2024-09-19 18:00:00');


-- Transacciones
INSERT INTO Transacciones (id_usuario_comprador, id_antiguedad, fecha_transaccion, estado) VALUES 
(2, 1, '2024-09-15 10:00:00', 'completada'),
(3, 2, '2024-09-16 12:00:00', 'en proceso'),
(1, 3, '2024-09-17 14:00:00', 'completada'),
(2, 4, '2024-09-18 16:00:00', 'completada'),
(3, 5, '2024-09-19 18:00:00', 'en proceso');

-- Pagos
INSERT INTO Pagos (id_transaccion, monto, metodo_pago, fecha_pago, estado_pago) VALUES 
(1, 1500.00, 'Tarjeta de Crédito', '2024-09-15 10:30:00', 'completado'),
(2, 800.00, 'Transferencia Bancaria', '2024-09-16 12:30:00', 'pendiente'),
(3, 1200.00, 'Efectivo', '2024-09-17 14:30:00', 'completado'),
(4, 2000.00, 'Tarjeta de Crédito', '2024-09-18 16:30:00', 'completado'),
(5, 1000.00, 'PayPal', '2024-09-19 18:30:00', 'pendiente');

-- Inventarios
INSERT INTO Inventarios (id_antiguedad, cantidad_disponible) VALUES 
(1, 5),
(2, 2),
(3, 4),
(4, 1),
(5, 3);

-- Historial_Actividades
INSERT INTO Historial_Actividades (id_usuario, descripcion, fecha_actividad) VALUES 
(1, 'Listó el cuadro antiguo de paisaje', '2024-09-14 09:00:00'),
(2, 'Compró el reloj de bolsillo', '2024-09-16 11:00:00'),
(3, 'Actualizó el estado de la mesa de comedor', '2024-09-17 13:00:00'),
(1, 'Listó el jarrón chino de porcelana', '2024-09-18 15:00:00'),
(2, 'Hizo una oferta por el mapa de navegación', '2024-09-19 17:00:00');

