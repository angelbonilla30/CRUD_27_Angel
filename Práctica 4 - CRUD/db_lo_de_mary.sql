-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 15:23:51
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_lo_de_mary`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `ID_NOMBRE` int(11) NOT NULL,
  `NOMBRE` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`ID_NOMBRE`, `NOMBRE`) VALUES
(1, 'FLORINDA MEZA'),
(2, 'MARLON CASTILLO'),
(3, 'EVA VELASQUEZ'),
(4, 'PEREZ SOSA'),
(5, 'OLIVIA MARADIAGA'),
(6, 'HENRY CASTAÑEDA'),
(7, 'LETICIA MENDEZ'),
(8, 'NAZARETH CALIX'),
(9, 'MARIA MEJIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `ID_EMPLEADOS` int(11) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `CONTRASEÑA` int(250) DEFAULT NULL,
  `ID_TIPO_USUARIO` int(11) NOT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` int(100) DEFAULT NULL,
  `RTN` int(200) DEFAULT NULL,
  `CUENTA_BANCARIA` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`ID_EMPLEADOS`, `USUARIO`, `CONTRASEÑA`, `ID_TIPO_USUARIO`, `DIRECCION`, `TELEFONO`, `RTN`, `CUENTA_BANCARIA`) VALUES
(2, 'GLORIA CRUZ', 1234, 1, 'COL. LOMAS DEL RIO', 32677281, 8765, 171882922),
(3, 'MARIA LANTE', 2022, 2, 'BO. ARRIBA', 32677281, 8765, 8819328),
(4, 'EDWIN HERNANDEZ', 2345, 1, 'MONTE VERDE ', 32677281, 8765, 8819328),
(5, 'ALMA QUEBEDO', 7896, 1, 'VILLA UNIVERSITARIA', 87947392, 9378, 78289323),
(6, 'MILAGRO MEJIA', 3456, 2, 'COL. 21 MAYO', 27724206, 6785, 618393933),
(7, 'ANNIE CRUZ', 8903, 2, 'COL. 15 SEPTIEMBRE', 32677281, 8765, 8819328);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perdidos`
--

CREATE TABLE `tbl_perdidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `ID_NOMBRE` int(11) NOT NULL,
  `PEDIDO` int(50) DEFAULT NULL,
  `DIRRECCION` varchar(100) DEFAULT NULL,
  `ID_TELEFONO` int(11) NOT NULL,
  `FORMA_PAGO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_perdidos`
--

INSERT INTO `tbl_perdidos` (`ID_PEDIDO`, `ID_NOMBRE`, `PEDIDO`, `DIRRECCION`, `ID_TELEFONO`, `FORMA_PAGO`) VALUES
(1, 2, 3, 'Barrio Lourdes', 2, 'Efectivo'),
(2, 6, 22, 'Barrio Lourdes', 2, 'Efectivo'),
(3, 3, 13, 'COL. VILLA NUEVA', 3, 'EFECTIVO'),
(4, 1, 10, 'COL. LOMAS DEL RIO', 2, 'TARJETA'),
(5, 6, 14, 'BO. LOURDES', 3, 'EFECTIVO'),
(6, 8, 21, 'BO. 21 MAYO', 7, 'TARJETA'),
(7, 2, 13, 'BO. ARRIBA', 2, 'EFECTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_telefono`
--

CREATE TABLE `tbl_telefono` (
  `ID_TELEFONO` int(11) NOT NULL,
  `TELEFONO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_telefono`
--

INSERT INTO `tbl_telefono` (`ID_TELEFONO`, `TELEFONO`) VALUES
(1, 27725588),
(2, 27725588),
(3, 27723804),
(4, 32344647),
(5, 2345671),
(6, 32898988),
(7, 87947392),
(8, 87879404);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_usuario`
--

CREATE TABLE `tbl_tipo_usuario` (
  `ID_TIPO_USUARIO` int(11) NOT NULL,
  `TIPO_USUARIO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_tipo_usuario`
--

INSERT INTO `tbl_tipo_usuario` (`ID_TIPO_USUARIO`, `TIPO_USUARIO`) VALUES
(1, 'STAFF'),
(2, 'GERENTE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`ID_NOMBRE`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`ID_EMPLEADOS`),
  ADD KEY `tbl_empleados_ibfk_1` (`ID_TIPO_USUARIO`);

--
-- Indices de la tabla `tbl_perdidos`
--
ALTER TABLE `tbl_perdidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_NOMBRE` (`ID_NOMBRE`),
  ADD KEY `FK_TELEFONO` (`ID_TELEFONO`);

--
-- Indices de la tabla `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  ADD PRIMARY KEY (`ID_TELEFONO`);

--
-- Indices de la tabla `tbl_tipo_usuario`
--
ALTER TABLE `tbl_tipo_usuario`
  ADD PRIMARY KEY (`ID_TIPO_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `ID_NOMBRE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  MODIFY `ID_EMPLEADOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_perdidos`
--
ALTER TABLE `tbl_perdidos`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_telefono`
--
ALTER TABLE `tbl_telefono`
  MODIFY `ID_TELEFONO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_usuario`
--
ALTER TABLE `tbl_tipo_usuario`
  MODIFY `ID_TIPO_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD CONSTRAINT `tbl_empleados_ibfk_1` FOREIGN KEY (`ID_TIPO_USUARIO`) REFERENCES `tbl_tipo_usuario` (`ID_TIPO_USUARIO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_perdidos`
--
ALTER TABLE `tbl_perdidos`
  ADD CONSTRAINT `tbl_perdidos_ibfk_1` FOREIGN KEY (`ID_NOMBRE`) REFERENCES `tbl_clientes` (`ID_NOMBRE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_perdidos_ibfk_2` FOREIGN KEY (`ID_TELEFONO`) REFERENCES `tbl_telefono` (`ID_TELEFONO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
