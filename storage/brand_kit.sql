-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2022 at 07:31 AM
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
-- Database: `test104`
--

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

CREATE TABLE `app_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'app_title', 'Brand Kit', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(2, 'author', 'Brand 365', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(3, 'description', '<p><span style=\"color: rgb(77, 81, 86); font-family: Poppins; font-size: 14px;\">Lorazepam, sold under the brand name Ativan among others, is a benzodiazepine medication. It is used to treat anxiety disorders, trouble sleeping, severe agitation, active seizures including status epilepticus, alcohol withdrawal, and chemotherapy-induced nausea and vomiting.</span><br></p>', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(4, 'app_version', '1.0.0', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(5, 'contact', '(+91) 9685748548', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(6, 'email', 'brand@gmail.com', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(7, 'website', 'www.brand365.com', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(8, 'developed_by', 'Illiptam Infotech', '2022-07-25 01:21:43', '2022-11-04 11:38:11', NULL),
(9, 'app_logo', '4a03a2d7-a0d9-4bad-ac17-9bf1c59cd39f.png', '2022-07-25 01:23:51', '2022-09-02 04:28:35', NULL),
(10, 'admin_favicon', 'cddf5e68-151c-4e54-b002-3107d51ee232.png', '2022-07-25 01:23:51', '2022-09-02 04:28:35', NULL),
(13, 'api_key', '123456', '2022-08-05 02:55:56', '2022-11-04 11:38:11', NULL),
(14, 'app_timezone', 'Asia/Calcutta', '2022-08-26 08:52:55', '2022-11-04 11:38:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_update_setting`
--

CREATE TABLE `app_update_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_update_setting`
--

INSERT INTO `app_update_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'update_popup_show', '1', '2022-07-26 03:42:27', '2022-07-27 06:44:11', NULL),
(2, 'new_app_version_code', '1.1.0', '2022-07-26 03:42:27', '2022-07-27 06:44:11', NULL),
(3, 'description', 'Our free mobile-friendly tool offers a variety of randomly generated keys and passwords you can use to secure any application, service or device. Simply click to copy a password or press the \'Generate\' button for an entirely new set.', '2022-07-26 03:42:27', '2022-07-27 06:44:11', NULL),
(4, 'app_link', 'https://play.google.com/store/apps/', '2022-07-26 03:42:27', '2022-07-27 06:44:11', NULL),
(5, 'cancel_option', '1', '2022-07-26 03:42:27', '2022-07-27 06:44:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `website` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_card`
--

CREATE TABLE `business_card` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_card`
--

INSERT INTO `business_card` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'vCard1', '89416d7d-406f-4687-8962-6215c2d85fa6.png', 1, '2022-10-22 04:31:25', '2022-10-22 05:40:48'),
(2, 'vCard2', 'fa891acf-3b58-4a69-a47e-9968b15ebb7c.png', 0, '2022-11-01 12:56:22', '2022-11-01 12:58:40'),
(3, 'vCard3', 'f725079f-3227-451f-95cc-b39a9eb850b2.png', 1, '2022-11-01 12:56:49', '2022-11-01 12:56:49'),
(4, 'vCard4', '079ac4be-766d-482d-8beb-f5344fe3bb17.png', 1, '2022-11-01 12:57:04', '2022-11-01 12:57:04'),
(5, 'vCard5', 'b6c83502-f82a-4da7-abe9-f633bd927506.png', 0, '2022-11-01 12:57:25', '2022-11-01 12:58:38'),
(6, 'vCard6', 'fa700981-161c-4bc5-b1d8-49c7879c83a9.png', 1, '2022-11-01 12:57:37', '2022-11-01 12:57:37'),
(7, 'vCard7', 'ba9245a3-327f-402e-b02c-664df3325764.png', 1, '2022-11-01 12:57:50', '2022-11-01 12:57:51'),
(8, 'vCard8', '126f9e11-4b1b-4913-99b7-bb986e392297.png', 1, '2022-11-01 12:58:07', '2022-11-01 12:58:43'),
(9, 'vCard9', '233cc03c-d629-49b8-9a69-491f129c9232.png', 1, '2022-11-01 12:58:20', '2022-11-01 12:58:20'),
(10, 'vCard10', '8e6d2cd4-7499-4a52-afc4-3aa247a037ac.png', 1, '2022-11-01 12:58:33', '2022-11-01 12:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `business_category`
--

CREATE TABLE `business_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `business_frame`
--

