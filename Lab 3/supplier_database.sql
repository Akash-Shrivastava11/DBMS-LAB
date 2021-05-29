-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 08:21 AM
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
-- Database: `supplier database`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `sid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `cost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`sid`, `pid`, `cost`) VALUES
(110, 1, 23),
(110, 2, 45),
(110, 3, 86),
(110, 10, 73),
(110, 27, 93),
(110, 32, 20),
(110, 89, 120),
(123, 1, 43),
(123, 2, 18),
(123, 10, 33),
(123, 32, 32),
(785, 1, 13),
(785, 32, 62),
(345, 1, 53),
(345, 27, 45),
(345, 32, 82),
(345, 89, 109),
(876, 2, 25),
(876, 3, 72),
(876, 32, 23);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `pid` int(11) NOT NULL,
  `pname` char(15) DEFAULT NULL,
  `color` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`pid`, `pname`, `color`) VALUES
(1, 'Screw', 'red'),
(2, 'Bearing', 'red'),
(3, 'Nut', 'grey'),
(10, 'Bolt', 'red'),
(27, 'panner', 'grey'),
(32, 'rubbergrip', 'red'),
(89, 'rubbergrip', 'grey');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sid` int(11) NOT NULL,
  `sname` char(15) DEFAULT NULL,
  `address` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sid`, `sname`, `address`) VALUES
(110, 'Anand pvt ltd.', 'Jamshedpur'),
(123, 'Srinivas hardwa', 'Banglore'),
(345, 'Bablu enterpris', 'Delhi'),
(785, 'Raghav industri', 'Vellore'),
(876, 'Ramnihal motors', 'Mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD KEY `sid` (`sid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `suppliers` (`sid`),
  ADD CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `parts` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
