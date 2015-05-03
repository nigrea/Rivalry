-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2015 at 02:56 PM
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
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `game_mode` varchar(20) NOT NULL,
  `game_type` varchar(20) NOT NULL,
  `ip_earned` int(11) NOT NULL,
  `sub_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `date`, `game_mode`, `game_type`, `ip_earned`, `sub_type`) VALUES
(1794589426, '2015-04-14 21:31:43', 'CLASSIC', 'MATCHED_GAME', 251, 'CAP_5x5'),
(1800833158, '2015-04-21 05:59:48', 'CLASSIC', 'MATCHED_GAME', 57, 'RANKED_SOLO_5x5'),
(1802086894, '2015-04-23 02:31:36', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1802087373, '2015-04-23 02:59:06', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1802088247, '2015-04-23 03:39:54', 'CLASSIC', 'MATCHED_GAME', 55, 'CAP_5x5'),
(1803117255, '2015-04-23 23:47:39', 'CLASSIC', 'MATCHED_GAME', 57, 'RANKED_SOLO_5x5'),
(1803131211, '2015-04-24 01:04:06', 'CLASSIC', 'MATCHED_GAME', 75, 'CAP_5x5'),
(1805798609, '2015-04-26 23:03:47', 'CLASSIC', 'MATCHED_GAME', 64, 'CAP_5x5'),
(1805934990, '2015-04-26 22:20:34', 'CLASSIC', 'MATCHED_GAME', 256, 'CAP_5x5'),
(1806773356, '2015-04-27 20:50:59', 'CLASSIC', 'MATCHED_GAME', 193, 'BOT'),
(1807651072, '2015-04-28 21:38:56', 'CLASSIC', 'MATCHED_GAME', 251, 'CAP_5x5'),
(1808765569, '2015-04-29 23:36:10', 'CLASSIC', 'MATCHED_GAME', 265, 'CAP_5x5'),
(1811275750, '2015-05-02 18:33:36', 'CLASSIC', 'MATCHED_GAME', 71, 'CAP_5x5'),
(1811372688, '2015-05-02 17:46:16', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1811634188, '2015-05-02 21:27:42', 'CLASSIC', 'MATCHED_GAME', 41, 'BOT'),
(1811656326, '2015-05-02 22:08:49', 'CLASSIC', 'MATCHED_GAME', 46, 'BOT');

-- --------------------------------------------------------

--
-- Table structure for table `raw_match_stats`
--

CREATE TABLE IF NOT EXISTS `raw_match_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `gold_earned` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `total_damage_to_champions` int(11) NOT NULL,
  `minions_killed` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `ward_placed` int(11) NOT NULL,
  `ward_killed` int(11) NOT NULL,
  `summoner_id` int(11) NOT NULL,
  `champion_id` int(11) NOT NULL,
  `win` tinyint(1) NOT NULL,
  `time_played` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `raw_match_stats`
--

INSERT INTO `raw_match_stats` (`id`, `match_id`, `assists`, `gold_earned`, `kills`, `total_damage_to_champions`, `minions_killed`, `deaths`, `ward_placed`, `ward_killed`, `summoner_id`, `champion_id`, `win`, `time_played`) VALUES
(85, 1800833158, 3, 8256, 2, 10451, 155, 9, 8, 0, 24570013, 236, 0, 1774),
(86, 1802086894, 9, 7738, 4, 8499, 19, 4, 4, 0, 24570013, 120, 1, 1241),
(87, 1802087373, 10, 7921, 4, 8094, 28, 1, 3, 1, 24570013, 113, 1, 1254),
(88, 1802088247, 3, 9124, 4, 7945, 32, 8, 5, 1, 24570013, 254, 0, 1711),
(89, 1803117255, 7, 9421, 5, 16259, 39, 7, 5, 1, 24570013, 421, 0, 1776),
(90, 1803131211, 7, 12053, 4, 28566, 174, 14, 6, 0, 24570013, 29, 0, 2577),
(91, 1805798609, 6, 10487, 5, 14941, 72, 4, 5, 0, 24570013, 79, 0, 2041),
(92, 1806773356, 4, 9119, 9, 17188, 134, 4, 1, 0, 24570013, 121, 1, 1284),
(93, 1807651072, 6, 13776, 6, 16129, 91, 3, 6, 5, 24570013, 121, 1, 2171),
(94, 1808765569, 21, 19786, 15, 38044, 79, 6, 11, 3, 24570013, 121, 1, 2565),
(95, 1794589426, 20, 13803, 7, 30212, 175, 7, 7, 1, 418830, 25, 1, 2194),
(96, 1805934990, 16, 10701, 3, 11083, 46, 6, 22, 3, 418830, 111, 1, 2304),
(97, 1805798609, 7, 7058, 1, 6893, 41, 9, 18, 0, 418830, 12, 0, 2041),
(98, 1806773356, 17, 10617, 12, 28089, 80, 2, 0, 0, 418830, 143, 1, 1284),
(99, 1807651072, 9, 11687, 5, 20122, 215, 1, 8, 1, 418830, 25, 1, 2171),
(100, 1808765569, 19, 19318, 17, 51607, 267, 5, 10, 0, 418830, 13, 1, 2565),
(101, 1811372688, 3, 6919, 4, 8797, 113, 1, 2, 0, 418830, 13, 1, 1244),
(102, 1811275750, 14, 10012, 3, 19843, 44, 8, 27, 4, 418830, 25, 0, 2383),
(103, 1811634188, 8, 12692, 27, 37011, 122, 1, 0, 0, 418830, 238, 1, 1233),
(104, 1811656326, 6, 11923, 33, 42730, 134, 0, 3, 0, 418830, 14, 1, 1321);

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
(3, 1, 9, '2015-05-01 17:04:23', '2015-05-15 17:04:23'),
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
