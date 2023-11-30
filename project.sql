-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 28, 2023 at 01:57 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `concerts`
--

CREATE TABLE `concerts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `concerts`
--

INSERT INTO `concerts` (`id`, `user_id`, `name`, `venue`, `date`, `rating`, `description`) VALUES
(6, 1, 'G Herbo Concert', 'SIUC', '2022-04-22', '8.8', ''),
(7, 1, 'Machine Gun Kelly Concert', 'Enterprise Center', '2022-08-10', '8.7', ''),
(8, 1, 'Jordan Davis Concert', 'The Factory', '2023-09-30', '7.9', ''),
(9, 5, 'tes', '', '2023-11-28', '4.3', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `name`, `venue`, `date`, `rating`, `description`) VALUES
(28, 1, 'G Herbo Concert', 'SIUC', '2022-04-22', '8.8', ''),
(29, 1, 'Machine Gun Kelly Concert', 'Enterprise Center', '2022-08-10', '8.7', ''),
(30, 1, 'Jordan Davis Concert', 'The Factory', '2023-09-30', '7.9', ''),
(31, 5, 'testing', '', '2023-11-29', '1.1', ''),
(32, 5, 'tes', '', '2023-11-28', '4.3', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`) VALUES
(1, 'Logan Nitzsche', 'logannitzsche1@gmail.com', '$2y$10$Oj.0gWUSlktQtUvhWTJBG.sbTUQqmdLS16EIotoS/tAwpG9X/Md9O'),
(3, 'Kyle Nitzsche', 'nitzsche_80@gmail.com', '$2y$10$RL7vdF8DlCkmlkIE5yFomOyvcc.Uu8mj0WUF2qf.8V2as7PVLX3RK'),
(5, 'Logan Nitzsche', 'logan@gmail.com', '$2y$10$S4Xuk5ykIqfu.Utu.597YOGWqHUeY6jPF4TciflahZa3i.Qs7xuhi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `concerts`
--
ALTER TABLE `concerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `concerts`
--
ALTER TABLE `concerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `concerts`
--
ALTER TABLE `concerts`
  ADD CONSTRAINT `concerts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
