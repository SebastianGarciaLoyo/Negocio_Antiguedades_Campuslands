use negocio_antiguedades;

-- Listar todas las antigüedades disponibles para la venta

SELECT
    a.id_antiguedad,
    a.descripcion AS nombre_pieza,
    a.categoria,
    a.precio,
    a.estado_conservacion
FROM
    Antiguedades a
WHERE
    a.estatus = 'en venta';
    

-- Buscar antigüedades por categoría y rango de precio

SELECT
    id_antiguedad,
    descripcion AS nombre_pieza,
    categoria,
    precio
FROM
    Antiguedades
WHERE
    categoria = 'Muebles'
    AND precio BETWEEN 500 AND 2000;
    
-- Mostrar el historial de ventas de un cliente específico

SELECT
    a.descripcion AS nombre_pieza,
    t.fecha_transaccion,
    t.estado AS estado_transaccion,
    p.monto AS precio_venta,
    u.nombre AS comprador
FROM
    Transacciones t
JOIN
    Antiguedades a ON t.id_antiguedad = a.id_antiguedad
JOIN
    Usuarios u ON t.id_usuario_comprador = u.id_usuario
JOIN
    Pagos p ON t.id_transaccion = p.id_transaccion
WHERE
    a.id_usuario = 1  
    AND t.estado = 'completada';
    
-- Obtener el total de ventas realizadas en un periodo de tiempo

SELECT
    SUM(p.monto) AS total_ventas
FROM
    Transacciones t
JOIN
    Pagos p ON t.id_transaccion = p.id_transaccion
WHERE
    t.fecha_transaccion BETWEEN '2024-09-15' AND '2024-09-19';


-- Encontrar los clientes más activos (con más compras realizadas)

SELECT
    u.id_usuario,
    u.nombre,
    COUNT(t.id_transaccion) AS cantidad_compras
FROM
    Transacciones t
JOIN
    Usuarios u ON t.id_usuario_comprador = u.id_usuario
GROUP BY
    u.id_usuario, u.nombre
ORDER BY
    cantidad_compras DESC;
    
-- Listar las antigüedades más populares por número de visitas o consultas

SELECT
    a.id_antiguedad,
    a.descripcion AS nombre_pieza,
    COUNT(c.id_consulta) AS cantidad_consultas
FROM
    Consultas c
JOIN
    Antiguedades a ON c.id_antiguedad = a.id_antiguedad
GROUP BY
    a.id_antiguedad, a.descripcion
ORDER BY
    cantidad_consultas DESC;

-- Listar las antigüedades vendidas en un rango de fechas específico

SELECT
    a.id_antiguedad,
    a.descripcion AS nombre_pieza,
    t.fecha_transaccion,
    u.nombre AS vendedor,
    u_comprador.nombre AS comprador,
    p.monto AS precio_venta
FROM
    Transacciones t
JOIN
    Antiguedades a ON t.id_antiguedad = a.id_antiguedad
JOIN
    Usuarios u ON a.id_usuario = u.id_usuario
JOIN
    Usuarios u_comprador ON t.id_usuario_comprador = u_comprador.id_usuario
JOIN
    Pagos p ON t.id_transaccion = p.id_transaccion
WHERE
    t.fecha_transaccion BETWEEN '2024-08-01' AND '2024-08-31'  -- Reemplazar con el rango de fechas deseado
    AND t.estado = 'completada';

-- Obtener un informe de inventario actual

SELECT
    a.categoria,
    COUNT(i.id_antiguedad) AS cantidad_disponible
FROM
    Inventarios i
JOIN
    Antiguedades a ON i.id_antiguedad = a.id_antiguedad
GROUP BY
    a.categoria;








