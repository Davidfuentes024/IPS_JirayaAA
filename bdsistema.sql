-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-04-2024 a las 09:30:57
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
  `IDCONSULTORIO` int(11) DEFAULT NULL,
  `ESTADO` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`IDCITAS`, `FECHA`, `HORA`, `PACIENTE_ID`, `DOCTOR_ID`, `DESCRIPCION`, `IDSEDE`, `IDCONSULTORIO`, `ESTADO`) VALUES
(3, '2024-04-15', '10:00:00', 2, 13, 'Consulta médica de rutina', 1, 2, b'0'),
(4, '2024-04-15', '12:00:00', 3, 13, 'Consulta médica de rutina', 1, 2, b'0'),
(5, '2024-04-18', '08:15:00', 2, 13, 'Consulta psicología', 2, 4, b'0'),
(6, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 1, 1, b'1'),
(7, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 2, 2, b'0'),
(8, '2024-04-15', '11:00:00', 2, 13, 'Consulta médica de rutina', 2, 1, b'0'),
(9, '2024-04-26', '09:00:00', 3, 39, 'Consulta médica', 2, 1, b'0'),
(10, '2024-04-19', '14:00:00', 3, 49, 'Consulta médica', 4, 3, b'0'),
(11, '2024-04-24', '08:30:00', 3, 43, 'Consulta médica', 2, 2, b'1'),
(12, '2024-04-26', '09:30:00', 3, 39, 'Consulta médica', 2, 1, b'1'),
(13, '2024-04-25', '08:30:00', 3, 50, 'Consulta médica', 1, 4, b'1'),
(14, '2024-04-19', '08:30:00', 3, 42, 'Consulta médica', 1, 2, b'0'),
(15, '2024-04-24', '08:30:00', 3, 41, 'Consulta médica', 4, 1, b'0'),
(16, '2024-04-25', '08:30:00', 3, 38, 'Consulta médica', 1, 1, b'1'),
(17, '2024-04-20', '08:30:00', 3, 50, 'Consulta médica', 1, 4, b'0'),
(18, '2024-04-25', '13:00:00', 3, 41, 'Consulta médica', 1, 4, b'1'),
(19, '2024-04-26', '12:30:00', 3, 59, 'Consulta médica', 6, 2, b'0'),
(20, '2024-05-25', '09:30:00', 3, 61, 'Consulta médica', 6, 4, b'1'),
(21, '2024-04-30', '10:00:00', 3, 62, 'Consulta médica', 7, 1, b'1'),
(22, '2024-05-02', '09:30:00', 3, 38, 'Consulta médica', 1, 1, b'1'),
(23, '2024-04-30', '08:30:00', 3, 62, 'Consulta médica', 7, 1, b'1'),
(24, '2024-04-25', '08:30:00', 3, 41, 'Consulta médica', 1, 4, b'1'),
(25, '2024-04-25', '08:00:00', 67, 42, 'Consulta médica', 2, 1, b'1'),
(26, '2024-04-30', '08:00:00', 67, 41, 'Consulta médica', 1, 4, b'1'),
(27, '2024-04-26', '08:00:00', 67, 50, 'Consulta médica', 4, 1, b'0'),
(28, '2024-04-26', '08:00:00', 3, 50, 'Consulta médica', 4, 1, b'0'),
(29, '2024-04-24', '10:30:00', 3, 55, 'Consulta médica', 5, 2, b'1'),
(30, '2024-05-10', '12:00:00', 70, 44, 'Consulta de medicina interna', 2, 3, b'1'),
(31, '2024-04-27', '08:00:00', 72, 59, 'Consulta de fisioterapia', 6, 2, b'0'),
(32, '2024-05-01', '14:30:00', 74, 39, 'Consulta de fisioterapia', 1, 2, b'1');

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
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE `historial_medico` (
  `IDHISTORIAL` int(11) NOT NULL,
  `IDPERSONA` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `OBSERVACION` text,
  `MOTIVO_CITA` varchar(100) DEFAULT NULL,
  `estado` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `historial_medico`
--

INSERT INTO `historial_medico` (`IDHISTORIAL`, `IDPERSONA`, `FECHA`, `OBSERVACION`, `MOTIVO_CITA`, `estado`) VALUES
(1, 1, '2024-04-24', 'Este paciente ha sido examinado y se encuentra en buen estado de salud general.', 'Consulta médica de rutina', b'1'),
(2, 2, '2024-04-24', 'Este paciente ha sido evaluado y no presenta problemas médicos significativos.', 'Consulta médica de rutina', b'1'),
(3, 3, '2024-04-24', 'Este paciente ha sido revisado y se encuentra en condiciones normales de salud.', 'Consulta médica de rutina', b'1'),
(8, 2, '2024-04-26', 'Todo en orden', 'Consulta rutinaria', b'1'),
(9, 37, '2024-04-26', 'Todo en orden', 'Consulta rutinaria por fisioterapia', b'0'),
(10, 2, '2024-04-26', 'Todo en orden', 'Consulta rutinaria', b'0'),
(11, 2, '2024-04-26', 'Todo en orden', 'Consulta rutinaria	', b'0'),
(12, 2, '2024-04-26', 'Todo en orden', 'Consulta rutinaria	', b'0'),
(13, 39, '2024-04-26', 'Todo en orden', 'Cita Rutinaria', b'1'),
(14, 2, '2024-04-26', 'Todo en orden', 'Consulta mÃ©dica de rutina', b'0'),
(15, 2, '2024-04-26', 'Todo en orden\r\n', 'Consulta mÃ©dica de rutina	', b'0'),
(16, 2, '2024-04-26', 'Todo en orden', 'Consulta mÃ©dica de rutina	', b'0'),
(17, 2, '2024-04-26', 'Todo en orden\r\n', 'Consulta mÃ©dica de rutina	', b'0'),
(18, 2, '2024-04-26', 'Todo en orden\r\n', 'Consulta médica de rutina	', b'0'),
(19, 2, '2024-04-27', 'éeeeeeéééé', 'éeeeeeéééé', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IDPERSONA` int(11) NOT NULL,
  `NOMBRE_COMPLETO` varchar(100) DEFAULT NULL,
  `TIPO_SANGRE` varchar(10) DEFAULT NULL,
  `GENERO` varchar(10) DEFAULT NULL,
  `LUGAR_NACIMIENTO` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `NUMERO_TELEFONO` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `OCUPACION` varchar(50) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(20) DEFAULT NULL,
  `NUMERO_DOCUMENTO` varchar(20) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IDPERSONA`, `NOMBRE_COMPLETO`, `TIPO_SANGRE`, `GENERO`, `LUGAR_NACIMIENTO`, `EMAIL`, `NUMERO_TELEFONO`, `DIRECCION`, `OCUPACION`, `ESTADO_CIVIL`, `NUMERO_DOCUMENTO`, `IDUSUARIO`, `fecha_nacimiento`) VALUES
(1, 'María González', 'A-', 'Femenino', 'Medellín, Colombia', 'maria@example.com', '987654321', 'Avenida 456', 'Abogada', 'Casado(a)', '987654321', 2, '2018-05-11'),
(2, 'Alexander Perez', 'AB+', 'Masculino', 'Bogotá, Colombia', 'alexander@example.com', '123456789', 'Carrera 123', 'Estudiante', 'Soltero(a)', '123456789', 3, '2006-02-27'),
(3, 'Andres Felipe Herrera Jerez', 'O-', 'Masculino', 'Bucaramanga, Colombia', 'andres@example.com', '567890123', 'Calle 789', 'Ingeniero en Sistemas', 'Soltero(a)', '567890123', 67, '1995-03-15'),
(4, 'Camilo Alfonso Castro Ortiz', 'A+', 'Masculino', 'Bucaramanga, Colombia', 'camilo@gmail.com', '3101234567', 'Cra. 10 #20-30', 'Ingeniero', 'Soltero(a)', '123456789', 1, '2000-05-24'),
(5, 'Mario Rodríguez López', 'A-', 'Masculino', 'Lebrija, Colombia', 'marito@hotmail.com', '3109876543', 'Cll. 20 #30-40', 'Abogado', 'Casado(a)', '987654321', 13, '2011-09-27'),
(6, 'Pedro García Martínez', 'AB+', 'Masculino', 'Pamplona, Colombia', 'pedro@gmail.com', '3105678901', 'Av. 30 #40-50', 'Doctor', 'Soltero(a)', '567890123', 38, '2012-04-08'),
(7, 'Juan Pérez Gómez', 'B+', 'Masculino', 'Rionegro, Colombia', 'juan@hotmail.com', '3104561237', 'Diag. 40 #50-60', 'Profesor', 'Casado(a)', '456123789', 39, '2021-10-18'),
(8, 'Luis Hernández Sánchez', 'O-', 'Masculino', 'Girón, Colombia', 'luis@gmail.com', '3107894561', 'Transv. 50 #60-70', 'Empresario', 'Soltero(a)', '789456123', 40, '2007-11-20'),
(9, 'María Rodríguez Gómez', 'AB-', 'Femenino', 'Piedecuesta, Colombia', 'maria@hotmail.com', '3103216549', 'Kra. 60 #70-80', 'Ingeniera', 'Casado(a)', '321654987', 41, '2009-09-07'),
(10, 'Ana García López', 'A+', 'Femenino', 'Bogotá, Colombia', 'ana@gmail.com', '3106549873', 'Cl. 70 #80-90', 'Arquitecta', 'Soltero(a)', '654987321', 42, '2020-06-07'),
(11, 'Carlos Gómez Martínez', 'B-', 'Masculino', 'Cali, Colombia', 'carlos@hotmail.com', '3108523691', 'Av. 80 #90-100', 'Contador', 'Casado(a)', '852369741', 43, '2008-10-26'),
(12, 'Elena Pérez Sánchez', 'AB+', 'Femenino', 'Medellín, Colombia', 'elena@gmail.com', '3103691478', 'Cra. 90 #100-110', 'Médica', 'Soltero(a)', '369147852', 44, '2018-06-09'),
(13, 'Andrés Hernández Gómez', 'O+', 'Masculino', 'Barranquilla, Colombia', 'andres@hotmail.com', '3101472583', 'Trans. 100 #110-120', 'Diseñador', 'Casado(a)', '147258369', 45, '2021-06-07'),
(14, 'Laura Rodríguez López', 'A-', 'Femenino', 'Bucaramanga, Colombia', 'laura@gmail.com', '3102583691', 'Diagonal 110 #120-130', 'Abogada', 'Soltero(a)', '258369147', 46, '2007-07-17'),
(15, 'Santiago García Martínez', 'B+', 'Masculino', 'Lebrija, Colombia', 'santiago@hotmail.com', '3103698521', 'Carrera 120 #130-140', 'Emprendedor', 'Casado(a)', '369852147', 47, '2009-01-18'),
(16, 'Camila Pérez Sánchez', 'O-', 'Femenino', 'Pamplona, Colombia', 'camila@gmail.com', '3108521473', 'Av. 130 #140-150', 'Profesora', 'Soltero(a)', '852147369', 48, '2018-04-18'),
(17, 'Daniel Hernández Gómez', 'AB-', 'Masculino', 'Rionegro, Colombia', 'daniel@hotmail.com', '3107418529', 'Calle 140 #150-160', 'Ingeniero Civil', 'Casado(a)', '741852963', 49, '2020-01-08'),
(18, 'Valentina Rodríguez López', 'A+', 'Femenino', 'Girón, Colombia', 'valentina@gmail.com', '3109638527', 'Trv. 150 #160-170', 'Músico', 'Soltero(a)', '963852741', 50, '2020-11-23'),
(19, 'Diego García Gómez', 'B-', 'Masculino', 'Piedecuesta, Colombia', 'diego@hotmail.com', '3101593578', 'Cra. 160 #170-180', 'Estudiante', 'Casado(a)', '159357852', 51, '2020-02-07'),
(20, 'Paula Martínez Sánchez', 'AB+', 'Femenino', 'Bogotá, Colombia', 'paula@gmail.com', '3103571598', 'Cll. 170 #180-190', 'Chef', 'Soltero(a)', '357159852', 52, '2013-07-06'),
(21, 'Felipe Pérez López', 'O+', 'Masculino', 'Cali, Colombia', 'felipe@hotmail.com', '3104561237', 'Av. 180 #190-200', 'Empresario', 'Casado(a)', '456123789', 53, '2022-11-29'),
(22, 'Sofía Rodríguez Martínez', 'A-', 'Femenino', 'Medellín, Colombia', 'sofia@gmail.com', '3106549873', 'Diag. 190 #200-210', 'Médica', 'Soltero(a)', '654987321', 54, '2009-09-21'),
(23, 'Andrea Gómez Sánchez', 'B+', 'Femenino', 'Barranquilla, Colombia', 'andrea@hotmail.com', '3108523691', 'Cra. 200 #210-220', 'Ingeniera Civil', 'Casado(a)', '852369741', 55, '2015-07-13'),
(24, 'Julián Martínez Gómez', 'O-', 'Masculino', 'Pamplona, Colombia', 'julian@gmail.com', '3103691478', 'Cll. 210 #220-230', 'Abogado', 'Soltero(a)', '369147852', 56, '2024-02-29'),
(25, 'David Hernández López', 'AB+', 'Masculino', 'Bucaramanga, Colombia', 'david@hotmail.com', '3101472583', 'Av. 220 #230-240', 'Contador', 'Casado(a)', '147258369', 57, '2009-12-07'),
(26, 'Isabella García Sánchez', 'A+', 'Femenino', 'Bogotá, Colombia', 'isabella@gmail.com', '3102583691', 'Trv. 230 #240-250', 'Estudiante', 'Soltero(a)', '258369147', 58, '2012-10-28'),
(27, 'Mateo Pérez Martínez', 'B-', 'Masculino', 'Cali, Colombia', 'mateo@hotmail.com', '3103698521', 'Diag. 240 #250-260', 'Doctor', 'Casado(a)', '369852147', 59, '2010-01-01'),
(28, 'Natalia Rodríguez López', 'O+', 'Femenino', 'Medellín, Colombia', 'natalia@gmail.com', '3108521473', 'Cra. 250 #260-270', 'Arquitecta', 'Soltero(a)', '852147369', 60, '2007-03-17'),
(29, 'Alejandro Gomez Sanchez', 'AB-', 'Masculino', 'Barranquilla, Colombia', 'alejandro@hotmail.com', '3107418529', 'Av. 260 #270-280', 'Empresario', 'Casado(a)', '741852963', 61, '2002-06-08'),
(30, 'Valeria García López', 'A+', 'Femenino', 'Piedecuesta, Colombia', 'valeria@gmail.com', '3109638527', 'Cll. 270 #280-290', 'Ingeniera', 'Soltero(a)', '963852741', 62, '2022-06-27'),
(31, 'Lucas Martínez Gómez', 'B-', 'Masculino', 'Bucaramanga, Colombia', 'lucas@hotmail.com', '3101593578', 'Trv. 280 #290-300', 'Piloto', 'Casado(a)', '159357852', 63, '2023-01-29'),
(32, 'Mariana Rodríguez Martínez', 'AB+', 'Femenino', 'Pamplona, Colombia', 'mariana@gmail.com', '3103571598', 'Av. 290 #300-310', 'Diseñadora', 'Soltero(a)', '357159852', 64, '2023-08-14'),
(33, 'Gabriela Hernández López', 'O+', 'Femenino', 'Medellín, Colombia', 'gabriela@hotmail.com', '3104561237', 'Cra. 300 #310-320', 'Ingeniera Química', 'Casado(a)', '456123789', 65, '2004-07-18'),
(34, 'Juan David Pérez Sánchez', 'A-', 'Masculino', 'Bogotá, Colombia', 'juandavid@gmail.com', '3106549873', 'Cll. 310 #320-330', 'Programador', 'Soltero(a)', '654987321', 66, '2007-07-06'),
(37, 'Daniel Galvis', 'A+', 'Masculino', 'Bucaramanga, Santander', 'danielgalvis@gmail.com', '3202906144', 'Calle 3 #4-14', 'Estudiante', 'Soltero(a)', '1005762456', 70, '2003-06-11'),
(38, 'Lucas Pato', 'AB-', 'Masculino', 'Lebrija, Santander', 'luquitas@gmail.com', '3102106144', 'Calle 4 #4-30', 'Ninguno', 'Soltero(a)', '23123321', 71, '2024-02-13'),
(39, 'Andres Rincon', 'A-', 'Masculino', 'Piedecuesta, Santander', 'andresrincon@gmail.com', '3122345144', 'Calle 10 #29-27', 'Estudiante', 'Soltero(a)', '2313122111', 72, '2005-06-29'),
(40, 'Jesús Nieves', 'A+', 'Masculino', 'Rionegro, Santander', 'jesus@gmail.com', '3122345144', 'Calle 10 #29-27', 'Físico', 'Soltero(a)', '2313122111', 73, '2017-02-26'),
(41, 'Wilson Manuel López Mendoza', 'A+', 'Masculino', 'Pasto, Colombia', 'wilson@gmail.com', '123891283', 'Calle 22 #17-140', 'Enfermero', 'Viudo(a)', '10051726342', 74, '2000-01-07');

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
(1, 'Camilo', '202cb962ac59075b964b07152d234b70', b'1', 1, NULL, NULL),
(2, 'MARIOR', '250cf8b51c773f3f8dc8b4be867a9a02', b'1', 2, NULL, NULL),
(3, 'ALEXANDER', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 2, NULL, NULL),
(13, 'Marito23', '698d51a19d8a121ce581499d7b701668', b'1', 3, NULL, NULL),
(38, 'Pedro', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 1, 1),
(39, 'Juan', '310dcbbf4cce62f762a2aaa148d556bd', b'1', 3, 2, 1),
(40, 'Luis', '550a141f12de6341fba65b0ad0433500', b'1', 3, 3, 1),
(41, 'Maria', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 4, 1),
(42, 'Ana', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 1, 2),
(43, 'Carlos', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 2, 2),
(44, 'Elena', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 3, 2),
(45, 'Andres', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 4, 2),
(46, 'Laura', 'c6f057b86584942e415435ffb1fa93d4', b'1', 3, 1, 3),
(47, 'Santiago', '698d51a19d8a121ce581499d7b701668', b'1', 3, 2, 3),
(48, 'Camila', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 3, 3),
(49, 'Daniel', '202cb962ac59075b964b07152d234b70', b'1', 3, 4, 3),
(50, 'Valentina', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 1, 4),
(51, 'Diego', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 2, 4),
(52, 'Paula', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 3, 4),
(53, 'Felipe', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 4, 4),
(54, 'Sofia', '0a113ef6b61820daa5611c870ed8d5ee', b'1', 3, 1, 5),
(55, 'Andrea', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 2, 5),
(56, 'Julian', 'c6f057b86584942e415435ffb1fa93d4', b'1', 3, 3, 5),
(57, 'David', '698d51a19d8a121ce581499d7b701668', b'1', 3, 4, 5),
(58, 'Isabella', 'bcbe3365e6ac95ea2c0343a2395834dd', b'1', 3, 1, 6),
(59, 'Mateo', '202cb962ac59075b964b07152d234b70', b'1', 3, 2, 6),
(60, 'Natalia', '550a141f12de6341fba65b0ad0433500', b'1', 3, 3, 6),
(61, 'Alejandro', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 3, 4, 6),
(62, 'Valeria', 'fae0b27c451c728867a567e8c1bb4e53', b'1', 3, 1, 7),
(63, 'Lucas', 'f1c1592588411002af340cbaedd6fc33', b'1', 3, 2, 7),
(64, 'Mariana', '0a113ef6b61820daa5611c870ed8d5ee', b'1', 3, 3, 7),
(65, 'Gabriela', 'b706835de79a2b4e80506f582af3676a', b'1', 3, 4, 7),
(66, 'JUANDAV', 'caf1a3dfb505ffed0d024130f58c5cfa', b'1', 1, NULL, NULL),
(67, 'AndresProf', 'caf1a3dfb505ffed0d024130f58c5cfa', b'1', 2, NULL, NULL),
(70, 'Danielito', '202cb962ac59075b964b07152d234b70', b'1', 2, NULL, NULL),
(71, 'LucasXD', 'caf1a3dfb505ffed0d024130f58c5cfa', b'1', 2, NULL, NULL),
(72, 'AndresRincon', '202cb962ac59075b964b07152d234b70', b'1', 2, NULL, NULL),
(73, 'Jesús', '202cb962ac59075b964b07152d234b70', b'1', 2, NULL, NULL),
(74, 'WilsonL', '15de21c670ae7c3f6f3f1f37029303c9', b'1', 2, NULL, NULL);

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
-- Indices de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD PRIMARY KEY (`IDHISTORIAL`),
  ADD KEY `IDPERSONA` (`IDPERSONA`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD KEY `FK_IDUSUARIO_PERSONA` (`IDUSUARIO`);

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
  MODIFY `IDCITAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `IDCONSULTORIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  MODIFY `IDHISTORIAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IDPERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `IDSEDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
-- Filtros para la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_IDUSUARIO_PERSONA` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

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
