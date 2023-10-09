-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2023 a las 13:59:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica_kodigo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bootcamp`
--

CREATE TABLE `bootcamp` (
  `id` int(11) NOT NULL,
  `bootcamp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bootcamp`
--

INSERT INTO `bootcamp` (`id`, `bootcamp`) VALUES
(1, 'Full Stack Junior 18'),
(2, 'Full Stack Junior 19'),
(3, 'Java Developer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coach`
--

CREATE TABLE `coach` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coach`
--

INSERT INTO `coach` (`id`, `nombre`, `apellido`, `telefono`, `correo`, `password`, `id_materia`, `id_estado`) VALUES
(1, 'Oscar Alexander', 'Lemus', 60657856, 'oscar@kodigo.org', '1234', 1, 1),
(2, 'Maria Andree', 'Vasquez', 78654123, 'maria@kodigo.org', '1234', 2, 1),
(3, 'prueba', 'test', 0, 'test@test', '1234', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_bootcamp_coach`
--

CREATE TABLE `detalle_bootcamp_coach` (
  `id_bootcamp` int(11) NOT NULL,
  `id_coach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_estudiante_materia`
--

CREATE TABLE `detalle_estudiante_materia` (
  `id_estudiante` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_estudiante_materia`
--

INSERT INTO `detalle_estudiante_materia` (`id_estudiante`, `id_materia`) VALUES
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
(1, 'activo'),
(2, 'reubicado'),
(3, 'desercion'),
(4, 'inactivo'),
(5, 'egresado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` text NOT NULL,
  `carnet` varchar(10) NOT NULL,
  `id_bootcamp` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `direccion`, `carnet`, `id_bootcamp`, `id_estado`) VALUES
(1, 'Juan Alberto Pineda', 'antiguo cuscatlan', 'JA2023', 2, 1),
(2, 'Karla Imelda Flores', 'Tejutla, Chalatenango', 'KI202301', 1, 1),
(3, 'Diego Hernandez Solis', 'Santa Ana', 'DH2023', 3, 1),
(4, 'Jonathan Alexander Mena', 'La Libertad', 'JA20234', 0, 1),
(5, 'Jonathan Alexander Mena', 'La Libertad', 'JA20234', 0, 1),
(6, 'prueba', 'direccion1', 'JA20234', 0, 1),
(7, 'Jonathan Alexander Mena', 'La Libertad', 'FS202301', 1, 1),
(8, 'prueba2', 'Direccion2', 'FS19202303', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`) VALUES
(1, 'Programacion'),
(2, 'Socioemocionales'),
(3, 'Ingles');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bootcamp`
--
ALTER TABLE `bootcamp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_materia` (`id_materia`),
  ADD KEY `fk_id_estado` (`id_estado`);

--
-- Indices de la tabla `detalle_bootcamp_coach`
--
ALTER TABLE `detalle_bootcamp_coach`
  ADD KEY `fk_id_bootcamp` (`id_bootcamp`),
  ADD KEY `fk_id_coach` (`id_coach`);

--
-- Indices de la tabla `detalle_estudiante_materia`
--
ALTER TABLE `detalle_estudiante_materia`
  ADD KEY `fk_id_estudiante` (`id_estudiante`),
  ADD KEY `fk_id_materia` (`id_materia`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_bootcamp` (`id_bootcamp`),
  ADD KEY `fk_id_estado` (`id_estado`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bootcamp`
--
ALTER TABLE `bootcamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `coach`
--
ALTER TABLE `coach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
