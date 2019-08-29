-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2019 at 08:38 AM
-- Server version: 5.7.27
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `govcekco_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustable`
--

CREATE TABLE `adjustable` (
  `id` int(9) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `active` char(1) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adjustable`
--

INSERT INTO `adjustable` (`id`, `deskripsi`, `active`, `uid`) VALUES
(1, 'No adjuster', 'Y', 1),
(2, 'Style A (short adjuster)', 'Y', 1),
(3, 'Style B (One foot or )', 'Y', 1),
(4, 'Crosby Eliminator', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `basic_type`
--

CREATE TABLE `basic_type` (
  `id` int(11) NOT NULL,
  `type_description` varchar(30) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_type`
--

INSERT INTO `basic_type` (`id`, `type_description`, `uid`) VALUES
(1, 'DOG', 1),
(2, 'DPG', 1),
(3, 'DRG', 1),
(4, 'DOL', 1),
(5, 'DPL', 1),
(6, 'DRL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `begin_inspection`
--

CREATE TABLE `begin_inspection` (
  `id` int(9) NOT NULL,
  `parent_id` int(9) DEFAULT NULL,
  `checklist_name` longtext,
  `comment` varchar(100) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `location_id` int(9) DEFAULT NULL,
  `inspector_id` int(9) DEFAULT NULL,
  `uid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `begin_inspection`
--

INSERT INTO `begin_inspection` (`id`, `parent_id`, `checklist_name`, `comment`, `status`, `service_date`, `expire_date`, `location_id`, `inspector_id`, `uid`) VALUES
(24, 9, 'Tag found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y', '', 'Y', '2018-01-25', NULL, 3, 8, 1),
(35, 3, 'Tag / illegible Marking found satisfactory|Y|Distorted, worn, stretched or bent body or pi|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion not found|Y', 'Visual and function', 'No Defect', '2018-03-12', NULL, 3, 4, 1),
(59, 3, 'Tag / illegible Marking found satisfactory|N|Distorted, worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 12, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Controllers / Pendants condition & fuction sa|Y|Motor Trains|Y|Long Travel Rails / Rollers|Y|Anchor / End - Stopper / Buffer|Y|Brakes System found satisfactory|Y|Parking System|Y|Beam Girder / End Carriage|Y|ELectrical Power Supply|Y|Hydraulic System|Y|Crab Trolley|Y|Wire Ropes|Y|Hooks|Y|Chains|Y|Pulley and Sheaves|Y|Drums|Y|Direction Limit Switch|Y|Upper and Lower Limit|Y|Anti Collision Device|Y|Function Satisfactory|Y|Safety System|Y|Warning Device|Y|Fire Extinguisher|Y|Lighting System|Y|Maintenance Periodically|Y|Supporting Structures|Y|Over Load Limit|Y|Load Test Satisfactory|Y', 'Visual, Function, load Test', 'Repair', '2018-03-22', NULL, 4, 8, 1),
(64, 13, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Controllers / Pendants condition & fuction sa|Y|Motor Trains|Y|Long Travel Rails / Rollers|Y|Anchor / End - Stopper / Buffer|Y|Brakes System found satisfactory|Y|Parking System|Y|Beam Girder / End Carriage|Y|ELectrical Power Supply|Y|Hydraulic System|Y|Crab Trolley|Y|Wire Ropes|Y|Chains|N|Pulley and Sheaves|Y|Drums|Y|Direction Limit Switch|Y|Upper and Lower Limit|Y|Anti Collision Device|Y|Function Satisfactory|Y|Safety System|Y|Warning Device|Y|Fire Extinguisher|N|Lighting System|Y|Maintenance Periodically|Y|Supporting Structures|Y|Over Load Limit|Y|Load Test Satisfactory|Y', '', 'Report Pending', '2018-04-04', NULL, 6, 10, 1),
(65, 14, 'Appearance & Cleanliness satisfactory|Y|S.W.L Stencil Clear Visible|Y|Anchor / End - Stopper / Buffer|Y|Secure Bolts & Grade|Y|Welds / Joints|Y|Surface Wear|Y|Alignment/Straightness is Correct|Y|Post/Mast/Column|Y|General Painting Condition|Y|Upper and Lower Limit|Y|Hooks Satisfactory (NCCG, CCDD, W 8%)|Y|Brakes System found satisfactory|Y|Trolley Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Safety System|Y|Warning Device|Y|Over Load Limit|Y', 'Safe to Use \r\nReport No. AL/LLG/030418/07TA', 'Valid', '2018-04-03', NULL, 3, 10, 1),
(70, 12, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Trolley Satisfactory|N|Wire Ropes|N||N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 16, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Pressure Gauge Found Satisfactory|N|Pressure Relief Valve Satisfactory|N|Material Thickness Satisfactory|N|General Painting Condition|N|Deformation not found|N|Supporting Structures|N|Welds / Joints|N|Leakage Not Found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 14, 'Appearance & Cleanliness satisfactory|N|S.W.L Stencil Clear Visible|N|Anchor / End - Stopper / Buffer|N|Secure Bolts & Grade|N|Welds / Joints|N|Surface Wear|N|Alignment/Straightness is Correct|N|Post/Mast/Column|N|General Painting Condition|N|Upper and Lower Limit|N|Hooks Satisfactory (NCCG, CCDD, W 8%)|N|Brakes System found satisfactory|N|Trolley Satisfactory|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|N|Safety System|N|Warning Device|N|Over Load Limit|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 17, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(76, 18, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand|N|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(77, 19, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(78, 20, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(79, 21, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(80, 22, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(81, 23, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(82, 24, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(83, 25, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(84, 26, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(85, 27, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(86, 28, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(87, 29, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(88, 30, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(89, 31, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(90, 32, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation, for Trial', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(91, 33, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation', 'No Defect', '2018-05-13', NULL, 7, 8, 1),
(92, 9, 'Tag / illegible Marking found satisfactory|N|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|N|Stitching Damage Not Found|N|Damage to eye or end fittings not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 32, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 18, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', '', 'No Defect', '2019-07-30', NULL, 7, 8, 1),
(96, 19, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'good', 'Not Found', '2019-07-31', NULL, 0, 0, 1),
(97, 34, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrul', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(98, 35, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(99, 36, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(100, 37, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(101, 38, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(102, 39, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(103, 40, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(104, 41, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(105, 42, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(106, 43, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(107, 44, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(108, 45, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(109, 46, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(110, 47, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation (Trial)\r\nSteel Ferrule and Minho Wire', 'No Defect', '2018-05-15', NULL, 7, 8, 1),
(111, 17, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 26, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 49, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'New Installation', 'No Defect', '2018-05-16', NULL, 9, 8, 1),
(115, 2, 'Tag / illegible Marking found satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 48, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|Y|Component worn (8%) not found|Y', 'New Installation.\r\nAluminum Ferrule and used thimble', 'No Defect', '2018-05-17', NULL, 7, 8, 1),
(117, 48, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 50, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|N|Heat Damage Not Found|Y', 'To be discard due to faded colour', 'Discard', '2018-05-22', NULL, 10, 8, 1),
(121, 51, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|N|Heat Damage Not Found|Y', 'To be discard, faded colour', 'Discard', '2018-05-22', NULL, 10, 8, 1),
(122, 52, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|Y|Stitching Damage Not Found|N|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'To be Discard, Cuts found', 'Discard', '2018-05-22', NULL, 10, 8, 1),
(123, 53, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(126, 54, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(127, 55, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'To be Discard, Cuts', 'Discard', '2018-05-22', NULL, 10, 8, 1),
(128, 56, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(132, 57, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(133, 58, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(134, 59, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(135, 60, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(137, 61, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(138, 62, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(139, 63, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(140, 64, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(141, 65, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(142, 66, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(143, 67, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(144, 68, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(145, 69, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(146, 70, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(147, 71, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-05-22', NULL, 9, 8, 1),
(149, 10, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Trolley Satisfactory|N|Wire Ropes|N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N|Equipment Availability|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 11, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Trolley Satisfactory|N|Wire Ropes|N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N|Equipment Availability|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 15, 'Equipment Availability|N|Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Pressure Gauge Found Satisfactory|N|Pressure Relief Valve Satisfactory|N|Material Thickness Satisfactory|N|General Painting Condition|N|Deformation not found|N|Supporting Structures|N|Welds / Joints Satisfactory|N|Leakage Not Found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 72, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(153, 73, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(154, 74, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(157, 75, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(158, 76, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|N|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(159, 77, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'Not Found', '2018-05-22', NULL, 10, 8, 1),
(160, 78, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-22', NULL, 10, 8, 1),
(161, 60, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 135, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(163, 79, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(164, 80, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(165, 81, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(166, 82, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(167, 83, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(168, 84, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(169, 85, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(171, 84, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 86, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(173, 87, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(174, 88, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(175, 89, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(176, 90, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'Overdue', '2018-05-24', NULL, 11, 8, 1),
(177, 91, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(178, 92, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(179, 93, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(180, 94, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(181, 95, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(182, 96, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(183, 97, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(184, 98, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(185, 99, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(186, 100, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(187, 137, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Light Load Test Done.', 'No Defect', '2018-06-04', NULL, 10, 8, 1),
(188, 138, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'One of the Hand Chain Link to be Replace', 'Repair', '2018-06-04', NULL, 10, 8, 1),
(189, 139, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'One of the Hand Chain link to be replace', 'Repair', '2018-06-04', NULL, 10, 8, 1),
(190, 140, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|N|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Roller Chain Guide to replace', 'Repair', '2018-06-04', NULL, 10, 8, 1),
(191, 113, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'New Item', 'No Defect', '2018-05-24', NULL, 11, 8, 1),
(192, 36, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|Y', 'Broken wire, to be discard', 'Discard', '2018-06-07', NULL, 7, 0, 1),
(193, 45, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|Y', 'Broken Wire, to be discard ', 'Discard', '2018-06-07', NULL, 7, 8, 1),
(194, 35, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|Y', 'Broken Wire, to be discard ', 'Discard', '2018-06-07', NULL, 7, 8, 1),
(195, 34, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|Y|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|Y', 'Broken Wire, to be discard ', 'Discard', '2018-06-07', NULL, 7, 8, 1),
(196, 35, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 33, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 34, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 37, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 143, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(203, 143, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 144, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(205, 166, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(206, 165, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(207, 164, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(208, 163, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1);
INSERT INTO `begin_inspection` (`id`, `parent_id`, `checklist_name`, `comment`, `status`, `service_date`, `expire_date`, `location_id`, `inspector_id`, `uid`) VALUES
(209, 162, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(210, 161, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(211, 160, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(212, 159, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(213, 158, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(214, 157, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(215, 156, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(216, 155, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(217, 154, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(218, 145, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(219, 146, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(220, 153, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-13', NULL, 13, 8, 1),
(221, 152, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(222, 151, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(223, 150, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(224, 149, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(225, 148, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(226, 147, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'New Item', 'No Defect', '2018-06-12', NULL, 13, 8, 1),
(227, 166, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 204, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(229, 205, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(230, 206, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(232, 207, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(233, 236, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(234, 237, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(235, 240, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(236, 242, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(237, 245, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(238, 248, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(239, 250, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(240, 252, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to use', 'No Defect', '2018-07-01', NULL, 10, 8, 1),
(241, 295, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Safe to use\r\nModel FZ30, Reach 3M, Year 2017', 'No Defect', '2018-07-04', NULL, 10, 8, 1),
(242, 296, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Operating Lever Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Safe to Use\r\nload Tested 1 Ton, Reach 1.5M', 'No Defect', '2018-07-04', NULL, 10, 8, 1),
(243, 204, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 295, 'Appearance & Cleanliness satisfactory|N|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|N|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|N|Tag / illegible Marking found satisfactory|N|Anchor & Stripper SAT (NCCG, CCDD,W8%)|N|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|N|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|N|Brakes System found satisfactory|N|Load Test Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 297, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Bail or Pin Found Satisfactory|Y|Lifting Frame free from defect (NCCG, CCDD)|Y|Fastener satisfactory (Grade, Tight,etc)|Y|Liquid Metal splashed not found|Y|Suspension Point Satisfactory(wear,DDCC,etc)|Y|Connection Plate Satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Load Test Satisfactory|N', 'Visual Examination and Function.\r\nLoad Test not done', 'No Defect', '2018-07-04', NULL, 14, 10, 1),
(246, 71, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|N|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|N', 'Chain Link had deformation and length not equal.\r\nTo be Repair', 'Repair', '2018-07-09', NULL, 9, 8, 1),
(247, 419, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(248, 420, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(249, 421, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(250, 49, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Visual, Dimension and Function Test \r\nSafe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(251, 422, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Damaged or incomplete thread forms not found|Y|Distorted,worn (8%) not found|Y|Bend shank not found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(252, 423, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Damaged or incomplete thread forms not found|Y|Distorted,worn (8%) not found|Y|Bend shank not found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(253, 424, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Damaged or incomplete thread forms not found|Y|Distorted,worn (8%) not found|Y|Bend shank not found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(254, 425, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Damaged or incomplete thread forms not found|Y|Distorted,worn (8%) not found|Y|Bend shank not found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(255, 426, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(256, 427, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(257, 428, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(258, 429, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(259, 430, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(260, 431, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 9, 8, 1),
(261, 71, 'Tag / illegible Marking found satisfactory|N|Master Link Satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Deformation not found|N|Nick, Cuts, Cracks and Gouge not found|N|Component worn (8%) not found|N|Safety latch or terminal found satisfactory|N|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 432, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(263, 433, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Operating Lever Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(264, 434, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Operating Lever Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(265, 435, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Operating Lever Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(266, 436, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Operating Lever Satisfactory|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(267, 437, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(268, 438, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(269, 439, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Visual, Dimension, Function and Light Load Test Done\r\nSafe to use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(270, 440, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(271, 441, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(272, 442, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(273, 443, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(274, 445, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-05', NULL, 10, 8, 1),
(275, 446, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-05', NULL, 10, 8, 1),
(276, 120, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use ', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(277, 444, 'Tag / illegible Marking found satisfactory|N|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|N|Stitching Damage Not Found|N|Damage to eye or end fittings not found|N|Color faded or expose to Sun not found|N|Heat Damage Not Found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 447, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(279, 448, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(280, 449, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(281, 450, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(282, 451, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(283, 452, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(284, 453, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(285, 454, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(286, 455, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(287, 456, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(288, 457, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(289, 458, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(290, 459, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(291, 460, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(292, 498, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|Y|Stitching Damage Not Found|N|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Cuts Found, Slings to be Discard', 'Discard', '2018-07-09', NULL, 10, 8, 1),
(293, 503, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(294, 461, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(295, 462, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(296, 463, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(297, 464, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(298, 465, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(299, 466, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(300, 467, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(301, 468, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(302, 469, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(303, 470, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(304, 472, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(305, 473, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(306, 474, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(307, 475, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(308, 476, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(309, 477, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(310, 478, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(311, 479, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(312, 480, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(313, 481, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(314, 482, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|N|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(315, 483, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(316, 485, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(317, 486, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(318, 500, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(319, 494, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(320, 502, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(321, 492, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(322, 490, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(323, 488, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-09', NULL, 10, 8, 1),
(324, 388, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|N', 'New Item.\r\nSafe to use', 'No Defect', '2018-07-05', NULL, 15, 8, 1),
(325, 403, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|N', 'New Item\r\nSafe to Use', 'No Defect', '2018-07-09', NULL, 15, 8, 1),
(326, 97, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Broken Wire', 'Discard', '2018-07-10', NULL, 11, 8, 1),
(327, 112, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Broken WIre', 'Discard', '2018-07-10', NULL, 11, 8, 1),
(328, 113, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Broken Wire', 'Discard', '2018-07-10', NULL, 11, 8, 1),
(329, 131, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Broken Wire', 'Discard', '2018-07-10', NULL, 11, 8, 1),
(330, 618, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(331, 167, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 14, 8, 1),
(332, 297, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Bail or Pin Found Satisfactory|N|Lifting Frame free from defect (NCCG, CCDD)|N|Fastener satisfactory (Grade, Tight,etc)|N|Liquid Metal splashed not found|N|Suspension Point Satisfactory(wear,DDCC,etc)|N|Connection Plate Satisfactory|N|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|N|Load Test Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 108, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(334, 104, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(335, 103, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(336, 134, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1);
INSERT INTO `begin_inspection` (`id`, `parent_id`, `checklist_name`, `comment`, `status`, `service_date`, `expire_date`, `location_id`, `inspector_id`, `uid`) VALUES
(337, 111, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(338, 116, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(339, 132, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(340, 123, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(341, 133, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(342, 135, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(343, 654, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(344, 118, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(345, 130, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(346, 122, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(347, 124, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(348, 117, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(349, 126, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(350, 655, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(351, 125, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(352, 656, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(353, 657, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(354, 543, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(355, 114, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(356, 101, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(357, 106, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(358, 659, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(359, 660, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(360, 661, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(361, 663, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(362, 664, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(363, 658, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(364, 662, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(365, 665, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(366, 666, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(367, 678, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(368, 677, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(369, 676, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(370, 675, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(371, 674, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(372, 673, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use ', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(373, 672, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(374, 653, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(375, 652, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(376, 651, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(377, 671, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 0, 1),
(378, 650, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(379, 649, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(380, 670, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(381, 669, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(382, 668, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(383, 667, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(384, 648, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(385, 647, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(386, 619, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 5, 8, 1),
(387, 620, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(388, 621, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-08', NULL, 11, 8, 1),
(389, 622, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(390, 617, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(391, 646, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(392, 645, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(393, 644, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(394, 643, 'Tag / illegible Marking found satisfactory|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Corrosion or chemical attack not found|Y|Damaged or incomplete thread forms not found|Y|Incorrect pin not found|Y|Stretched or bent body or pin not found|Y|Function Satisfactory|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(395, 642, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(396, 641, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(397, 640, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(398, 639, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(399, 638, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(400, 637, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(401, 623, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(402, 636, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(403, 635, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(404, 624, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(405, 634, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(406, 633, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(407, 632, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(408, 631, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(409, 630, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(410, 629, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(411, 616, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(412, 628, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(413, 627, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(414, 626, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(415, 625, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(416, 503, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 607, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(418, 608, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(419, 609, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(420, 615, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(421, 614, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(422, 613, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(423, 612, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(424, 611, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(425, 610, 'Tag / illegible Marking found satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Distortions(kink,crushed,bird caging)notfound|Y|Component worn (8%) not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Wire worn above 10% not found|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Protrusion & broken wire at termination NF|Y|Safety latch or terminal found satisfactory|Y|1.5 x dia. or 0.5% of N Length not found|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(426, 542, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(427, 541, 'Tag / illegible Marking found satisfactory|Y|Master Link Satisfactory|Y|Corrosion or chemical attack not found|Y|Heat Damage Not Found|Y|Deformation not found|Y|Nick, Cuts, Cracks and Gouge not found|Y|Component worn (8%) not found|Y|Safety latch or terminal found satisfactory|Y|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|Y', 'Safe to Use', 'No Defect', '2018-07-10', NULL, 11, 8, 1),
(428, 129, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', 'To Be Check', 'Not Found', '2018-07-10', NULL, 11, 8, 1),
(429, 129, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 116, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 121, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', 'To Be Check', 'Not Found', '2018-07-10', NULL, 11, 8, 1),
(432, 119, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 115, 'Tag / illegible Marking found satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Distortions(kink,crushed,bird caging)notfound|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Wire worn above 10% not found|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Protrusion & broken wire at termination NF|N|Safety latch or terminal found satisfactory|N|1.5 x dia. or 0.5% of N Length not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 679, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(436, 21, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', '', 'Not Found', '2019-08-06', NULL, 7, 8, 10),
(437, 681, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(438, 682, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(439, 683, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(440, 684, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(441, 685, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(442, 686, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(443, 687, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(444, 688, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(445, 689, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(446, 690, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(447, 691, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(448, 692, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(449, 693, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1);
INSERT INTO `begin_inspection` (`id`, `parent_id`, `checklist_name`, `comment`, `status`, `service_date`, `expire_date`, `location_id`, `inspector_id`, `uid`) VALUES
(450, 694, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(451, 695, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(452, 696, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(453, 697, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(454, 698, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(455, 699, 'Tag / illegible Marking found satisfactory|Y|Cuts, Tears or Contusion Not Found|Y|Chemical Damage not Found|Y|Stitching Damage Not Found|Y|Damage to eye or end fittings not found|Y|Color faded or expose to Sun not found|Y|Heat Damage Not Found|Y|Inner Core found Satisfactory|Y', 'New Item', 'No Defect', '2018-07-22', NULL, 13, 8, 1),
(456, 49, 'Tag / illegible Marking found satisfactory|N|Master Link Satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Deformation not found|N|Nick, Cuts, Cracks and Gouge not found|N|Component worn (8%) not found|N|Safety latch or terminal found satisfactory|N|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 682, 'Tag / illegible Marking found satisfactory|N|Cuts, Tears or Contusion Not Found|N|Chemical Damage not Found|N|Stitching Damage Not Found|N|Damage to eye or end fittings not found|N|Color faded or expose to Sun not found|N|Heat Damage Not Found|N|Inner Core found Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 707, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Hand Chain to be replace.', 'Repair', '2018-07-30', NULL, 10, 8, 1),
(459, 706, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|N|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|N|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Chain Hoist to be Discard due to Overload', 'Discard', '2018-07-30', NULL, 10, 8, 1),
(460, 705, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|N|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-30', NULL, 10, 8, 1),
(461, 704, 'Appearance & Cleanliness satisfactory|N|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|N|Tag / illegible Marking found satisfactory|N|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|N|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|N', 'Load Chain worn out', 'Repair', '2018-07-30', NULL, 10, 8, 1),
(462, 702, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-30', NULL, 10, 8, 1),
(463, 703, 'Appearance & Cleanliness satisfactory|Y|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|Y|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|Y|Tag / illegible Marking found satisfactory|Y|Anchor & Stripper SAT (NCCG, CCDD,W8%)|Y|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|Y|Hand Chain SAT (NCCG, CCDD, E.W 8%)|Y|Hoist Mechanism SAT (gearbox, Bearings, etc.)|Y|Brakes System found satisfactory|Y|Load Test Satisfactory|Y', 'Safe to Use', 'No Defect', '2018-07-30', NULL, 10, 8, 1),
(464, 432, 'Appearance & Cleanliness satisfactory|N|Hooks Satisfactory (NCCG, CCDD, Worn 8%)|N|Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)|N|Tag / illegible Marking found satisfactory|N|Anchor & Stripper SAT (NCCG, CCDD,W8%)|N|Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)|N|Hand Chain SAT (NCCG, CCDD, E.W 8%)|N|Hoist Mechanism SAT (gearbox, Bearings, etc.)|N|Brakes System found satisfactory|N|Load Test Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 643, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 653, 'Tag / illegible Marking found satisfactory|N|Master Link Satisfactory|N|Corrosion or chemical attack not found|N|Heat Damage Not Found|N|Deformation not found|N|Nick, Cuts, Cracks and Gouge not found|N|Component worn (8%) not found|N|Safety latch or terminal found satisfactory|N|LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 59, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 644, 'Tag / illegible Marking found satisfactory|N|Component worn (8%) not found|N|Nick, Cuts, Cracks and Gouge not found|N|Corrosion or chemical attack not found|N|Damaged or incomplete thread forms not found|N|Incorrect pin not found|N|Stretched or bent body or pin not found|N|Function Satisfactory|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 20, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', 'dsgsdgs', 'Not Found', '2019-08-06', NULL, 7, 8, 10),
(470, 13, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Trolley Satisfactory|N|Wire Ropes|N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher Fix and Valid|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N|Equipment Availability|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 25, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 18, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 30, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 19, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 20, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 22, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', '', 'Out of Service', '2019-08-27', NULL, 7, 8, 1),
(477, 24, 'Tag / illegible Marking found satisfactory|Y|Distortions(kink,crushed,bird caging)notfound|Y|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|Y|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', 'dhfjksdhfkj', 'Repair', '2019-08-27', NULL, 3, 8, 1),
(478, 22, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 21, 'Tag / illegible Marking found satisfactory|N|Distortions(kink,crushed,bird caging)notfound|N|Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF|N|Wire worn above 10% not found|N|Protrusion & broken wire at termination NF|N|Component worn (8%) not found|N', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(25) NOT NULL,
  `active` varchar(1) NOT NULL DEFAULT 'Y',
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `active`, `uid`) VALUES
(13, 'Boiler', 'Y', 1),
(20, 'Lifting Appliances', 'Y', 1),
(21, 'Pressure Vessels', 'Y', 1),
(22, 'Lifting Tackle', 'Y', 1),
(23, 'Fire Fighting Equipment', 'Y', 1),
(24, 'Heavy Vehicle / Machinery', 'Y', 1),
(25, 'Plant or Sites', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(9) NOT NULL,
  `checklist_name` varchar(100) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checklist`
--

INSERT INTO `checklist` (`id`, `checklist_name`, `active`, `uid`) VALUES
(1, 'Master Link Satisfactory', 'Y', 1),
(2, 'Links Satisfactory', 'Y', 1),
(3, 'Chain Satisfactory', 'Y', 1),
(4, 'Hooks Satisfactory (NCCG, CCDD, Worn 8%)', 'Y', 1),
(5, 'Load Chain Sat (NCCG, CCDD, El 5%.Wo 8%)', 'Y', 1),
(6, 'Function Satisfactory', 'Y', 1),
(7, 'Nick, Cuts, Cracks and Gouge not found', 'Y', 1),
(8, 'Pressure Gauge Found Satisfactory', 'Y', 1),
(9, 'Tag / illegible Marking found satisfactory', 'Y', 1),
(10, 'Condition found satisfactory', 'Y', 1),
(11, 'Seal/Lock Found satisfactory', 'Y', 1),
(12, 'Corrosion or chemical attack not found', 'Y', 1),
(13, 'Cuts, Tears or Contusion Not Found', 'Y', 1),
(14, 'Stitching Damage Not Found', 'Y', 1),
(15, 'Chemical Damage not Found', 'Y', 1),
(16, 'Component worn (8%) not found', 'Y', 1),
(17, 'Damaged or incomplete thread forms not found', 'Y', 1),
(18, 'Incorrect pin not found', 'Y', 1),
(19, 'Stretched or bent body or pin not found', 'Y', 1),
(20, 'Appearance & Cleanliness satisfactory', 'Y', 1),
(21, 'Controllers / Pendants condition & fuction sa', 'Y', 1),
(22, 'Motor Trains', 'Y', 1),
(23, 'Anchor / End - Stopper / Buffer', 'Y', 1),
(24, 'Brakes System found satisfactory', 'Y', 1),
(25, 'Parking System', 'Y', 1),
(26, 'Beam Girder / End Carriage', 'Y', 1),
(27, 'ELectrical Power Supply', 'Y', 1),
(28, 'Hydraulic System', 'Y', 1),
(29, 'Trolley Satisfactory', 'Y', 1),
(30, 'Wire Ropes', 'Y', 1),
(32, 'Chains', 'Y', 1),
(33, 'Pulley and Sheaves', 'Y', 1),
(34, 'Drums', 'Y', 1),
(35, 'Direction Limit Switch', 'Y', 1),
(36, 'Upper and Lower Limit', 'Y', 1),
(37, 'Anti Collision Device', 'Y', 1),
(38, 'Safety System', 'Y', 1),
(39, 'Warning Device', 'Y', 1),
(40, 'Fire Extinguisher Fix and Valid', 'Y', 1),
(41, 'Lighting System', 'Y', 1),
(42, 'Maintenance Periodically', 'Y', 1),
(43, 'Supporting Structures', 'Y', 1),
(44, 'Over Load Limit', 'Y', 1),
(45, 'Load Test Satisfactory', 'Y', 1),
(46, 'Long Travel Rails / Rollers', 'Y', 1),
(47, 'Electrical Cables or Earthing', 'Y', 1),
(48, 'Damage to eye or end fittings not found', 'Y', 1),
(49, 'S.W.L Stencil Clear Visible', 'Y', 1),
(50, 'Hoist Body(fast, weld, etc.) Sat (NCCG, CCDD)', 'Y', 1),
(51, 'Anchor & Stripper SAT (NCCG, CCDD,W8%)', 'Y', 1),
(52, 'Hand Chain SAT (NCCG, CCDD, E.W 8%)', 'Y', 1),
(53, 'Hoist Mechanism SAT (gearbox, Bearings, etc.)', 'Y', 1),
(54, 'Insurance Valid', 'Y', 1),
(55, 'Secure Bolts & Grade', 'Y', 1),
(56, 'Welds / Joints Satisfactory', 'Y', 1),
(57, 'Surface Wear', 'Y', 1),
(58, 'Alignment/Straightness is Correct', 'Y', 1),
(59, 'Post/Mast/Column', 'Y', 1),
(60, 'General Painting Condition', 'Y', 1),
(61, 'Wire Rope / Load Chain', 'Y', 1),
(62, 'Pressure Relief Valve Satisfactory', 'Y', 1),
(63, 'Material Thickness Satisfactory', 'Y', 1),
(64, 'Deformation not found', 'Y', 1),
(65, 'Mist Extractor Found Satisfactory', 'Y', 1),
(66, 'Level Gauge Found Satisfactory', 'Y', 1),
(67, 'Leakage Not Found', 'Y', 1),
(68, 'Quality & Source of Feed Water', 'Y', 1),
(69, 'Hydro Test Done', 'Y', 1),
(70, 'Economisers / Superheater Satisfactory', 'Y', 1),
(71, 'Fittings and Attachment', 'Y', 1),
(72, 'Dampers Working Properly', 'Y', 1),
(73, 'HP Drum Satisfactory', 'Y', 1),
(74, 'LP Drum Satisfactory', 'Y', 1),
(75, 'Thermocouple Calibrated', 'Y', 1),
(76, 'Lagging / Insulation Satisfactory', 'Y', 1),
(77, 'Machine Guarding Satisfactory', 'Y', 1),
(78, 'Heat Damage Not Found', 'Y', 1),
(79, 'Distortions(kink,crushed,bird caging)notfound', 'Y', 1),
(80, 'Wire worn above 10% not found', 'Y', 1),
(81, 'Broken Wire 6(6d)or 14(30d), 3 in 1 strand NF', 'Y', 1),
(82, 'Protrusion & broken wire at termination NF', 'Y', 1),
(83, 'Safety latch or terminal found satisfactory', 'Y', 1),
(84, '1.5 x dia. or 0.5% of N Length not found', 'Y', 1),
(86, 'Max elongation due to wear 5% not found', 'Y', 1),
(87, 'LengthTolerance  Weld(M/3mm), Mech(M/5mm) NF', 'Y', 1),
(88, 'Equipment Availability', 'Y', 1),
(90, 'Color faded or expose to Sun not found', 'Y', 1),
(91, 'Operating Lever Satisfactory', 'Y', 1),
(92, 'Bail or Pin Found Satisfactory', 'Y', 1),
(93, 'Lifting Frame free from defect (NCCG, CCDD)', 'Y', 1),
(94, 'Fastener satisfactory (Grade, Tight,etc)', 'Y', 1),
(95, 'Liquid Metal splashed not found', 'Y', 1),
(96, 'Suspension Point Satisfactory(wear,DDCC,etc)', 'Y', 1),
(97, 'Connection Plate Satisfactory', 'Y', 1),
(98, 'Vehicle Registration Valid', 'Y', 1),
(99, 'Equipment Examination Report Valid', 'Y', 1),
(100, 'Driver License Valid', 'Y', 1),
(101, 'Operator Training or Course  Valid', 'Y', 1),
(102, 'Tyre Condition Satisfactory', 'Y', 1),
(103, 'Reverse Light and Back Alarm Satisfactory', 'Y', 1),
(104, 'Break Light Satisfactory', 'Y', 1),
(105, 'Heads Light Satisfactory', 'Y', 1),
(106, 'Signal Light Satisfactory', 'Y', 1),
(107, 'Engine Smoke Satisfactory', 'Y', 1),
(108, 'Side Mirror Clear and Satisfactory', 'Y', 1),
(109, 'Wipers Satisfactory', 'Y', 1),
(110, 'Seat Belt Satisfactory', 'Y', 1),
(111, 'Horn Satisfactory', 'Y', 1),
(112, 'Engine Noise Satisfactory', 'Y', 1),
(113, 'Deflection found satisfactory', 'Y', 1),
(114, 'Distorted,worn (8%) not found', 'Y', 1),
(115, 'Bend shank not found', 'Y', 1),
(116, 'Inner Core found Satisfactory', 'Y', 1),
(117, 'cek pentil sepeda', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `construction`
--

CREATE TABLE `construction` (
  `id` int(11) NOT NULL,
  `construction_name` varchar(45) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `construction`
--

INSERT INTO `construction` (`id`, `construction_name`, `uid`) VALUES
(1, 'Mechanical', 1),
(2, 'Welded', 1);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(5) NOT NULL,
  `days_desc` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `days_desc`, `uid`) VALUES
(6, '6 Month', 1),
(7, '12 Month', 1),
(8, '14 Month', 1),
(9, '24 Month', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_product`
--

CREATE TABLE `detail_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` int(9) NOT NULL,
  `adjustable_id` int(5) NOT NULL,
  `legs_id` int(5) NOT NULL,
  `basic_type_id` int(5) NOT NULL,
  `grade_id` int(5) NOT NULL,
  `construction_id` int(5) NOT NULL,
  `reach0` int(9) NOT NULL,
  `reach1` int(9) NOT NULL,
  `reach2` varchar(9) NOT NULL,
  `proof_tested` varchar(1) NOT NULL DEFAULT 'Y',
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `end_user`
--

CREATE TABLE `end_user` (
  `id` int(9) NOT NULL,
  `company` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `division` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `state_prov` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `fax` varchar(25) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `inspection_schedule_id` int(9) NOT NULL,
  `unit_system_id` int(9) NOT NULL,
  `major_id` int(9) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `end_user`
--

INSERT INTO `end_user` (`id`, `company`, `contact_name`, `division`, `address`, `city`, `state_prov`, `postal_code`, `email`, `phone`, `fax`, `mobile`, `note`, `inspection_schedule_id`, `unit_system_id`, `major_id`, `uid`) VALUES
(1, 'PS 1 (Power Station 1)', 'Faisal Jahromi', 'Planner', '', 'Askar', 'Planner', '', '', '+97317835471', '', '+97339210004', 'notes for work', 9, 6, 29, 1),
(2, 'CH2 (Cast House 2)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(3, 'LINE 4', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(4, 'ALBA CALCINER & MARINE', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(5, 'ALBA', 'Hery Purwoko', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 1),
(6, 'SMS (SHUTDOWN MAINTENANCE SERVICES)', 'Abdulla', '', '', '', '', '', '', '39458056', '', '', '', 2, 6, 0, 1),
(7, 'TUV NORD', 'DWANIL MODI', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, 1),
(8, 'CH3 (Cast House 3)', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(9, 'PS2 (Power Station 2)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 29, 1),
(10, 'PS3 (Power Station 3)', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 29, 1),
(11, 'PS4 (Power Station 4)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 29, 1),
(12, 'PS5 (Power Station 5)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(13, 'CH4 (Cast House 4)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(14, 'LINE 1-3', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(15, 'LINE 6', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(16, 'LINE 5', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(17, 'CENTRAL WORKSHOP', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(18, 'MOULD SHOP', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(19, 'SHELL REPAIR', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 5, 1),
(20, 'C12 (CARBON 1-2)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(21, 'CARBON 3', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(23, 'CARBON 4', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(24, 'CRUCIBLE CLEANING (OSS)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(25, 'TRAINING & RECRUITEMENT (ALBA)', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(26, 'GTP & FTP L1-5', '', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(27, 'RAMSIS ENGINEERING', '', 'Project', '', 'Askar', 'Project', '', '', '', '', '', '', 2, 6, 0, 1),
(28, 'STORE', 'Khairy Sultan', '', '', '', '', '', '', '', '', '', '', 0, 6, 5, 1),
(29, 'POWER STATION', 'Sameer Mahdi', 'Planner', '', '', '', '', '', '', '', '', '', 1, 6, 5, 1),
(30, 'MMET (Modern Mechanical, Electrical, Transport)', 'Thomas', '', 'Modern Mechanical, Electrical & Transport co. W.L.L', '', '', '', '', '66737420', '', '', '', 1, 6, 5, 1),
(31, 'OSS (Operation Support Service)', '', '', '', '', '', '', '', '', '', '', '', 2, 6, 5, 1),
(34, 'CHM (cast house maintenance)', ' ', '', '', '', '', '', '', '', '', '', '', 1, 6, 5, 1),
(35, 'Al Ahlia Contracting', '', '', '', '', '', '', '', '17737000', '', '', '', 2, 6, 5, 1),
(36, 'FLORA', '', '', '', '', '', '', '', '', '', '', '', 2, 6, 0, 1),
(37, 'Bureau Veritas', 'Bejesh Balan', '', 'Tubli', '', '', '', '', '', '', '', '', 1, 6, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(9) NOT NULL,
  `grade_name` varchar(25) NOT NULL,
  `active` char(1) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `grade_name`, `active`, `uid`) VALUES
(1, '63', 'Y', 1),
(2, '80', 'Y', 1),
(3, '100', 'Y', 1),
(4, '120', 'Y', 1),
(5, 'Carbon', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `header_inspection`
--

CREATE TABLE `header_inspection` (
  `id` int(11) NOT NULL,
  `category_id` int(9) DEFAULT NULL,
  `product_id` int(9) DEFAULT NULL,
  `uid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header_inspection`
--

INSERT INTO `header_inspection` (`id`, `category_id`, `product_id`, `uid`) VALUES
(3, 6, 2, 1),
(4, 6, 3, 1),
(6, 9, 4, 1),
(7, 15, 8, 1),
(8, 6, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hp_schedule`
--

CREATE TABLE `hp_schedule` (
  `id` int(11) NOT NULL,
  `schedule` varchar(45) NOT NULL,
  `interval_value` int(5) NOT NULL,
  `interval_label` text,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hp_schedule`
--

INSERT INTO `hp_schedule` (`id`, `schedule`, `interval_value`, `interval_label`, `uid`) VALUES
(1, 'Annualy', 12, 'MONTH', 1),
(2, 'Semi-Annualy', 6, 'MONTH', 1),
(3, 'Quarterly', 4, 'MONTH', 1),
(4, 'Monthly', 1, 'MONTH', 1),
(5, 'Weekly', 7, 'DAY', 1),
(6, 'Daily', 1, 'DAY', 1),
(7, 'Two Years / Biennial', 24, 'MONTH', 1),
(8, 'Written Scheme / OnCall Basis', 0, NULL, 1),
(9, '14 Months', 14, 'MONTH', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hp_status`
--

CREATE TABLE `hp_status` (
  `id` int(9) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL,
  `uid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hp_status`
--

INSERT INTO `hp_status` (`id`, `status_name`, `uid`) VALUES
(3, 'Out of Service', 1),
(4, 'Not Found', 1),
(5, 'No Defect', 1),
(6, 'Discard', 1),
(7, 'Repair', 1),
(8, 'Valid', 1),
(9, 'Expired', 1),
(10, 'Unsafe', 1),
(11, 'Due', 1),
(12, 'Overdue', 1),
(13, 'Report Pending', 1),
(14, 'Writen Scheme/OnCallBasis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hp_unit`
--

CREATE TABLE `hp_unit` (
  `id` int(10) NOT NULL,
  `description` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hp_unit`
--

INSERT INTO `hp_unit` (`id`, `description`, `uid`) VALUES
(1, 'Lbs', 1),
(2, 'Barg', 1),
(3, 'tonne', 1),
(4, 'Tons', 1),
(5, 'Kg', 1),
(6, 'Metric', 1),
(7, 'Inches', 1),
(8, 'Feets', 1),
(9, 'Psi', 1),
(10, 'Newton', 1),
(11, 'kN', 1),
(12, 'Imperial', 1),
(13, 'Ton', 1),
(14, 'Kgs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inspection_schedule`
--

CREATE TABLE `inspection_schedule` (
  `id` int(10) NOT NULL,
  `inspection_name` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspection_schedule`
--

INSERT INTO `inspection_schedule` (`id`, `inspection_name`, `uid`) VALUES
(1, 'Daily', 1),
(2, 'Weekly', 1),
(3, 'Monthly', 1),
(4, 'Quarterly', 1),
(5, 'Semi-Annualy', 1),
(6, 'Annualy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inspector`
--

CREATE TABLE `inspector` (
  `id` int(11) NOT NULL,
  `inspector_name` varchar(45) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL,
  `manufacture_id` int(5) DEFAULT NULL,
  `link_to_user` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspector`
--

INSERT INTO `inspector` (`id`, `inspector_name`, `uid`, `manufacture_id`, `link_to_user`) VALUES
(3, 'Isa Al Mehri', 1, 2, 0),
(4, 'Saleh Mahdi', 1, 2, 0),
(5, 'Mohd Saeed', 1, 2, 0),
(6, 'Ahmed Al Jabal', 1, 2, 0),
(8, 'Hery Purwoko', 1, 2, 10),
(9, 'Hussein Habib', 1, 2, 0),
(10, 'Tahir Ul Amin', 1, 22, 0),
(11, 'Mohd Mirza', 1, 2, 0),
(12, 'Mohammed Sikkandar', 1, 22, 0),
(13, 'Mohammed Ghani', 1, 22, 0),
(14, 'tes123', 10, 36, 7),
(15, 'Athar Ahmad', 1, 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE `label` (
  `id` int(12) NOT NULL,
  `product_category_id` int(9) DEFAULT NULL,
  `label_name` varchar(100) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id`, `product_category_id`, `label_name`, `uid`) VALUES
(4, 9, 'Description', 1),
(5, 9, 'Type', 1),
(6, 9, 'Size_Dia', 1),
(7, 9, 'Distributor', 1),
(8, 5, 'Description', 1),
(9, 5, 'Type', 1),
(10, 5, 'Eye_type', 1),
(11, 5, 'Size', 1),
(12, 5, 'Distributor', 1),
(13, 5, 'No_of_Leg', 1),
(15, 8, 'Description', 1),
(16, 8, 'Type', 1),
(17, 17, 'Description', 1),
(18, 17, 'Distributor', 1),
(19, 17, 'Year', 1),
(20, 17, 'Span_Length', 1),
(21, 17, 'Lift_Height', 1),
(22, 17, 'Travel_Distance', 1),
(23, 17, 'MountingSys', 1),
(24, 17, 'Operating_System', 1),
(25, 17, 'RopeChains', 1),
(26, 17, 'MaxDeflect', 1),
(27, 20, 'Decription', 1),
(28, 20, 'Distributor', 1),
(29, 20, 'Year', 1),
(30, 20, 'TypeSize', 1),
(31, 20, 'Volume', 1),
(32, 20, 'MAWP', 1),
(33, 20, 'OpsPress', 1),
(34, 20, 'Max_Operating_Temp', 1),
(35, 20, 'Min_Metal_Temp', 1),
(36, 20, 'Material_Grade', 1),
(37, 20, 'Thickness', 1),
(38, 20, 'Hyd_Test_Press', 1),
(39, 20, 'ConstrCode', 1),
(41, 20, 'No_ofSV_PRV', 1),
(42, 18, 'Description', 1),
(43, 18, 'Distributor', 1),
(44, 18, 'YearBuilt', 1),
(45, 18, 'ModelType', 1),
(46, 18, 'SteamCaps', 1),
(47, 18, 'MAWPDesign', 1),
(48, 18, 'OpsPress', 1),
(49, 18, 'Temp', 1),
(50, 18, 'Material', 1),
(51, 18, 'Thickness', 1),
(52, 18, 'TestPress', 1),
(53, 18, 'ConstrCode', 1),
(54, 18, 'No_of_SVSet', 1),
(55, 21, 'Description', 1),
(56, 21, 'Distributor', 1),
(57, 21, 'YearBuilt', 1),
(58, 21, 'BeamLength', 1),
(59, 21, 'LiftHeight', 1),
(60, 21, 'HoistType', 1),
(61, 21, 'TrolleyDtl', 1),
(62, 21, 'HoistDetail', 1),
(63, 21, 'Material Dtl', 1),
(64, 22, 'Description', 1),
(65, 22, 'Distributor', 1),
(66, 22, 'YearBuilt', 1),
(67, 22, 'PostHeight', 1),
(68, 22, 'JibLength', 1),
(69, 22, 'HoistType', 1),
(70, 22, 'TrolleyDtl', 1),
(71, 22, 'HoistDtl', 1),
(72, 22, 'MaterialDtl', 1),
(73, 22, 'Deflection', 1),
(74, 21, 'Deflection', 1),
(75, 23, 'Description', 1),
(76, 23, 'Manufacturer', 1),
(77, 23, 'YearBuilt', 1),
(78, 23, 'BeamLength', 1),
(79, 23, 'LiftHeight', 1),
(80, 23, 'HoistType', 1),
(81, 23, 'TrolleyDtl', 1),
(82, 23, 'HoistDetail', 1),
(83, 23, 'MaterialDtl', 1),
(84, 23, 'Deflection', 1),
(85, 24, 'Description', 1),
(86, 24, 'Distributor', 1),
(87, 24, 'YearBuilt', 1),
(88, 24, 'BeamLength', 1),
(89, 24, 'LiftHeight', 1),
(90, 24, 'HoistType', 1),
(91, 24, 'TrolleyDtl', 1),
(92, 24, 'HoistDetail', 1),
(93, 24, 'MaterialDtl', 1),
(94, 24, 'Deflection', 1),
(96, 6, 'Description', 1),
(97, 6, 'Type_Round_Eye_Twin', 1),
(98, 6, 'Size_Width_Length', 1),
(99, 6, 'Distributor', 1),
(100, 6, 'MaterialColor', 1),
(101, 29, 'Description', 1),
(102, 29, 'WireRopeMake', 1),
(103, 29, 'Grade', 1),
(104, 29, 'FerrulMaterial', 1),
(105, 7, 'Description', 1),
(106, 7, 'Construction_Type', 1),
(107, 7, 'Size', 1),
(108, 7, 'Grade', 1),
(109, 7, 'Distributor', 1),
(110, 7, 'No_of_Legs', 1),
(111, 7, 'Length_EWL', 1),
(112, 6, 'Material', 1),
(113, 20, 'RF_Pad_Leak_Test', 1),
(114, 20, 'Initial_Test_Type', 1),
(115, 10, 'Description', 1),
(116, 10, 'Type_or_Model', 1),
(118, 10, 'Grade', 1),
(119, 10, 'Reach', 1),
(120, 10, 'Size', 1),
(121, 10, 'Date_manufacturer', 1),
(122, 11, 'Description', 1),
(123, 11, 'Type_or_Model', 1),
(124, 11, 'Size', 1),
(125, 11, 'Grade', 1),
(126, 11, 'Reach', 1),
(127, 11, 'Date_Manufacturer', 1),
(128, 11, 'Distributor', 1),
(129, 32, 'Description', 1),
(130, 32, 'Model_or_DWG', 1),
(131, 32, 'Safety_Factor', 1),
(132, 32, 'Year_manufacturer', 1),
(133, 32, 'Distributor', 1),
(134, 32, 'Self_weight', 1),
(135, 32, 'Proof_tested', 1),
(136, 32, 'Acceptance_References', 1),
(137, 10, 'Distributor', 1),
(138, 29, 'Distributor', 1),
(139, 10, 'Proof_Test', 1),
(140, 10, 'Standard', 1),
(141, 11, 'Proof_Test', 1),
(142, 11, 'Standard', 1),
(143, 35, 'Description', 1),
(144, 35, 'Model_or_DWG', 1),
(145, 35, 'Safety_Factor', 1),
(146, 35, 'Distributor', 1),
(147, 35, 'Date_manufacturer', 1),
(148, 35, 'Self_Weight', 1),
(149, 35, 'Proof_Tested', 1),
(150, 35, 'Acceptance_References', 1),
(151, 12, 'Description', 1),
(152, 12, 'Type', 1),
(153, 12, 'Size', 1),
(154, 12, 'Grade', 1),
(155, 12, 'Distributor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `label_value`
--

CREATE TABLE `label_value` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `product_category_id` int(9) DEFAULT NULL,
  `label_name` varchar(100) DEFAULT NULL,
  `label_value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `label_value`
--

INSERT INTO `label_value` (`id`, `parent_id`, `product_category_id`, `label_name`, `label_value`) VALUES
(21, 9, 8, 'Description', 'Webbing Sling, 4'),
(22, 9, 8, 'Type', 'Endless'),
(114, 297, 32, 'Description', 'Laddle Beam 16 Tons, Foundry Hook'),
(115, 297, 32, 'WireRopeMake', NULL),
(116, 297, 32, 'Grade', NULL),
(117, 297, 32, 'FerrulMaterial', NULL),
(112603, 59, 9, 'Description', 'Bow Shackle 7/8, Screw Pin Type, 6:1'),
(112604, 59, 9, 'Make', 'Bow Shackle 7/8'),
(112605, 59, 9, 'Size_Dia', 'Bow Shackle 7/8'),
(112606, 59, 9, 'Type', 'Bow Shackle Screw Pin'),
(133257, 13, 17, 'Description', 'PS  2  HP  PUMP  H'),
(133258, 13, 17, 'Distributor', '-'),
(133259, 13, 17, 'Lift_Height', '10M'),
(133260, 13, 17, 'MaxDeflect', '19mm'),
(133261, 13, 17, 'MountingSys', 'Underslung '),
(133262, 13, 17, 'Operating_System', 'Pendant'),
(133263, 13, 17, 'RopeChains', '-'),
(133264, 13, 17, 'Span_Length', '10M'),
(133265, 13, 17, 'Travel_Distance', '12M'),
(133266, 13, 17, 'Year', '2018'),
(133267, 14, 21, 'BeamLength', '12'),
(133268, 14, 21, 'Deflection', 'ini deflect'),
(133269, 14, 21, 'Description', 'ini desi'),
(133270, 14, 21, 'Distributor', 'ini disteri'),
(133271, 14, 21, 'HoistDetail', 'ini deti'),
(133272, 14, 21, 'HoistType', '42'),
(133273, 14, 21, 'LiftHeight', '143'),
(133274, 14, 21, 'Material Dtl', ''),
(133275, 14, 21, 'TrolleyDtl', '23'),
(133276, 14, 21, 'YearBuilt', '2076'),
(133298, 17, 29, 'Description', 'Billet Slings 1.8 Ton '),
(133299, 17, 29, 'Distributor', 'MES'),
(133300, 17, 29, 'FerrulMaterial', 'Alumunium '),
(133301, 17, 29, 'Grade', '1770'),
(133302, 17, 29, 'WireRopeMake', 'Briton Wolf '),
(133303, 15, 20, 'ConstrCode', '-'),
(133304, 15, 20, 'Decription', 'Test'),
(133305, 15, 20, 'Distributor', 'Ramsis Engineering '),
(133306, 15, 20, 'Hyd_Test_Press', ''),
(133307, 15, 20, 'Initial_Test_Type', ''),
(133308, 15, 20, 'Material_Grade', ''),
(133309, 15, 20, 'MAWP', ''),
(133310, 15, 20, 'Max_Operating_Temp', ''),
(133311, 15, 20, 'Min_Metal_Temp', ''),
(133312, 15, 20, 'No_ofSV_PRV', ''),
(133313, 15, 20, 'OpsPress', ''),
(133314, 15, 20, 'RF_Pad_Leak_Test', ''),
(133315, 15, 20, 'Thickness', ''),
(133316, 15, 20, 'TypeSize', ''),
(133317, 15, 20, 'Volume', ''),
(133318, 15, 20, 'Year', '');

-- --------------------------------------------------------

--
-- Table structure for table `legs`
--

CREATE TABLE `legs` (
  `id` int(9) NOT NULL,
  `legs_name` varchar(25) NOT NULL,
  `active` char(1) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `legs`
--

INSERT INTO `legs` (`id`, `legs_name`, `active`, `uid`) VALUES
(1, 'Single', 'Y', 1),
(2, 'Double', 'Y', 1),
(3, 'Triple', 'Y', 1),
(4, 'Quad', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `location_name` varchar(45) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_name`, `uid`) VALUES
(1, 'Central Workshop', 1),
(2, 'Workshop 2', 1),
(3, 'Power Station 1', 1),
(4, 'Room C', 1),
(5, 'Room D', 1),
(6, 'Power Station 2', 1),
(7, 'CH3 Hot Metal', 1),
(8, 'PTA Garage Line 5', 1),
(9, 'CH2 Operation', 1),
(10, 'ALBA Project', 1),
(11, 'SMS Site Office', 1),
(12, 'PS3 GT31', 1),
(13, 'Receive and Dispatch Area', 1),
(14, 'Refractory Workshop', 1),
(15, 'Carbon 1&2 Maintenance', 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacture`
--

CREATE TABLE `manufacture` (
  `id` int(9) NOT NULL,
  `manufacture_name` varchar(50) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacture`
--

INSERT INTO `manufacture` (`id`, `manufacture_name`, `uid`) VALUES
(2, 'ALBA', 1),
(7, 'ALLSAFE', 1),
(8, 'BERG STEEL', 1),
(9, 'CM', 1),
(10, 'DAYTON', 1),
(11, 'HOLLAND', 1),
(12, 'JET', 1),
(13, 'LIFTEK', 1),
(14, 'MUHARRAQ ENGINEERING SERVICE', 1),
(15, 'NASIF KHANSAHEEB', 1),
(16, 'OZ LIFTING', 1),
(17, 'RS COMPONENT', 1),
(18, 'SAMSEL', 1),
(19, 'SLINGTEK WLL', 1),
(20, 'SOUTH WEST', 1),
(21, 'VITAL', 1),
(22, 'TUV Nord', 1),
(23, 'FALCON TRADING', 1),
(24, 'OTSC', 1),
(25, 'FABTECH', 1),
(26, 'ARBIL', 1),
(27, 'VERLINDE', 1),
(28, 'BUREAU VERITAS', 1),
(29, 'RUD LIFTING', 1),
(30, 'YOKE', 1),
(31, 'GEORGE TAYLOR', 1),
(33, 'CROSBY', 1),
(34, 'BRIDON', 1),
(35, 'LlOYDS INTERNATIONAL', 1),
(36, 'ARABIAN INTERNATIONAL', 1),
(37, 'TURK MECHANICAL', 1),
(38, 'KoneCrane', 1),
(39, 'ECL ( Fives )', 1),
(40, 'ITALKRANE', 1),
(41, 'CARLSTAHL', 1),
(42, 'UNKNOWN', 1),
(43, 'DELTA PLUS', 1),
(44, 'Ramsis Engineering', 1),
(45, 'JB Lifting', 1),
(46, 'CARTEC Italy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_product`
--

CREATE TABLE `mst_product` (
  `id` int(9) NOT NULL,
  `category_id` int(9) DEFAULT NULL,
  `product_category_id` int(9) DEFAULT NULL,
  `end_user_id` int(9) DEFAULT NULL,
  `manufacture_id` int(9) DEFAULT NULL,
  `serial_number` varchar(15) DEFAULT NULL,
  `asset_number` varchar(15) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `capacity` decimal(7,2) DEFAULT NULL,
  `unit_system_id` int(9) DEFAULT NULL,
  `inspection_schedule_id` int(9) DEFAULT NULL,
  `quick_check_no` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_product`
--

INSERT INTO `mst_product` (`id`, `category_id`, `product_category_id`, `end_user_id`, `manufacture_id`, `serial_number`, `asset_number`, `service_date`, `expire_date`, `capacity`, `unit_system_id`, `inspection_schedule_id`, `quick_check_no`, `status`, `uid`) VALUES
(13, 20, 10, 9, 38, '52514', '6', '1988-11-01', '2019-10-01', 10.00, 4, 1, '-', 13, 1),
(14, 20, 21, 11, 42, '68098', '100', '0000-00-00', '2019-06-04', 2.00, 13, 1, '', 8, 1),
(15, 21, 20, 10, 0, '54100/1', '132', '0000-00-00', '2020-04-04', 10.00, 2, 7, '', 8, 1),
(16, 13, 20, 4, 7, '', '', '2018-04-16', '2018-04-17', 22.00, 9, 4, '', 11, 1),
(17, 22, 29, 8, 14, 'K100886', '', '2018-05-10', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(18, 22, 29, 8, 14, 'K100887', '', '2018-05-13', '2020-01-30', 1.80, 4, 2, '', 5, 1),
(19, 22, 29, 8, 14, 'K100888', '', '2018-05-13', '2020-01-31', 1.80, 4, 2, '', 5, 1),
(20, 22, 29, 8, 14, 'K100889', '', '2018-05-13', '2020-02-06', 1.80, 4, 2, '', 5, 1),
(21, 22, 29, 8, 14, 'K100890', '', '2018-05-13', '2020-02-06', 1.80, 4, 2, '', 5, 1),
(22, 22, 29, 8, 14, 'K100891', '', '2018-05-13', '2020-02-27', 1.80, 4, 2, '', 5, 1),
(23, 22, 29, 8, 14, 'K100892', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(24, 22, 29, 8, 14, 'K100893', '', '2018-05-13', '2020-02-27', 1.80, 4, 2, '', 5, 1),
(25, 22, 29, 8, 14, 'K100894', '', '2018-06-30', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(26, 22, 29, 8, 14, 'K100895', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(27, 22, 29, 8, 14, 'K100896', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(28, 22, 29, 8, 14, 'K100897', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(29, 22, 29, 8, 14, 'K100898', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(30, 22, 29, 8, 14, 'K100899', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(31, 22, 29, 8, 14, 'K100900', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(32, 22, 29, 8, 14, 'K100901', '', '2018-05-13', '0000-00-00', 1.80, 4, 2, '', 6, 1),
(33, 22, 29, 8, 14, 'K100902', '', '2018-05-13', '2018-11-13', 1.80, 4, 2, '', 5, 1),
(34, 22, 29, 8, 14, 'K100872', '', '2018-05-15', '0000-00-00', 1.50, 13, 2, '', 6, 1),
(35, 22, 29, 8, 14, 'K100873', '', '2018-05-15', '0000-00-00', 1.50, 4, 2, '', 6, 1),
(36, 22, 29, 8, 14, 'K100874', '', '2018-05-15', '0000-00-00', 1.50, 4, 2, '', 6, 1),
(37, 22, 29, 8, 14, 'K100875', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(38, 22, 29, 8, 14, 'K100876', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(39, 22, 29, 8, 14, 'K100877', '', '2018-05-15', '0000-00-00', 1.50, 4, 2, '', 6, 1),
(40, 22, 29, 8, 14, 'K100878', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(41, 22, 29, 8, 14, 'K100879', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(42, 22, 29, 8, 14, 'K100880', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(43, 22, 29, 8, 14, 'K100881', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(44, 22, 29, 8, 14, 'K100882', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(45, 22, 29, 8, 14, 'K100883', '', '2018-05-15', '0000-00-00', 1.50, 4, 2, '', 6, 1),
(46, 22, 29, 8, 14, 'K100884', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(47, 22, 29, 8, 14, 'K100885', '', '2018-05-15', '2018-11-15', 1.50, 4, 2, '', 5, 1),
(48, 22, 29, 8, 19, 'K104970', '', '2018-05-16', '2018-11-17', 1.80, 3, 2, '', 5, 1),
(49, 22, 7, 2, 19, 'K98747', '', '2018-05-16', '2019-01-09', 2.10, 13, 2, '', 5, 1),
(50, 22, 8, 27, 19, '33964-4779', '', '2018-05-22', '0000-00-00', 6000.00, 5, 2, '', 6, 1),
(51, 22, 8, 27, 19, '33964-4726', '', '2018-05-22', '0000-00-00', 6000.00, 5, 2, '', 6, 1),
(52, 22, 8, 27, 41, 'FB5206', '', '2018-05-22', '0000-00-00', 6.00, 13, 2, '', 6, 1),
(53, 22, 8, 27, 19, '023466253', '', '2018-05-22', '2018-06-30', 6.00, 13, 2, '', 5, 1),
(54, 22, 8, 27, 19, '023466258', '', '2018-05-22', '2018-06-30', 6.00, 13, 2, '', 5, 1),
(55, 22, 8, 27, 19, '025580404', '', '2018-05-22', '0000-00-00', 3.00, 13, 2, '', 6, 1),
(56, 22, 8, 27, 19, '025580403', '', '2018-05-22', '2018-06-30', 3.00, 13, 2, '', 5, 1),
(57, 22, 5, 27, 42, '10504', '', '2018-05-22', '2018-06-30', 6.20, 13, 2, '', 5, 1),
(58, 22, 5, 27, 42, '10503', '', '2018-05-22', '2018-06-30', 6.20, 13, 2, '', 5, 1),
(59, 22, 9, 27, 41, 'CSH118', '', '2018-05-22', '2018-06-30', 8.50, 13, 2, '', 5, 1),
(60, 22, 9, 27, 41, 'CSH115', '', '2018-05-22', '2018-06-30', 8.50, 13, 2, '', 5, 1),
(61, 22, 9, 27, 41, 'CSH117', '', '2018-05-22', '2018-06-30', 8.50, 13, 2, '', 5, 1),
(62, 22, 9, 27, 41, 'CSH119', '', '2018-05-22', '2018-06-30', 8.50, 13, 2, '', 5, 1),
(63, 22, 9, 27, 41, 'CSH6526', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(64, 22, 9, 27, 41, 'CSH6529', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(65, 22, 9, 27, 41, 'CSH6528', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(66, 22, 9, 27, 41, 'CSH6522', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(67, 22, 9, 27, 41, 'CSH6521', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(68, 22, 9, 27, 41, 'CSH6527', '', '2018-05-22', '2018-06-30', 17.00, 13, 2, '', 5, 1),
(69, 22, 9, 27, 41, 'CSH910', '', '2018-05-22', '2018-06-30', 13.00, 13, 2, '', 5, 1),
(70, 22, 9, 27, 41, 'CSH904', '', '2018-05-22', '2018-06-30', 13.00, 13, 2, '', 5, 1),
(71, 22, 7, 2, 14, 'K94420', '', '2018-05-22', '0000-00-00', 4.25, 13, 2, '', 7, 1),
(72, 22, 8, 27, 19, '025982427', '', '2018-05-22', '2018-06-30', 4000.00, 5, 2, '', 5, 1),
(73, 22, 8, 27, 19, '025982428', '', '2018-05-22', '2018-06-30', 4000.00, 5, 2, '', 5, 1),
(74, 22, 8, 27, 19, '026082536', '', '2018-05-22', '2018-06-30', 6000.00, 5, 2, '', 5, 1),
(75, 22, 8, 27, 19, '026082532', '', '2018-05-22', '2018-06-30', 6000.00, 5, 2, '', 5, 1),
(76, 22, 8, 27, 19, '026082521', '', '2018-05-22', '2018-06-30', 6000.00, 5, 2, '', 5, 1),
(77, 22, 8, 27, 19, '025781695', '', '2018-05-22', '2018-06-30', 2000.00, 5, 2, '', 5, 1),
(78, 22, 8, 27, 19, '025781702', '', '2018-05-22', '2018-06-30', 2000.00, 5, 2, '', 5, 1),
(79, 22, 8, 6, 43, '37008', '', '2018-05-24', '2019-01-10', 4000.00, 5, 2, '', 5, 1),
(80, 22, 8, 6, 19, '025680729', '', '2018-05-24', '2018-06-30', 4.00, 13, 2, '', 4, 1),
(81, 22, 8, 6, 19, '025681065', '', '2018-05-24', '2018-06-30', 4.00, 13, 2, '', 4, 1),
(82, 22, 5, 6, 19, '14610', '', '2018-05-24', '2018-06-30', 5.10, 13, 2, '', 4, 1),
(83, 22, 5, 6, 19, '14611', '', '2018-05-24', '2018-06-30', 5.10, 13, 2, '', 4, 1),
(84, 22, 5, 6, 19, '14612', '', '2018-05-24', '2018-06-30', 5.10, 13, 2, '', 4, 1),
(85, 22, 5, 6, 19, '14613', '', '2018-05-24', '2018-06-30', 5.10, 13, 2, '', 4, 1),
(86, 22, 5, 6, 19, '14614', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(87, 22, 5, 6, 19, '14615', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(88, 22, 5, 6, 19, '14616', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(89, 22, 5, 6, 19, '14617', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(90, 22, 5, 6, 19, '14618', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(91, 22, 5, 6, 19, '14619', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(92, 22, 5, 6, 19, '14620', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(93, 22, 5, 6, 19, '14621', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(94, 22, 5, 6, 19, '14622', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(95, 22, 5, 6, 19, '14623', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(96, 22, 5, 6, 19, '14624', '', '2018-05-24', '2018-11-24', 5.10, 13, 2, '', 5, 1),
(97, 22, 5, 6, 19, '14648', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 6, 1),
(98, 22, 5, 6, 19, '14642', '', '2018-05-24', '2018-11-24', 1.80, 13, 2, '', 5, 1),
(99, 22, 5, 6, 19, '14646', '', '2018-05-24', '2018-11-24', 1.80, 13, 2, '', 5, 1),
(100, 22, 5, 6, 19, '14651', '', '2018-05-24', '2018-11-24', 1.80, 13, 2, '', 5, 1),
(101, 22, 5, 6, 19, '14629', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(102, 22, 5, 6, 19, '14627', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(103, 22, 5, 6, 19, '14647', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(104, 22, 5, 6, 19, '14630', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(105, 22, 5, 6, 19, '14638', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(106, 22, 5, 6, 19, '14632', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(107, 22, 5, 6, 19, '14649', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(108, 22, 5, 6, 19, '14634', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(109, 22, 5, 6, 19, '14628', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(110, 22, 5, 6, 19, '14633', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(111, 22, 5, 6, 19, '14625', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(112, 22, 5, 6, 19, '14635', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 6, 1),
(113, 22, 5, 6, 19, '14636', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 6, 1),
(114, 22, 5, 6, 19, '14631', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(115, 22, 5, 6, 19, '14639', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(116, 22, 5, 6, 19, '14655', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(117, 22, 5, 6, 19, '14656', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(118, 22, 5, 6, 19, '14657', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(119, 22, 5, 6, 19, '14658', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(120, 22, 5, 6, 19, '14659', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(121, 22, 5, 6, 19, '14660', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(122, 22, 5, 6, 19, '14661', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(123, 22, 5, 6, 19, '14662', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(124, 22, 5, 6, 19, '14663', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(125, 22, 5, 6, 19, '14664', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(126, 22, 5, 6, 19, '14665', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(127, 22, 5, 6, 19, '14666', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(128, 22, 5, 6, 19, '14667', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 4, 1),
(129, 22, 5, 6, 19, '14668', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(130, 22, 5, 6, 19, '14669', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(131, 22, 5, 6, 19, '14670', '', '2018-05-24', '0000-00-00', 1.80, 13, 2, '', 6, 1),
(132, 22, 5, 6, 19, '14671', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(133, 22, 5, 6, 19, '14672', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(134, 22, 5, 6, 19, '14673', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(135, 22, 5, 6, 19, '14674', '', '2018-05-24', '2019-01-10', 1.80, 13, 2, '', 5, 1),
(137, 20, 10, 27, 21, '19715', '', '2018-06-04', '2018-06-30', 2.00, 13, 2, '', 5, 1),
(138, 20, 10, 27, 21, '14144', '', '2018-06-04', '0000-00-00', 1.50, 13, 2, '', 7, 1),
(139, 20, 10, 27, 21, '19662', '', '2018-06-04', '0000-00-00', 2.00, 13, 2, '', 7, 1),
(140, 20, 10, 27, 21, '14138', '', '2018-06-04', '0000-00-00', 1.50, 13, 2, '', 7, 1),
(142, 22, 9, 28, 33, 'K101291', '', '2018-06-12', '0000-00-00', 12.00, 3, 2, '', 0, 10),
(143, 22, 9, 28, 33, 'K101291', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(144, 22, 9, 28, 33, 'K101292', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(145, 22, 9, 28, 33, 'K101293', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(146, 22, 9, 28, 33, 'K101294', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(147, 22, 9, 28, 33, 'K101295', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(148, 22, 9, 28, 33, 'K101296', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(149, 22, 9, 28, 33, 'K101297', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(150, 22, 9, 28, 33, 'K101298', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(151, 22, 9, 28, 33, 'K101299', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(152, 22, 9, 28, 33, 'K101300', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(153, 22, 9, 28, 33, 'K101301', '', '2018-06-12', '2018-12-13', 12.00, 3, 2, '', 5, 1),
(154, 22, 9, 28, 33, 'K101302', '', '2018-06-12', '2018-12-12', 12.00, 3, 2, '', 5, 1),
(155, 22, 9, 28, 33, 'K101279', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(156, 22, 9, 28, 33, 'K101280', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(157, 22, 9, 28, 33, 'K101281', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(158, 22, 9, 28, 33, 'K101282', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(159, 22, 9, 28, 33, 'K101283', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(160, 22, 9, 28, 33, 'K101284', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(161, 22, 9, 28, 33, 'K101285', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(162, 22, 9, 28, 33, 'K101286', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(163, 22, 9, 28, 33, 'K101287', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(164, 22, 9, 28, 33, 'K101288', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(165, 22, 9, 28, 33, 'K101289', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(166, 22, 9, 28, 33, 'K101290', '', '2018-06-12', '2018-12-12', 8.50, 3, 2, '', 5, 1),
(167, 22, 7, 31, 19, 'K98490', '', '2018-07-02', '2019-01-10', 26.50, 13, 2, '', 5, 1),
(168, 22, 12, 28, 33, 'K102054', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(169, 22, 12, 28, 33, 'K102055', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(170, 22, 12, 28, 33, 'K102056', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(171, 22, 12, 28, 33, 'K102057', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(172, 22, 12, 28, 33, 'K102058', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(173, 22, 12, 28, 33, 'K102059', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(174, 22, 12, 28, 33, 'K102060', '', '2018-07-02', '0000-00-00', 1.00, 3, 2, '', 5, 1),
(175, 22, 12, 28, 33, 'K102061', '', '2018-07-02', '0000-00-00', 1.00, 3, 2, '', 5, 1),
(176, 22, 12, 28, 33, 'K102062', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(177, 22, 12, 28, 33, 'K102063', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(178, 22, 12, 28, 33, 'K102064', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(179, 22, 12, 28, 33, 'K102065', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(180, 22, 12, 28, 33, 'K102066', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(181, 22, 12, 28, 33, 'K102067', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(182, 22, 12, 28, 33, 'K102068', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(183, 22, 12, 28, 33, 'K102069', '', '2018-07-02', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(184, 22, 12, 28, 33, 'K102190', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(185, 22, 12, 28, 33, 'K102191', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(186, 22, 12, 28, 33, 'K102192', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(187, 22, 12, 28, 33, 'K102193', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(188, 22, 12, 28, 33, 'K102194', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(189, 22, 12, 28, 33, 'K102195', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(190, 22, 12, 28, 33, 'K102196', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(191, 22, 12, 28, 33, 'K102197', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(192, 22, 12, 28, 33, 'K102198', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(193, 22, 12, 28, 33, 'K102199', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(194, 22, 12, 28, 33, 'K1021100', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(195, 22, 12, 28, 33, 'K1021101', '', '2018-07-02', '0000-00-00', 1.80, 3, 2, '', 5, 1),
(196, 22, 12, 28, 33, 'K102202', '', '2018-07-02', '0000-00-00', 2.50, 3, 2, '', 5, 1),
(197, 22, 12, 28, 33, 'K102203', '', '2018-07-02', '0000-00-00', 2.50, 3, 2, '', 5, 1),
(198, 22, 12, 28, 33, 'K102204', '', '2018-07-02', '0000-00-00', 2.50, 3, 2, '', 5, 1),
(199, 22, 12, 28, 33, 'K102205', '', '2018-07-02', '0000-00-00', 2.50, 3, 2, '', 5, 1),
(200, 22, 12, 28, 33, 'K102206', '', '2018-07-02', '0000-00-00', 4.00, 3, 2, '', 5, 1),
(201, 22, 12, 28, 33, 'K102207', '', '2018-07-02', '0000-00-00', 4.00, 3, 2, '', 5, 1),
(202, 22, 12, 28, 33, 'K102208', '', '2018-07-02', '0000-00-00', 4.00, 3, 2, '', 5, 1),
(203, 22, 12, 28, 33, 'K102209', '', '2018-07-02', '0000-00-00', 4.00, 3, 2, '', 5, 1),
(204, 22, 9, 30, 41, 'CSJ7989', '', '2018-07-01', '2019-01-01', 6.50, 13, 2, '', 5, 1),
(205, 22, 9, 30, 41, 'CSJ7990', '', '2018-07-01', '2019-01-01', 6.50, 13, 2, '', 5, 1),
(206, 22, 9, 30, 41, 'CSJ7991', '', '2018-07-01', '2019-01-01', 6.50, 13, 2, '', 5, 1),
(207, 22, 9, 30, 41, 'CSJ7992', '', '2018-07-01', '2019-01-01', 6.50, 13, 2, '', 5, 1),
(208, 20, 10, 34, 21, '60196', '', '2018-01-15', '0000-00-00', 2.00, 13, 2, '', 11, 1),
(209, 20, 10, 34, 21, '88777', '', '2018-01-15', '0000-00-00', 2.00, 13, 2, '', 11, 1),
(210, 20, 10, 34, 21, '71516', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(211, 20, 10, 34, 21, '63205', '', '2018-01-15', '0000-00-00', 2.00, 13, 2, '', 11, 1),
(212, 20, 10, 34, 21, '42694', '', '2018-01-15', '0000-00-00', 1.50, 13, 2, '', 11, 1),
(213, 20, 10, 34, 21, '64619', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(214, 20, 10, 34, 21, '90855', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(215, 20, 10, 34, 21, '83077', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(216, 20, 10, 34, 21, '100122', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(217, 20, 10, 34, 21, '7038', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(218, 20, 10, 34, 21, '68863', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(219, 20, 10, 34, 21, '43969', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(220, 20, 10, 34, 21, '94964', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(221, 20, 10, 34, 21, '94965', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(222, 20, 10, 34, 21, '170121', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(223, 20, 11, 34, 21, '70771', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 11, 1),
(224, 20, 11, 34, 21, '70772', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 11, 1),
(225, 20, 11, 34, 21, '83078', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 11, 1),
(226, 22, 7, 34, 21, '65891', '', '2018-01-15', '0000-00-00', 23.60, 13, 2, '', 11, 1),
(227, 22, 7, 34, 21, '49217', '', '2018-01-15', '0000-00-00', 7.50, 13, 2, '', 11, 1),
(228, 22, 7, 34, 21, '82547', '', '2018-01-15', '0000-00-00', 3.00, 13, 2, '', 11, 1),
(229, 22, 7, 34, 21, '15107', '', '2018-01-15', '0000-00-00', 6.50, 13, 2, '', 11, 1),
(230, 22, 7, 34, 21, '68861', '', '2018-01-15', '0000-00-00', 2.10, 13, 2, '', 11, 1),
(231, 22, 7, 34, 21, '61583', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(232, 22, 7, 34, 21, '71727', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(233, 22, 7, 34, 21, '78130', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(234, 22, 7, 34, 21, '60022', '', '2018-01-15', '0000-00-00', 10.00, 13, 2, '', 11, 1),
(235, 22, 7, 34, 21, '66023', '', '2018-01-15', '0000-00-00', 10.00, 13, 2, '', 11, 1),
(236, 22, 9, 30, 33, 'MSE260', '', '2018-07-01', '2019-01-01', 4.75, 13, 2, '', 5, 1),
(237, 22, 9, 30, 33, '267', '', '2018-07-01', '2019-01-01', 4.75, 13, 2, '', 5, 1),
(238, 22, 7, 34, 21, '32538', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(239, 22, 7, 34, 21, '43001', '', '2018-01-15', '0000-00-00', 5.50, 13, 2, '', 11, 1),
(240, 22, 9, 30, 41, 'FB473', '', '2018-07-01', '2019-01-01', 3.25, 13, 2, '', 5, 1),
(241, 22, 7, 0, 21, '89150', '', '2018-01-15', '0000-00-00', 5.50, 13, 2, '', 11, 1),
(242, 22, 9, 30, 41, 'FB4774', '', '2018-07-01', '2019-01-01', 3.25, 13, 2, '', 5, 1),
(243, 22, 7, 34, 21, '95056', '', '2018-01-15', '0000-00-00', 5.00, 13, 2, '', 11, 1),
(244, 22, 7, 34, 21, '95817', '', '2018-01-15', '0000-00-00', 6.70, 13, 2, '', 11, 1),
(245, 22, 8, 30, 19, '025480222', '', '2018-07-01', '2019-01-01', 2.00, 13, 2, '', 5, 1),
(246, 22, 7, 34, 21, '95998', '', '2018-01-15', '0000-00-00', 11.20, 13, 2, '', 11, 1),
(247, 22, 7, 34, 21, '95063', '', '2018-01-15', '0000-00-00', 5.50, 13, 2, '', 11, 1),
(248, 22, 8, 30, 19, '025781896', '', '2018-07-01', '2019-01-01', 3.00, 13, 2, '', 5, 1),
(249, 22, 7, 34, 21, '32533', '', '2018-01-15', '0000-00-00', 6.50, 13, 2, '', 0, 1),
(250, 22, 8, 30, 19, '025781759', '', '2018-07-01', '2019-01-01', 3.00, 13, 2, '', 5, 1),
(251, 22, 7, 34, 21, '33850', '', '2018-01-15', '0000-00-00', 11.20, 13, 2, '', 11, 1),
(252, 22, 8, 30, 19, '025479966', '', '2018-07-01', '2019-01-01', 2.00, 13, 2, '', 5, 1),
(253, 22, 7, 34, 21, '82903', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(254, 22, 7, 34, 21, '61503', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 11, 1),
(255, 22, 5, 34, 21, '51373', '', '2018-01-15', '0000-00-00', 5.10, 13, 2, '', 11, 1),
(256, 22, 5, 34, 21, '51374', '', '2018-01-15', '0000-00-00', 5.10, 13, 2, '', 11, 1),
(257, 22, 5, 34, 21, '51375', '', '2018-01-15', '0000-00-00', 5.10, 13, 2, '', 11, 1),
(258, 22, 5, 34, 21, '26645', '', '2018-01-15', '0000-00-00', 4.00, 13, 2, '', 11, 1),
(259, 22, 5, 34, 21, '26647', '', '2018-01-15', '0000-00-00', 4.00, 13, 2, '', 11, 1),
(260, 22, 5, 34, 21, '5.316', '', '2018-01-15', '0000-00-00', 5.10, 13, 2, '', 11, 1),
(261, 22, 5, 34, 21, '50318', '', '2018-01-15', '0000-00-00', 5.10, 13, 2, '', 11, 1),
(262, 22, 12, 34, 21, '62093', '', '2018-01-15', '0000-00-00', 16.00, 13, 2, '', 11, 1),
(263, 22, 12, 34, 21, '62092', '', '2018-01-15', '0000-00-00', 16.00, 13, 2, '', 11, 1),
(264, 22, 12, 34, 21, '71495', '', '2018-01-15', '0000-00-00', 11.50, 13, 2, '', 11, 1),
(265, 22, 12, 34, 21, '71496', '', '2018-01-15', '0000-00-00', 11.50, 13, 2, '', 11, 1),
(266, 22, 12, 34, 21, '71306', '', '2018-01-15', '0000-00-00', 11.50, 13, 2, '', 11, 1),
(267, 22, 12, 34, 21, '43006', '', '2018-01-15', '0000-00-00', 4.50, 13, 2, '', 11, 1),
(268, 22, 12, 34, 21, '43007', '', '2018-01-15', '0000-00-00', 4.50, 13, 2, '', 11, 1),
(269, 22, 12, 34, 21, '43004', '', '2018-01-15', '0000-00-00', 4.50, 13, 2, '', 11, 1),
(270, 22, 12, 34, 21, '31350', '', '2018-01-15', '0000-00-00', 6.30, 13, 2, '', 11, 1),
(271, 22, 12, 34, 21, '89273', '', '2018-01-15', '0000-00-00', 2.75, 13, 2, '', 11, 1),
(272, 22, 12, 34, 21, '89272', '', '2018-01-15', '0000-00-00', 2.75, 13, 2, '', 11, 1),
(273, 22, 12, 34, 21, '89270', '', '2018-01-15', '0000-00-00', 2.00, 13, 2, '', 11, 1),
(274, 22, 12, 34, 21, '89271', '', '2018-01-15', '0000-00-00', 2.00, 13, 2, '', 11, 1),
(275, 22, 12, 34, 21, '93088', '', '2018-01-15', '0000-00-00', 1.00, 13, 2, '', 0, 1),
(276, 22, 12, 34, 21, '89251', '', '2018-01-15', '0000-00-00', 1.40, 13, 2, '', 0, 1),
(277, 22, 12, 34, 21, '89252', '', '2018-01-15', '0000-00-00', 1.40, 13, 2, '', 11, 1),
(278, 22, 12, 34, 21, '89253', '', '2018-01-15', '0000-00-00', 1.40, 13, 2, '', 0, 1),
(279, 22, 12, 34, 21, '91856', '', '2018-01-15', '0000-00-00', 1.40, 13, 0, '', 0, 1),
(280, 22, 12, 34, 21, '78383', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 11, 1),
(281, 22, 12, 34, 21, '74223', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 0, 1),
(282, 22, 12, 34, 21, '78389', '', '2018-01-15', '0000-00-00', 1.60, 13, 2, '', 11, 1),
(283, 22, 12, 34, 21, '78386', '', '2018-01-15', '0000-00-00', 0.90, 13, 0, '', 11, 1),
(284, 22, 12, 34, 21, '89266', '', '2018-01-15', '0000-00-00', 0.90, 13, 2, '', 11, 1),
(285, 22, 12, 34, 21, '89264', '', '2018-01-15', '0000-00-00', 0.90, 13, 2, '', 11, 1),
(286, 22, 12, 34, 21, '92919', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(287, 22, 12, 34, 21, '50652', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(288, 22, 12, 34, 21, '92920', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(289, 22, 12, 34, 21, '92916', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(290, 22, 12, 34, 21, '92923', '', '2018-01-15', '0000-00-00', 0.50, 13, 0, '', 11, 1),
(291, 22, 12, 34, 21, '84220', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(292, 22, 12, 34, 21, '93091', '', '2018-01-15', '0000-00-00', 0.50, 13, 0, '', 11, 1),
(293, 22, 12, 34, 21, '48222', '', '2018-01-15', '0000-00-00', 0.50, 13, 2, '', 11, 1),
(294, 22, 12, 34, 21, '65824', '', '2018-01-15', '0000-00-00', 1.40, 13, 2, '', 11, 1),
(295, 20, 10, 30, 41, '17114397', '', '2018-07-01', '2019-01-04', 3.00, 13, 2, '', 5, 1),
(296, 20, 11, 30, 45, '16043051', '', '2018-07-01', '2019-01-04', 1.50, 13, 2, '', 5, 1),
(297, 22, 32, 31, 37, 'K100244', '', '2017-11-02', '2019-09-03', 16.00, 13, 2, '', 5, 1),
(298, 22, 9, 10, 42, 'K73800', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(299, 22, 9, 10, 42, 'K45512', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(300, 22, 9, 10, 42, 'K73786', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(301, 22, 9, 10, 42, 'K94278', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(302, 22, 9, 10, 42, 'K78288', '', '2018-07-08', '0000-00-00', 0.75, 13, 2, '', 5, 1),
(303, 22, 9, 10, 42, 'K78285', '', '2018-07-08', '0000-00-00', 0.75, 13, 2, '', 5, 1),
(304, 22, 9, 10, 42, 'K61848', '', '2018-07-08', '0000-00-00', 0.75, 13, 2, '', 5, 1),
(305, 22, 9, 10, 42, 'K61821', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(306, 22, 9, 10, 42, 'K55764', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(307, 22, 9, 10, 42, 'K7830', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(308, 22, 9, 10, 42, 'K95757', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(309, 22, 9, 10, 42, 'K78302', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(310, 22, 9, 10, 42, 'K83264', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(311, 22, 9, 10, 42, 'K75069', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(312, 22, 9, 10, 42, 'K74123', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(313, 22, 9, 10, 42, 'K95751', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(314, 22, 9, 10, 42, 'K95753', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(315, 22, 9, 10, 42, 'K95756', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(316, 22, 9, 10, 42, 'K78298', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(317, 22, 9, 10, 42, 'K78301', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(318, 22, 9, 10, 42, 'K95911', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(319, 22, 9, 10, 42, 'K95912', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(320, 22, 9, 10, 42, 'K95913', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(321, 22, 9, 10, 42, 'K95914', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(322, 22, 9, 10, 42, 'K54879', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(323, 22, 9, 10, 42, 'K96053', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(324, 22, 9, 10, 42, 'K96051', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(325, 22, 9, 10, 42, 'K96052', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(326, 22, 9, 10, 42, 'K96054', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(327, 22, 9, 10, 42, 'K78309', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(328, 22, 9, 10, 42, 'K78310', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(329, 22, 9, 10, 42, 'K72747', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(330, 22, 9, 10, 42, 'K55617', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(331, 22, 9, 10, 42, 'K70384', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(332, 22, 9, 10, 42, 'K41135', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(333, 22, 9, 10, 42, 'K55888', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(334, 22, 9, 10, 42, 'K70325', '', '0000-00-00', '2018-07-08', 4.75, 13, 2, '', 5, 1),
(335, 22, 9, 10, 42, 'K70330', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(336, 22, 9, 10, 42, 'K70332', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(337, 22, 9, 10, 42, 'K70334', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(338, 22, 9, 10, 42, 'K70349', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(339, 22, 9, 10, 42, 'K70364', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(340, 22, 9, 10, 42, 'K70366', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(341, 22, 9, 10, 42, 'K73320', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(342, 22, 9, 10, 42, 'K72862', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(343, 22, 9, 10, 42, 'K70323', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(344, 22, 9, 10, 42, 'K50301', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(345, 22, 9, 10, 42, 'K36080', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(346, 22, 9, 10, 42, '4.75', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(347, 22, 9, 10, 42, 'K68989', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(348, 22, 9, 10, 42, 'K83265', '', '2018-07-08', '0000-00-00', 6.50, 13, 2, '', 5, 1),
(349, 22, 9, 10, 42, 'K61804', '', '2018-07-08', '0000-00-00', 6.50, 13, 2, '', 5, 1),
(350, 22, 9, 10, 42, 'K68566', '', '2018-07-08', '0000-00-00', 6.50, 13, 2, '', 5, 1),
(351, 22, 29, 8, 14, 'K101316', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(352, 22, 9, 10, 42, 'K55665', '', '2018-07-08', '0000-00-00', 0.00, 13, 2, '', 5, 1),
(353, 22, 9, 10, 42, 'K61799', '', '2018-07-08', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(354, 22, 29, 8, 14, 'K101317', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(355, 22, 29, 8, 14, 'K101318', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(356, 22, 9, 10, 42, 'K55660', '', '2018-07-08', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(357, 22, 9, 10, 42, 'K71046', '', '2018-07-08', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(358, 22, 9, 10, 42, 'K36137', '', '2018-07-08', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(359, 22, 9, 10, 42, 'K95792', '', '2018-07-08', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(360, 22, 9, 10, 42, 'K55654', '', '2018-07-08', '0000-00-00', 10.00, 13, 2, '', 5, 1),
(361, 22, 9, 10, 42, 'K55653', '', '2018-07-08', '0000-00-00', 12.00, 13, 2, '', 5, 1),
(362, 22, 9, 10, 42, 'K55681', '', '2018-07-08', '0000-00-00', 13.50, 13, 2, '', 5, 1),
(363, 22, 9, 10, 42, 'K61802', '', '2018-07-08', '0000-00-00', 13.50, 13, 2, '', 5, 1),
(364, 22, 9, 10, 42, 'K61803', '', '2018-07-08', '0000-00-00', 13.50, 13, 2, '', 5, 1),
(365, 22, 9, 10, 42, 'K60989', '', '2018-07-08', '0000-00-00', 13.50, 13, 2, '', 5, 1),
(366, 22, 9, 10, 42, 'K55647', '', '2018-07-08', '0000-00-00', 17.00, 13, 2, '', 5, 1),
(367, 22, 9, 10, 42, 'K55648', '', '2018-07-08', '0000-00-00', 17.00, 13, 2, '', 5, 1),
(368, 22, 9, 10, 42, 'K55649', '', '2018-07-08', '0000-00-00', 17.00, 13, 2, '', 5, 1),
(369, 22, 9, 10, 42, 'K55650', '', '2018-07-08', '0000-00-00', 17.00, 13, 0, '', 5, 1),
(370, 22, 9, 10, 42, 'K73831', '', '2018-07-08', '0000-00-00', 25.00, 13, 0, '', 5, 1),
(371, 22, 9, 10, 42, 'K73832', '', '2018-07-08', '0000-00-00', 25.00, 13, 0, '', 5, 1),
(372, 22, 9, 10, 42, 'K73834', '', '2018-07-08', '0000-00-00', 25.00, 13, 0, '', 5, 1),
(373, 22, 9, 10, 42, 'K61797', '', '2018-07-08', '0000-00-00', 25.00, 13, 2, '', 5, 1),
(374, 22, 9, 10, 42, 'K65417', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(375, 22, 9, 10, 42, 'K65418', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(376, 22, 9, 10, 42, 'K65419', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(377, 22, 9, 10, 42, 'K66058', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(378, 22, 9, 10, 42, 'K66060', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(379, 22, 9, 10, 42, 'K66063', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(380, 22, 9, 10, 42, 'K71974', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(381, 22, 9, 10, 42, 'K71975', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(382, 22, 9, 10, 42, 'K72004', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(383, 22, 9, 10, 42, 'K83266', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(384, 22, 9, 10, 42, 'K78325', '', '2018-07-08', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(385, 22, 9, 10, 42, 'K74193', '', '2018-07-08', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(386, 22, 9, 10, 42, 'K74194', '', '2018-07-08', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(387, 22, 9, 10, 42, 'K74195', '', '2018-07-08', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(388, 20, 10, 20, 21, 'K101076', '', '2018-07-08', '2019-01-05', 0.50, 13, 2, '', 5, 1),
(389, 22, 9, 10, 42, 'K74196', '', '2018-07-08', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(390, 22, 9, 10, 42, 'K68546', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(391, 22, 9, 10, 42, 'K68969', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(392, 22, 9, 10, 42, 'K68968', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(393, 22, 9, 10, 42, 'K61825', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(394, 22, 9, 10, 42, 'K65556', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(395, 22, 9, 10, 42, 'K83267', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(396, 22, 9, 10, 42, 'K95807', '', '2018-07-08', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(397, 22, 9, 10, 42, 'K78327', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(398, 22, 9, 10, 42, 'K78323', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(399, 22, 9, 10, 42, 'K78329', '', '2018-07-08', '0000-00-00', 3.25, 13, 2, '', 5, 1),
(400, 22, 9, 10, 42, 'K78330', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(401, 22, 9, 10, 42, 'K78331', '', '2018-07-08', '0000-00-00', 4.75, 13, 2, '', 5, 1),
(402, 22, 9, 10, 42, 'K713326', '', '2018-07-08', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(403, 20, 10, 20, 21, 'K101077', '', '2018-07-08', '2019-01-09', 0.50, 13, 2, '', 5, 1),
(404, 20, 10, 20, 21, 'K101078', '', '2018-07-08', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(405, 22, 9, 10, 42, 'K713324', '', '2018-07-08', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(406, 22, 9, 10, 42, 'K713325', '', '2018-07-09', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(407, 22, 9, 10, 42, 'K93645', '', '2018-07-09', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(408, 22, 9, 10, 42, 'K41199', '', '2018-07-09', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(409, 22, 9, 10, 42, 'K94012', '', '2018-07-09', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(410, 22, 9, 10, 42, 'K94016', '', '2018-07-09', '0000-00-00', 8.50, 13, 2, '', 5, 1),
(411, 22, 9, 10, 42, 'K83269', '', '2018-07-09', '0000-00-00', 9.50, 13, 2, '', 5, 1),
(412, 22, 9, 10, 42, 'K55645', '', '2018-07-09', '0000-00-00', 10.00, 13, 2, '', 5, 1),
(413, 22, 9, 10, 42, 'K55646', '', '2018-07-09', '0000-00-00', 10.00, 13, 2, '', 5, 1),
(414, 22, 9, 10, 42, 'K31237', '', '2018-07-09', '0000-00-00', 12.00, 13, 2, '', 5, 1),
(415, 22, 9, 10, 42, 'K31238', '', '2018-07-09', '0000-00-00', 12.00, 13, 2, '', 5, 1),
(416, 22, 9, 10, 42, 'K74161', '', '2018-07-09', '0000-00-00', 13.50, 13, 2, '', 5, 1),
(417, 22, 9, 10, 42, 'K31236', '', '2018-07-09', '0000-00-00', 16.00, 13, 0, '', 5, 1),
(418, 22, 9, 10, 42, 'K31235', '', '2018-07-09', '0000-00-00', 16.00, 13, 2, '', 5, 1),
(419, 22, 7, 2, 19, 'K96559', '', '2017-02-01', '2019-01-09', 6.70, 13, 2, '', 5, 1),
(420, 22, 7, 2, 19, 'K99859', '', '2018-07-09', '2018-11-09', 6.50, 13, 3, '', 5, 1),
(421, 22, 7, 2, 19, 'K99856', '', '2017-10-02', '2019-01-09', 6.50, 13, 2, '', 5, 1),
(422, 22, 12, 2, 46, 'K95563', '', '2018-01-02', '2019-01-09', 24.00, 13, 2, '', 5, 1),
(423, 22, 12, 2, 46, 'K95564', '', '2018-01-02', '2019-01-09', 24.00, 3, 2, '', 5, 1),
(424, 22, 12, 2, 46, 'K95561', '', '2018-01-02', '2019-01-09', 24.00, 13, 2, '', 5, 1),
(425, 22, 12, 2, 46, 'K95568', '', '2018-01-02', '2019-01-09', 24.00, 13, 2, '', 5, 1),
(426, 22, 8, 2, 13, 'K79223', '', '2018-01-01', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(427, 22, 8, 2, 7, 'K89926', '', '2018-01-02', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(428, 22, 8, 2, 7, 'K89929', '', '2018-01-02', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(429, 22, 8, 2, 7, 'K89941', '', '2018-01-02', '2019-01-09', 4.00, 13, 2, '', 5, 1),
(430, 22, 8, 2, 7, 'K89946', '', '2018-01-02', '2019-01-09', 4.00, 13, 2, '', 5, 1),
(431, 22, 8, 2, 7, 'K89945', '', '2018-01-02', '2019-01-09', 4.00, 13, 2, '', 5, 1),
(432, 20, 10, 36, 21, '26159', '', '2017-11-29', '2019-01-09', 1.00, 13, 2, '', 5, 1),
(433, 20, 11, 36, 21, '17041', '', '2017-11-29', '2019-01-09', 3.00, 13, 2, '', 5, 1),
(434, 20, 11, 36, 21, '17004', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(435, 20, 11, 36, 21, '17024', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(436, 20, 11, 36, 21, '17069', '', '2017-11-29', '2019-01-09', 3.00, 13, 2, '', 5, 1),
(437, 20, 10, 36, 21, '71984', '', '2017-11-29', '2019-01-09', 3.00, 13, 2, '', 5, 1),
(438, 20, 10, 36, 21, '93243', '', '2017-11-29', '2019-01-09', 3.00, 13, 2, '', 5, 1),
(439, 20, 10, 36, 21, '93249', '', '2017-11-29', '2019-01-09', 3.00, 13, 2, '', 5, 1),
(440, 22, 8, 36, 19, '024677437', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(441, 22, 8, 36, 19, '024576887', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(442, 22, 8, 36, 19, '024576110', '', '2017-11-29', '2019-01-09', 1.00, 13, 2, '', 5, 1),
(443, 22, 8, 36, 19, '024777914', '', '2017-11-29', '2019-01-09', 1.00, 13, 2, '', 5, 1),
(444, 22, 8, 36, 19, '024677132', '', '2017-11-29', '0000-00-00', 6.00, 13, 2, '', 6, 1),
(445, 22, 8, 35, 19, '026283210', '', '2018-06-30', '2019-01-05', 4000.00, 5, 2, '', 5, 1),
(446, 22, 8, 35, 19, '02683204', '', '2018-06-30', '2019-01-05', 4000.00, 5, 2, '', 5, 1),
(447, 22, 9, 36, 41, 'CSE5456', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(448, 22, 9, 36, 41, 'CSE5450', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(449, 22, 9, 36, 41, 'CSE5452', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(450, 22, 9, 36, 41, 'CSE5455', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(451, 22, 9, 36, 41, 'CSE5453', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(452, 22, 9, 36, 41, 'CSE5454', '', '2017-11-29', '2019-01-09', 9.50, 13, 2, '', 5, 1),
(453, 22, 9, 36, 41, 'FB4570', '', '2017-11-29', '2019-01-09', 13.50, 13, 2, '', 5, 1),
(454, 22, 9, 36, 41, 'FB4567', '', '2017-11-29', '2019-01-09', 13.50, 13, 2, '', 5, 1),
(455, 22, 9, 36, 41, 'FB4571', '', '2017-11-29', '2019-01-09', 13.50, 13, 2, '', 5, 1),
(456, 22, 9, 36, 41, 'FB4573', '', '2017-11-29', '2019-01-09', 13.50, 13, 2, '', 5, 1),
(457, 22, 9, 36, 41, 'CSE2585', '', '2017-11-29', '2019-01-09', 12.00, 13, 2, '', 5, 1),
(458, 22, 9, 36, 41, 'CSE2587', '', '2017-11-29', '2019-01-09', 12.00, 13, 2, '', 5, 1),
(459, 22, 9, 36, 41, 'CSE2582', '', '2017-11-29', '2019-01-09', 12.00, 13, 2, '', 4, 1),
(460, 22, 9, 36, 41, 'CSE2588', '', '2017-11-29', '2019-01-09', 12.00, 13, 2, '', 5, 1),
(461, 22, 9, 36, 41, 'CSE9797', '', '2017-11-29', '2019-01-09', 6.50, 13, 2, '', 5, 1),
(462, 22, 9, 36, 41, 'CSE9798', '', '2017-11-29', '2019-01-09', 6.50, 13, 2, '', 5, 1),
(463, 22, 9, 36, 41, 'CSE9801', '', '2017-11-29', '2019-01-09', 6.50, 13, 2, '', 5, 1),
(464, 22, 9, 36, 41, 'CSC8269', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(465, 22, 9, 36, 41, 'CSE9799', '', '2017-11-29', '2019-01-09', 6.50, 13, 2, '', 5, 1),
(466, 22, 9, 36, 41, 'CSC8270', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(467, 22, 9, 36, 41, 'CSC8271', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(468, 22, 9, 36, 41, 'CSC8262', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(469, 22, 9, 36, 41, 'CSC8283', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(470, 22, 9, 36, 41, 'CSG991', '', '0000-00-00', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(471, 22, 10, 20, 21, 'K101078', '', '2018-07-10', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(472, 22, 9, 36, 41, 'CSG992', '', '2017-11-29', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(473, 22, 9, 36, 41, 'CSG990', '', '2017-11-29', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(474, 22, 9, 36, 41, 'CSG994', '', '2017-11-29', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(475, 22, 9, 36, 41, 'CSG996', '', '2017-11-29', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(476, 22, 9, 36, 41, 'CSG993', '', '2017-11-29', '2019-01-09', 4.75, 13, 2, '', 5, 1),
(477, 22, 9, 36, 41, 'CSF1198', '', '2018-07-09', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(478, 22, 9, 36, 41, 'CSF1194', '', '2017-11-29', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(479, 22, 9, 36, 41, 'CSF1196', '', '2017-11-29', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(480, 22, 9, 36, 41, 'CSF1195', '', '2017-11-29', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(481, 22, 9, 36, 41, 'CSF1197', '', '2017-12-29', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(482, 22, 9, 36, 41, 'CSF1199', '', '2017-11-29', '2019-01-09', 3.25, 13, 2, '', 5, 1),
(483, 22, 9, 36, 41, 'CSE5415', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(484, 22, 10, 20, 21, 'k101079', '', '2018-07-10', '0000-00-00', 0.50, 13, 2, '', 5, 1),
(485, 22, 9, 36, 41, 'CSE5414', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(486, 22, 9, 36, 41, 'CSE5413', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(487, 22, 10, 20, 21, 'k101080', '', '2018-07-10', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(488, 22, 9, 36, 41, 'CSE5412', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(489, 22, 10, 20, 21, 'k101081', '', '2018-07-10', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(490, 22, 9, 36, 41, 'CSE5416', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(491, 22, 10, 20, 21, 'k101082', '', '2018-07-10', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(492, 22, 9, 36, 41, 'CSE5411', '', '2017-11-29', '2019-01-09', 2.00, 13, 2, '', 5, 1),
(493, 22, 10, 20, 0, 'k101083', '', '2018-07-10', '0000-00-00', 1.00, 13, 2, '', 5, 1),
(494, 22, 9, 36, 41, 'FB4659', '', '2017-11-29', '2019-01-09', 1.00, 13, 2, '', 5, 1),
(495, 22, 10, 20, 21, 'k101084', '', '2018-07-10', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(496, 22, 10, 20, 21, 'k101085', '', '2018-07-10', '0000-00-00', 1.50, 13, 2, '', 5, 1),
(497, 22, 10, 20, 21, 'k101086', '', '2018-07-10', '0000-00-00', 2.00, 3, 2, '', 5, 1),
(498, 22, 8, 36, 19, '024677670', '', '2017-11-29', '0000-00-00', 6000.00, 5, 2, '', 6, 1),
(499, 22, 10, 20, 21, 'k101087', '', '2018-07-10', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(500, 22, 8, 36, 41, '024677663', '', '2017-11-29', '2019-01-09', 6.00, 13, 2, '', 5, 1),
(501, 22, 10, 20, 21, 'k101088', '', '2018-07-10', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(502, 22, 9, 36, 41, 'CSH6744', '', '2017-11-29', '2019-01-09', 8.50, 13, 2, '', 5, 1),
(503, 22, 9, 36, 41, 'FB4434', '', '2017-11-29', '2019-01-09', 1.00, 13, 2, '', 5, 1),
(504, 22, 12, 10, 42, 'k78356', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(505, 22, 12, 10, 42, '90442', '', '2018-07-17', '0000-00-00', 4.00, 13, 2, '', 0, 1),
(506, 22, 12, 10, 42, '90443', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(507, 22, 12, 10, 42, '90445', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(508, 22, 12, 10, 42, '90448', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(509, 22, 12, 10, 42, '90449', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(510, 22, 12, 10, 42, '74208', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(511, 22, 12, 10, 42, '74211', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(512, 22, 12, 10, 42, '74210', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(513, 22, 12, 10, 42, '78358', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(514, 22, 12, 10, 42, '78359', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(515, 22, 12, 10, 42, '78360', '', '2018-07-17', '0000-00-00', 0.40, 13, 2, '', 5, 1),
(516, 22, 12, 10, 42, '78365', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(517, 22, 12, 10, 42, '78369', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(518, 22, 12, 10, 42, '78373', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(519, 22, 12, 10, 42, '83272', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(520, 22, 12, 10, 42, '83273', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(521, 22, 12, 10, 42, '83274', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(522, 22, 12, 10, 42, '83275', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(523, 22, 12, 10, 42, '83276', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(524, 22, 12, 10, 42, '74216', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(525, 22, 12, 10, 42, '74218', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(526, 22, 12, 10, 42, '74219', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(527, 22, 12, 10, 42, '90451', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(528, 22, 12, 10, 42, '90452', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(529, 22, 12, 10, 42, '90453', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(530, 22, 12, 10, 42, '90454', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(531, 22, 12, 10, 42, '90455', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(532, 22, 12, 10, 42, '90456', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(533, 22, 12, 10, 42, '90458', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(534, 22, 12, 10, 42, '78371', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(535, 22, 12, 10, 42, '78372', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(536, 22, 12, 10, 42, '78375', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(537, 22, 12, 10, 42, '78387', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(538, 22, 12, 10, 42, '89', '', '0000-00-00', '0000-00-00', 0.00, 0, 0, '', 0, 1),
(539, 22, 12, 10, 42, '74213', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(540, 22, 12, 10, 42, '74215', '', '2018-07-17', '0000-00-00', 0.80, 13, 2, '', 5, 1),
(541, 22, 7, 6, 19, 'ST-15005', '', '2018-07-11', '2019-01-10', 11.20, 3, 2, '', 5, 1),
(542, 22, 7, 6, 19, 'ST-14406', '', '2018-07-11', '2019-01-10', 11.20, 3, 2, '', 5, 1),
(543, 22, 7, 6, 14, 'MES-L-175', '', '2018-07-11', '2019-01-10', 11.25, 4, 2, '', 5, 1),
(544, 22, 5, 28, 19, 'K102436', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(545, 22, 5, 28, 19, 'K102437', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(546, 22, 5, 28, 19, 'K102438', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(547, 22, 5, 28, 19, 'K102439', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(548, 22, 5, 28, 19, 'K102440', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(549, 22, 5, 28, 19, 'K102441', '', '2018-07-11', '0000-00-00', 5.10, 3, 2, '', 5, 1),
(550, 22, 29, 8, 14, 'K101319', '', '2018-07-01', '0000-00-00', 3.60, 4, 2, '', 5, 1),
(551, 22, 29, 8, 14, 'K101320', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(552, 22, 29, 8, 14, 'K101321', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(553, 22, 29, 8, 14, 'K101322', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(554, 22, 29, 8, 14, 'K101323', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(555, 22, 29, 8, 14, 'K101324', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(556, 22, 29, 8, 14, 'K101325', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(557, 22, 29, 8, 14, 'K101326', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(558, 22, 29, 8, 14, 'K101327', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(559, 22, 29, 8, 14, 'K101328', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(560, 22, 29, 8, 14, 'K101329', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(561, 22, 29, 8, 14, 'K101330', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(562, 22, 29, 8, 14, 'K101331', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(563, 22, 29, 8, 14, 'K101332', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(564, 22, 29, 8, 14, 'K101333', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(565, 22, 29, 8, 14, 'K101334', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(566, 22, 29, 8, 14, 'K101335', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(567, 22, 29, 8, 14, 'K101336', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(568, 22, 29, 8, 14, 'K101337', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(569, 22, 29, 8, 14, 'K101338', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(570, 22, 29, 8, 14, 'K101339', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(571, 22, 29, 8, 14, 'K101340', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(572, 22, 29, 8, 14, 'K101341', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(573, 22, 29, 8, 14, 'K101343', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(574, 22, 29, 8, 14, 'K101342', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(575, 22, 29, 8, 14, 'K101344', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(576, 22, 29, 8, 14, 'K101345', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(577, 22, 29, 8, 14, 'K101346', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(578, 22, 29, 8, 14, 'K101347', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(579, 22, 29, 8, 14, 'K101348', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(580, 22, 29, 8, 14, 'K101349', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(581, 22, 29, 8, 14, 'K101350', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(582, 22, 29, 8, 14, 'K101351', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(583, 22, 29, 8, 14, 'K101352', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(584, 22, 29, 8, 14, 'K101353', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(585, 22, 29, 8, 14, 'K101354', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(586, 22, 29, 8, 14, 'K101355', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(587, 22, 29, 8, 14, 'K101356', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(588, 22, 29, 8, 14, 'K101357', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(589, 22, 29, 8, 14, 'K101358', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(590, 22, 29, 8, 14, 'K101359', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(591, 22, 29, 8, 14, 'K101360', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(592, 22, 29, 8, 14, 'K101361', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(593, 22, 29, 8, 14, 'K101362', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(594, 22, 29, 8, 14, 'K101363', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(595, 22, 29, 8, 14, 'K101364', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(596, 22, 29, 8, 14, 'K101365', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(597, 22, 29, 8, 14, 'K101366', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1);
INSERT INTO `mst_product` (`id`, `category_id`, `product_category_id`, `end_user_id`, `manufacture_id`, `serial_number`, `asset_number`, `service_date`, `expire_date`, `capacity`, `unit_system_id`, `inspection_schedule_id`, `quick_check_no`, `status`, `uid`) VALUES
(598, 22, 29, 8, 35, 'K101367', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(599, 22, 29, 8, 14, 'K101368', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(600, 22, 29, 8, 14, 'K101369', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(601, 22, 29, 8, 14, 'K101370', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(602, 22, 29, 8, 14, 'K101371', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(603, 22, 29, 8, 14, 'K101372', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(604, 22, 29, 8, 14, 'K101373', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(605, 22, 29, 8, 14, 'K101374', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(606, 22, 29, 8, 14, 'K101375', '', '2018-07-08', '0000-00-00', 1.80, 4, 2, '', 5, 1),
(607, 22, 5, 6, 19, 'ST-15546', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(608, 22, 5, 6, 19, 'ST-15547', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(609, 22, 8, 6, 14, 'ST-15548', '', '2018-07-08', '2019-01-10', 1.00, 3, 2, '', 0, 1),
(610, 22, 5, 6, 19, 'ST-15549', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(611, 22, 5, 6, 19, 'ST-15550', '', '2018-07-10', '2019-01-10', 1.80, 4, 2, '', 5, 1),
(612, 22, 5, 6, 19, 'ST-15551', '', '2018-07-10', '2019-01-10', 1.80, 4, 2, '', 5, 1),
(613, 22, 5, 6, 19, 'ST-15552', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(614, 22, 5, 6, 19, 'ST-15553', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(615, 22, 5, 6, 19, 'ST-15554', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(616, 22, 5, 6, 19, 'ST-15555', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(617, 22, 5, 6, 19, 'ST-15018', '', '2018-01-04', '0000-00-00', 1.80, 3, 2, '', 6, 1),
(618, 22, 5, 6, 19, 'ST-15556', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(619, 22, 5, 6, 19, 'ST-15557', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(620, 22, 5, 6, 19, 'ST-15558', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(621, 22, 5, 6, 19, 'ST-15559', '', '2018-07-10', '2019-01-08', 1.80, 3, 2, '', 5, 1),
(622, 22, 5, 6, 19, 'ST-15560', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(623, 22, 5, 6, 19, 'ST-15561', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(624, 22, 5, 6, 19, 'ST-15562', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(625, 22, 5, 6, 19, 'ST-15563', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(626, 22, 5, 6, 19, 'ST-15564', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(627, 22, 5, 6, 19, 'ST-15565', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(628, 22, 5, 6, 19, 'ST-15566', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(629, 22, 5, 6, 19, 'ST-15567', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(630, 22, 5, 6, 19, 'ST-15568', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(631, 22, 5, 6, 19, 'ST-15569', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(632, 22, 5, 6, 19, 'ST-15570', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(633, 22, 5, 6, 19, 'ST-15571', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(634, 22, 5, 6, 19, 'ST-15572', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(635, 22, 5, 6, 19, 'ST-15573', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(636, 22, 5, 6, 19, 'ST-15574', '', '0000-00-00', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(637, 22, 5, 6, 19, 'ST-15575', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(638, 22, 5, 6, 19, 'ST-15576', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(639, 22, 5, 6, 19, 'ST-15577', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(640, 22, 5, 6, 19, 'ST-15578', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(641, 22, 5, 6, 19, 'ST-15579', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(642, 22, 5, 6, 19, 'ST-15580', '', '0000-00-00', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(643, 22, 9, 6, 31, 'C358', '', '2018-07-10', '2019-01-10', 8.50, 13, 2, '', 5, 1),
(644, 22, 9, 6, 31, 'M1', '', '2018-07-10', '2019-01-10', 8.50, 13, 2, '', 5, 1),
(645, 22, 9, 6, 31, '77', '', '2018-07-10', '2019-01-10', 4.75, 13, 2, '', 5, 1),
(646, 22, 9, 6, 31, '17', '', '2018-07-10', '2019-01-10', 4.75, 13, 2, '', 5, 1),
(647, 22, 9, 6, 31, 'C1', '', '2018-07-10', '2019-01-08', 3.25, 13, 2, '', 5, 1),
(648, 22, 9, 6, 31, 'C354', '', '2018-07-10', '2019-01-08', 1.80, 13, 2, '', 5, 1),
(649, 22, 9, 6, 31, 'H6', '', '2018-07-10', '2019-01-08', 3.25, 13, 2, '', 5, 1),
(650, 22, 9, 6, 31, 'B2', '', '2018-07-10', '2019-01-08', 3.25, 13, 2, '', 5, 1),
(651, 22, 9, 6, 31, 'S15', '', '2018-07-10', '2019-01-08', 3.25, 13, 2, '', 5, 1),
(652, 22, 7, 6, 14, 'MES119', '', '2018-01-02', '2019-01-08', 7.00, 13, 2, '', 5, 1),
(653, 22, 7, 6, 19, '15263', '', '2018-01-02', '2019-01-08', 7.50, 3, 2, '', 5, 1),
(654, 22, 5, 6, 19, 'ST-15013', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(655, 22, 5, 6, 19, 'ST-15023', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(656, 22, 5, 6, 19, 'ST-15017', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(657, 22, 5, 6, 19, 'ST-15021', '', '2018-07-10', '2019-01-10', 1.80, 4, 2, '', 5, 1),
(658, 22, 5, 6, 19, 'ST-15020', '', '2018-07-10', '2019-01-10', 1.80, 3, 2, '', 5, 1),
(659, 22, 5, 6, 19, 'ST-15041', '', '2018-07-10', '2019-01-10', 5.10, 3, 2, '', 5, 1),
(660, 22, 5, 6, 19, 'ST-15036', '', '2018-07-10', '2019-01-10', 5.10, 3, 2, '', 5, 1),
(661, 22, 5, 6, 19, 'ST-15039', '', '2018-07-10', '2019-01-10', 5.10, 3, 2, '', 5, 1),
(662, 22, 5, 6, 19, 'ST-15038', '', '2018-07-10', '2019-01-10', 5.10, 3, 2, '', 5, 1),
(663, 22, 8, 6, 19, '025680730', '', '2018-07-10', '2019-01-10', 4.00, 13, 2, '', 5, 1),
(664, 22, 8, 6, 19, '025681068', '', '2018-07-10', '2019-01-10', 4.00, 13, 2, '', 5, 1),
(665, 22, 8, 6, 19, '024978391', '', '2018-07-10', '2019-01-10', 4.00, 13, 2, '', 5, 1),
(666, 22, 8, 6, 19, '025781871', '', '2018-07-10', '2019-01-10', 4.00, 13, 2, '', 5, 1),
(667, 22, 8, 6, 19, '026182880', '', '2018-07-10', '2019-01-10', 4.00, 13, 2, '', 5, 1),
(668, 22, 8, 6, 19, '026283205', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(669, 22, 8, 6, 19, '026383711', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(670, 22, 8, 6, 19, '025781867', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(671, 22, 8, 6, 19, '026383721', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(672, 22, 8, 6, 19, '026283201', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(673, 22, 8, 6, 19, '025982267', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(674, 22, 8, 6, 19, '026283209', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(675, 22, 8, 6, 19, '025680727', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(676, 22, 8, 6, 43, '37014', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(677, 22, 8, 6, 43, '37005', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(678, 22, 8, 6, 43, '37021', '', '2018-07-08', '2019-01-08', 4.00, 13, 2, '', 5, 1),
(679, 22, 6, 11, 43, 'K102226', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(680, 20, 10, 28, 21, 'K102214', '', '2018-07-22', '0000-00-00', 2.00, 13, 2, '', 5, 1),
(681, 22, 6, 11, 43, 'K102227', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(682, 22, 6, 11, 43, 'K102228', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(683, 22, 6, 11, 43, 'K102229', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(684, 22, 6, 11, 43, 'K102230', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(685, 22, 6, 11, 43, 'K102231', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(686, 22, 6, 11, 43, 'K102232', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(687, 22, 6, 11, 43, 'K102233', '', '2018-07-22', '2019-01-22', 6000.00, 5, 2, '', 5, 1),
(688, 22, 6, 11, 43, 'K102242', '', '2018-07-22', '2019-01-22', 8000.00, 5, 2, '', 5, 1),
(689, 22, 6, 11, 43, 'K102243', '', '2018-07-22', '2019-01-22', 8000.00, 5, 2, '', 5, 1),
(690, 22, 6, 11, 43, 'K102244', '', '2018-07-22', '2019-01-22', 8000.00, 5, 2, '', 5, 1),
(691, 22, 6, 11, 43, 'K102245', '', '2018-07-22', '2019-01-22', 8000.00, 5, 2, '', 5, 1),
(692, 22, 6, 11, 43, 'K102138', '', '2018-07-22', '2019-01-22', 4000.00, 5, 2, '', 5, 1),
(693, 22, 6, 11, 43, 'K102139', '', '2018-07-22', '2019-01-22', 4000.00, 5, 2, '', 5, 1),
(694, 22, 6, 11, 43, 'K102184', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(695, 22, 6, 11, 43, 'K102185', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(696, 22, 6, 11, 43, 'K102186', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(697, 22, 6, 11, 43, 'K102187', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(698, 22, 6, 11, 43, 'K102188', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(699, 22, 6, 11, 43, 'K102189', '', '2018-07-22', '2019-01-22', 3000.00, 5, 2, '', 5, 1),
(700, 22, 7, 2, 19, 'K101632', '', '2018-08-01', '0000-00-00', 6.70, 13, 2, '', 5, 1),
(701, 22, 7, 2, 19, 'K101633', '', '2018-08-01', '0000-00-00', 6.70, 13, 2, '', 5, 1),
(702, 20, 10, 36, 21, '161297', '', '2018-07-30', '2019-01-30', 1.00, 13, 2, '', 5, 1),
(703, 20, 10, 36, 21, '33946', '', '2018-07-30', '2019-01-30', 3.00, 13, 2, '', 5, 1),
(704, 20, 10, 36, 21, '9177', '', '2018-08-30', '0000-00-00', 5.00, 13, 2, '', 7, 1),
(705, 20, 10, 36, 21, '17352', '', '2018-07-30', '2019-01-30', 3.00, 13, 2, '', 5, 1),
(706, 20, 10, 36, 21, '9558', '', '2018-07-30', '0000-00-00', 2.00, 13, 2, '', 6, 1),
(707, 20, 10, 36, 21, '52640', '', '2018-07-30', '0000-00-00', 5.00, 13, 2, '', 7, 1),
(708, 22, 29, 8, 14, 'K100903', '', '2018-06-10', '0000-00-00', 1.80, 13, 2, '', 5, 1),
(709, 22, 29, 8, 14, 'K100904', '', '2018-06-10', '0000-00-00', 1.80, 13, 2, '', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(9) NOT NULL,
  `product_category` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_category`, `uid`) VALUES
(5, 'Wire Rope Sling', 1),
(6, 'Round Sling', 1),
(7, 'Chain Sling', 1),
(8, 'Webbing Sling', 1),
(9, 'Shackles', 1),
(10, 'Chain Hoist', 1),
(11, 'Lever Hoist', 1),
(12, 'Eye Bolt', 1),
(13, 'Plate Clamp', 1),
(14, 'Safety Harness', 1),
(15, 'Fire Extinguisher', 1),
(16, 'Forklift', 1),
(17, 'Electrical Overhead Crane', 1),
(18, 'POWER BOILER', 1),
(19, 'HEATER BOILER', 1),
(20, 'Air Receiver', 1),
(21, 'Run Way Beam', 1),
(22, 'Slewing Jib Crane', 1),
(23, 'Cantilever Runways', 1),
(24, 'Mobile Gantry', 1),
(25, 'Gas Scrubber', 1),
(26, 'Khuff Gas', 1),
(27, 'Dearator', 1),
(28, 'Formal Inspec (Quarterly)', 1),
(29, 'Billet Slings (Wire)', 1),
(30, 'Mobile Crane', 1),
(31, 'Heavy Vehicle General', 1),
(32, 'Lifting Beam Ladle', 1),
(33, 'Lifting Beam General', 1),
(34, 'Man Lift or Chery Picker', 1),
(35, 'C-Hook or Crane Forks', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_checklist`
--

CREATE TABLE `product_category_checklist` (
  `id` int(9) NOT NULL,
  `checklist_id` int(9) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `uid` int(5) NOT NULL,
  `product_category_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category_checklist`
--

INSERT INTO `product_category_checklist` (`id`, `checklist_id`, `active`, `uid`, `product_category_id`) VALUES
(5, 9, NULL, 1, 7),
(7, 9, NULL, 1, 15),
(8, 8, NULL, 1, 15),
(9, 11, NULL, 1, 15),
(18, 9, NULL, 1, 8),
(19, 13, NULL, 1, 8),
(26, 9, NULL, 1, 9),
(27, 16, NULL, 1, 9),
(28, 7, NULL, 1, 9),
(29, 12, NULL, 1, 9),
(30, 17, NULL, 1, 9),
(31, 18, NULL, 1, 9),
(32, 19, NULL, 1, 9),
(33, 6, NULL, 1, 9),
(41, 20, NULL, 1, 17),
(42, 9, NULL, 1, 17),
(43, 21, NULL, 1, 17),
(44, 22, NULL, 1, 17),
(45, 46, NULL, 1, 17),
(46, 23, NULL, 1, 17),
(47, 24, NULL, 1, 17),
(48, 25, NULL, 1, 17),
(49, 26, NULL, 1, 17),
(50, 27, NULL, 1, 17),
(51, 28, NULL, 1, 17),
(52, 29, NULL, 1, 17),
(53, 30, NULL, 1, 17),
(55, 32, NULL, 1, 17),
(56, 33, NULL, 1, 17),
(57, 34, NULL, 1, 17),
(58, 35, NULL, 1, 17),
(59, 36, NULL, 1, 17),
(60, 37, NULL, 1, 17),
(61, 6, NULL, 1, 17),
(62, 38, NULL, 1, 17),
(63, 39, NULL, 1, 17),
(64, 40, NULL, 1, 17),
(65, 41, NULL, 1, 17),
(66, 42, NULL, 1, 17),
(67, 43, NULL, 1, 17),
(68, 44, NULL, 1, 17),
(69, 45, NULL, 1, 17),
(70, 9, NULL, 1, 6),
(71, 15, NULL, 1, 8),
(72, 14, NULL, 1, 8),
(73, 48, NULL, 1, 8),
(74, 49, NULL, 1, 16),
(75, 20, NULL, 1, 10),
(76, 4, NULL, 1, 10),
(77, 50, NULL, 1, 10),
(78, 9, NULL, 1, 10),
(79, 51, NULL, 1, 10),
(80, 5, NULL, 1, 10),
(81, 52, NULL, 1, 10),
(82, 53, NULL, 1, 10),
(83, 24, NULL, 1, 10),
(84, 45, NULL, 1, 10),
(85, 20, NULL, 1, 23),
(86, 20, NULL, 1, 21),
(87, 49, NULL, 1, 21),
(88, 23, NULL, 1, 21),
(89, 55, NULL, 1, 21),
(90, 56, NULL, 1, 21),
(91, 57, NULL, 1, 21),
(92, 58, NULL, 1, 21),
(93, 59, NULL, 1, 21),
(94, 60, NULL, 1, 21),
(95, 36, NULL, 1, 21),
(96, 4, NULL, 1, 21),
(97, 24, NULL, 1, 21),
(98, 29, NULL, 1, 21),
(99, 53, NULL, 1, 21),
(100, 38, NULL, 1, 21),
(101, 39, NULL, 1, 21),
(102, 44, NULL, 1, 21),
(103, 88, NULL, 1, 20),
(104, 20, NULL, 1, 20),
(105, 9, NULL, 1, 20),
(106, 12, NULL, 1, 20),
(107, 8, NULL, 1, 20),
(108, 62, NULL, 1, 20),
(109, 63, NULL, 1, 20),
(110, 60, NULL, 1, 20),
(111, 64, NULL, 1, 20),
(112, 43, NULL, 1, 20),
(113, 20, NULL, 1, 25),
(114, 9, NULL, 1, 25),
(115, 60, NULL, 1, 25),
(116, 43, NULL, 1, 25),
(117, 12, NULL, 1, 25),
(118, 64, NULL, 1, 25),
(119, 56, NULL, 1, 25),
(120, 63, NULL, 1, 25),
(121, 8, NULL, 1, 25),
(122, 62, NULL, 1, 25),
(123, 65, NULL, 1, 25),
(124, 20, NULL, 1, 27),
(125, 9, NULL, 1, 27),
(126, 43, NULL, 1, 27),
(127, 60, NULL, 1, 27),
(128, 12, NULL, 1, 27),
(129, 64, NULL, 1, 27),
(130, 56, NULL, 1, 27),
(131, 63, NULL, 1, 27),
(132, 66, NULL, 1, 27),
(133, 8, NULL, 1, 27),
(134, 62, NULL, 1, 27),
(135, 67, NULL, 1, 27),
(136, 56, NULL, 1, 20),
(137, 67, NULL, 1, 25),
(138, 20, NULL, 1, 18),
(139, 9, NULL, 1, 18),
(140, 60, NULL, 1, 18),
(141, 43, NULL, 1, 18),
(142, 64, NULL, 1, 18),
(143, 12, NULL, 1, 18),
(144, 56, NULL, 1, 18),
(145, 71, NULL, 1, 18),
(146, 63, NULL, 1, 18),
(147, 67, NULL, 1, 18),
(148, 68, NULL, 1, 18),
(149, 74, NULL, 1, 18),
(150, 73, NULL, 1, 18),
(151, 70, NULL, 1, 18),
(152, 72, NULL, 1, 18),
(153, 76, NULL, 1, 18),
(154, 8, NULL, 1, 18),
(155, 62, NULL, 1, 18),
(156, 66, NULL, 1, 18),
(157, 75, NULL, 1, 18),
(158, 69, NULL, 1, 18),
(159, 9, NULL, 1, 5),
(160, 12, NULL, 1, 5),
(161, 78, NULL, 1, 5),
(162, 79, NULL, 1, 5),
(163, 16, NULL, 1, 5),
(164, 7, NULL, 1, 5),
(165, 80, NULL, 1, 5),
(166, 81, NULL, 1, 5),
(167, 82, NULL, 1, 5),
(168, 83, NULL, 1, 5),
(169, 84, NULL, 1, 5),
(170, 9, NULL, 1, 29),
(171, 79, NULL, 1, 29),
(172, 81, NULL, 1, 29),
(173, 80, NULL, 1, 29),
(174, 82, NULL, 1, 29),
(175, 16, NULL, 1, 29),
(176, 1, NULL, 1, 7),
(177, 12, NULL, 1, 7),
(178, 78, NULL, 1, 7),
(179, 64, NULL, 1, 7),
(180, 7, NULL, 1, 7),
(181, 16, NULL, 1, 7),
(182, 83, NULL, 1, 7),
(183, 87, NULL, 1, 7),
(184, 88, NULL, 1, 17),
(185, 67, NULL, 1, 20),
(186, 88, NULL, 1, 25),
(187, 88, NULL, 1, 26),
(188, 20, NULL, 1, 26),
(189, 9, NULL, 1, 26),
(190, 60, NULL, 1, 26),
(191, 43, NULL, 1, 26),
(192, 12, NULL, 1, 26),
(193, 64, NULL, 1, 26),
(194, 56, NULL, 1, 26),
(195, 63, NULL, 1, 26),
(196, 8, NULL, 1, 26),
(197, 62, NULL, 1, 26),
(198, 67, NULL, 1, 26),
(199, 88, NULL, 1, 18),
(200, 90, NULL, 1, 8),
(201, 78, NULL, 1, 8),
(202, 20, NULL, 1, 11),
(203, 9, NULL, 1, 11),
(204, 4, NULL, 1, 11),
(205, 50, NULL, 1, 11),
(206, 51, NULL, 1, 11),
(207, 5, NULL, 1, 11),
(208, 91, NULL, 1, 11),
(209, 53, NULL, 1, 11),
(210, 24, NULL, 1, 11),
(211, 45, NULL, 1, 11),
(212, 20, NULL, 1, 32),
(213, 9, NULL, 1, 32),
(214, 92, NULL, 1, 32),
(215, 93, NULL, 1, 32),
(216, 94, NULL, 1, 32),
(217, 95, NULL, 1, 32),
(218, 96, NULL, 1, 32),
(219, 97, NULL, 1, 32),
(220, 4, NULL, 1, 32),
(221, 20, NULL, 1, 33),
(222, 9, NULL, 1, 33),
(223, 96, NULL, 1, 33),
(224, 93, NULL, 1, 33),
(225, 94, NULL, 1, 33),
(226, 6, NULL, 1, 33),
(227, 45, NULL, 1, 33),
(228, 45, NULL, 1, 32),
(229, 98, NULL, 1, 31),
(230, 54, NULL, 1, 31),
(231, 99, NULL, 1, 31),
(232, 100, NULL, 1, 31),
(233, 101, NULL, 1, 31),
(234, 9, NULL, 1, 31),
(235, 102, NULL, 1, 31),
(236, 103, NULL, 1, 31),
(237, 104, NULL, 1, 31),
(238, 105, NULL, 1, 31),
(239, 106, NULL, 1, 31),
(240, 9, NULL, 1, 35),
(241, 96, NULL, 1, 35),
(242, 78, NULL, 1, 35),
(243, 56, NULL, 1, 35),
(244, 7, NULL, 1, 35),
(245, 113, NULL, 1, 35),
(246, 114, NULL, 1, 35),
(247, 94, NULL, 1, 35),
(248, 12, NULL, 1, 35),
(249, 6, NULL, 1, 35),
(250, 9, NULL, 1, 12),
(251, 12, NULL, 1, 12),
(252, 78, NULL, 1, 12),
(253, 64, NULL, 1, 12),
(254, 7, NULL, 1, 12),
(255, 17, NULL, 1, 12),
(256, 114, NULL, 1, 12),
(257, 115, NULL, 1, 12),
(258, 13, NULL, 1, 6),
(259, 15, NULL, 1, 6),
(260, 14, NULL, 1, 6),
(261, 48, NULL, 1, 6),
(262, 90, NULL, 1, 6),
(263, 78, NULL, 1, 6),
(264, 116, NULL, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `request_detail_inspection`
--

CREATE TABLE `request_detail_inspection` (
  `id` int(9) NOT NULL,
  `product_category_id` int(9) DEFAULT NULL,
  `mst_product_id` int(11) DEFAULT NULL,
  `parent_id` int(9) DEFAULT NULL,
  `checklist_name` longtext,
  `status` char(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `location_id` int(9) DEFAULT NULL,
  `uid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_detail_inspection`
--

INSERT INTO `request_detail_inspection` (`id`, `product_category_id`, `mst_product_id`, `parent_id`, `checklist_name`, `status`, `comment`, `location_id`, `uid`) VALUES
(182, 17, 13, 6, 'Appearance & Cleanliness satisfactory||N|Tag / illegible Marking found satisfactory||Y|Controllers / Pendants condition & fuction sa||N|Motor Trains|Y|Long Travel Rails / Rollers||N|Anchor / End - Stopper / Buffer||N|Brakes System found satisfactory||N|Parking System||N|Beam Girder / End Carriage||N|ELectrical Power Supply|N|Hydraulic System||N|Crab Trolley||N|Wire Ropes|N|Hooks||N|Chains||N|Pulley and Sheaves||N|Drums||N|Direction Limit Switch||N|Upper and Lower Limit||N|Anti Collision Device||N|Function Satisfactory||N|Safety System||N|Warning Device||N|Fire Extinguisher||N|Lighting System||N|Maintenance Periodically||N|Supporting Structures||N|Over Load Limit||N|Load Test Satisfactory||Y', 'No Defect', 'tes aja', 3, 1),
(183, 17, 20, 8, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Crab Trolley|N|Wire Ropes|N|Hooks|N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N', 'Valid', 'DONE', 3, 1),
(184, 17, 20, 7, 'Appearance & Cleanliness satisfactory|Y|Tag / illegible Marking found satisfactory|Y|Controllers / Pendants condition & fuction sa|Y|Motor Trains|Y|Long Travel Rails / Rollers|Y|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|Y|Crab Trolley|Y|Wire Ropes|Y|Hooks|Y|Chains|Y|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|Y|Anti Collision Device|Y|Function Satisfactory|Y|Safety System|Y|Warning Device|Y|Fire Extinguisher|Y|Lighting System|Y|Maintenance Periodically|Y|Supporting Structures|Y|Over Load Limit|Y|Load Test Satisfactory|Y', 'Valid', 'GOOD', 3, 1),
(185, NULL, 20, 10, 'Appearance & Cleanliness satisfactory|N|Tag / illegible Marking found satisfactory|N|Controllers / Pendants condition & fuction sa|N|Motor Trains|N|Long Travel Rails / Rollers|N|Anchor / End - Stopper / Buffer|N|Brakes System found satisfactory|N|Parking System|N|Beam Girder / End Carriage|N|ELectrical Power Supply|N|Hydraulic System|N|Crab Trolley|N|Wire Ropes|N|Hooks|N|Chains|N|Pulley and Sheaves|N|Drums|N|Direction Limit Switch|N|Upper and Lower Limit|N|Anti Collision Device|N|Function Satisfactory|N|Safety System|N|Warning Device|N|Fire Extinguisher|N|Lighting System|N|Maintenance Periodically|N|Supporting Structures|N|Over Load Limit|N|Load Test Satisfactory|N', '', '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `request_inspection`
--

CREATE TABLE `request_inspection` (
  `id` int(9) NOT NULL,
  `end_user_id` int(9) DEFAULT NULL,
  `equipment_id` int(9) DEFAULT NULL,
  `inspector_id` int(9) DEFAULT NULL,
  `product_category_id` int(9) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `inspection_date` date DEFAULT NULL,
  `rep_no` varchar(25) DEFAULT NULL,
  `status_id` int(1) DEFAULT NULL,
  `remark` longtext,
  `invoice_no` varchar(50) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_inspection`
--

INSERT INTO `request_inspection` (`id`, `end_user_id`, `equipment_id`, `inspector_id`, `product_category_id`, `schedule_date`, `inspection_date`, `rep_no`, `status_id`, `remark`, `invoice_no`, `created_date`, `uid`) VALUES
(5, 37, NULL, 15, 17, '2019-08-28', '0000-00-00', '', 0, 'please come at 9.00 am', '', '2018-01-28 15:24:50', 1),
(7, 2, 11, 10, 17, '2018-03-02', '0000-00-00', '', 0, 'please come at 9.00 am', '', '2018-03-01 05:41:21', 1),
(8, 7, 0, 10, 17, '2018-03-18', '0000-00-00', '', 0, 'please come at 10.30 am', '', '2018-03-15 04:46:34', 1),
(11, 6, NULL, 7, 15, '2018-04-16', '2018-04-18', '123', 10, 'tes aja', 'INV-123', '2018-04-16 01:41:04', 1),
(12, 7, NULL, 15, 20, '2019-08-29', '0000-00-00', '', 0, '', '', '2019-08-28 10:14:40', 12);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `schedule` varchar(45) NOT NULL,
  `interval_value` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `schedule`, `interval_value`, `uid`) VALUES
(1, 'Annualy', 'INTERVAL 12 MONTH', 1),
(2, 'Semi-Annualy', 'INTERVAL 6 MONTH', 1),
(3, 'Quarterly', 'INTERVAL 4 MONTH', 1),
(4, 'Monthly', 'INTERVAL 1 MONTH', 1),
(5, 'Weekly', 'INTERVAL 7 DAY', 1),
(6, 'Daily', 'INTERVAL 1 DAY', 1),
(7, 'Two Years / Biennial', '', 1),
(8, 'Written Scheme / OnCall Basis', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(9) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL,
  `uid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status_name`, `uid`) VALUES
(3, 'Out of Service', 1),
(4, 'Not Found', 1),
(5, 'No Defect', 1),
(6, 'Discard', 1),
(7, 'Repair', 1),
(8, 'Valid', 1),
(9, 'Expired', 1),
(10, 'Unsafe', 1),
(11, 'Due', 1),
(12, 'Overdue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_groups`
--

CREATE TABLE `tb_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_groups`
--

INSERT INTO `tb_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'Inspector', 'The one Inspect the Equipment'),
(4, 'Vendor', 'The one create product detail and distribute to end user'),
(5, 'Purchaser or Store', 'The One purchase the equipment and received'),
(6, 'Guest', 'Views only');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_attempts`
--

CREATE TABLE `tb_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `icon` varchar(40) NOT NULL,
  `link` varchar(30) NOT NULL,
  `parent` int(11) NOT NULL,
  `role` enum('Administrator','Admin') DEFAULT 'Admin',
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`id_menu`, `nama_menu`, `icon`, `link`, `parent`, `role`, `aktif`) VALUES
(1, 'Dashboard', 'fa fa-dashboard', 'dashboard', 0, 'Admin', 'Y'),
(2, 'Master', 'fa fa-suitcase', '#', 0, 'Admin', 'Y'),
(22, 'Setting', 'fa fa-gears', '#', 0, 'Administrator', 'Y'),
(23, 'Menu seting', 'fa  fa-bars text-aqua', 'menu', 22, 'Administrator', 'Y'),
(24, 'User Seting', 'fa fa-users text-aqua', 'auth/member', 22, 'Administrator', 'Y'),
(26, 'Group Member', 'fa  fa-bars text-aqua', 'groups', 22, 'Admin', 'Y'),
(27, 'Hutang', 'fa fa-sticky-note-o text-aqua', 'transaksi/hutang', 12, 'Admin', 'Y'),
(28, 'Days', 'fa fa-minus-square text-aqua', 'days', 2, 'Admin', 'Y'),
(29, 'Category', 'fa fa-minus-square text-aqua', 'category', 2, 'Admin', 'Y'),
(30, 'Unit System', 'fa fa-minus-square text-aqua', 'unit', 2, 'Admin', 'Y'),
(31, 'Equipment', 'fa fa-suitcase', '#', 0, 'Admin', 'Y'),
(32, 'Category', 'fa fa-minus-square text-aqua', 'product_category', 31, 'Admin', 'Y'),
(33, 'Manufacture', 'fa fa-minus-square text-aqua', 'manufacture', 31, 'Admin', 'Y'),
(34, 'Location', 'fa fa-minus-square text-aqua', 'location', 2, 'Admin', 'Y'),
(37, 'Inspector', 'fa fa-users text-aqua', 'inspector', 2, 'Admin', 'Y'),
(39, 'Schedule', 'fa fa-minus-square text-aqua', 'schedule', 2, 'Admin', 'Y'),
(40, 'Master Equipment', 'fa fa-minus-square text-aqua', 'master_product', 31, 'Admin', 'Y'),
(41, 'End User', 'fa fa-users text-aqua', 'end_user', 2, 'Admin', 'Y'),
(42, 'Inspection', 'fa fa-suitcase', '#', 0, 'Admin', 'Y'),
(44, 'Checklist', 'fa fa-sticky-note-o text-aqua', 'checklist', 2, 'Admin', 'Y'),
(45, 'LABEL PRODUCT DETAIL', 'fa fa-sticky-note-o text-aqua', 'label', 2, 'Admin', 'Y'),
(46, 'Request Inspection', 'fa fa-users text-aqua', 'request_inspection', 42, 'Admin', 'Y'),
(47, 'Status Inspection', 'fa fa-sticky-note-o text-aqua', 'status', 2, 'Admin', 'Y'),
(48, 'REPORTING', 'fa fa-suitcase', '#', 0, 'Admin', 'Y'),
(49, 'Certificate of T.E.', 'fa fa-sticky-note-o text-aqua', 'certificate_te', 48, 'Admin', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `major_id` int(9) DEFAULT NULL,
  `grup` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `major_id`, `grup`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$Ex61c0WsiZ10q0IjiIGuruwzWAtfGRdTKUd7PoQTf4lfzBXSlJcwy', '', 'admin@admin.com', '86ed629d0fc67b65fa78a1f7b776dd9c56032abb', NULL, NULL, '6ZTk.PM9hwrA/DYXcnrmDO', '0000-00-00 00:00:00', '2019-08-28 06:17:20', 1, 'Hery', 'Purwoko', 'GOVCEK', '32234823', 5, NULL),
(7, '::1', 'member2', '$2y$08$PR5Bshqw/ICo9/3X/9Sdn.DbdNP9D0efVQhpSxLfEEblKvbUV/DqG', NULL, 'mara@gmail.com', NULL, NULL, NULL, NULL, '2016-05-13 11:41:01', '2016-05-20 11:30:08', 1, 'mara', 'andre', 'maracell', '0898989', NULL, NULL),
(8, '::1', 'coba saja', '$2y$08$yGWcfqYPprwpSdHWj7VvgeDfAufGLu//DPUYZF5rZM1m2oFi2QqcO', NULL, 'coba@gmail.com', NULL, NULL, NULL, NULL, '2016-07-26 13:49:12', '2019-08-14 15:17:17', 1, 'coba', 'saja', 'coba saja', '111111', 5, NULL),
(10, '88.201.38.99', 'Hery Purwoko', '$2y$08$zGBEAfC16c64LdAozNqn2uuFhjrkyeDUVeGLnXXjBtjbS8IUtfJfm', NULL, 'hery.purwoko@alba.com.bh', NULL, NULL, NULL, 'wxXNEM9PotSgNOLUJg7BSO', '2018-01-21 04:53:26', '2019-08-28 13:48:58', 1, 'Hery', 'Purwoko', 'GOVCEK', '66387871', 5, NULL),
(11, '178.137.17.67', 'HenryFaini', '$2y$08$/wvxLiT/ycK45qQ09M0CO.o2tPIIxN4xY8dYhOGgCgRXdtHxhbMTC', NULL, 'rodriqueduncan@yahoo.com', 'f42287d5b3f315fd939ea966bd4f15bbc3657ebf', NULL, NULL, NULL, '2018-01-31 12:11:20', NULL, 0, 'HenryFainiVB', 'HenryFainiVB', 'google', NULL, NULL, NULL),
(12, '88.201.38.99', 'Isa Al Mehri', '$2y$08$zr4/txh0oqxMRkdFSrCyLudfJ5sIYu9kiwCNWI0/naOg/X6LirdTi', NULL, 'isa.almehri@alba.com.bh', NULL, NULL, NULL, NULL, '2018-05-14 05:04:44', '2019-08-28 10:12:21', 1, 'Isa', 'Al Mehri', 'GOVCEK', '+97339473603', 5, NULL),
(13, '88.201.38.99', 'Saleh Mahdi', '$2y$08$OsaX8Qe0R2BtEIGCmC.YWeUGx5ygvfE1D6YmEA2icGsn08ztjYrWy', NULL, 'saleh.mahdi@alba.com.bh', NULL, NULL, NULL, NULL, '2018-06-11 04:51:51', '2018-06-11 04:56:22', 1, 'Saleh', 'Mahdi', 'POWER STATION', '+97339550616', 29, NULL),
(14, '88.201.0.53', 'Ajithfcms', '$2y$08$83Y80L8aqN42MaPto6LzhuiGxCnUtZ8olne7/ykF3zw7S9Tnw8nPa', NULL, 'ajithkoorath@gmail.com', '7309dc9ed485c13ca3965957981ac1b7cccc26a9', NULL, NULL, NULL, '2018-07-15 06:27:55', NULL, 0, 'Ajith', 'Koorath', 'Flora contracting', NULL, NULL, NULL),
(15, '193.188.99.209', 'hse@florabh.com', '$2y$08$rtEXZ.DpONOH14R/cRqNBeJ/7.tj93zTu5rXjwpwtBbQkfA.wAxpS', NULL, 'hse@florabh.com', NULL, NULL, NULL, NULL, '2018-07-31 12:30:34', '2018-08-01 05:51:50', 1, 'Ajith', 'kumar', 'Flora contracting', '0097366765235', 36, NULL),
(21, '66.96.232.19', 'ibnujkt@gmail.com', '$2y$08$TQ1qdVHWdW7EEC9W8QewWO8gGy81zXohqw9FgOdR857Tp6IGJzGya', NULL, 'ibnujkt@gmail.com', NULL, 'ACgN2g.Zew8BHFp1KUkNVu3acb4800d82405b093', 1537075704, NULL, '2018-09-16 12:18:00', NULL, 1, 'ibnu', 'Solahudin', 'dukuh zamrud', '12345678', 5, 6),
(23, '109.161.164.61', 'Adi Saputra', '$2y$08$GWTQY0de56xQhGxsew.z.OXQ1RdTfkPDvYKrUO5R6MMZKXKC5QNZ.', NULL, 'adisaputra.id@gmail.com', NULL, NULL, NULL, NULL, '2018-11-25 16:16:06', '2019-01-13 11:09:22', 1, 'Adi', 'Saputra', 'Alba', '0062123456', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_users_groups`
--

CREATE TABLE `tb_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users_groups`
--

INSERT INTO `tb_users_groups` (`id`, `user_id`, `group_id`) VALUES
(37, 1, 1),
(38, 1, 2),
(34, 7, 2),
(39, 8, 2),
(41, 10, 2),
(42, 11, 2),
(43, 12, 2),
(44, 13, 2),
(45, 14, 2),
(46, 15, 2),
(52, 21, 2),
(54, 23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(10) NOT NULL,
  `description` varchar(25) NOT NULL,
  `uid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `description`, `uid`) VALUES
(1, 'Lbs', 1),
(2, 'Barg', 1),
(3, 'tonne', 1),
(4, 'Tons', 1),
(5, 'Kilogram', 1),
(6, 'Metric', 1),
(7, 'Inches', 1),
(8, 'Feets', 1),
(9, 'Psi', 1),
(10, 'Newton', 1),
(11, 'Kilo Newton', 1),
(12, 'Imperial', 1),
(13, 'Ton', 1),
(14, 'Kgs', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustable`
--
ALTER TABLE `adjustable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_type`
--
ALTER TABLE `basic_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `begin_inspection`
--
ALTER TABLE `begin_inspection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `construction`
--
ALTER TABLE `construction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_product`
--
ALTER TABLE `detail_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `end_user`
--
ALTER TABLE `end_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_inspection`
--
ALTER TABLE `header_inspection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hp_schedule`
--
ALTER TABLE `hp_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hp_status`
--
ALTER TABLE `hp_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hp_unit`
--
ALTER TABLE `hp_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspection_schedule`
--
ALTER TABLE `inspection_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspector`
--
ALTER TABLE `inspector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `label`
--
ALTER TABLE `label`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `label_value`
--
ALTER TABLE `label_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legs`
--
ALTER TABLE `legs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_product`
--
ALTER TABLE `mst_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category_checklist`
--
ALTER TABLE `product_category_checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_detail_inspection`
--
ALTER TABLE `request_detail_inspection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_inspection`
--
ALTER TABLE `request_inspection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_groups`
--
ALTER TABLE `tb_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_login_attempts`
--
ALTER TABLE `tb_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tb_users_groups`
--
ALTER TABLE `tb_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustable`
--
ALTER TABLE `adjustable`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `basic_type`
--
ALTER TABLE `basic_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `begin_inspection`
--
ALTER TABLE `begin_inspection`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `construction`
--
ALTER TABLE `construction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_product`
--
ALTER TABLE `detail_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `end_user`
--
ALTER TABLE `end_user`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `header_inspection`
--
ALTER TABLE `header_inspection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hp_schedule`
--
ALTER TABLE `hp_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hp_status`
--
ALTER TABLE `hp_status`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hp_unit`
--
ALTER TABLE `hp_unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inspection_schedule`
--
ALTER TABLE `inspection_schedule`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inspector`
--
ALTER TABLE `inspector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `label`
--
ALTER TABLE `label`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `label_value`
--
ALTER TABLE `label_value`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133319;

--
-- AUTO_INCREMENT for table `legs`
--
ALTER TABLE `legs`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `mst_product`
--
ALTER TABLE `mst_product`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=710;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_category_checklist`
--
ALTER TABLE `product_category_checklist`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `request_detail_inspection`
--
ALTER TABLE `request_detail_inspection`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `request_inspection`
--
ALTER TABLE `request_inspection`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_groups`
--
ALTER TABLE `tb_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_login_attempts`
--
ALTER TABLE `tb_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_users_groups`
--
ALTER TABLE `tb_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_users_groups`
--
ALTER TABLE `tb_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `tb_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
