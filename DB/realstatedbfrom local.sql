-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2024 at 02:05 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realstatedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
CREATE TABLE IF NOT EXISTS `medias` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_12_31_152531_create_realstates_table', 1),
(7, '2023_12_31_212322_add_is_favorite_to_realstates_table', 2),
(8, '2024_01_01_114116_create_medias_table', 3),
(9, '2024_01_09_135010_add_category_to_realstates_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realstates`
--

DROP TABLE IF EXISTS `realstates`;
CREATE TABLE IF NOT EXISTS `realstates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realmodel` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periodtime` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `category` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFavorite` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `realstates`
--

INSERT INTO `realstates` (`id`, `name`, `desc`, `realmodel`, `periodtime`, `price`, `location`, `image`, `owner`, `userid`, `category`, `isFavorite`, `created_at`, `updated_at`) VALUES
(1, 'floor 1', '4 rooms', 'House', '12', '1000', '@33.5194136,36.3699879,14z', 'https://oras.orasweb.com/project/public/images/real/floor1.jpg', 'ahmad', NULL, 'Villa', 0, '2024-01-30 22:42:30', '2024-01-30 22:42:30'),
(2, 'Shop1', '300 meters', 'Shop', '12', '1000', '@33.5147579,36.3856735,17z', 'https://oras.orasweb.com/project/public/images/real/shop2.jpg', 'mahmod', NULL, 'Commercial', 0, '2024-01-30 22:43:30', '2024-01-30 22:43:30'),
(3, 'farm 2', '200 meters', 'Farm', '24', '2000', '@33.5156227,36.3868657,20z', 'https://oras.orasweb.com/project/public/images/real/farm1.jpg', 'Maher', NULL, 'Commercial', 0, '2024-01-30 22:44:30', '2024-01-30 22:44:30'),
(4, 'Ground1', '400 meters', 'Ground', '24', '3000', '@33.5157083,36.3861248,19z', 'https://oras.orasweb.com/project/public/images/real/ground1.jpg', 'samer', NULL, 'Apartment', 1, '2024-01-30 22:45:30', '2024-01-30 22:45:30'),
(5, 'Ground1', '400 meters', 'Ground', '24', '3000', '@33.5157083,36.3861248,19z', 'https://oras.orasweb.com/project/public/images/real/ground1.jpg', 'samer', NULL, 'Villa', 1, '2024-01-30 22:45:30', '2024-01-30 22:45:30'),
(6, 'floor 1', '4 rooms', 'House', '12', '1000', '@33.5194136,36.3699879,14z', 'https://oras.orasweb.com/project/public/images/real/floor1.jpg', 'ahmad', NULL, 'Villa', 0, '2024-01-30 22:42:30', '2024-01-30 22:42:30'),
(7, 'Shop1', '300 meters', 'Shop', '12', '1000', '@33.5147579,36.3856735,17z', 'https://oras.orasweb.com/project/public/images/real/shop2.jpg', 'mahmod', NULL, 'Commercial', 0, '2024-01-30 22:43:30', '2024-01-30 22:43:30'),
(8, 'farm 2', '200 meters', 'Farm', '24', '2000', '@33.5156227,36.3868657,20z', 'https://oras.orasweb.com/project/public/images/real/farm1.jpg', 'Maher', NULL, 'Commercial', 0, '2024-01-30 22:44:30', '2024-01-30 22:44:30'),
(9, 'Ground1', '400 meters', 'Ground', '24', '3000', '@33.5157083,36.3861248,19z', 'https://oras.orasweb.com/project/public/images/real/ground1.jpg', 'samer', NULL, 'Apartment', 1, '2024-01-30 22:45:30', '2024-01-30 22:45:30'),
(10, 'Ground1', '400 meters', 'Ground', '24', '3000', '@33.5157083,36.3861248,19z', 'https://oras.orasweb.com/project/public/images/real/ground1.jpg', 'samer', NULL, 'Villa', 1, '2024-01-30 22:45:30', '2024-01-30 22:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `maritalStatus` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `userName`, `mobile`, `nationality`, `gender`, `maritalStatus`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmad2', 'ahmad@gmail.com', NULL, '$2y$10$QgMvP81Hhqjc4b.6JwDIBO2lVKxOPJNp5WPEjPTMuld5ZbE7aXz5S', 'ahmad2', '09494994', 'uae', 1, 'marrid', 'https://oras.orasweb.com/project/media/users/870231.jpg', NULL, '2023-12-27 12:32:56', '2024-01-08 08:41:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
