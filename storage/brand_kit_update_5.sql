-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2023 at 10:32 AM
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
ALTER TABLE `custom_post_frame` ADD `custom_frame_type` varchar(255) NOT NULL DEFAULT "simple" AFTER `id`;
ALTER TABLE `custom_post_frame` ADD `zip_name` varchar(255) NULL AFTER `language_id`;

ALTER TABLE `feature_post` ADD `custom_id` INT NULL AFTER `festival_id`;

ALTER TABLE `subscription_plan` ADD `google_product_enable` INT NOT NULL DEFAULT 0 AFTER `plan_detail`;
ALTER TABLE `subscription_plan` ADD `google_product_id` varchar(255) NULL AFTER `google_product_enable`;

ALTER TABLE `transaction` ADD `status` varchar(255) NOT NULL DEFAULT "Completed" AFTER `payment_type`;
ALTER TABLE `transaction` ADD `payment_receipt` varchar(255) NULL AFTER `status`;
ALTER TABLE `transaction` ADD `referral_code` varchar(255) NULL AFTER `payment_receipt`;
-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_setting`
--

CREATE TABLE `whatsapp_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `whatsapp_setting`
--

INSERT INTO `whatsapp_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 'api_key', NULL, '2023-03-23 07:08:06', '2023-03-24 06:00:21'),
(2, 'instance_id', NULL, '2023-03-23 07:08:25', '2023-03-24 06:00:21');

--
-- Indexes for dumped tables
--

--
-- Table structure for table `whatsapp_message`
--

CREATE TABLE `whatsapp_message` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `btn1` varchar(255) DEFAULT NULL,
  `btn1_type` varchar(255) DEFAULT NULL,
  `btn1_value` varchar(255) DEFAULT NULL,
  `btn2` varchar(255) DEFAULT NULL,
  `btn2_type` varchar(255) DEFAULT NULL,
  `btn2_value` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `footer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for table `whatsapp_setting`
--
ALTER TABLE `whatsapp_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_message`
--
ALTER TABLE `whatsapp_message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `whatsapp_setting`
--
ALTER TABLE `whatsapp_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

--
-- AUTO_INCREMENT for table `whatsapp_message`
--
ALTER TABLE `whatsapp_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
