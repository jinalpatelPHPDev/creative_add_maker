-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2022 at 02:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
DROP TABLE `api_setting`;
--
-- Table structure for table `ads_setting`
--

CREATE TABLE `ads_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ads_setting`
--

INSERT INTO `ads_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 'ads_network', 'Admob', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(2, 'publisher_id', '33BE2250B43518CCDA7DE426D04EE231', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(3, 'banner_ads_id', 'ca-app-pub-3940256099942544/6300978111', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(4, 'app_open_ads_id', 'ca-app-pub-3940256099942544/3419835294', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(5, 'native_ads_id', 'ca-app-pub-3940256099942544/2247696110', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(6, 'interstitial_ads_id', 'ca-app-pub-3940256099942544/1033173712', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(7, 'interstitial_ads_click', '5', '2022-10-08 08:38:45', '2022-10-08 09:33:08'),
(8, 'banner_ads_enable', '1', '2022-10-08 08:39:45', '2022-10-08 09:33:08'),
(9, 'app_opens_ads_enable', '0', '2022-10-08 08:39:46', '2022-10-08 09:33:08'),
(10, 'native_ads_enable', '0', '2022-10-08 08:39:46', '2022-10-08 09:33:08'),
(11, 'interstitial_ads_enable', '1', '2022-10-08 08:39:46', '2022-10-08 09:33:08'),
(12, 'ads_enable', '1', '2022-10-08 09:33:08', '2022-10-08 09:33:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_setting`
--
ALTER TABLE `ads_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_setting`
--
ALTER TABLE `ads_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;


--
-- Table structure for table `api_setting`
--

CREATE TABLE `api_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_setting`
--

INSERT INTO `api_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 'category_order_type', 'name', '2022-09-24 04:26:17', '2022-10-08 10:46:02'),
(2, 'category_order_by', 'asc', '2022-09-24 04:26:17', '2022-10-08 10:46:02'),
(3, 'news_order_type', 'title', '2022-09-24 04:35:44', '2022-10-08 10:46:02'),
(4, 'news_order_by', 'asc', '2022-09-24 04:36:26', '2022-10-08 10:46:02'),
(5, 'festival_order_type', 'festivals_date', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(6, 'festival_order_by', 'asc', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(7, 'custom_order_type', 'name', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(8, 'custom_order_by', 'desc', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(9, 'business_order_type', 'created_at', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(10, 'business_order_by', 'asc', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(11, 'story_order_type', 'created_at', '2022-10-08 10:05:34', '2022-10-08 10:46:02'),
(12, 'story_order_by', 'asc', '2022-10-08 10:05:34', '2022-10-08 10:46:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_setting`
--
ALTER TABLE `api_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_setting`
--
ALTER TABLE `api_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `festival_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `business_category_id` int(11) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `paid` int(11) DEFAULT 1,
  `language_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


--
-- Table structure for table `coupon_code`
--

CREATE TABLE `coupon_code` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


--
-- Table structure for table `coupon_code_store`
--

CREATE TABLE `coupon_code_store` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon_code_store`
--
ALTER TABLE `coupon_code_store`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupon_code_store`
--
ALTER TABLE `coupon_code_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
