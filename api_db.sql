-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2019 at 06:52 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `year` int(11) NOT NULL,
  `imdb_id` varchar(15) NOT NULL,
  `type` text NOT NULL,
  `poster_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `imdb_id`, `type`, `poster_id`) VALUES
(1, 'The Matrix', 1999, 'tt0133093', 'movie', 1),
(2, 'The Matrix Reloaded', 2003, 'tt0234215', 'movie', 2),
(3, 'The Matrix Revolutions', 2003, 'tt0242653', 'movie', 3),
(4, 'The Matrix Revisited', 2001, 'tt0295432', 'movie', 4),
(5, 'Enter the Matrix', 2003, 'tt0277828', 'game', 5),
(6, 'The Matrix: Path of Neo', 2005, 'tt0451118', 'game', 6),
(7, 'Armitage III: Dual Matrix', 2002, 'tt0303678', 'movie', 7),
(8, 'CR: Enter the Matrix', 2009, 'tt1675286', 'game', 8),
(9, 'Sex and the Matrix', 2000, 'tt0274085', 'movie', 0),
(10, 'Buhera mátrix', 2007, 'tt0970173', 'movie', 9),
(22, 'The Matrix Revolutions: Super Burly Brawl', 2004, 'tt5325422', 'movie', 20),
(23, 'The Matrix Revolutions: Crew', 2004, 'tt5325428', 'movie', 0),
(24, 'The Matrix Revolutions: Hel', 2004, 'tt5325432', 'movie', 0),
(25, 'The Matrix Revolutions: New Blue World', 2004, 'tt5326032', 'movie', 21),
(26, 'The Matrix Revolutions: Siege', 2004, 'tt5326048', 'movie', 0),
(27, 'The Matrix Revolutions: Aftermath', 2004, 'tt5326066', 'movie', 0),
(28, 'Interviews from the Set of \'The Matrix Revolutions\'', 2003, 'tt5700122', 'movie', 0),
(29, 'The Matrix Revolutions: Behind the Scenes', 2003, 'tt5700150', 'movie', 0),
(30, 'From the Matrix to Revolutions: Behind the Scenes', 2003, 'tt5700280', 'movie', 0),
(42, 'Decoded: The Making of \'The Matrix Reloaded\'', 2003, 'tt1074193', 'movie', 0),
(43, 'The Matrix Reloaded: I\'ll Handle Them', 2004, 'tt5320148', 'movie', 32),
(44, 'The Matrix Reloaded: The Exiles', 2004, 'tt5320164', 'movie', 0),
(45, 'Tanjeria Acting Scene: Matrix Reloaded', 2013, 'tt3226954', 'movie', 0),
(46, 'The Matrix Reloaded: Pre-Load', 2003, 'tt5319604', 'movie', 0),
(47, 'The Matrix Reloaded: Get Me an Exit', 2003, 'tt5319618', 'movie', 0),
(48, 'The Matrix Reloaded: Car Chase', 2004, 'tt5319982', 'movie', 0),
(49, 'The Matrix Reloaded: Teahouse Fight', 2004, 'tt5319984', 'movie', 0),
(50, 'The Matrix Reloaded: Unplugged', 2004, 'tt5320126', 'movie', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posters`
--

CREATE TABLE `posters` (
  `id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posters`
--

INSERT INTO `posters` (`id`, `link`) VALUES
(8, 'http://ia.media-imdb.com/images/M/MV5BMTExMzY3NTQ1NjleQTJeQWpwZ15BbWU3MDAyMjk2NzM@._V1_SX300.jpg'),
(9, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMGZiNzdmYWUtZTY0ZS00ZGU4LWE1NDgtNTNkZWM3MzQ0NDY4L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjIzMDAwOTc@._V1_SX300.jpg'),
(32, 'https://m.media-amazon.com/images/M/MV5BMGZjNGQ4MmItM2MwZS00YWE1LThhNDQtN2RhY2QwNTk4YmVmXkEyXkFqcGdeQXVyODA1NjQ0OTY@._V1_SX300.jpg'),
(5, 'https://m.media-amazon.com/images/M/MV5BMjA4NTYwNjk0M15BMl5BanBnXkFtZTgwODk3MDMwMTE@._V1_SX300.jpg'),
(4, 'https://m.media-amazon.com/images/M/MV5BMTIzMTA4NDI4NF5BMl5BanBnXkFtZTYwNjg5Nzg4._V1_SX300.jpg'),
(21, 'https://m.media-amazon.com/images/M/MV5BMzM1YjIwNDQtODMyMy00YzQ5LTljZmYtNjI4MDIxNzE4ZWQwXkEyXkFqcGdeQXVyODA1NjQ0OTY@._V1_SX300.jpg'),
(3, 'https://m.media-amazon.com/images/M/MV5BNzNlZTZjMDctZjYwNi00NzljLWIwN2QtZWZmYmJiYzQ0MTk2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'),
(1, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(2, 'https://m.media-amazon.com/images/M/MV5BODE0MzZhZTgtYzkwYi00YmI5LThlZWYtOWRmNWE5ODk0NzMxXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
(20, 'https://m.media-amazon.com/images/M/MV5BOGVkNmY4MjQtZmI5Mi00ZDU1LWEzNjUtNDAwZWVjZTU3ZGY5XkEyXkFqcGdeQXVyODA1NjQ0OTY@._V1_SX300.jpg'),
(7, 'https://m.media-amazon.com/images/M/MV5BOTUwOTY3Mjg1MF5BMl5BanBnXkFtZTcwODI2MTAyMQ@@._V1_SX300.jpg'),
(6, 'https://m.media-amazon.com/images/M/MV5BYWM2ZWU5MDUtYTU2ZS00ZDFmLWIyNGEtNWZkMjRmZjI2YzMzXkEyXkFqcGdeQXVyMTA1OTEwNjE@._V1_SX300.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imdb_id` (`imdb_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `posters`
--
ALTER TABLE `posters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `posters`
--
ALTER TABLE `posters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
