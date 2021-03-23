-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2021 a las 01:50:05
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `demo1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `IdBitacora` int(9) NOT NULL,
  `FechaHora` datetime NOT NULL,
  `Nauseas` int(1) NOT NULL,
  `Vomitos` int(1) NOT NULL,
  `Diarrea` int(1) NOT NULL,
  `Constipacion` int(1) NOT NULL,
  `Dolor` int(1) NOT NULL,
  `Fatiga` int(1) NOT NULL,
  `PerdidaApetito` int(1) NOT NULL,
  `Fiebre` double(3,1) NOT NULL,
  `SintomasResfrio` int(1) NOT NULL,
  `SintomasUnitarios` int(1) NOT NULL,
  `ValorICG` int(1) NOT NULL,
  `IdPaciente` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrooncologico`
--

CREATE TABLE `centrooncologico` (
  `IdCentroOncologico` int(9) NOT NULL,
  `Direccion` text NOT NULL,
  `telefono` int(9) NOT NULL,
  `Correo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centrooncologico`
--

INSERT INTO `centrooncologico` (`IdCentroOncologico`, `Direccion`, `telefono`, `Correo`) VALUES
(123, 'Calle prueba 123', 41231234, 'centroonco@correo.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `IdEquipo` int(9) NOT NULL,
  `IdEspecialista` int(9) NOT NULL,
  `IdAsistente` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`IdEquipo`, `IdEspecialista`, `IdAsistente`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `IdNotificacion` int(9) NOT NULL,
  `TipoNotificacion` int(1) NOT NULL,
  `FechaNotificacion` datetime NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Remitente` varchar(20) NOT NULL,
  `Mensaje` text NOT NULL,
  `IdPaciente` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `IdPaciente` int(9) NOT NULL,
  `Rut` text NOT NULL,
  `Correo` text NOT NULL,
  `Clave` text NOT NULL,
  `PrimerNombre` text NOT NULL,
  `SegundoNombre` text NOT NULL,
  `PrimerApellido` text NOT NULL,
  `SegundoApellido` text NOT NULL,
  `FechaN` datetime NOT NULL,
  `Telefono` int(9) NOT NULL,
  `Direccion` text NOT NULL,
  `token` varchar(170) NOT NULL,
  `IdMedico` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`IdPaciente`, `Rut`, `Correo`, `Clave`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `FechaN`, `Telefono`, `Direccion`, `token`, `IdMedico`) VALUES
(112, '199287915', 'sebacartes35@gmail.com', '222223', 'Sebastian', 'Daniel', 'Cartes', 'Rosales', '1998-03-15 00:00:00', 964388670, 'Casa Sebastian 1212', 'f4_DAiwRTtCDS9aJIEYtev:APA91bGu-NY0knJ9UP3rbV0rpH7SukKTfoi_q-psFGnyIC12pH0TT-2LeBEamEbF7FLBEC9ZrEQYX0EC34VvAsYrfBrMcfvA-UMB2NTkWX-U35o9EQIrvRBWG6IEcQx27xubbOjwtvp1', 1),
(114, '20775966k', 'isidora.vargas@gmail.com', '123123', 'Isidora', 'Ignacia', 'Vargas', 'Cifuentes', '2001-05-22 07:28:19', 96510711, 'German ebbinghauss 830', '', 1),
(115, '135629707', 'sandra.andrea.rosales@gmail.com', '123123', 'Sandra', 'Andrea', 'Rosales', 'Gonzalez', '1975-02-05 00:00:00', 981643421, 'Los diaguitas 21559', '1afadgadfaasdasdasd', 1),
(116, '196684360', 'asfo2009@gmail.com', '123123', 'Andree', 'Simon', 'Figueroa', 'Olivares', '2019-10-16 16:19:50', 912312321, 'casa andree', 'qwrqgsdgsdghdh1q11', 1),
(117, '162653881', 'Karina.angulo@gmail.com', '123123', 'Karina', 'Andrea', 'Angulo', 'Cifuentes', '1988-11-15 00:00:00', 946262000, 'lago riesco 1422', 'asdasdlkj1l2313asidajsd_--asdakj', 1),
(118, '108606606', 'marcia.cifuentes@gmail.com', '987888', 'Marcia', 'Ivette', 'Cifuentes', 'Manzor', '1966-12-27 00:00:00', 965010711, 'german ebbinghauss 380', 'aosidjas9888asfk--asdoij1298..-asd1', 1),
(119, '12050598K', 'jacartes@gmail.com', 'qwepoiwe12', 'Jimmy', 'Alejandro', 'Cartes', 'Villalobos', '1978-12-12 00:00:00', 976097797, 'Av. Independencia 740 Dpto.610-b', 'asdaosdj1o231314asdasd', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IdPersona` int(9) NOT NULL,
  `Rut` varchar(9) NOT NULL,
  `Correo` varchar(40) NOT NULL,
  `Clave` varchar(10) NOT NULL,
  `PrimerNombre` varchar(20) NOT NULL,
  `SegundoNombre` varchar(20) NOT NULL,
  `PrimerApellido` varchar(20) NOT NULL,
  `SegundoApellido` varchar(20) NOT NULL,
  `Telefono` int(9) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `IdCetrooncologico` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IdPersona`, `Rut`, `Correo`, `Clave`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Telefono`, `Direccion`, `IdCetrooncologico`) VALUES
(1, '199287915', 'sebacartes35@gmail.com', '123456', 'Sebastian', 'Daniel', 'Cartes', 'Rosales', 226247444, 'los diaguitas', 123),
(2, '196684360', 'asfo.2009@gmail.com', '5557', 'andree', 'simon', 'figueroa', 'olivares', 125125, 'casa andree', 123),
(5, '199287916', 'admin@gmail.com', '111111', 'sebastian', 'daniel', 'cartes', 'rosales', 1231512, 'casa', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IdRol` int(1) NOT NULL,
  `NombreRol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IdRol`, `NombreRol`) VALUES
(1, 'Medico'),
(2, 'Asistente'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `IdTrabajador` int(9) NOT NULL,
  `IdPersona` int(9) NOT NULL,
  `IdRol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`IdTrabajador`, `IdPersona`, `IdRol`) VALUES
(1, 1, 1),
(2, 2, 2),
(5, 5, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`IdBitacora`);

--
-- Indices de la tabla `centrooncologico`
--
ALTER TABLE `centrooncologico`
  ADD PRIMARY KEY (`IdCentroOncologico`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`IdEquipo`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`IdNotificacion`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`IdPaciente`),
  ADD UNIQUE KEY `Rut` (`Rut`) USING HASH,
  ADD UNIQUE KEY `Correo` (`Correo`) USING HASH;

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IdPersona`),
  ADD UNIQUE KEY `Rut` (`Rut`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IdRol`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`IdTrabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `IdBitacora` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `IdEquipo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `IdNotificacion` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `IdPaciente` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IdPersona` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `IdTrabajador` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
