-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2024 a las 18:52:06
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_ia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `matricula` varchar(8) NOT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`matricula`, `fecha_hora`) VALUES
('3284HCW', '2024-02-05 17:56:26'),
('3284HCW', '2024-02-05 18:12:46'),
('5267DPV', '2024-02-05 18:13:25'),
('3284HCW', '2024-02-04 18:19:28'),
('0201FSD', '2024-02-03 19:04:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `matricula` varchar(8) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(25) NOT NULL,
  `color` varchar(20) NOT NULL,
  `anio_fabricacion` int(4) NOT NULL,
  `etiqueta` varchar(3) NOT NULL,
  `nombre_propietario` varchar(20) NOT NULL,
  `apellido_propietario` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`matricula`, `marca`, `modelo`, `color`, `anio_fabricacion`, `etiqueta`, `nombre_propietario`, `apellido_propietario`) VALUES
('3284HCW', 'Kia', 'Sportage', 'naranja', 2010, 'B', 'Iñaki', 'Kintana'),
('5267DPV', 'SEAT', 'Ibiza', 'negro', 2005, 'C', 'Aritz', 'Santana'),
('ABC111', 'Toyota', 'Camry', 'Azul', 2019, 'C', 'Carlos', 'Ramírez'),
('ABC123', 'Toyota', 'Corolla', 'Rojo', 2020, 'A', 'Juan', 'Pérez'),
('BCD000', 'Ram', '2500', 'Negro', 2019, 'ECO', 'Catalina', 'Martínez'),
('BCD111', 'Audi', 'Q5', 'Blanco', 2022, 'C', 'Alejandro', 'Ramírez'),
('BCD123', 'Audi', 'A4', 'Gris', 2022, 'C', 'Alejandro', 'Jiménez'),
('BCD777', 'Buick', 'Enclave', 'Blanco', 2018, 'C', 'Susana', 'Martínez'),
('BCD888', 'Kia', 'Telluride', 'Negro', 2020, '0', 'Susana', 'López'),
('BCD999', 'Alfa Romeo', 'Giulia', 'Negro', 2022, 'C', 'Arturo', 'López'),
('CDE890', 'Porsche', 'Panamera', 'Blanco', 2018, 'ECO', 'Valeria', 'García'),
('DEF333', 'Ford', 'Escape', 'Negro', 2021, 'ECO', 'Luis', 'Martínez'),
('DEF789', 'Ford', 'Focus', 'Negro', 2021, 'C', 'Carlos', 'Martínez'),
('EFG000', 'Jaguar', 'XE', 'Gris', 2017, '0', 'Valeria', 'Martínez'),
('EFG111', 'Chrysler', 'Pacifica', 'Blanco', 2020, 'A', 'Ricardo', 'Ramírez'),
('EFG222', 'Tesla', 'Model Y', 'Negro', 2020, 'ECO', 'Isabel', 'Gómez'),
('EFG456', 'Tesla', 'Model 3', 'Blanco', 2020, 'ECO', 'Isabel', 'Pérez'),
('EFG888', 'Cadillac', 'XT6', 'Negro', 2019, 'A', 'Roberto', 'Ramírez'),
('EFG999', 'Subaru', 'Ascent', 'Azul', 2021, 'C', 'Gabriela', 'Martínez'),
('GHI012', 'Chevrolet', 'Malibu', 'Blanco', 2018, 'ECO', 'Ana', 'López'),
('GHI444', 'Chevrolet', 'Cruze', 'Blanco', 2018, 'B', 'Sofía', 'Gómez'),
('HIJ000', 'Nissan', 'Pathfinder', 'Plateado', 2022, 'B', 'Luis', 'Ramírez'),
('HIJ111', 'Ford', 'Expedition', 'Rojo', 2018, 'A', 'Diego', 'Fernández'),
('HIJ222', 'GMC', 'Sierra', 'Gris', 2021, '0', 'Adriana', 'López'),
('HIJ333', 'Mercedes-Benz', 'GLC', 'Rojo', 2019, '0', 'Raúl', 'Fernández'),
('HIJ789', 'Mercedes-Benz', 'C-Class', 'Negro', 2019, 'A', 'Raúl', 'Gómez'),
('HIJ999', 'Acura', 'MDX', 'Gris', 2020, '0', 'Laura', 'López'),
('JKL345', 'Volkswagen', 'Jetta', 'Gris', 2022, 'A', 'José', 'Hernández'),
('JKL555', 'Volkswagen', 'Golf', 'Gris', 2022, 'A', 'Miguel', 'Fernández'),
('KLM000', 'Infiniti', 'QX60', 'Rojo', 2021, 'B', 'Ricardo', 'Martínez'),
('KLM012', 'BMW', '3 Series', 'Azul', 2017, 'B', 'Sofía', 'Martínez'),
('KLM111', 'Hyundai', 'Palisade', 'Blanco', 2017, '0', 'Elena', 'López'),
('KLM222', 'Hyundai', 'Tucson', 'Azul', 2019, 'ECO', 'Natalia', 'López'),
('KLM333', 'Buick', 'Envision', 'Rojo', 2022, 'B', 'Luis', 'Martínez'),
('KLM444', 'BMW', '5 Series', 'Plateado', 2017, 'B', 'Sofía', 'López'),
('MNO666', 'Hyundai', 'Sonata', 'Plateado', 2020, 'C', 'Laura', 'Díaz'),
('MNO678', 'Hyundai', 'Elantra', 'Verde', 2020, 'B', 'Laura', 'Fernández'),
('NOP222', 'Mitsubishi', 'Montero', 'Gris', 2018, 'A', 'Hugo', 'Martínez'),
('NOP333', 'Chevrolet', 'Traverse', 'Plateado', 2020, 'C', 'Roberto', 'Gómez'),
('NOP345', 'Lexus', 'ES', 'Plateado', 2021, 'C', 'Daniel', 'López'),
('NOP444', 'Cadillac', 'CT4', 'Negro', 2017, 'C', 'Gabriela', 'Fernández'),
('NOP555', 'Lexus', 'RX', 'Gris', 2021, 'C', 'Daniel', 'Hernández'),
('PQR777', 'Nissan', 'Maxima', 'Negro', 2019, '0', 'Francisco', 'Hernández'),
('PQR901', 'Nissan', 'Altima', 'Negro', 2019, 'C', 'Francisco', 'Díaz'),
('QRS333', 'Jeep', 'Grand Cherokee', 'Rojo', 2019, 'C', 'Catalina', 'Ramírez'),
('QRS444', 'Toyota', 'Rav4', 'Negro', 2021, '0', 'Laura', 'Ramírez'),
('QRS555', 'Acura', 'RDX', 'Azul', 2018, '0', 'Javier', 'Gómez'),
('QRS666', 'Volvo', 'XC60', 'Negro', 2018, 'A', 'Carolina', 'Díaz'),
('QRS678', 'Volvo', 'S60', 'Rojo', 2018, 'ECO', 'Carolina', 'Hernández'),
('STU234', 'Mazda', 'Mazda3', 'Azul', 2021, 'ECO', 'Carmen', 'Sánchez'),
('STU888', 'Mazda', 'CX-5', 'Azul', 2021, 'A', 'Carmen', 'Gutiérrez'),
('TUV444', 'Ram', 'Rebel', 'Negro', 2020, 'B', 'Ricardo', 'López'),
('TUV555', 'Honda', 'Pilot', 'Blanco', 2017, 'B', 'Ricardo', 'López'),
('TUV666', 'Lincoln', 'Aviator', 'Plateado', 2019, 'ECO', 'Susana', 'López'),
('TUV777', 'Infiniti', 'QX50', 'Blanco', 2022, 'B', 'Pedro', 'Sánchez'),
('TUV901', 'Infiniti', 'Q50', 'Negro', 2022, 'A', 'Pedro', 'Fernández'),
('VWX567', 'Kia', 'Optima', 'Rojo', 2017, 'A', 'Miguel', 'García'),
('VWX999', 'Kia', 'Sorento', 'Rojo', 2017, 'B', 'José', 'Pérez'),
('WXY234', 'Jaguar', 'XE', 'Gris', 2019, 'B', 'Victoria', 'Díaz'),
('WXY555', 'Chrysler', 'Voyager', 'Azul', 2021, '0', 'Adriana', 'Martínez'),
('WXY666', 'Ford', 'Fusion', 'Gris', 2018, 'A', 'Adriana', 'Martínez'),
('WXY777', 'Fiat', '124 Spider', 'Rojo', 2020, 'A', 'Roberto', 'Martínez'),
('WXY888', 'Mitsubishi', 'Outlander', 'Azul', 2017, '0', 'Julia', 'Gómez'),
('XYZ222', 'Honda', 'Accord', 'Rojo', 2020, '0', 'María', 'López'),
('XYZ456', 'Honda', 'Civic', 'Azul', 2019, 'B', 'María', 'Gómez'),
('YZA000', 'Subaru', 'Forester', 'Gris', 2018, '0', 'Elena', 'Martínez'),
('YZA890', 'Subaru', 'Impreza', 'Plateado', 2018, 'B', 'Elena', 'Ramírez'),
('ZAB567', 'Land Rover', 'Discovery', 'Verde', 2020, 'C', 'Gabriel', 'Sánchez'),
('ZAB666', 'GMC', 'Acadia', 'Plateado', 2017, 'ECO', 'Javier', 'Ramírez'),
('ZAB777', 'Mazda', 'CX-9', 'Rojo', 2019, 'ECO', 'Javier', 'Ramírez'),
('ZAB888', 'Maserati', 'Levante', 'Blanco', 2021, 'B', 'Patricia', 'Ramírez'),
('ZAB999', 'Jeep', 'Renegade', 'Verde', 2018, 'C', 'Hugo', 'Hernández');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
