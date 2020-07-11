-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 05:24 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_admir_saraseli_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_admir_saraseli_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_admir_saraseli_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `delivered`
--

CREATE TABLE `delivered` (
  `delivered_no` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_loc_no` int(11) NOT NULL,
  `delivered` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivered`
--

INSERT INTO `delivered` (`delivered_no`, `date_time`, `rec_loc_no`, `delivered`) VALUES
(1, '2020-07-11 16:30:04', 1, 1),
(2, '2020-07-11 16:30:04', 2, 1),
(3, '2020-07-11 16:30:04', 3, 1),
(4, '2020-07-11 16:30:04', 4, 1),
(5, '2020-07-11 16:30:04', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_no` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `ssn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_no`, `first_name`, `last_name`, `hire_date`, `ssn`) VALUES
(1, 'Georgi', 'Facello', '2008-06-26', '0001'),
(2, 'Bezalel', 'Simmel', '2010-02-26', '0002'),
(3, 'Parto', 'Bamford', '2009-04-14', '0003'),
(4, 'Chirstian', 'Koblick', '2009-01-10', '0004');

-- --------------------------------------------------------

--
-- Table structure for table `mail_delivery_services`
--

CREATE TABLE `mail_delivery_services` (
  `mds_no` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `mds_add_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `pac_mail_no` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mail_delivery_services`
--

INSERT INTO `mail_delivery_services` (`mds_no`, `date_time`, `mds_add_id`, `sender_id`, `pac_mail_no`, `recipient_id`) VALUES
(1, '2020-07-13 15:39:16', 1, 1, 1, 1),
(2, '2020-07-17 15:39:16', 2, 2, 2, 2),
(3, '2020-07-11 15:39:16', 3, 3, 3, 3),
(4, '2020-07-11 15:39:16', 4, 4, 4, 4),
(5, '2020-07-11 15:39:16', 1, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mds_address`
--

CREATE TABLE `mds_address` (
  `mds_add_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mds_address`
--

INSERT INTO `mds_address` (`mds_add_id`, `city`, `street_name`, `zip_code`) VALUES
(1, 'Vienna', 'Jahngasse', 1050),
(2, 'Vienna', 'Fleischmarkt 19', 1010),
(3, 'Salzburg', 'Strubergasse 18', 5020),
(4, 'Linz', 'Volksfeststraße 2', 4020);

-- --------------------------------------------------------

--
-- Table structure for table `pac_mail`
--

CREATE TABLE `pac_mail` (
  `pac_mail_no` int(11) NOT NULL,
  `pac_mail_weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pac_mail`
--

INSERT INTO `pac_mail` (`pac_mail_no`, `pac_mail_weight`) VALUES
(1, 0.3),
(2, 0.24),
(3, 0.41),
(4, 0.2),
(5, 0.38);

-- --------------------------------------------------------

--
-- Table structure for table `processed`
--

CREATE TABLE `processed` (
  `process_no` int(11) NOT NULL,
  `pac_mail_cost` float NOT NULL,
  `scan_code` varchar(20) NOT NULL,
  `mds_no` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processed`
--

INSERT INTO `processed` (`process_no`, `pac_mail_cost`, `scan_code`, `mds_no`, `emp_no`) VALUES
(1, 7, 'a4444', 1, 1),
(2, 4, 'a2222', 2, 2),
(3, 8, 'a1233', 3, 3),
(4, 10, 'a3232', 4, 4),
(5, 12, 'a1132', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `proc_sys_no` int(11) NOT NULL,
  `packed` varchar(20) NOT NULL,
  `drop_off_point` varchar(20) NOT NULL,
  `process_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`proc_sys_no`, `packed`, `drop_off_point`, `process_no`) VALUES
(6, 'Plastic envelope', 'Ware house', 1),
(7, 'Plastic envelope', 'Ware house', 2),
(8, 'Box envelope', 'Ware house', 3),
(9, 'Box envelope', 'Ware house', 4),
(10, 'Box envelope', 'Ware house', 5);

-- --------------------------------------------------------

--
-- Table structure for table `receive_location`
--

CREATE TABLE `receive_location` (
  `rec_loc_no` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_loc_add_id` int(11) NOT NULL,
  `proc_sys_no` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receive_location`
--

INSERT INTO `receive_location` (`rec_loc_no`, `date_time`, `rec_loc_add_id`, `proc_sys_no`, `emp_no`) VALUES
(1, '2020-07-11 16:29:07', 1, 6, 1),
(2, '2020-07-11 16:29:07', 2, 7, 2),
(3, '2020-07-11 16:29:07', 3, 8, 3),
(4, '2020-07-11 16:29:07', 4, 9, 4),
(5, '2020-07-11 16:29:07', 1, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` int(30) NOT NULL,
  `recipient_add_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `phone`, `recipient_add_id`) VALUES
(1, 'Duangkaew', 'Piveteau', 43111140, 1),
(2, 'Mary', 'Sluis', 43111141, 2),
(3, 'Patricio', 'Bridgland', 43111142, 3),
(4, 'Eberhardt', 'Terkki', 43111143, 4);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_address`
--

CREATE TABLE `recipient_address` (
  `recipient_add_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient_address`
--

INSERT INTO `recipient_address` (`recipient_add_id`, `city`, `street_name`, `zip_code`) VALUES
(1, 'Linz', 'Hasnerstraße', 4020),
(2, 'Graz', 'Mesnergasse', 8010),
(3, 'Graz', 'Kernstockgasse', 8020),
(4, 'Vienna', 'Wassergasse', 1030);

-- --------------------------------------------------------

--
-- Table structure for table `rec_loc_address`
--

CREATE TABLE `rec_loc_address` (
  `rec_loc_add_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rec_loc_address`
--

INSERT INTO `rec_loc_address` (`rec_loc_add_id`, `city`, `street_name`, `zip_code`) VALUES
(1, 'Linz', 'Domgasse 1', 4020),
(2, 'Graz', 'Neutorgasse 46', 8010),
(3, 'Graz', 'Anzengrubergasse 6', 8010),
(4, 'Vienna', 'Ungargasse 64', 1030);

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `first_name`, `last_name`, `phone`, `address_id`) VALUES
(1, 'Kyoichi', 'Maliniak', 43111121, 1),
(2, 'Anneke', 'Preusig', 43111122, 2),
(3, 'Tzvetan', 'Zielinski', 43111123, 3),
(4, 'Saniya', 'Kalloufi', 43111124, 4);

-- --------------------------------------------------------

--
-- Table structure for table `s_address`
--

CREATE TABLE `s_address` (
  `s_add_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_address`
--

INSERT INTO `s_address` (`s_add_id`, `city`, `street_name`, `zip_code`) VALUES
(1, 'Vienna', 'Reinprechtsdorfer Strasse 20', 1050),
(2, 'Vienna', 'Habsburgergasse', 1010),
(3, 'Salzburg', 'Strubergasse', 5020),
(4, 'Linz', 'Gürtelstraße', 4020);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivered`
--
ALTER TABLE `delivered`
  ADD PRIMARY KEY (`delivered_no`),
  ADD KEY `rec_loc_no` (`rec_loc_no`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_no`);

--
-- Indexes for table `mail_delivery_services`
--
ALTER TABLE `mail_delivery_services`
  ADD PRIMARY KEY (`mds_no`),
  ADD KEY `mds_add_id` (`mds_add_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `pac_mail_no` (`pac_mail_no`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `mds_address`
--
ALTER TABLE `mds_address`
  ADD PRIMARY KEY (`mds_add_id`);

--
-- Indexes for table `pac_mail`
--
ALTER TABLE `pac_mail`
  ADD PRIMARY KEY (`pac_mail_no`);

--
-- Indexes for table `processed`
--
ALTER TABLE `processed`
  ADD PRIMARY KEY (`process_no`),
  ADD UNIQUE KEY `scan_code` (`scan_code`),
  ADD KEY `mds_no` (`mds_no`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`proc_sys_no`),
  ADD KEY `process_no` (`process_no`);

--
-- Indexes for table `receive_location`
--
ALTER TABLE `receive_location`
  ADD PRIMARY KEY (`rec_loc_no`),
  ADD KEY `rec_loc_add_id` (`rec_loc_add_id`),
  ADD KEY `proc_sys_no` (`proc_sys_no`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD UNIQUE KEY `recipient_add_id` (`recipient_add_id`);

--
-- Indexes for table `recipient_address`
--
ALTER TABLE `recipient_address`
  ADD PRIMARY KEY (`recipient_add_id`);

--
-- Indexes for table `rec_loc_address`
--
ALTER TABLE `rec_loc_address`
  ADD PRIMARY KEY (`rec_loc_add_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `s_address`
--
ALTER TABLE `s_address`
  ADD PRIMARY KEY (`s_add_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivered`
--
ALTER TABLE `delivered`
  MODIFY `delivered_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mail_delivery_services`
--
ALTER TABLE `mail_delivery_services`
  MODIFY `mds_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mds_address`
--
ALTER TABLE `mds_address`
  MODIFY `mds_add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pac_mail`
--
ALTER TABLE `pac_mail`
  MODIFY `pac_mail_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processed`
--
ALTER TABLE `processed`
  MODIFY `process_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processing_system`
--
ALTER TABLE `processing_system`
  MODIFY `proc_sys_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `receive_location`
--
ALTER TABLE `receive_location`
  MODIFY `rec_loc_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipient_address`
--
ALTER TABLE `recipient_address`
  MODIFY `recipient_add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rec_loc_address`
--
ALTER TABLE `rec_loc_address`
  MODIFY `rec_loc_add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `s_address`
--
ALTER TABLE `s_address`
  MODIFY `s_add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivered`
--
ALTER TABLE `delivered`
  ADD CONSTRAINT `delivered_ibfk_1` FOREIGN KEY (`rec_loc_no`) REFERENCES `receive_location` (`rec_loc_no`);

--
-- Constraints for table `mail_delivery_services`
--
ALTER TABLE `mail_delivery_services`
  ADD CONSTRAINT `mail_delivery_services_ibfk_1` FOREIGN KEY (`mds_add_id`) REFERENCES `mds_address` (`mds_add_id`),
  ADD CONSTRAINT `mail_delivery_services_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `mail_delivery_services_ibfk_3` FOREIGN KEY (`pac_mail_no`) REFERENCES `pac_mail` (`pac_mail_no`),
  ADD CONSTRAINT `mail_delivery_services_ibfk_4` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`recipient_id`);

--
-- Constraints for table `processed`
--
ALTER TABLE `processed`
  ADD CONSTRAINT `processed_ibfk_1` FOREIGN KEY (`mds_no`) REFERENCES `mail_delivery_services` (`mds_no`),
  ADD CONSTRAINT `processed_ibfk_2` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`);

--
-- Constraints for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`process_no`) REFERENCES `processed` (`process_no`);

--
-- Constraints for table `receive_location`
--
ALTER TABLE `receive_location`
  ADD CONSTRAINT `receive_location_ibfk_1` FOREIGN KEY (`rec_loc_add_id`) REFERENCES `rec_loc_address` (`rec_loc_add_id`),
  ADD CONSTRAINT `receive_location_ibfk_2` FOREIGN KEY (`proc_sys_no`) REFERENCES `processing_system` (`proc_sys_no`),
  ADD CONSTRAINT `receive_location_ibfk_3` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`recipient_add_id`) REFERENCES `recipient_address` (`recipient_add_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `s_address` (`s_add_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
