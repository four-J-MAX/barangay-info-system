-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 09:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barangay`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblactivity`
--

CREATE TABLE `tblactivity` (
  `id` int(11) NOT NULL,
  `dateofactivity` date NOT NULL,
  `activity` text NOT NULL,
  `description` text NOT NULL,
  `actStat` text NOT NULL,
  `barangay` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblactivity`
--

INSERT INTO `tblactivity` (`id`, `dateofactivity`, `activity`, `description`, `actStat`, `barangay`, `date_created`) VALUES
(12, '2022-01-04', 'Vacination Drive', 'Vacination for kid that age of 5-12', 'Event Done', NULL, '2024-08-08 05:08:17'),
(13, '2022-03-10', 'Monthly immunization', 'Every second week of month\r\n', 'Event Done', NULL, '2024-08-08 05:08:17'),
(14, '2022-04-29', 'Fiesta of San Vicente Ferrer', 'Yearly Fiesta\r\n', 'Incoming Event', NULL, '2024-08-08 05:08:17'),
(15, '2022-02-25', 'Monthly Clean up Drive', 'Every 3rd week and 4th week of the month', 'Event Done', NULL, '2024-08-08 05:08:17'),
(16, '2022-01-02', 'Election', 'New Set of Purok Officer', 'Event Done', NULL, '2024-08-08 05:08:17'),
(17, '2022-01-16', 'Poultry Farm', 'Public of newly applied', 'Event Done', NULL, '2024-08-08 05:08:17'),
(18, '2022-03-02', 'Social Preparation', 'Form 5-11years old', 'Event Done', NULL, '2024-08-08 05:08:17'),
(19, '2022-01-16', 'Blessing', 'For new renovated health center', 'Event Done', NULL, '2024-08-08 05:08:17'),
(20, '2022-02-23', 'Cash Assistance for Bagyong Odette', 'Roll out validation and distribution of cash assistance for Odette', 'Event Done', NULL, '2024-08-08 05:08:17'),
(25, '2022-04-27', 'Yearly Fiesta', 'MR & MRS', 'Event Done', NULL, '2024-08-08 05:08:17'),
(26, '2022-04-28', 'Yearly Fiesta', 'Fiesta Mass', 'Happening Right Now', NULL, '2024-08-08 05:08:17'),
(27, '2022-04-29', 'Yearly Fiesta ', 'Kahulugan', 'Incoming Event', 'Tarong', '2024-08-08 05:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `tblactivityphoto`
--

CREATE TABLE `tblactivityphoto` (
  `id` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `filename` text NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblactivityphoto`
--

INSERT INTO `tblactivityphoto` (`id`, `activityid`, `filename`, `deleted`, `date_created`) VALUES
(18, 7, '1485255503893ChibiMaker.jpg', 0, '2024-08-08 05:08:35'),
(19, 7, '1485255504014dental.jpg', 0, '2024-08-08 05:08:35'),
(20, 7, '1485255504108images.jpg', 0, '2024-08-08 05:08:35'),
(21, 8, '1485255608251dfxfxfxdfxfxfxdf.png', 0, '2024-08-08 05:08:35'),
(22, 8, '1485255608315easy-nail-art-designs-for-beginners-youtube.jpg', 0, '2024-08-08 05:08:35'),
(23, 8, '1485255608404Easy-Winter-Nail-Art-Tutorials-2013-2014-For-Beginners-Learners-10.jpg', 0, '2024-08-08 05:08:35'),
(24, 8, '1485255608513motherboard.png', 0, '2024-08-08 05:08:35'),
(25, 9, '148525575293111041019_1012143402147589_9043399646875097729_n.jpg', 0, '2024-08-08 05:08:35'),
(26, 9, '1485255753089bg.PNG', 0, '2024-08-08 05:08:35'),
(33, 10, '1485267649364bg.PNG', 0, '2024-08-08 05:08:35'),
(34, 10, '1485267649563motherboard.png', 0, '2024-08-08 05:08:35'),
(36, 10, '1485530481111bicycle-1280x720.jpg', 0, '2024-08-08 05:08:35'),
(38, 11, '1485530620716user2.jpg', 0, '2024-08-08 05:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblblotter`
--

CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL,
  `yearRecorded` varchar(4) NOT NULL,
  `dateRecorded` date NOT NULL,
  `complainant` text NOT NULL,
  `cage` int(11) NOT NULL,
  `caddress` text NOT NULL,
  `ccontact` int(11) NOT NULL,
  `personToComplain` text NOT NULL,
  `page` int(11) NOT NULL,
  `paddress` text NOT NULL,
  `pcontact` int(11) NOT NULL,
  `complaint` text NOT NULL,
  `actionTaken` varchar(50) NOT NULL,
  `sStatus` varchar(50) NOT NULL,
  `locationOfIncidence` text NOT NULL,
  `recordedby` varchar(50) NOT NULL,
  `lupon` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `barangay` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblblotter`
--

INSERT INTO `tblblotter` (`id`, `yearRecorded`, `dateRecorded`, `complainant`, `cage`, `caddress`, `ccontact`, `personToComplain`, `page`, `paddress`, `pcontact`, `complaint`, `actionTaken`, `sStatus`, `locationOfIncidence`, `recordedby`, `lupon`, `deleted`, `date_created`, `barangay`) VALUES
(10, '2022', '2022-02-23', 'Torro, Mark Gila', 32, 'Tugas,Madridejos,Cebu', 323432, '83', 43, 'Tugas,Madridejos,Cebu', 343234, 'away sa yuta', '', 'Pending', 'Crossing Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', 'Tarong'),
(11, '2022', '2022-03-08', 'Marfa, Jose Quijano', 52, 'Tugas, Madridejos, Cebu', 8728738, '29', 33, 'Tugas, Madridejos, Cebu', 9298732, 'suay', '', 'Pending', 'tugas', 'admin', 'Victoria Golisao', 0, '2024-08-08 05:08:47', NULL),
(12, '2022', '2022-03-08', 'jay, dsf asdf', 21, 'Tugas, Madridejos, Cebu', 24231, '89', 21, 'Tugas, Madridejos, Cebu', 34212, 'sumbagay', '', 'Pending', 'tugas', 'admin', 'Elias Medallo', 0, '2024-08-08 05:08:47', NULL),
(13, '2022', '2022-03-08', 'Quijano, Alfonso Gonjuran', 22, 'Tugas, Madridejos, Cebu', 9898, '88', 29, 'Tugas, Madridejos, Cebu', 989787, 'suay', '', 'Solved', 'tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(14, '2022', '2022-03-18', 'Batasin-in , Jieda Bautro', 21, 'Tugas,Madridejos,Cebu', 13342, '29', 20, 'Tugas,Madridejos,Cebu', 2134323, 'away sa kabit', '', 'Pending', 'Tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(15, '2022', '2022-03-29', 'Arellano, Edison Maru', 20, 'Tugas, Madridejos, Cebu', 98767, '14', 21, 'Tugas, Madridejos, Cebu', 97767, 'sumbagay', '', 'Unsolved', 'tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(16, '2022', '2022-03-29', 'Arellano, Megmeg Maru', 20, 'Tugas, Madridejos, Cebu', 9989, '25', 22, 'Tugas, Madridejos, Cebu', 98877, 'Suay', '', 'Pending', 'tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(17, '2022', '2022-03-29', 'Cahutay, Mirasol Bautro', 23, 'Tugas, Madridejos, Cebu', 98767, '23', 40, 'Tugas, Madridejos, Cebu', 9554, 'Away', '', 'Pending', 'tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(18, '2022', '2022-03-29', 'Ferrer, Antonette Marfa', 20, 'Tugas, Madridejos, Cebu', 9776, '25', 20, 'Tugas, Madridejos, Cebu', 96565, 'Marites', '', 'Unsolved', 'tugas', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(19, '2022', '2022-03-29', 'Ending , Rica Mae Arellano', 23, 'Tugas, Madridejos, Cebu', 90878, '25', 20, 'Tugas, Madridejos, Cebu', 98878, 'Awayi', '', 'Unsolved', 'tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(20, '2022', '2022-04-04', 'P., Bacolod Ronnel', 23, 'Tugas,Madridejos,Cebu', 90787, '14', 20, 'Tugas,Madridejos,Cebu', 9898, 'away sa kabit', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(21, '2022', '2022-04-04', 'Gido, Rico Chavez', 21, 'Tugas,Madridejos,Cebu', 89788, '23', 21, 'Tugas,Madridejos,Cebu', 998980, 'away sa kabit', '', 'Felisa Chavez', 'Tugas', 'admin', 'Victoria Golisao', 0, '2024-08-08 05:08:47', NULL),
(22, '2022', '2022-04-04', 'Batasin-in , Jieda Bautro', 21, 'Tugas,Madridejos,Cebu', 13232, '13', 21, 'Tugas,Madridejos,Cebu', 213232, 'suay', '', 'Unsolved', 'tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(23, '2022', '2022-04-04', 'Marfa, Jose Quijano', 25, 'Tugas,Madridejos,Cebu', 8787, '30', 37, 'Tugas,Madridejos,Cebu', 8898, 'suay sa kwarta', '', 'Unsolved', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(24, '2022', '2022-04-06', 'Dela Cruz , Red Aropo', 16, 'Tugas,Madridejos,Cebu', 2323, '38', 23, 'Tugas,Madridejos,Cebu', 2039298, 'sumbagay', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(25, '2022', '2022-04-19', 'Valirio, Jesa Lawan', 21, 'Tugas,Madridejos,Cebu', 97653433, '41', 23, 'Tugas,Madridejos,Cebu', 978656454, 'Away sa karsada', '', 'Unsolved', 'Tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(26, '2022', '2022-04-19', 'Mabulay, Sandra Maru', 22, 'Tugas,Madridejos,Cebu', 97382122, '28', 20, 'Tugas,Madridejos,Cebu', 92881821, 'away sa yuta', '', 'Unsolved', 'Tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(27, '2022', '2022-04-19', 'Maru, Mary Rose Maspara', 21, 'Tugas,Madridejos,Cebu', 9828121, '61', 22, 'Tugas,Madridejos,Cebu', 9129182, 'away sa habilin', '', 'Unsolved', 'Tugas', 'admin', 'Elias Medallo', 0, '2024-08-08 05:08:47', NULL),
(28, '2022', '2022-04-19', 'Lucagbo, Jm Bacolod', 23, 'Tugas,Madridejos,Cebu', 9289221, '11', 23, 'Tugas,Madridejos,Cebu', 9182712, 'utang', '', 'Unsolved', 'Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(29, '2022', '2022-04-19', 'Quijano, Alfonso Gonjuran', 22, 'Tugas,Madridejos,Cebu', 92982, '22', 24, 'Tugas,Madridejos,Cebu', 9029092, 'basketball', '', 'Pending', 'bunakan', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(30, '2022', '2022-04-19', 'Chavez, Alana Gido', 21, 'Tugas,Madridejos,Cebu', 92918921, '64', 22, 'Tugas,Madridejos,Cebu', 929822, 'away sa uyab', '', 'Pending', 'Tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(31, '2022', '2022-04-19', 'Batasin-in , Jieda Bautro', 31, 'Tugas,Madridejos,Cebu', 9172811, '36', 18, 'Tugas,Madridejos,Cebu', 9192812, 'way pagpadala', '', 'Pending', 'Tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(32, '2022', '2022-04-19', 'Lucagbo, Jm Bacolod', 23, 'Tugas,Madridejos,Cebu', 912981, '66', 22, 'Tugas,Madridejos,Cebu', 9128128, 'makigbuwag', '', 'Unsolved', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(33, '2022', '2022-04-19', 'Villaceran, Kean Maru', 23, 'Tugas,Madridejos,Cebu', 98776, '26', 15, 'Tugas,Madridejos,Cebu', 9785544, 'bullying', '', 'Pending', 'Tugas', 'admin', 'Victoria Golisao', 0, '2024-08-08 05:08:47', NULL),
(34, '2022', '2022-04-19', 'Mabulay, Rey Lawan', 23, 'Tugas,Madridejos,Cebu', 9987878, '66', 22, 'Tugas,Madridejos,Cebu', 98776656, 'sustento', '', 'Unsolved', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(35, '2022', '2022-04-19', 'Marfa, Jie Ann Maru', 28, 'Tugas,Madridejos,Cebu', 97865655, '27', 27, 'Tugas,Madridejos,Cebu', 9765434, 'online selling', '', 'Unsolved', 'Tugas', 'admin', 'Victoria Golisao', 0, '2024-08-08 05:08:47', NULL),
(36, '2022', '2022-04-19', 'Pelayo, Ronnel Bacolod', 23, 'Tugas,Madridejos,Cebu', 987755454, '51', 22, 'Tugas,Madridejos,Cebu', 99876554, 'kuwang sa bahin', '', 'Pending', 'Tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(37, '2022', '2022-04-19', 'Chavez, Alana Gido', 22, 'Tugas,Madridejos,Cebu', 2147483647, '19', 22, 'Tugas,Madridejos,Cebu', 98766554, 'suay sa volleyball', '', 'Pending', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(38, '2022', '2022-04-19', 'Marfa, Niel Maru', 22, 'Tugas,Madridejos,Cebu', 97756543, '31', 52, 'Tugas,Madridejos,Cebu', 998765545, 'suay', '', 'Pending', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(39, '2022', '2022-04-19', 'Cueva, Jason Maru', 22, 'Tugas,Madridejos,Cebu', 98878776, '17', 23, 'Tugas,Madridejos,Cebu', 998775656, 'suay sa bahin', '', 'Unsolved', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(40, '2022', '2022-04-19', 'Dela Cruz, Lyn Gila', 30, 'Tugas,Madridejos,Cebu', 2147483647, '66', 28, 'Tugas,Madridejos,Cebu', 2147483647, 'away sa kabit', '', 'Solved', 'tugas', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(41, '2022', '2022-04-19', 'De Jesus, Ella Jane Bacolod', 24, 'Tugas,Madridejos,Cebu', 1024678432, '41', 27, 'Tugas,Madridejos,Cebu', 346547899, 'sayup nga chismis', '', 'Solved', 'Crossing Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(42, '2022', '2022-04-19', 'Mabulay, Sandra Maru', 31, 'Tugas,Madridejos,Cebu', 36789053, '58', 33, 'Tugas,Madridejos,Cebu', 35632637, 'away mag asawa', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Victoria Golisao', 0, '2024-08-08 05:08:47', NULL),
(43, '2022', '2022-04-19', 'Pastiteo, Jacob Bacolod', 24, 'Tugas,Madridejos,Cebu', 43637678, '26', 25, 'Tugas,Madridejos,Cebu', 23546578, 'away mag utod', '', 'Solved', 'Crossing Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(44, '2022', '2022-04-19', 'Marfa, Jie Ann Maru', 30, 'Tugas,Madridejos,Cebu', 3467689, '21', 22, 'Tugas,Madridejos,Cebu', 3635758, 'away mag utod', '', 'Pending', 'Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(45, '2022', '2022-04-19', 'Caranzo, Victoria Go', 64, 'Tugas,Madridejos,Cebu', 3365769, '29', 55, 'Tugas,Madridejos,Cebu', 35346786, 'away sa yuta', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Elias Medallo', 0, '2024-08-08 05:08:47', NULL),
(46, '2022', '2022-04-19', 'Ferrer, Antonette Marfa', 25, 'Tugas,Madridejos,Cebu', 36457868, '15', 25, 'Tugas,Madridejos,Cebu', 436375778, 'suay sa kwarta', '', 'Pending', 'Crossing Tugas', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(47, '2022', '2022-04-19', 'Arellano, Megmeg Maru', 20, 'Tugas,Madridejos,Cebu', 43636576, '28', 23, 'Tugas,Madridejos,Cebu', 64456474, 'away mag utod', '', 'Pending', 'Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(48, '2022', '2022-04-19', 'Gila, Mark Sevilleno', 32, 'Tugas,Madridejos,Cebu', 2147483647, '22', 28, 'Tugas,Madridejos,Cebu', 2147483647, 'suay sa kwarta', '', 'Solved', 'Crossing Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(49, '2022', '2022-04-19', 'Valirio, Jesa Lawan', 42, 'Tugas,Madridejos,Cebu', 2147483647, '30', 36, 'Tugas,Madridejos,Cebu', 2147483647, 'away sa yuta', '', 'Unsolved', 'Tugas', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(50, '2022', '2022-04-19', 'Sevilleno, Peter Mansueto', 37, 'Tugas,Madridejos,Cebu', 2147483647, '66', 34, 'Tugas,Madridejos,Cebu', 2147483647, 'away sa kabit', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(51, '2022', '2022-04-19', 'Bacolod, Pearl Milan', 54, 'Tugas,Madridejos,Cebu', 2147483647, '55', 48, 'Tugas,Madridejos,Cebu', 2147483647, 'away sa yuta', '', 'Unsolved', 'Crossing Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(52, '2022', '2022-04-19', 'De Jesus, Ella Jane Bacolod', 36, 'Tugas,Madridejos,Cebu', 2147483647, '64', 29, 'Tugas,Madridejos,Cebu', 2147483647, 'away sa kabit', '', 'Pending', 'bunakan', 'admin', 'Angelita Aropo', 0, '2024-08-08 05:08:47', NULL),
(53, '2022', '2022-04-19', 'Gido, Rico Chavez', 34, 'Tugas,Madridejos,Cebu', 2147483647, '18', 33, 'Tugas,Madridejos,Cebu', 2147483647, 'suay', '', 'Solved', 'bunakan', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(54, '2022', '2022-04-19', 'Ferrer, Antonette Marfa', 36, 'Tugas,Madridejos,Cebu', 2147483647, '27', 34, 'Tugas,Madridejos,Cebu', 2147483647, 'away mag utod', '', 'Solved', 'Tugas', 'admin', 'Felisa Chavez', 0, '2024-08-08 05:08:47', NULL),
(55, '2022', '2022-04-19', 'Quijano, Alfonso Gonjuran', 25, 'Tugas,Madridejos,Cebu', 2147483647, '65', 27, 'Tugas,Madridejos,Cebu', 2147483647, 'sumbagay', '', 'Solved', 'bunakan', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(56, '2022', '2022-04-19', 'Mabulay, Rey Lawan', 28, 'Tugas,Madridejos,Cebu', 2147483647, '17', 32, 'Tugas,Madridejos,Cebu', 2147483647, 'sumbagay', '', 'Pending', 'Crossing Tugas', 'admin', 'Ponciano Balili', 0, '2024-08-08 05:08:47', NULL),
(57, '2022', '2022-04-19', 'Dela Cruz , Edi Aropo', 35, 'Tugas,Madridejos,Cebu', 2147483647, '23', 38, 'Tugas,Madridejos,Cebu', 2147483647, 'suay', '', 'Solved', 'Crossing Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(58, '2022', '2022-04-19', 'Arellano, Megmeg Maru', 27, 'Tugas,Madridejos,Cebu', 3434657, '21', 24, 'Tugas,Madridejos,Cebu', 47648648, 'away sa kabit', '', 'Pending', 'Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(59, '2022', '2022-04-27', 'Cueva, Jason Maru', 21, 'Tugas,Madridejos,Cebu', 26716726, '29', 21, 'Tugas,Madridejos,Cebu', 17627218, 'Bayad sa utang', '', 'Pending', 'Tugas', 'admin', 'Serafin Descartin', 0, '2024-08-08 05:08:47', NULL),
(60, '2022', '2022-04-29', 'Marfa, Jose Quijano', 43, 'Tugas,Madridejos,Cebu', 90933, '28', 20, 'Tugas,Madridejos,Cebu', 390343, 'Suay sa right way', '', 'Unsolved', 'Tugas', 'admin', 'Anecito Bacolod', 0, '2024-08-08 05:08:47', NULL),
(61, '2024', '2024-08-12', 'Zaspa , Rosalie Batindaan', 23, 'fdsfsd', 2147483647, '84', 33, 'sdfsdfds', 2147483647, 'sdfsdfsd', '', 'Pending', 'dsfdsfs', 'admin@gmail.com', 'Angelita Aropo', 0, '2024-08-11 16:52:48', 'Tarong');

-- --------------------------------------------------------

--
-- Table structure for table `tblclearance`
--

CREATE TABLE `tblclearance` (
  `id` int(11) NOT NULL,
  `clearanceNo` int(11) NOT NULL,
  `residentid` int(11) NOT NULL,
  `findings` text NOT NULL,
  `Clearance` text NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `barangay` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclearance`
--

INSERT INTO `tblclearance` (`id`, `clearanceNo`, `residentid`, `findings`, `Clearance`, `orNo`, `samount`, `dateRecorded`, `recordedBy`, `status`, `isRead`, `date_created`, `barangay`) VALUES
(8, 0, 83, '', 'Employment', 565678, 130, '2022-01-20', 'User1', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(9, 0, 84, '', 'Indigency\r\n\r\n', 1235, 130, '2022-01-22', 'admin', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(49, 0, 87, '', 'Indigency\r\n', 1134, 80, '2021-12-16', 'Nadnad', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(50, 0, 88, '', 'Barangay Indigency', 0, 0, '2021-12-17', 'Jose', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(58, 0, 85, '', 'Barangay Indigency', 0, 0, '2022-03-29', 'admin', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(61, 0, 19, '', 'Barangay Indigency', 0, 0, '2022-03-29', 'admin', 'Approved', 0, '2024-08-08 05:08:59', NULL),
(62, 0, 31, '', 'Barangay Indigency', 0, 0, '2022-03-29', 'admin', 'Approved', 0, '2024-08-08 05:08:59', 'Tarong'),
(111, 0, 26, 'Duplication Request', 'Police Clearance', 0, 0, '2022-04-25', 'Megmeg', 'Disapproved', 0, '2024-08-08 05:08:59', 'Tarong'),
(114, 0, 43, 'Duplication of Clearance', 'Loan', 0, 0, '2022-04-26', 'Josephine', 'Disapproved', 0, '2024-08-08 05:08:59', NULL),
(146, 0, 18, '', 'Employment', 0, 0, '2022-04-27', 'Mark', 'New', 0, '2024-08-08 05:08:59', NULL),
(147, 0, 33, '', 'Police Clearance', 0, 0, '2022-04-27', 'Arnie', 'New', 0, '2024-08-08 05:08:59', NULL),
(148, 0, 33, '', 'Employment', 0, 0, '2022-04-27', 'Arnie', 'New', 0, '2024-08-08 05:08:59', NULL),
(149, 0, 30, '', 'Loan', 0, 0, '2022-04-27', 'Alicia', 'New', 0, '2024-08-08 05:08:59', NULL),
(150, 0, 30, '', 'Employment', 0, 0, '2022-04-27', 'Alicia', 'New', 0, '2024-08-08 05:08:59', NULL),
(151, 0, 36, '', 'Employment', 0, 0, '2022-04-27', 'Red ', 'New', 0, '2024-08-08 05:08:59', NULL),
(152, 0, 36, '', 'Police Clearance', 0, 0, '2022-04-27', 'Red ', 'New', 0, '2024-08-08 05:08:59', 'Tarong');

-- --------------------------------------------------------

--
-- Table structure for table `tblhousehold`
--

CREATE TABLE `tblhousehold` (
  `id` int(11) NOT NULL,
  `householdno` int(11) NOT NULL,
  `zone` varchar(11) NOT NULL,
  `totalhouseholdmembers` int(2) NOT NULL,
  `headoffamily` varchar(100) NOT NULL,
  `barangay` text DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblhousehold`
--

INSERT INTO `tblhousehold` (`id`, `householdno`, `zone`, `totalhouseholdmembers`, `headoffamily`, `barangay`, `deleted`, `date_created`) VALUES
(8, 7, 'Rosas', 0, '24', NULL, 0, '2024-08-08 05:09:13'),
(10, 2, 'Rosas', 0, '33', NULL, 0, '2024-08-08 05:09:13'),
(11, 5, 'Kumintang', 0, '35', NULL, 0, '2024-08-08 05:09:13'),
(12, 6, ' Bombil', 0, '22', NULL, 0, '2024-08-08 05:09:13'),
(13, 8, 'Rosas', 0, '25', NULL, 0, '2024-08-08 05:09:13'),
(14, 9, 'Rosas', 0, '27', NULL, 0, '2024-08-08 05:09:13'),
(15, 10, 'Bombil', 0, '19', NULL, 0, '2024-08-08 05:09:13'),
(16, 11, 'Rosas', 0, '31', NULL, 0, '2024-08-08 05:09:13'),
(17, 12, 'Rosas', 0, '32', NULL, 0, '2024-08-08 05:09:13'),
(18, 13, 'Santan', 0, '69', NULL, 0, '2024-08-08 05:09:13'),
(19, 14, 'Rosas', 0, '26', NULL, 0, '2024-08-08 05:09:13'),
(20, 15, 'Rosas', 0, '33', NULL, 0, '2024-08-08 05:09:13'),
(21, 16, 'Santan', 0, '47', NULL, 0, '2024-08-08 05:09:13'),
(22, 1, '', 2, '88', NULL, 0, '2024-08-08 05:09:13'),
(23, 1, 'Bombil', 0, '88', 'Tarong', 0, '2024-08-13 02:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `action` text NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbllogs`
--

INSERT INTO `tbllogs` (`id`, `user`, `logdate`, `action`, `deleted`) VALUES
(2, 'asd', '2017-01-04 00:00:00', 'Added Resident namedjayjay, asd asd', 0),
(3, 'asd', '2017-01-04 19:13:40', 'Update Resident named Sample1, User1 Brgy1', 0),
(4, 'sad', '2017-01-05 13:22:10', 'Update Official named eliezer a. vacalares, jr.', 0),
(7, 'sad', '2017-01-05 13:54:40', 'Update Household Number 1', 0),
(8, 'sad', '2017-01-05 14:00:08', 'Update Blotter Request sda, as das', 0),
(9, 'sad', '2017-01-05 14:15:39', 'Update Clearance with clearance number of 123131', 0),
(10, 'sad', '2017-01-05 14:25:03', 'Update Permit with business name of asda', 0),
(11, 'sad', '2017-01-05 14:25:25', 'Update Resident named Sample1, User1 Brgy1', 0),
(12, 'Administrator', '2017-01-24 16:32:40', 'Added Permit with business name of hahaha', 0),
(13, 'Administrator', '2017-01-24 16:35:41', 'Added Clearance with clearance number of 123', 0),
(14, 'Administrator', '2017-01-24 18:43:35', 'Added Activity sad', 0),
(15, 'Administrator', '2017-01-24 18:45:49', 'Added Activity qwe', 0),
(16, 'Administrator', '2017-01-24 18:46:20', 'Added Activity ss', 0),
(17, 'Administrator', '2017-01-24 18:47:39', 'Added Activity e', 0),
(18, 'Administrator', '2017-01-24 18:55:20', 'Added Activity activity', 0),
(19, 'Administrator', '2017-01-24 18:58:23', 'Added Activity Activity', 0),
(20, 'Administrator', '2017-01-24 19:00:07', 'Added Activity activity', 0),
(21, 'Administrator', '2017-01-24 19:02:32', 'Added Activity Activity', 0),
(22, 'Administrator', '2017-01-24 19:04:54', 'Added Activity activity', 0),
(23, 'Administrator', '2017-01-24 19:08:40', 'Update Activity activity', 0),
(24, 'Administrator', '2017-01-27 23:23:40', 'Added Activity teets', 0),
(25, 'Administrator', '2017-01-27 23:24:14', 'Update Resident named Sample1, User1 Brgy1', 0),
(26, 'Administrator', '2017-01-27 23:25:10', 'Update Resident named sda, as das', 0),
(27, 'Administrator', '2017-01-30 10:45:13', 'Added Resident named 2, 2 2', 0),
(28, 'Administrator', '2017-01-30 10:45:54', 'Added Resident named 2, 2 2', 0),
(29, 'Administrator', '2017-02-06 08:58:23', 'Update Resident named sda, as das', 0),
(30, 'Administrator', '2017-02-06 09:00:14', 'Update Resident named sda, as das', 0),
(31, 'Administrator', '2017-02-06 09:03:57', 'Added Household Number 2', 0),
(32, 'Administrator', '2017-02-06 09:04:25', 'Added Household Number 2', 0),
(33, 'Administrator', '2021-11-27 18:48:05', 'Update Official named Chavez, Alen Gido', 0),
(34, 'Administrator', '2021-11-27 18:56:34', 'Added Official named Masuangat Ian Anthony', 0),
(35, 'Administrator', '2021-11-27 19:11:17', 'Added Resident named P., Bacolod Ronnel', 0),
(36, 'Administrator', '2021-11-27 19:14:45', 'Added Permit with business name of sira-sira store', 0),
(37, 'Administrator', '2021-11-27 19:16:45', 'Added Clearance with clearance number of ', 0),
(38, 'Administrator', '2021-11-27 19:58:52', 'Update Official named Marfa Alicia M.', 0),
(39, 'Administrator', '2021-11-27 19:59:11', 'Update Official named Rebusit, Gomer', 0),
(40, 'Administrator', '2021-11-27 19:59:37', 'Update Official named Tayactac, Marisa', 0),
(41, 'Administrator', '2021-11-27 20:00:24', 'Update Official named Fernandez Gina ', 0),
(42, 'Administrator', '2021-11-27 20:01:04', 'Update Official named Batasin-in Brendo', 0),
(43, 'Administrator', '2021-11-27 20:01:28', 'Update Official named Chavez, Evelyn', 0),
(44, 'Administrator', '2021-11-27 20:01:56', 'Update Official named Potayre, Roberto', 0),
(45, 'Administrator', '2021-11-27 20:02:18', 'Update Official named Marfa, Alicia M.', 0),
(46, 'Administrator', '2021-11-27 20:02:31', 'Update Official named Fernandez, Gina ', 0),
(47, 'Administrator', '2021-11-27 20:02:50', 'Update Official named Batasin-in, Brendo', 0),
(48, 'Administrator', '2021-11-27 20:03:03', 'Update Official named Masuangat, Ian Anthony', 0),
(49, 'Administrator', '2021-11-27 20:19:11', 'Added Household Number 3', 0),
(50, 'Administrator', '2021-11-27 20:20:18', 'Added Permit with business name of MotorParts', 0),
(51, 'Administrator', '2021-11-27 20:21:28', 'Added Blotter Request by P., Bacolod Ronnel', 0),
(52, 'Administrator', '2021-11-27 21:27:37', 'Update Clearance with clearance number of ', 0),
(53, 'Administrator', '2021-11-27 21:28:14', 'Update Clearance with clearance number of ', 0),
(54, 'Administrator', '2021-11-27 21:31:40', 'Added Clearance with clearance number of ', 0),
(55, 'Administrator', '2021-11-27 21:32:43', 'Added Clearance with clearance number of ', 0),
(56, 'Administrator', '2021-11-27 21:33:20', 'Update Clearance with clearance number of ', 0),
(57, 'Administrator', '2021-11-27 21:37:10', 'Added Clearance with clearance number of ', 0),
(58, 'Administrator', '2021-11-27 22:02:44', 'Added Clearance with clearance number of ', 0),
(59, 'Administrator', '2021-11-27 22:47:51', 'Update Clearance with clearance number of ', 0),
(60, 'Administrator', '2021-11-27 22:48:02', 'Update Clearance with clearance number of ', 0),
(61, 'Administrator', '2021-11-27 22:48:10', 'Update Clearance with clearance number of ', 0),
(62, 'Administrator', '2021-11-27 22:48:18', 'Update Clearance with clearance number of ', 0),
(63, 'Administrator', '2021-11-27 22:48:26', 'Update Clearance with clearance number of ', 0),
(64, 'Administrator', '2021-11-27 23:13:19', 'Added Clearance with clearance number of ', 0),
(65, 'Administrator', '2021-11-28 11:03:26', 'Added Clearance with clearance number of ', 0),
(66, 'Administrator', '2021-11-28 12:32:44', 'Update Clearance with clearance number of ', 0),
(67, 'Administrator', '2021-11-28 12:32:58', 'Update Clearance with clearance number of ', 0),
(68, 'Administrator', '2021-11-28 12:33:22', 'Update Clearance with clearance number of ', 0),
(69, 'Administrator', '2021-11-28 12:35:22', 'Update Clearance with clearance number of ', 0),
(70, 'Administrator', '2021-11-28 12:35:34', 'Update Clearance with clearance number of ', 0),
(71, 'Administrator', '2021-11-28 12:35:43', 'Update Clearance with clearance number of ', 0),
(72, 'Administrator', '2021-11-28 15:13:44', 'Added Resident named Torro, Mark Gila', 0),
(73, 'Administrator', '2021-11-28 15:15:04', 'Added Household Number 4', 0),
(74, 'Administrator', '2021-12-01 18:04:29', 'Added Household Number ', 0),
(75, 'Administrator', '2021-12-01 18:07:06', 'Added Household Number 2', 0),
(76, 'Administrator', '2021-12-01 18:08:01', 'Added Official named ', 0),
(77, 'Administrator', '2021-12-02 07:52:47', 'Added Clearance with clearance number of ', 0),
(78, 'Administrator', '2021-12-02 07:57:22', 'Added Clearance with clearance number of ', 0),
(79, 'Administrator', '2021-12-02 08:38:24', 'Added Clearance with clearance number of ', 0),
(80, 'Administrator', '2021-12-02 08:39:54', 'Added Clearance with clearance number of ', 0),
(81, 'Administrator', '2021-12-02 08:41:00', 'Added Clearance with clearance number of ', 0),
(82, 'Administrator', '2021-12-02 09:09:11', 'Added Clearance with clearance number of ', 0),
(83, 'Administrator', '2021-12-02 09:12:08', 'Added Clearance with clearance number of ', 0),
(84, 'Administrator', '2021-12-02 09:16:32', 'Added Clearance with clearance number of ', 0),
(85, 'Administrator', '2021-12-02 09:17:41', 'Added Clearance with clearance number of ', 0),
(86, 'Administrator', '2021-12-02 09:19:46', 'Added Clearance with clearance number of ', 0),
(87, 'Administrator', '2021-12-02 09:26:15', 'Update Clearance with clearance number of ', 0),
(88, 'Administrator', '2021-12-02 09:44:37', 'Added Blotter Request by ', 0),
(89, 'Administrator', '2021-12-02 10:25:24', 'Added Blotter Request by ', 0),
(90, 'Administrator', '2021-12-02 10:32:08', 'Added Blotter Request by ', 0),
(91, 'Administrator', '2021-12-02 12:59:06', 'Added Zone number ', 0),
(92, 'Administrator', '2021-12-02 15:05:32', 'Added Staff with name of Marfa, Alicia M.', 0),
(93, 'Administrator', '2021-12-11 09:22:59', 'Added Household Number 2', 0),
(94, 'Administrator', '2021-12-11 09:23:44', 'Added Household Number 1', 0),
(95, 'Administrator', '2021-12-11 09:26:34', 'Update Resident named sda, as das', 0),
(96, 'Administrator', '2021-12-11 17:03:29', 'Added Resident named Quijano, Alfonso Gonjuran', 0),
(97, 'Administrator', '2021-12-11 17:06:50', 'Added Resident named Quijano, Nadnad Gonjuran', 0),
(98, 'Administrator', '2021-12-11 17:10:13', 'Added Resident named Marfa, Niel Maru', 0),
(99, 'Administrator', '2021-12-11 17:12:17', 'Added Staff with name of Chavez, Alen G.', 0),
(100, 'Administrator', '2021-12-11 17:13:41', 'Added Staff with name of Rebusit, Gomer', 0),
(101, 'Administrator', '2021-12-11 17:14:41', 'Added Staff with name of Chavez,Evilyn', 0),
(102, 'Administrator', '2021-12-11 17:15:31', 'Added Staff with name of Tayactac,Marisa', 0),
(103, 'Administrator', '2021-12-11 17:17:42', 'Update Staff with name of Chavez, Alen G.', 0),
(104, 'Administrator', '2021-12-11 17:21:44', 'Update Staff with name of Chavez, Alen G.', 0),
(105, 'Administrator', '2021-12-11 17:22:12', 'Update Blotter Request by sda, as das', 0),
(106, 'Administrator', '2021-12-16 23:52:04', 'Added Resident named fslj, fkajsk jkjk', 0),
(107, 'Administrator', '2021-12-16 23:52:25', 'Update Resident named Quijano, Nadnad Gonjuran', 0),
(108, 'Administrator', '2021-12-16 23:55:38', 'Added Resident named Marfa, Jose Quijano', 0),
(109, 'Administrator', '2021-12-16 23:58:53', 'Update Resident named fslj, fkajsk jkjk', 0),
(110, 'Administrator', '2021-12-16 23:59:28', 'Update Resident named Marfa, Jose Quijano', 0),
(111, 'Administrator', '2021-12-17 00:00:25', 'Update Resident named Marfa, Jose Quijano', 0),
(112, 'Administrator', '2021-12-17 00:07:42', 'Update Resident named a, asd das', 0),
(113, 'Administrator', '2021-12-17 00:14:44', 'Update Resident named Quijano, Alfonso Gonjuran', 0),
(114, 'Administrator', '2021-12-17 00:28:53', 'Update Resident named fslj, fkajsk jkjk', 0),
(115, 'Administrator', '2021-12-17 00:29:26', 'Update Resident named a, asd das', 0),
(116, 'Administrator', '2021-12-17 00:30:21', 'Update Resident named Marfa, Jose Quijano', 0),
(117, 'Administrator', '2021-12-17 19:17:14', 'Added Resident named Ferrer, Antonette Marfa', 0),
(118, 'Administrator', '2021-12-17 19:17:47', 'Added Resident named Ferrer, Antonette Marfa', 0),
(119, 'Administrator', '2021-12-17 19:23:08', 'Added Resident named Ferrer, Antonette Marfa', 0),
(120, 'Administrator', '2021-12-17 19:27:21', 'Added Resident named Ferrer, Antonette Marfa', 0),
(121, 'Administrator', '2021-12-17 19:32:17', 'Added Resident named Ferrer, Antonette Marfa', 0),
(122, 'Administrator', '2021-12-17 19:32:51', 'Update Resident named a, asd das', 0),
(123, 'Administrator', '2021-12-17 19:34:27', 'Added Resident named fakj, fjkajk jkj', 0),
(124, 'Administrator', '2021-12-17 19:35:29', 'Added Resident named fakj, fjkajk jkj', 0),
(125, 'Administrator', '2021-12-17 19:39:42', 'Added Resident named Ferrer, Antonette Marfa', 0),
(126, 'Administrator', '2021-12-17 19:44:13', 'Added Resident named Ferrer, Antonette Marfa', 0),
(127, 'Administrator', '2021-12-17 19:51:46', 'Added Resident named Oflas , Jenevev Negro', 0),
(128, 'Administrator', '2021-12-17 19:52:48', 'Added Household Number 7', 0),
(129, 'Administrator', '2021-12-17 19:56:19', 'Added Resident named Arellano, Megmeg Maru', 0),
(130, 'Administrator', '2021-12-18 18:31:43', 'Added Zone number 5', 0),
(131, 'Administrator', '2021-12-18 18:53:19', 'Added Blotter Request by Quijano, Alfonso Gonjuran', 0),
(132, 'Administrator', '2021-12-18 18:56:09', 'Added Resident named Ending , Rica Mae Arellano', 0),
(133, 'Administrator', '2021-12-18 19:00:17', 'Added Resident named Arellano, Edison Maru', 0),
(134, 'Administrator', '2022-01-07 16:23:45', 'Update Blotter Request by P., Bacolod Ronnel', 0),
(135, 'Administrator', '2022-02-02 20:44:12', 'Update Activity vc', 0),
(136, 'Administrator', '2022-02-02 20:52:55', 'Update Official named Hon. Alen G. Chavez', 0),
(137, 'Administrator', '2022-02-02 20:54:19', 'Update Official named Hon. Alicia Marfa', 0),
(138, 'Administrator', '2022-02-02 20:55:49', 'Update Official named Hon. Gomer Rebusit', 0),
(139, 'Administrator', '2022-02-02 20:56:27', 'Update Official named Hon. Marissa Tayactac', 0),
(140, 'Administrator', '2022-02-02 20:57:35', 'Update Official named Hon. Gina Fernandez', 0),
(141, 'Administrator', '2022-02-02 20:58:20', 'Update Official named Hon. Brendo Batasin-in', 0),
(142, 'Administrator', '2022-02-02 20:59:05', 'Update Official named Hon. Evelyn Chavez', 0),
(143, 'Administrator', '2022-02-02 20:59:48', 'Update Official named Hon. Roberto Potayre', 0),
(144, 'Administrator', '2022-02-02 21:00:40', 'Update Official named Hon. Ian Anthony Masuangat', 0),
(145, 'Administrator', '2022-02-02 21:01:07', 'Update Official named Angel Taves', 0),
(146, 'Administrator', '2022-02-02 21:02:18', 'Update Official named Renato Rossell', 0),
(147, 'Administrator', '2022-02-02 21:02:55', 'Update Official named Renato Rossell', 0),
(148, 'Administrator', '2022-02-02 21:05:15', 'Update Staff with name of Hon.Alicia Marfa ', 0),
(149, 'Administrator', '2022-02-02 21:15:31', 'Update Staff with name of Marfa, Alicia M.', 0),
(150, 'Administrator', '2022-02-08 15:04:55', 'Update Blotter Request by sda, as das', 0),
(151, 'Administrator', '2022-02-08 15:05:11', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(152, 'Administrator', '2022-02-08 15:06:48', 'Update Resident named Torro, Mark Gila', 0),
(153, 'Administrator', '2022-02-08 15:07:09', 'Update Resident named Quijano, Nadnad Gonjuran', 0),
(154, 'Administrator', '2022-02-22 23:56:11', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(155, 'Administrator', '2022-02-23 00:11:39', 'Added Blotter Request by Marfa, Niel Maru', 0),
(156, 'Administrator', '2022-02-23 00:12:18', 'Update Blotter Request by Marfa, Niel Maru', 0),
(157, 'Administrator', '2022-02-23 01:13:43', 'Update Activity vc', 0),
(158, 'Administrator', '2022-02-23 01:13:58', 'Update Activity teets', 0),
(159, 'Administrator', '2022-02-23 18:17:45', 'Added Blotter Request by Torro, Mark Gila', 0),
(160, 'Administrator', '2022-03-01 09:46:05', 'Added Permit with business name of Jose Sari-sari', 0),
(161, 'Administrator', '2022-03-01 09:55:09', 'Update Resident named Arellano, Megmeg Maru', 0),
(162, 'Administrator', '2022-03-01 09:59:39', 'Added Clearance with clearance number of ', 0),
(163, 'Administrator', '2022-03-01 10:00:30', 'Added Permit with business name of sdwd', 0),
(164, 'Administrator', '2022-03-01 10:01:18', 'Added Permit with business name of asdr', 0),
(165, 'Administrator', '2022-03-01 10:01:51', 'Added Permit with business name of asdfe', 0),
(166, 'Administrator', '2022-03-01 10:05:38', 'Added Resident named Cahutay, Mirasol Bautro', 0),
(167, 'Administrator', '2022-03-02 11:54:44', 'Added Clearance with clearance number of ', 0),
(168, 'Administrator', '2022-03-08 18:35:36', 'Update Official named Hon. Alen G. Chavez', 0),
(169, 'Administrator', '2022-03-08 18:36:53', 'Update Official named Hon. Alicia Marfa', 0),
(170, 'Administrator', '2022-03-08 18:37:26', 'Update Official named Hon. Gomer Rebusit', 0),
(171, 'Administrator', '2022-03-08 18:38:07', 'Update Official named Hon. Marissa Tayactac', 0),
(172, 'Administrator', '2022-03-08 18:38:41', 'Update Official named Hon. Gina Fernandez', 0),
(173, 'Administrator', '2022-03-08 18:38:52', 'Update Official named Hon. Gomer Rebusit', 0),
(174, 'Administrator', '2022-03-08 18:44:22', 'Update Official named Hon. Brendo Batasin-in', 0),
(175, 'Administrator', '2022-03-08 18:44:51', 'Update Official named Hon. Evelyn Chavez', 0),
(176, 'Administrator', '2022-03-08 18:45:07', 'Update Official named Hon. Evelyn Chavez', 0),
(177, 'Administrator', '2022-03-08 18:45:40', 'Update Official named Hon. Roberto Potayre', 0),
(178, 'Administrator', '2022-03-08 18:46:24', 'Update Official named Hon. Ian Anthony Masuangat', 0),
(179, 'Administrator', '2022-03-08 18:46:54', 'Update Official named Renato Rossell', 0),
(180, 'Administrator', '2022-03-08 18:47:06', 'Update Official named Hon. Gina Fernandez', 0),
(181, 'Administrator', '2022-03-08 18:47:16', 'Update Official named Hon. Brendo Batasin-in', 0),
(182, 'Administrator', '2022-03-08 18:47:31', 'Update Official named Hon. Evelyn Chavez', 0),
(183, 'Administrator', '2022-03-08 18:47:59', 'Update Official named Angel Taves', 0),
(184, 'Administrator', '2022-03-08 19:35:27', 'Added Resident named Marfa, Alicia Maru', 0),
(185, 'Administrator', '2022-03-08 19:38:44', 'Added Resident named Jose , Quijano Marfa', 0),
(186, 'Administrator', '2022-03-08 19:39:12', 'Update Resident named Marfa, Alicia Maru', 0),
(187, 'Administrator', '2022-03-08 19:39:34', 'Update Resident named Marfa, Alicia Maru', 0),
(188, 'Administrator', '2022-03-08 19:40:09', 'Update Resident named Joe, Quijano Marfa', 0),
(189, 'Administrator', '2022-03-08 19:40:25', 'Update Resident named Marfa, Jose Quijano', 0),
(190, 'Administrator', '2022-03-08 19:40:38', 'Update Resident named Arellano, Edison Maru', 0),
(191, 'Administrator', '2022-03-08 19:40:52', 'Update Resident named Cahutay, Mirasol Bautro', 0),
(192, 'Administrator', '2022-03-08 19:41:29', 'Update Resident named P., Bacolod Ronnel', 0),
(193, 'Administrator', '2022-03-08 19:53:57', 'Added Resident named Arellano, Ma. Tesse Maru', 0),
(194, 'Administrator', '2022-03-08 20:00:57', 'Update Resident named Arellano, Edison Maru', 0),
(195, 'Administrator', '2022-03-08 20:12:44', 'Added Blotter Request by Marfa, Jose Quijano', 0),
(196, 'Administrator', '2022-03-08 20:12:54', 'Update Blotter Request by Marfa, Jose Quijano', 0),
(197, 'Administrator', '2022-03-08 20:13:39', 'Added Blotter Request by jay, dsf asdf', 0),
(198, 'Administrator', '2022-03-08 20:14:57', 'Added Blotter Request by Quijano, Alfonso Gonjuran', 0),
(199, 'Administrator', '2022-03-08 20:22:20', 'Added Activity Vacination Drive', 0),
(200, 'Administrator', '2022-03-08 20:23:49', 'Added Activity Monthly immunization', 0),
(201, 'Administrator', '2022-03-11 00:10:35', 'Added Resident named Oflas, Arnie Maru', 0),
(202, 'Administrator', '2022-03-11 00:11:39', 'Added Permit with business name of MotorParts', 0),
(203, 'Administrator', '2022-03-11 00:12:42', 'Added Clearance with clearance number of ', 0),
(204, 'Administrator', '2022-03-14 14:06:45', 'Added Resident named Oflas , aladin Maru', 0),
(205, 'Administrator', '2022-03-14 14:07:40', 'Update Resident named Chavez, Alana Gido', 0),
(206, 'Administrator', '2022-03-14 14:08:29', 'Update Resident named Gido, Rico Chavez', 0),
(207, 'Administrator', '2022-03-14 14:09:31', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(208, 'Administrator', '2022-03-14 14:10:23', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(209, 'Administrator', '2022-03-18 13:53:12', 'Added Blotter Request by Batasin-in , Jieda Bautro', 0),
(210, 'Administrator', '2022-03-18 13:56:28', 'Added Resident named Bali-os , Burdogs Arellano', 0),
(211, 'Administrator', '2022-03-27 20:22:31', 'Update Resident named Chavez, Alana Gido', 0),
(212, 'Administrator', '2022-03-29 21:51:51', 'Added Permit with business name of Rico sari', 0),
(213, 'Administrator', '2022-03-29 21:52:36', 'Added Permit with business name of Gido Meat shop', 0),
(214, 'Administrator', '2022-03-29 21:53:12', 'Added Permit with business name of Tailor ', 0),
(215, 'Administrator', '2022-03-29 21:53:49', 'Added Permit with business name of MotorVlog', 0),
(216, 'Administrator', '2022-03-29 21:54:22', 'Added Permit with business name of Vlogs', 0),
(217, 'Administrator', '2022-03-29 21:54:55', 'Added Permit with business name of HotCake', 0),
(218, 'Administrator', '2022-03-29 21:55:32', 'Added Permit with business name of Moto stop', 0),
(219, 'Administrator', '2022-03-29 21:56:23', 'Added Permit with business name of Ukay-ukay', 0),
(220, 'Administrator', '2022-03-29 21:56:53', 'Added Permit with business name of Alice Store', 0),
(221, 'Administrator', '2022-03-29 21:57:33', 'Added Permit with business name of karenderya store', 0),
(222, 'Administrator', '2022-03-29 21:58:08', 'Added Permit with business name of BBQ', 0),
(223, 'Administrator', '2022-03-29 21:59:03', 'Added Permit with business name of Moto lite', 0),
(224, 'Administrator', '2022-03-29 21:59:33', 'Added Permit with business name of Vulcanizing shop', 0),
(225, 'Administrator', '2022-03-29 22:00:04', 'Added Permit with business name of Coffee shop', 0),
(226, 'Administrator', '2022-03-29 22:01:16', 'Added Blotter Request by Arellano, Edison Maru', 0),
(227, 'Administrator', '2022-03-29 22:02:26', 'Added Blotter Request by Arellano, Megmeg Maru', 0),
(228, 'Administrator', '2022-03-29 22:03:25', 'Added Blotter Request by Cahutay, Mirasol Bautro', 0),
(229, 'Administrator', '2022-03-29 22:04:28', 'Added Blotter Request by Ferrer, Antonette Marfa', 0),
(230, 'Administrator', '2022-03-29 22:05:15', 'Added Clearance with clearance number of ', 0),
(231, 'Administrator', '2022-03-29 22:05:36', 'Added Clearance with clearance number of ', 0),
(232, 'Administrator', '2022-03-29 22:06:02', 'Added Clearance with clearance number of ', 0),
(233, 'Administrator', '2022-03-29 22:06:27', 'Added Clearance with clearance number of ', 0),
(234, 'Administrator', '2022-03-29 22:06:52', 'Added Clearance with clearance number of ', 0),
(235, 'Administrator', '2022-03-29 22:07:12', 'Added Clearance with clearance number of ', 0),
(236, 'Administrator', '2022-03-29 22:07:45', 'Added Clearance with clearance number of ', 0),
(237, 'Administrator', '2022-03-29 22:08:14', 'Added Clearance with clearance number of ', 0),
(238, 'Administrator', '2022-03-29 22:08:38', 'Added Clearance with clearance number of ', 0),
(239, 'Administrator', '2022-03-29 22:09:07', 'Added Clearance with clearance number of ', 0),
(240, 'Administrator', '2022-03-29 22:45:43', 'Added Activity Fiesta of San Vicente Ferrer', 0),
(241, 'Administrator', '2022-03-29 22:47:13', 'Added Zone number Purok Rosas 2', 0),
(242, 'Administrator', '2022-03-29 22:48:11', 'Added Zone number Purok Rosas 2', 0),
(243, 'Administrator', '2022-03-29 22:48:41', 'Added Zone number 1', 0),
(244, 'Administrator', '2022-03-29 22:49:39', 'Added Zone number 21', 0),
(245, 'Administrator', '2022-03-29 22:50:36', 'Added Zone number 21', 0),
(246, 'Administrator', '2022-03-29 22:51:21', 'Added Zone number 4', 0),
(247, 'Administrator', '2022-03-29 22:51:46', 'Added Zone number 7', 0),
(248, 'Administrator', '2022-03-29 22:52:13', 'Added Zone number 12', 0),
(249, 'Administrator', '2022-03-29 22:53:02', 'Added Permit with business name of karenderya ', 0),
(250, 'Administrator', '2022-03-29 22:54:11', 'Added Blotter Request by Ending , Rica Mae Arellano', 0),
(251, 'Administrator', '2022-03-29 22:54:43', 'Added Zone number 20', 0),
(252, 'Administrator', '2022-03-29 22:56:49', 'Update Resident named Bali-os , Burdogs Arellano', 0),
(253, 'Administrator', '2022-03-29 22:57:18', 'Update Resident named Oflas , Jenevev Negro', 0),
(254, 'Administrator', '2022-03-29 22:57:41', 'Update Resident named Oflas , aladin Maru', 0),
(255, 'Administrator', '2022-03-30 18:56:03', 'Added Zone number 6', 0),
(256, 'Administrator', '2022-03-31 11:26:31', 'Added Zone number 21', 0),
(257, 'Administrator', '2022-03-31 22:34:15', 'Added Zone number 2', 0),
(258, 'Administrator', '2022-04-04 08:47:06', 'Update Resident named Chavez, Alana Gido', 0),
(259, 'Administrator', '2022-04-04 08:57:08', 'Added Clearance with clearance number of ', 0),
(260, 'Administrator', '2022-04-04 09:16:51', 'Added Permit with business name of Comlab', 0),
(261, 'Administrator', '2022-04-04 14:00:37', 'Update Clearance with clearance number of ', 0),
(262, 'Administrator', '2022-04-04 14:00:46', 'Update Clearance with clearance number of ', 0),
(263, 'Administrator', '2022-04-04 14:01:18', 'Update Clearance with clearance number of ', 0),
(264, 'Administrator', '2022-04-04 14:01:30', 'Update Clearance with clearance number of ', 0),
(265, 'Administrator', '2022-04-04 14:01:41', 'Update Clearance with clearance number of ', 0),
(266, 'Administrator', '2022-04-04 14:01:56', 'Update Clearance with clearance number of ', 0),
(267, 'Administrator', '2022-04-04 14:02:44', 'Update Clearance with clearance number of ', 0),
(268, 'Administrator', '2022-04-04 14:03:44', 'Update Clearance with clearance number of ', 0),
(269, 'Administrator', '2022-04-04 14:03:57', 'Update Clearance with clearance number of ', 0),
(270, 'Administrator', '2022-04-04 14:04:21', 'Update Clearance with clearance number of ', 0),
(271, 'Administrator', '2022-04-04 14:04:30', 'Update Clearance with clearance number of ', 0),
(272, 'Administrator', '2022-04-04 15:17:14', 'Added Blotter Request by P., Bacolod Ronnel', 0),
(273, 'Administrator', '2022-04-04 15:20:14', 'Update Clearance with clearance number of ', 0),
(274, 'Administrator', '2022-04-04 15:20:30', 'Update Clearance with clearance number of ', 0),
(275, 'Administrator', '2022-04-04 15:20:51', 'Update Clearance with clearance number of ', 0),
(276, 'Administrator', '2022-04-04 15:21:22', 'Update Clearance with clearance number of ', 0),
(277, 'Administrator', '2022-04-04 15:21:43', 'Update Clearance with clearance number of ', 0),
(278, 'Administrator', '2022-04-04 15:22:10', 'Added Clearance with clearance number of ', 0),
(279, 'Administrator', '2022-04-04 15:22:34', 'Added Clearance with clearance number of ', 0),
(280, 'Administrator', '2022-04-04 15:22:50', 'Update Clearance with clearance number of ', 0),
(281, 'Administrator', '2022-04-04 15:23:05', 'Update Clearance with clearance number of ', 0),
(282, 'Administrator', '2022-04-04 15:30:51', 'Added Permit with business name of ghhg', 0),
(283, 'Administrator', '2022-04-04 15:31:32', 'Added Permit with business name of uyuuy', 0),
(284, 'Administrator', '2022-04-04 17:39:59', 'Added Blotter Request by Batasin-in , Jieda Bautro', 0),
(285, 'Administrator', '2022-04-04 18:41:48', 'Added Blotter Request by Gido, Rico Chavez', 0),
(286, 'Administrator', '2022-04-04 18:42:28', 'Update Blotter Request by Ending , Rica Mae Arellano', 0),
(287, 'Administrator', '2022-04-04 18:42:45', 'Update Blotter Request by jay, dsf asdf', 0),
(288, 'Administrator', '2022-04-04 18:53:17', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(289, 'Administrator', '2022-04-04 18:53:36', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(290, 'Administrator', '2022-04-04 18:55:57', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(291, 'Administrator', '2022-04-04 18:57:36', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(292, 'Administrator', '2022-04-04 18:58:06', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(293, 'Administrator', '2022-04-04 19:00:17', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(294, 'Administrator', '2022-04-04 19:04:17', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(295, 'Administrator', '2022-04-04 19:05:55', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(296, 'Administrator', '2022-04-04 19:07:41', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(297, 'Administrator', '2022-04-04 19:09:13', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(298, 'Administrator', '2022-04-04 19:14:23', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(299, 'Administrator', '2022-04-04 19:15:52', 'Added Blotter Request by Batasin-in , Jieda Bautro', 0),
(300, 'Administrator', '2022-04-04 19:19:15', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(301, 'Administrator', '2022-04-04 19:19:52', 'Update Blotter Request by Batasin-in , Jieda Bautro', 0),
(302, 'Administrator', '2022-04-04 19:24:12', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(303, 'Administrator', '2022-04-04 19:26:48', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(304, 'Administrator', '2022-04-04 19:33:13', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(305, 'Administrator', '2022-04-04 19:35:23', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(306, 'Administrator', '2022-04-04 19:57:36', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(307, 'Administrator', '2022-04-04 19:59:09', 'Update Blotter Request by Marfa, Niel Maru', 0),
(308, 'Administrator', '2022-04-04 19:59:18', 'Update Blotter Request by Torro, Mark Gila', 0),
(309, 'Administrator', '2022-04-04 20:05:51', 'Update Blotter Request by Marfa, Jose Quijano', 0),
(310, 'Administrator', '2022-04-04 20:06:06', 'Update Blotter Request by jay, dsf asdf', 0),
(311, 'Administrator', '2022-04-04 20:06:18', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(312, 'Administrator', '2022-04-04 20:06:35', 'Update Blotter Request by Batasin-in , Jieda Bautro', 0),
(313, 'Administrator', '2022-04-04 20:06:47', 'Update Blotter Request by Arellano, Edison Maru', 0),
(314, 'Administrator', '2022-04-04 20:06:57', 'Update Blotter Request by Arellano, Megmeg Maru', 0),
(315, 'Administrator', '2022-04-04 20:07:08', 'Update Blotter Request by Cahutay, Mirasol Bautro', 0),
(316, 'Administrator', '2022-04-04 20:07:18', 'Update Blotter Request by Ferrer, Antonette Marfa', 0),
(317, 'Administrator', '2022-04-04 20:07:29', 'Update Blotter Request by Ending , Rica Mae Arellano', 0),
(318, 'Administrator', '2022-04-04 20:07:44', 'Update Blotter Request by P., Bacolod Ronnel', 0),
(319, 'Administrator', '2022-04-04 20:07:59', 'Update Blotter Request by Gido, Rico Chavez', 0),
(320, 'Administrator', '2022-04-04 20:08:08', 'Update Blotter Request by Batasin-in , Jieda Bautro', 0),
(321, 'Administrator', '2022-04-04 20:10:01', 'Added Blotter Request by Marfa, Jose Quijano', 0),
(322, 'Administrator', '2022-04-04 20:12:54', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(323, 'Administrator', '2022-04-04 22:04:37', 'Update Permit with business name of asda', 0),
(324, 'Administrator', '2022-04-04 22:04:59', 'Update Permit with business name of 23', 0),
(325, 'Administrator', '2022-04-04 22:05:13', 'Update Permit with business name of Business ', 0),
(326, 'Administrator', '2022-04-04 22:05:28', 'Update Permit with business name of sa', 0),
(327, 'Administrator', '2022-04-04 22:12:58', 'Added Zone number 7', 0),
(328, 'Administrator', '2022-04-04 22:15:42', 'Added Zone number 7', 0),
(329, 'Administrator', '2022-04-04 22:26:13', 'Added Zone number 5', 0),
(330, 'Administrator', '2022-04-05 11:22:22', 'Update Permit with business name of sad', 0),
(331, 'Administrator', '2022-04-05 11:22:35', 'Update Permit with business name of sira-sira store', 0),
(332, 'Administrator', '2022-04-05 11:22:46', 'Update Permit with business name of MotorParts', 0),
(333, 'Administrator', '2022-04-05 11:22:57', 'Update Permit with business name of Axies Trading', 0),
(334, 'Administrator', '2022-04-05 11:23:21', 'Update Permit with business name of Nothing but you', 0),
(335, 'Administrator', '2022-04-05 11:23:38', 'Update Permit with business name of Jose Sari-sari', 0),
(336, 'Administrator', '2022-04-05 11:23:52', 'Update Permit with business name of sdwd', 0),
(337, 'Administrator', '2022-04-05 11:24:04', 'Update Permit with business name of asdr', 0),
(338, 'Administrator', '2022-04-05 11:24:16', 'Update Permit with business name of asdfe', 0),
(339, 'Administrator', '2022-04-05 11:24:30', 'Update Permit with business name of karenderya store', 0),
(340, 'Administrator', '2022-04-05 11:24:41', 'Update Permit with business name of Joe sari-sari Store', 0),
(341, 'Administrator', '2022-04-05 11:24:58', 'Update Permit with business name of son motor part', 0),
(342, 'Administrator', '2022-04-05 11:25:16', 'Update Permit with business name of MotorParts', 0),
(343, 'Administrator', '2022-04-05 11:25:34', 'Update Permit with business name of Rico sari', 0),
(344, 'Administrator', '2022-04-05 11:25:50', 'Update Permit with business name of Gido Meat shop', 0),
(345, 'Administrator', '2022-04-05 11:26:04', 'Update Permit with business name of Tailor ', 0),
(346, 'Administrator', '2022-04-05 11:26:21', 'Update Permit with business name of MotorVlog', 0),
(347, 'Administrator', '2022-04-05 11:27:58', 'Update Permit with business name of Vlogs', 0),
(348, 'Administrator', '2022-04-05 11:28:16', 'Update Permit with business name of HotCake', 0),
(349, 'Administrator', '2022-04-05 11:28:38', 'Update Permit with business name of Moto stop', 0),
(350, 'Administrator', '2022-04-05 11:28:56', 'Update Permit with business name of Ukay-ukay', 0),
(351, 'Administrator', '2022-04-05 11:29:19', 'Update Permit with business name of Alice Store', 0),
(352, 'Administrator', '2022-04-05 11:29:32', 'Update Permit with business name of karenderya store', 0),
(353, 'Administrator', '2022-04-05 11:29:47', 'Update Permit with business name of BBQ', 0),
(354, 'Administrator', '2022-04-05 11:30:02', 'Update Permit with business name of Moto lite', 0),
(355, 'Administrator', '2022-04-05 11:30:15', 'Update Permit with business name of Vulcanizing shop', 0),
(356, 'Administrator', '2022-04-05 11:30:28', 'Update Permit with business name of Coffee shop', 0),
(357, 'Administrator', '2022-04-05 11:30:51', 'Update Permit with business name of karenderya ', 0),
(358, 'Administrator', '2022-04-05 11:31:22', 'Update Permit with business name of Comlab', 0),
(359, 'Administrator', '2022-04-05 11:39:52', 'Added Resident named Dela Cruz , Red  Aropo', 0),
(360, 'Administrator', '2022-04-05 11:42:20', 'Added Resident named Dela Cruz , Edi Aropo', 0),
(361, 'Administrator', '2022-04-05 11:44:41', 'Added Resident named Dela Cruz , Fritz Aropo', 0),
(362, 'Administrator', '2022-04-05 11:46:58', 'Added Resident named Aropo, Inday Batasin-in', 0),
(363, 'Administrator', '2022-04-05 11:47:47', 'Update Resident named Aropo, Inday Batasin-in', 0),
(364, 'Administrator', '2022-04-05 11:48:05', 'Update Resident named Dela Cruz , Fritz Aropo', 0),
(365, 'Administrator', '2022-04-05 11:48:18', 'Update Resident named Dela Cruz , Red  Aropo', 0),
(366, 'Administrator', '2022-04-05 11:49:32', 'Update Resident named Dela Cruz , Fritz Aropo', 0),
(367, 'Administrator', '2022-04-05 13:20:38', 'Update Clearance with clearance number of ', 0),
(368, 'Administrator', '2022-04-05 13:20:48', 'Update Clearance with clearance number of ', 0),
(369, 'Administrator', '2022-04-05 13:22:50', 'Update Clearance with clearance number of ', 0),
(370, 'Administrator', '2022-04-05 13:23:06', 'Update Clearance with clearance number of ', 0),
(371, 'Administrator', '2022-04-05 13:23:30', 'Update Clearance with clearance number of ', 0),
(372, 'Administrator', '2022-04-05 13:23:54', 'Update Clearance with clearance number of ', 0),
(373, 'Administrator', '2022-04-05 13:24:07', 'Update Clearance with clearance number of ', 0),
(374, 'Administrator', '2022-04-05 13:24:21', 'Update Clearance with clearance number of ', 0),
(375, 'Administrator', '2022-04-05 21:36:25', 'Added Clearance with clearance number of ', 0),
(376, 'Administrator', '2022-04-05 21:36:50', 'Update Clearance with clearance number of ', 0),
(377, 'Administrator', '2022-04-05 21:37:04', 'Update Clearance with clearance number of ', 0),
(378, 'Administrator', '2022-04-05 21:46:17', 'Added Clearance with clearance number of ', 0),
(379, 'Administrator', '2022-04-05 21:46:33', 'Update Clearance with clearance number of ', 0),
(380, 'Administrator', '2022-04-05 21:49:22', 'Update Clearance with clearance number of ', 0),
(381, 'Administrator', '2022-04-05 21:52:25', 'Update Clearance with clearance number of ', 0),
(382, 'Administrator', '2022-04-05 21:52:43', 'Update Clearance with clearance number of ', 0),
(383, 'Administrator', '2022-04-05 21:52:57', 'Update Clearance with clearance number of ', 0),
(384, 'Administrator', '2022-04-05 21:53:08', 'Update Clearance with clearance number of ', 0),
(385, 'Administrator', '2022-04-05 21:53:53', 'Update Clearance with clearance number of ', 0),
(386, 'Administrator', '2022-04-05 21:54:07', 'Update Clearance with clearance number of ', 0),
(387, 'Administrator', '2022-04-05 21:54:24', 'Update Clearance with clearance number of ', 0),
(388, 'Administrator', '2022-04-05 21:55:07', 'Added Clearance with clearance number of ', 0),
(389, 'Administrator', '2022-04-05 21:57:49', 'Added Clearance with clearance number of ', 0),
(390, 'Administrator', '2022-04-05 22:10:11', 'Update Clearance with clearance number of ', 0),
(391, 'Administrator', '2022-04-05 22:10:23', 'Update Clearance with clearance number of ', 0),
(392, 'Administrator', '2022-04-05 22:10:38', 'Update Clearance with clearance number of ', 0),
(393, 'Administrator', '2022-04-05 22:11:52', 'Update Clearance with clearance number of ', 0),
(394, 'Administrator', '2022-04-05 22:13:00', 'Update Clearance with clearance number of ', 0),
(395, 'Administrator', '2022-04-05 22:13:13', 'Update Clearance with clearance number of ', 0),
(396, 'Administrator', '2022-04-05 22:13:27', 'Update Clearance with clearance number of ', 0),
(397, 'Administrator', '2022-04-05 22:13:43', 'Update Clearance with clearance number of ', 0),
(398, 'Administrator', '2022-04-05 22:14:01', 'Update Clearance with clearance number of ', 0),
(399, 'Administrator', '2022-04-05 22:14:22', 'Update Clearance with clearance number of ', 0),
(400, 'Administrator', '2022-04-05 22:14:45', 'Update Clearance with clearance number of ', 0),
(401, 'Administrator', '2022-04-05 22:15:08', 'Update Clearance with clearance number of ', 0),
(402, 'Administrator', '2022-04-05 22:15:27', 'Update Clearance with clearance number of ', 0),
(403, 'Administrator', '2022-04-05 22:15:47', 'Update Clearance with clearance number of ', 0),
(404, 'Administrator', '2022-04-05 22:16:27', 'Update Clearance with clearance number of ', 0),
(405, 'Administrator', '2022-04-05 22:16:43', 'Update Clearance with clearance number of ', 0),
(406, 'Administrator', '2022-04-05 22:17:02', 'Update Clearance with clearance number of ', 0),
(407, 'Administrator', '2022-04-05 22:17:23', 'Update Clearance with clearance number of ', 0),
(408, 'Administrator', '2022-04-05 22:17:44', 'Update Clearance with clearance number of ', 0),
(409, 'Administrator', '2022-04-05 22:18:11', 'Update Clearance with clearance number of ', 0),
(410, 'Administrator', '2022-04-05 22:18:25', 'Update Clearance with clearance number of ', 0),
(411, 'Administrator', '2022-04-05 22:18:44', 'Update Clearance with clearance number of ', 0),
(412, 'Administrator', '2022-04-05 22:19:07', 'Update Clearance with clearance number of ', 0),
(413, 'Administrator', '2022-04-05 22:19:24', 'Update Clearance with clearance number of ', 0),
(414, 'Administrator', '2022-04-05 22:19:46', 'Update Clearance with clearance number of ', 0),
(415, 'Administrator', '2022-04-05 22:20:25', 'Update Clearance with clearance number of ', 0),
(416, 'Administrator', '2022-04-05 22:20:41', 'Update Clearance with clearance number of ', 0),
(417, 'Administrator', '2022-04-05 22:21:05', 'Update Clearance with clearance number of ', 0),
(418, 'Administrator', '2022-04-05 22:21:20', 'Update Clearance with clearance number of ', 0),
(419, 'Administrator', '2022-04-05 22:21:34', 'Update Clearance with clearance number of ', 0),
(420, 'Administrator', '2022-04-05 22:21:48', 'Update Clearance with clearance number of ', 0),
(421, 'Administrator', '2022-04-06 00:03:48', 'Added Permit with business name of Parlor', 0),
(422, 'Administrator', '2022-04-06 00:04:18', 'Update Permit with business name of Parlor', 0),
(423, 'Administrator', '2022-04-06 00:05:33', 'Added Blotter Request by Dela Cruz , Red Aropo', 0),
(424, 'Administrator', '2022-04-06 00:15:15', 'Update Resident named Ferrer, Antonette Marfa', 0),
(425, 'Administrator', '2022-04-06 00:15:35', 'Update Resident named Oflas , Jenevev Negro', 0),
(426, 'Administrator', '2022-04-06 00:15:51', 'Update Resident named Ending , Rica Mae Arellano', 0),
(427, 'Administrator', '2022-04-06 00:16:22', 'Update Resident named Oflas , aladin Maru', 0),
(428, 'Administrator', '2022-04-06 00:16:43', 'Update Resident named Dela Cruz , Edi Aropo', 0),
(429, 'Administrator', '2022-04-06 00:17:12', 'Update Resident named Marfa, Jose Quijano', 0),
(430, 'Administrator', '2022-04-06 00:17:46', 'Update Resident named Arellano, Megmeg Maru', 0),
(431, 'Administrator', '2022-04-06 00:18:34', 'Update Resident named Arellano, Ma. Tesse Maru', 0),
(432, 'Administrator', '2022-04-06 00:18:48', 'Update Resident named Oflas, Arnie Maru', 0),
(433, 'Administrator', '2022-04-06 00:19:23', 'Added Clearance with clearance number of ', 0),
(434, 'Administrator', '2022-04-06 00:20:18', 'Added Permit with business name of Spa', 0),
(435, 'Administrator', '2022-04-18 17:19:36', 'Update Official named Hon. Brendo Batasin-in', 0),
(436, 'Administrator', '2022-04-18 17:22:25', 'Update Staff with name of Chavez, Alen G.', 0),
(437, 'Administrator', '2022-04-18 17:25:53', 'Update Resident named Chavez, Alana Gido', 0),
(438, 'Administrator', '2022-04-18 17:29:55', 'Added Resident named Cena, Uldarico Chavez', 0),
(439, 'Administrator', '2022-04-18 17:30:43', 'Update Resident named Chavez, Alana Gido', 0),
(440, 'Administrator', '2022-04-18 17:31:14', 'Update Resident named Cena, Uldarico Chavez', 0),
(441, 'Administrator', '2022-04-18 17:32:41', 'Update Resident named Gido, Rico Chavez', 0),
(442, 'Administrator', '2022-04-18 17:33:03', 'Update Resident named Gido, Rico Chavez', 0),
(443, 'Administrator', '2022-04-18 17:33:40', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(444, 'Administrator', '2022-04-18 17:34:52', 'Update Resident named Cueva, Jason Maru', 0),
(445, 'Administrator', '2022-04-18 17:35:59', 'Update Resident named Villaceran, Mark jkjk', 0),
(446, 'Administrator', '2022-04-18 17:39:06', 'Update Resident named Villaceran, Mark Cueva', 0),
(447, 'Administrator', '2022-04-18 17:42:09', 'Added Resident named Mansueto, Jema Maru', 0),
(448, 'Administrator', '2022-04-18 17:44:09', 'Added Resident named Descartin, Ma. Melca Positar', 0),
(449, 'Administrator', '2022-04-18 17:45:12', 'Added Household Number 6', 0),
(450, 'Administrator', '2022-04-18 17:48:07', 'Added Resident named Vergara, Josephine Medallo', 0),
(451, 'Administrator', '2022-04-18 17:50:50', 'Added Resident named Medallo, John Philip Quezon', 0),
(452, 'Administrator', '2022-04-18 17:53:24', 'Added Resident named Villacrusis, Mj Lawan', 0),
(453, 'Administrator', '2022-04-18 17:53:53', 'Update Resident named Quijano, Alfonso Gonjuran', 0),
(454, 'Administrator', '2022-04-18 17:55:58', 'Added Resident named Gila, Mark Sevilleno', 0),
(455, 'Administrator', '2022-04-18 17:56:20', 'Update Resident named Cena, Uldarico Chavez', 0),
(456, 'Administrator', '2022-04-18 17:56:30', 'Update Resident named Cueva, Jason Maru', 0),
(457, 'Administrator', '2022-04-18 17:58:52', 'Added Resident named Santillan, Jepoy Sevilleno', 0),
(458, 'Administrator', '2022-04-18 18:01:33', 'Added Resident named Desabille, John Paul Vergara', 0),
(459, 'Administrator', '2022-04-18 18:06:54', 'Added Resident named Sevilleno, Peter Mansueto', 0),
(460, 'Administrator', '2022-04-18 18:08:55', 'Added Resident named Dela Cruz, Mary Jean Maspara', 0),
(461, 'Administrator', '2022-04-18 18:11:06', 'Added Resident named Bacolod, Pearl Milan', 0),
(462, 'Administrator', '2022-04-18 18:13:11', 'Added Resident named Villaceran, Kean Maru', 0),
(463, 'Administrator', '2022-04-18 18:16:33', 'Added Resident named Castillo, Justine Conel', 0),
(464, 'Administrator', '2022-04-18 18:17:31', 'Update Resident named Quijano, Nadnad Gonjuran', 0),
(465, 'Administrator', '2022-04-18 18:19:42', 'Added Resident named Marfa, Jie Ann Maru', 0),
(466, 'Administrator', '2022-04-18 18:22:05', 'Added Resident named Caranzo, Victoria Go', 0),
(467, 'Administrator', '2022-04-18 18:24:40', 'Added Resident named Villacarlos, Mea Ann Santillan', 0),
(468, 'Administrator', '2022-04-18 18:28:02', 'Added Resident named Conel, Jevin Pastiteo', 0),
(469, 'Administrator', '2022-04-18 18:31:30', 'Added Resident named Mabulay, Rey Lawan', 0),
(470, 'Administrator', '2022-04-18 18:35:30', 'Added Resident named Santillan, Oliver Rosos', 0),
(471, 'Administrator', '2022-04-18 18:38:22', 'Added Resident named De Jesus, Ella Jane Bacolod', 0),
(472, 'Administrator', '2022-04-18 18:40:59', 'Added Resident named Mabulay, Sandra Maru', 0),
(473, 'Administrator', '2022-04-18 18:43:13', 'Added Resident named Pastiteo, Jacob Bacolod', 0),
(474, 'Administrator', '2022-04-18 18:45:14', 'Added Resident named Cordova, Cyndi Flores', 0),
(475, 'Administrator', '2022-04-18 18:47:50', 'Added Resident named Maru, Mary Rose Maspara', 0),
(476, 'Administrator', '2022-04-18 18:51:53', 'Update Resident named Gido, Rico Chavez', 0),
(477, 'Administrator', '2022-04-18 18:52:15', 'Update Resident named Bacolod, Pearl Milan', 0),
(478, 'Administrator', '2022-04-18 18:53:13', 'Update Resident named Villaceran, Kean Maru', 0),
(479, 'Administrator', '2022-04-18 18:53:31', 'Update Resident named Mabulay, Rey Lawan', 0),
(480, 'Administrator', '2022-04-18 18:53:48', 'Update Resident named Pastiteo, Jacob Bacolod', 0),
(481, 'Administrator', '2022-04-18 18:54:52', 'Update Resident named Mansueto, Jema Maru', 0),
(482, 'Administrator', '2022-04-18 18:55:32', 'Update Resident named Medallo, John Philip Quezon', 0),
(483, 'Administrator', '2022-04-18 18:55:55', 'Update Resident named Sevilleno, Peter Mansueto', 0),
(484, 'Administrator', '2022-04-18 18:56:15', 'Update Resident named Castillo, Justine Conel', 0),
(485, 'Administrator', '2022-04-18 18:59:08', 'Update Resident named De Jesus, Ella Jane Bacolod', 0),
(486, 'Administrator', '2022-04-18 18:59:54', 'Update Resident named Cordova, Cyndi Flores', 0),
(487, 'Administrator', '2022-04-18 19:00:13', 'Update Resident named Descartin, Ma. Melca Positar', 0),
(488, 'Administrator', '2022-04-18 19:00:33', 'Update Resident named Quijano, Nadnad Gonjuran', 0),
(489, 'Administrator', '2022-04-18 19:01:10', 'Update Resident named Villacrusis, Mj Lawan', 0),
(490, 'Administrator', '2022-04-18 19:01:28', 'Update Resident named Desabille, John Paul Vergara', 0),
(491, 'Administrator', '2022-04-18 19:01:46', 'Update Resident named Marfa, Jie Ann Maru', 0),
(492, 'Administrator', '2022-04-18 19:01:59', 'Update Resident named Villacarlos, Mea Ann Santillan', 0),
(493, 'Administrator', '2022-04-18 19:02:15', 'Update Resident named Conel, Jevin Pastiteo', 0),
(494, 'Administrator', '2022-04-18 19:02:34', 'Update Resident named Santillan, Oliver Rosos', 0),
(495, 'Administrator', '2022-04-18 19:03:00', 'Update Resident named Gila, Mark Sevilleno', 0),
(496, 'Administrator', '2022-04-18 19:04:10', 'Update Resident named Dela Cruz, Mary Jean Maspara', 0),
(497, 'Administrator', '2022-04-18 19:04:32', 'Update Resident named Caranzo, Victoria Go', 0),
(498, 'Administrator', '2022-04-18 19:05:11', 'Update Resident named Mabulay, Sandra Maru', 0),
(499, 'Administrator', '2022-04-18 19:05:44', 'Update Resident named Maru, Mary Rose Maspara', 0),
(500, 'Administrator', '2022-04-18 19:06:03', 'Update Resident named Marfa, Niel Maru', 0),
(501, 'Administrator', '2022-04-18 19:07:30', 'Update Resident named Santillan, Jepoy Sevilleno', 0),
(502, 'Administrator', '2022-04-18 19:07:46', 'Update Resident named Vergara, Josephine Medallo', 0),
(503, 'Administrator', '2022-04-18 19:08:46', 'Update Resident named Pelayo, Ronnel Bacolod', 0),
(504, 'Administrator', '2022-04-18 19:11:11', 'Update Resident named Oflas , Aladin Maru', 0),
(505, 'Administrator', '2022-04-18 19:11:43', 'Update Resident named Pastiteo, Jacob Bacolod', 0),
(506, 'Administrator', '2022-04-18 19:11:57', 'Update Resident named Cena, Uldarico Chavez', 0),
(507, 'Administrator', '2022-04-18 21:46:11', 'Added Staff with name of jksjks', 0),
(508, 'Administrator', '2022-04-19 10:52:48', 'Added Permit with business name of cordova trading', 0),
(509, 'Administrator', '2022-04-19 10:59:33', 'Added Permit with business name of De jesus pet shop', 0),
(510, 'Administrator', '2022-04-19 11:03:57', 'Added Permit with business name of karenderya', 0),
(511, 'Administrator', '2022-04-19 11:06:18', 'Update Permit with business name of De jesus pet shop', 0),
(512, 'Administrator', '2022-04-19 11:13:01', 'Update Permit with business name of asda', 0),
(513, 'Administrator', '2022-04-19 11:13:45', 'Update Permit with business name of asda', 0),
(514, 'Administrator', '2022-04-19 11:13:54', 'Update Permit with business name of asda', 0),
(515, 'Administrator', '2022-04-19 11:14:33', 'Update Permit with business name of Sari-Sari Store', 0),
(516, 'Administrator', '2022-04-19 11:18:41', 'Added Permit with business name of Sari Sari Store', 0),
(517, 'Administrator', '2022-04-19 11:19:53', 'Added Permit with business name of Internet Cafe', 0),
(518, 'Administrator', '2022-04-19 11:21:20', 'Update Permit with business name of Sari Sari Store', 0),
(519, 'Administrator', '2022-04-19 11:21:33', 'Update Permit with business name of MotorParts', 0),
(520, 'Administrator', '2022-04-19 11:21:56', 'Update Permit with business name of Axies Trading', 0),
(521, 'Administrator', '2022-04-19 11:22:25', 'Update Permit with business name of Karenderya Store', 0),
(522, 'Administrator', '2022-04-19 11:23:35', 'Update Permit with business name of Jose Sari-sari', 0),
(523, 'Administrator', '2022-04-19 11:24:05', 'Update Permit with business name of Coffee Shop', 0),
(524, 'Administrator', '2022-04-19 11:24:47', 'Update Permit with business name of Internet Cafe', 0),
(525, 'Administrator', '2022-04-19 11:25:17', 'Update Permit with business name of Hardware', 0),
(526, 'Administrator', '2022-04-19 11:25:56', 'Update Permit with business name of Joe sari-sari Store', 0),
(527, 'Administrator', '2022-04-19 11:26:41', 'Update Permit with business name of Comlab', 0),
(528, 'Administrator', '2022-04-19 11:27:41', 'Update Permit with business name of Computer Shop', 0),
(529, 'Administrator', '2022-04-19 11:28:41', 'Update Permit with business name of De jesus pet shop', 0),
(530, 'Administrator', '2022-04-19 11:29:18', 'Update Permit with business name of son motor part', 0),
(531, 'Administrator', '2022-04-19 11:30:21', 'Update Permit with business name of Beauty Salon', 0),
(532, 'Administrator', '2022-04-19 11:31:00', 'Update Permit with business name of Parlor', 0),
(533, 'Administrator', '2022-04-19 11:31:28', 'Update Permit with business name of Spa', 0),
(534, 'Administrator', '2022-04-19 11:31:53', 'Update Permit with business name of cordova trading', 0),
(535, 'Administrator', '2022-04-19 11:32:11', 'Update Permit with business name of karenderya', 0),
(536, 'Administrator', '2022-04-19 11:33:49', 'Added Permit with business name of Vergara Sari Sari Store', 0),
(537, 'Administrator', '2022-04-19 11:34:36', 'Added Permit with business name of Resto Bar', 0),
(538, 'Administrator', '2022-04-19 11:36:34', 'Added Permit with business name of Merchandise', 0),
(539, 'Administrator', '2022-04-19 11:37:26', 'Added Permit with business name of RestoBar', 0);
INSERT INTO `tbllogs` (`id`, `user`, `logdate`, `action`, `deleted`) VALUES
(540, 'Administrator', '2022-04-19 11:38:14', 'Added Permit with business name of Barber Shop ', 0),
(541, 'Administrator', '2022-04-19 11:39:33', 'Added Permit with business name of Sari Sari Store', 0),
(542, 'Administrator', '2022-04-19 11:40:39', 'Added Permit with business name of Jema Bakeshop', 0),
(543, 'Administrator', '2022-04-19 11:41:10', 'Update Permit with business name of Carenderia', 0),
(544, 'Administrator', '2022-04-19 11:41:19', 'Update Permit with business name of Carenderia', 0),
(545, 'Administrator', '2022-04-19 11:41:32', 'Update Permit with business name of Sari-Sari Store', 0),
(546, 'Administrator', '2022-04-19 11:41:58', 'Update Permit with business name of Barber Shop', 0),
(547, 'Administrator', '2022-04-19 11:43:08', 'Added Permit with business name of Ukay Ukay ', 0),
(548, 'Administrator', '2022-04-19 11:44:04', 'Added Permit with business name of Fast Food', 0),
(549, 'Administrator', '2022-04-19 11:45:10', 'Added Permit with business name of Coffe shop', 0),
(550, 'Administrator', '2022-04-19 11:45:43', 'Added Permit with business name of Milktea House', 0),
(551, 'Administrator', '2022-04-19 11:46:43', 'Added Permit with business name of Beach Resort', 0),
(552, 'Administrator', '2022-04-19 11:47:26', 'Added Permit with business name of Justine Sari Sari Store', 0),
(553, 'Administrator', '2022-04-19 11:48:39', 'Added Permit with business name of Bike and Motor Shop', 0),
(554, 'Administrator', '2022-04-19 11:49:09', 'Added Permit with business name of Coffe shop', 0),
(555, 'Administrator', '2022-04-19 11:49:45', 'Added Permit with business name of Parlor', 0),
(556, 'Administrator', '2022-04-19 11:50:35', 'Added Permit with business name of Coffe shop', 0),
(557, 'Administrator', '2022-04-19 11:51:03', 'Added Permit with business name of Beauty Salon', 0),
(558, 'Administrator', '2022-04-19 11:53:35', 'Added Resident named Lucagbo, Jm Bacolod', 0),
(559, 'Administrator', '2022-04-19 11:55:16', 'Added Resident named Valirio, Jesa Lawan', 0),
(560, 'Administrator', '2022-04-19 11:57:02', 'Added Resident named Dela Cruz, Lyn Gila', 0),
(561, 'Administrator', '2022-04-19 11:58:51', 'Added Clearance with clearance number of ', 0),
(562, 'Administrator', '2022-04-19 11:59:24', 'Update Clearance with clearance number of ', 0),
(563, 'Administrator', '2022-04-19 11:59:40', 'Update Clearance with clearance number of ', 0),
(564, 'Administrator', '2022-04-19 11:59:54', 'Update Clearance with clearance number of ', 0),
(565, 'Administrator', '2022-04-19 12:00:18', 'Update Clearance with clearance number of ', 0),
(566, 'Administrator', '2022-04-19 12:00:54', 'Update Clearance with clearance number of ', 0),
(567, 'Administrator', '2022-04-19 12:02:22', 'Update Clearance with clearance number of ', 0),
(568, 'Administrator', '2022-04-19 12:02:40', 'Update Clearance with clearance number of ', 0),
(569, 'Administrator', '2022-04-19 12:03:04', 'Update Clearance with clearance number of ', 0),
(570, 'Administrator', '2022-04-19 12:03:52', 'Added Clearance with clearance number of ', 0),
(571, 'Administrator', '2022-04-19 12:04:31', 'Added Clearance with clearance number of ', 0),
(572, 'Administrator', '2022-04-19 12:05:14', 'Added Clearance with clearance number of ', 0),
(573, 'Administrator', '2022-04-19 12:05:47', 'Added Clearance with clearance number of ', 0),
(574, 'Administrator', '2022-04-19 12:06:15', 'Added Clearance with clearance number of ', 0),
(575, 'Administrator', '2022-04-19 12:06:49', 'Added Clearance with clearance number of ', 0),
(576, 'Administrator', '2022-04-19 12:07:27', 'Added Clearance with clearance number of ', 0),
(577, 'Administrator', '2022-04-19 12:07:48', 'Added Clearance with clearance number of ', 0),
(578, 'Administrator', '2022-04-19 12:08:22', 'Added Clearance with clearance number of ', 0),
(579, 'Administrator', '2022-04-19 12:08:59', 'Added Clearance with clearance number of ', 0),
(580, 'Administrator', '2022-04-19 12:09:15', 'Added Clearance with clearance number of ', 0),
(581, 'Administrator', '2022-04-19 12:09:39', 'Added Clearance with clearance number of ', 0),
(582, 'Administrator', '2022-04-19 12:10:07', 'Added Clearance with clearance number of ', 0),
(583, 'Administrator', '2022-04-19 12:10:32', 'Added Clearance with clearance number of ', 0),
(584, 'Administrator', '2022-04-19 12:11:11', 'Added Clearance with clearance number of ', 0),
(585, 'Administrator', '2022-04-19 12:11:41', 'Added Clearance with clearance number of ', 0),
(586, 'Administrator', '2022-04-19 12:12:16', 'Added Clearance with clearance number of ', 0),
(587, 'Administrator', '2022-04-19 12:12:50', 'Added Clearance with clearance number of ', 0),
(588, 'Administrator', '2022-04-19 12:13:16', 'Added Clearance with clearance number of ', 0),
(589, 'Administrator', '2022-04-19 12:13:51', 'Added Clearance with clearance number of ', 0),
(590, 'Administrator', '2022-04-19 12:14:26', 'Added Clearance with clearance number of ', 0),
(591, 'Administrator', '2022-04-19 12:15:07', 'Added Clearance with clearance number of ', 0),
(592, 'Administrator', '2022-04-19 12:16:24', 'Added Clearance with clearance number of ', 0),
(593, 'Administrator', '2022-04-19 12:16:56', 'Added Clearance with clearance number of ', 0),
(594, 'Administrator', '2022-04-19 12:17:30', 'Added Clearance with clearance number of ', 0),
(595, 'Administrator', '2022-04-19 12:17:59', 'Added Clearance with clearance number of ', 0),
(596, 'Administrator', '2022-04-19 12:19:13', 'Added Clearance with clearance number of ', 0),
(597, 'Administrator', '2022-04-19 12:19:35', 'Added Clearance with clearance number of ', 0),
(598, 'Administrator', '2022-04-19 12:19:55', 'Added Clearance with clearance number of ', 0),
(599, 'Administrator', '2022-04-19 12:20:15', 'Added Clearance with clearance number of ', 0),
(600, 'Administrator', '2022-04-19 12:20:33', 'Added Clearance with clearance number of ', 0),
(601, 'Administrator', '2022-04-19 12:20:54', 'Update Clearance with clearance number of ', 0),
(602, 'Administrator', '2022-04-19 12:21:10', 'Update Clearance with clearance number of ', 0),
(603, 'Administrator', '2022-04-19 12:21:37', 'Added Clearance with clearance number of ', 0),
(604, 'Administrator', '2022-04-19 12:21:52', 'Added Clearance with clearance number of ', 0),
(605, 'Administrator', '2022-04-19 12:23:22', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(606, 'Administrator', '2022-04-19 12:25:42', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(607, 'Administrator', '2022-04-19 12:30:59', 'Added Activity Monthly Clean up Drive', 0),
(608, 'Administrator', '2022-04-19 12:32:11', 'Added Activity Election', 0),
(609, 'Administrator', '2022-04-19 12:33:30', 'Added Activity Poultry Farm', 0),
(610, 'Administrator', '2022-04-19 12:34:30', 'Added Activity Social Preparation', 0),
(611, 'Administrator', '2022-04-19 12:35:15', 'Added Activity Blessing', 0),
(612, 'Administrator', '2022-04-19 12:36:30', 'Added Activity Cash Assistance for Bagyong Odette', 0),
(613, 'Administrator', '2022-04-19 12:40:36', 'Added Blotter Request by Valirio, Jesa Lawan', 0),
(614, 'Administrator', '2022-04-19 12:42:01', 'Added Blotter Request by Mabulay, Sandra Maru', 0),
(615, 'Administrator', '2022-04-19 12:43:14', 'Added Blotter Request by Maru, Mary Rose Maspara', 0),
(616, 'Administrator', '2022-04-19 12:44:05', 'Added Blotter Request by Lucagbo, Jm Bacolod', 0),
(617, 'Administrator', '2022-04-19 12:45:08', 'Added Blotter Request by Quijano, Alfonso Gonjuran', 0),
(618, 'Administrator', '2022-04-19 12:46:22', 'Added Blotter Request by Chavez, Alana Gido', 0),
(619, 'Administrator', '2022-04-19 12:47:38', 'Added Blotter Request by Batasin-in , Jieda Bautro', 0),
(620, 'Administrator', '2022-04-19 12:48:26', 'Added Blotter Request by Lucagbo, Jm Bacolod', 0),
(621, 'Administrator', '2022-04-19 12:49:39', 'Added Blotter Request by Villaceran, Kean Maru', 0),
(622, 'Administrator', '2022-04-19 12:50:35', 'Added Blotter Request by Mabulay, Rey Lawan', 0),
(623, 'Administrator', '2022-04-19 12:51:32', 'Added Blotter Request by Marfa, Jie Ann Maru', 0),
(624, 'Administrator', '2022-04-19 12:52:20', 'Added Blotter Request by Pelayo, Ronnel Bacolod', 0),
(625, 'Administrator', '2022-04-19 12:53:18', 'Added Blotter Request by Chavez, Alana Gido', 0),
(626, 'Administrator', '2022-04-19 12:54:19', 'Added Blotter Request by Marfa, Niel Maru', 0),
(627, 'Administrator', '2022-04-19 12:55:29', 'Added Blotter Request by Cueva, Jason Maru', 0),
(628, 'Administrator', '2022-04-19 13:13:55', 'Added Blotter Request by Dela Cruz, Lyn Gila', 0),
(629, 'Administrator', '2022-04-19 13:14:40', 'Update Blotter Request by Dela Cruz, Lyn Gila', 0),
(630, 'Administrator', '2022-04-19 13:17:03', 'Added Blotter Request by De Jesus, Ella Jane Bacolod', 0),
(631, 'Administrator', '2022-04-19 13:18:41', 'Added Blotter Request by Mabulay, Sandra Maru', 0),
(632, 'Administrator', '2022-04-19 13:19:54', 'Added Blotter Request by Pastiteo, Jacob Bacolod', 0),
(633, 'Administrator', '2022-04-19 13:21:11', 'Added Blotter Request by Marfa, Jie Ann Maru', 0),
(634, 'Administrator', '2022-04-19 13:22:16', 'Added Blotter Request by Caranzo, Victoria Go', 0),
(635, 'Administrator', '2022-04-19 13:23:14', 'Added Blotter Request by Ferrer, Antonette Marfa', 0),
(636, 'Administrator', '2022-04-19 13:24:11', 'Added Blotter Request by Arellano, Megmeg Maru', 0),
(637, 'Administrator', '2022-04-19 13:27:17', 'Added Blotter Request by Gila, Mark Sevilleno', 0),
(638, 'Administrator', '2022-04-19 13:29:06', 'Added Blotter Request by Valirio, Jesa Lawan', 0),
(639, 'Administrator', '2022-04-19 13:31:01', 'Added Blotter Request by Sevilleno, Peter Mansueto', 0),
(640, 'Administrator', '2022-04-19 13:33:10', 'Added Blotter Request by Bacolod, Pearl Milan', 0),
(641, 'Administrator', '2022-04-19 13:36:28', 'Added Blotter Request by De Jesus, Ella Jane Bacolod', 0),
(642, 'Administrator', '2022-04-19 13:38:23', 'Added Blotter Request by Gido, Rico Chavez', 0),
(643, 'Administrator', '2022-04-19 13:40:23', 'Added Blotter Request by Ferrer, Antonette Marfa', 0),
(644, 'Administrator', '2022-04-19 13:42:37', 'Added Blotter Request by Quijano, Alfonso Gonjuran', 0),
(645, 'Administrator', '2022-04-19 13:44:44', 'Added Blotter Request by Mabulay, Rey Lawan', 0),
(646, 'Administrator', '2022-04-19 13:46:32', 'Added Blotter Request by Dela Cruz , Edi Aropo', 0),
(647, 'Administrator', '2022-04-19 13:48:25', 'Added Blotter Request by Arellano, Megmeg Maru', 0),
(648, 'Administrator', '2022-04-19 14:28:05', 'Added Household Number 2', 0),
(649, 'Administrator', '2022-04-19 14:28:38', 'Added Household Number 5', 0),
(650, 'Administrator', '2022-04-20 10:45:12', 'Added Household Number 6', 0),
(651, 'Administrator', '2022-04-20 10:47:30', 'Added Household Number 7', 0),
(652, 'Administrator', '2022-04-20 10:48:02', 'Added Household Number 8', 0),
(653, 'Administrator', '2022-04-20 10:48:25', 'Update Household Number 1', 0),
(654, 'Administrator', '2022-04-20 10:48:47', 'Update Household Number 4', 0),
(655, 'Administrator', '2022-04-20 10:49:01', 'Update Household Number 7', 0),
(656, 'Administrator', '2022-04-20 10:49:09', 'Update Household Number 3', 0),
(657, 'Administrator', '2022-04-20 10:49:29', 'Update Household Number 2', 0),
(658, 'Administrator', '2022-04-20 10:49:44', 'Update Household Number 5', 0),
(659, 'Administrator', '2022-04-20 10:49:57', 'Update Household Number 6', 0),
(660, 'Administrator', '2022-04-20 10:50:15', 'Update Household Number 8', 0),
(661, 'Administrator', '2022-04-20 11:25:17', 'Added Resident named Marfa, Juan Mansueto', 0),
(662, 'Administrator', '2022-04-20 11:26:21', 'Update Resident named Marfa, Juan Mansueto', 0),
(663, 'Administrator', '2022-04-20 11:29:23', 'Update Resident named Cueva, Jason Maru', 0),
(664, 'Administrator', '2022-04-20 11:29:45', 'Update Resident named Cena, Uldarico Chavez', 0),
(665, 'Administrator', '2022-04-20 11:31:43', 'Update Resident named Cueva, Jason Maru', 0),
(666, 'Administrator', '2022-04-20 11:31:52', 'Update Resident named Cena, Uldarico Chavez', 0),
(667, 'Administrator', '2022-04-20 11:32:08', 'Update Resident named Chavez, Alana Gido', 0),
(668, 'Administrator', '2022-04-20 11:34:19', 'Added Resident named Dela Cruz , Jazer Enero', 0),
(669, 'Administrator', '2022-04-20 11:37:40', 'Update Resident named Cueva, Jason Maru', 0),
(670, 'Administrator', '2022-04-20 11:37:55', 'Update Resident named Gido, Rico Chavez', 0),
(671, 'Administrator', '2022-04-20 11:38:27', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(672, 'Administrator', '2022-04-20 11:39:06', 'Update Resident named Bacolod, Pearl Milan', 0),
(673, 'Administrator', '2022-04-20 11:39:30', 'Update Resident named Mabulay, Rey Lawan', 0),
(674, 'Administrator', '2022-04-20 11:39:45', 'Update Resident named Pastiteo, Jacob Bacolod', 0),
(675, 'Administrator', '2022-04-20 11:40:09', 'Update Resident named Villaceran, Kean Maru', 0),
(676, 'Administrator', '2022-04-20 11:40:24', 'Update Resident named Quijano, Alfonso Gonjuran', 0),
(677, 'Administrator', '2022-04-20 11:40:37', 'Update Resident named Cahutay, Mirasol Bautro', 0),
(678, 'Administrator', '2022-04-20 11:40:49', 'Update Resident named Mansueto, Jema Maru', 0),
(679, 'Administrator', '2022-04-20 11:41:07', 'Update Resident named Sevilleno, Peter Mansueto', 0),
(680, 'Administrator', '2022-04-20 11:41:19', 'Update Resident named Castillo, Justine Conel', 0),
(681, 'Administrator', '2022-04-20 11:41:56', 'Update Resident named Chavez, Alana Gido', 0),
(682, 'Administrator', '2022-04-20 11:42:25', 'Update Resident named Chavez, Alana Gido', 0),
(683, 'Administrator', '2022-04-20 11:44:05', 'Update Resident named Pelayo, Ronnel Bacolod', 0),
(684, 'Administrator', '2022-04-20 11:44:33', 'Update Resident named Torro, Mark Gila', 0),
(685, 'Administrator', '2022-04-20 11:44:58', 'Update Resident named Quijano, Alfonso Gonjuran', 0),
(686, 'Administrator', '2022-04-20 11:45:58', 'Update Resident named Quijano, Nadnad Gonjuran', 0),
(687, 'Administrator', '2022-04-20 12:57:21', 'Update Resident named Marfa, Niel Maru', 0),
(688, 'Administrator', '2022-04-20 12:57:52', 'Update Resident named Villaceran, Mark Cueva', 0),
(689, 'Administrator', '2022-04-20 12:58:53', 'Update Resident named Marfa, Jose Quijano', 0),
(690, 'Administrator', '2022-04-20 12:59:29', 'Update Resident named Villaceran, Mark Cueva', 0),
(691, 'Administrator', '2022-04-20 13:01:21', 'Update Resident named Ferrer, Antonette Marfa', 0),
(692, 'Administrator', '2022-04-20 13:01:35', 'Update Resident named Oflas , Jenevev Negro', 0),
(693, 'Administrator', '2022-04-20 13:01:48', 'Update Resident named Arellano, Megmeg Maru', 0),
(694, 'Administrator', '2022-04-20 13:02:25', 'Update Resident named Ending , Rica Mae Arellano', 0),
(695, 'Administrator', '2022-04-20 13:02:53', 'Update Resident named Arellano, Edison Maru', 0),
(696, 'Administrator', '2022-04-20 13:03:36', 'Update Resident named Marfa, Alicia Maru', 0),
(697, 'Administrator', '2022-04-20 13:03:50', 'Update Resident named Joe, Quijano Marfa', 0),
(698, 'Administrator', '2022-04-20 13:04:18', 'Update Resident named Arellano, Ma. Tesse Maru', 0),
(699, 'Administrator', '2022-04-20 13:04:49', 'Update Resident named Oflas, Arnie Maru', 0),
(700, 'Administrator', '2022-04-20 13:05:12', 'Update Resident named Oflas , Aladin Maru', 0),
(701, 'Administrator', '2022-04-20 13:05:42', 'Update Resident named Bali-os , Burdogs Arellano', 0),
(702, 'Administrator', '2022-04-20 13:06:20', 'Update Resident named Dela Cruz , Red  Aropo', 0),
(703, 'Administrator', '2022-04-20 13:06:41', 'Update Resident named Dela Cruz , Jazer Enero', 0),
(704, 'Administrator', '2022-04-20 13:08:59', 'Update Resident named Dela Cruz , Edi Aropo', 0),
(705, 'Administrator', '2022-04-20 13:15:51', 'Update Household Number 1', 0),
(706, 'Administrator', '2022-04-20 13:20:03', 'Update Household Number 5', 0),
(707, 'Administrator', '2022-04-20 13:22:26', 'Update Household Number 3', 0),
(708, 'Administrator', '2022-04-20 13:23:01', 'Update Household Number 4', 0),
(709, 'Administrator', '2022-04-20 13:23:22', 'Update Household Number 7', 0),
(710, 'Administrator', '2022-04-20 13:23:54', 'Update Household Number 2', 0),
(711, 'Administrator', '2022-04-20 13:24:27', 'Update Household Number 6', 0),
(712, 'Administrator', '2022-04-20 13:24:38', 'Update Household Number 8', 0),
(713, 'Administrator', '2022-04-21 09:59:28', 'Added Activity try ', 0),
(714, 'Administrator', '2022-04-23 13:37:10', 'Added Household Number 8', 0),
(715, 'Administrator', '2022-04-23 13:37:29', 'Added Household Number 9', 0),
(716, 'Administrator', '2022-04-23 13:37:50', 'Added Household Number 10', 0),
(717, 'Administrator', '2022-04-23 13:38:06', 'Added Household Number 11', 0),
(718, 'Administrator', '2022-04-23 13:38:35', 'Added Household Number 12', 0),
(719, 'Administrator', '2022-04-23 13:38:54', 'Added Household Number 13', 0),
(720, 'Administrator', '2022-04-23 13:39:37', 'Update Resident named Arellano, Megmeg Maru', 0),
(721, 'Administrator', '2022-04-23 13:40:02', 'Added Household Number 14', 0),
(722, 'Administrator', '2022-04-23 13:41:01', 'Update Resident named Oflas, Arnie Maru', 0),
(723, 'Administrator', '2022-04-23 13:41:25', 'Added Household Number 15', 0),
(724, 'Administrator', '2022-04-23 13:42:25', 'Update Resident named Santillan, Jepoy Sevilleno', 0),
(725, 'Administrator', '2022-04-23 13:42:52', 'Added Household Number 16', 0),
(726, 'Administrator', '2022-04-25 14:07:09', 'Added Staff with name of Rossell, Renato', 0),
(727, 'Administrator', '2022-04-25 16:23:14', 'Added Activity Christmas Party', 0),
(728, 'Administrator', '2022-04-25 16:26:31', 'Update Activity Vacination Drive', 0),
(729, 'Administrator', '2022-04-25 16:28:04', 'Update Activity Vacination Drive', 0),
(730, 'Administrator', '2022-04-25 16:30:58', 'Update Activity Vacination Drive', 0),
(731, 'Administrator', '2022-04-25 16:31:50', 'Update Activity Vacination Drive', 0),
(732, 'Administrator', '2022-04-25 16:33:16', 'Update Activity Vacination Drive', 0),
(733, 'Administrator', '2022-04-25 16:34:00', 'Update Activity Vacination Drive', 0),
(734, 'Administrator', '2022-04-25 16:34:13', 'Update Activity Monthly immunization', 0),
(735, 'Administrator', '2022-04-25 16:35:52', 'Added Clearance with clearance number of ', 0),
(736, 'Administrator', '2022-04-25 16:36:30', 'Update Activity Fiesta of San Vicente Ferrer', 0),
(737, 'Administrator', '2022-04-25 16:36:40', 'Update Activity Monthly Clean up Drive', 0),
(738, 'Administrator', '2022-04-25 16:36:51', 'Update Activity Election', 0),
(739, 'Administrator', '2022-04-25 16:37:04', 'Update Activity Poultry Farm', 0),
(740, 'Administrator', '2022-04-25 16:37:17', 'Update Activity Social Preparation', 0),
(741, 'Administrator', '2022-04-25 16:37:25', 'Update Activity Blessing', 0),
(742, 'Administrator', '2022-04-25 16:37:36', 'Update Activity Cash Assistance for Bagyong Odette', 0),
(743, 'Administrator', '2022-04-25 16:38:43', 'Update Activity Christmas Party', 0),
(744, 'Administrator', '2022-04-25 18:44:42', 'Update Zone number ', 0),
(745, 'Administrator', '2022-04-25 21:15:30', 'Added Clearance with clearance number of ', 0),
(746, 'Administrator', '2022-04-25 21:41:54', 'Added Activity try ', 0),
(747, 'Administrator', '2022-04-26 00:49:12', 'Update Resident named Marfa, Jie Ann Maru', 0),
(748, 'Administrator', '2022-04-26 00:49:32', 'Update Resident named Medallo, John Philip Quezon', 0),
(749, 'Administrator', '2022-04-26 00:49:50', 'Update Resident named De Jesus, Ella Jane Bacolod', 0),
(750, 'Administrator', '2022-04-26 00:50:09', 'Update Resident named Cordova, Cyndi Flores', 0),
(751, 'Administrator', '2022-04-26 00:50:52', 'Update Resident named Lucagbo, Jm Bacolod', 0),
(752, 'Administrator', '2022-04-26 00:51:10', 'Update Resident named Descartin, Ma. Melca Positar', 0),
(753, 'Administrator', '2022-04-26 00:51:28', 'Update Resident named Villacrusis, Mj Lawan', 0),
(754, 'Administrator', '2022-04-26 00:51:43', 'Update Resident named Desabille, John Paul Vergara', 0),
(755, 'Administrator', '2022-04-26 00:52:05', 'Update Resident named Villacarlos, Mea Ann Santillan', 0),
(756, 'Administrator', '2022-04-26 00:52:26', 'Update Resident named Conel, Jevin Pastiteo', 0),
(757, 'Administrator', '2022-04-26 00:52:46', 'Update Resident named Santillan, Oliver Rosos', 0),
(758, 'Administrator', '2022-04-26 00:53:14', 'Update Resident named Valirio, Jesa Lawan', 0),
(759, 'Administrator', '2022-04-26 00:53:40', 'Update Resident named Gila, Mark Sevilleno', 0),
(760, 'Administrator', '2022-04-26 00:53:59', 'Update Resident named Dela Cruz, Mary Jean Maspara', 0),
(761, 'Administrator', '2022-04-26 00:54:20', 'Update Resident named Caranzo, Victoria Go', 0),
(762, 'Administrator', '2022-04-26 00:54:50', 'Update Resident named Mabulay, Sandra Maru', 0),
(763, 'Administrator', '2022-04-26 00:55:10', 'Update Resident named Maru, Mary Rose Maspara', 0),
(764, 'Administrator', '2022-04-26 00:55:46', 'Update Resident named Dela Cruz , Fritz Aropo', 0),
(765, 'Administrator', '2022-04-26 00:56:09', 'Update Resident named Aropo, Inday Batasin-in', 0),
(766, 'Administrator', '2022-04-26 00:56:25', 'Update Resident named Vergara, Josephine Medallo', 0),
(767, 'Administrator', '2022-04-26 00:56:49', 'Update Resident named Dela Cruz, Lyn Gila', 0),
(768, 'Administrator', '2022-04-26 00:57:06', 'Update Resident named Santillan, Jepoy Sevilleno', 0),
(769, 'Administrator', '2022-04-26 00:58:53', 'Update Zone number ', 0),
(770, 'Administrator', '2022-04-26 00:59:14', 'Update Zone number ', 0),
(771, 'Administrator', '2022-04-26 00:59:30', 'Update Zone number ', 0),
(772, 'Administrator', '2022-04-26 00:59:45', 'Update Zone number ', 0),
(773, 'Administrator', '2022-04-26 01:00:39', 'Update Zone number ', 0),
(774, 'Administrator', '2022-04-26 01:01:18', 'Update Zone number ', 0),
(775, 'Administrator', '2022-04-26 01:01:56', 'Added Zone number Bombil', 0),
(776, 'Administrator', '2022-04-26 01:10:45', 'Update Resident named Vergara, Josephine Medallo', 0),
(777, 'Administrator', '2022-04-26 01:14:00', 'Update Permit with business name of J&J Trading', 0),
(778, 'Administrator', '2022-04-26 01:14:29', 'Update Permit with business name of J&J Trading', 0),
(779, 'Administrator', '2022-04-26 01:25:36', 'Update Clearance with clearance number of ', 0),
(780, 'Administrator', '2022-04-26 01:26:11', 'Update Clearance with clearance number of ', 0),
(781, 'Administrator', '2022-04-26 01:34:29', 'Update Resident named Cahutay, Mirasol Bautro', 0),
(782, 'Administrator', '2022-04-26 01:35:16', 'Update Resident named Mabulay, Rey Lawan', 0),
(783, 'Administrator', '2022-04-26 01:35:57', 'Update Resident named Marfa, Juan Mansueto', 0),
(784, 'Administrator', '2022-04-26 08:35:42', 'Added Resident named Ilustrisimo, Nora Santillan', 0),
(785, 'Administrator', '2022-04-26 14:19:58', 'Update Activity Vacination Drive', 0),
(786, 'Administrator', '2022-04-26 14:45:28', 'Added Resident named Duray, Nino Jay', 0),
(787, 'Administrator', '2022-04-26 17:08:48', 'Update Clearance with clearance number of ', 0),
(788, 'Administrator', '2022-04-26 20:15:01', 'Update Clearance with clearance number of ', 0),
(789, 'Administrator', '2022-04-26 20:17:56', 'Update Clearance with clearance number of ', 0),
(790, 'Administrator', '2022-04-26 20:24:55', 'Update Clearance with clearance number of ', 0),
(791, 'Administrator', '2022-04-26 20:29:05', 'Update Clearance with clearance number of ', 0),
(792, 'Administrator', '2022-04-26 20:32:42', 'Update Clearance with clearance number of ', 0),
(793, 'Administrator', '2022-04-27 07:24:34', 'Update Clearance with clearance number of ', 0),
(794, 'Administrator', '2022-04-27 07:33:55', 'Update Clearance with clearance number of ', 0),
(795, 'Administrator', '2022-04-27 07:36:37', 'Update Clearance with clearance number of ', 0),
(796, 'Administrator', '2022-04-27 07:37:56', 'Update Clearance with clearance number of ', 0),
(797, 'Administrator', '2022-04-27 07:48:06', 'Update Clearance with clearance number of ', 0),
(798, 'Administrator', '2022-04-27 07:50:49', 'Update Clearance with clearance number of ', 0),
(799, 'Administrator', '2022-04-27 07:55:28', 'Update Clearance with clearance number of ', 0),
(800, 'Administrator', '2022-04-27 07:56:59', 'Update Clearance with clearance number of ', 0),
(801, 'Administrator', '2022-04-27 08:08:40', 'Update Clearance with clearance number of ', 0),
(802, 'Administrator', '2022-04-27 08:09:59', 'Update Clearance with clearance number of ', 0),
(803, 'Administrator', '2022-04-27 08:10:57', 'Update Clearance with clearance number of ', 0),
(804, 'Administrator', '2022-04-27 08:12:08', 'Update Clearance with clearance number of ', 0),
(805, 'Administrator', '2022-04-27 08:14:43', 'Update Resident named Arellano, Megmeg Maru', 0),
(806, 'Administrator', '2022-04-27 08:15:47', 'Update Permit with business name of Try lang', 0),
(807, 'Administrator', '2022-04-27 08:19:19', 'Update Clearance with clearance number of ', 0),
(808, 'Administrator', '2022-04-27 08:23:21', 'Update Clearance with clearance number of ', 0),
(809, 'Administrator', '2022-04-27 08:27:04', 'Update Clearance with clearance number of ', 0),
(810, 'Administrator', '2022-04-27 08:30:27', 'Update Clearance with clearance number of ', 0),
(811, 'Administrator', '2022-04-27 08:38:15', 'Update Clearance with clearance number of ', 0),
(812, 'Administrator', '2022-04-27 08:48:43', 'Update Permit with business name of megmeg', 0),
(813, 'Administrator', '2022-04-27 08:50:15', 'Update Permit with business name of Megs21 Shop', 0),
(814, 'Administrator', '2022-04-27 08:50:29', 'Update Permit with business name of Megs21 Shop', 0),
(815, 'Administrator', '2022-04-27 08:53:07', 'Update Permit with business name of Megs21 Shop', 0),
(816, 'Administrator', '2022-04-27 11:04:41', 'Added Activity Fiesta ', 0),
(817, 'Administrator', '2022-04-27 13:18:40', 'Update Clearance with clearance number of ', 0),
(818, 'Administrator', '2022-04-27 23:43:16', 'Added Clearance with clearance number of ', 0),
(819, 'Administrator', '2022-04-27 23:45:18', 'Added Blotter Request by Cueva, Jason Maru', 0),
(820, 'Administrator', '2022-04-27 23:46:21', 'Added Permit with business name of Crabs business', 0),
(821, 'Administrator', '2022-04-28 00:04:46', 'Added Activity Yearly Fiesta', 0),
(822, 'Administrator', '2022-04-28 00:06:40', 'Added Activity Yearly Fiesta', 0),
(823, 'Administrator', '2022-04-28 00:07:15', 'Update Activity Yearly Fiesta', 0),
(824, 'Administrator', '2022-04-28 00:07:38', 'Update Activity Yearly Fiesta', 0),
(825, 'Administrator', '2022-04-28 00:08:11', 'Update Activity Yearly Fiesta', 0),
(826, 'Administrator', '2022-04-28 00:09:14', 'Added Activity Yearly Fiesta ', 0),
(827, 'Administrator', '2022-04-28 23:04:39', 'Added Resident named Marfa, Juniel Maru', 0),
(828, 'Administrator', '2022-04-28 23:05:06', 'Added Resident named Marfa, Juniel Maru', 0),
(829, 'Administrator', '2022-04-28 23:07:02', 'Added Resident named Marfa, Juniel Maru', 0),
(830, 'Administrator', '2022-04-28 23:12:51', 'Added Resident named Marfa, Juniel Maru', 0),
(831, 'Administrator', '2022-04-28 23:15:54', 'Added Resident named Marfa, Juniel Maru', 0),
(832, 'Administrator', '2022-04-28 23:17:12', 'Added Resident named Marfa, Juniel Maru', 0),
(833, 'Administrator', '2022-04-28 23:19:13', 'Update Resident named Chavez, Alana Gido', 0),
(834, 'Administrator', '2022-04-28 23:19:58', 'Update Resident named Cueva, Jason Maru', 0),
(835, 'Administrator', '2022-04-28 23:20:33', 'Update Resident named Marfa, Niel Maru', 0),
(836, 'Administrator', '2022-04-28 23:22:44', 'Update Resident named Batasin-in , Jieda Bautro', 0),
(837, 'Administrator', '2022-04-28 23:25:14', 'Added Resident named Jimenez, Nonoy Albasin', 0),
(838, 'Administrator', '2022-04-28 23:28:45', 'Added Resident named Jimenez, Clint Albasin', 0),
(839, 'Administrator', '2022-04-28 23:29:22', 'Update Resident named Jimenez, Nonoy Albasin', 0),
(840, 'Administrator', '2022-04-28 23:29:49', 'Update Resident named Jimenez, Clint Albasin', 0),
(841, 'Administrator', '2022-04-29 00:06:07', 'Added Blotter Request by Marfa, Jose Quijano', 0),
(842, 'Administrator', '2022-04-29 00:07:36', 'Added Clearance with clearance number of ', 0),
(843, 'Administrator', '2022-04-29 00:08:41', 'Added Clearance with clearance number of ', 0),
(844, 'Administrator', '2022-05-01 14:11:41', 'Update Zone number ', 0),
(845, 'Administrator', '2022-05-01 17:28:37', 'Added Resident named Qiamco, Christine Aropo', 0),
(846, 'Administrator', '2022-05-03 01:12:24', 'Added Resident named Qiamco , Christine Marollano', 0),
(847, 'Administrator', '2022-05-10 19:13:51', 'Update Clearance with clearance number of ', 0),
(848, 'Administrator', '2022-05-10 19:14:05', 'Update Clearance with clearance number of ', 0),
(849, 'Administrator', '2022-05-10 19:14:22', 'Update Clearance with clearance number of ', 0),
(850, 'Administrator', '2022-05-10 19:14:39', 'Update Clearance with clearance number of ', 0),
(851, 'Administrator', '2022-05-10 19:14:49', 'Update Clearance with clearance number of ', 0),
(852, 'Administrator', '2022-05-10 19:15:00', 'Update Clearance with clearance number of ', 0),
(853, 'Administrator', '2022-05-10 19:15:10', 'Update Clearance with clearance number of ', 0),
(854, 'Administrator', '2022-05-10 19:15:24', 'Update Clearance with clearance number of ', 0),
(855, 'Administrator', '2022-05-10 19:15:40', 'Update Clearance with clearance number of ', 0),
(856, 'Administrator', '2022-05-10 19:15:55', 'Update Clearance with clearance number of ', 0),
(857, 'Administrator', '2022-05-10 19:16:08', 'Update Clearance with clearance number of ', 0),
(858, 'Administrator', '2022-05-10 19:16:21', 'Update Clearance with clearance number of ', 0),
(859, 'Administrator', '2022-05-10 19:16:34', 'Update Clearance with clearance number of ', 0),
(860, 'Administrator', '2022-05-10 19:16:49', 'Update Clearance with clearance number of ', 0),
(861, 'Administrator', '2022-05-10 19:17:04', 'Update Clearance with clearance number of ', 0),
(862, 'Administrator', '2022-05-10 19:17:30', 'Update Clearance with clearance number of ', 0),
(863, 'Administrator', '2024-03-14 15:10:42', 'Added Resident named John, Christian Fariola', 0),
(864, 'Administrator', '2024-03-14 15:17:04', 'Added Resident named Cena, Windel Ybañez', 0),
(865, 'Administrator', '2024-03-14 15:19:21', 'Added Resident named Cena, Windel Ybañez', 0),
(866, 'Administrator', '2024-03-14 15:23:08', 'Added Resident named Cena, Windel Ybañez', 0),
(867, 'Administrator', '2024-03-14 15:24:32', 'Added Resident named Cena, Windel Johfefe', 0),
(868, 'Administrator', '2024-03-14 15:28:18', 'Added Resident named Cena, Windel Ybañez', 0),
(869, 'Administrator', '2024-03-14 15:33:05', 'Added Resident named Cena, Windel Ybañez', 0),
(870, 'Administrator', '2024-03-14 15:35:19', 'Added Resident named Cena, Dianna Ybañez', 0),
(871, 'Administrator', '2024-03-14 15:46:52', 'Added Resident named Cena, Windel Ybañez', 0),
(872, 'Administrator', '2024-03-14 15:57:33', 'Added Resident named Cena, Windel Ybañez', 0),
(873, 'Administrator', '2024-03-14 16:06:39', 'Added Resident named Cena, Windel Ybañez', 0),
(874, 'Administrator', '2024-03-14 16:14:30', 'Added Resident named Cena, Windel Ybañez', 0),
(875, 'Administrator', '2024-04-04 08:44:26', 'Update Resident named Cena, Windel Ybañez', 0),
(876, 'Administrator', '2024-04-04 08:49:13', 'Update Resident named Cena, Dianna Ybañez', 0),
(877, 'Administrator', '2024-04-04 09:19:52', 'Added Resident named co, jam sad', 0),
(878, 'Administrator', '2024-04-04 15:34:54', 'Added Resident named Cena, Windel Ybañez', 0),
(879, 'Administrator', '2024-04-04 15:37:00', 'Added Resident named corridor, Dianna Ybañez', 0),
(880, 'Administrator', '2024-04-04 15:39:58', 'Added Resident named Fariola, Cristian escaran', 0),
(881, 'Administrator', '2024-04-04 15:46:01', 'Added Resident named Cena, Windel Ybañez', 0),
(882, 'Administrator', '2024-04-04 15:48:30', 'Added Resident named cena, Diana Ybañez', 0),
(883, 'Administrator', '2024-04-04 15:50:33', 'Added Resident named Fariola, john carascal', 0),
(884, 'Administrator', '2024-04-04 16:03:57', 'Added Resident named Fariola, jhon Ybañez', 0),
(885, 'Administrator', '2024-04-04 16:06:08', 'Added Resident named Cena, Dianna Ybañez', 0),
(886, 'Administrator', '2024-04-04 16:11:53', 'Added Resident named Cena, Dianna Ybañez', 0),
(887, 'Administrator', '2024-04-04 16:22:20', 'Added Resident named Cena, Windel Ybañez', 0),
(888, 'Administrator', '2024-04-04 16:23:33', 'Added Resident named Cena, Dianna Ybañez', 0),
(889, 'Administrator', '2024-04-04 16:25:31', 'Added Resident named Cena, Dianna Ybañez', 0),
(890, 'Administrator', '2024-04-04 16:28:38', 'Added Resident named Cena, Dianna Ybañez', 0),
(891, 'Administrator', '2024-04-04 16:32:22', 'Added Resident named Cena, dianna Ybañez', 0),
(892, 'Administrator', '2024-04-04 16:35:22', 'Added Resident named Cena, Donna Martus', 0),
(893, 'Administrator', '2024-04-04 16:41:36', 'Added Resident named Cena, Dianna Ybañez', 0),
(894, 'Administrator', '2024-04-04 16:50:37', 'Added Resident named Cena, Dianna Ybañez', 0),
(895, 'Administrator', '2024-04-04 17:04:54', 'Added Resident named Cena, Dianna Ybañez', 0),
(896, 'Administrator', '2024-04-04 17:28:57', 'Added Resident named Cena, Windel Ybañez', 0),
(897, 'Administrator', '2024-04-04 17:29:58', 'Added Resident named Cena, Dianna Ybañez', 0),
(898, 'Administrator', '2024-04-06 11:26:41', 'Added Resident named Cena, Windel Ybañez', 0),
(899, 'Administrator', '2024-04-16 07:19:38', 'Added Resident named Cena, Dianna Ybañez', 0),
(900, 'Administrator', '2024-04-16 14:50:55', 'Added Resident named Cena, Dianna Ybañez', 0),
(901, 'Administrator', '2024-04-16 16:16:32', 'Added Resident named Cena, Dianna Ybañez', 0),
(902, 'Administrator', '2024-12-18 11:31:22', 'Added Resident named cena, dayan ybanez', 0),
(903, 'Administrator', '2024-12-18 13:41:37', 'Added Resident named Cena, Windel Ybañez', 0),
(904, 'Administrator', '2024-09-18 13:49:00', 'Added Resident named Cena, Windel Ybañez', 0),
(905, 'Administrator', '2024-04-18 14:56:17', 'Added Resident named Cena, Windel Ybañez', 0),
(906, 'Administrator', '2024-04-18 15:06:39', 'Added Resident named mulle, agustin  compuesto ', 0),
(907, 'Administrator', '2024-04-18 15:22:24', 'Update Resident named ,  ', 0),
(908, 'Administrator', '2024-04-18 15:22:28', 'Update Resident named ,  ', 0),
(909, 'Administrator', '2024-04-18 15:34:21', 'Update Resident named ,  ', 0),
(910, 'Administrator', '2024-04-22 16:06:24', 'Added Resident named cena, Dianna Ybanez', 0),
(911, 'Administrator', '2024-04-22 16:41:50', 'Added Resident named cena, Dianna Ybanez', 0),
(912, 'Administrator', '2024-04-22 21:25:02', 'Added Resident named Cena, Dianna Ybañez', 0),
(913, 'Administrator', '2024-04-22 21:25:02', 'Added Resident named Cena, Dianna Ybañez', 0),
(914, 'Administrator', '2024-10-23 10:03:24', 'Added Resident named Cena, Dianna Ybañez', 0),
(915, 'Administrator', '2024-10-23 10:05:21', 'Added Resident named Cena, agustin  Ho', 0),
(916, 'Administrator', '2024-04-23 11:50:27', 'Added Resident named Cena, Windel Ybañez', 0),
(917, 'Administrator', '2024-04-24 20:21:50', 'Added Resident named mulle, agustin  compuesto', 0),
(918, 'Administrator', '2024-04-24 20:22:36', 'Added Resident named sasa, dsds dsds', 0),
(919, 'Administrator', '2024-04-24 20:22:37', 'Added Resident named sasa, dsds dsds', 0),
(920, 'Administrator', '2024-04-25 08:29:21', 'Added Resident named jj, xz zxzx', 0),
(921, 'Administrator', '2024-04-25 08:35:33', 'Added Resident named sds, dsdsds compuesto', 0),
(922, 'Administrator', '2024-05-13 19:49:00', 'Added Resident named Cena, Windel Ybañez', 0),
(923, 'Administrator', '2024-05-13 19:58:13', 'Update Zone number ', 0),
(924, 'Administrator', '2024-05-13 20:03:01', 'Update Zone number ', 0),
(925, 'Administrator', '2024-05-13 20:56:35', 'Update Resident named ,  ', 0),
(926, 'Administrator', '2024-05-14 11:38:02', 'Added Resident named Zaspa , Rosalie Batindaan', 0),
(927, 'Administrator', '2024-05-14 11:42:45', 'Added Resident named Negapatan, joryl Cena', 0),
(928, 'Administrator', '2024-05-15 07:43:30', 'Added Zone number Belinda Ybanez', 0),
(929, 'Administrator', '2024-05-15 08:00:22', 'Update Staff with name of Rossell, Renato', 0),
(930, 'Administrator', '2024-05-15 08:03:13', 'Added Staff with name of Cena, DiannaLyn', 0),
(931, 'Administrator', '2024-05-16 04:55:35', 'Added Resident named Cena , Brynel carascal', 0),
(932, 'Administrator', '2024-05-16 05:00:46', 'Added Resident named Cena, Brynel carascal', 0),
(933, 'Administrator', '2024-05-16 05:23:48', 'Added Zone number Belinda Ybanez', 0),
(934, 'Administrator', '2024-05-16 08:12:14', 'Added Official named Chavez Allen', 0),
(935, 'Administrator', '2024-05-16 11:18:47', 'Added Staff with name of danillo', 0),
(936, 'Administrator', '2024-05-16 11:27:35', 'Added Permit with business name of Fiesta', 0),
(937, 'Administrator', '2024-05-16 11:45:17', 'Update Clearance with clearance number of ', 0),
(938, 'Administrator', '2024-05-20 20:07:58', 'Added Permit with business name of cheche store', 0),
(939, 'Administrator', '2024-05-20 20:07:58', 'Added Permit with business name of cheche store', 0),
(940, 'Administrator', '2024-05-20 20:08:49', 'Update Clearance with clearance number of ', 0),
(941, 'Administrator', '2024-05-20 20:09:05', 'Update Clearance with clearance number of ', 0),
(942, 'Administrator', '2024-05-21 06:21:14', 'Added Permit with business name of Vlogs', 0),
(943, 'Administrator', '2024-05-21 06:22:21', 'Added Permit with business name of shopter', 0),
(944, 'Administrator', '2024-05-21 06:23:15', 'Update Blotter Request by Torro, Mark Gila', 0),
(945, 'Administrator', '2024-05-21 06:23:24', 'Update Blotter Request by jay, dsf asdf', 0),
(946, 'Administrator', '2024-05-21 06:23:57', 'Update Blotter Request by Quijano, Alfonso Gonjuran', 0),
(947, 'Administrator', '2024-05-21 06:26:33', 'Added Permit with business name of Fiesta', 0),
(948, 'Administrator', '2024-05-21 06:39:28', 'Added Permit with business name of Fiesta', 0),
(949, 'Administrator', '2024-07-28 13:10:14', 'Added Resident named sdsds, sdsds sdsdss', 0),
(950, 'Administrator', '2024-07-28 13:15:31', 'Added Resident named ghgf, gfhgfhh fghfghfhffg', 0),
(951, 'Administrator', '2024-07-28 14:40:17', 'Update Resident named ,  ', 0),
(952, 'Administrator', '2024-07-28 15:41:45', 'Update Resident named ,  ', 0),
(953, 'Administrator', '2024-07-28 18:27:08', 'Update Resident named ginsdsdss, rio miz', 0),
(954, 'Administrator', '2024-07-28 18:27:27', 'Update Resident named ginsdsd, riosdsds miz', 0),
(955, 'Administrator', '2024-07-28 18:34:52', 'Update Resident named ginsdss, rio miz', 0),
(956, 'Administrator', '2024-07-28 18:36:19', 'Update Resident named ginsdsdss, rio miz', 0),
(957, 'Administrator', '2024-07-28 18:36:26', 'Update Resident named ginsdsds, rio miz', 0),
(958, 'Administrator', '2024-07-28 18:37:43', 'Update Resident named ginsdsds, rio miz', 0),
(959, 'Administrator', '2024-07-28 22:05:52', 'Update Resident named ,  ', 0),
(960, 'Administrator', '2024-07-28 23:28:41', 'Update Staff with name of Rossell, Renatos', 0),
(961, 'Administrator', '2024-07-28 23:55:38', 'Added Staff with name of sadasdsadsa', 0),
(962, 'Administrator', '2024-07-29 00:03:39', 'Added Resident named sdfdsf, sdfsdfsd fsdfsdfsdfsdsdfsd', 0),
(963, 'Administrator', '2024-07-29 00:04:38', 'Added Resident named dsfdsfdsfsdfsdfsdfs, dsfdsfsdfsdfsdfsdfsd sdfdsfsdfdsfsdfsdfs', 0),
(964, 'Administrator', '2024-07-29 00:08:25', 'Added Resident named fsdfsdfsd, fsdfsdfds sdfsdfsdsdfs', 0),
(965, 'Administrator', '2024-07-29 01:02:13', 'Added Resident named sdfsdfsd, sdfsdfs fdsfsdfsd', 0),
(966, 'Administrator', '2024-07-29 01:07:36', 'Added Resident named rtretre, tertert retretere', 0),
(967, 'Administrator', '2024-07-29 18:23:23', 'Update Staff with name of Rossell, Renatoss', 0),
(968, 'Administrator', '2024-07-29 18:23:36', 'Update Staff with name of Rossell, Renatosss', 0),
(969, 'Administrator', '2024-07-29 21:48:07', 'Added Resident named dsfds, fsdfsd fsdfsdfsd', 0),
(970, 'Administrator', '2024-08-03 22:29:32', 'Added Resident named dsfds, dsfsd dsfdsfds', 0),
(971, 'Administrator', '2024-08-04 00:34:28', 'Added Resident named sdfsfsd, dsfsd fsdfsdfds', 0),
(972, 'Administrator', '2024-08-04 00:39:22', 'Added Resident named sds, sdd sdsds', 0),
(973, 'Administrator', '2024-08-04 00:43:00', 'Added Resident named fsdfs, fsdfs fsdfsdf', 0),
(974, 'Administrator', '2024-08-04 00:45:55', 'Added Resident named sds, ds ', 0),
(975, 'Administrator', '2024-08-04 01:10:40', 'Added Resident named dfd, dfdfd dfdfddf', 0),
(976, 'Administrator', '2024-08-04 01:18:01', 'Added Resident named sdsdfsd, sdfsdfs sdfsdfsd', 0),
(977, 'Administrator', '2024-08-05 16:51:09', 'Update Permit with business name of Fiesta', 0),
(978, 'Administrator', '2024-08-05 16:51:15', 'Update Permit with business name of cheche store', 0),
(979, 'Administrator', '2024-08-05 16:51:29', 'Update Permit with business name of Vlogs', 0),
(980, 'Administrator', '2024-08-05 16:51:36', 'Update Permit with business name of cheche store', 0),
(981, 'Administrator', '2024-08-05 16:51:43', 'Update Permit with business name of shopter', 0),
(982, 'Administrator', '2024-08-05 16:51:52', 'Update Permit with business name of Fiesta', 0),
(983, 'Administrator', '2024-08-05 16:51:57', 'Update Permit with business name of Fiesta', 0),
(984, 'Administrator', '2024-08-05 16:55:28', 'Update Zone number ', 0),
(985, 'Administrator', '2024-08-05 16:56:35', 'Update Zone number ', 0),
(986, 'Administrator', '2024-08-05 16:56:39', 'Update Zone number ', 0),
(987, 'Administrator', '2024-08-05 16:57:39', 'Update Zone number ', 0),
(988, 'Administrator', '2024-08-05 16:57:47', 'Update Zone number ', 0),
(989, 'Administrator', '2024-08-05 16:57:58', 'Update Zone number ', 0),
(990, 'Administrator', '2024-08-05 17:03:10', 'Update Zone number ', 0),
(991, 'Administrator', '2024-08-05 17:03:20', 'Update Zone number Belinda Yb', 0),
(992, 'Administrator', '2024-08-05 17:03:28', 'Update Zone number Belinda Yb', 0),
(993, 'Administrator', '2024-08-05 17:03:38', 'Update Zone number Belinda Yb', 0),
(994, 'Administrator', '2024-08-05 17:03:43', 'Update Zone number Belinda Yb', 0),
(995, 'Administrator', '2024-08-06 12:34:21', 'Update Household Number 7', 0),
(996, 'Administrator', '2024-08-06 12:52:35', 'Added Household Number 1', 0),
(997, 'Zone Leader', '2024-08-12 00:50:40', 'Update Blotter Request by Torro, Mark Gila', 0),
(998, 'Zone Leader', '2024-08-12 00:52:48', 'Added Blotter Request by Zaspa , Rosalie Batindaan', 0),
(999, 'Zone Leader', '2024-08-13 10:27:33', 'Added Staff with name of sdsds', 0),
(1000, 'Zone Leader', '2024-08-13 10:28:59', 'Added Zone number sdfsdfsdsd', 0),
(1001, 'Zone Leader', '2024-08-13 10:29:38', 'Added Zone number sdfsdfsdsd', 0),
(1002, 'Zone Leader', '2024-08-13 10:29:50', 'Added Zone number sdfsdfsdsd', 0),
(1003, 'Zone Leader', '2024-08-13 10:30:00', 'Added Zone number dsfsdfs', 0),
(1004, 'Zone Leader', '2024-08-13 10:30:25', 'Added Zone number dsfsdfs', 0),
(1005, 'Zone Leader', '2024-08-13 10:32:13', 'Added Household Number 1', 0),
(1006, 'Zone Leader', '2024-08-13 10:36:38', 'Added Household Number 1', 0),
(1007, 'Zone Leader', '2024-08-13 10:36:48', 'Added Household Number 1', 0),
(1008, 'Zone Leader', '2024-08-13 13:40:47', 'Added Zone number fdfdd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblnewresident`
--

CREATE TABLE `tblnewresident` (
  `id` int(11) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `bdate` varchar(20) NOT NULL,
  `bplace` text NOT NULL,
  `age` int(11) NOT NULL,
  `barangay` varchar(120) NOT NULL,
  `zone` varchar(11) NOT NULL,
  `totalhousehold` int(5) NOT NULL,
  `province` varchar(50) NOT NULL,
  `civilstatus` varchar(20) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `householdnum` int(11) NOT NULL,
  `lengthofstay` int(11) NOT NULL,
  `region` varchar(50) NOT NULL,
  `Citizenship` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `highestEducationalAttainment` varchar(50) NOT NULL,
  `formerAddress` text NOT NULL,
  `Municipality` text NOT NULL,
  `image` text NOT NULL,
  `statRes` tinyint(1) NOT NULL,
  `datemove` timestamp NULL DEFAULT NULL,
  `active` int(45) NOT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnewresident`
--

INSERT INTO `tblnewresident` (`id`, `lname`, `fname`, `mname`, `bdate`, `bplace`, `age`, `barangay`, `zone`, `totalhousehold`, `province`, `civilstatus`, `occupation`, `householdnum`, `lengthofstay`, `region`, `Citizenship`, `gender`, `highestEducationalAttainment`, `formerAddress`, `Municipality`, `image`, `statRes`, `datemove`, `active`, `status`) VALUES
(38, 'mulle', 'agustin ', 'compuesto', '2000-02-02', 'madridejos', 24, 'san agustin', 'Rosas', 2, 'cebu', 'Single', 'none', 2, 2024, 'catholic', 'sasasa', 'Male', 'High school graduate', 'san agutin madridejos cebu', 'madridejos', '1714003895514_download (1).jpg', 0, NULL, 1, NULL),
(41, 'cena', 'teodora', 'ybanez', '2000-07-21', 'pili, madifejos, cebu', 24, 'tugas, madridejos, cebu', 'Kumintang', 2, 'cebu', '', 'n/a', 23, 0, 'VI', 'filipino', '', 'High school, undergrad', 'pili, madifejos, cebu', 'madridejos', '1729847466326_2.jpg', 0, '2024-04-24 16:00:00', 0, NULL),
(76, 'Batiancila', 'Maria', 'Ybanez', '2002-02-09', 'Pili, madridejos, cebu', 22, 'tugas, madridejos, cebu', 'Rosas', 2, 'Cebu', 'Single', 'N/A', 2324, 0, 'VII', 'Filipino', 'Female', 'College, undergrad', 'Pili, Madridejos, Cebu', 'Madridejos', '1715044647702_t.jfif', 0, '2024-05-06 16:00:00', 0, NULL),
(77, 'Batiancila', 'Dianna', 'Ybanez', '0002-03-31', 'Pili, madridejos, cebu', 2022, 'tugas, madridejos, cebu', 'Rosas', 2, 'Cebu', 'Married', 'N/A', 23, 0, 'VII', 'Filipino', 'Female', 'High school graduate', 'Pili, Madridejos, Cebu', 'Madridejos', '1715044884889_2.png', 0, '2024-05-06 16:00:00', 0, NULL),
(78, 'Negapatan', 'jeanna', 'Ybanez', '2002-10-31', 'Pili, madridejos, cebu', 21, 'tugas, madridejos, cebu', 'Santan', 2, 'Cebu', 'Single', 'N/A', 1246534, 0, 'VII', 'Filipino', 'Female', 'College, undergrad', 'Pili, Madridejos, Cebu', 'Madridejos', '1715045230128_3 (2).png', 0, '2024-05-06 16:00:00', 0, NULL),
(79, 'Cena', 'Windel', 'Ybañez', '2000-12-22', 'pili, madridejos, cebu', 23, 'tugas, madridejos, cebu', 'Santan', 22, 'REGION VII (CENTRAL VISAYAS)', 'Single', 'student', 123, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'College, undergrad', 'Lower manol tisa', 'madridejos', '1731497167555_2.jpg', 0, '2024-05-12 16:00:00', 0, NULL),
(84, 'Cena', 'Windel', 'Ybañez', '2002-12-22', 'pili, madridejos, cebu', 21, 'tugas, madridejos, cebu', 'Bombil', 2, 'REGION VII (CENTRAL VISAYAS)', 'Single', 'student', 2, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Female', 'High school, undergrad', 'Lower manol tisa', 'madridejos', '1722186808607_img-2_2.jpg', 0, '2024-05-13 16:00:00', 0, ''),
(85, 'Cena', 'Brynel', 'carascal', '2000-04-20', 'kodia, madridejos, cebu', 24, 'tugas, madridejos, cebu', 'Santan', 2, 'REGION VII (CENTRAL VISAYAS)', 'Single', 'n/a', 234, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Female', 'High school graduate', 'kodia, madridejos, cebu', 'madridejos', '1715807057603_Messenger_creation_75d61bbd-5ac3-48c6-a13d-cfd18ec89b1c.jpeg', 0, '2023-10-15 16:00:00', 0, NULL),
(86, 'Cena', 'Windel', 'Ybañez', '2000-12-22', 'pili, madridejos, cebu', 23, 'tugas, madridejos, cebu', 'Bombil', 2, 'REGION VII (CENTRAL VISAYAS)', 'Married', 'n/a', 213, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'College, undergrad', 'Lower manol tisa', 'madridejos', '1715826916922_Messenger_creation_cc675ffb-6312-4eb4-9810-7cbf10ddfb4d.jpeg', 0, '2024-05-15 16:00:00', 0, NULL),
(87, 'Cenas', 'Windel', 'Ybañez', '1998-11-22', 'pili, madridejos, cebu', 24, 'tugas, madridejos, cebu', 'Bombil', 3, 'REGION VII (CENTRAL VISAYAS)', 'Married', 'n/a', 123, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'Bachelor’s degree', 'Lower manol tisa', 'madridejos', '1731724631175_Messenger_creation_3561c86b-325e-4ab1-97f6-2f5dd9048e11.jpeg', 0, '2024-05-15 16:00:00', 0, ''),
(89, '   sdsdss', 'dsdsd', 'sdsdsds', '2024-07-18', 'dfdfdf', 0, 'sdsds', 'Rosas', 33, 'dfdfdfd', 'Senior', 'fgfdgdgdf', 32322, 0, 'dfdfd', 'dfgdfgdfgfd', 'Male', 'High school, undergrad', 'fdgdfgfdgfd', 'dfdfdf', '1722148688541_Screenshot (16).png', 0, '2024-08-03 16:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblofficial`
--

CREATE TABLE `tblofficial` (
  `id` int(11) NOT NULL,
  `sPosition` varchar(50) NOT NULL,
  `completeName` text NOT NULL,
  `pcontact` varchar(20) NOT NULL,
  `paddress` text NOT NULL,
  `termStart` date NOT NULL,
  `termEnd` date NOT NULL,
  `barangay` text DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblofficial`
--

INSERT INTO `tblofficial` (`id`, `sPosition`, `completeName`, `pcontact`, `paddress`, `termStart`, `termEnd`, `barangay`, `status`, `deleted`, `date_created`) VALUES
(6, 'Captain', 'Capt. Allen Chavez', '234234', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(7, 'Kagawad(Health)', 'Hon. Marissa Tayactac', '67567', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(8, 'Kagawad(Budget & Finance)', 'Hon. Gina Fernandez', '35454', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(9, 'Kagawad(Socio-Cultural Affairs)', 'Hon. Brendo Batasin-in', '3453545', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(10, 'Kagawad(Education)', 'Hon. Evelyn Chavez', '4245', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(11, 'Kagawad(Infrastracture)', 'Hon. Roberto Potayre', '231', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(12, 'SK Chairman', 'Hon. Ian Anthony Masuangat', '089282', 'Tugas,Madridejos,Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(13, 'Barangay Secretary', 'Angel Taves', '29920', 'Negros', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38'),
(14, 'Barangay Treasurer', 'Renato Rossell', '089282', 'Tugas, Madridejos, Cebu', '2018-10-06', '2022-11-17', NULL, 'Ongoing Term', 0, '2024-08-08 04:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblpermit`
--

CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL,
  `residentid` int(11) NOT NULL,
  `businessName` text NOT NULL,
  `businessAddress` text NOT NULL,
  `typeOfBusiness` varchar(50) NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpermit`
--

INSERT INTO `tblpermit` (`id`, `residentid`, `businessName`, `businessAddress`, `typeOfBusiness`, `orNo`, `samount`, `dateRecorded`, `recordedBy`, `status`, `isRead`, `date_created`) VALUES
(2, 11, 'test', 'Tarong', 'Option 2', 213, 2132131, '2022-01-10', '', 'Disapproved', 0, '2024-08-08 05:10:00'),
(66, 26, 'Megs21 Shop', 'Tugas, Madridejos, Cebu', '', 0, 0, '2022-04-25', 'megmeg', 'Disapproved', 0, '2024-08-08 05:10:00'),
(72, 18, 'Coffe shop', 'Tugas,Madridejos,Cebu', '', 0, 0, '2022-04-27', 'nothing', 'Disapproved', 0, '2024-08-08 05:10:00'),
(73, 33, 'Motor Tradings', 'Tugas,Madridejos,Cebu', '', 0, 0, '2022-04-27', 'arnine', 'New', 0, '2024-08-08 05:10:00'),
(75, 36, 'Reds Barber shop', 'Tugas Madridejos, Cebu', '', 0, 0, '2022-04-27', 'red', 'New', 0, '2024-08-08 05:10:00'),
(77, 73, 'Snack Huz', 'Tugas Madridejos, Cebu', '', 0, 0, '2022-04-29', 'clint', 'New', 0, '2024-08-08 05:10:00'),
(78, 88, 'Fiesta', 'Pili', '', 123, 105, '2024-05-16', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(79, 87, 'cheche store', 'Maalat', '', 12, 105, '2024-05-20', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(80, 87, 'cheche store', 'Kodia', '', 12, 105, '2024-05-20', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(81, 89, 'Vlogs', 'Kangwayan', '', 12123, 105, '2024-05-21', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(82, 83, 'shopter', 'Bunakan', '', 12, 105, '2024-05-21', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(83, 88, 'Fiesta', 'Tabagak', '', 535645, 105, '2024-05-21', 'angel', 'Approved', 0, '2024-08-08 05:10:00'),
(84, 88, 'Fiesta', 'Tarong', '', 563, 105, '2024-05-21', 'angel', 'Approved', 0, '2024-08-08 05:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblproject`
--

CREATE TABLE `tblproject` (
  `id` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `date_of_project` date NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `barangay` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproject`
--

INSERT INTO `tblproject` (`id`, `description`, `date_of_project`, `project_name`, `date_created`, `barangay`) VALUES
(1, 'fdsserer', '2024-06-22', 'karsada', '2024-08-08 05:08:03', NULL),
(2, 'kdjfkas;df', '2024-07-01', 'karsada', '2024-08-08 05:08:03', 'Tarong');

-- --------------------------------------------------------

--
-- Table structure for table `tblpurok`
--

CREATE TABLE `tblpurok` (
  `id` int(11) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `purok` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpwd`
--

CREATE TABLE `tblpwd` (
  `id` int(11) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `bdate` int(11) NOT NULL,
  `bplace` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `barangay` varchar(45) NOT NULL,
  `zone` varchar(45) NOT NULL,
  `totalhousehold` int(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `civilstatus` varchar(45) NOT NULL,
  `occupation` varchar(45) NOT NULL,
  `householdnum` int(11) NOT NULL,
  `lengthofstay` int(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `Citizenship` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `highestEducationalAttainment` varchar(45) NOT NULL,
  `formerAddress` varchar(45) NOT NULL,
  `Municipality` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `statRes` varchar(45) NOT NULL,
  `datemove` date NOT NULL,
  `active` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpwd`
--

INSERT INTO `tblpwd` (`id`, `lname`, `fname`, `mname`, `bdate`, `bplace`, `age`, `barangay`, `zone`, `totalhousehold`, `province`, `civilstatus`, `occupation`, `householdnum`, `lengthofstay`, `region`, `Citizenship`, `gender`, `highestEducationalAttainment`, `formerAddress`, `Municipality`, `image`, `username`, `password`, `statRes`, `datemove`, `active`) VALUES
(1, 'Carcosia', 'Jorissa', 'Arcaza', 2023, 'Talangnan Madridejos Cebu', 1, 'Talanganan', 'Bombil', 3, 'cebu', 'PWD', 'accountant', 4, 0, '7', 'filipino', 'Female', 'Elementary', 'Talangnan', 'Madridejos', '1720527625166_5.png', '', '', '', '2024-07-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblresident`
--

CREATE TABLE `tblresident` (
  `id` int(11) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `bdate` varchar(20) NOT NULL,
  `bplace` text NOT NULL,
  `age` int(11) NOT NULL,
  `barangay` varchar(120) NOT NULL,
  `zone` varchar(11) NOT NULL,
  `totalhousehold` int(5) NOT NULL,
  `province` varchar(50) NOT NULL,
  `civilstatus` varchar(20) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `householdnum` int(11) NOT NULL,
  `lengthofstay` int(11) NOT NULL,
  `region` varchar(50) NOT NULL,
  `Citizenship` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `highestEducationalAttainment` varchar(50) NOT NULL,
  `formerAddress` text NOT NULL,
  `Municipality` text NOT NULL,
  `image` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `statRes` tinyint(1) NOT NULL,
  `status` text DEFAULT NULL,
  `datemove` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresident`
--

INSERT INTO `tblresident` (`id`, `lname`, `fname`, `mname`, `bdate`, `bplace`, `age`, `barangay`, `zone`, `totalhousehold`, `province`, `civilstatus`, `occupation`, `householdnum`, `lengthofstay`, `region`, `Citizenship`, `gender`, `highestEducationalAttainment`, `formerAddress`, `Municipality`, `image`, `username`, `password`, `statRes`, `status`, `datemove`, `date_created`) VALUES
(82, 'Cena', 'Windel', 'Ybañez', '2000-10-14', 'pili, madridejos, cebu', 23, 'tugas, madridejos, cebu', 'Rosas', 123, 'REGION VII (CENTRAL VISAYAS)', 'single', 'student', 123, 2, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'Elementary', 'Lower manol tisa', 'madridejos', '1712191466186_download.png', '12', '$2y$10$8p1k47ifOGnbtJrGj0d/h.CxHudBUNiFgZs8egixEog', 0, NULL, '', '2024-08-01 05:05:53'),
(83, 'Cena', 'Dianna', 'Ybañez', '1992-01-14', 'pili, madridejos, cebu', 32, 'tugas, madridejos, cebu', 'Rosas', 123, 'REGION VII (CENTRAL VISAYAS)', 'single', 'student', 123, 2, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'No schooling completed', 'Lower manol tisa', 'madridejos', '1710401719333_download.png', 'log', '$2y$10$AMIwRpyuHjyz1y3fsIEMmeIrfvRfjSQZLq4AfhQETH6', 0, NULL, '', '2024-08-05 05:05:53'),
(84, 'Cena', 'Windel', 'Ybañez', '1991-03-14', 'pili, madridejos, cebu', 33, 'tugas, madridejos, cebu', 'Rosas', 123, 'REGION VII (CENTRAL VISAYAS)', 'single', 'student', 123, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'No schooling completed', 'Lower manol tisa', 'madridejos', '1710402412485_410979061_1787700141658353_6460081703238133723_n.jpg', 'jh', '$2y$10$KZVQz5O10/MKS3nIBw0IEePU8luJpYvaFOAuw4YOSlL', 0, NULL, '', '2024-08-05 05:05:53'),
(87, 'Cena', 'Windel', 'Ybañez', '1998-11-22', 'pili, madridejos, cebu', 25, 'Tarong', 'Bombil', 3, 'REGION VII (CENTRAL VISAYAS)', 'Married', 'n/a', 123, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'Bachelor’s degree', 'Lower manol tisa', 'madridejos', '1715600940039_2.jpg', 'jahh', '$2y$10$j7llqemFThlh75jgYTNoBeBtsZ5Emdt/tTPALXFdkJW', 0, 'InActive', '', '2024-08-05 05:05:53'),
(88, 'Zaspa ', 'Rosalie', 'Batindaan', '2002-11-14', 'pili, madridejos, cebu', 21, 'tugas, madridejos, cebu', 'Santan', 2, 'REGION VII (CENTRAL VISAYAS)', 'single', 'n/a', 1, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Female', 'College, undergrad', 'pili, Madrridejos, cebu', 'madridejos', '1715657882742_2.png', '', '$2y$10$gCBp/oVEBh1GE6Ldz.hHz.vAcISVxCIexzGthKiRGRl', 0, NULL, '', '2024-08-08 05:05:53'),
(89, 'Negapatan', 'joryl', 'Cena', '2002-12-10', 'pili, madridejos, cebu', 21, 'Tarong', 'Bombil', 2, 'REGION VII (CENTRAL VISAYAS)', 'single', 'n/a', 34, 0, 'REGION VII (CENTRAL VISAYAS)', 'filipino', 'Male', 'College, undergrad', 'pili, Madrridejos, cebu', 'madridejos', '1715658165871_2.png', 'joryl', '$2y$10$qYFzkNEGsQX5kZ9B.049h.iHj.drQ9oN5K2AZOHt/GG', 0, 'Pregnant', '', '2024-08-08 05:05:53'),
(93, 'dsfdsssss', 'dsfsd', 'dsfdsfds', '2024-08-22', 'fdgfdgfdgd', 0, 'Tarong', 'Rosas', 22, 'ewrwer', 'Senior', 'ersdfsdf', 3232, 0, 'dsdsds', 'dsfsdfs', 'Male', 'No schooling completed', 'sdfsdfds', 'sdsds', '1722704488315_exit.png', '', '$2y$10$Adb4tUobsDMlEUzwsCwXU.YSMkbirwSkLFE8SPnir5s', 0, 'Senior', '1970-01-01', '2024-08-08 05:05:53'),
(94, 'sdfsfsd', 'dsfsd', 'fsdfsdfds', '2024-08-16', 'sdfsdf', 0, 'Tarong', 'Bombil', 33, 'sdfsdfsd', 'PWD', 'fdsfsd', 423423, 0, 'sdfsdf', 'dsfsdf', 'Male', 'High school, undergrad', 'sdfsdfs', 'ewrewrwe', '1722702868376_ERD_TMS.png', '', '$2y$10$R3luEHxNKe8e8KlkhqvYRuEzLNBJJHzQJa614xEkuEs', 0, 'PWD', '1970-01-01', '2024-08-08 05:05:53'),
(95, 'sds', 'sdd', 'sdsds', '2024-08-22', 'sdsd', 0, 'Maalat', 'Bombil', 2, 'sds', 'Married', 'dsds', 232323, 0, 'dsdsdsssssss', 'sdsds', 'Female', 'High school graduate', 'sdsds', 'sdsd', '1722703162367_ERD_TMS.png', '', '$2y$10$WCM3Sa1DqWeQNSSNlDcB9.wTF2pVnKsxfKv296satYK', 0, 'Pregnant', '1970-01-01', '2024-08-08 05:05:53'),
(96, 'fsdfs', 'fsdfs', 'fsdfsdf', '2024-08-13', 'sdfsdf', 0, 'Tarong', 'Bombil', 22, 'sdfsdfs', 'Widow', 'sdfsdf', 23232, 0, 'sdfsdf', 'sdfsdf', 'Male', '', 'sdfsd', 'sdfsdfs', '1722703380343_ERD_TMS.png', '', '$2y$10$kbcmGbOE.BBrQ/gfGpwDo.7N/amh0s6QUT.68tnwpas', 0, 'Active', '2024-08-07', '2024-08-08 05:05:53'),
(97, 'sds', 'ds', '', '2024-08-22', 'dsds', 0, 'Kodia', 'Kumintang', 2, 'dsds', 'New Resident', 'sdsd', 23232, 0, 'dsdsds', 'sdsd', 'Female', 'High school, undergrad', 'sdsd', 'sdsds', '1722703555402_c3046238-3454-4b49-8a71-f4205b7ab03e.jpeg', '', '$2y$10$kVYv3fVWBajf4L723rSpuee.4oAo.D4fyf0ssMNqa/0', 0, 'New Resident', '2024-08-14', '2024-08-08 05:05:53'),
(98, 'dfd', 'dfdfd', 'dfdfddf', '2024-08-28', 'dfsdfdsf', 0, 'Tarong', 'Santan', 22, 'sdfsdfs', 'Widow', 'dfsdf', 23232, 0, 'dsds', 'sdfsd', 'Female', 'High school graduate', 'sdfsdfsd', 'sds', '1722705040998_store-svgrepo-com.png', '', '$2y$10$WxwPbNu5ZI/peCo5i0ncneTEGIxg99BbQ6IjU.gztwe', 0, 'New Resident', '2024-08-08', '2024-08-08 05:05:53'),
(99, 'sdsdfsd', 'sdfsdfs', 'sdfsdfsd', '2024-08-03', 'sdfsd', 0, 'Bunakan', 'Santan', 22, 'fsdfdsfsd', 'Married', 'dsfdsfs', 232323, 0, 'fsfsdf', 'sdfsdf', 'Male', 'Elementary', 'sdfsdsfd', 'fsdfsdsf', '1722705481999_DSC08046-removebg-preview.png', '', '$2y$10$LUePi.MuRsynYMrWfiBrDOCL14ut/c7Nvh/O1z8rcYK', 0, 'InActive', '2024-08-15', '2024-08-08 05:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblsession`
--

CREATE TABLE `tblsession` (
  `date_of_session` date NOT NULL,
  `session` varchar(45) NOT NULL,
  `id` int(11) NOT NULL,
  `barangay` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsession`
--

INSERT INTO `tblsession` (`date_of_session`, `session`, `id`, `barangay`, `date_created`) VALUES
('2024-06-22', 'meeting with barangay chairman', 3, NULL, '2024-08-08 05:10:38'),
('2024-07-12', 'meeting', 4, 'Tarong', '2024-08-08 05:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblsettings`
--

CREATE TABLE `tblsettings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsettings`
--

INSERT INTO `tblsettings` (`id`, `user_id`, `name`, `logo`, `date_updated`, `date_created`) VALUES
(1, 1, 'Barangay Management System', 'tugas_logo.png', '2024-08-08 13:31:10', '2024-08-08 05:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblstaff`
--

CREATE TABLE `tblstaff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `barangay` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstaff`
--

INSERT INTO `tblstaff` (`id`, `name`, `username`, `password`, `deleted`, `date_created`, `barangay`) VALUES
(8, 'Rossell, Renato', 'Renato@gmail.com', 'Rossell', 0, '2024-08-08 05:11:07', NULL),
(9, 'Cena, DiannaLyn', 'dianna@gmail.com', '12345678', 0, '2024-08-08 05:11:07', NULL),
(10, 'danillo', 'danilo', 'danilo', 0, '2024-08-08 05:11:07', NULL),
(12, 'sdsds', 'admin@gmail.com', 'admin123', 0, '2024-08-13 02:27:33', 'Tarong');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `barangay` text NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 1,
  `verification` text DEFAULT NULL,
  `isApproved` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `username`, `password`, `type`, `barangay`, `deleted`, `date_created`, `status`, `verification`, `isApproved`) VALUES
(1, 'angel', '$2y$10$CQGGWQIQMbBpfmaf/UClI.PKbtjvqYWAzL.Vx3/6W8iFNQbPggU.q', 'administrator', '', 0, '2024-08-08 05:11:50', 1, NULL, 1),
(2, 'marry@gmail.com', 'Taves', 'Secretary', '', 0, '2024-08-08 05:11:50', 1, NULL, 1),
(16, 'kodia@gmail.com', '$2y$10$CI2nEc98Jgyk5CceuerqnOw3ctNriJwF9AWxFVB1UY08mGLDU/u5m', 'Zone Leader', 'Kodia', 0, '2024-11-23 03:41:06', 1, '67414ecdbe05c583699675', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitor`
--

CREATE TABLE `tblvisitor` (
  `id` int(11) NOT NULL,
  `date_of_visit` int(11) NOT NULL,
  `name_of_visitor` varchar(45) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblvisitor`
--

INSERT INTO `tblvisitor` (`id`, `date_of_visit`, `name_of_visitor`, `date_created`) VALUES
(1, 2024, 'Jorissa Arcaza Carcosia', '2024-08-08 05:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblzone`
--

CREATE TABLE `tblzone` (
  `id` int(5) NOT NULL,
  `zone` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `barangay` text DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `isApproved` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblzone`
--

INSERT INTO `tblzone` (`id`, `zone`, `username`, `password`, `barangay`, `deleted`, `date_created`, `isApproved`) VALUES
(0, 'fdfdd', 'admin@gmail.com', 'admin123', 'Tarong', 0, '2024-08-13 05:40:47', 1),
(2, 'Belinda Yb', 'mahal', '12345678', NULL, 0, '2024-08-08 05:12:23', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblactivity`
--
ALTER TABLE `tblactivity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblactivityphoto`
--
ALTER TABLE `tblactivityphoto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblotter`
--
ALTER TABLE `tblblotter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclearance`
--
ALTER TABLE `tblclearance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhousehold`
--
ALTER TABLE `tblhousehold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnewresident`
--
ALTER TABLE `tblnewresident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblofficial`
--
ALTER TABLE `tblofficial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpermit`
--
ALTER TABLE `tblpermit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproject`
--
ALTER TABLE `tblproject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpurok`
--
ALTER TABLE `tblpurok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpwd`
--
ALTER TABLE `tblpwd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresident`
--
ALTER TABLE `tblresident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsession`
--
ALTER TABLE `tblsession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsettings`
--
ALTER TABLE `tblsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstaff`
--
ALTER TABLE `tblstaff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblzone`
--
ALTER TABLE `tblzone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblactivity`
--
ALTER TABLE `tblactivity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblactivityphoto`
--
ALTER TABLE `tblactivityphoto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tblblotter`
--
ALTER TABLE `tblblotter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tblclearance`
--
ALTER TABLE `tblclearance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `tblhousehold`
--
ALTER TABLE `tblhousehold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `tblnewresident`
--
ALTER TABLE `tblnewresident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `tblofficial`
--
ALTER TABLE `tblofficial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblpermit`
--
ALTER TABLE `tblpermit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tblproject`
--
ALTER TABLE `tblproject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpurok`
--
ALTER TABLE `tblpurok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpwd`
--
ALTER TABLE `tblpwd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblresident`
--
ALTER TABLE `tblresident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tblsession`
--
ALTER TABLE `tblsession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblsettings`
--
ALTER TABLE `tblsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblstaff`
--
ALTER TABLE `tblstaff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
