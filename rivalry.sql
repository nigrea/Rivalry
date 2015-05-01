-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 07:05 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `challange`
--

INSERT INTO `challange` (`id`, `user_one_id`, `user_two_id`, `accepted`) VALUES
(1, 9, 1, 1),
(2, 9, 1, 1),
(3, 9, 1, 1),
(4, 1, 9, 1),
(6, 9, 1, 1),
(7, 1, 9, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rivalry`
--

INSERT INTO `rivalry` (`id`, `user_one_id`, `user_two_id`, `start_date`, `end_date`) VALUES
(3, 1, 9, '2015-05-01 17:04:23', '2015-05-15 17:04:23');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `summoner`
--

INSERT INTO `summoner` (`id`, `name`, `api_id`, `user_id`, `main`) VALUES
(1, 'McBoobyBoobys', 0, 3, 1),
(2, 'nigrea', 0, 1, 1),
(4, 'kizzo', 24570013, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='for testing and prototyping' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'fizzer@gmail.com', '123'),
(3, 'elly@boobs.com', 'boobs'),
(9, 'kizzo@gmail.com', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
