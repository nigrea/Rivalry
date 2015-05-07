-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2015 at 09:36 PM
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
  `sub_types` varchar(100) NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `challange`
--

INSERT INTO `challange` (`id`, `user_one_id`, `user_two_id`, `accepted`, `sub_types`, `start_date`, `end_date`) VALUES
(23, 1, 10, 1, 'NORMAL', '2015-05-01 10:00:00', '2015-05-30 10:00:00'),
(24, 10, 1, 1, 'RANKED_SOLO_5x5,CAP_5x5', '2015-05-01 10:00:00', '2015-05-23 10:00:00');

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
(1803139145, '2015-04-24 06:36:47', 'CLASSIC', 'MATCHED_GAME', 67, 'CAP_5x5'),
(1803198861, '2015-04-24 15:49:59', 'CLASSIC', 'MATCHED_GAME', 110, 'CAP_5x5'),
(1803911279, '2015-04-25 01:59:03', 'CLASSIC', 'MATCHED_GAME', 249, 'CAP_5x5'),
(1803912481, '2015-04-25 02:37:33', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1805798609, '2015-04-26 23:03:47', 'CLASSIC', 'MATCHED_GAME', 64, 'CAP_5x5'),
(1805934990, '2015-04-26 22:20:34', 'CLASSIC', 'MATCHED_GAME', 256, 'CAP_5x5'),
(1806773356, '2015-04-27 20:50:59', 'CLASSIC', 'MATCHED_GAME', 193, 'BOT'),
(1807374297, '2015-04-28 05:39:51', 'CLASSIC', 'MATCHED_GAME', 87, 'RANKED_SOLO_5x5'),
(1807611011, '2015-04-28 18:19:45', 'CLASSIC', 'MATCHED_GAME', 72, 'RANKED_SOLO_5x5'),
(1807651072, '2015-04-28 21:38:56', 'CLASSIC', 'MATCHED_GAME', 251, 'CAP_5x5'),
(1807959590, '2015-04-29 03:37:01', 'CLASSIC', 'MATCHED_GAME', 256, 'RANKED_SOLO_5x5'),
(1808049273, '2015-04-29 04:22:28', 'CLASSIC', 'MATCHED_GAME', 76, 'RANKED_SOLO_5x5'),
(1808125089, '2015-04-29 05:20:17', 'CLASSIC', 'MATCHED_GAME', 71, 'RANKED_SOLO_5x5'),
(1808632303, '2015-04-29 22:26:15', 'CLASSIC', 'CUSTOM_GAME', 0, 'NONE'),
(1808765569, '2015-04-29 23:36:10', 'CLASSIC', 'MATCHED_GAME', 265, 'CAP_5x5'),
(1809452603, '2015-04-30 17:54:41', 'CLASSIC', 'MATCHED_GAME', 60, 'RANKED_SOLO_5x5'),
(1809459129, '2015-04-30 19:12:52', 'CLASSIC', 'MATCHED_GAME', 87, 'RANKED_SOLO_5x5'),
(1809498865, '2015-04-30 20:28:35', 'CLASSIC', 'MATCHED_GAME', 81, 'RANKED_SOLO_5x5'),
(1809528644, '2015-04-30 21:10:45', 'CLASSIC', 'MATCHED_GAME', 62, 'RANKED_SOLO_5x5'),
(1809682386, '2015-04-30 22:51:08', 'CLASSIC', 'MATCHED_GAME', 71, 'RANKED_SOLO_5x5'),
(1809915803, '2015-04-30 23:21:06', 'CLASSIC', 'MATCHED_GAME', 226, 'RANKED_SOLO_5x5'),
(1810168267, '2015-05-01 05:34:14', 'CLASSIC', 'MATCHED_GAME', 274, 'RANKED_SOLO_5x5'),
(1810199080, '2015-05-01 23:37:37', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1810498373, '2015-05-01 21:08:56', 'CLASSIC', 'MATCHED_GAME', 58, 'RANKED_SOLO_5x5'),
(1810524661, '2015-05-01 21:44:51', 'CLASSIC', 'MATCHED_GAME', 232, 'RANKED_SOLO_5x5'),
(1810551904, '2015-05-01 22:34:32', 'CLASSIC', 'MATCHED_GAME', 113, 'RANKED_SOLO_5x5'),
(1810629810, '2015-05-02 00:06:36', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1810634526, '2015-05-02 03:46:19', 'CLASSIC', 'MATCHED_GAME', 108, 'CAP_5x5'),
(1810635648, '2015-05-02 04:44:46', 'CLASSIC', 'MATCHED_GAME', 88, 'CAP_5x5'),
(1810665007, '2015-05-02 00:59:43', 'CLASSIC', 'MATCHED_GAME', 76, 'RANKED_SOLO_5x5'),
(1810670927, '2015-05-02 01:52:03', 'CLASSIC', 'MATCHED_GAME', 79, 'CAP_5x5'),
(1810703999, '2015-05-02 01:56:17', 'CLASSIC', 'MATCHED_GAME', 84, 'RANKED_SOLO_5x5'),
(1810795099, '2015-05-02 02:55:30', 'CLASSIC', 'MATCHED_GAME', 54, 'RANKED_SOLO_5x5'),
(1811275750, '2015-05-02 18:33:36', 'CLASSIC', 'MATCHED_GAME', 71, 'CAP_5x5'),
(1811372688, '2015-05-02 17:46:16', 'CLASSIC', 'MATCHED_GAME', 226, 'CAP_5x5'),
(1811381128, '2015-05-02 13:31:17', 'CLASSIC', 'MATCHED_GAME', 30, 'BOT'),
(1811391801, '2015-05-02 13:56:51', 'CLASSIC', 'MATCHED_GAME', 27, 'BOT'),
(1811634188, '2015-05-02 21:27:42', 'CLASSIC', 'MATCHED_GAME', 41, 'BOT'),
(1811656326, '2015-05-02 22:08:49', 'CLASSIC', 'MATCHED_GAME', 46, 'BOT'),
(1811671534, '2015-05-02 23:24:05', 'CLASSIC', 'MATCHED_GAME', 230, 'CAP_5x5'),
(1811674694, '2015-05-03 01:47:32', 'CLASSIC', 'MATCHED_GAME', 58, 'CAP_5x5'),
(1811677737, '2015-05-03 03:56:54', 'CLASSIC', 'MATCHED_GAME', 51, 'CAP_5x5'),
(1811773406, '2015-05-03 03:25:42', 'CLASSIC', 'MATCHED_GAME', 80, 'CAP_5x5'),
(1812314827, '2015-05-03 15:12:40', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1812315905, '2015-05-03 16:52:37', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1812316553, '2015-05-03 18:03:57', 'CLASSIC', 'MATCHED_GAME', 64, 'CAP_5x5'),
(1812470906, '2015-05-03 15:39:13', 'CLASSIC', 'MATCHED_GAME', 51, 'CAP_5x5'),
(1812487399, '2015-05-03 13:48:05', 'CLASSIC', 'MATCHED_GAME', 39, 'BOT'),
(1812520792, '2015-05-03 14:52:21', 'CLASSIC', 'MATCHED_GAME', 51, 'RANKED_SOLO_5x5'),
(1812644186, '2015-05-03 19:29:34', 'CLASSIC', 'MATCHED_GAME', 265, 'NORMAL'),
(1812714803, '2015-05-03 20:49:06', 'CLASSIC', 'MATCHED_GAME', 36, 'BOT'),
(1812746357, '2015-05-03 21:14:51', 'CLASSIC', 'MATCHED_GAME', 39, 'BOT'),
(1812753584, '2015-05-03 21:57:19', 'CLASSIC', 'MATCHED_GAME', 267, 'RANKED_TEAM_5x5'),
(1812762488, '2015-05-03 21:48:03', 'CLASSIC', 'MATCHED_GAME', 66, 'BOT'),
(1812785036, '2015-05-03 22:19:17', 'CLASSIC', 'MATCHED_GAME', 58, 'BOT'),
(1812842946, '2015-05-03 23:16:23', 'CLASSIC', 'MATCHED_GAME', 36, 'BOT'),
(1812994333, '2015-05-04 02:42:42', 'CLASSIC', 'MATCHED_GAME', 74, 'RANKED_SOLO_5x5'),
(1813518656, '2015-05-05 01:22:50', 'CLASSIC', 'MATCHED_GAME', 117, 'CAP_5x5'),
(1813682117, '2015-05-04 19:05:50', 'CLASSIC', 'MATCHED_GAME', 216, 'BOT'),
(1813688735, '2015-05-04 19:46:16', 'CLASSIC', 'MATCHED_GAME', 46, 'BOT'),
(1813720464, '2015-05-04 20:38:47', 'CLASSIC', 'MATCHED_GAME', 288, 'RANKED_SOLO_5x5'),
(1813843241, '2015-05-05 01:51:01', 'CLASSIC', 'MATCHED_GAME', 76, 'CAP_5x5'),
(1814233012, '2015-05-05 18:05:40', 'CLASSIC', 'MATCHED_GAME', 122, 'CAP_5x5'),
(1814638234, '2015-05-05 19:48:27', 'CLASSIC', 'MATCHED_GAME', 57, 'RANKED_SOLO_5x5'),
(1814731214, '2015-05-05 21:02:25', 'CLASSIC', 'MATCHED_GAME', 226, 'RANKED_SOLO_5x5'),
(1814765639, '2015-05-05 22:36:21', 'CLASSIC', 'MATCHED_GAME', 122, 'RANKED_SOLO_5x5'),
(1814831746, '2015-05-05 23:20:35', 'CLASSIC', 'MATCHED_GAME', 198, 'BOT'),
(1815357966, '2015-05-07 00:22:21', 'CLASSIC', 'MATCHED_GAME', 230, 'CAP_5x5'),
(1815362866, '2015-05-06 21:06:50', 'CLASSIC', 'MATCHED_GAME', 110, 'CAP_5x5'),
(1815369049, '2015-05-07 01:08:43', 'CLASSIC', 'MATCHED_GAME', 71, 'CAP_5x5'),
(1815930971, '2015-05-07 01:22:37', 'CLASSIC', 'MATCHED_GAME', 183, 'BOT');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

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
(115, 1812487399, 11, 10013, 17, 25480, 144, 2, 3, 0, 418830, 64, 1, 1173),
(116, 1812644186, 14, 15780, 9, 39404, 234, 5, 8, 1, 418830, 51, 1, 2557),
(117, 1812714803, 6, 7511, 9, 13092, 68, 2, 4, 0, 418830, 62, 1, 1107),
(118, 1812746357, 5, 10825, 21, 29557, 126, 0, 3, 0, 418830, 13, 1, 1175),
(119, 1812762488, 7, 14896, 17, 23462, 127, 2, 2, 0, 418830, 13, 1, 1814),
(120, 1812785036, 12, 13811, 22, 36962, 143, 0, 3, 0, 418830, 236, 1, 1627),
(121, 1803139145, 11, 10653, 3, 13921, 43, 13, 18, 1, 24446190, 1, 0, 2185),
(122, 1803198861, 10, 16151, 9, 35024, 241, 7, 0, 1, 24446190, 429, 1, 2456),
(123, 1803911279, 7, 19505, 22, 60892, 305, 4, 2, 3, 24446190, 236, 1, 2123),
(124, 1803912481, 8, 11275, 12, 20772, 172, 3, 1, 0, 24446190, 222, 1, 1250),
(125, 1805934990, 10, 19053, 15, 39819, 291, 7, 1, 0, 24446190, 222, 1, 2304),
(126, 1805798609, 6, 11236, 2, 12884, 230, 7, 1, 0, 24446190, 429, 0, 2041),
(127, 1806773356, 4, 9977, 21, 23518, 62, 4, 5, 0, 24446190, 64, 1, 1284),
(128, 1808632303, 0, 16700, 53, 80980, 191, 0, 0, 0, 24446190, 236, 1, 1442),
(129, 1808765569, 14, 16875, 12, 35654, 231, 9, 3, 0, 24446190, 6, 1, 2565),
(130, 1812753584, 7, 20655, 15, 39517, 367, 6, 0, 0, 24446190, 67, 1, 2618),
(131, 1812314827, 3, 8080, 3, 8949, 137, 0, 11, 1, 36771395, 102, 1, 1332),
(132, 1812470906, 2, 5650, 0, 4525, 96, 3, 8, 1, 36771395, 421, 0, 1388),
(133, 1812315905, 1, 7073, 3, 7971, 128, 2, 9, 0, 36771395, 102, 1, 1216),
(134, 1812316553, 3, 9769, 3, 15490, 154, 9, 10, 0, 36771395, 102, 0, 2077),
(135, 1812644186, 18, 16561, 9, 31815, 197, 3, 22, 1, 36771395, 102, 1, 2557),
(136, 1812753584, 19, 16843, 6, 28133, 234, 8, 20, 5, 36771395, 102, 1, 2618),
(137, 1812842946, 5, 10331, 15, 19181, 130, 2, 2, 0, 418830, 56, 1, 1130),
(138, 1813682117, 3, 18274, 28, 40721, 130, 4, 8, 0, 418830, 55, 1, 1833),
(139, 1813688735, 19, 11933, 17, 25709, 138, 0, 4, 0, 418830, 13, 1, 1375),
(140, 1807374297, 20, 19477, 8, 40986, 344, 6, 11, 1, 5908, 14, 0, 3001),
(141, 1807611011, 10, 12510, 3, 23573, 232, 13, 7, 1, 5908, 14, 0, 2415),
(142, 1807959590, 10, 14061, 6, 21360, 220, 4, 13, 2, 5908, 150, 1, 2332),
(143, 1808049273, 1, 3026, 0, 855, 58, 1, 2, 0, 5908, 14, 1, 550),
(144, 1808125089, 7, 15577, 9, 35329, 263, 6, 13, 1, 5908, 57, 0, 2343),
(145, 1809452603, 7, 11169, 2, 17487, 207, 5, 10, 1, 5908, 115, 0, 1869),
(146, 1809459129, 13, 18945, 6, 32721, 336, 4, 18, 1, 5908, 150, 0, 3005),
(147, 1809498865, 10, 17292, 12, 49729, 296, 5, 18, 8, 5908, 68, 0, 2786),
(148, 1809528644, 3, 10966, 1, 12660, 242, 3, 10, 1, 5908, 104, 0, 2026),
(149, 1810168267, 18, 16489, 8, 35259, 224, 10, 11, 0, 5908, 150, 1, 2761),
(150, 1809682386, 14, 15064, 7, 21541, 257, 3, 11, 0, 51575588, 122, 0, 2381),
(151, 1809915803, 2, 7238, 6, 7343, 14, 1, 2, 2, 51575588, 79, 1, 1257),
(152, 1810498373, 5, 10892, 9, 18242, 158, 4, 13, 0, 51575588, 76, 0, 1808),
(153, 1810524661, 3, 10815, 6, 10974, 185, 6, 8, 0, 51575588, 92, 1, 1724),
(154, 1810551904, 20, 15653, 8, 25293, 79, 3, 1, 4, 51575588, 79, 1, 2480),
(155, 1810665007, 4, 9271, 8, 10169, 129, 4, 6, 0, 51575588, 222, 1, 1524),
(156, 1810703999, 9, 16222, 4, 18746, 266, 8, 16, 1, 51575588, 429, 0, 2917),
(157, 1811381128, 16, 9301, 21, 25919, 60, 0, 0, 0, 51575588, 432, 1, 1314),
(158, 1811391801, 5, 7857, 10, 19008, 90, 1, 1, 0, 51575588, 13, 1, 1194),
(159, 1812520792, 2, 9441, 7, 10328, 57, 2, 8, 0, 51575588, 106, 0, 1361),
(160, 1814831746, 8, 12240, 16, 29282, 183, 0, 2, 0, 418830, 3, 1, 1428),
(161, 1815362866, 19, 16000, 13, 53995, 170, 5, 9, 1, 418830, 1, 1, 2404),
(162, 1815357966, 11, 11846, 7, 14782, 43, 2, 5, 0, 24570013, 421, 1, 1657),
(163, 1812994333, 12, 14854, 5, 25518, 223, 8, 27, 5, 36771395, 102, 0, 2500),
(164, 1813720464, 22, 15033, 1, 18431, 76, 10, 31, 5, 36771395, 154, 1, 3140),
(165, 1813518656, 25, 12694, 3, 18021, 29, 8, 40, 6, 36771395, 412, 1, 2626),
(166, 1813843241, 3, 5424, 2, 2014, 13, 3, 6, 0, 36771395, 421, 1, 1229),
(167, 1814233012, 21, 11846, 2, 12830, 29, 11, 47, 9, 36771395, 412, 1, 2758),
(168, 1814638234, 2, 9176, 4, 15216, 137, 6, 43, 4, 36771395, 102, 0, 1783),
(169, 1814731214, 9, 10448, 9, 20957, 143, 1, 3, 0, 36771395, 51, 1, 1514),
(170, 1814765639, 16, 16708, 7, 28385, 239, 6, 22, 1, 36771395, 102, 1, 2722),
(171, 1815357966, 4, 8837, 6, 14641, 123, 4, 11, 2, 36771395, 115, 1, 1657),
(172, 1815369049, 9, 14644, 14, 32240, 130, 12, 16, 4, 36771395, 131, 0, 2363),
(173, 1815930971, 9, 9310, 10, 15991, 66, 2, 3, 0, 51575588, 14, 1, 1380);

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
  `sub_types` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `rivalry`
