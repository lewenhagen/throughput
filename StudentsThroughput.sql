-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2016 at 08:42 AM
-- Server version: 5.5.46-0+deb7u1
-- PHP Version: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `StudentsThroughput`
--
CREATE DATABASE IF NOT EXISTS `StudentsThroughput` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `StudentsThroughput`;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
CREATE TABLE IF NOT EXISTS `Course` (
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Kmom`
--

DROP TABLE IF EXISTS `Kmom`;
CREATE TABLE IF NOT EXISTS `Kmom` (
  `kmomNr` varchar(11) COLLATE utf8_swedish_ci NOT NULL,
  `attendedLab` tinyint(1) DEFAULT '0',
  `onTime` tinyint(1) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `courseCode` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `student` varchar(10) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- RELATIONS FOR TABLE `Kmom`:
--   `student`
--       `Student` -> `birthdate`
--   `courseCode`
--       `Course` -> `code`
--

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
CREATE TABLE IF NOT EXISTS `Student` (
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `birthdate` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `reasoneQuit` text COLLATE utf8_swedish_ci,
  `dateQuit` datetime DEFAULT NULL,
  `ambitions` text COLLATE utf8_swedish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
 ADD PRIMARY KEY (`code`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `Kmom`
--
ALTER TABLE `Kmom`
 ADD PRIMARY KEY (`kmomNr`,`courseCode`,`student`), ADD KEY `courseCode` (`courseCode`), ADD KEY `kmomToStudent` (`student`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
 ADD PRIMARY KEY (`birthdate`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Kmom`
--
ALTER TABLE `Kmom`
ADD CONSTRAINT `kmomToStudent` FOREIGN KEY (`student`) REFERENCES `Student` (`birthdate`),
ADD CONSTRAINT `Kmom_ibfk_1` FOREIGN KEY (`courseCode`) REFERENCES `Course` (`code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
