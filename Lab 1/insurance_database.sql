-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 08:15 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `report_num` int(11) NOT NULL,
  `accident_date` date DEFAULT NULL,
  `location` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`report_num`, `accident_date`, `location`) VALUES
(1, '2000-09-12', 'Mysoe road'),
(2, '2005-01-01', 'SouthEnd circle'),
(3, '2008-05-03', 'Bull Temple road'),
(4, '2008-02-08', 'Kankapura'),
(5, '2006-02-03', 'Mysoe road');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `reg_num` char(10) NOT NULL,
  `model` char(10) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`reg_num`, `model`, `year`) VALUES
('KA05001', 'i10', 2016),
('KA05002', 'Verna', 2017),
('KA05003', 'Safari', 2018),
('KA05004', 'TUV300', 2019),
('KA05005', 'alto', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `driver_id` char(20) NOT NULL,
  `reg_num` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owns`
--

INSERT INTO `owns` (`driver_id`, `reg_num`) VALUES
('A01', 'KA05001'),
('A02', 'KA05002'),
('A03', 'KA05003'),
('A04', 'KA05004'),
('A05', 'KA05005');

-- --------------------------------------------------------

--
-- Table structure for table `participated`
--

CREATE TABLE `participated` (
  `driver_id` char(10) NOT NULL,
  `reg_num` char(10) NOT NULL,
  `report_num` int(11) NOT NULL,
  `damage_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participated`
--

INSERT INTO `participated` (`driver_id`, `reg_num`, `report_num`, `damage_amount`) VALUES
('A01', 'KA05001', 1, 5000),
('A02', 'KA05002', 2, 25000),
('A03', 'KA05003', 3, 15000),
('A04', 'KA05004', 4, 20000),
('A05', 'KA05005', 5, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `driver_id` char(10) NOT NULL,
  `name` char(20) NOT NULL,
  `address` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`driver_id`, `name`, `address`) VALUES
('A01', 'Abhishek', 'Majestic'),
('A02', 'Rohit', 'Jail More'),
('A03', 'Ryan', 'KR Market'),
('A04', 'Shiv', 'KPS'),
('A05', 'Zyan', 'Rajaji Nagar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`report_num`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`reg_num`);

--
-- Indexes for table `owns`
--
ALTER TABLE `owns`
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `reg_num` (`reg_num`);

--
-- Indexes for table `participated`
--
ALTER TABLE `participated`
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `reg_num` (`reg_num`),
  ADD KEY `report_num` (`report_num`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`driver_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`reg_num`) REFERENCES `car` (`reg_num`);

--
-- Constraints for table `participated`
--
ALTER TABLE `participated`
  ADD CONSTRAINT `participated_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `participated_ibfk_2` FOREIGN KEY (`reg_num`) REFERENCES `car` (`reg_num`),
  ADD CONSTRAINT `participated_ibfk_3` FOREIGN KEY (`report_num`) REFERENCES `accident` (`report_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
