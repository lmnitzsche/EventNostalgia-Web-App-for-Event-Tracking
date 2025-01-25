-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 25, 2025 at 06:46 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u545255404_en`
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
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `concerts`
--

INSERT INTO `concerts` (`id`, `user_id`, `name`, `venue`, `date`, `rating`, `description`) VALUES
(6, 1, 'G Herbo Concert', 'SIUC', '2022-04-22', 8.8, ''),
(7, 1, 'Machine Gun Kelly Concert', 'Enterprise Center', '2022-08-10', 8.7, ''),
(8, 1, 'Jordan Davis Concert', 'The Factory', '2023-09-30', 7.9, ''),
(11, 8, 'Taylor Swift Concert', 'Madison Square Garden', '2023-09-11', 8.5, ''),
(12, 8, 'Blink 182 Concert', 'Sofi Stadium', '2024-02-21', 7.9, ''),
(14, 9, 'Taylor Swift Concert', 'Madison Square Garden', '2024-02-05', 7.6, ''),
(15, 9, 'Drake Concert', 'Busch Stadium', '2024-02-17', 7.3, '');

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
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `name`, `venue`, `date`, `rating`, `description`) VALUES
(28, 1, 'G Herbo Concert', 'SIUC', '2022-04-22', 8.8, ''),
(29, 1, 'Machine Gun Kelly Concert', 'Enterprise Center', '2022-08-10', 8.7, ''),
(30, 1, 'Jordan Davis Concert', 'The Factory', '2023-09-30', 7.9, ''),
(35, 8, 'Taylor Swift Concert', 'Madison Square Garden', '2023-09-11', 8.5, ''),
(36, 8, 'Blink 182 Concert', 'Sofi Stadium', '2024-02-21', 7.9, ''),
(37, 8, 'Eagles v. Chiefs', 'Arrowhead Stadium', '2022-09-12', 7.6, ''),
(38, 8, 'Thunder v. Warriors', 'Paycom Center', '2024-02-20', 5.6, ''),
(41, 9, 'Taylor Swift Concert', 'Madison Square Garden', '2024-02-04', 8.7, ''),
(42, 9, 'Taylor Swift Concert', 'Madison Square Garden', '2024-02-05', 7.6, ''),
(43, 9, 'Drake Concert', 'Busch Stadium', '2024-02-17', 7.3, ''),
(44, 9, 'Cardinals v. Cubs', '', '2024-06-12', 8.6, ''),
(45, 1, 'USA V. Uzbekistan', 'St Louis City Park', '2023-09-09', 6.6, ''),
(47, 13, 'Dean Ambrose V. Kofi Kingston for the United States Championship', 'St Louis Extreme Rules', '2013-05-19', 8.9, 'Ambrose Wins his first championship and goes on to become longest reigning US champion since the WWE acquired the title'),
(48, 13, 'Alberto Del Rio V. Jack Swagger in an \"I Quit\" Match', 'St Louis Extreme Rules', '2013-05-19', 7.2, 'Del Rio makes Swagger quit to become the #1 contender for the World Heavyweight championship after the referee restarts the match'),
(50, 13, 'Katilyn V. AJ Lee', '', '2024-03-18', 6.9, ''),
(51, 18, 'svkj sd', '', '2024-09-26', 2.0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`) VALUES
(1, 'Logan Nitzsche', 'logannitzsche1@gmail.com', '$2y$10$Sg09ykJMkJf9v.ENtqF9IuB0gZvjv4C.gDIFLZb1CfvgeAwrWk7Uq'),
(8, 'ted mosby', 'tedmosby@gmail.com', '$2y$10$zRac/fdc9PtiEk8qwKZkMuyugezCfaHAPIA0yZnemNSBB7HRnQO9m'),
(9, 'Test User', 'testuser123@gmail.com', '$2y$10$3kuqsJOGY9BFPGRIzbKGM.UoP1uVR3qvsyZDMnpPDIg1NlXaZ7Dt6'),
(10, 'sbrunaugh', 'brunaughs@gmail.com', '$2y$10$uem9Z7oPBWT2UVENsxJ.m.kZ9KNoL/IiS8NUpsKGQs3wCMb4IKVia'),
(11, 'Jimmy Weddington', 'Jweddington@gmail.com', '$2y$10$hChgLkQt3XVYqVJQKt9tq.KYQ5fP19csjDw0izb4X7T2ffR4q7KA.'),
(12, 'Sophie Davie', 'sophiedavie5@gmail.com', '$2y$10$m71EqBGkV1WpwaLG4HRTCOyGALbL9OD1UCnyUJGJo6TuvJ9/CI0jC'),
(13, 'Logan Nitzsche', 'logannitzsche@nostalgictechnologies.com', '$2y$10$9sw7dSYDY/woVmGKw4BqeO9IP/5t6IF2oqiLVLrnwYLM/vFlDLD0u'),
(14, 'Admin', 'support@nostalgictechnologies.com', '$2y$10$0Zs9j0Qm.8to6DQo9mudqOWIdWj8BRTw9xg3cB4R2KEe7Uv9ubblC'),
(15, 'Kyle Nitzsche', 'nitzsche9@gmail.com', '$2y$10$f7adCSpo1PoFg0Evu6mroudPN.DCkApEk5Mrz9LMCUBHOmFkQTLWS'),
(16, 'WMgOgituD!', 'edward_tiradokkga@outlook.com', '$2y$10$eDwCPe3YpqwvzrC1mR523.RDRY1KHD/jP2RezvxJ0U//wn37HiWuG'),
(17, 'xfLisNQvKPZB', 'victor5u_thomasda@outlook.com', '$2y$10$NrKejxzoaW2cF8iDar3Z7OG1r61hkG7Ist1pTOU3eQT1RcEuaFyOK'),
(18, 'Luke Welsh', 'lwelsh@yahoo.com', '$2y$10$KTHs9CTvE1O1VFH8uTSKYemikHHolHqcBhehldO3trqAO9cg40Hgm'),
(19, 'jkvNxOZhzAxoEae', 'darby_longdong@yahoo.com', '$2y$10$ZFCXx5uEKdiGa9zgFmc5xeuQQzg2cK5dcynyVSrWRxdciCc7Au13q'),
(20, 'ZnpALRex', 'inigohodgesz46@gmail.com', '$2y$10$VXdtDcFclsI7PsDTdIe4r.36mUs4rxnrCGArEBlKlAsSvB7CkmzcK'),
(21, 'tEUeKXMySHb', 'coxrachel9161@yahoo.com', '$2y$10$p24/ZirMP5dSlF0aVbC78uekNHo6lRy1TvBQJenRYD0hc4QbJjudS'),
(22, 'TpmNCJqrBXpQou', 'tvaughank1999@gmail.com', '$2y$10$dcL/ZdzuLKpdcKB6uaFLQuNSNm79IcijiclM3OE2A5G7dSZtchUHa'),
(23, 'zWKgJuaansOyIO', 'hayelpac@yahoo.com', '$2y$10$In6jX8Wov1M3SJJuHnsWcO8xyuDs2AvhVYHFVBO..bV2krK/0Lsmm'),
(24, 'JnxcAcRN', 'charlzknox@gmail.com', '$2y$10$mVfhN3AXo4XHH2/XngOZFubu9rdlX4fmaIH6Lf2WNZpWHCvxYsl/K'),
(25, 'hoBpqDJSlCSpIif', 'renitasvb1980@gmail.com', '$2y$10$xld2.pthhe5le1y78OBb0OfWkoVWvczFCBcLOkUHWZPT5etdwMM/.'),
(26, 'NZSRmncDLNEC', 'rxljtpsuvwe@yahoo.com', '$2y$10$SMXingb5YGVJJ3/MYORoteJwcWA0fpc.qeK0BaWgPJt0pQ5x4q8QW'),
(27, 'DYxVjVZnTBaMT', 'bertinaab31@gmail.com', '$2y$10$YranYpIvx/r/uUe1sr1YueX8vu2DXMCr3IavQMSbqjQi0MsgFtFEi'),
(28, 'cWIPtPtqfCgiJ', 'dario.1955@yahoo.com', '$2y$10$KGb7kyY.87sxN/W5I./pceWA7V.M8kvrM315XmVzbRwELAZ69poJW'),
(29, 'AwLHAbKPTsDNIK', 'vqunh17@yahoo.com', '$2y$10$6paJrPwH7MduI3oQnf2f9u4q.HHXI0ZKIBuqKiYgglq4xvukwiZiq'),
(30, 'XDrcZDSpV', 'ravnlyednorowicz@yahoo.com', '$2y$10$shFZVDZWJ7PBpTyH0Bc4t.Q1KHTtL0oLLewamc1bcJbvC8OFDjCuS'),
(31, 'rdxdEILGQEU', 'xvrppbbacac@yahoo.com', '$2y$10$DZsW/71Gu9uD5qKEO/N0e.BaZ5hoJHoLSf7788Ge4N.ahVkYCcqv2'),
(32, 'BMTSnLUVSKO', 'semsrhorcxa@yahoo.com', '$2y$10$8DP48dwh8IrkSzcRhoZx0.NmPJRWN8TU.OrknHnk5w8yFLOkZOSwy'),
(33, 'wwjLJPHcfRpCZ', 'icccgntuu@yahoo.com', '$2y$10$NFyeq5e1ejD9AXawM0BLU.ZZYom4LGM1fVx6FDtYMlP3gWp/GvbVy'),
(34, 'oNBrtsLvcxiVKaE', 'awelapag62@gmail.com', '$2y$10$Zh1r3HSujCJNGG0.o9bF3ujrRcFOEmlveH6YmwJKATUtY/Ll6bkjy'),
(35, 'uVmFHaLvSVGhk', 'stoutenbaechle@yahoo.com', '$2y$10$0of.QI6VcvePUXU0s5YYnOHOY3Y8YkN4sHHVC0eW2f3/u8xosNdc6');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
