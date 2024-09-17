-- Crear la base de datos
DROP DATABASE IF EXISTS negocio_antiguedades;
CREATE DATABASE IF NOT EXISTS negocio_antiguedades;
USE negocio_antiguedades;

CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100) UNIQUE,
    contraseña VARCHAR(255),
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

CREATE TABLE Antiguedades (
    id_antiguedad INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fotos TEXT,
    categoria VARCHAR(100),
    epoca VARCHAR(100),
    estado_conservacion VARCHAR(100),
    precio DECIMAL(10,2),
    estatus ENUM('en venta', 'vendido', 'retirado'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_antiguedad INT,
    id_usuario INT,
    fecha_consulta DATETIME,
    FOREIGN KEY (id_antiguedad) REFERENCES Antiguedades(id_antiguedad),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario_comprador INT,
    id_antiguedad INT,
    fecha_transaccion DATETIME,
    estado ENUM('completada', 'en proceso'),
    FOREIGN KEY (id_usuario_comprador) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_antiguedad) REFERENCES Antiguedades(id_antiguedad)
);

CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_transaccion INT,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(100),
    fecha_pago DATETIME,
    estado_pago ENUM('completado', 'pendiente', 'fallido'),
    FOREIGN KEY (id_transaccion) REFERENCES Transacciones(id_transaccion)
);

CREATE TABLE Inventarios (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_antiguedad INT,
    cantidad_disponible INT,
    FOREIGN KEY (id_antiguedad) REFERENCES Antiguedades(id_antiguedad)
);

CREATE TABLE Historial_Actividades (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    descripcion TEXT,
    fecha_actividad DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);


