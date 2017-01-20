-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 17, 2017 at 04:02 PM
-- Server version: 10.0.28-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arancel`
--

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria` varchar(200) NOT NULL,
  `gravamen` double NOT NULL,
  `iva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `gravamen`, `iva`) VALUES
(1, 'Accesorios y partes para automóviles', 10, 16),
(2, 'Accesorios y partes para bicicletas', 10, 16),
(3, 'Accesorios y partes para motocicletas', 10, 16),
(4, 'Aparatos de diagnostico', 0, 16),
(5, 'Artículos de oficina', 10, 16),
(6, 'Artículos deportivos', 10, 16),
(7, 'Artículos ortopedicos', 5, 0),
(8, 'Articulos para bebé', 10, 16),
(9, 'Bisuteria', 0, 16),
(10, 'CD ROM', 5, 16),
(11, 'CDs , DVDs', 10, 16),
(12, 'Computación - Hardware', 5, 16),
(13, 'Computación - Software', 10, 16),
(14, 'Computadores', 0, 0),
(15, 'Computadores - Accesorios', 5, 16),
(16, 'Computadores - Monitores', 5, 16),
(17, 'Decoración y diseno', 10, 16),
(18, 'Dispositivos para almacenar datos (USB)', 0, 16),
(19, 'Documentos y revistas', 0, 0),
(20, 'Electrónicos - Accesorios y partes', 5, 16),
(21, 'Electrónicos - Agendas y PDAs', 0, 16),
(22, 'Electrónicos - Cámaras de video', 5, 16),
(23, 'Electrónicos - Cámaras digitales', 5, 16),
(24, 'Electrónicos - Circuitos integrados, procesadores y controladores', 0, 16),
(25, 'Electronicos - Equipos de audio , video', 5, 16),
(26, 'Electrónicos - Juegos de video', 10, 16),
(27, 'Electrónicos - Reproductores iPod, mp3, mp4, mp5', 5, 16),
(28, 'Electrónicos - Tablets', 5, 16),
(29, 'Electrónicos - Televisores', 10, 16),
(30, 'Equipos y partes para comunicaciones', 0, 16),
(31, 'Equipos y partes para impresión', 0, 16),
(32, 'Herramientas y ferretería', 10, 16),
(33, 'Hogar y jardín', 10, 16),
(34, 'Instrumentos musicales', 5, 16),
(35, 'Instrumentos y aparatos para análisis físico y químico', 0, 16),
(36, 'Joyas y relojes', 10, 16),
(37, 'Juguetes, juegos y hobbies', 10, 16),
(38, 'Libros', 0, 0),
(39, 'Menaje', 10, 16),
(40, 'Micrófonos, auriculares y sus partes', 0, 16),
(41, 'Otros envios urgentes', 10, 16),
(42, 'Ropa', 10, 16),
(43, 'Teléfonos celulares', 0, 16),
(44, 'Telescopios', 0, 16),
(45, 'Vitaminas', 0, 0),
(46, 'Zapatos', 10, 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
