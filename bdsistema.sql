-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-04-2024 a las 23:44:37
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`, `ESTADO`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'PACIENTE', b'1'),
(3, 'DOCTOR', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `IDCITAS` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `PACIENTE_ID` int(11) DEFAULT NULL,
  `DOCTOR_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `IDSEDE` int(11) NOT NULL,
  `IDCONSULTORIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`IDCITAS`, `FECHA`, `HORA`, `PACIENTE_ID`, `DOCTOR_ID`, `DESCRIPCION`, `IDSEDE`, `IDCONSULTORIO`) VALUES
(3, '2024-04-15', '10:00:00', 2, 13, 'Consulta médica de rutina', 1, 2),
(4, '2024-04-15', '12:00:00', 3, 13, 'Consulta médica de rutina', 1, 2),
(5, '2024-04-18', '08:15:00', 2, 13, 'Consulta psicología', 2, 4),
(6, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 1, 1),
(7, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 2, 2),
(8, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 2, 1),
(9, '2024-04-26', '09:00:00', 3, 39, 'Consulta médica', 2, 1),
(10, '2024-04-19', '14:00:00', 3, 49, 'Consulta médica', 4, 3),
(11, '2024-04-24', '09:00:00', 3, 43, 'Consulta médica', 2, 2),
(12, '2024-04-26', '09:30:00', 3, 39, 'Consulta médica', 2, 1),
(13, '2024-04-25', '08:30:00', 3, 50, 'Consulta médica', 1, 4),
(14, '2024-04-19', '08:30:00', 3, 42, 'Consulta médica', 1, 2),
(15, '2024-04-24', '08:30:00', 3, 41, 'Consulta médica', 4, 1),
(16, '2024-04-25', '08:30:00', 3, 38, 'Consulta médica', 1, 1),
(17, '2024-04-20', '08:30:00', 3, 50, 'Consulta médica', 1, 4),
(18, '2024-04-25', '13:00:00', 3, 41, 'Consulta médica', 1, 4),
(19, '2024-04-26', '12:30:00', 3, 59, 'Consulta médica', 6, 2),
(20, '2024-05-25', '09:30:00', 3, 61, 'Consulta médica', 6, 4),
(21, '2024-04-30', '10:00:00', 3, 62, 'Consulta médica', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `IDCONSULTORIO` int(11) NOT NULL,
  `NOMBRECONSULTORIO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`IDCONSULTORIO`, `NOMBRECONSULTORIO`, `ESTADO`) VALUES
(1, 'MEDICINA FAMILIAR', b'1'),
(2, 'FISIOTERAPIA', b'1'),
(3, 'MEDICINA INTERNA', b'1'),
(4, 'PSICOLOGÍA', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `IDSEDE` int(11) NOT NULL,
  `NOMBRESEDE` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`IDSEDE`, `NOMBRESEDE`, `ESTADO`) VALUES
(1, 'BUCARAMANGA', b'1'),
(2, 'LEBRIJA', b'1'),
(3, 'PAMPLONA', b'1'),
(4, 'RIONEGRO', b'1'),
(5, 'PIEDECUESTA', b'1'),
(6, 'GIRON', b'1'),
(7, 'FLORIDABLANCA', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(20) DEFAULT NULL,
  `CLAVE` varchar(50) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL,
  `ID_ESPECIALIDAD` int(11) DEFAULT NULL,
  `ID_RESIDENCIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`, `ID_ESPECIALIDAD`, `ID_RESIDENCIA`) VALUES
