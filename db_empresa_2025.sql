SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

/* --------------------------------------------------------
   Tabla: asesor
-------------------------------------------------------- */
DROP TABLE IF EXISTS `asesor`;
CREATE TABLE `asesor` (
  `idf_cliente` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idf_empleado` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `asesor` (`idf_cliente`, `idf_empleado`) VALUES
('12345', '10101'),
('00128', '45565'),
('1131', '45565'),
('76543', '45565');

/* --------------------------------------------------------
   Tabla: categorias
   (Estas categorías corresponden a los productos de la tienda)
-------------------------------------------------------- */
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `nombre_categoria` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_sucursal` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `presupuesto` DECIMAL(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categorias` (`nombre_categoria`, `nombre_sucursal`, `presupuesto`) VALUES
('Alimentación Premium', 'Centro Nutricional Canino', 35000000.00),
('Salud y Cuidado', 'Clínica de Salud Animal', 30000000.00),
('Entretenimiento', 'Tienda de Juguetes Mascotas', 25000000.00),
('Moda y Accesorios', 'Boutique Animal', 20000000.00),
('Confort y Alojamiento', 'Hogar Animal', 40000000.00);

/* --------------------------------------------------------
   Tabla: clientes
   (Los clientes se relacionan con los intereses de compra en la tienda.
    Se asignan categorías según:
      - Polos      -> Alimentación Premium
      - Pantalones -> Entretenimiento
      - Vestidos   -> Confort y Alojamiento
      - Camisetas  -> Salud y Cuidado
      - Accesorios -> Moda y Accesorios
      - Camisas    -> Alimentación Premium)
-------------------------------------------------------- */
-- Se conserva la tabla para no perder datos previos.
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_cliente` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_categoria` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` VARCHAR(12) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Datos de ejemplo con las nuevas categorías de productos:
INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `nombre_categoria`, `estado`) VALUES
('00128', 'Sarai Fuentes Pertuz', 'Alimentación Premium', 'Activo'),
('1131', 'Pablo Velez Altamiranda', 'Entretenimiento', 'Activo'),
('12345', 'Maria Paula', 'Confort y Alojamiento', 'Activo'),
('19991', 'Sofia Beleño Castro', 'Entretenimiento', 'Activo'),
('2468', 'Juan Jaramillo', 'Salud y Cuidado', 'Activo'),
('54321', 'William Alvarez Quiroz', 'Salud y Cuidado', 'Activo'),
('55739', 'Sarah Sanchez Voz', 'Confort y Alojamiento', 'Activo'),
('64567', 'Pedro Suarez', 'Moda y Accesorios', 'Activo'),
('76543', 'Ana Maria Del Mar Rios', 'Alimentación Premium', 'Activo');

/* --------------------------------------------------------
   Tabla: empleados
   (En esta tabla, el campo "nombre_categoria" se usará para almacenar
    el rol o función del cuidador, diferenciándola de las categorías de la tienda)
-------------------------------------------------------- */
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `id_empleado` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_empleado` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_categoria` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,  -- Rol del cuidador
  `salario` DECIMAL(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `nombre_categoria`, `salario`) VALUES
('10101', 'Avelina Alfaro', 'Asesora Nutricional', 3500000.00),
('1102798', 'Carlos Alfaro', 'Coordinador de Confort', 2780000.00),
('12121', 'Winner Acosta Lastre', 'Coordinador de Confort', 2900000.00),
('15151', 'Maria Castro Feria', 'Asesora Nutricional', 4500000.00),
('18181', 'Amanda Sevilla Lara', 'Especialista en Salud Animal', 3500000.00),
('22222', 'Elizabeth Perez Alviz', 'Especialista en Salud Animal', 4950000.00),
('32343', 'Camila Villegas Oslo', 'Asesora de Bienestar', 4600000.00),
('45565', 'Katty Saenz Moron', 'Asesora de Bienestar', 3750000.00),
('58583', 'Carmen Alma Vega', 'Asesora de Bienestar', 5620000.00),
('76766', 'Ramiro Rojas PErez', 'Asesor de Entrenamiento', 3720000.00),
('83821', 'Brenda Osorio Bertel', 'Asesora de Entrenamiento', 3920000.00),
('98345', 'Amir Salas Martinez', 'Experto en Accesorios', 3800000.00);

/* --------------------------------------------------------
   Tabla: lineaproductos
-------------------------------------------------------- */
DROP TABLE IF EXISTS `lineaproductos`;
CREATE TABLE `lineaproductos` (
  `id_producto` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` VARCHAR(8) COLLATE utf8mb4_general_ci NOT NULL,
  `forma_pago` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coleccion` DECIMAL(4,0) NOT NULL,
  `nombre_sucursal` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_sala` VARCHAR(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_seccionhe` VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/* --------------------------------------------------------
   Tabla: pedidos
-------------------------------------------------------- */
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id_cliente` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_producto` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` VARCHAR(8) COLLATE utf8mb4_general_ci NOT NULL,
  `forma_pago` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coleccion` DECIMAL(4,0) NOT NULL,
  `estado_pedido` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/* --------------------------------------------------------
   Tabla: productos
   (Se asignan categorías de productos de la tienda de acuerdo a las nuevas
    definiciones: "Alimentación Premium", "Salud y Cuidado", "Entretenimiento",
    "Moda y Accesorios" y "Confort y Alojamiento")
-------------------------------------------------------- */
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre_categoria` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `precio` DECIMAL(50,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `productos` (`id_producto`, `descripcion`, `nombre_categoria`, `precio`) VALUES
('A-2453', 'Juguete interactivo para perro', 'Entretenimiento', 50000),
('C-A033A', 'Medicamento antipulgas para mascota', 'Salud y Cuidado', 70000),
('C-A425AT', 'Alimento natural para mascota', 'Alimentación Premium', 100000),
('CA425AT', 'Alimento natural para mascota', 'Alimentación Premium', 110000),
('LE-580', 'Juguete interactivo para perro', 'Entretenimiento', 50000),
('LE044AT', 'Medicamento antipulgas para mascota', 'Salud y Cuidado', 70000),
('M-104596', 'Cama de lujo para mascota', 'Confort y Alojamiento', 120000),
('M-4465', 'Juguete interactivo para perro', 'Entretenimiento', 50000),
('M-P700A', 'Arnés reflectante para mascota', 'Moda y Accesorios', 30000),
('M-P700AB', 'Juguete interactivo para perro', 'Entretenimiento', 50000),
('MP700AT', 'Medicamento antipulgas para mascota', 'Salud y Cuidado', 70000),
('R-106601', 'Cama de lujo para mascota', 'Confort y Alojamiento', 120000),
('U-N070AB', 'Juguete interactivo para perro', 'Entretenimiento', 50000),
('V-E016A', 'Juguete interactivo para perro', 'Entretenimiento', 50000);

/* --------------------------------------------------------
   Tabla: proveedores
-------------------------------------------------------- */
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id_producto` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_proveedor` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/* --------------------------------------------------------
   Tabla: seccionhe
-------------------------------------------------------- */
DROP TABLE IF EXISTS `seccionhe`;
CREATE TABLE `seccionhe` (
  `id_seccionhe` VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dia` VARCHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inicio_he` TIME NOT NULL,
  `fin_he` TIME DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `seccionhe` (`id_seccionhe`, `dia`, `inicio_he`, `fin_he`) VALUES
('A', 'F', '08:00:00', '08:50:00'),
('A', 'M', '08:00:00', '08:50:00'),
('A', 'W', '08:00:00', '08:50:00'),
('B', 'F', '09:00:00', '09:50:00'),
('B', 'M', '09:00:00', '09:50:00'),
('B', 'W', '09:00:00', '09:50:00'),
('C', 'F', '11:00:00', '11:50:00'),
('C', 'M', '11:00:00', '11:50:00'),
('C', 'W', '11:00:00', '11:50:00'),
('D', 'F', '13:00:00', '13:50:00'),
('D', 'M', '13:00:00', '13:50:00'),
('D', 'W', '13:00:00', '13:50:00'),
('E', 'R', '10:30:00', '11:45:00'),
('E', 'T', '10:30:00', '11:45:00'),
('F', 'R', '14:30:00', '15:45:00'),
('F', 'T', '14:30:00', '15:45:00'),
('G', 'F', '16:00:00', '16:50:00'),
('G', 'M', '16:00:00', '16:50:00'),
('G', 'W', '16:00:00', '16:50:00'),
('H', 'W', '10:00:00', '12:30:00');

/* --------------------------------------------------------
   Tabla: veterinarias
   (Se amplía la oferta con tres registros de clínicas con especialidades distintas)
-------------------------------------------------------- */
DROP TABLE IF EXISTS `veterinarias`;
CREATE TABLE `veterinarias` (
  `nombre_veterinaria` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numero_sala` VARCHAR(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `capacidad` DECIMAL(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `veterinarias` (`nombre_veterinaria`, `numero_sala`, `capacidad`) VALUES
('Clínica Veterinaria Integral', '1', 120),
('Centro Veterinario Animal Plus', '2', 150),
('Hospital Veterinario Sincelejo', '3', 200);

/* --------------------------------------------------------
   Tabla: usuarios
-------------------------------------------------------- */
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` INT NOT NULL,
  `email` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` VARCHAR(10) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `email`, `password`, `rol`) VALUES
(3, 'root@gmail.com', 'root', 'admin'),
(4, '12345', '12345', 'clientes'),
(6, '19991', '19991', 'clientes'),
(7, '23121', '23121', 'clientes'),
(8, '44553', '44553', 'clientes'),
(9, '45678', '45678', 'clientes'),
(10, '54321', '54321', 'clientes'),
(11, '55739', '55739', 'clientes'),
(13, '76543', '76543', 'clientes'),
(14, '76653', '76653', 'clientes'),
(15, '98765', '98765', 'clientes'),
(16, '98988', '98988', 'clientes'),
(17, '1131', '1131', 'clientes'),
(21, 'dev@gmail.com', '7777', 'admin'),
(22, 'admin@gmail.com', 'admin', 'admin'),
(24, '64567', '64567', 'clientes'),
(26, '2468', '2468', 'clientes');

/* --------------------------------------------------------
   Tabla: ventas
-------------------------------------------------------- */
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id_venta` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_producto` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sec_id` VARCHAR(8) COLLATE utf8mb4_general_ci NOT NULL,
  `forma_pago` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coleccion` DECIMAL(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/* --------------------------------------------------------
   Índices y claves foráneas
-------------------------------------------------------- */

/* Índices de la tabla `asesor` */
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`idf_cliente`),
  ADD KEY `idf_empleado` (`idf_empleado`);

/* Índices de la tabla `categorias` */
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`nombre_categoria`);

/* Índices de la tabla `clientes` */
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `nombre_categoria` (`nombre_categoria`) USING BTREE;

/* Índices de la tabla `empleados`
   (No se añade clave foránea en "nombre_categoria" para permitir roles distintos)
*/
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

/* Índices de la tabla `lineaproductos` */
ALTER TABLE `lineaproductos`
  ADD PRIMARY KEY (`id_producto`,`sec_id`,`forma_pago`,`coleccion`),
  ADD KEY `nombre_sucursal` (`nombre_sucursal`,`numero_sala`);

/* Índices de la tabla `pedidos` */
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_cliente`,`id_producto`,`sec_id`,`forma_pago`,`coleccion`),
  ADD KEY `id_producto` (`id_producto`,`sec_id`,`forma_pago`,`coleccion`) USING BTREE;

/* Índices de la tabla `productos` */
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `nombre_categoria` (`nombre_categoria`);

/* Índices de la tabla `proveedores` */
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_producto`,`id_proveedor`),
  ADD KEY `prereq_id` (`id_proveedor`);

/* Índices de la tabla `seccionhe` */
ALTER TABLE `seccionhe`
  ADD PRIMARY KEY (`id_seccionhe`,`dia`,`inicio_he`);

/* Índices de la tabla `veterinarias` */
ALTER TABLE `veterinarias`
  ADD PRIMARY KEY (`nombre_veterinaria`,`numero_sala`);

/* Índices de la tabla `usuarios` */
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

/* Índices de la tabla `ventas` */
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`,`id_producto`,`sec_id`,`forma_pago`,`coleccion`),
  ADD KEY `id_producto` (`id_producto`,`sec_id`,`forma_pago`,`coleccion`) USING BTREE;

/* --------------------------------------------------------
   AUTO_INCREMENT de la tabla `usuarios`
-------------------------------------------------------- */
ALTER TABLE `usuarios`
  MODIFY `id` INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

/* --------------------------------------------------------
   Restricciones (claves foráneas)
-------------------------------------------------------- */

/* Para la tabla `asesor` */
ALTER TABLE `asesor`
  ADD CONSTRAINT `asesor_ibfk_1` FOREIGN KEY (`idf_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE SET NULL,
  ADD CONSTRAINT `asesor_ibfk_2` FOREIGN KEY (`idf_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;

/* Para la tabla `clientes` */
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`nombre_categoria`) REFERENCES `categorias` (`nombre_categoria`) ON DELETE SET NULL;

/* Para la tabla `lineaproductos` */
ALTER TABLE `lineaproductos`
  ADD CONSTRAINT `lineaproductos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `lineaproductos_ibfk_2` FOREIGN KEY (`nombre_sucursal`,`numero_sala`) REFERENCES `veterinarias` (`nombre_veterinaria`, `numero_sala`) ON DELETE SET NULL;

/* Para la tabla `pedidos` */
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_producto`,`sec_id`,`forma_pago`,`coleccion`) REFERENCES `lineaproductos` (`id_producto`, `sec_id`, `forma_pago`, `coleccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;

/* Para la tabla `productos` */
ALTER TABLE `productos`
  ADD CONSTRAINT `dept_name` FOREIGN KEY (`nombre_categoria`) REFERENCES `categorias` (`nombre_categoria`) ON DELETE SET NULL;

/* Para la tabla `proveedores` */
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `productos` (`id_producto`);

/* Para la tabla `ventas` */
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`,`sec_id`,`forma_pago`,`coleccion`) REFERENCES `lineaproductos` (`id_producto`, `sec_id`, `forma_pago`, `coleccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
