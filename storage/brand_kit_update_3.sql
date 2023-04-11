-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2022 at 08:34 AM
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

ALTER TABLE `festivals_frame` ADD `height` INT NOT NULL DEFAULT 1024 AFTER `paid`;
ALTER TABLE `festivals_frame` ADD `width` INT NOT NULL DEFAULT 1024 AFTER `height`;
ALTER TABLE `festivals_frame` ADD `image_type` varchar(255) NOT NULL DEFAULT "square" AFTER `width`;
ALTER TABLE `festivals_frame` ADD `aspect_ratio` varchar(255) NOT NULL DEFAULT "1:1" AFTER `image_type`;

ALTER TABLE `category_frame` ADD `height` INT NOT NULL DEFAULT 1024 AFTER `paid`;
ALTER TABLE `category_frame` ADD `width` INT NOT NULL DEFAULT 1024 AFTER `height`;
ALTER TABLE `category_frame` ADD `image_type` varchar(255) NOT NULL DEFAULT "square" AFTER `width`;
ALTER TABLE `category_frame` ADD `aspect_ratio` varchar(255) NOT NULL DEFAULT "1:1" AFTER `image_type`;

ALTER TABLE `custom_post_frame` ADD `height` INT NOT NULL DEFAULT 1024 AFTER `paid`;
ALTER TABLE `custom_post_frame` ADD `width` INT NOT NULL DEFAULT 1024 AFTER `height`;
ALTER TABLE `custom_post_frame` ADD `image_type` varchar(255) NOT NULL DEFAULT "square" AFTER `width`;
ALTER TABLE `custom_post_frame` ADD `aspect_ratio` varchar(255) NOT NULL DEFAULT "1:1" AFTER `image_type`;

ALTER TABLE `business_frame` ADD `height` INT NOT NULL DEFAULT 1024 AFTER `paid`;
ALTER TABLE `business_frame` ADD `width` INT NOT NULL DEFAULT 1024 AFTER `height`;
ALTER TABLE `business_frame` ADD `image_type` varchar(255) NOT NULL DEFAULT "square" AFTER `width`;
ALTER TABLE `business_frame` ADD `aspect_ratio` varchar(255) NOT NULL DEFAULT "1:1" AFTER `image_type`;

ALTER TABLE `custom_frame` ADD `height` INT NOT NULL DEFAULT 1024 AFTER `status`;
ALTER TABLE `custom_frame` ADD `width` INT NOT NULL DEFAULT 1024 AFTER `height`;
ALTER TABLE `custom_frame` ADD `image_type` varchar(255) NOT NULL DEFAULT "square" AFTER `width`;
ALTER TABLE `custom_frame` ADD `aspect_ratio` varchar(255) NOT NULL DEFAULT "1:1" AFTER `image_type`;

ALTER TABLE `transaction` ADD `payment_type` varchar(255) NULL AFTER `payment_id`;

ALTER TABLE `users` ADD `referral_code` varchar(255) NULL AFTER `remember_token`;
ALTER TABLE `users` ADD `current_balance` BIGINT NOT NULL DEFAULT 0 AFTER `referral_code`;
ALTER TABLE `users` ADD `total_balance` BIGINT NOT NULL DEFAULT 0 AFTER `current_balance`;

ALTER TABLE `category_frame` MODIFY `paid` INT NOT NULL DEFAULT 0;
ALTER TABLE `festivals_frame` MODIFY `paid` INT NOT NULL DEFAULT 0;
ALTER TABLE `custom_post_frame` MODIFY `paid` INT NOT NULL DEFAULT 0;
ALTER TABLE `business_frame` MODIFY `paid` INT NOT NULL DEFAULT 0;
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `poster_maker`
--

CREATE TABLE `poster_maker` (
  `id` int(11) NOT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `zip_name` varchar(255) DEFAULT NULL,
  `post_thumb` varchar(255) DEFAULT NULL,
  `paid` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `earning_history`
--

CREATE TABLE `earning_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `amount_type` int(11) DEFAULT NULL,
  `refer_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `referral_register`
--

CREATE TABLE `referral_register` (
  `id` int(11) NOT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subscription` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `referral_system`
--

CREATE TABLE `referral_system` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `referral_system`
--

INSERT INTO `referral_system` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 'register_point', '100', '2022-12-10 04:58:26', '2022-12-23 04:53:43'),
(2, 'subscription_point', '50', '2022-12-10 04:58:26', '2022-12-23 04:53:43'),
(3, 'referral_system_enable', '0', '2022-12-22 06:06:27', '2022-12-23 04:53:43'),
(4, 'withdrawal_limit', '200', '2022-12-22 06:06:54', '2022-12-23 04:53:43');

--
-- Table structure for table `withdraw_request`
--

CREATE TABLE `withdraw_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `upi_id` varchar(255) DEFAULT NULL,
  `withdraw_amount` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poster_maker`
--
ALTER TABLE `poster_maker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earning_history`
--
ALTER TABLE `earning_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_register`
--
ALTER TABLE `referral_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_system`
--
ALTER TABLE `referral_system`
  ADD PRIMARY KEY (`id`);
  
--
-- Indexes for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `poster_maker`
--
ALTER TABLE `poster_maker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `earning_history`
--
ALTER TABLE `earning_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `referral_register`
--
ALTER TABLE `referral_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `referral_system`
--
ALTER TABLE `referral_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

--
-- AUTO_INCREMENT for table `withdraw_request`
--
ALTER TABLE `withdraw_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