(1, 'CAMILO', '202cb962ac59075b964b07152d234b70', b'1', 1, NULL, NULL),
(2, 'MARIOR', '250cf8b51c773f3f8dc8b4be867a9a02', b'1', 2, NULL, NULL),
(3, 'ALEXANDER', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 2, NULL, NULL),
(13, 'Marito23', '698d51a19d8a121ce581499d7b701668', b'1', 3, NULL, NULL),
(38, 'Pedro', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 1, 1),
(39, 'Juan', '310dcbbf4cce62f762a2aaa148d556bd', b'1', 3, 2, 1),
(40, 'Luis', '550a141f12de6341fba65b0ad0433500', b'1', 3, 3, 1),
(41, 'Maria', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 4, 1),
(42, 'Ana', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 1, 2),
(43, 'Carlos', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 2, 2),
(44, 'Elena', '0a113ef6b61820daa5611c870ed8d5ee', b'1', 3, 3, 2),
(45, 'Andres', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 4, 2),
(46, 'Laura', 'c6f057b86584942e415435ffb1fa93d4', b'1', 3, 1, 3),
(47, 'Santiago', '698d51a19d8a121ce581499d7b701668', b'1', 3, 2, 3),
(48, 'Camila', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 3, 3),
(49, 'Daniel', '310dcbbf4cce62f762a2aaa148d556bd', b'1', 3, 4, 3),
(50, 'Valentina', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 1, 4),
(51, 'Diego', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 2, 4),
(52, 'Paula', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 3, 4),
(53, 'Felipe', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 4, 4),
(54, 'Sofia', '0a113ef6b61820daa5611c870ed8d5ee', b'1', 3, 1, 5),
(55, 'Andrea', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 2, 5),
(56, 'Julian', 'c6f057b86584942e415435ffb1fa93d4', b'1', 3, 3, 5),
(57, 'David', '698d51a19d8a121ce581499d7b701668', b'1', 3, 4, 5),
(58, 'Isabella', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 1, 6),
(59, 'Mateo', '310dcbbf4cce62f762a2aaa148d556bd', b'1', 3, 2, 6),
(60, 'Natalia', '550a141f12de6341fba65b0ad0433500', b'1', 3, 3, 6),
(61, 'Alejandro', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 4, 6),
(62, 'Valeria', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 1, 7),
(63, 'Lucas', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 2, 7),
(64, 'Mariana', '0a113ef6b61820daa5611c870ed8d5ee', b'1', 3, 3, 7),
(65, 'Gabriela', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 4, 7),
(66, 'JUANDAV', 'caf1a3dfb505ffed0d024130f58c5cfa', b'1', 1, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`IDCITAS`),
  ADD KEY `paciente_id` (`PACIENTE_ID`),
  ADD KEY `doctor_id` (`DOCTOR_ID`),
  ADD KEY `fk_IDSEDE` (`IDSEDE`),
  ADD KEY `FK_IDCONSULTORIO` (`IDCONSULTORIO`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`IDCONSULTORIO`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`IDSEDE`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_USUARIO_CARGO` (`IDCARGO`),
  ADD KEY `FK_USUARIO_ESPECIALIDAD` (`ID_ESPECIALIDAD`),
  ADD KEY `FK_USUARIO_RESIDENCIA` (`ID_RESIDENCIA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `IDCITAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `IDCONSULTORIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `IDSEDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FK_IDCONSULTORIO` FOREIGN KEY (`IDCONSULTORIO`) REFERENCES `consultorio` (`IDCONSULTORIO`),
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`PACIENTE_ID`) REFERENCES `usuario` (`IDUSUARIO`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `usuario` (`IDUSUARIO`),
  ADD CONSTRAINT `fk_IDSEDE` FOREIGN KEY (`IDSEDE`) REFERENCES `sede` (`IDSEDE`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_CARGO` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`IDCARGO`),
  ADD CONSTRAINT `FK_USUARIO_ESPECIALIDAD` FOREIGN KEY (`ID_ESPECIALIDAD`) REFERENCES `consultorio` (`IDCONSULTORIO`),
  ADD CONSTRAINT `FK_USUARIO_RESIDENCIA` FOREIGN KEY (`ID_RESIDENCIA`) REFERENCES `sede` (`IDSEDE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
