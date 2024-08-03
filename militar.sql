-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2024 a las 00:52:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `militar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `Num_compañia` int(5) NOT NULL,
  `Acto_compañia` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `Id_cuarteles` int(5) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `ubicacion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel_compañia`
--

CREATE TABLE `cuartel_compañia` (
  `Id_cuarteles1` int(10) DEFAULT NULL,
  `Num_compañia1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos_del_ejercito`
--

CREATE TABLE `cuerpos_del_ejercito` (
  `Id_cuerpo` int(5) NOT NULL,
  `Denominacion` varchar(10) DEFAULT NULL,
  `Id_soldado5` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `Fecha_grado` int(10) NOT NULL,
  `Tipo_grado` varchar(10) DEFAULT NULL,
  `Nombre_grado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `cod_servicio` int(5) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `Id_soldado` int(5) NOT NULL,
  `Primer_nombre` varchar(10) DEFAULT NULL,
  `Segundo_nombre` varchar(10) DEFAULT NULL,
  `Primer_apellido` varchar(10) DEFAULT NULL,
  `Segundo_apellido` varchar(10) DEFAULT NULL,
  `Num_compañia5` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado_grado`
--

CREATE TABLE `soldado_grado` (
  `Id_soldado3` int(5) NOT NULL,
  `Fecha_grado3` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado_servicio`
--

CREATE TABLE `soldado_servicio` (
  `Id_soldado1` int(5) DEFAULT NULL,
  `cod__servicio` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`Num_compañia`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`Id_cuarteles`);

--
-- Indices de la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD KEY `fk_idsiete` (`Id_cuarteles1`),
  ADD KEY `fk_idocho` (`Num_compañia1`);

--
-- Indices de la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  ADD PRIMARY KEY (`Id_cuerpo`),
  ADD KEY `fk_idcinco` (`Id_soldado5`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`Fecha_grado`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`cod_servicio`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`Id_soldado`),
  ADD KEY `fk_idseis` (`Num_compañia5`);

--
-- Indices de la tabla `soldado_grado`
--
ALTER TABLE `soldado_grado`
  ADD PRIMARY KEY (`Id_soldado3`),
  ADD KEY `fk_iddos` (`Fecha_grado3`);

--
-- Indices de la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD KEY `fk_idtres` (`Id_soldado1`),
  ADD KEY `fk_idcuatro` (`cod__servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañias`
--
ALTER TABLE `compañias`
  MODIFY `Num_compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `Id_cuarteles` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  MODIFY `Id_cuerpo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `cod_servicio` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `Id_soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD CONSTRAINT `fk_idocho` FOREIGN KEY (`Num_compañia1`) REFERENCES `compañias` (`Num_compañia`),
  ADD CONSTRAINT `fk_idsiete` FOREIGN KEY (`Id_cuarteles1`) REFERENCES `cuarteles` (`Id_cuarteles`);

--
-- Filtros para la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  ADD CONSTRAINT `fk_idcinco` FOREIGN KEY (`Id_soldado5`) REFERENCES `soldado` (`Id_soldado`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_idseis` FOREIGN KEY (`Num_compañia5`) REFERENCES `compañias` (`Num_compañia`);

--
-- Filtros para la tabla `soldado_grado`
--
ALTER TABLE `soldado_grado`
  ADD CONSTRAINT `fk_iddos` FOREIGN KEY (`Fecha_grado3`) REFERENCES `grados` (`Fecha_grado`),
  ADD CONSTRAINT `fk_iduno` FOREIGN KEY (`Id_soldado3`) REFERENCES `soldado` (`Id_soldado`);

--
-- Filtros para la tabla `soldado_servicio`
--
ALTER TABLE `soldado_servicio`
  ADD CONSTRAINT `fk_idcuatro` FOREIGN KEY (`cod__servicio`) REFERENCES `servicios` (`cod_servicio`),
  ADD CONSTRAINT `fk_idtres` FOREIGN KEY (`Id_soldado1`) REFERENCES `soldado` (`Id_soldado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
