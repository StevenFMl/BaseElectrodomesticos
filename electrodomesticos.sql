-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2023 a las 21:08:57
-- Versión del servidor: 10.4.24-MariaDB-log
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `electrodomesticos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabeceras`
--

CREATE TABLE `cabeceras` (
  `cod_cabecera` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cedula` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `subtotal` double NOT NULL,
  `iva` double NOT NULL,
  `total` double NOT NULL,
  `meses` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cabeceras`
--

INSERT INTO `cabeceras` (`cod_cabecera`, `cod_cliente`, `cedula`, `nombre`, `apellido`, `telefono`, `direccion`, `subtotal`, `iva`, `total`, `meses`, `created_at`, `updated_at`) VALUES
(64, 2, '12349753', 'Wendo', 'Rodrigez', '', '', 500, 60, 560, 0, '2023-03-24 11:00:29', '2023-03-24 11:00:29'),
(65, 3, '21312312312', 'Fernando', 'Aguirre', '', '', 655, 78.6, 733.6, 3, '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(66, 6, '1050356672', 'Enrique', 'AImara', '', '', 2100, 252, 2352, 0, '2023-03-24 15:02:16', '2023-03-24 15:02:16'),
(67, 6, '1050356672', 'Enrique', 'AImara', '', '', 2210, 265.2, 2475.2, 3, '2023-03-24 15:03:02', '2023-03-24 15:03:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `cedula`, `nombre`, `apellido`, `telefono`, `direccion`) VALUES
(1, '105036772', 'Steven', 'floress', 'asdasdasdsa', '4124123213'),
(2, '12349753', 'Wendo', 'Rodrigez', 'Chicago', '978977687'),
(3, '21312312312', 'Fernando', 'Aguirre', 'La floresta', '098879789'),
(4, '11111111', 'Raul', 'jj', 'asdasdasd', '123123123'),
(5, '1050356673', 'Luis', 'Hernan', 'El Olivo', '0987787676'),
(6, '1050356672', 'Enrique', 'AImara', 'EL Olivo', '0985004757');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desglose_credito`
--

CREATE TABLE `desglose_credito` (
  `cod_desglose_credito` int(11) NOT NULL,
  `cod_cabecera` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `valor_pago` double(10,2) NOT NULL,
  `estado_pago` enum('PENDIENTE','PAGADO') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `desglose_credito`
--

INSERT INTO `desglose_credito` (`cod_desglose_credito`, `cod_cabecera`, `fecha_pago`, `valor_pago`, `estado_pago`, `created_at`, `updated_at`) VALUES
(82, 65, '2023-04-24', 281.21, 'PAGADO', '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(83, 65, '2023-05-24', 281.21, 'PAGADO', '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(84, 65, '2023-06-24', 281.21, 'PAGADO', '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(85, 67, '2023-04-24', 948.83, 'PAGADO', '2023-03-24 15:03:02', '2023-03-24 15:03:02'),
(86, 67, '2023-05-24', 948.83, 'PAGADO', '2023-03-24 15:03:02', '2023-03-24 15:03:02'),
(87, 67, '2023-06-24', 948.83, 'PAGADO', '2023-03-24 15:03:02', '2023-03-24 15:03:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `cod_detalle` int(11) NOT NULL,
  `cod_cabecera` int(11) NOT NULL,
  `cod_producto` int(11) NOT NULL,
  `nomproducto` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`cod_detalle`, `cod_cabecera`, `cod_producto`, `nomproducto`, `cantidad`, `total`, `created_at`, `updated_at`) VALUES
(57, 64, 2, 'Tarjeta gtx 1660', 1, 200.00, '2023-03-24 11:00:29', '2023-03-24 11:00:29'),
(58, 64, 3, 'Refrigeradora ', 1, 300.00, '2023-03-24 11:00:29', '2023-03-24 11:00:29'),
(59, 65, 3, 'Refrigeradora ', 1, 300.00, '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(60, 65, 1, 'Ryzen 5 5600X', 1, 355.00, '2023-03-24 11:01:03', '2023-03-24 11:01:03'),
(61, 66, 3, 'Refrigeradora ', 2, 600.00, '2023-03-24 15:02:16', '2023-03-24 15:02:16'),
(62, 66, 4, 'Televisor Samsung', 3, 1500.00, '2023-03-24 15:02:16', '2023-03-24 15:02:16'),
(63, 67, 1, 'Ryzen 5 5600X', 2, 710.00, '2023-03-24 15:03:02', '2023-03-24 15:03:02'),
(64, 67, 4, 'Televisor Samsung', 3, 1500.00, '2023-03-24 15:03:02', '2023-03-24 15:03:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `cedulaf` varchar(20) NOT NULL,
  `nombref` varchar(50) NOT NULL,
  `apellidof` varchar(50) NOT NULL,
  `fechaf` datetime NOT NULL,
  `cantidadf` int(11) NOT NULL,
  `subtotalf` double NOT NULL,
  `ivaf` double NOT NULL,
  `totalf` double NOT NULL,
  `meses` int(11) NOT NULL,
  `valormesf` double NOT NULL,
  `totalinteres` double NOT NULL,
  `cod_clientes` int(11) NOT NULL,
  `cod_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cod_producto` int(11) NOT NULL,
  `nomproducto` varchar(40) NOT NULL,
  `caracteristicas` varchar(100) NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cod_producto`, `nomproducto`, `caracteristicas`, `precio`, `cantidad`) VALUES
(1, 'Ryzen 5 5600X', '12 hilos, 6 nucleos', 355, 76),
(2, 'Tarjeta gtx 1660', 'Tiene 6 Vram, 2 ventiladores', 200, 16),
(3, 'Refrigeradora ', 'Indurama, Motor pequeño', 300, 2),
(4, 'Televisor Samsung', '32 Pulgadas, 4K Full HD', 500, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL,
  `Detalle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRoles`, `Detalle`) VALUES
(1, 'Administrador'),
(2, 'bodegero'),
(3, 'caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsaurio` int(11) NOT NULL,
  `Nombres` text NOT NULL,
  `Apellidos` text NOT NULL,
  `contrasenia` text NOT NULL,
  `correo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsaurio`, `Nombres`, `Apellidos`, `contrasenia`, `correo`) VALUES
(1, 'admin', 'admin', '123', 'admin'),
(2, 'juan', 'martinez', '123', 'juan1@gmail.com'),
(3, 'Miguel', 'O\'hara', '2099', 'miguel@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `idUsuarios_Roles` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idRoles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`idUsuarios_Roles`, `idUsuario`, `idRoles`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  ADD PRIMARY KEY (`cod_cabecera`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `desglose_credito`
--
ALTER TABLE `desglose_credito`
  ADD PRIMARY KEY (`cod_desglose_credito`),
  ADD KEY `desglose_credito_FK` (`cod_cabecera`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`cod_detalle`),
  ADD KEY `detalles_FK` (`cod_cabecera`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`cod_factura`),
  ADD KEY `cod_clientes` (`cod_clientes`),
  ADD KEY `cod_productos` (`cod_productos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsaurio`);

--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD PRIMARY KEY (`idUsuarios_Roles`),
  ADD KEY `UR_Usuarios` (`idUsuario`),
  ADD KEY `UR?Roles` (`idRoles`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  MODIFY `cod_cabecera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `desglose_credito`
--
ALTER TABLE `desglose_credito`
  MODIFY `cod_desglose_credito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `cod_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `cod_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsaurio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  MODIFY `idUsuarios_Roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `desglose_credito`
--
ALTER TABLE `desglose_credito`
  ADD CONSTRAINT `desglose_credito_FK` FOREIGN KEY (`cod_cabecera`) REFERENCES `cabeceras` (`cod_cabecera`);

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_FK` FOREIGN KEY (`cod_cabecera`) REFERENCES `cabeceras` (`cod_cabecera`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_clientes` FOREIGN KEY (`cod_clientes`) REFERENCES `clientes` (`cod_cliente`),
  ADD CONSTRAINT `fk_factura_productos` FOREIGN KEY (`cod_productos`) REFERENCES `productos` (`cod_producto`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `UR?Roles` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`),
  ADD CONSTRAINT `UR_Usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsaurio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
