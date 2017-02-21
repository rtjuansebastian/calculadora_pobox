-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2017 at 02:49 PM
-- Server version: 5.5.52-cll-lve
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `arancel`
--

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gravamen` double NOT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `gravamen`, `iva`) VALUES
(1, 'Accesorios y partes para automoviles', 10, 19),
(2, 'Accesorios y partes para bicicletas', 10, 19),
(3, 'Accesorios y partes para motocicletas', 10, 19),
(4, 'Aparatos de diagnostico', 0, 19),
(5, 'Articulos de oficina', 10, 16),
(6, 'Articulos deportivos', 10, 16),
(7, 'Articulos ortopedicos', 5, 0),
(8, 'Articulos para bebe', 10, 19),
(9, 'CDs , DVDs', 10, 19),
(10, 'Celulares', 0, 19),
(11, 'Computacion - Hardware', 5, 19),
(12, 'Computacion - Software', 10, 19),
(13, 'Computadores', 0, 0),
(14, 'Computadores - Accesorios', 5, 19),
(15, 'Decoracion y diseno', 10, 19),
(16, 'Documentos y revistas', 0, 0),
(17, 'Electronicos - Repuestos', 0, 19),
(18, 'Electronicos - Agendas y PDAs', 0, 19),
(19, 'Electronicos - Camaras de video', 5, 19),
(20, 'Electronicos - Camaras digitales', 5, 19),
(21, 'Electronicos - Circuitos integrados, procesadores y controladores', 0, 19),
(22, 'Electronicos - Equipos de audio , video,  reproductores iPod, mp3, mp4, mp5', 5, 19),
(23, 'Electronicos - Juegos de video', 10, 19),
(24, 'Electronicos - Tablets', 5, 19),
(25, 'Electronicos - Televisores', 10, 19),
(26, 'Impresora', 0, 19),
(27, 'Partes y accesorios para Impresion', 0, 19),
(28, 'Herramientas y ferreteria', 10, 19),
(29, 'Hogar y jardin', 10, 19),
(30, 'Instrumentos musicales (Guitarras)', 5, 19),
(31, 'Joyas ', 10, 19),
(32, 'Relojes', 5, 19),
(33, 'Juguetes, juegos y hobbies', 10, 19),
(34, 'Libros', 0, 0),
(35, 'Menaje', 10, 19),
(36, 'Microfonos, auriculares y sus partes', 0, 19),
(37, 'Otros envios urgentes', 10, 19),
(38, 'Ropa', 10, 19),
(39, 'Telescopios', 0, 19),
(40, 'Vitaminas', 0, 0),
(41, 'Zapatos', 10, 19),
(42, 'Lentes de contacto', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
