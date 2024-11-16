-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 01:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `CategoryName` varchar(45) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `CategoryName`, `CreationDate`) VALUES
(1, 'Health Insurance', '2022-11-27 15:29:32'),
(2, 'Fire Insurance', '2022-11-27 16:34:42'),
(3, 'Life insurance', '2022-11-27 15:28:40'),
(4, 'Vehicle Insurance', '2022-11-27 15:29:55'),
(5, 'Crop Insurance', '2022-11-27 15:26:25'),
(6, 'Marine Insurance', '2022-11-27 15:30:07'),
(7, 'Travel Insurance', '2022-11-27 15:29:32'),
(8, 'Home Insurance', '2022-11-27 15:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblimsadmin`
--

CREATE TABLE `tblimsadmin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `AdminUsername` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblimsadmin`
--

INSERT INTO `tblimsadmin` (`ID`, `AdminName`, `AdminUsername`, `Password`, `AdminRegdate`) VALUES
(1, 'Bhanu', 'SNUAdmin', 'Mysql@123', '2022-11-27 15:22:00'),
(2, 'Saideep', 'Saideep', 'DBMS', '2022-11-27 15:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblpolicy`
--

CREATE TABLE `tblpolicy` (
  `ID` int(11) NOT NULL,
  `SubcategoryId` int(25) NOT NULL,
  `CategoryId` int(25) DEFAULT NULL,
  `PolicyName` varchar(45) DEFAULT NULL,
  `Sumassured` int(11) DEFAULT NULL,
  `Premium` varchar(45) DEFAULT NULL,
  `Tenure` int(10) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpolicy`
--

INSERT INTO `tblpolicy` (`ID`, `SubcategoryId`, `CategoryId`, `PolicyName`, `Sumassured`, `Premium`, `Tenure`, `CreationDate`) VALUES
(8, 5, 1, 'Jeevan Saathi', 500000, '500', 12, '2022-11-27 17:29:32'),
(9, 20, 3, 'Jeevan Dhara', 800000, '500 p/m', 10, '2022-11-27 17:29:32'),
(10, 12, 4, 'Accidental Policy', 200000, '100 p/m', 12, '2022-11-27 17:31:45'),
(11, 29, 6, 'Bharti AXA', 700000, '800 p/m', 8, '2022-11-27 15:39:24'),
(12, 7, 1, 'Bajaj Allianz ', 500000, '4250', 15, '2022-11-27 14:30:10'),
(13, 17, 5, 'ICICI Lombard', 1000000, '54244', 15, '2022-11-27 15:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblpolicyholder`
--

CREATE TABLE `tblpolicyholder` (
  `ID` int(11) NOT NULL,
  `UserId` int(20) DEFAULT NULL,
  `PolicyId` int(25) DEFAULT NULL,
  `PolicyNumber` char(9) DEFAULT NULL,
  `PolicyApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `PolicyStatus` int(1) DEFAULT NULL,
  `UpdationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpolicyholder`
--

INSERT INTO `tblpolicyholder` (`ID`, `UserId`, `PolicyId`, `PolicyNumber`, `PolicyApplyDate`, `PolicyStatus`, `UpdationDate`) VALUES
(7, 1, 9, '903109554', '2022-11-27 15:40:49', 1, '2022-11-27 15:40:55'),
(8, 21, 8, '625518801', '2022-11-27 16:42:32', 1, '2022-11-27 16:44:19'),
(9, 20, 11, '286676374', '2022-11-28 18:56:23', 1, '2022-11-28 18:56:35'),
(10, 22, 8, '632776783', '2022-11-29 19:43:11', 1, '2022-11-29 19:45:32'),
(11, 23, 10, '632964811', '2022-11-30 04:21:23', 1, '2022-11-30 04:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `id` int(11) NOT NULL,
  `CategoryId` int(25) NOT NULL,
  `SubcategoryName` varchar(200) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`id`, `CategoryId`, `SubcategoryName`, `CreationDate`, `UpdationDate`) VALUES
(5, 1, 'Health Maintenance Organization (HMO) plans', '2022-11-27 15:29:32', NULL),
(6, 1, 'Preferred Provider Organization (PPO) plans', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(7, 1, 'Exclusive Provider Organization (EPO) plans', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(8, 1, 'Point of Service (POS) plans', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(9, 1, 'High Deductible Health Plan (HDHP) plans', '2022-11-27 15:29:32', NULL),
(10, 4, 'Liability Coverage', '2022-11-27 15:29:32', NULL),
(11, 4, 'Collision Coverage', '2022-11-27 15:29:32', NULL),
(12, 4, 'Personal Injury Coverage', '2022-11-27 15:29:32', NULL),
(13, 4, 'Uninsured Motorist Protection', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(14, 4, 'Comprehensive Coverage', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(15, 5, 'Multiple Peril Crop Insurance', '2022-11-27 15:29:32', NULL),
(16, 5, 'Actual Production History', '2022-11-26 15:29:32', NULL),
(17, 5, 'Group Risk Plan', '2022-11-27 15:29:32', NULL),
(18, 5, 'Crop Revenue Coverage', '2022-11-27 15:29:32', '2022-11-28 15:29:32'),
(19, 5, 'Actual Production History', '2022-11-27 15:29:32', NULL),
(20, 3, 'Term Plan', '2022-11-27 15:29:32', NULL),
(21, 3, 'Unit linked insurance plan(ULIP)', '2022-11-27 15:29:32', NULL),
(22, 3, 'Endowment Plan', '2022-11-27 15:29:32', NULL),
(23, 3, 'Money Back', '2022-11-27 10:38:13', NULL),
(24, 3, 'Whole Life Insurance', '2022-11-27 10:38:29', NULL),
(25, 6, 'Hull Insurance', '2022-11-27 10:44:21', NULL),
(26, 6, 'Machinery Insurance', '2022-11-27 10:44:37', NULL),
(27, 6, 'Protection & Indemnity (P&I) Insurance', '2022-11-27 10:44:54', NULL),
(28, 6, 'Liability Insurance', '2022-11-27 10:45:17', NULL),
(29, 6, 'Freight, Demurrage and Defense (FD&D) Insurance', '2022-11-27 10:45:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblticket`
--

CREATE TABLE `tblticket` (
  `ID` int(11) NOT NULL,
  `UserId` int(25) DEFAULT NULL,
  `Subject` varchar(45) DEFAULT NULL,
  `NatureofIssue` varchar(120) DEFAULT NULL,
  `Description` varchar(120) DEFAULT NULL,
  `AdminRemark` varchar(120) DEFAULT NULL,
  `TicketGenerationDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemarkdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblticket`
--

INSERT INTO `tblticket` (`ID`, `UserId`, `Subject`, `NatureofIssue`, `Description`, `AdminRemark`, `TicketGenerationDate`, `AdminRemarkdate`) VALUES
(9, 1, 'Insurance Issue', 'payment issue', 'Payment Done but the insurance is not claimed', 'ssss', '2022-11-27 15:12:18', '2022-11-30 04:26:15'),
(10, 20, 'Card Declined', 'payment issue', 'My card is declined due to some erroe', 'Because , it is not your card, u scammer!!!', '2022-11-28 19:05:00', '2022-11-28 19:08:35'),
(11, 22, 'Insurance Claim', 'claim  issue', 'Insurance money has not yet deposited in bank', 'We are sorry for that, we will soon solve the problem and mail you soon', '2022-11-29 19:44:14', '2022-11-29 19:46:26'),
(12, 23, 'Insurance Issue', 'payment issue', 'Card Problem', NULL, '2022-11-30 04:23:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `ContactNo` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Gender` enum('Male','Female') DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `ContactNo`, `Email`, `Gender`, `Password`, `CreationDate`) VALUES
(1, 'Bhanu Sathwik Nulu', 7569775128, 'bhanusathwik07072003@gmail.com', 'Male', 'Bhanusathw1k', '2022-11-27 14:48:06'),
(15, 'Katakam Saideep Reddy', 7416951019, 'saideepreddy0527@gmail.com', 'Male', 'sai527sai', '2022-11-27 14:49:37'),
(16, 'Ghasby Godsmen', 9999999999, 'ghasbygodsmen@GMAIL.com', 'Male', 'nikenduku', '2022-11-27 14:51:31'),
(17, 'Hemanth', 8919969093, 'hb268@snu.edu.in', 'Male', 'abcd@123', '2022-11-27 14:52:58'),
(18, 'Mahammad Siraj', 8977453132, 'mc801@siraj.com', 'Male', 'Sirajisluv', '2022-11-27 14:55:41'),
(19, 'Mohana Siddhartha', 9985688441, 'cs100@snu.edu.in', 'Male', 'sidsquad', '2022-11-27 14:56:46'),
(20, 'Kalva Saketh', 9100287741, 'ks787@snu.edu.in', 'Male', 'Sakethluv69', '2022-11-27 14:58:40'),
(21, 'Test', 123456789, 'test@gmail.com', 'Male', 'SNU_DBMS', '2022-11-27 15:56:04'),
(22, 'Pranav Rao Inturi', 934723064, 'pranav.inturi@gmail.com', 'Male', 'pranav', '2022-11-29 19:41:13'),
(23, 'Sonia Mam', 987654321, 'dbms@gmail.com', 'Female', 'dbmsproject', '2022-11-30 04:20:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblimsadmin`
--
ALTER TABLE `tblimsadmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpolicy`
--
ALTER TABLE `tblpolicy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SubcategoryId` (`SubcategoryId`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `tblpolicyholder`
--
ALTER TABLE `tblpolicyholder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `PolicyId` (`PolicyId`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `tblticket`
--
ALTER TABLE `tblticket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ContactNo` (`ContactNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblimsadmin`
--
ALTER TABLE `tblimsadmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpolicy`
--
ALTER TABLE `tblpolicy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblpolicyholder`
--
ALTER TABLE `tblpolicyholder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tblticket`
--
ALTER TABLE `tblticket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblpolicy`
--
ALTER TABLE `tblpolicy`
  ADD CONSTRAINT `tblpolicy_ibfk_1` FOREIGN KEY (`SubcategoryId`) REFERENCES `tblsubcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblpolicy_ibfk_2` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblpolicyholder`
--
ALTER TABLE `tblpolicyholder`
  ADD CONSTRAINT `tblpolicyholder_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblpolicyholder_ibfk_2` FOREIGN KEY (`PolicyId`) REFERENCES `tblpolicy` (`ID`) ON DELETE NO ACTION ON UPDATE SET NULL;

--
-- Constraints for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD CONSTRAINT `tblsubcategory_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblticket`
--
ALTER TABLE `tblticket`
  ADD CONSTRAINT `tblticket_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
