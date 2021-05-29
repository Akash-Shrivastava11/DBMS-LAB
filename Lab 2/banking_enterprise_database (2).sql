-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 08:16 AM
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
-- Database: `banking enterprise database`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankaccount`
--

CREATE TABLE `bankaccount` (
  `accno` int(11) NOT NULL,
  `branchname` char(30) DEFAULT NULL,
  `balance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankaccount`
--

INSERT INTO `bankaccount` (`accno`, `branchname`, `balance`) VALUES
(1, 'SBI_Chamrajpet', 2000),
(2, 'SBI_ResidencyRd', 5000),
(4, 'SBI_ParliamentRd', 6000),
(5, 'SBI_Jantarmantar', 8000),
(8, 'SBI_ResidencyRd', 4000),
(9, 'SBI_ParliamentRd', 3000),
(10, 'SBI_ResidencyRd', 5000),
(11, 'SBI_Jantarmantar', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `bankcostumer`
--

CREATE TABLE `bankcostumer` (
  `costumername` char(30) NOT NULL,
  `costumerstreet` char(30) DEFAULT NULL,
  `costumercity` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankcostumer`
--

INSERT INTO `bankcostumer` (`costumername`, `costumerstreet`, `costumercity`) VALUES
('Avinash', 'Bull_Temple_road', 'Banglore'),
('Dinesh', 'Prithviraj_Road', 'Delhi'),
('Mohan', 'National_College_Road', 'Banglore'),
('Nikhil', 'Abc_road', 'Delhi'),
('Ravi', 'Temple_road', 'Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchname` char(30) NOT NULL,
  `branchcity` char(30) DEFAULT NULL,
  `assets` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchname`, `branchcity`, `assets`) VALUES
('SBI_Chamrajpet', 'Banglore', 50000),
('SBI_Jantarmantar', 'Banglore', 50000),
('SBI_ParliamentRd', 'Banglore', 10000),
('SBI_ResidencyRd', 'Banglore', 10000),
('SBI_ShivajiRd', 'Delhi', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `costumername` char(30) NOT NULL,
  `accno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`costumername`, `accno`) VALUES
('Avinash', 1),
('Avinash', 8),
('Dinesh', 2),
('Dinesh', 10),
('Nikhil', 4),
('Nikhil', 9),
('Nikhil', 11),
('Ravi', 2),
('Ravi', 5);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loannumber` int(11) NOT NULL,
  `branchname` char(30) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loannumber`, `branchname`, `amount`) VALUES
(1, 'SBI_Chamrajpet', 1000),
(2, 'SBI_ResidencyRd', 2000),
(3, 'SBI_ShivajiRd', 3000),
(4, 'SBI_ParliamentRd', 4000),
(5, 'SBI_Jantarmantar', 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD PRIMARY KEY (`accno`),
  ADD KEY `branchname` (`branchname`);

--
-- Indexes for table `bankcostumer`
--
ALTER TABLE `bankcostumer`
  ADD PRIMARY KEY (`costumername`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchname`);

--
-- Indexes for table `depositor`
--
ALTER TABLE `depositor`
  ADD PRIMARY KEY (`costumername`,`accno`),
  ADD KEY `accno` (`accno`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loannumber`),
  ADD KEY `branchname` (`branchname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD CONSTRAINT `bankaccount_ibfk_1` FOREIGN KEY (`branchname`) REFERENCES `branch` (`branchname`);

--
-- Constraints for table `depositor`
--
ALTER TABLE `depositor`
  ADD CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`costumername`) REFERENCES `bankcostumer` (`costumername`),
  ADD CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`accno`) REFERENCES `bankaccount` (`accno`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branchname`) REFERENCES `branch` (`branchname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