--

INSERT INTO `rivalry` (`id`, `user_one_id`, `user_two_id`, `start_date`, `end_date`, `sub_types`) VALUES
(10, 1, 10, '2015-04-07 17:58:10', '2015-05-21 17:58:10', 'NONE,CAP_5x5'),
(11, 1, 10, '2015-05-01 10:00:00', '0000-00-00 00:00:00', 'NORMAL'),
(12, 10, 1, '2015-05-01 10:00:00', '2015-05-23 10:00:00', 'RANKED_SOLO_5x5,CAP_5x5');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `summoner`
--

INSERT INTO `summoner` (`id`, `name`, `api_id`, `user_id`, `main`) VALUES
(1, 'McBoobyBoobys', 0, 3, 1),
(2, 'nigrea', 418830, 1, 1),
(4, 'kizzo', 24570013, 9, 1),
(5, 'alf', 24446190, 10, 1),
(6, 'spenc', 36771395, 11, 1),
(7, 'bjergsen', 51575588, 12, 1),
(8, 'dyrus', 5908, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='for testing and prototyping' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'fizzer@gmail.com', '123'),
(3, 'elly@boobs.com', 'boobs'),
(9, 'kizzo@gmail.com', '123'),
(10, 'alf@gmail.com', '123'),
(11, 'spenc@gmail.com', '123'),
(12, 'bjergsen@gmail.com', '123'),
(13, 'dyrus@gmail.com', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
