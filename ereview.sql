-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2020 at 12:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ereview`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id_assign` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `id_reviewer` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `tgl_assign` date DEFAULT NULL,
  `tgl_deadline` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_assign` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `editor`
--

CREATE TABLE `editor` (
  `id_reviewer` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_editor` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `editor`
--

INSERT INTO `editor` (`id_reviewer`, `id_user`, `nama`, `date_created`, `date_updated`, `sts_editor`) VALUES
(1, 2, '', '2020-03-28 08:35:31', '2020-03-28 08:35:31', 1),
(2, 5, '', '2020-03-28 14:26:07', '2020-03-28 14:26:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grup`
--

CREATE TABLE `grup` (
  `id_grup` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_grup` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grup`
--

INSERT INTO `grup` (`id_grup`, `nama`, `date_created`, `date_updated`, `sts_grup`) VALUES
(0, 'editor', '2020-03-12 05:56:08', '2020-03-12 05:57:48', 1),
(1, 'reviewer', '2020-03-12 05:56:08', '2020-03-12 05:57:48', 1),
(2, 'makelar', '2020-03-12 05:56:19', '2020-03-12 05:57:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `makelar`
--

CREATE TABLE `makelar` (
  `id_makelar` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_makelar` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `id_grup` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `id_grup`, `id_user`, `date_created`, `date_updated`) VALUES
(1, 0, 1, '2020-03-28 08:34:57', '2020-03-28 08:34:57'),
(2, 1, 2, '2020-03-28 08:35:31', '2020-03-28 08:35:31'),
(3, 2, 3, '2020-03-28 13:47:03', '2020-03-28 13:47:03'),
(4, 0, 4, '2020-03-28 14:24:29', '2020-03-28 14:24:29'),
(5, 1, 5, '2020-03-28 14:26:07', '2020-03-28 14:26:07'),
(6, 2, 6, '2020-03-28 14:30:26', '2020-03-28 14:30:26'),
(7, 2, 7, '2020-03-28 14:48:09', '2020-03-28 14:48:09'),
(8, 0, 8, '2020-03-29 00:18:42', '2020-03-29 00:18:42'),
(9, 0, 9, '2020-03-29 09:30:49', '2020-03-29 09:30:49'),
(10, 0, 10, '2020-03-29 09:34:04', '2020-03-29 09:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `amount` float NOT NULL,
  `bukti` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `id_task` int(11) NOT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_payment` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `id_reviewer` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `no_rek` int(11) NOT NULL,
  `kompetensi` text NOT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`id_reviewer`, `id_user`, `no_rek`, `kompetensi`, `date_created`, `date_updated`) VALUES
(1, 1, 0, '', '2020-03-28 08:34:57', '2020-03-28 08:34:57'),
(2, 3, 0, '', '2020-03-28 13:47:03', '2020-03-28 13:47:03'),
(3, 4, 0, '', '2020-03-28 14:24:29', '2020-03-28 14:24:29'),
(4, 6, 0, '', '2020-03-28 14:30:26', '2020-03-28 14:30:26'),
(5, 7, 0, '', '2020-03-28 14:48:09', '2020-03-28 14:48:09'),
(6, 8, 0, '', '2020-03-29 00:18:42', '2020-03-29 00:18:42'),
(7, 9, 0, '', '2020-03-29 09:30:49', '2020-03-29 09:30:49'),
(8, 10, 0, '', '2020-03-29 09:34:04', '2020-03-29 09:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id_task` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `authors` varchar(300) DEFAULT NULL,
  `keywords` varchar(300) DEFAULT NULL,
  `file_loc` varchar(300) DEFAULT NULL,
  `id_editor` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_uploaded` timestamp NULL DEFAULT NULL,
  `sts_task` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id_task`, `judul`, `authors`, `keywords`, `file_loc`, `id_editor`, `date_created`, `date_uploaded`, `sts_task`) VALUES
(1, 'judul', NULL, NULL, NULL, 0, '2020-02-28 08:27:39', NULL, 1),
(4, 'buku ke 1', NULL, 'buku, pertama, satu', NULL, 0, '2020-03-05 06:29:25', NULL, 1),
(5, 'buku ke 2', NULL, 'buku, kedua, dua', NULL, 0, '2020-03-05 06:31:53', NULL, 1),
(6, 'aa', NULL, 'aa', NULL, 0, '2020-03-26 02:01:40', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NULL DEFAULT NULL,
  `sts_user` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama`, `email`, `date_created`, `date_updated`, `sts_user`) VALUES
(1, 'hilmi', '827ccb0eea8a706c4c34a16891f84e7b', 'Hilmi', 'hilmi.muhammad.rmdhn@gmail.com', '2020-03-28 08:34:57', '2020-03-28 08:34:57', 1),
(2, 'mas', '827ccb0eea8a706c4c34a16891f84e7b', 'Mas', 'mas@admin.com', '2020-03-28 08:35:30', '2020-03-28 08:35:30', 1),
(3, 'putri', '827ccb0eea8a706c4c34a16891f84e7b', 'Putri', 'putri@admin.com', '2020-03-28 13:47:03', '2020-03-28 13:47:03', 1),
(4, 'mama', '827ccb0eea8a706c4c34a16891f84e7b', 'Mama', 'mama@gmail.com', '2020-03-28 14:24:29', '2020-03-28 14:24:29', 1),
(5, 'abi', '827ccb0eea8a706c4c34a16891f84e7b', 'abi', 'abi@gmail.com', '2020-03-28 14:26:07', '2020-03-28 14:26:07', 1),
(6, 'bucek', '827ccb0eea8a706c4c34a16891f84e7b', 'bucek', 'bucek@ymail.com', '2020-03-28 14:30:26', '2020-03-28 14:30:26', 1),
(7, 'anonim', '827ccb0eea8a706c4c34a16891f84e7b', 'anonim', 'anon@admin.com', '2020-03-28 14:48:09', '2020-03-28 14:48:09', 1),
(8, 'mamais', '827ccb0eea8a706c4c34a16891f84e7b', 'mamais', 'mamais@admin.com', '2020-03-29 00:18:42', '2020-03-29 00:18:42', 1),
(10, 'nesa', '827ccb0eea8a706c4c34a16891f84e7b', 'Nesa', 'nesa@gmail.com', '2020-03-29 09:34:04', '2020-03-29 09:34:04', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id_assign`);

--
-- Indexes for table `editor`
--
ALTER TABLE `editor`
  ADD PRIMARY KEY (`id_reviewer`);

--
-- Indexes for table `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`id_grup`);

--
-- Indexes for table `makelar`
--
ALTER TABLE `makelar`
  ADD PRIMARY KEY (`id_makelar`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`id_reviewer`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id_task`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id_assign` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `editor`
--
ALTER TABLE `editor`
  MODIFY `id_reviewer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grup`
--
ALTER TABLE `grup`
  MODIFY `id_grup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `makelar`
--
ALTER TABLE `makelar`
  MODIFY `id_makelar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `id_reviewer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
