-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2015 at 12:24 AM
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
  `win` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `champion_id` int(11) NOT NULL,
  `game_mode` varchar(20) NOT NULL,
  `game_type` varchar(20) NOT NULL,
  `ip_earned` int(11) NOT NULL,
  `sub_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `date`, `win`, `user_id`, `champion_id`, `game_mode`, `game_type`, `ip_earned`, `sub_type`) VALUES
(1794589426, '2015-04-14 21:31:43', 1, 1, 25, 'CLASSIC', 'MATCHED_GAME', 251, 'CAP_5x5'),
(1805798609, '2015-04-26 23:03:47', 0, 1, 12, 'CLASSIC', 'MATCHED_GAME', 64, 'CAP_5x5'),
(1805934990, '2015-04-26 22:20:34', 1, 1, 111, 'CLASSIC', 'MATCHED_GAME', 256, 'CAP_5x5'),
(1806773356, '2015-04-27 20:50:59', 1, 1, 143, 'CLASSIC', 'MATCHED_GAME', 193, 'BOT'),
(1807651072, '2015-04-28 21:38:56', 1, 1, 25, 'CLASSIC', 'MATCHED_GAME', 251, 'CAP_5x5'),
(1808765569, '2015-04-29 23:36:10', 1, 1, 13, 'CLASSIC', 'MATCHED_GAME', 265, 'CAP_5x5'),
(1811275750, '2015-05-02 18:33:36', 0, 1, 25, 'CLASSIC', 'MATCHED_GAME', 71, 'CAP_5x5'),
(1811372688, '2015-05-02 17:46:16', 1, 1, 13, 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1811634188, '2015-05-02 21:27:42', 1, 1, 238, 'CLASSIC', 'MATCHED_GAME', 41, 'BOT'),
(1811656326, '2015-05-02 22:08:49', 1, 1, 14, 'CLASSIC', 'MATCHED_GAME', 46, 'BOT');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `raw_match_stats`
--

INSERT INTO `raw_match_stats` (`id`, `match_id`, `assists`, `gold_earned`, `kills`, `total_damage_to_champions`, `minions_killed`, `deaths`, `ward_placed`, `ward_killed`, `summoner_id`) VALUES
(1, 1794589426, 20, 13803, 7, 30212, 175, 7, 7, 1, 418830),
(2, 1805934990, 16, 10701, 3, 11083, 46, 6, 22, 3, 418830),
(3, 1805798609, 7, 7058, 1, 6893, 41, 9, 18, 0, 418830),
(4, 1806773356, 17, 10617, 12, 28089, 80, 2, 0, 0, 418830),
(5, 1807651072, 9, 11687, 5, 20122, 215, 1, 8, 1, 418830),
(6, 1808765569, 19, 19318, 17, 51607, 267, 5, 10, 0, 418830),
(7, 1811372688, 3, 6919, 4, 8797, 113, 1, 2, 0, 418830),
(8, 1811275750, 14, 10012, 3, 19843, 44, 8, 27, 4, 418830),
(9, 1811634188, 8, 12692, 27, 37011, 122, 1, 0, 0, 418830),
(10, 1811656326, 6, 11923, 33, 42730, 134, 0, 3, 0, 418830);

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
