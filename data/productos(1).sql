-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2017 at 01:14 PM
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
  `partida` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `gravamen`, `iva`, `partida`) VALUES
(1, 'Accesorio De Computador', 5, 19, '8473300000'),
(2, 'Accesorio Para Camaras- Especialmente Soportes', 0, 19, '9008900000'),
(3, 'Agenda Electronica', 0, 19, '8470909000'),
(4, 'Aparato Diagnostico', 0, 19, '9018120000'),
(5, 'Aparato Dvd', 5, 19, '8521901000'),
(6, 'Articulos Ortopedicos', 5, 0, '9021101000'),
(7, 'Auriculares-Incluidos Los Cascos - Inclusos Combinados Con Microfonos ', 0, 19, '8518300000'),
(8, 'Camara Filmadora ', 5, 19, '8521909000'),
(9, 'Camaras Digitales', 5, 19, '8525802000'),
(10, 'Captador De Tv', 0, 19, '8525602000'),
(11, 'Celulares', 0, 19, '8517120000'),
(12, 'Circuito Electronico Integrado,Procesadores Y Controladores', 0, 19, '8542310000'),
(13, 'Computador ', 0, 0, '8471490000'),
(14, 'Condones', 0, 0, '4014100000'),
(15, 'Cpu', 0, 19, '8471500000'),
(16, 'Diodo', 0, 19, '8541100000'),
(17, 'Discos Magneticos', 5, 19, '8523291000'),
(18, 'Dispositivos De Almacenamiento De Datos Usb', 0, 19, '8523510000'),
(19, 'Envios Urgentes Por Avion', 10, 19, '9807200000'),
(20, 'Impresora', 0, 16, '8443199000'),
(21, 'Instrumento Para Analisis-Safety', 0, 19, '9027909000'),
(22, 'Instrumentos Musicales (Guitarras )', 5, 19, '9207900000'),
(23, 'Instrumentos Y Aparatos Para Analisis Fisicos O Quimicos              ( Espectometros)', 0, 19, '9027300000'),
(24, 'Ipod Touch-Mp5-Reproductor De Dvd -Reproductores De Imagen Y Sonido-Procesador De Datos Multifuncional-Mp3', 5, 19, '8521909000'),
(25, 'Laptop', 0, 0, '8471300000'),
(26, 'Lentes De Contacto', 0, 0, '9001300000'),
(27, 'Libros Cientificos ', 0, 0, '4901999000'),
(28, 'Menaje', 15, 0, '9805000000'),
(29, 'Meter-Safety', 0, 19, '9027101000'),
(30, 'Microfonos Y Sus Partes ', 0, 19, '8518100000'),
(31, 'Microfonos Y Sus Soportes; Altavoces(Altoparlantes), Incluso Montados En Cajas; Auriculares, Incluidos Los De Casco, Incluso Combinados Con Microfonos Y Juegos O Conjuntos Constituidos Por Un Microfon', 0, 19, '8518909000'),
(32, 'Motores Hidraulicos', 0, 19, '8412290000'),
(33, 'Oscilocopio', 0, 19, '9030200000'),
(34, 'Reloj Y Sus Partes /Relojes De Pulsera, Bolsillo Y Similares', 5, 19, '9102110000'),
(35, 'Repuesto Electronico', 0, 19, '8542390000'),
(36, 'Tablet- Ipad', 5, 19, '8517622000'),
(37, 'Tarjeta Inteligente', 5, 19, '8523520000'),
(38, 'Telefonos', 0, 19, '8517180000'),
(39, 'Telescopio-Binoculares', 0, 19, '9005800000'),
(40, 'Unidades De Procesamiento Scaner', 0, 19, '8471800000'),
(41, 'Vitaminas', 0, 0, '2936900000'),
(42, 'Microscopio', 0, 19, '9011200000'),
(43, 'Lamparas Y Demas Aparatos Eléctricos De Alumbrado, Para Colgar O Fijar Al Techo O A La Pared', 0, 19, '9405101090'),
(44, 'Las Incubadoras Especializadas', 0, 0, '8436809000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
