-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2015 at 12:31 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rivalry`
--

-- --------------------------------------------------------

--
-- Table structure for table `challange`
--

CREATE TABLE IF NOT EXISTS `challange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `challange`
--

INSERT INTO `challange` (`id`, `user_one_id`, `user_two_id`, `accepted`) VALUES
(1, 9, 1, 1),
(2, 9, 1, 1),
(3, 9, 1, 1),
(4, 1, 9, 1),
(6, 9, 1, 1),
(7, 1, 9, 1),
(8, 9, 1, 1),
(9, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `win` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `match_id`, `date`, `win`, `user_id`) VALUES
(27, 1800833158, '2015-04-21 05:59:48', 0, 9),
(28, 1802086894, '2015-04-23 02:31:36', 1, 9),
(29, 1802087373, '2015-04-23 02:59:06', 1, 9),
(30, 1802088247, '2015-04-23 03:39:54', 0, 9),
(31, 1803117255, '2015-04-23 23:47:39', 0, 9),
(32, 1803131211, '2015-04-24 01:04:06', 0, 9),
(33, 1805798609, '2015-04-26 23:03:47', 0, 9),
(34, 1806773356, '2015-04-27 20:50:59', 1, 9),
(35, 1807651072, '2015-04-28 21:38:56', 1, 9),
(36, 1808765569, '2015-04-29 23:36:10', 1, 9),
(37, 1793230169, '2015-04-12 18:10:39', 1, 1),
(38, 1792319326, '2015-04-12 19:28:12', 0, 1),
(39, 1792945575, '2015-04-12 19:56:46', 0, 1),
(40, 1794588912, '2015-04-14 20:44:34', 0, 1),
(41, 1794589426, '2015-04-14 21:31:43', 1, 1),
(42, 1805934990, '2015-04-26 22:20:34', 1, 1),
(43, 1805798609, '2015-04-26 23:03:47', 0, 1),
(44, 1806773356, '2015-04-27 20:50:59', 1, 1),
(45, 1807651072, '2015-04-28 21:38:56', 1, 1),
(46, 1808765569, '2015-04-29 23:36:10', 1, 1),
(47, 1803385328, '2015-04-24 05:21:31', 1, 10),
(48, 1803139145, '2015-04-24 06:36:47', 0, 10),
(49, 1803198861, '2015-04-24 15:49:59', 1, 10),
(50, 1803911279, '2015-04-25 01:59:03', 1, 10),
(51, 1803912481, '2015-04-25 02:37:33', 1, 10),
(52, 1805934990, '2015-04-26 22:20:34', 1, 10),
(53, 1805798609, '2015-04-26 23:03:47', 0, 10),
(54, 1806773356, '2015-04-27 20:50:59', 1, 10),
(55, 1808632303, '2015-04-29 22:26:15', 1, 10),
(56, 1808765569, '2015-04-29 23:36:10', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `rivalry`
--

CREATE TABLE IF NOT EXISTS `rivalry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `rivalry`
--

INSERT INTO `rivalry` (`id`, `user_one_id`, `user_two_id`, `start_date`, `end_date`) VALUES
(3, 1, 9, '2015-04-01 17:04:23', '2015-05-15 17:04:23'),
(5, 10, 1, '2015-04-02 10:29:05', '2015-05-16 10:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `summoner`
--

CREATE TABLE IF NOT EXISTS `summoner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `api_id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `summoner`
--

INSERT INTO `summoner` (`id`, `name`, `api_id`, `user_id`, `main`) VALUES
(1, 'McBoobyBoobys', 0, 3, 1),
(2, 'nigrea', 418830, 1, 1),
(4, 'kizzo', 24570013, 9, 1),
(5, 'alf', 24446190, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='for testing and prototyping' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'fizzer@gmail.com', '123'),
(3, 'elly@boobs.com', 'boobs'),
(9, 'kizzo@gmail.com', '123'),
(10, 'alf@gmail.com', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