CREATE TABLE `business_frame` (
  `id` int(11) NOT NULL,
  `business_category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `frame_image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `paid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_frame`
--

CREATE TABLE `category_frame` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `frame_image` text DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `custom_frame`
--

CREATE TABLE `custom_frame` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `frame_image` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_post`
--

CREATE TABLE `custom_post` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_post_frame`
--

CREATE TABLE `custom_post_frame` (
  `id` int(11) NOT NULL,
  `custom_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `frame_image` varchar(255) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_setting`
--

CREATE TABLE `email_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_setting`
--

INSERT INTO `email_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'smtp_host', 'smtp.mailtrap.io', '2022-07-27 04:18:10', '2022-10-20 10:41:07', NULL),
(2, 'username', '9e2ac0ac04788f', '2022-07-27 04:18:10', '2022-10-20 10:41:07', NULL),
(3, 'password', 'e4f6fef9cb1512', '2022-07-27 04:18:10', '2022-10-20 10:41:07', NULL),
(4, 'encryption', 'tls', '2022-07-27 04:18:10', '2022-10-20 10:41:07', NULL),
(5, 'port', '2525', '2022-07-27 04:18:10', '2022-10-20 10:41:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_verify`
--

CREATE TABLE `email_verify` (
  `user_id` int(11) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_verify`
--

INSERT INTO `email_verify` (`user_id`, `code`, `created_at`) VALUES
(14, 'uqdtyePz472IMWqzOOOhZvP4UFQ3Ftt0OSd9yUvUzeqeREQAM73cjifkrNja', '2022-08-08 08:53:40'),
(15, 'hXzUNUruNT', '2022-08-08 09:07:15'),
(1, '1R2R42jeEF', '2022-08-08 09:33:22'),
(18, 'LPKcCg0chx', '2022-08-29 04:22:59'),
(2, '658328', '2022-10-22 09:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_post`
--

CREATE TABLE `feature_post` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `festival_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `festivals`
--

CREATE TABLE `festivals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `festivals_date` varchar(255) DEFAULT NULL,
  `activation_date` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `festivals_frame`
--

CREATE TABLE `festivals_frame` (
  `id` int(11) NOT NULL,
  `festivals_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `frame_image` text DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_10_202111_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2),
(8, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 2),
(9, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 2),
(10, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 2),
(11, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 2),
(12, 'App\\Models\\User', 1),
(12, 'App\\Models\\User', 2),
(14, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 2),
(15, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 2),
(16, 'App\\Models\\User', 1),
(16, 'App\\Models\\User', 2),
(17, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 2),
(18, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 2),
(19, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 2),
(20, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 2),
(22, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 2),
(23, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 2),
(24, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 2),
(25, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 2),
(26, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 2),
(27, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 2),
(28, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'one_signal_app_id', '955e2312-8a7f-45c8-9418-c58dc24b8632', '2022-07-26 01:48:19', '2022-07-28 04:52:06', NULL),
(2, 'one_signal_rest_key', 'FuRRpsteih9OWFccR58fx6zaynnjjlQE', '2022-07-26 01:48:19', '2022-07-28 04:52:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `other_setting`
--

CREATE TABLE `other_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `other_setting`
--

INSERT INTO `other_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'privacy_policy', '<p><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">A<b>&nbsp;</b></span><span style=\"color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px;\"><span style=\"font-family: Poppins;\">privacy policy</span></span><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">&nbsp;is a statement or legal document (in&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Privacy_law\" title=\"Privacy law\" style=\"text-decoration: none; color: rgb(6, 69, 173); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-weight: 400;\"><span style=\"font-family: Poppins;\">privacy law</span></a><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">) that discloses some or all of the ways a party gathers, uses, discloses, and manages a customer or client\'s data.</span><span style=\"font-family: Poppins; font-size: 11.2px; white-space: nowrap;\">&nbsp;</span><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">Personal information can be anything that can be used to identify an individual, not limited to the person\'s name, address, date of birth, marital status, contact information, ID issue, and&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Expiration_date\" title=\"Expiration date\" style=\"text-decoration: none; color: rgb(6, 69, 173); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-weight: 400;\"><span style=\"font-family: Poppins;\">expiry date</span></a><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">, financial records, credit information, medical history, where one travels, and intentions to acquire goods and services.</span><span style=\"font-family: Poppins; font-size: 11.2px; white-space: nowrap;\">&nbsp;</span><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">In the case of a business, it is often a statement that declares a party\'s policy on how it collects, stores, and releases personal information it collects. It informs the client what specific information is collected, and whether it is kept confidential, shared with partners, or sold to other firms or enterprises.</span><span style=\"color: rgb(32, 33, 34); font-family: Poppins; font-size: 14px;\">&nbsp;Privacy policies typically represent a broader, more generalized treatment, as opposed to data use statements, which tend to be more detailed and specific.</span><br></p>', '2022-07-26 03:56:26', '2022-07-27 06:44:57', NULL),
(2, 'refund_policy', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Lorame 2mg Tablet is taken by mouth with or without food. Take it at the same time each day as this helps to maintain a consistent level of medicine in the body. Take this medicine in the dose and duration as advised by your doctor as it has a high potential of habit-forming. If you have missed a dose, take it as soon as you remember it and finish the full course of treatment even if you feel better. It is important that this medication is not stopped suddenly without talking to the doctor as it may increase seizure frequency.</span><br></p>', '2022-07-26 03:56:32', '2022-07-26 04:09:59', NULL),
(3, 'terms_condition', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Lorame 2mg Tablet is a prescription medicine used to treat symptoms of short term anxiety and anxiety disorders. It helps to decrease the abnormal and excessive activity of the nerve cells and calms the brain.</span><br style=\"color: rgb(102, 102, 102); font-family: &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"></p>', '2022-07-26 03:56:35', '2022-07-26 04:09:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_setting`
--

CREATE TABLE `payment_setting` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_setting`
--

INSERT INTO `payment_setting` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'razorpay_key_id', 'D69276F266CB36E7173298272E342', '2022-07-26 02:00:23', '2022-07-27 06:44:04', NULL),
(2, 'razorpay_key_secret', '22144E7F1D322FCDE51CECF62EB6F', '2022-07-26 02:00:23', '2022-07-27 06:44:04', NULL),
(3, 'razorpay_enable', '0', '2022-07-26 02:01:37', '2022-07-27 06:44:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Language', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(2, 'Category', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(3, 'CategoryFrame', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(4, 'Festival', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(5, 'FestivalFrame', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(6, 'CustomCategory', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(7, 'CustomFrame', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(8, 'News', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(9, 'Stories', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(10, 'Users', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(11, 'Businesses', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(12, 'SubscriptionPlan', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(13, 'Transactions', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(14, 'Entry', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(15, 'Subject', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(16, 'Notification', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(17, 'UserRoleManagement', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(18, 'Settings', 'web', '2022-08-12 07:53:01', '2022-08-12 07:53:01'),
(19, 'BusinessCategory', 'web', '2022-08-13 06:45:47', '2022-08-13 06:45:47'),
(20, 'BusinessFrame', 'web', '2022-08-13 06:45:47', '2022-08-13 06:45:47'),
(21, 'Financial Statistics', 'web', '2022-08-13 07:38:11', '2022-08-13 07:38:11'),
(22, 'FinancialStatistics', 'web', '2022-08-13 07:38:39', '2022-08-13 07:38:39'),
(23, 'Video', 'web', '2022-10-11 04:58:42', '2022-10-11 04:58:42'),
(24, 'CouponCode', 'web', '2022-10-11 04:58:42', '2022-10-11 04:58:42'),
(25, 'BusinessCard', 'web', '2022-10-22 05:53:26', '2022-10-22 05:53:26'),
(26, 'StickerCategory', 'web', '2022-11-03 11:40:45', '2022-11-03 11:40:45'),
(27, 'Sticker', 'web', '2022-11-03 11:40:45', '2022-11-03 11:40:45'),
(28, 'Offer', 'web', '2022-11-04 06:42:14', '2022-11-04 06:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-08-12 07:57:11', '2022-08-12 07:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(25, 1),
(28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sticker`
--

CREATE TABLE `sticker` (
  `id` int(11) NOT NULL,
  `sticker_category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sticker_category`
--

CREATE TABLE `sticker_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE `story` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `story_type` varchar(255) DEFAULT NULL,
  `festival_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `custom_category_id` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `external_link_title` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan`
--

CREATE TABLE `subscription_plan` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_type` varchar(255) DEFAULT NULL,
  `plan_price` float(10,2) DEFAULT NULL,
  `discount_price` float(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `plan_detail` text DEFAULT NULL,
  `business_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` int(11) NOT NULL,
  `name` varchar(44) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `name`, `timezone`) VALUES
(1, '(GMT-11:00) Pacific/Midway ', 'Pacific/Midway'),
(2, '(GMT-11:00) Pacific/Samoa', 'Pacific/Samoa'),
(3, '(GMT-10:00) Pacific/Honolulu', 'Pacific/Honolulu'),
(4, '(GMT-09:00) America/Anchorage', 'America/Anchorage'),
(5, '(GMT-08:00) America/Los_Angeles', 'America/Los_Angeles'),
(6, '(GMT-08:00) America/Tijuana', 'America/Tijuana'),
(7, '(GMT-07:00) America/Chihuahua', 'America/Chihuahua'),
(9, '(GMT-07:00) America/Mazatlan', 'America/Mazatlan'),
(10, '(GMT-07:00) America/Denver', 'America/Denver'),
(11, '(GMT-06:00) America/Managua ', 'America/Managua'),
(12, '(GMT-06:00) America/Chicago', 'America/Chicago'),
(13, '(GMT-06:00) America/Mexico_City', 'America/Mexico_City'),
(15, '(GMT-06:00) America/Monterrey', 'America/Monterrey'),
(16, '(GMT-05:00) America/Bogota', 'America/Bogota'),
(17, '(GMT-05:00) America/New_York', 'America/New_York'),
(18, '(GMT-05:00) America/Lima', 'America/Lima'),
(20, '(GMT-04:00) Canada/Atlantic', 'Canada/Atlantic'),
(21, '(GMT-04:30) America/Caracas', 'America/Caracas'),
(22, '(GMT-04:00) America/La_Paz', 'America/La_Paz'),
(23, '(GMT-04:00) America/Santiago', 'America/Santiago'),
(24, '(GMT-03:30) America/St_Johns', 'America/St_Johns'),
(25, '(GMT-03:00) America/Sao_Paulo', 'America/Sao_Paulo'),
(26, '(GMT-03:00) America/Argentina/Buenos_Aires', 'America/Argentina/Buenos_Aires'),
(28, '(GMT-03:00) America/Godthab', 'America/Godthab'),
(29, '(GMT-02:00) America/Noronha ', 'America/Noronha'),
(30, '(GMT-01:00) Atlantic/Azores', 'Atlantic/Azores'),
(31, '(GMT-01:00) Atlantic/Cape_Verde ', 'Atlantic/Cape_Verde'),
(32, '(GMT+00:00) Africa/Casablanca', 'Africa/Casablanca'),
(33, '(GMT+00:00) Europe/London', 'Europe/London'),
(34, '(GMT+00:00) Europe/Dublin ', 'Europe/Dublin'),
(35, '(GMT+00:00) Europe/Lisbon', 'Europe/Lisbon'),
(37, '(GMT+00:00) Africa/Monrovia', 'Africa/Monrovia'),
(38, '(GMT+00:00) UTC ', 'UTC'),
(39, '(GMT+01:00) Europe/Amsterdam', 'Europe/Amsterdam'),
(40, '(GMT+01:00) Europe/Belgrade', 'Europe/Belgrade'),
(41, '(GMT+01:00) Europe/Berlin', 'Europe/Berlin'),
(43, '(GMT+01:00) Europe/Bratislava', 'Europe/Bratislava'),
(44, '(GMT+01:00) Europe/Brussels', 'Europe/Brussels'),
(45, '(GMT+01:00) Europe/Budapest', 'Europe/Budapest'),
(46, '(GMT+01:00) Europe/Copenhagen', 'Europe/Copenhagen'),
(47, '(GMT+01:00) Europe/Ljubljana', 'Europe/Ljubljana'),
(48, '(GMT+01:00) Europe/Madrid', 'Europe/Madrid'),
(49, '(GMT+01:00) Europe/Paris', 'Europe/Paris'),
(50, '(GMT+01:00) Europe/Prague', 'Europe/Prague'),
(51, '(GMT+01:00) Europe/Rome', 'Europe/Rome'),
(52, '(GMT+01:00) Europe/Sarajevo', 'Europe/Sarajevo'),
(53, '(GMT+01:00) Europe/Skopje', 'Europe/Skopje'),
(54, '(GMT+01:00) Europe/Stockholm', 'Europe/Stockholm'),
(55, '(GMT+01:00) Europe/Vienna', 'Europe/Vienna'),
(56, '(GMT+01:00) Europe/Warsaw', 'Europe/Warsaw'),
(57, '(GMT+01:00) Africa/Lagos', 'Africa/Lagos'),
(58, '(GMT+01:00) Europe/Zagreb', 'Europe/Zagreb'),
(59, '(GMT+02:00) Europe/Athens', 'Europe/Athens'),
(60, '(GMT+02:00) Europe/Bucharest', 'Europe/Bucharest'),
(61, '(GMT+02:00) Africa/Cairo', 'Africa/Cairo'),
(62, '(GMT+02:00) Africa/Harare', 'Africa/Harare'),
(63, '(GMT+02:00) Europe/Helsinki', 'Europe/Helsinki'),
(64, '(GMT+02:00) Europe/Istanbul', 'Europe/Istanbul'),
(65, '(GMT+02:00) Asia/Jerusalem', 'Asia/Jerusalem'),
(67, '(GMT+02:00) Africa/Johannesburg', 'Africa/Johannesburg'),
(68, '(GMT+02:00) Europe/Riga', 'Europe/Riga'),
(69, '(GMT+02:00) Europe/Sofia', 'Europe/Sofia'),
(70, '(GMT+02:00) Europe/Tallinn', 'Europe/Tallinn'),
(71, '(GMT+02:00) Europe/Vilnius', 'Europe/Vilnius'),
(72, '(GMT+03:00) Asia/Baghdad', 'Asia/Baghdad'),
(73, '(GMT+03:00) Asia/Kuwait', 'Asia/Kuwait'),
(74, '(GMT+03:00) Europe/Minsk', 'Europe/Minsk'),
(75, '(GMT+03:00) Africa/Nairobi', 'Africa/Nairobi'),
(76, '(GMT+03:00) Asia/Riyadh', 'Asia/Riyadh'),
(77, '(GMT+03:00) Europe/Volgograd', 'Europe/Volgograd'),
(78, '(GMT+03:30) Asia/Tehran', 'Asia/Tehran'),
(79, '(GMT+04:00) Asia/Muscat', 'Asia/Muscat'),
(80, '(GMT+04:00) Asia/Baku', 'Asia/Baku'),
(81, '(GMT+04:00) Europe/Moscow', 'Europe/Moscow'),
(82, '(GMT+04:00) Asia/Muscat', 'Asia/Muscat'),
(84, '(GMT+04:00) Asia/Tbilisi', 'Asia/Tbilisi'),
(85, '(GMT+04:00) Asia/Yerevan', 'Asia/Yerevan'),
(86, '(GMT+04:30) Asia/Kabul', 'Asia/Kabul'),
(87, '(GMT+05:00) Asia/Karachi', 'Asia/Karachi'),
(89, '(GMT+05:00) Asia/Tashkent', 'Asia/Tashkent'),
(90, '(GMT+05:30) Asia/Calcutta', 'Asia/Calcutta'),
(95, '(GMT+05:45) Asia/Katmandu', 'Asia/Katmandu'),
(96, '(GMT+06:00) Asia/Almaty', 'Asia/Almaty'),
(97, '(GMT+06:00) Asia/Dhaka', 'Asia/Dhaka'),
(99, '(GMT+06:00) Asia/Yekaterinburg', 'Asia/Yekaterinburg'),
(100, '(GMT+06:30) Asia/Rangoon', 'Asia/Rangoon'),
(101, '(GMT+07:00) Asia/Bangkok', 'Asia/Bangkok'),
(103, '(GMT+07:00) Asia/Jakarta', 'Asia/Jakarta'),
(104, '(GMT+07:00) Asia/Novosibirsk', 'Asia/Novosibirsk'),
(106, '(GMT+08:00) Asia/Chongqing', 'Asia/Chongqing'),
(107, '(GMT+08:00) Asia/Hong_Kong ', 'Asia/Hong_Kong'),
(108, '(GMT+08:00) Asia/Krasnoyarsk', 'Asia/Krasnoyarsk'),
(109, '(GMT+08:00) Asia/Kuala_Lumpur', 'Asia/Kuala_Lumpur'),
(110, '(GMT+08:00) Australia/Perth', 'Australia/Perth'),
(111, '(GMT+08:00) Asia/Singapore', 'Asia/Singapore'),
(112, '(GMT+08:00) Asia/Taipei', 'Asia/Taipei'),
(113, '(GMT+08:00) Asia/Ulan_Bator', 'Asia/Ulan_Bator'),
(114, '(GMT+08:00) Asia/Urumqi', 'Asia/Urumqi'),
(115, '(GMT+09:00) Asia/Irkutsk', 'Asia/Irkutsk'),
(116, '(GMT+09:00) Asia/Tokyo', 'Asia/Tokyo'),
(118, '(GMT+09:00) Asia/Seoul', 'Asia/Seoul'),
(120, '(GMT+09:30) Australia/Adelaide', 'Australia/Adelaide'),
(121, '(GMT+09:30) Australia/Darwin', 'Australia/Darwin'),
(122, '(GMT+10:00) Australia/Brisbane', 'Australia/Brisbane'),
(123, '(GMT+10:00) Australia/Canberra', 'Australia/Canberra'),
(124, '(GMT+10:00) Pacific/Guam', 'Pacific/Guam'),
(125, '(GMT+10:00) Australia/Hobart', 'Australia/Hobart'),
(126, '(GMT+10:00) Australia/Melbourne', 'Australia/Melbourne'),
(127, '(GMT+10:00) Pacific/Port_Moresby', 'Pacific/Port_Moresby'),
(128, '(GMT+10:00) Australia/Sydney', 'Australia/Sydney'),
(129, '(GMT+10:00) Asia/Yakutsk', 'Asia/Yakutsk'),
(130, '(GMT+11:00) Asia/Vladivostok', 'Asia/Vladivostok'),
(131, '(GMT+12:00) Pacific/Auckland', 'Pacific/Auckland'),
(132, '(GMT+12:00) Pacific/Fiji', 'Pacific/Fiji'),
(133, '(GMT+12:00) Pacific/Kwajalein', 'Pacific/Kwajalein'),
(134, '(GMT+12:00) Asia/Kamchatka', 'Asia/Kamchatka'),
(138, '(GMT+12:00) Asia/Magadan', 'Asia/Magadan'),
(139, '(GMT+12:00) Pacific/Auckland', 'Pacific/Auckland'),
(140, '(GMT+13:00) Pacific/Tongatapu', 'Pacific/Tongatapu');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `total_paid` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_subscribe` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_limit` int(11) DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `api_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_no`, `image`, `user_type`, `login_type`, `is_subscribe`, `subscription_id`, `subscription_start_date`, `subscription_end_date`, `business_limit`, `email_verified_at`, `password`, `remember_token`, `status`, `api_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'sunil@gmail.com', 9685747485, '3c992df7-41f8-4db3-9b04-1726185b362e.png', 'Super Admin', 'normal', NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$JPDFyE7ISnA0XC2BF0hSR.8toT2cXMo9TNh2vsk/ltEWC8SQKf6GC', 'iyPALypP4XIh7q6szAiCvHUtMfOpsdVvZUhSRxb9lA0yvcJ08bl7DSIfWx5r', 1, NULL, '2022-07-07 11:13:40', '2022-11-04 06:51:14', NULL),
(2, 'Demo', 'demo@gmail.com', 9685747485, '911065a3-c074-43db-9fae-c4f94a5d754a.png', 'Demo', 'normal', NULL, NULL, NULL, NULL, 1, '2022-08-29 10:31:54', '$2y$10$LIoFqXHyyKv0bdjlG.kxy.D9AS5XRIMNP10AlDFGUE3p88U0Gikdy', NULL, 1, 'plG1rZsLLZPhQkfbC7zXoFxmzOLBrJQ5eOOVPRHyFlbhPJPfRGAizWiFW68Z', '2022-08-29 10:31:54', '2022-08-31 12:28:05', NULL);

-- --------------------------------------------------------

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
-- Indexes for table `ads_setting`
--
ALTER TABLE `ads_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_setting`
--
ALTER TABLE `api_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_setting`
--
ALTER TABLE `app_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_update_setting`
--
ALTER TABLE `app_update_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_card`
--
ALTER TABLE `business_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_category`
--
ALTER TABLE `business_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_frame`
--
ALTER TABLE `business_frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_frame`
--
ALTER TABLE `category_frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_code_store`
--
ALTER TABLE `coupon_code_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_frame`
--
ALTER TABLE `custom_frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_post`
--
ALTER TABLE `custom_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_post_frame`
--
ALTER TABLE `custom_post_frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_setting`
--
ALTER TABLE `email_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feature_post`
--
ALTER TABLE `feature_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `festivals`
--
ALTER TABLE `festivals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `festivals_frame`
--
ALTER TABLE `festivals_frame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_setting`
--
ALTER TABLE `other_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_setting`
--
ALTER TABLE `payment_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sticker`
--
ALTER TABLE `sticker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticker_category`
--
ALTER TABLE `sticker_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `story`
--
ALTER TABLE `story`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_setting`
--
ALTER TABLE `ads_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `api_setting`
--
ALTER TABLE `api_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `app_setting`
--
ALTER TABLE `app_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `app_update_setting`
--
ALTER TABLE `app_update_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_card`
--
ALTER TABLE `business_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_category`
--
ALTER TABLE `business_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_frame`
--
ALTER TABLE `business_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_frame`
--
ALTER TABLE `category_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_code_store`
--
ALTER TABLE `coupon_code_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_frame`
--
ALTER TABLE `custom_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_post`
--
ALTER TABLE `custom_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_post_frame`
--
ALTER TABLE `custom_post_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_setting`
--
ALTER TABLE `email_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `entry`
--
ALTER TABLE `entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_post`
--
ALTER TABLE `feature_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `festivals`
--
ALTER TABLE `festivals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `festivals_frame`
--
ALTER TABLE `festivals_frame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_setting`
--
ALTER TABLE `other_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_setting`
--
ALTER TABLE `payment_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sticker`
--
ALTER TABLE `sticker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sticker_category`
--
ALTER TABLE `sticker_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `story`
--
ALTER TABLE `story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plan`
--
ALTER TABLE `subscription_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
