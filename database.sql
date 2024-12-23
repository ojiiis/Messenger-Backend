-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2024 at 05:26 PM
-- Server version: 10.6.20-MariaDB-cll-lve
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doksummz_love`
--

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(250) NOT NULL,
  `party1` varchar(200) NOT NULL,
  `party2` varchar(200) NOT NULL,
  `cid` varchar(200) NOT NULL,
  `last_mid` int(11) DEFAULT 0,
  `last_active` varchar(200) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`id`, `party1`, `party2`, `cid`, `last_mid`, `last_active`, `date`) VALUES
(1, 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'someid1', 3, '1734562531', '2024-11-01'),
(2, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'someid2', 79, '1734737169', '2024-12-12'),
(3, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', '9sgFACYxAJSc6N2BLbBRQaJQzZhCw4OFoM', 3, '1734737254', '2024-12-20'),
(4, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', 'I4BrO7vS1RL8CHLr6s4JotMoIFi3FLmraF', 2, '1734770346', '2024-12-20'),
(5, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '7IbrMbhsI6b26tnoxy2yOCIsO9XA2O', 'EkbUmMkk0YLLRpyfxXVj8ZfnX0ufGQWS7p', 2, '1734737109', '2024-12-20'),
(6, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'FkqJECLbXPBBxjqY117eRJo3cDPTil', 'MmfbNt0J0HWACjeeolMLqp3PLdxH9PrxA8', 2, '1734737125', '2024-12-20'),
(7, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'RfwY7sZOsUEUBaUm7zsALU8QbTtsc9Ff4G', 3, '1734757187', '2024-12-20'),
(8, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'ld6ikzm6isQ9vJLB7n5pg1XPiu3E1a', 'Z6A1EeA88fREcC6sgHKXqKSHMORboDZqIh', 1, '1734737021', '2024-12-20'),
(9, 'ty41u6r9xI1MDdt4PAguXTmAjCEGLh', 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', 'nYGHf1wZgs57orCt9fHuu6XSRctjsVFNWV', 1, '1734737352', '2024-12-20'),
(10, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', '7IbrMbhsI6b26tnoxy2yOCIsO9XA2O', 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 9, '1734757668', '2024-12-21'),
(11, 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', '0CvsYwtzWyhzsfYcY34fSEfOovfcro2JoE', 1, '1734770358', '2024-12-21'),
(12, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 14, '1734936468', '2024-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(250) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `liked` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `liked`, `date`) VALUES
(1, 'FkqJECLbXPBBxjqY117eRJo3cDPTil', 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '2024-12-11'),
(13, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', '2024-12-12'),
(16, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '2024-12-12'),
(17, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', '2024-12-12'),
(19, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '2024-12-12'),
(20, 'ty41u6r9xI1MDdt4PAguXTmAjCEGLh', 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '2024-12-12'),
(22, '631mudLfmxTyiXWU74T6iA8Hx2N0US', 'FkqJECLbXPBBxjqY117eRJo3cDPTil', '2024-12-21'),
(27, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'VzUOEf6xAD1TZvpKhTnbduzQXQVk8F', '2024-12-22'),
(28, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', '631mudLfmxTyiXWU74T6iA8Hx2N0US', '2024-12-22'),
(29, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'OFXHAyfh0tYytFikbyd2p07xFIahPV', '2024-12-22'),
(30, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '2024-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `list_id` varchar(200) NOT NULL,
  `mid` int(255) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `time` time NOT NULL DEFAULT current_timestamp(),
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `list_id`, `mid`, `user_id`, `message`, `seen`, `time`, `date`) VALUES
(1, 'someid2', 1, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hello first message here', 1, '07:06:29', '2024-12-18'),
(2, 'someid2', 2, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Second message here', 1, '07:06:58', '2024-12-18'),
(3, 'someid2', 3, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Ooh wow, this is nice', 1, '07:08:16', '2024-12-18'),
(4, 'someid2', 4, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Looking for new write up', 1, '08:27:25', '2024-12-18'),
(5, 'someid2', 5, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Unread first', 1, '09:06:18', '2024-12-18'),
(6, 'someid2', 6, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Unread second', 1, '09:06:26', '2024-12-18'),
(7, 'someid2', 7, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Unread last', 1, '09:06:33', '2024-12-18'),
(8, 'someid2', 8, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '1', 1, '09:08:30', '2024-12-18'),
(9, 'someid2', 9, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '2', 1, '09:08:32', '2024-12-18'),
(10, 'someid2', 10, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '3', 1, '09:08:35', '2024-12-18'),
(11, 'someid2', 11, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '4', 1, '09:08:38', '2024-12-18'),
(12, 'someid2', 12, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '5', 1, '09:08:41', '2024-12-18'),
(13, 'someid2', 13, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '6', 1, '09:08:43', '2024-12-18'),
(14, 'someid2', 14, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '7', 1, '09:08:47', '2024-12-18'),
(15, 'someid2', 15, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '8', 1, '09:08:52', '2024-12-18'),
(16, 'someid2', 16, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '9', 1, '16:53:45', '2024-12-18'),
(17, 'someid2', 17, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', '10', 1, '16:53:49', '2024-12-18'),
(18, 'someid2', 18, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'I am a star', 1, '16:54:00', '2024-12-18'),
(19, 'someid2', 19, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Yes', 1, '16:54:05', '2024-12-18'),
(20, 'someid2', 20, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Yes yes', 1, '16:54:23', '2024-12-18'),
(21, 'someid2', 21, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Show second at top', 1, '16:54:49', '2024-12-18'),
(22, 'someid1', 1, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hi mariam', 0, '17:11:37', '2024-12-18'),
(23, 'someid1', 2, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Welcome on board', 0, '17:11:44', '2024-12-18'),
(24, 'someid1', 3, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Maria mo', 0, '17:55:31', '2024-12-18'),
(25, 'someid2', 22, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ok let us try a new job', 1, '17:56:06', '2024-12-18'),
(26, 'someid2', 23, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes oh', 1, '17:56:12', '2024-12-18'),
(27, 'someid2', 24, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Ooh seems scroll set it', 1, '17:57:04', '2024-12-18'),
(28, 'someid2', 25, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'I will check now', 1, '17:57:10', '2024-12-18'),
(29, 'someid2', 26, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes ', 1, '18:31:22', '2024-12-18'),
(30, 'someid2', 27, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'God has done it', 1, '18:31:29', '2024-12-18'),
(31, 'someid2', 28, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Yes in deed', 1, '18:32:12', '2024-12-18'),
(32, 'someid2', 29, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Ok it even works here', 1, '19:43:25', '2024-12-18'),
(33, 'someid2', 30, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hello world', 1, '09:01:22', '2024-12-19'),
(34, 'someid2', 31, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'New things coming my way', 1, '14:26:02', '2024-12-19'),
(35, 'someid2', 32, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'New world in a bit', 1, '14:26:09', '2024-12-19'),
(36, 'someid2', 33, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes , yes', 1, '14:42:27', '2024-12-19'),
(37, 'someid2', 34, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Last down', 1, '14:42:44', '2024-12-19'),
(38, 'someid2', 35, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hmmmm', 1, '14:49:56', '2024-12-19'),
(39, 'someid2', 36, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ooh 2', 1, '14:50:38', '2024-12-19'),
(40, 'someid2', 37, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ooh 3', 1, '14:50:41', '2024-12-19'),
(41, 'someid2', 38, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hello boss', 1, '02:05:32', '2024-12-20'),
(42, 'someid2', 39, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Testing new', 1, '02:06:06', '2024-12-20'),
(43, 'someid2', 40, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'This is working sweet', 1, '02:06:24', '2024-12-20'),
(44, 'someid2', 41, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hmmm', 1, '02:06:45', '2024-12-20'),
(45, 'someid2', 42, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Oh working like fire', 1, '02:07:00', '2024-12-20'),
(46, 'someid2', 43, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', '', 1, '06:55:17', '2024-12-20'),
(47, 'someid2', 44, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hello world', 1, '06:56:42', '2024-12-20'),
(48, 'someid2', 45, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Sorry for the delay', 1, '07:07:41', '2024-12-20'),
(49, 'someid2', 46, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hello', 1, '07:23:55', '2024-12-20'),
(50, 'someid2', 47, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ooh wow, the lord is good', 1, '08:14:24', '2024-12-20'),
(51, 'someid2', 48, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hey boss', 1, '15:07:50', '2024-12-20'),
(52, 'someid2', 49, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hey  bobo', 1, '15:33:41', '2024-12-20'),
(53, 'someid2', 50, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Really', 1, '15:35:08', '2024-12-20'),
(54, 'someid2', 51, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes really', 1, '15:45:15', '2024-12-20'),
(55, 'someid2', 52, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'And ooh really', 1, '15:45:25', '2024-12-20'),
(56, 'someid2', 53, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Move to new', 1, '15:46:14', '2024-12-20'),
(57, 'someid2', 54, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Working?', 1, '15:47:06', '2024-12-20'),
(58, 'someid2', 55, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Yes', 1, '15:47:49', '2024-12-20'),
(59, 'someid2', 56, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'God on it', 1, '15:47:59', '2024-12-20'),
(60, 'someid2', 57, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'G', 1, '15:48:25', '2024-12-20'),
(61, 'someid2', 58, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Bea', 1, '15:49:03', '2024-12-20'),
(62, 'someid2', 59, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Gee', 1, '15:49:28', '2024-12-20'),
(63, 'someid2', 60, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Gee', 1, '15:49:51', '2024-12-20'),
(64, 'someid2', 61, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ooh wow', 1, '15:49:54', '2024-12-20'),
(65, 'someid2', 62, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Send men', 1, '15:49:59', '2024-12-20'),
(66, 'someid2', 63, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Show', 1, '15:50:26', '2024-12-20'),
(67, 'someid2', 64, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hmm', 1, '15:50:45', '2024-12-20'),
(68, 'someid2', 65, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Test', 1, '15:51:10', '2024-12-20'),
(69, 'someid2', 66, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Hmmm', 1, '15:51:26', '2024-12-20'),
(70, 'someid2', 67, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes', 1, '15:52:09', '2024-12-20'),
(71, 'someid2', 68, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes yes', 1, '15:52:21', '2024-12-20'),
(72, 'someid2', 69, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Yes oh', 1, '15:52:37', '2024-12-20'),
(73, 'someid2', 70, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Oh wow', 1, '15:52:50', '2024-12-20'),
(74, 'someid2', 71, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Oh wow', 1, '15:53:11', '2024-12-20'),
(75, 'someid2', 72, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Seen wow a little ', 1, '15:53:12', '2024-12-20'),
(76, 'someid2', 73, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Wow below', 1, '15:53:46', '2024-12-20'),
(77, 'someid2', 74, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Yeah yeah', 1, '15:55:22', '2024-12-20'),
(78, '9sgFACYxAJSc6N2BLbBRQaJQzZhCw4OFoM', 1, 'bot', 'Mr AB initiated a chat.', 1, '16:05:10', '2024-12-20'),
(79, '9sgFACYxAJSc6N2BLbBRQaJQzZhCw4OFoM', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hello world', 1, '16:05:10', '2024-12-20'),
(80, 'I4BrO7vS1RL8CHLr6s4JotMoIFi3FLmraF', 1, 'bot', 'Mr AB initiated a chat.', 1, '16:10:03', '2024-12-20'),
(81, 'I4BrO7vS1RL8CHLr6s4JotMoIFi3FLmraF', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi alice', 1, '16:10:03', '2024-12-20'),
(82, 'someid2', 75, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi Debora', 1, '16:12:29', '2024-12-20'),
(83, 'someid2', 76, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hello world', 1, '16:12:57', '2024-12-20'),
(84, '9sgFACYxAJSc6N2BLbBRQaJQzZhCw4OFoM', 2, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Testing mariam again', 0, '16:16:48', '2024-12-20'),
(85, 'someid2', 77, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Ab world', 1, '16:24:04', '2024-12-20'),
(86, 'someid2', 78, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'Wawu', 1, '16:24:19', '2024-12-20'),
(87, 'EkbUmMkk0YLLRpyfxXVj8ZfnX0ufGQWS7p', 1, 'bot', 'Mr AB initiated a chat.', 1, '16:27:42', '2024-12-20'),
(88, 'EkbUmMkk0YLLRpyfxXVj8ZfnX0ufGQWS7p', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hey Dlamini', 1, '16:27:42', '2024-12-20'),
(89, 'MmfbNt0J0HWACjeeolMLqp3PLdxH9PrxA8', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hello Mercy', 0, '16:44:14', '2024-12-20'),
(90, 'RfwY7sZOsUEUBaUm7zsALU8QbTtsc9Ff4G', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hey Sandra Baby', 1, '16:45:26', '2024-12-20'),
(91, 'Z6A1EeA88fREcC6sgHKXqKSHMORboDZqIh', 1, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hello pearl, how are you doing?', 0, '18:23:41', '2024-12-20'),
(92, 'RfwY7sZOsUEUBaUm7zsALU8QbTtsc9Ff4G', 2, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi Sandra', 1, '18:24:54', '2024-12-20'),
(93, 'EkbUmMkk0YLLRpyfxXVj8ZfnX0ufGQWS7p', 2, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi nico', 1, '18:25:09', '2024-12-20'),
(94, 'MmfbNt0J0HWACjeeolMLqp3PLdxH9PrxA8', 2, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi, merxy', 0, '18:25:25', '2024-12-20'),
(95, 'someid2', 79, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi debora', 1, '18:26:09', '2024-12-20'),
(96, '9sgFACYxAJSc6N2BLbBRQaJQzZhCw4OFoM', 3, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'Hi mariam', 0, '18:27:34', '2024-12-20'),
(97, 'nYGHf1wZgs57orCt9fHuu6XSRctjsVFNWV', 1, 'ty41u6r9xI1MDdt4PAguXTmAjCEGLh', 'Hey omo marry', 0, '18:29:12', '2024-12-20'),
(98, 'RfwY7sZOsUEUBaUm7zsALU8QbTtsc9Ff4G', 3, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Hey', 0, '23:59:47', '2024-12-20'),
(99, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 1, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Hey', 1, '00:02:29', '2024-12-21'),
(100, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 2, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Oh working like fire', 1, '00:05:50', '2024-12-21'),
(101, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 3, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Yes yes ', 1, '00:06:20', '2024-12-21'),
(102, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 4, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Go on', 1, '00:06:40', '2024-12-21'),
(103, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 5, '7IbrMbhsI6b26tnoxy2yOCIsO9XA2O', 'Ok it even works here', 1, '00:06:50', '2024-12-21'),
(104, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 6, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Yes', 1, '00:06:54', '2024-12-21'),
(105, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 7, '7IbrMbhsI6b26tnoxy2yOCIsO9XA2O', 'Alright', 1, '00:07:07', '2024-12-21'),
(106, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 8, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Nice one', 1, '00:07:21', '2024-12-21'),
(107, 'mkzG5W0WyvBw1ZKUtIcr4tbGOBwWI9yDVe', 9, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Yes', 1, '00:07:48', '2024-12-21'),
(108, 'I4BrO7vS1RL8CHLr6s4JotMoIFi3FLmraF', 2, 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', 'Hello Ab', 0, '03:39:06', '2024-12-21'),
(109, '0CvsYwtzWyhzsfYcY34fSEfOovfcro2JoE', 1, 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', 'Hello Mariam', 0, '03:39:18', '2024-12-21'),
(110, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 1, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'Hey amasandra', 1, '01:43:02', '2024-12-23'),
(111, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 2, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Hey', 1, '01:45:06', '2024-12-23'),
(112, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 3, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'How is you', 1, '01:45:39', '2024-12-23'),
(113, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 4, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'I\'m fine thanks', 1, '01:45:51', '2024-12-23'),
(114, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 5, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Really ', 1, '01:46:01', '2024-12-23'),
(115, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 6, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'Yes', 1, '01:46:05', '2024-12-23'),
(116, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 7, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Ooh ok', 1, '01:46:13', '2024-12-23'),
(117, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 8, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'Yes ok', 1, '01:46:21', '2024-12-23'),
(118, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 9, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'Reason with me', 1, '01:46:43', '2024-12-23'),
(119, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 10, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Ooh awesome ', 1, '01:46:55', '2024-12-23'),
(120, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 11, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Hey', 1, '01:47:08', '2024-12-23'),
(121, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 12, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'God is on it', 1, '01:47:26', '2024-12-23'),
(122, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 13, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'Yes', 1, '01:47:38', '2024-12-23'),
(123, 'cCQdTkY7iGHz4zv3qejgGHB0A2uSPjSWKY', 14, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'Hello', 1, '01:47:48', '2024-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lookingfor` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `media` text DEFAULT '',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `email`, `password`, `fullname`, `dob`, `state`, `city`, `gender`, `lookingfor`, `about`, `media`, `date`) VALUES
(1, 'TPFCa4iLxABAbUYsxEoP3qMfsVMFeg', 'bot@gmail.com', '$2y$10$b41fS5gA9Qe6wMe5OGfkdOTjxpWoMqwrVhpkfR0irBeKUJnWd4qIC', 'Ama Sandra', '1995-12-11', 'Lagos', 'Alimosho', 'Female', 'Male', 'I am a nice and easy going person.', 'KaFKnfSElL7LarQO3br41C2hw0fEUfsGHwjZa.jpg,EDkiZYAhEGmYaV6L0LEo8u9X1SaEnYafFB4YG.jpg', '2024-12-10 23:08:33'),
(2, '7IbrMbhsI6b26tnoxy2yOCIsO9XA2O', 'bot1@gmail.com', '$2y$10$spOjZsAlzyB6ilzqt0NJa.GdDM2eI5ruLYouG7o/VUQ6jemOHOhT.', 'Nicodemus Dlamini', '1990-12-11', 'Enugu', 'Enugu East', 'Female', 'Male', '', '62SS83gUhrBksBmCO2jSWa30h7vq7vxjul71s.jpg,cTBC7AL65c4yxs2CdZSCMNLexmm7BpoKPebD4.jpg,rlZlRsCFkTV5ZuetpyhQobb9aT7niSUbmIDCM.jpg', '2024-12-10 23:47:37'),
(3, 'FkqJECLbXPBBxjqY117eRJo3cDPTil', 'bot2@gmail.com', '$2y$10$1IDQLOjvSWrTzQyEDO10A.OxUVWDpgSk5zrifGw2YBy0mIgPSWxA.', 'Mercy', '1998-12-11', 'Ikorodu', 'Ikorodu', 'Female', 'Male', '\nNot into hookups or anything related to it, please don\'t match up if that\'s your\nmotive, looking for a healthy friendship and relationship', 'DIbdSV1QRyOGUwZlDltYOs7jKdjfzLBnIwkVu.jpg,CQjZ1AlfuoiQal5lGKDCZxaMy4z7ey1fiwEvg.jpg,7fXCiqhEuaz5bCfP9JIuF1WMATugN5pRmf6kr.jpg', '2024-12-11 00:01:33'),
(4, 'ld6ikzm6isQ9vJLB7n5pg1XPiu3E1a', 'bot3@gmail.com', '$2y$10$k80rgXc/V8ILQ4I4ifmtfev9OXWKvlEUmKws3ADDlgBLnB9DW/CPu', 'Pearl', '1998-12-11', 'Lagos', 'Ibeju-Lekki', 'Female', 'Male', '\nHi, my name\'s Pearl. Here are some of my favourite things: Cooking, Trying things, Comedy\nnew', 'aNT4tJqhHcJqjScU4V5r4Qu25Z9hNV22wEnjU.jpg,f8VOqFtTGLGYNtw0ibfLmfvfoarVjneELR9EE.jpg,jGLVEGwGUvx2QyMkELbwnAyGNoYAUI2cUp8jR.jpg', '2024-12-11 00:21:59'),
(5, 'v7pz1LJ9mdPXgcmyZAVMhVDBJfStvq', 'bot4@gmail.com', '$2y$10$jkAD3ti9BDZzHUpnEpIl2OZ.kuFpZQrCXwJ4PtTG12orIeYxik/7C', 'Bukunmi', '2001-12-27', 'Lagos', 'Ikorodu', 'Female', 'Male', '', 'ZLkkMcVYHz64hwxSBG06gUWRwRJNL0kulZg2x.jpg,BbJOq4MTZuJgSbw1hI4rpctIVSBEC39G1ZEUd.jpg', '2024-12-11 00:28:33'),
(6, 'ty41u6r9xI1MDdt4PAguXTmAjCEGLh', 'bot5@gmail.com', '$2y$10$oBl4KT7IOjScIKdc64anf.oBmw43BgCfHSltFqK49GugoLrEyzmuK', 'Dammy', '1996-12-11', 'Lagos', 'Epe', 'Female', 'Male', '', '6rK4t8JM3sk89mCU4Rny8tYVWkcq3XjQ8rAw8.jpg,Af8rNabH3T1ognofuoYatdbBpFgNiqiBUFYzA.jpg', '2024-12-11 05:52:50'),
(7, 'fT9c61rUYrkK9abZyR0AmDdBQZSH6L', 'bot6@gmail.com', '$2y$10$8TQhPF9aUQiKMpduPOtN1uVLDds2EpcUoK4LTZhHyCKWF/LhIbSkK', 'Jacob Alice', '1996-02-14', 'Lagos', 'Lagos Mainland', 'Female', 'Both Male & Female', 'A young, vibrant Nigerian woman searching for genuine love. She believes in meaningful connections, shared values, and building a future together. Passionate about kindness, trust, and mutual respect, sheâ€™s ready to meet someone special.', '8LrxbMH4iST7QrkbuVFdkDxd6ko3TUF7CDhlt.png,4386HaH5CNHHG1TKxnLufROSzoIqtoZh1N1xP.png', '2024-12-11 08:33:13'),
(8, 'o98vFjFL9A4IyjTE2eDjC9CaQVMBuy', 'bot7@gmail.com', '$2y$10$r6pAVx2hIoaOL76.Yy57oO56PgFw6SZE6IT6I86uw4AX5G.XPcBkS', 'Jeffery Mariam', '2000-02-01', 'Lagos', 'Lagos Mainland', 'Female', 'Both Male & Female', 'An elegant Nigerian lady with a warm heart, looking to share her life with someone who values love and partnership. She treasures honesty, laughter, and meaningful conversations, seeking a connection that feels like home.', 'zqpDbVwLJQrHmNfYUQEm9YXXDGNxlFLQNqsxv.png,YoxwhhGeuNUDiuFXloSQkghQ496fYDWgzqH5x.png,qaHmjZJ5Tp3AEtAWPbpGepMotlc7Dc6kwd6r6.png', '2024-12-11 11:37:59'),
(9, 'PqzXuatBDYLwZzBmE1lF8oS2GaHS2H', 'bot8@gmail.com', '$2y$10$aLahoro0Yf38edfBjoDt8eFmPc0lycRyDH9Rt1IAoEsKUlvjs0MN2', 'Mr AB', '1967-01-10', 'Cross River', 'Calabar Municipal', 'Male', 'Female', 'A confident Nigerian man with a kind heart, ready to find love and build a meaningful relationship. He values respect, loyalty, and shared dreams, seeking a partner to grow and thrive with in lifeâ€™s journey.', 'v3G8a7JWm8epXGHJb3xITdoWYsQjgWjpAeODe.png,qiYpYUI94I9bF7akDtk2SDJ3hkqFu8oJ9TJqs.png', '2024-12-11 12:02:43'),
(10, 'OYIDdfrqLLFDFLdOqZa8PdNWPiYGd6', 'bot9@gmail.com', '$2y$10$yQD3dNjvR8sBGpq8sVX4NeWN.4fnyI9Sa/7th/1lxLpqA3xc2UH/6', 'Debora', '1991-01-09', 'Lagos', 'Ikorodu', 'Female', 'Both Male & Female', 'A graceful Nigerian woman with a charming personality, searching for a love that feels true and lasting. She values emotional depth, honesty, and shared dreams, hoping to find a partner who complements her vibrant spirit.', 'N2NuDCDNJf5ta5Sd6CkkyJMrSupn0DquNyDeR.png,YzjNgEL0gffDm0TJMRpKFjYLRt4AOsDeqGyWz.png', '2024-12-11 12:11:59'),
(11, 'OFXHAyfh0tYytFikbyd2p07xFIahPV', 'bot10@gmail.com', '$2y$10$HnbzkU/PQ7hdew223ttKLuyHPRemnYk2wsQTuQNnWttGkqa.tvL3G', 'Damola', '1994-12-08', 'Lagos', 'Epe', 'Male', 'Female', 'Hello, I am a passionate individual with the heart of love and meeting new people.', 'eTodJMv7SY0TBgq4JB1HxgutKUYOLzY63rysO.jpg,BcCR9J7J1wsAOmhOdKRYOANBxxx0mRJQjziCq.jpg', '2024-12-21 08:41:41'),
(12, '631mudLfmxTyiXWU74T6iA8Hx2N0US', 'bot11@gmail.com', '$2y$10$3hjntEsGG1097W6EP5s6TeXOJc3KOkU5TWprFU//XYAPDjG9Echm2', 'Ajoke', '1997-12-21', 'Ekiti', 'Ekiti West', 'Female', 'Both Male & Female', '', 'YnUYgiUinoF8F9qhYFtNGRaGj8Gtvt2OWHx26.jpg,fTsqhSrhUl8LtiLqitjpkcL9U2HnsQg5Z9xpn.jpg', '2024-12-21 20:49:55'),
(13, 'VzUOEf6xAD1TZvpKhTnbduzQXQVk8F', 'bot12@gmail.com', '$2y$10$SdZM3s3vfdL/A00XyQ6zcedzGoEo40DxPytuK3R7wrhTIQPSqvmVS', 'Tife Johnson', '1994-12-22', 'Lagos', 'Ikeja', 'Female', 'Both Male & Female', '', 'N8rTt8hKJROrlUn6Nn4owDpYuQjXvbfPSUquq.jpg,fEmUwSct6JrU83vOyTRnsoxmPI0aCyOyKgnKW.jpg', '2024-12-22 08:36:18'),
(14, 'UqF7lQLs5F8ILmjSqVly9MbKuZxP8p', 'bot13@gmail.com', '$2y$10$JltxftTJlyOuVJEfsrpou..jJ/c335cPv2TmPGvCZSNeUpZGJWrbe', 'Peach', '1994-12-22', 'Kebbi', 'Jega', 'Female', 'Both Male & Female', '', 'mnRxOKKwY7QMHaDD7osD5Bmiy1IRhVpVIj7rH.jpg,aNEIFsMZDNtfaYVzPSUaOXdgS16WQsXwU4y4r.jpg', '2024-12-22 09:38:19'),
(15, 'Kfmy0OpOOYXQStHDR2WHt1fPItDlJ6', 'bot14@gmail.com', '$2y$10$gnxlX2CoupZYRysl4ka3Tew0ibMfPgqxwZ3GpPy/huO5HpEycloBe', 'Joy', '2001-12-22', 'Ogun', 'Ijebu Ode', 'Female', 'Both Male & Female', '', 'mAoV9KUdZrybUCrunGHB0AlL7QoZ3f1WlqbDA.jpg,DAfOR1ijzAvbjcw3cljLjYHYEh9VOul77sHGN.jpg', '2024-12-22 09:55:10'),
(16, 'Ld8v1vt0qIeiEuPzbJopD4BWkrTeJE', 'bot15@gmail.com', '$2y$10$6EVNNbp6trD3CwiOL/mFtuOWpj4NKyhL2jbEY80oWRxVq1fYGg5SK', 'Gift', '2002-12-22', 'Lagos', 'Surulere', 'Female', 'Male', '', '3usstvXMVHIlv79gJhaN7eXJ8cBvHqXpITTF4.jpg,pSuTa732hUxlqRXFYvHYlXjcVgJFBNzg2KwsN.jpg', '2024-12-22 10:03:11'),
(17, 'xnsa661M0XysprCSqT7FLRa7ANGqAs', 'bot16@gmail.com', '$2y$10$LY7XSoVI81Fq4LASPG3kxek1GI0PxadNpuH.8.MAtLPBIJHm.kkuK', 'Beatrice', '1991-12-22', 'Kaduna', 'Jaba', 'Female', 'Male', '', '7Eo8y2CsYhywD5zXwZF6pVoGiIHAssMtvuBhH.jpg,CgfSDYhkIqdGlqbHNdcT4rH79fU1Zm7imwBY4.jpg', '2024-12-22 10:09:42'),
(18, 'lgM0DgxaPsFvyy5sjKO8y05H1wrwHH', 'bot17@gmail.com', '$2y$10$9IceejsTGqpo3jj1q2mcfOP1k5Nnhm90qhG9WmIR9YZAVMjY2swqq', 'Bukola', '2006-12-22', 'Lagos', 'Surulere', 'Female', 'Both Male & Female', '', 'PvgJWw9PK2HZMM7RWFXzlWB15nFEfJsCeJthw.jpg,S0RiolWrQoIHovLSrL8AGoVbXtoj7TKEsTbLM.jpg', '2024-12-22 12:22:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
