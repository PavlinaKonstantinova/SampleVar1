-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2016 at 12:07 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DBlotto`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE IF NOT EXISTS `codes` (
  `codeID` varchar(4) NOT NULL DEFAULT '',
  `statusID` int(11) NOT NULL DEFAULT '0',
  `prizeTypeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`codeID`, `statusID`, `prizeTypeID`) VALUES
('77LJ', 0, 1),
('7QG9', 0, 1),
('M82Y', 0, 2),
('5LF1', 0, 3),
('5IR6', 0, 4),
('42XG', 0, 5),
('B68F', 0, 6),
('6DU9', 0, 7),
('F95Z', 0, 0),
('23TK', 0, 0),
('13EP', 0, 0),
('G7R9', 0, 0),
('1VY6', 0, 0),
('2CY2', 0, 0),
('C65E', 0, 0),
('61FM', 0, 0),
('34MK', 0, 0),
('A6V8', 0, 0),
('RE37', 0, 0),
('Y29F', 0, 0),
('59SG', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `inboxID` int(11) NOT NULL DEFAULT '0',
  `mobileSP` int(11) NOT NULL DEFAULT '0',
  `MSISDN` varchar(12) NOT NULL DEFAULT '',
  `codeID` varchar(4) NOT NULL DEFAULT '',
  `prizeTypeID` int(11) NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logID`, `inboxID`, `mobileSP`, `MSISDN`, `codeID`, `prizeTypeID`, `dt`) VALUES
(14, 1, 87, '359899866747', 'G7R9', 0, '2016-03-02 12:45:39'),
(13, 0, 87, '359899866747', 'M82Y', 2, '2016-02-27 11:50:15'),
(12, 0, 87, '359899866747', '77LJ', 1, '2016-02-17 22:42:55'),
(11, 1, 87, '359899866747', '42XG', 5, '2013-05-28 10:52:45'),
(10, 1, 87, '359899866747', '42XG', 5, '2013-05-28 10:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `prizetypes`
--

CREATE TABLE IF NOT EXISTS `prizetypes` (
  `prizeTypeID` int(11) NOT NULL DEFAULT '0',
  `prizeName` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`prizeTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prizetypes`
--

INSERT INTO `prizetypes` (`prizeTypeID`, `prizeName`) VALUES
(0, 'try again'),
(1, 'drone'),
(2, 'tablet'),
(3, 'laptop'),
(4, 'TVset'),
(5, 'navigator'),
(6, 'monitor'),
(7, 'free hands');
