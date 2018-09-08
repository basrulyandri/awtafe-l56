-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2018 at 04:52 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbac-l53`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) NOT NULL,
  `label` varchar(100) NOT NULL,
  `name_permission` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `label`, `name_permission`, `created_at`, `updated_at`) VALUES
(7, 'Dashboard', 'dashboard.index', '2017-01-23 09:53:55', '2017-01-23 09:01:02'),
(8, 'dfsdfsd', 'fsdfsdf', '2017-01-23 10:14:20', '2017-01-23 16:14:20');

--
-- Triggers `permissions`
--
DELIMITER $$
CREATE TRIGGER `update_permission` BEFORE INSERT ON `permissions` FOR EACH ROW SET NEW.`updated_at` = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `permission_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(11, 2, 8, '2017-01-23 17:21:43', '2017-01-23 16:21:43'),
(12, 3, 7, '2018-05-09 14:44:50', '2018-05-09 21:44:50');

--
-- Triggers `permission_role`
--
DELIMITER $$
CREATE TRIGGER `update_permission_role` BEFORE INSERT ON `permission_role` FOR EACH ROW SET NEW.`updated_at` = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Superadmin', '2015-02-03 11:29:40', '2017-01-21 23:01:28'),
(3, 'Marketing', '2018-05-09 07:44:50', '2018-05-09 14:44:50');

--
-- Triggers `roles`
--
DELIMITER $$
CREATE TRIGGER `update_role` BEFORE UPDATE ON `roles` FOR EACH ROW SET NEW.`updated_at` = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `email`, `password`, `activated`, `activation_code`, `activated_at`, `last_login`, `reset_password_code`, `remember_token`, `first_name`, `last_name`, `api_token`, `about`, `address`, `phone`, `facebook_url`, `twitter_url`, `google_plus_url`, `created_at`, `updated_at`, `photo`) VALUES
(85, 2, 'admin', 'digicrea08@gmail.com', '$2y$10$dMcwvMlQ86utxn4XqkjL8eZsUJ/75yF/4rsxPn7qwRwZP3k9qkrGe', 1, NULL, NULL, NULL, 'DyIU8daVDV79KYftqqLVWpgXMFtbL2ww', 'DEwNtVJH7LiVw5U4yCOIwzz6M5HtILZSlM8Yaxl435ZvNrsaiNGXpWHDCggv', 'Basrul', 'Yandri', '', 'Seseorang yang baru tau kalau ternyata kita gak bisa garuk kuping pake sikut :D', 'Perumahan Maharaja Blok N5-12 Depok', '081290751101', 'https://www.facebook.com/digicrea', 'https://twitter.com/basrul14', 'https://plus.google.com/u/0/103471078199126216243', '2016-11-27 20:29:35', '2018-05-09 21:46:06', 'basrul.jpg'),
(86, 2, 'nana', 'nana@nana.com', 'nana', 1, NULL, NULL, NULL, NULL, NULL, 'Nana', 'Sukmawati', '', '', 'Jl. Jatinegara barat 142 No.1 Jakarta Timu', '085214789562', 'http://facebook.com/nana', 'http://twitter.com/nana', 'http://plus.google.com/nana', '2017-01-21 19:45:27', '0000-00-00 00:00:00', NULL),
(87, 2, 'lala', 'lala@lala.com', '$2y$10$TKdKTSwVOs.yLx1u2R9MzeTjd0euHeGxd9spUwpaLhErk1M9KXIt6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'YcRMJENayuBT3WeYLGpXr8pnwHvombpbTG9nOzlxgGJdMEQ1MCyb2dS2j6C0', NULL, 'Perumahan Maharaja Blok N5-12 Depok', '085301214565', NULL, NULL, NULL, '2017-01-21 15:25:20', '2017-01-21 14:25:20', '148500872001. DR. H.M SYAHRIAL YUSUF, SE., MM.jpg'),
(88, 2, 'baba', 'baba@baba.com', '$2y$10$lYShPM2ZJXEuyVOZTlcrquo2raE1krFx1mhqJRpY2SEqUd.LVS8N.', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NuN7SMU73ILUzbCcvUfnrNFObRRHR6l6Y46Zq4T1OEBGd50UeoddZ29RJ45R', 'Aq adalah anak gembala selalu riang serta gembira . Jeng jeng', 'Perumahan Maharaja Blok N5-12 Depok', '0812456889855', 'http://rolloic.com', 'http://rolloic.com', 'http://rolloic.com', '2017-01-21 15:33:01', '2017-01-21 14:33:01', '14850091811 (1).jpg'),
(89, 3, 'lili', 'lili@lili.com', '$2y$10$dPaJAe7Tgcou8G2hzy2JHOLZgl6Rq56Tus/Mfkh/gro53OFC84LwO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DRUogQwxgcddJLdfjlpyuul5PnZgLr6GRNBUTi01dTRsJI1S4OmvFFVyL6Mu', 's`', NULL, '213', '#', '#', '#', '2018-05-09 07:46:02', '2018-05-09 14:46:02', NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_user` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.`updated_at` = NOW()
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idgroup` (`role_id`,`permission_id`),
  ADD KEY `idpermission` (`permission_id`),
  ADD KEY `idrole` (`role_id`),
  ADD KEY `idpermission_2` (`permission_id`),
  ADD KEY `idrole_2` (`role_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`),
  ADD KEY `idgroup` (`role_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `role_id_2` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
