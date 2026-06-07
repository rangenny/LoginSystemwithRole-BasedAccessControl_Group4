-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 05:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `artist` varchar(150) NOT NULL,
  `youtube_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`id`, `title`, `artist`, `youtube_link`) VALUES
(1, 'Shape of You', 'Ed Sheeran', 'https://www.youtube.com/watch?v=JGwWNGJdvx8'),
(2, 'Blinding Lights', 'The Weeknd', 'https://www.youtube.com/watch?v=4NRXx6U8ABQ'),
(3, 'Bohemian Rhapsody', 'Queen', 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ'),
(4, 'Believer', 'Imagine Dragons', 'https://www.youtube.com/watch?v=7wtfhZwyrcc'),
(5, 'Rolling in the Deep', 'Adele', 'https://www.youtube.com/watch?v=rYEDA3JcQqw'),
(6, 'Uptown Funk', 'Mark Ronson', 'https://www.youtube.com/watch?v=OPf0YbXqDm0'),
(7, 'Faded', 'Alan Walker', 'https://www.youtube.com/watch?v=60ItHLz5WEA'),
(8, 'Counting Stars', 'OneRepublic', 'https://www.youtube.com/watch?v=hT_nvWreIhg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$10$ja.S5pmMCBqWXAFLMwH61OuwfaYZh8Z3jmimm4093rdsN6OnS4in6', 'ADMIN'),
(2, 'user', '$2b$10$0UwtZlwYi//PtDCe0HrrqeaZMGo8wnFlBOsUs871BDGJuy7B7e2A6', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `music`
--
ALTER TABLE `music`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
