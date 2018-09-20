-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2018 at 12:07 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `efatwa`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `bio` text,
  `photo` varchar(45) DEFAULT NULL,
  `cv` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `bio`, `photo`, `cv`) VALUES
(1, 'Dr. Hayu Prabowo', 'Ketua Lembaga Pemuliaan Lingkungan Hidup Dan Sumber Daya Alam MUI', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author_collection`
--

CREATE TABLE `author_collection` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author_collection`
--

INSERT INTO `author_collection` (`id`, `author_id`, `collection_id`, `created_at`, `updated_at`) VALUES
(1, 1, 14, '2018-09-10 15:32:37', '0000-00-00 00:00:00'),
(2, 1, 16, '2018-09-10 15:32:37', '0000-00-00 00:00:00'),
(3, 1, 17, '2018-09-10 15:32:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `type_id`) VALUES
(1, 'DSN', 'Fatwa dari Dewan Syariah Nasional', 1),
(2, 'LPPOM dan IPTEK', NULL, 1),
(3, 'Akidah dan Aliran Agama', NULL, 1),
(4, 'Ibadah', NULL, 1),
(5, 'Sosial Budaya', NULL, 1),
(6, 'Lingkungan Hidup', 'Buku lingkungan Hidup', 3);

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug` longtext NOT NULL,
  `content` text,
  `description` text,
  `filename` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `thumbnail` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `code`, `date`, `type_id`, `title`, `slug`, `content`, `description`, `filename`, `user_id`, `category_id`, `parent`, `thumbnail`, `created_at`, `updated_at`) VALUES
(8, '40 Tahun 2011', '2011-10-24', 1, 'BADAL THAWAF IFADHAH', 'badal-tawaf-ifadhah', '', 'Badal Thawaf Ifadhah adalah pelaksanaan thawaf ifadhah yang merupakan rukun haji yang dilakukankan oleh orang lain untuk menggantikan seseorang yang sedang berhaji karena sakit atau sebab lain.', '1483972025_No.-40-Badal-Tawaf-Ifadhah.pdf', 85, 4, NULL, '/photos/85/1 (2).jpg', '2017-01-09 00:27:05', '2018-09-10 15:57:11'),
(9, '22 Tahun 2011', '2011-05-26', 1, 'PERTAMBANGAN RAMAH LINGKUNGAN', 'pertambangan-ramah-lingkungan', '', 'Pertambangan adalah sebagian atau seluruh tahapan kegiatan dalam rangka penelitian, pengelolaan, dan pengusahaan mineral atau batubara, yang meliputi penyelidikan umum, eksplorasi, studi kelayakan, konstruksi, pertambangan, pengolahan, dan pemurnian, pengangkutan dan penjualan, serta kegiatan pascatambang.', '1483972103_No.-22-Pertambangan-Ramah-Lingkungan_final.pdf', 85, 5, NULL, '/photos/85/1 (1).jpg', '2017-01-09 00:28:23', '2018-09-10 15:57:14'),
(14, '9786025076701', '2018-09-09 10:00:55', 3, 'EcoMasjid : Dari Masjid Makmurkan Bumi', 'ecomasjid-dari-masjid-makmurkan-bumi', '<p style=\"text-align: justify;\">Masjid-masjid dibangun di tengah-tengah masyarakat tidak hanya sebagai tempat ibadah, tetap juga untuk menyatukan citacita spiritual umat Islam dengan cita-cita sosialnya membangun peradaban dalam masyarakat yang madani. Dalam masyarakat madani, antara masjid dengan aktivitas sehari-sehari masyarakat tidak terpisahkan, simbiosis mutualisme, saling terikat, saling menginspirasi dan saling mendinamisasi kehidupan. Kemampuan dan penempatan masjid, sebagai basis masyarakat madani inilah saat sekarang yang sering dan cenderung dilupakan, padahal tidak sedikit masjid yang hanya dijadikan sebagai sarana ibadah mahdah semata.</p>\r\n<p style=\"text-align: justify;\">Manusia sebagai khalifah di bumi mengemban amanah dan tanggung jawab untuk memakmurkan bumi seisinya. Islam merupakan rahmat bagi seluruh alam (rahmatan lil&lsquo;alamin). Islam yang kehadirannya ditengah kehidupan masyarakat harus mampu memberikan rahmat di dunia maupun di akhirat melalui kedamaian dan kasih sayang bagi bumi beserta seluruh makhluk hidupnya. Islam tidak hanya menaruh perhatian kepada persoalan spiritual dan interaksi dengan sesama, tapi juga menginspirasi umat untuk peduli kepada alam. Namun umat muslim sebagai potensi terbesar bangsa yang seharusnya menjadi&nbsp;subyek sekaligus obyek gerakan perlindungan dan pengelolaan lingkungan hidup dan sumber daya alam itu sendiri, justru masih kurang sadar akan hak serta kewajiban dalam hal pelestarian lingkungan hidup dan pengelolaan sumber daya alam. Pandangan dari mayoritas pakar lingkungan hidup bahwa tindakan praktis dan teknis perlindungan dan pengelolaan lingkungan hidup dan sumber daya alam dengan bantuan sains dan teknologi ternyata bukan solusi yang tepat, yang dibutuhkan adalah perubahan perilaku dan gaya hidup yang beretika. Krisis lingkungan hidup dengan berbagai manifestasinya, sejatinya adalah krisis moral, karena manusia memandang alam sebagai obyek bukan subyek dalam kehidupan semesta. Maka penanggulangan terhadap masalah yang ada haruslah dengan pendekatan moral. Pada titik inilah agama harus tampil berperan melalui bentuk tuntunan keagamaan serta direalisasikan dalam bentuk nyata dalam kehidupan sehari-hari umat manusia. Sesuai dengan peran masjid sebagai basis pembangunan masyarakat madani, masjid bukan hanya semata-mata dijadikan sarana ibadah mahdhah, melainkan ia menjadi sarana dan sekaligus kekuatan dalam membangun dan menanamkan nilai-nilai kebaikan dan pembaharuan kehidupan umat. Sehingga perubahan dalam konteks kebangsaan secara luas berupa perubahan terhadap nilai-nilai yang dibangun&nbsp;melalui basis masjid.</p>', 'Masjid-masjid dibangun di tengah-tengah masyarakat tidak hanya sebagai tempat ibadah, tetap juga untuk menyatukan citacita spiritual umat Islam dengan cita-cita sosialnya membangun peradaban dalam masyarakat yang madani. Dalam masyarakat madani, antara masjid dengan aktivitas sehari-sehari masyarakat tidak terpisahkan, simbiosis mutualisme, saling terikat, saling\r\nmenginspirasi dan saling mendinamisasi kehidupan. Kemampuan dan penempatan masjid, sebagai basis masyarakat madani inilah saat sekarang yang sering dan cenderung dilupakan, padahal tidak sedikit masjid yang hanya dijadikan sebagai sarana ibadah mahdah semata', '/files/shares/BUKU_ECOMASJID_Oleh_Dr_Hayu_Prabowo.pdf', 85, 6, NULL, '/photos/shares/ecomasjid.jpg', '2018-09-09 03:15:12', '2018-09-09 20:17:05'),
(16, '9786029947557', '2018-09-09 10:32:18', 3, 'Buku Air, Sanitasi dan Kesehatan Lingkungan menurut agama Islam', 'buku-air-sanitasi-dan-kesehatan-lingkungan-menurut-islam', '<p>Ajaran islam tentang air, sanitasi, kebersihan dan kesehatan lingkungan belum diketahui dandifahami oleh segenap lapisan umat, sehingga sering kali penyakit berjangkit disebabkan karena air yang tidak bersih dan sanitasi yang buruk. Oleh karena itu, diperlukan penyebarluasan pengetahuan dan pemahaman tentang air, sanitasi, kebersihan dan kesehatan lingkungan menurut ajaran Islam yang ditunjang dan dilengkapi dengan ilmu kesehatan. Umat Islam Indonesia, sebagai bagian terbesar dari rakyat Indonesia, merupakan golongan yang paling berkepentingan bagi terwujudnya hidup sehat wal afiat sebagai pengamalan ajaran islam.</p>', 'Ajaran islam tentang air, sanitasi, kebersihan dan kesehatan lingkungan belum diketahui dandifahami oleh segenap lapisan umat, sehingga sering kali penyakit berjangkit disebabkan karena air yang tidak bersih dan sanitasi yang buruk. Oleh karena itu, diperlukan penyebarluasan pengetahuan dan pemahaman tentang air, sanitasi, kebersihan dan kesehatan lingkungan menurut ajaran Islam yang ditunjang dan dilengkapi dengan ilmu kesehatan. Umat Islam Indonesia, sebagai bagian terbesar dari rakyat Indonesia, merupakan golongan yang paling berkepentingan bagi terwujudnya hidup sehat wal afiat sebagai pengamalan ajaran islam.', '/files/shares/Buku Air & Sanitasi Munas MUI.pdf', 85, 6, NULL, '/photos/shares/Buku-Air,-Sanitasi-dan-Kesehatan-Lingkungan-menurut-agama-Islam.jpg', '2018-09-09 03:38:02', '2018-09-09 20:17:08'),
(17, '9786029947595', '2018-09-09 13:46:06', 3, 'KHUTBAH JUMAT : Air, Kebersihan, Sanitasi dan Kesehatan Lingkungan menurut agama Islam', 'khutbah-jumat-air-kebersihan-sanitasi-dan-kesehatan-lingkungan-menurut-agama-islam', '<p>Alhamdulilah, segala puji syukur kita panjatkan ke hadirat Allah Subhanahu wa Ta&rsquo;ala karena atas taufik dan hidayah-Nya, buku Kumpulan Khutbah Jum&rsquo;at tentang Air, Kebersihan dan Kesehatan Lingkungan menurut Agama Islam akhirnya selesai disusun. Khutbah Jum&rsquo;at merupakan sarana atau media yang efektif untuk memberikan bimbingan dan tuntunan kepada umat dalam meningkatkan pengetahuan, pemahaman dan pengamalan ajaran Agama Islam terutama yang terkait dengan Air, Kebersihan dan Kesehatan Lingkungan.</p>', 'Alhamdulilah, segala puji syukur kita panjatkan ke hadirat Allah Subhanahu wa Ta’ala karena atas taufik dan hidayah-Nya, buku Kumpulan Khutbah Jum’at tentang Air, Kebersihan dan Kesehatan Lingkungan menurut Agama Islam akhirnya selesai disusun. Khutbah Jum’at merupakan sarana atau media yang efektif untuk memberikan bimbingan dan tuntunan kepada umat dalam meningkatkan pengetahuan, pemahaman dan pengamalan ajaran Agama Islam terutama yang terkait dengan Air, Kebersihan dan Kesehatan Lingkungan.', '/files/shares/Khutbah WASH.pdf', 85, 6, NULL, '/photos/shares/KHutbah-jumat-air-kebersihan-sanitasi-dan-kesehatan-lingkungan-menurut-agama-islam.jpg', '2018-09-09 06:51:43', '2018-09-09 20:52:19'),
(24, 'fat-001', '2018-09-03 00:00:00', 1, 'Fatwa Kebakaran hutan', 'fatwa-kebakaran-hutan', '<p>sdfsdffs fsf sf sf sf sf sfs</p>', 'sdfs fsdfsf fsfsd', '/files/shares/BUKU_ECOMASJID_Oleh_Dr_Hayu_Prabowo.pdf', 85, 5, NULL, '/photos/shares/KHutbah-jumat-air-kebersihan-sanitasi-dan-kesehatan-lingkungan-menurut-agama-islam.jpg', '2018-09-10 22:30:34', '2018-09-11 05:30:34');

--
-- Triggers `collections`
--
DELIMITER $$
CREATE TRIGGER `update_collection` BEFORE UPDATE ON `collections` FOR EACH ROW SET NEW.`updated_at` = NOW()
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `permission_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 'Superadmin', '2015-02-02 20:29:40', '2016-08-20 22:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `type` char(10) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `label`, `value`, `description`, `category`, `type`, `class`, `disabled`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Nama Situs', 'E-Fatwa', 'Pengaturan untuk nama situs atau halaman yang akan tampil di logo header', 'Umum', NULL, NULL, 0, '2016-08-20 08:45:36', '2016-10-09 15:47:27'),
(2, 'pt_name', 'Nama PT', 'Majelis Ulama Indonesia', 'Nama Perguruan tinggi yang muncul di situs', 'Umum', NULL, NULL, 0, '2016-08-20 08:45:36', '2016-10-21 21:56:23'),
(3, 'motto', 'Motto', 'Wadah Musyawarah Ulama', '', 'Umum', NULL, NULL, 0, '2016-08-20 08:45:36', '2016-09-10 19:41:56'),
(4, 'email_from', 'Email Pengirim', 'info@staibinamadani.ac.id', 'Alamat pengirim email notifikasi dari aplikasi', 'Email', NULL, NULL, 0, '2016-09-09 09:25:12', '2016-09-10 19:41:36'),
(5, 'penerima_notifikasi', 'Penerima Notikasi', 'digicrea08@gmail.com', 'Daftar alamat email untuk menerima email notifikasi dari aplikasi', 'Email', NULL, NULL, 0, '2016-09-09 10:58:54', '2016-12-23 15:06:10'),
(6, 'semester_aktif', 'Semester yg sekarang Aktif', '1', 'Nilai 1 untuk \"Ganjil\" dan Nilai 2 Untuk Genap', 'Akademik', NULL, NULL, 1, '2016-10-09 01:22:31', '2016-12-14 17:58:44'),
(7, 'TA_aktif', 'Tahun Akademik Aktif', '2', 'Tahun akademik yang sedang aktif sekarang', 'Akademik', 'list', '\\App\\Tahunakademik', 1, '2016-11-06 09:32:44', '2016-12-14 13:41:33'),
(8, 'kurikulum_aktif', 'Kurikulum Aktif', '2', '', 'Akademik', 'list', '\\App\\Kurikulum', 0, '2016-11-14 19:53:18', '2016-12-09 21:49:13'),
(9, 'min_bayar_kuliah_utk_kartu_ujian', 'Minimal bayar dapat kartu ujian', '75', 'Minimal Pembayaran kuliah utk dapat kartu ujian. masukkan nilainya saja tanpa %', 'Biaya', NULL, NULL, 0, '2016-11-21 10:16:50', '2016-11-22 00:17:39'),
(10, 'app_logo', 'Logo Aplikasi', 'Logo_MUI.png', '', 'Umum', NULL, NULL, 0, '2017-01-02 04:03:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `description`) VALUES
(1, 'Fatwa', NULL),
(2, 'Ijtima\'', NULL),
(3, 'Buku', NULL),
(4, 'Artikel', NULL);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `email`, `password`, `activated`, `activation_code`, `activated_at`, `last_login`, `reset_password_code`, `remember_token`, `first_name`, `last_name`, `api_token`, `created_at`, `updated_at`, `photo`) VALUES
(85, 2, 'admin', 'digicrea08@gmail.com', '$2y$10$dMcwvMlQ86utxn4XqkjL8eZsUJ/75yF/4rsxPn7qwRwZP3k9qkrGe', 1, NULL, NULL, NULL, 'DyIU8daVDV79KYftqqLVWpgXMFtbL2ww', 'D5JJAUC0myCxnPNEQajXltASDGQFDsWr91JXuTmFrY2Otv3beu1pVFLnOQAR', 'Admin', 'Super', '', '2016-11-27 05:29:35', '2017-01-09 14:28:38', '1483368029648cd749759267f65925c344b43e1613.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `author_collection`
--
ALTER TABLE `author_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`,`type_id`),
  ADD KEY `fk_categories_types1_idx` (`type_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`,`type_id`),
  ADD KEY `fk_collections_types_idx` (`type_id`),
  ADD KEY `category_id` (`category_id`);

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
  ADD KEY `idrole_2` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `author_collection`
--
ALTER TABLE `author_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
