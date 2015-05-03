-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2015 at 06:01 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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
(9, 10, 1, 1),
(10, 11, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `champion`
--

CREATE TABLE IF NOT EXISTS `champion` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `champion`
--

INSERT INTO `champion` (`id`, `name`, `title`) VALUES
(1, 'Annie', 'the Dark Child'),
(2, 'Olaf', 'the Berserker'),
(3, 'Galio', 'the Sentinel''s Sorrow'),
(4, 'Twisted Fate', 'the Card Master'),
(5, 'Xin Zhao', 'the Seneschal of Demacia'),
(6, 'Urgot', 'the Headsman''s Pride'),
(7, 'LeBlanc', 'the Deceiver'),
(8, 'Vladimir', 'the Crimson Reaper'),
(9, 'Fiddlesticks', 'the Harbinger of Doom'),
(10, 'Kayle', 'The Judicator'),
(11, 'Master Yi', 'the Wuju Bladesman'),
(12, 'Alistar', 'the Minotaur'),
(13, 'Ryze', 'the Rogue Mage'),
(14, 'Sion', 'The Undead Juggernaut'),
(15, 'Sivir', 'the Battle Mistress'),
(16, 'Soraka', 'the Starchild'),
(17, 'Teemo', 'the Swift Scout'),
(18, 'Tristana', 'the Yordle Gunner'),
(19, 'Warwick', 'the Blood Hunter'),
(20, 'Nunu', 'the Yeti Rider'),
(21, 'Miss Fortune', 'the Bounty Hunter'),
(22, 'Ashe', 'the Frost Archer'),
(23, 'Tryndamere', 'the Barbarian King'),
(24, 'Jax', 'Grandmaster at Arms'),
(25, 'Morgana', 'Fallen Angel'),
(26, 'Zilean', 'the Chronokeeper'),
(27, 'Singed', 'the Mad Chemist'),
(28, 'Evelynn', 'the Widowmaker'),
(29, 'Twitch', 'the Plague Rat'),
(30, 'Karthus', 'the Deathsinger'),
(31, 'Cho''Gath', 'the Terror of the Void'),
(32, 'Amumu', 'the Sad Mummy'),
(33, 'Rammus', 'the Armordillo'),
(34, 'Anivia', 'the Cryophoenix'),
(35, 'Shaco', 'the Demon Jester'),
(36, 'Dr. Mundo', 'the Madman of Zaun'),
(37, 'Sona', 'Maven of the Strings'),
(38, 'Kassadin', 'the Void Walker'),
(39, 'Irelia', 'the Will of the Blades'),
(40, 'Janna', 'the Storm''s Fury'),
(41, 'Gangplank', 'the Saltwater Scourge'),
(42, 'Corki', 'the Daring Bombardier'),
(43, 'Karma', 'the Enlightened One'),
(44, 'Taric', 'the Gem Knight'),
(45, 'Veigar', 'the Tiny Master of Evil'),
(48, 'Trundle', 'the Troll King'),
(50, 'Swain', 'the Master Tactician'),
(51, 'Caitlyn', 'the Sheriff of Piltover'),
(53, 'Blitzcrank', 'the Great Steam Golem'),
(54, 'Malphite', 'Shard of the Monolith'),
(55, 'Katarina', 'the Sinister Blade'),
(56, 'Nocturne', 'the Eternal Nightmare'),
(57, 'Maokai', 'the Twisted Treant'),
(58, 'Renekton', 'the Butcher of the Sands'),
(59, 'Jarvan IV', 'the Exemplar of Demacia'),
(60, 'Elise', 'The Spider Queen'),
(61, 'Orianna', 'the Lady of Clockwork'),
(62, 'Wukong', 'the Monkey King'),
(63, 'Brand', 'the Burning Vengeance'),
(64, 'Lee Sin', 'the Blind Monk'),
(67, 'Vayne', 'the Night Hunter'),
(68, 'Rumble', 'the Mechanized Menace'),
(69, 'Cassiopeia', 'the Serpent''s Embrace'),
(72, 'Skarner', 'the Crystal Vanguard'),
(74, 'Heimerdinger', 'the Revered Inventor'),
(75, 'Nasus', 'the Curator of the Sands'),
(76, 'Nidalee', 'the Bestial Huntress'),
(77, 'Udyr', 'the Spirit Walker'),
(78, 'Poppy', 'the Iron Ambassador'),
(79, 'Gragas', 'the Rabble Rouser'),
(80, 'Pantheon', 'the Artisan of War'),
(81, 'Ezreal', 'the Prodigal Explorer'),
(82, 'Mordekaiser', 'the Master of Metal'),
(83, 'Yorick', 'the Gravedigger'),
(84, 'Akali', 'the Fist of Shadow'),
(85, 'Kennen', 'the Heart of the Tempest'),
(86, 'Garen', 'The Might of Demacia'),
(89, 'Leona', 'the Radiant Dawn'),
(90, 'Malzahar', 'the Prophet of the Void'),
(91, 'Talon', 'the Blade''s Shadow'),
(92, 'Riven', 'the Exile'),
(96, 'Kog''Maw', 'the Mouth of the Abyss'),
(98, 'Shen', 'Eye of Twilight'),
(99, 'Lux', 'the Lady of Luminosity'),
(101, 'Xerath', 'the Magus Ascendant'),
(102, 'Shyvana', 'the Half-Dragon'),
(103, 'Ahri', 'the Nine-Tailed Fox'),
(104, 'Graves', 'the Outlaw'),
(105, 'Fizz', 'the Tidal Trickster'),
(106, 'Volibear', 'the Thunder''s Roar'),
(107, 'Rengar', 'the Pridestalker'),
(110, 'Varus', 'the Arrow of Retribution'),
(111, 'Nautilus', 'the Titan of the Depths'),
(112, 'Viktor', 'the Machine Herald'),
(113, 'Sejuani', 'the Winter''s Wrath'),
(114, 'Fiora', 'the Grand Duelist'),
(115, 'Ziggs', 'the Hexplosives Expert'),
(117, 'Lulu', 'the Fae Sorceress'),
(119, 'Draven', 'the Glorious Executioner'),
(120, 'Hecarim', 'the Shadow of War'),
(121, 'Kha''Zix', 'the Voidreaver'),
(122, 'Darius', 'the Hand of Noxus'),
(126, 'Jayce', 'the Defender of Tomorrow'),
(127, 'Lissandra', 'the Ice Witch'),
(131, 'Diana', 'Scorn of the Moon'),
(133, 'Quinn', 'Demacia''s Wings'),
(134, 'Syndra', 'the Dark Sovereign'),
(143, 'Zyra', 'Rise of the Thorns'),
(150, 'Gnar', 'the Missing Link'),
(154, 'Zac', 'the Secret Weapon'),
(157, 'Yasuo', 'the Unforgiven'),
(161, 'Vel''Koz', 'the Eye of the Void'),
(201, 'Braum', 'the Heart of the Freljord'),
(222, 'Jinx', 'the Loose Cannon'),
(236, 'Lucian', 'the Purifier'),
(238, 'Zed', 'the Master of Shadows'),
(254, 'Vi', 'the Piltover Enforcer'),
(266, 'Aatrox', 'the Darkin Blade'),
(267, 'Nami', 'the Tidecaller'),
(268, 'Azir', 'the Emperor of the Sands'),
(412, 'Thresh', 'the Chain Warden'),
(421, 'Rek''Sai', 'the Void Burrower'),
(429, 'Kalista', 'the Spear of Vengeance'),
(432, 'Bard', 'the Wandering Caretaker');

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
(1810199080, '2015-05-01 23:37:37', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1810629810, '2015-05-02 00:06:36', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1810634526, '2015-05-02 03:46:19', 'CLASSIC', 'MATCHED_GAME', 108, 'CAP_5x5'),
(1810635648, '2015-05-02 04:44:46', 'CLASSIC', 'MATCHED_GAME', 88, 'CAP_5x5'),
(1810670927, '2015-05-02 01:52:03', 'CLASSIC', 'MATCHED_GAME', 79, 'CAP_5x5'),
(1810795099, '2015-05-02 02:55:30', 'CLASSIC', 'MATCHED_GAME', 54, 'RANKED_SOLO_5x5'),
(1811275750, '2015-05-02 18:33:36', 'CLASSIC', 'MATCHED_GAME', 71, 'CAP_5x5'),
(1811372688, '2015-05-02 17:46:16', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1811634188, '2015-05-02 21:27:42', 'CLASSIC', 'MATCHED_GAME', 41, 'BOT'),
(1811656326, '2015-05-02 22:08:49', 'CLASSIC', 'MATCHED_GAME', 46, 'BOT'),
(1811671534, '2015-05-02 23:24:05', 'CLASSIC', 'MATCHED_GAME', 230, 'CAP_5x5'),
(1811674694, '2015-05-03 01:47:32', 'CLASSIC', 'MATCHED_GAME', 58, 'CAP_5x5'),
(1811677737, '2015-05-03 03:56:54', 'CLASSIC', 'MATCHED_GAME', 51, 'CAP_5x5'),
(1811773406, '2015-05-03 03:25:42', 'CLASSIC', 'MATCHED_GAME', 80, 'CAP_5x5'),
(1812487399, '2015-05-03 13:48:05', 'CLASSIC', 'MATCHED_GAME', 39, 'BOT');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=116 ;

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
(104, 1811656326, 6, 11923, 33, 42730, 134, 0, 3, 0, 418830, 14, 1, 1321),
(105, 1810199080, 10, 5659, 0, 3772, 24, 2, 18, 4, 36771395, 412, 1, 1483),
(106, 1810629810, 7, 5875, 4, 5892, 11, 3, 15, 3, 36771395, 412, 1, 1225),
(107, 1810670927, 23, 11525, 3, 15379, 29, 9, 50, 4, 36771395, 412, 0, 2750),
(108, 1810795099, 5, 5387, 0, 3730, 30, 5, 20, 3, 36771395, 12, 0, 1641),
(109, 1810634526, 26, 11547, 1, 13447, 23, 6, 34, 6, 36771395, 412, 1, 2347),
(110, 1810635648, 24, 12705, 0, 16042, 41, 15, 39, 3, 36771395, 412, 0, 3102),
(111, 1811671534, 12, 7560, 2, 7210, 23, 6, 23, 3, 36771395, 412, 1, 1641),
(112, 1811674694, 5, 6478, 1, 12302, 62, 10, 8, 1, 36771395, 76, 0, 1858),
(113, 1811773406, 3, 10208, 3, 10193, 187, 2, 8, 5, 36771395, 102, 1, 1678),
(114, 1811677737, 1, 9697, 5, 18974, 165, 2, 15, 1, 36771395, 102, 0, 1553),
(115, 1812487399, 11, 10013, 17, 25480, 144, 2, 3, 0, 418830, 64, 1, 1173);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rivalry`
--

INSERT INTO `rivalry` (`id`, `user_one_id`, `user_two_id`, `start_date`, `end_date`) VALUES
(3, 1, 9, '2015-05-01 17:04:23', '2015-05-15 17:04:23'),
(5, 10, 1, '2015-04-02 10:29:05', '2015-05-16 10:29:05'),
(6, 11, 1, '2015-05-03 13:24:56', '2015-05-17 13:24:56');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `summoner`
--

INSERT INTO `summoner` (`id`, `name`, `api_id`, `user_id`, `main`) VALUES
(1, 'McBoobyBoobys', 0, 3, 1),
(2, 'nigrea', 418830, 1, 1),
(4, 'kizzo', 24570013, 9, 1),
(5, 'alf', 24446190, 10, 1),
(6, 'spenc', 36771395, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='for testing and prototyping' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'fizzer@gmail.com', '123'),
(3, 'elly@boobs.com', 'boobs'),
(9, 'kizzo@gmail.com', '123'),
(10, 'alf@gmail.com', '123'),
(11, 'spenc@gmail.com', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
