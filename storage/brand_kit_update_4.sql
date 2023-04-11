-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2023 at 05:30 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brand_kit`
--
UPDATE `business_card` SET image = 'card1.png' WHERE `id` = 1;
UPDATE `business_card` SET image = 'card2.png' WHERE `id` = 2;
UPDATE `business_card` SET image = 'card3.png' WHERE `id` = 3;
UPDATE `business_card` SET image = 'card4.png' WHERE `id` = 4;
UPDATE `business_card` SET image = 'card5.png' WHERE `id` = 5;
UPDATE `business_card` SET image = 'card6.png' WHERE `id` = 6;
UPDATE `business_card` SET image = 'card7.png' WHERE `id` = 7;
UPDATE `business_card` SET image = 'card8.png' WHERE `id` = 8;
UPDATE `business_card` SET image = 'card9.png' WHERE `id` = 9;
UPDATE `business_card` SET image = 'card10.png' WHERE `id` = 10;

ALTER TABLE `business_frame` ADD `business_sub_category_id` INT NULL AFTER `business_category_id`;
ALTER TABLE `poster_maker` ADD `poster_category_id` INT NOT NULL DEFAULT 1 AFTER `id`;
ALTER TABLE `business` ADD `business_category_id` INT NULL AFTER `user_id`;
INSERT INTO `users` (`name`, `email`, `mobile_no`, `image`, `user_type`, `login_type`, `is_subscribe`, `subscription_id`, `subscription_start_date`, `subscription_end_date`, `business_limit`, `email_verified_at`, `password`, `remember_token`, `referral_code`, `current_balance`, `total_balance`, `status`, `api_token`, `created_at`, `updated_at`, `deleted_at`) VALUES ('Demo', 'demo2023@gmail.com', 1234567890, '911065a3-c074-43db-9fae-c4f94a5d754a.png', 'Super Admin', 'normal', NULL, NULL, NULL, NULL, 1, '2022-08-29 10:31:54', '$2y$10$T6pwF2cMnVchBBCXjp.G4.zIDolVBib.RTD2SlwW2GCHC3Pn0SEYW', NULL, 'SKUA9AT748', 0, 0, 1, 'XL78OKDWUXuVbZpeQ5NtWcTRRwviKTc05oVATU6i4Qnta1XbDpZj2nI7k08v', '2022-08-29 10:31:54', '2022-12-10 09:04:13', NULL);
-- --------------------------------------------------------

--
-- Table structure for table `business_sub_category`
--

CREATE TABLE `business_sub_category` (
  `id` int(11) NOT NULL,
  `business_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `poster_category`
--

CREATE TABLE `poster_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poster_category`
--

INSERT INTO `poster_category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Business', 1, '2023-01-25 05:40:16', '2023-01-25 05:40:16');

--
-- Table structure for table `storage_setting`
--

CREATE TABLE `storage_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `storage_setting`
--

INSERT INTO `storage_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 'storage', 'local', '2023-01-03 08:34:37', '2023-01-24 05:46:00'),
(2, 'digitalOcean_space_name', null, '2023-01-03 08:34:58', '2023-01-24 05:46:00'),
(3, 'digitalOcean_key', null, '2023-01-03 08:35:25', '2023-01-24 05:46:00'),
(4, 'digitalOcean_secret', null, '2023-01-03 08:35:40', '2023-01-24 05:46:00'),
(5, 'digitalOcean_bucket_region', null, '2023-01-03 08:35:56', '2023-01-24 05:46:00'),
(6, 'digitalOcean_endpoint', null, '2023-01-03 08:36:10', '2023-01-24 05:46:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_sub_category`
--
ALTER TABLE `business_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poster_category`
--
ALTER TABLE `poster_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storage_setting`
--
ALTER TABLE `storage_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_sub_category`
--
ALTER TABLE `business_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `poster_category`
--
ALTER TABLE `poster_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

--
-- AUTO_INCREMENT for table `storage_setting`
--
ALTER TABLE `storage_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
