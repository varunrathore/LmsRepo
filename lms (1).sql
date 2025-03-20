-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2022 at 10:53 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting`
--

CREATE TABLE `accounting` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `meeting_time_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribe_id` int(10) UNSIGNED DEFAULT NULL,
  `promotion_id` int(10) UNSIGNED DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `tax` tinyint(1) NOT NULL DEFAULT 0,
  `amount` decimal(13,2) DEFAULT NULL,
  `type` enum('addiction','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_account` enum('income','asset','subscribe','promotion') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_type` enum('automatic','manual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'automatic',
  `referred_user_id` int(10) UNSIGNED DEFAULT NULL,
  `is_affiliate_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_affiliate_commission` tinyint(1) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `advertising_banners`
--

CREATE TABLE `advertising_banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` enum('home1','home2','course','course_sidebar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 12,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `advertising_banners_translations`
--

CREATE TABLE `advertising_banners_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `advertising_banner_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` int(10) UNSIGNED NOT NULL,
  `affiliate_user_id` int(10) UNSIGNED NOT NULL,
  `referred_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_codes`
--

CREATE TABLE `affiliates_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliates_codes`
--

INSERT INTO `affiliates_codes` (`id`, `user_id`, `code`, `created_at`) VALUES
(1, 2, '486840', 1635087854);

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('register_date','course_count','course_rate','sale_count','support_rate') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `badge_translations`
--

CREATE TABLE `badge_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `badge_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `become_instructors`
--

CREATE TABLE `become_instructors` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','accept','reject') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_count` int(10) UNSIGNED DEFAULT 0,
  `enable_comment` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('pending','publish') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) UNSIGNED NOT NULL,
  `updated_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `category_id`, `author_id`, `slug`, `image`, `visit_count`, `enable_comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sample-Blog-Post', '/store/1/default_images/blogs/blog2.jpg', 2, 1, 'publish', 1635087311, 1635105509);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `title`, `slug`) VALUES
(1, 'Sample Blog Category', 'Sample-Blog-Category');

-- --------------------------------------------------------

--
-- Table structure for table `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_translations`
--

INSERT INTO `blog_translations` (`id`, `blog_id`, `locale`, `title`, `description`, `content`, `meta_description`) VALUES
(1, 1, 'en', 'Sample Blog Post', '<p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. </p>', '<p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. </p>', 'SEO Meta Description');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `reserve_meeting_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribe_id` int(10) UNSIGNED DEFAULT NULL,
  `promotion_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `special_offer_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `icon`, `order`) VALUES
(1, NULL, '/store/1/default_images/categories_icons/feather.svg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `title`) VALUES
(1, 1, 'en', 'Category title');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `quiz_result_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `user_grade` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `certificates_templates`
--

CREATE TABLE `certificates_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_x` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_y` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_size` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_template_translations`
--

CREATE TABLE `certificate_template_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `certificate_template_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `blog_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `viewed_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `comments_reports`
--

CREATE TABLE `comments_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED DEFAULT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `course_learning`
--

CREATE TABLE `course_learning` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text_lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `session_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int(10) UNSIGNED DEFAULT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `type` enum('all_users','special_users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `expired_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `discount_users`
--

CREATE TABLE `discount_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `discount_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `creator_id`, `webinar_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, 1635063643, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `locale`, `title`, `answer`) VALUES
(1, 1, 'en', 'What is the course level?', 'This is a course for beginners so you will get familiar with the topic from scratch.');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `feature_webinars`
--

CREATE TABLE `feature_webinars` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `page` enum('categories','home','home_categories') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `feature_webinar_translations`
--

CREATE TABLE `feature_webinar_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_webinar_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `downloadable` tinyint(1) DEFAULT 0,
  `storage` enum('local','online') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `creator_id`, `webinar_id`, `chapter_id`, `accessibility`, `downloadable`, `storage`, `file`, `volume`, `file_type`, `order`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 1, 'free', 0, 'local', '/store/2/Effective Time Management.mkv', '1.59 MB', 'mkv', 1, 'active', 1635063459, NULL, NULL),
(2, 2, 1, 1, 'free', 0, 'online', 'https://youtu.be/stCgIkoqYto', '20.00 MB', 'video', 2, 'active', 1635063533, NULL, NULL),
(3, 2, 1, 1, 'free', 0, 'online', 'https://vimeo.com/376310924', '20.00 MB', 'video', 3, 'active', 1635063576, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_translations`
--

CREATE TABLE `file_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_translations`
--

INSERT INTO `file_translations` (`id`, `file_id`, `locale`, `title`, `description`) VALUES
(1, 1, 'en', 'Test file', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.'),
(2, 2, 'en', 'Test Youtube', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.'),
(3, 3, 'en', 'Test vimeo', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.');

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `filter_options`
--

CREATE TABLE `filter_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `filter_option_translations`
--

CREATE TABLE `filter_option_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filter_option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filter_translations`
--

CREATE TABLE `filter_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `follower` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('requested','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_users`
--

CREATE TABLE `group_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_times`
--

CREATE TABLE `meeting_times` (
  `id` int(10) UNSIGNED NOT NULL,
  `meeting_id` int(10) UNSIGNED NOT NULL,
  `day_label` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_08_09_145553_create_roles_table', 1),
(4, '2020_08_09_145834_create_sections_table', 1),
(5, '2020_08_09_145926_create_permissions_table', 1),
(6, '2020_08_24_163003_create_webinars_table', 1),
(7, '2020_08_24_164823_create_webinar_partner_teacher_table', 1),
(8, '2020_08_24_165658_create_tags_table', 1),
(9, '2020_08_24_165835_create_webinar_tag_table', 1),
(10, '2020_08_24_171611_create_categories_table', 1),
(11, '2020_08_29_052437_create_filters_table', 1),
(12, '2020_08_29_052900_create_filter_options_table', 1),
(13, '2020_08_29_054455_add_category_id_in_webinar_table', 1),
(14, '2020_09_01_174741_add_seo_description_and_start_end_time_in_webinar_table', 1),
(15, '2020_09_02_180508_create_webinar_filter_option_table', 1),
(16, '2020_09_02_193923_create_tickets_table', 1),
(17, '2020_09_02_210447_create_sessions_table', 1),
(18, '2020_09_02_212642_create_files_table', 1),
(19, '2020_09_03_175543_create_faqs_table', 1),
(20, '2020_09_08_175539_delete_webinar_tag_and_update_tag_table', 1),
(21, '2020_09_09_154522_create_quizzes_table', 1),
(22, '2020_09_09_174646_create_quizzes_questions_table', 1),
(23, '2020_09_09_182726_create_quizzes_questions_answers_table', 1),
(24, '2020_09_14_160028_create_prerequisites_table', 1),
(25, '2020_09_14_183235_nullable_item_id_in_quizzes_table', 1),
(26, '2020_09_14_190110_create_webinar_quizzes_table', 1),
(27, '2020_09_16_163835_create_quizzes_results_table', 1),
(28, '2020_09_24_102115_add_total_mark_in_quize_table', 1),
(29, '2020_09_24_132242_create_comment_table', 1),
(30, '2020_09_24_132639_create_favorites_table', 1),
(31, '2020_09_26_181200_create_certificate_table', 1),
(32, '2020_09_26_181444_create_certificates_templates_table', 1),
(33, '2020_09_30_170451_add_slug_in_webinars_table', 1),
(34, '2020_09_30_191202_create_purchases_table', 1),
(35, '2020_10_02_063828_create_rating_table', 1),
(36, '2020_10_02_094723_edit_table_and_add_foreign_key', 1),
(37, '2020_10_08_055408_add_reviwes_table', 1),
(38, '2020_10_08_084100_edit_status_comments_table', 1),
(39, '2020_10_08_121041_create_meetings_table', 2),
(40, '2020_10_08_121621_create_meeting_times_table', 2),
(41, '2020_10_08_121848_create_meeting_requests_table', 2),
(42, '2020_10_15_172913_add_about_and_head_line_in_users_table', 2),
(43, '2020_10_15_173645_create_follow_table', 2),
(46, '2020_10_17_100606_create_badges_table', 3),
(47, '2020_10_08_121848_create_reserve_meetings_table', 4),
(48, '2020_10_20_193013_update_users_table', 5),
(49, '2020_10_20_211927_create_users_metas_table', 6),
(50, '2020_10_18_220323_convert_creatore_user_id_to_creator_id', 7),
(51, '2020_10_22_153502_create_cart_table', 7),
(52, '2020_10_22_154636_create_orders_table', 7),
(53, '2020_10_22_155930_create_order_items_table', 7),
(54, '2020_10_23_204203_create_sales_table', 7),
(55, '2020_10_23_211459_create_accounting_table', 7),
(56, '2020_10_23_213515_create_discounts_table', 7),
(57, '2020_10_23_213934_create_discount_users_table', 7),
(58, '2020_10_23_235444_create_ticket_users_table', 7),
(59, '2020_10_25_172331_create_groups_table', 7),
(60, '2020_10_25_172523_create_group_users_table', 7),
(62, '2020_11_02_202754_edit_email_in_users_table', 8),
(63, '2020_11_03_200314_edit_some_tables', 9),
(64, '2020_11_06_193300_create_settings_table', 10),
(67, '2020_11_09_202533_create_feature_webinars_table', 11),
(68, '2020_11_10_193459_edit_webinars_table', 12),
(69, '2020_11_11_203344_create_trend_categories_table', 13),
(72, '2020_11_11_222833_create_blog_categories_table', 14),
(75, '2020_11_11_231204_create_blog_table', 15),
(76, '2020_10_25_223247_add_sub_title_tickets_table', 16),
(77, '2020_10_28_001340_add_count_in_discount_users_table', 16),
(78, '2020_10_28_221509_create_payment_channels_table', 16),
(79, '2020_11_01_120909_change_class_name_enum_payment_channels_table', 16),
(80, '2020_11_07_233948_add_some_raw_in_order_items__table', 16),
(81, '2020_11_10_061350_add_discount_id_in_order_items_table', 16),
(82, '2020_11_10_071651_decimal_orders_order_items_sales_table', 16),
(83, '2020_11_11_193138_change_reference_id_type_in_orders_tabel', 16),
(84, '2020_11_11_222413_change_meeting_id_to_meeting_time_id_in_order_items_table', 16),
(85, '2020_11_11_225421_add_locked_at_and_reserved_at_and_change_request_time_to_day_in_reserve_meetings_table', 17),
(86, '2020_11_12_000116_add_type_in_orders_table', 17),
(87, '2020_11_12_001912_change_meeting_id_to_meeting_time_id_in_accounting_table', 17),
(88, '2020_11_12_133009_decimal_paid_amount_in_reserve_meetings_table', 17),
(91, '2020_11_12_170109_add_blog_id_to_comments_table', 18),
(98, '2020_11_14_201228_add_bio_and_ban_to_users_table', 20),
(99, '2020_11_14_224447_create_users_badges_table', 21),
(100, '2020_11_14_233319_create_payout_request_table', 22),
(101, '2020_11_15_010622_change_byer_id_and_add_seller_id_in_sales_table', 22),
(102, '2020_11_16_195009_create_supports_table', 22),
(103, '2020_11_16_201814_create_support_departments_table', 22),
(107, '2020_11_16_202254_create_supports_table', 23),
(109, '2020_11_17_192744_create_support_conversations_table', 24),
(110, '2020_11_17_072348_create_offline_payments_table', 25),
(111, '2020_11_19_191943_add_replied_status_to_comments_table', 25),
(114, '2020_11_20_215748_create_subscribes_table', 26),
(115, '2020_11_21_185519_create_notification_templates_table', 27),
(116, '2020_11_22_210832_create_promotions_table', 28),
(118, '2020_11_23_194153_add_status_column_to_discounts_table', 29),
(119, '2020_11_23_213532_create_users_occupations_table', 30),
(120, '2020_11_30_220855_change_amount_in_payouts_table', 31),
(121, '2020_11_30_231334_add_pay_date_in_offline_payments_table', 31),
(122, '2020_11_30_233018_add_charge_enum_in_type_in_orders_table', 31),
(123, '2020_12_01_193948_create_testimonials_table', 32),
(124, '2020_12_02_202043_edit_and_add_types_to_webinars_table', 33),
(128, '2020_12_04_204048_add_column_creator_id_to_some_tables', 34),
(129, '2020_12_05_205320_create_text_lessons_table', 35),
(130, '2020_12_05_210052_create_text_lessons_attachments_table', 36),
(131, '2020_12_06_215701_add_order_column_to_webinar_items_tables', 37),
(132, '2020_12_11_114844_add_column_storage_to_files_table', 38),
(133, '2020_12_07_211009_add_subscribe_id_in_order_items_table', 39),
(134, '2020_12_07_211657_nullable_payment_method_in_orders_table', 39),
(135, '2020_12_07_212306_add_subscribe_enum__type_in_orders_table', 39),
(136, '2020_12_07_223237_changes_in_sales_table', 39),
(137, '2020_12_07_224925_add_subscribe_id_in_accounting_table', 39),
(138, '2020_12_07_230200_create_subscribe_uses_table', 39),
(139, '2020_12_11_123209_add_subscribe_type_account_in_accounting_table', 39),
(140, '2020_12_11_132819_add_sale_id_in_subscribe_use_in_subscribe_uses_table', 39),
(141, '2020_12_11_135824_add_subscribe_payment_method_in_sales_table', 39),
(143, '2020_12_13_205751_create_advertising_banners_table', 41),
(145, '2020_12_14_204251_create_become_instructors_table', 42),
(146, '2020_11_12_232207_create_reports_table', 43),
(147, '2020_11_12_232207_create_comments_reports_table', 44),
(148, '2020_12_17_210822_create_webinar_reports_table', 45),
(150, '2020_12_18_181551_create_notifications_table', 46),
(151, '2020_12_18_195833_create_notifications_status_table', 47),
(152, '2020_12_19_195152_add_status_column_to_payment_channels_table', 48),
(154, '2020_12_20_231434_create_contacts_table', 49),
(155, '2020_12_21_210345_edit_quizzes_table', 50),
(156, '2020_12_24_221715_add_column_to_users_table', 50),
(157, '2020_12_24_084728_create_special_offers_table', 51),
(158, '2020_12_25_204545_add_promotion_enum_type_in_orders_table', 51),
(159, '2020_12_25_205139_add_promotion_id_in_order_items_table', 51),
(160, '2020_12_25_205811_add_promotion_id_in_accounting_table', 51),
(161, '2020_12_25_210341_add_promotion_id_in_sales_table', 51),
(162, '2020_12_25_212453_add_promotion_type_account_enum_in_accounting_table', 51),
(163, '2020_12_25_231005_add_promotion_type_enum_in_sales_table', 51),
(166, '2020_12_29_192943_add_column_reply_to_contacts_table', 53),
(167, '2020_12_30_225001_create_payu_transactions_table', 54),
(168, '2021_01_06_202649_edit_column_password_from_users_table', 55),
(169, '2021_01_08_134022_add_api_column_to_sessions_table', 56),
(170, '2021_01_10_215540_add_column_store_type_to_accounting', 57),
(173, '2021_01_13_214145_edit_carts_table', 58),
(174, '2021_01_13_230725_delete_column_type_from_orders_table', 59),
(175, '2021_01_20_214653_add_discount_column_to_reserve_meetings_table', 60),
(177, '2021_01_27_193915_add_foreign_key_to_support_conversations_table', 61),
(178, '2021_02_02_203821_add_viewed_at_column_to_comments_table', 62),
(180, '2021_02_12_134504_add_financial_approval_column_to_users_table', 64),
(181, '2021_02_12_131916_create_verifications_table', 65),
(182, '2021_02_15_221518_add_certificate_to_users_table', 66),
(183, '2021_02_16_194103_add_cloumn_private_to_webinars_table', 66),
(184, '2021_02_18_213601_edit_rates_column_webinar_reviews_table', 67),
(188, '2021_02_27_212131_create_noticeboards_table', 68),
(189, '2021_02_27_213940_create_noticeboards_status_table', 68),
(191, '2021_02_28_195025_edit_groups_table', 69),
(192, '2021_03_06_205221_create_newsletters_table', 70),
(193, '2021_03_12_105526_add_is_main_column_to_roles_table', 71),
(194, '2021_03_12_202441_add_description_column_to_feature_webinars_table', 72),
(195, '2021_03_18_130248_edit_status_column_from_supports_table', 73),
(196, '2021_03_19_113306_add_column_order_to_categories_table', 74),
(197, '2021_03_19_115939_add_column_order_to_filter_options_table', 75),
(199, '2021_03_24_100005_edit_discounts_table', 76),
(200, '2021_03_27_204551_create_sales_status_table', 77),
(202, '2021_03_28_182558_add_column_page_to_settings_table', 78),
(206, '2021_03_31_195835_add_new_status_in_reserve_meetings_table', 79),
(207, '2020_12_12_204705_create_course_learning_table', 80),
(208, '2021_04_19_195452_add_meta_description_column_to_blog_table', 81),
(209, '2021_04_21_200131_add_icon_column_to_categories_table', 82),
(210, '2021_04_21_203746_add_is_popular_column_to_subscribes_table', 83),
(211, '2021_04_25_203955_add_is_charge_account_column_to_order_items', 84),
(212, '2021_04_25_203955_add_is_charge_account_column_to_orders', 85),
(213, '2021_05_13_111720_add_moderator_secret_column_to_sessions_table', 86),
(214, '2021_05_13_123920_add_zoom_id_column_to_sessions_table', 87),
(215, '2021_05_14_182848_create_session_reminds_table', 88),
(217, '2021_05_25_193743_create_users_zoom_api_table', 89),
(218, '2021_05_25_205716_add_new_column_to_sessions_table', 90),
(219, '2021_05_27_095128_add_user_id_to_newsletters_table', 91),
(220, '2020_12_27_192459_create_pages_table', 92);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboards`
--

CREATE TABLE `noticeboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `organ_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('all','organizations','students','instructors','students_and_instructors') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboards_status`
--

CREATE TABLE `noticeboards_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `noticeboard_id` int(10) UNSIGNED NOT NULL,
  `seen_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `sender_id` int(10) UNSIGNED DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` enum('system','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `type` enum('single','all_users','students','instructors','organizations','group') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `sender_id`, `group_id`, `title`, `message`, `sender`, `type`, `created_at`) VALUES
(1, 2, NULL, NULL, 'Your class created', '<p>Your class Sample Course successfully created. It will be published after approval.</p>', 'system', 'single', 1635065691),
(2, 2, NULL, NULL, 'Your class approved', '<p>Your class Sample Course successfully approved. Now you can find it on the website.</p>', 'system', 'single', 1635065715),
(3, 2, NULL, NULL, 'Your class approved', '<p>Your class Sample Course successfully approved. Now you can find it on the website.</p>', 'system', 'single', 1635090324),
(4, 2, NULL, NULL, 'Your class approved', '<p>Your class Sample Course successfully approved. Now you can find it on the website.</p>', 'system', 'single', 1635090466),
(5, 2, NULL, NULL, 'Your class approved', '<p>Your class Sample Course successfully approved. Now you can find it on the website.</p>', 'system', 'single', 1635105002);

-- --------------------------------------------------------

--
-- Table structure for table `notifications_status`
--

CREATE TABLE `notifications_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `seen_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `title`, `template`) VALUES
(2, 'New badge', '<p>Congratilations! You received [u.b.title]&nbsp;badge.</p>'),
(3, 'Your user group changed', '<p>Your user group changed to [u.g.title] .</p>'),
(4, 'Your class created', '<p>Your class [c.title] successfully created. It will be published after approval.</p>'),
(5, 'Your class approved', '<p>Your class [c.title] successfully approved. Now you can find it on the website.</p>'),
(6, 'Your class rejected', '<p>Sorry, Your class [c.title] rejected because it doesn\'t meet requirements or is against the community rules.</p>'),
(7, 'New comment for your class', '<p>[u.name] left a new comment on your class [c.title] .</p>'),
(8, 'New class support message', '<p>user [u.name] send new support message for course with title [c.title] .</p>'),
(9, 'New reply on support conversation', '<p>New reply on a support conversation on your class [c.title] support.</p>'),
(10, 'New support ticket', '<p>New support ticket received with subject [s.t.title] .</p>'),
(11, 'New reply on support ticket', '<p>The support ticket with the subject [s.t.title] updated with a new reply.</p>'),
(12, 'New financial document', '<p>&nbsp;New financial document submitted for your class [c.title] with type [f.d.type] and amount [amount] .</p>'),
(13, 'New payout request', '<p>New payout request received with the amount [payout.amount] . You can manage it using the admin panel.</p>'),
(14, 'Payout has been processed', 'Your payout has been processed with the amount [payout.amount]&nbsp;&nbsp;to your account [payout.account] .'),
(15, 'New sales', '<p>Congratulations! There is a new sales for your class [c.title] .</p>'),
(16, 'New purchase completed', '<p>The class [c.title] successfully purchased. Now you can start learning.</p>'),
(17, 'New feedback', '<p>Your class [c.title] received a [rate.count] stars rating from [student.name] .</p>'),
(18, 'Offline payment submitted', '<p>An offline payment request with the amount [amount] submitted successfully.</p>'),
(19, 'Offline payment approved', '<p>Offline payment request with the amount [amount] successfully approved.</p>'),
(20, 'Offline payment rejected', '<p>Sorry, offline payment request with the amount [amount]&nbsp;rejected.</p>'),
(21, 'Subscription plan activated', '<p>[s.p.name] subscription package activated by user [u.name] .</p>'),
(22, 'New meeting request', '<p>New meeting booked by [u.name] for [time.date] with the amount [amount] .</p>'),
(23, 'New meeting join URL', '<p>The reserved meeting join URL created by [instructor.name]. Join the meeting on [time.date] using this URL: [link] .</p>'),
(24, 'Meeting reminder', '<p>You have a meeting on [time.date] . Don\'t forget to join it on time.</p>'),
(25, 'Meeting finished', '<p>The meeting finished. Instructor: [instructor.name] Student:&nbsp; [student.name]&nbsp; Meeting time: [time.date] .</p>'),
(26, 'New contact message', '<p>New contact message with title [c.u.title] received from [u.name] .</p>'),
(27, 'Live class reminder', '<p>Your live class [c.title] will be conducted on [time.date] . Join it on time.</p>'),
(28, 'Promotion plan activated', '<p>Promotion plan [p.p.name]&nbsp;&nbsp;activated for the call [c.title] .</p>'),
(29, 'Promotion plan purchased', '<p>There is new request for activating [p.p.name] for class [c.title] .&nbsp;</p>'),
(30, 'New certificate', '<p>You achieved a new certificate for [c.title] . You can download it from the class page or your panel.</p>'),
(31, 'New pending quiz', '<p>[student.name] passed [q.title] quiz of the [c.title] class and waiting for correction to get results.</p>'),
(32, 'Waiting quiz result', '<p>Your pending quiz corrected and your result is [q.result] for [q.title] quiz of [c.title] class.</p>'),
(33, 'New comment', '<p>[u.name] left a new comment and waiting for approval.</p>'),
(34, 'Payout request submitted', '<p>Your payout request successfully submitted for [payout.amount] . You will receive an email when processed.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `offline_payments`
--

CREATE TABLE `offline_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `bank` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('waiting','approved','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `pay_date` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','paying','paid','fail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('credit','payment_channel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_charge_account` tinyint(1) NOT NULL DEFAULT 0,
  `amount` int(10) UNSIGNED NOT NULL,
  `tax` decimal(13,2) DEFAULT NULL,
  `total_discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `reference_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribe_id` int(10) UNSIGNED DEFAULT NULL,
  `promotion_id` int(10) UNSIGNED DEFAULT NULL,
  `reserve_meeting_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_price` decimal(13,2) DEFAULT NULL,
  `commission` int(10) UNSIGNED DEFAULT NULL,
  `commission_price` decimal(13,2) DEFAULT NULL,
  `discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `created_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `robot` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('publish','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_channels`
--

CREATE TABLE `payment_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` enum('Paypal','Paystack','Paytm','Payu','Razorpay','Zarinpal','Stripe','Paysera','Cashu','YandexCheckout','MercadoPago','Bitpay','Midtrans','Iyzipay','Flutterwave','Payfort') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `payment_channels`
--

INSERT INTO `payment_channels` (`id`, `title`, `class_name`, `status`, `image`, `settings`, `created_at`) VALUES
(1, 'Paypal', 'Paypal', 'active', '/store/1/default_images/gateways/paypal.png', '', '1617345734'),
(2, 'Paystack', 'Paystack', 'inactive', '/store/1/default_images/gateways/paystack.png', '', '1617345734'),
(3, 'Paytm', 'Paytm', 'inactive', '/store/1/default_images/gateways/paytm.png', '', '1617345734'),
(4, 'Payu', 'Payu', 'active', '/store/1/default_images/gateways/payu.png', '', '1617345734'),
(5, 'Razorpay', 'Razorpay', 'active', '/store/1/default_images/gateways/razorpay.png', '', '1617345734'),
(6, 'Zarinpal', 'Zarinpal', 'inactive', '/store/1/default_images/gateways/zarinpal.png', '', '1617345734'),
(7, 'Stripe', 'Stripe', 'active', '/store/1/default_images/gateways/stripe.png', '', '1617345734'),
(8, 'Paysera', 'Paysera', 'inactive', '/store/1/default_images/gateways/paysera.png', '', '1617345734'),
(9, 'Cashu', 'Cashu', 'inactive', '/store/1/default_images/gateways/cashu.png', '', '1617345734'),
(10, 'Yandex checkout', 'YandexCheckout', 'inactive', '/store/1/default_images/gateways/yandex.png', '', '1617345734'),
(11, 'MercadoPago', 'MercadoPago', 'inactive', '/store/1/default_images/gateways/mercadopago.png', '', '1617345734'),
(12, 'Bitpay', 'Bitpay', 'inactive', '/store/1/default_images/gateways/bitpay.png', '', '1617345734'),
(13, 'Midtrans', 'Midtrans', 'inactive', '/store/1/default_images/gateways/midtrans.png', '', '1617345734'),
(14, 'Iyzipay', 'Iyzipay', 'inactive', '/store/1/default_images/gateways/iyzico.png', '', '1617345734'),
(15, 'Flutterwave', 'Flutterwave', 'inactive', '/store/1/default_images/gateways/flutterwave.png', '', '1617345734'),
(16, 'Payfort', 'Payfort', 'inactive', '/store/1/default_images/gateways/payfort.png', '', '1617345734');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `account_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_bank_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('waiting','done','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payu_transactions`
--

CREATE TABLE `payu_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paid_for_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_for_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','failed','successful','invalid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `section_id`, `allow`) VALUES
(6197, 2, 1, 1),
(6198, 2, 2, 1),
(6199, 2, 3, 1),
(6200, 2, 4, 1),
(6201, 2, 5, 1),
(6202, 2, 6, 1),
(6203, 2, 7, 1),
(6204, 2, 8, 1),
(6205, 2, 9, 1),
(6206, 2, 10, 1),
(6207, 2, 11, 1),
(6208, 2, 12, 1),
(6209, 2, 13, 1),
(6210, 2, 14, 1),
(6211, 2, 15, 1),
(6212, 2, 16, 1),
(6213, 2, 17, 1),
(6214, 2, 25, 1),
(6215, 2, 26, 1),
(6216, 2, 50, 1),
(6217, 2, 51, 1),
(6218, 2, 52, 1),
(6219, 2, 53, 1),
(6220, 2, 54, 1),
(6221, 2, 100, 1),
(6222, 2, 101, 1),
(6223, 2, 102, 1),
(6224, 2, 103, 1),
(6225, 2, 104, 1),
(6226, 2, 105, 1),
(6227, 2, 106, 1),
(6228, 2, 107, 1),
(6229, 2, 108, 1),
(6230, 2, 109, 1),
(6231, 2, 110, 1),
(6232, 2, 111, 1),
(6233, 2, 112, 1),
(6234, 2, 113, 1),
(6235, 2, 114, 1),
(6236, 2, 115, 1),
(6237, 2, 150, 1),
(6238, 2, 151, 1),
(6239, 2, 152, 1),
(6240, 2, 153, 1),
(6241, 2, 154, 1),
(6242, 2, 155, 1),
(6243, 2, 156, 1),
(6244, 2, 157, 1),
(6245, 2, 158, 1),
(6246, 2, 200, 1),
(6247, 2, 201, 1),
(6248, 2, 202, 1),
(6249, 2, 203, 1),
(6250, 2, 204, 1),
(6251, 2, 205, 1),
(6252, 2, 206, 1),
(6253, 2, 207, 1),
(6254, 2, 208, 1),
(6255, 2, 250, 1),
(6256, 2, 251, 1),
(6257, 2, 252, 1),
(6258, 2, 253, 1),
(6259, 2, 254, 1),
(6260, 2, 300, 1),
(6261, 2, 301, 1),
(6262, 2, 302, 1),
(6263, 2, 303, 1),
(6264, 2, 304, 1),
(6265, 2, 350, 1),
(6266, 2, 351, 1),
(6267, 2, 352, 1),
(6268, 2, 353, 1),
(6269, 2, 354, 1),
(6270, 2, 355, 1),
(6271, 2, 356, 1),
(6272, 2, 400, 1),
(6273, 2, 401, 1),
(6274, 2, 402, 1),
(6275, 2, 403, 1),
(6276, 2, 404, 1),
(6277, 2, 405, 1),
(6278, 2, 450, 1),
(6279, 2, 451, 1),
(6280, 2, 452, 1),
(6281, 2, 453, 1),
(6282, 2, 454, 1),
(6283, 2, 455, 1),
(6284, 2, 456, 1),
(6285, 2, 457, 1),
(6286, 2, 458, 1),
(6287, 2, 459, 1),
(6288, 2, 500, 1),
(6289, 2, 501, 1),
(6290, 2, 502, 1),
(6291, 2, 503, 1),
(6292, 2, 504, 1),
(6293, 2, 505, 1),
(6294, 2, 550, 1),
(6295, 2, 551, 1),
(6296, 2, 552, 1),
(6297, 2, 553, 1),
(6298, 2, 554, 1),
(6299, 2, 600, 1),
(6300, 2, 601, 1),
(6301, 2, 602, 1),
(6302, 2, 603, 1),
(6303, 2, 650, 1),
(6304, 2, 651, 1),
(6305, 2, 652, 1),
(6306, 2, 653, 1),
(6307, 2, 654, 1),
(6308, 2, 655, 1),
(6309, 2, 656, 1),
(6310, 2, 657, 1),
(6311, 2, 658, 1),
(6312, 2, 700, 1),
(6313, 2, 701, 1),
(6314, 2, 702, 1),
(6315, 2, 703, 1),
(6316, 2, 704, 1),
(6317, 2, 705, 1),
(6318, 2, 706, 1),
(6319, 2, 707, 1),
(6320, 2, 708, 1),
(6321, 2, 750, 1),
(6322, 2, 751, 1),
(6323, 2, 752, 1),
(6324, 2, 753, 1),
(6325, 2, 754, 1),
(6326, 2, 800, 1),
(6327, 2, 801, 1),
(6328, 2, 802, 1),
(6329, 2, 803, 1),
(6330, 2, 850, 1),
(6331, 2, 851, 1),
(6332, 2, 852, 1),
(6333, 2, 853, 1),
(6334, 2, 854, 1),
(6335, 2, 900, 1),
(6336, 2, 901, 1),
(6337, 2, 902, 1),
(6338, 2, 903, 1),
(6339, 2, 904, 1),
(6340, 2, 950, 1),
(6341, 2, 951, 1),
(6342, 2, 952, 1),
(6343, 2, 953, 1),
(6344, 2, 954, 1),
(6345, 2, 955, 1),
(6346, 2, 956, 1),
(6347, 2, 957, 1),
(6348, 2, 958, 1),
(6349, 2, 959, 1),
(6350, 2, 1000, 1),
(6351, 2, 1001, 1),
(6352, 2, 1002, 1),
(6353, 2, 1003, 1),
(6354, 2, 1004, 1),
(6355, 2, 1050, 1),
(6356, 2, 1051, 1),
(6357, 2, 1052, 1),
(6358, 2, 1053, 1),
(6359, 2, 1054, 1),
(6360, 2, 1055, 1),
(6361, 2, 1056, 1),
(6362, 2, 1057, 1),
(6363, 2, 1058, 1),
(6364, 2, 1059, 1),
(6365, 2, 1060, 1),
(6366, 2, 1075, 1),
(6367, 2, 1076, 1),
(6368, 2, 1077, 1),
(6369, 2, 1078, 1),
(6370, 2, 1079, 1),
(6371, 2, 1100, 1),
(6372, 2, 1101, 1),
(6373, 2, 1102, 1),
(6374, 2, 1103, 1),
(6375, 2, 1104, 1),
(6376, 2, 1150, 1),
(6377, 2, 1151, 1),
(6378, 2, 1152, 1),
(6379, 2, 1153, 1),
(6380, 2, 1154, 1),
(6381, 2, 1200, 1),
(6382, 2, 1201, 1),
(6383, 2, 1202, 1),
(6384, 2, 1203, 1),
(6385, 2, 1204, 1),
(6386, 2, 1230, 1),
(6387, 2, 1231, 1),
(6388, 2, 1232, 1),
(6389, 2, 1233, 1),
(6390, 2, 1250, 1),
(6391, 2, 1251, 1),
(6392, 2, 1252, 1),
(6393, 2, 1253, 1),
(6394, 2, 1300, 1),
(6395, 2, 1301, 1),
(6396, 2, 1302, 1),
(6397, 2, 1303, 1),
(6398, 2, 1304, 1),
(6399, 2, 1305, 1),
(6400, 2, 1350, 1),
(6401, 2, 1351, 1),
(6402, 2, 1352, 1),
(6403, 2, 1353, 1),
(6404, 2, 1354, 1),
(6405, 2, 1355, 1),
(6406, 2, 1400, 1),
(6407, 2, 1401, 1),
(6408, 2, 1402, 1),
(6409, 2, 1403, 1),
(6410, 2, 1404, 1),
(6411, 2, 1405, 1),
(6412, 2, 1406, 1),
(6413, 2, 1407, 1),
(6414, 2, 1408, 1),
(6415, 2, 1409, 1),
(6416, 2, 1410, 1),
(6417, 2, 1450, 1),
(6418, 2, 1451, 1),
(6419, 2, 1452, 1),
(6420, 2, 1453, 1),
(6421, 2, 1454, 1),
(6422, 2, 1455, 1),
(6423, 2, 1500, 1),
(6424, 2, 1501, 1),
(6425, 2, 1502, 1),
(6426, 2, 1503, 1),
(6427, 2, 1504, 1),
(6428, 2, 1550, 1),
(6429, 2, 1551, 1),
(6430, 2, 1552, 1),
(6431, 2, 1553, 1),
(6432, 2, 1554, 1),
(6433, 2, 1600, 1),
(6434, 2, 1601, 1),
(6435, 2, 1602, 1),
(6436, 2, 1603, 1),
(6437, 2, 1604, 1),
(6438, 2, 1650, 1),
(6439, 2, 1651, 1),
(6440, 2, 1652, 1),
(6441, 2, 1675, 1),
(6442, 2, 1676, 1),
(6443, 2, 1677, 1),
(6444, 2, 1678, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

CREATE TABLE `prerequisites` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `prerequisite_id` int(10) UNSIGNED NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(10) UNSIGNED NOT NULL,
  `days` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_translations`
--

CREATE TABLE `promotion_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `webinar_title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT 0,
  `attempt` int(11) DEFAULT NULL,
  `pass_mark` int(11) NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_mark` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `webinar_id`, `creator_id`, `chapter_id`, `webinar_title`, `time`, `attempt`, `pass_mark`, `certificate`, `status`, `total_mark`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 'Sample Course', 10, 5, 70, 0, 'active', 1300, 1635065192, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes_questions`
--

CREATE TABLE `quizzes_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('multiple','descriptive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `quizzes_questions`
--

INSERT INTO `quizzes_questions` (`id`, `quiz_id`, `creator_id`, `grade`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '25', 'multiple', 1635065341, NULL),
(2, 1, 2, '25', 'multiple', 1635065580, NULL),
(3, 1, 2, '25', 'multiple', 1635065637, NULL),
(4, 1, 2, '25', 'multiple', 1635065683, NULL),
(37, 1, 2, '25', 'multiple', 1643820760, NULL),
(38, 1, 2, '25', 'multiple', 1643820760, NULL),
(39, 1, 2, '25', 'multiple', 1643821914, NULL),
(40, 1, 2, '25', 'multiple', 1643821914, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes_questions_answers`
--

CREATE TABLE `quizzes_questions_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `quizzes_questions_answers`
--

INSERT INTO `quizzes_questions_answers` (`id`, `creator_id`, `question_id`, `image`, `correct`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, 1, 1635065341, NULL),
(2, 2, 1, NULL, 0, 1635065341, NULL),
(3, 2, 1, NULL, 0, 1635065341, NULL),
(4, 2, 1, NULL, 0, 1635065341, NULL),
(5, 2, 2, NULL, 0, 1635065580, NULL),
(6, 2, 2, NULL, 0, 1635065580, NULL),
(7, 2, 2, NULL, 1, 1635065580, NULL),
(8, 2, 2, NULL, 0, 1635065580, NULL),
(9, 2, 3, NULL, 1, 1635065637, NULL),
(10, 2, 3, NULL, 0, 1635065637, NULL),
(11, 2, 3, NULL, 0, 1635065637, NULL),
(12, 2, 3, NULL, 0, 1635065637, NULL),
(13, 2, 4, NULL, 0, 1635065683, NULL),
(14, 2, 4, NULL, 1, 1635065683, NULL),
(15, 2, 4, NULL, 0, 1635065683, NULL),
(16, 2, 4, NULL, 0, 1635065683, NULL),
(76, 1, 37, NULL, 0, 1643820760, NULL),
(77, 1, 37, NULL, 1, 1643820760, NULL),
(78, 1, 37, NULL, 0, 1643820760, NULL),
(79, 1, 37, NULL, 0, 1643820760, NULL),
(80, 1, 38, NULL, 0, 1643820760, NULL),
(81, 1, 38, NULL, 0, 1643820760, NULL),
(82, 1, 38, NULL, 0, 1643820760, NULL),
(83, 1, 38, NULL, 0, 1643820760, NULL),
(84, 1, 38, NULL, 0, 1643820761, NULL),
(85, 1, 38, NULL, 0, 1643820761, NULL),
(86, 1, 38, NULL, 1, 1643820761, NULL),
(87, 1, 38, NULL, 0, 1643820761, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes_questions_answer_translations`
--

CREATE TABLE `quizzes_questions_answer_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizzes_questions_answer_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes_questions_answer_translations`
--

INSERT INTO `quizzes_questions_answer_translations` (`id`, `quizzes_questions_answer_id`, `locale`, `title`) VALUES
(1, 1, 'en', 'Paris'),
(2, 2, 'en', 'Berlin'),
(3, 3, 'en', 'London'),
(4, 4, 'en', 'New York'),
(5, 5, 'en', 'Spring'),
(6, 6, 'en', 'Summer'),
(7, 7, 'en', 'Winter'),
(8, 8, 'en', 'autumn'),
(9, 9, 'en', '12'),
(10, 10, 'en', '6'),
(11, 11, 'en', '3'),
(12, 12, 'en', '15'),
(13, 13, 'en', '50'),
(14, 14, 'en', '100'),
(15, 15, 'en', '10'),
(16, 16, 'en', '1000'),
(76, 76, 'en', 'Kolkata'),
(77, 77, 'en', 'Delhi'),
(78, 78, 'en', 'Punjab'),
(79, 79, 'en', 'Gujrat'),
(80, 80, 'en', 'Kolkata'),
(81, 81, 'en', 'Delhi'),
(82, 82, 'en', 'Punjab'),
(83, 83, 'en', 'Gujrat'),
(84, 84, 'en', 'Ludhiana'),
(85, 85, 'en', 'Moga'),
(86, 86, 'en', 'Chandigarh'),
(87, 87, 'en', 'Amritsar');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes_results`
--

CREATE TABLE `quizzes_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `results` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_grade` int(11) DEFAULT NULL,
  `status` enum('passed','failed','waiting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question_translations`
--

CREATE TABLE `quiz_question_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizzes_question_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_question_translations`
--

INSERT INTO `quiz_question_translations` (`id`, `quizzes_question_id`, `locale`, `title`, `correct`) VALUES
(1, 1, 'en', 'Where is the French capital?', NULL),
(2, 2, 'en', 'What is the coldest season of the year?', NULL),
(3, 3, 'en', 'How many months is each year?', NULL),
(4, 4, 'en', 'How many centimeters is one meter unit?', NULL),
(37, 37, 'en', 'What is the capital of india ?', 'Delhi'),
(38, 38, 'en', 'What is the capital of punjab ?', 'Chandigarh'),
(39, 39, 'en', 'What is the capital of india ?', 'Delhi'),
(40, 40, 'en', 'What is the capital of punjab ?', 'Chandigarh');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_translations`
--

CREATE TABLE `quiz_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_translations`
--

INSERT INTO `quiz_translations` (`id`, `quiz_id`, `locale`, `title`) VALUES
(1, 1, 'en', 'Test Quiz');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `rate` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reserve_meetings`
--

CREATE TABLE `reserve_meetings` (
  `id` int(10) UNSIGNED NOT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `sale_id` int(10) UNSIGNED DEFAULT NULL,
  `meeting_time_id` int(10) UNSIGNED NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','open','finished','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `locked_at` int(11) DEFAULT NULL,
  `reserved_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `caption`, `users_count`, `is_admin`, `created_at`) VALUES
(1, 'user', 'User role', 0, 0, 1604418504),
(2, 'admin', 'Admin role', 0, 1, 1604418504),
(3, 'organization', 'Organization role', 0, 0, 1604418504),
(4, 'teacher', 'Teacher role', 0, 0, 1604418504);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `buyer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `meeting_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribe_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `promotion_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('webinar','meeting','subscribe','promotion') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('credit','payment_channel','subscribe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `tax` decimal(13,2) DEFAULT NULL,
  `commission` decimal(13,2) DEFAULT NULL,
  `discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `refund_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sales_log`
--

CREATE TABLE `sales_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL,
  `viewed_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_group_id` int(10) UNSIGNED DEFAULT NULL,
  `caption` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `section_group_id`, `caption`) VALUES
(1, 'admin_general_dashboard', NULL, 'General Dashboard'),
(2, 'admin_general_dashboard_show', 1, 'General Dashboard page'),
(3, 'admin_general_dashboard_quick_access_links', 1, 'Quick access links in General Dashboard'),
(4, 'admin_general_dashboard_daily_sales_statistics', 1, 'Daily Sales Type Statistics Section'),
(5, 'admin_general_dashboard_income_statistics', 1, 'Income Statistics Section'),
(6, 'admin_general_dashboard_total_sales_statistics', 1, 'Total Sales Statistics Section'),
(7, 'admin_general_dashboard_new_sales', 1, 'New Sales Section'),
(8, 'admin_general_dashboard_new_comments', 1, 'New Comments Section'),
(9, 'admin_general_dashboard_new_tickets', 1, 'New Tickets Section'),
(10, 'admin_general_dashboard_new_reviews', 1, 'New Reviews Section'),
(11, 'admin_general_dashboard_sales_statistics_chart', 1, 'Sales Statistics Chart'),
(12, 'admin_general_dashboard_recent_comments', 1, 'Recent comments Section'),
(13, 'admin_general_dashboard_recent_tickets', 1, 'Recent tickets Section'),
(14, 'admin_general_dashboard_recent_webinars', 1, 'Recent webinars Section'),
(15, 'admin_general_dashboard_recent_courses', 1, 'Recent courses Section'),
(16, 'admin_general_dashboard_users_statistics_chart', 1, 'Users Statistics Chart'),
(17, 'admin_clear_cache', 1, 'Clear cache'),
(25, 'admin_marketing_dashboard', NULL, 'Marketing Dashboard'),
(26, 'admin_marketing_dashboard_show', 25, 'Marketing Dashboard page'),
(50, 'admin_roles', NULL, 'Roles'),
(51, 'admin_roles_list', 50, 'Roles List'),
(52, 'admin_roles_create', 50, 'Roles Create'),
(53, 'admin_roles_edit', 50, 'Roles Edit'),
(54, 'admin_roles_delete', 50, 'Roles Delete'),
(100, 'admin_users', NULL, 'Users'),
(101, 'admin_staffs_list', 100, 'Staffs list'),
(102, 'admin_users_list', 100, 'Students list'),
(103, 'admin_instructors_list', 100, 'Instructors list'),
(104, 'admin_organizations_list', 100, 'Organizations list'),
(105, 'admin_users_create', 100, 'Users Create'),
(106, 'admin_users_edit', 100, 'Users Edit'),
(107, 'admin_users_delete', 100, 'Users Delete'),
(108, 'admin_users_export_excel', 100, 'List Export excel'),
(109, 'admin_users_badges', 100, 'Users Badges'),
(110, 'admin_users_badges_edit', 100, 'Badges edit'),
(111, 'admin_users_badges_delete', 100, 'Badges delete'),
(112, 'admin_users_impersonate', 100, 'users impersonate (login by users)'),
(113, 'admin_become_instructors_list', 100, 'Lists of requests for become instructors'),
(114, 'admin_become_instructors_reject', 100, 'Reject requests for become instructors'),
(115, 'admin_become_instructors_delete', 100, 'Delete requests for become instructors'),
(150, 'admin_webinars', NULL, 'Webinars'),
(151, 'admin_webinars_list', 150, 'Webinars List'),
(152, 'admin_webinars_create', 150, 'Webinars Create'),
(153, 'admin_webinars_edit', 150, 'Webinars Edit'),
(154, 'admin_webinars_delete', 150, 'Webinars Delete'),
(155, 'admin_webinars_export_excel', 150, 'Feature webinars list'),
(156, 'admin_feature_webinars', 150, 'Feature webinars list'),
(157, 'admin_feature_webinars_create', 150, 'create feature webinar'),
(158, 'admin_feature_webinars_export_excel', 150, 'Feature webinar export excel'),
(200, 'admin_categories', NULL, 'Categories'),
(201, 'admin_categories_list', 200, 'Categories List'),
(202, 'admin_categories_create', 200, 'Categories Create'),
(203, 'admin_categories_edit', 200, 'Categories Edit'),
(204, 'admin_categories_delete', 200, 'Categories Delete'),
(205, 'admin_trending_categories', 200, 'Trends Categories List'),
(206, 'admin_create_trending_categories', 200, 'Create Trend Categories'),
(207, 'admin_edit_trending_categories', 200, 'Edit Trend Categories'),
(208, 'admin_delete_trending_categories', 200, 'Delete Trend Categories'),
(250, 'admin_tags', NULL, 'Tags'),
(251, 'admin_tags_list', 250, 'Tags List'),
(252, 'admin_tags_create', 250, 'Tags Create'),
(253, 'admin_tags_edit', 250, 'Tags Edit'),
(254, 'admin_tags_delete', 250, 'Tags Delete'),
(300, 'admin_filters', NULL, 'Filters'),
(301, 'admin_filters_list', 300, 'Filters List'),
(302, 'admin_filters_create', 300, 'Filters Create'),
(303, 'admin_filters_edit', 300, 'Filters Edit'),
(304, 'admin_filters_delete', 300, 'Filters Delete'),
(350, 'admin_quizzes', NULL, 'Quizzes'),
(351, 'admin_quizzes_list', 350, 'Quizzes List'),
(352, 'admin_quizzes_edit', 350, 'Quiz edit'),
(353, 'admin_quizzes_delete', 350, 'Quiz delete'),
(354, 'admin_quizzes_results', 350, 'Quizzes results'),
(355, 'admin_quizzes_results_delete', 350, 'Quizzes results delete'),
(356, 'admin_quizzes_lists_excel', 350, 'Quizzes export excel'),
(400, 'admin_quiz_result', NULL, 'Quiz Result'),
(401, 'admin_quiz_result_list', 400, 'Quiz Result List'),
(402, 'admin_quiz_result_create', 400, 'Quiz Result Create'),
(403, 'admin_quiz_result_edit', 400, 'Quiz Result Edit'),
(404, 'admin_quiz_result_delete', 400, 'Quiz Result Delete'),
(405, 'admin_quiz_result_export_excel', 400, 'quiz result export excel'),
(450, 'admin_certificate', NULL, 'Certificate'),
(451, 'admin_certificate_list', 450, 'Certificate List'),
(452, 'admin_certificate_create', 450, 'Certificate Create'),
(453, 'admin_certificate_edit', 450, 'Certificate Edit'),
(454, 'admin_certificate_delete', 450, 'Certificate Delete'),
(455, 'admin_certificate_template_list', 450, 'Certificate template lists'),
(456, 'admin_certificate_template_create', 450, 'Certificate template create'),
(457, 'admin_certificate_template_edit', 450, 'Certificate template edit'),
(458, 'admin_certificate_template_delete', 450, 'Certificate template delete'),
(459, 'admin_certificate_export_excel', 450, 'Certificates export excel'),
(500, 'admin_discount_codes', NULL, 'Discount codes'),
(501, 'admin_discount_codes_list', 500, 'Discount codes list'),
(502, 'admin_discount_codes_create', 500, 'Discount codes create'),
(503, 'admin_discount_codes_edit', 500, 'Discount codes edit'),
(504, 'admin_discount_codes_delete', 500, 'Discount codes delete'),
(505, 'admin_discount_codes_export', 500, 'Discount codes export excel'),
(550, 'admin_group', NULL, 'Groups'),
(551, 'admin_group_list', 550, 'Groups List'),
(552, 'admin_group_create', 550, 'Groups Create'),
(553, 'admin_group_edit', 550, 'Groups Edit'),
(554, 'admin_group_delete', 550, 'Groups Delete'),
(600, 'admin_payment_channel', NULL, 'Payment Channels'),
(601, 'admin_payment_channel_list', 600, 'Payment Channels List'),
(602, 'admin_payment_channel_toggle_status', 600, 'active or inactive channel'),
(603, 'admin_payment_channel_edit', 600, 'Payment Channels Edit'),
(650, 'admin_settings', NULL, 'settings'),
(651, 'admin_settings_general', 650, 'General settings'),
(652, 'admin_settings_financial', 650, 'Financial settings'),
(653, 'admin_settings_personalization', 650, 'Personalization settings'),
(654, 'admin_settings_notifications', 650, 'Notifications settings'),
(655, 'admin_settings_seo', 650, 'Seo settings'),
(656, 'admin_settings_customization', 650, 'Customization settings'),
(657, 'admin_settings_notifications', 650, 'Notifications settings'),
(658, 'admin_settings_home_sections', 650, 'Home sections settings'),
(700, 'admin_blog', NULL, 'Blog'),
(701, 'admin_blog_lists', 700, 'Blog lists'),
(702, 'admin_blog_create', 700, 'Blog create'),
(703, 'admin_blog_edit', 700, 'Blog edit'),
(704, 'admin_blog_delete', 700, 'Blog delete'),
(705, 'admin_blog_categories', 700, 'Blog categories list'),
(706, 'admin_blog_categories_create', 700, 'Blog categories create'),
(707, 'admin_blog_categories_edit', 700, 'Blog categories edit'),
(708, 'admin_blog_categories_delete', 700, 'Blog categories delete'),
(750, 'admin_sales', NULL, 'Sales'),
(751, 'admin_sales_list', 750, 'Sales List'),
(752, 'admin_sales_refund', 750, 'Sales Refund'),
(753, 'admin_sales_invoice', 750, 'Sales invoice'),
(754, 'admin_sales_export', 750, 'Sales Export Excel'),
(800, 'admin_documents', NULL, 'Balances'),
(801, 'admin_documents_list', 800, 'Balances List'),
(802, 'admin_documents_create', 800, 'Balances Create'),
(803, 'admin_documents_print', 800, 'Balances print'),
(850, 'admin_payouts', NULL, 'Payout'),
(851, 'admin_payouts_list', 850, 'Payout List'),
(852, 'admin_payouts_reject', 850, 'Payout Reject'),
(853, 'admin_payouts_payout', 850, 'Payout accept'),
(854, 'admin_payouts_export_excel', 850, 'Payout export excel'),
(900, 'admin_offline_payments', NULL, 'Offline Payments'),
(901, 'admin_offline_payments_list', 900, 'Offline Payments List'),
(902, 'admin_offline_payments_reject', 900, 'Offline Payments Reject'),
(903, 'admin_offline_payments_approved', 900, 'Offline Payments Approved'),
(904, 'admin_offline_payments_export_excel', 900, 'Offline Payments export excel'),
(950, 'admin_supports', NULL, 'Supports'),
(951, 'admin_supports_list', 950, 'Supports List'),
(952, 'admin_support_send', 950, 'Send Support'),
(953, 'admin_supports_reply', 950, 'Supports reply'),
(954, 'admin_supports_delete', 950, 'Supports delete'),
(955, 'admin_support_departments', 950, 'Support departments lists'),
(956, 'admin_support_department_create', 950, 'Create support department'),
(957, 'admin_support_departments_edit', 950, 'Edit support departments'),
(958, 'admin_support_departments_delete', 950, 'Delete support department'),
(959, 'admin_support_course_conversations', 950, 'Course conversations'),
(1000, 'admin_subscribe', NULL, 'Subscribes'),
(1001, 'admin_subscribe_list', 1000, 'Subscribes list'),
(1002, 'admin_subscribe_create', 1000, 'Subscribes create'),
(1003, 'admin_subscribe_edit', 1000, 'Subscribes edit'),
(1004, 'admin_subscribe_delete', 1000, 'Subscribes delete'),
(1050, 'admin_notifications', NULL, 'Notifications'),
(1051, 'admin_notifications_list', 1050, 'Notifications list'),
(1052, 'admin_notifications_send', 1050, 'Send Notifications'),
(1053, 'admin_notifications_edit', 1050, 'Edit and details Notifications'),
(1054, 'admin_notifications_delete', 1050, 'Delete Notifications'),
(1055, 'admin_notifications_markAllRead', 1050, 'Mark All Read Notifications'),
(1056, 'admin_notifications_templates', 1050, 'Notifications templates'),
(1057, 'admin_notifications_template_create', 1050, 'Create notification template'),
(1058, 'admin_notifications_template_edit', 1050, 'Edit notification template'),
(1059, 'admin_notifications_template_delete', 1050, 'Delete notification template'),
(1060, 'admin_notifications_posted_list', 1050, 'Notifications Posted list'),
(1075, 'admin_noticeboards', NULL, 'Noticeboards'),
(1076, 'admin_noticeboards_list', 1075, 'Noticeboards list'),
(1077, 'admin_noticeboards_send', 1075, 'Send Noticeboards'),
(1078, 'admin_noticeboards_edit', 1075, 'Edit Noticeboards'),
(1079, 'admin_noticeboards_delete', 1075, 'Delete Noticeboards'),
(1100, 'admin_promotion', NULL, 'Promotions'),
(1101, 'admin_promotion_list', 1100, 'Promotions list'),
(1102, 'admin_promotion_create', 1100, 'Promotion create'),
(1103, 'admin_promotion_edit', 1100, 'Promotion edit'),
(1104, 'admin_promotion_delete', 1100, 'Promotion delete'),
(1150, 'admin_testimonials', NULL, 'testimonials'),
(1151, 'admin_testimonials_list', 1150, 'testimonials list'),
(1152, 'admin_testimonials_create', 1150, 'testimonials create'),
(1153, 'admin_testimonials_edit', 1150, 'testimonials edit'),
(1154, 'admin_testimonials_delete', 1150, 'testimonials delete'),
(1200, 'admin_advertising', NULL, 'advertising'),
(1201, 'admin_advertising_banners', 1200, 'advertising banners list'),
(1202, 'admin_advertising_banners_create', 1200, 'create advertising banner'),
(1203, 'admin_advertising_banners_edit', 1200, 'edit advertising banner'),
(1204, 'admin_advertising_banners_delete', 1200, 'delete advertising banner'),
(1230, 'admin_newsletters', NULL, 'Newsletters'),
(1231, 'admin_newsletters_lists', 1230, 'Newsletters lists'),
(1232, 'admin_newsletters_delete', 1230, 'Delete newsletters item'),
(1233, 'admin_newsletters_export_excel', 1230, 'Export excel newsletters item'),
(1250, 'admin_contacts', NULL, 'Contacts'),
(1251, 'admin_contacts_lists', 1250, 'Contacts lists'),
(1252, 'admin_contacts_reply', 1250, 'Contacts reply'),
(1253, 'admin_contacts_delete', 1250, 'Contacts delete'),
(1300, 'admin_product_discount', NULL, 'product discount'),
(1301, 'admin_product_discount_list', 1300, 'product discount list'),
(1302, 'admin_product_discount_create', 1300, 'create product discount'),
(1303, 'admin_product_discount_edit', 1300, 'edit product discount'),
(1304, 'admin_product_discount_delete', 1300, 'delete product discount'),
(1305, 'admin_product_discount_export', 1300, 'delete product export excel'),
(1350, 'admin_pages', NULL, 'pages'),
(1351, 'admin_pages_list', 1350, 'pages list'),
(1352, 'admin_pages_create', 1350, 'pages create'),
(1353, 'admin_pages_edit', 1350, 'pages edit'),
(1354, 'admin_pages_toggle', 1350, 'pages toggle publish/draft'),
(1355, 'admin_pages_delete', 1350, 'pages delete'),
(1400, 'admin_comments', NULL, 'Comments'),
(1401, 'admin_webinar_comments', 1400, 'Classes comments'),
(1402, 'admin_webinar_comments_edit', 1400, 'Classes comments edit'),
(1403, 'admin_webinar_comments_reply', 1400, 'Classes comments reply'),
(1404, 'admin_webinar_comments_delete', 1400, 'Classes comments delete'),
(1405, 'admin_webinar_comments_status', 1400, 'Classes comments status (active or pending)'),
(1406, 'admin_blog_comments', 1400, 'Blog comments'),
(1407, 'admin_blog_comments_edit', 1400, 'Blog comments edit'),
(1408, 'admin_blog_comments_reply', 1400, 'Blog comments reply'),
(1409, 'admin_blog_comments_delete', 1400, 'Blog comments delete'),
(1410, 'admin_blog_comments_status', 1400, 'Blog comments status (active or pending)'),
(1450, 'admin_reports', NULL, 'Reports'),
(1451, 'admin_webinar_reports', 1450, 'Classes reports'),
(1452, 'admin_webinar_comments_reports', 1450, 'Classes Comments reports'),
(1453, 'admin_webinar_reports_delete', 1450, 'Classes reports delete'),
(1454, 'admin_blog_comments_reports', 1450, 'Blog Comments reports'),
(1455, 'admin_report_reasons', 1450, 'Reports reasons'),
(1500, 'admin_additional_pages', NULL, 'Additional Pages'),
(1501, 'admin_additional_pages_404', 1500, '404 error page settings'),
(1502, 'admin_additional_pages_contact_us', 1500, 'Contact page settings'),
(1503, 'admin_additional_pages_footer', 1500, 'Footer settings'),
(1504, 'admin_additional_pages_navbar_links', 1500, 'Top Navbar links settings'),
(1550, 'admin_appointments', NULL, 'Appointments'),
(1551, 'admin_appointments_lists', 1550, 'Appointments lists'),
(1552, 'admin_appointments_join', 1550, 'Appointments join'),
(1553, 'admin_appointments_send_reminder', 1550, 'Appointments send reminder'),
(1554, 'admin_appointments_cancel', 1550, 'Appointments cancel'),
(1600, 'admin_reviews', NULL, 'Reviews'),
(1601, 'admin_reviews_lists', 1600, 'Reviews lists'),
(1602, 'admin_reviews_status_toggle', 1600, 'Reviews status toggle (publish or hidden)'),
(1603, 'admin_reviews_detail_show', 1600, 'Review details page'),
(1604, 'admin_reviews_delete', 1600, 'Review delete'),
(1650, 'admin_consultants', NULL, 'Consultants'),
(1651, 'admin_consultants_lists', 1650, 'Consultants lists'),
(1652, 'admin_consultants_export_excel', 1650, 'Consultants export excel'),
(1675, 'admin_referrals', NULL, 'Referrals'),
(1676, 'admin_referrals_history', 1675, 'Referrals History'),
(1677, 'admin_referrals_users', 1675, 'Referrals users'),
(1678, 'admin_referrals_export', 1675, 'Export Referrals');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `date` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_start_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_api` enum('local','big_blue_button','zoom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moderator_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `session_reminds`
--

CREATE TABLE `session_reminds` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_translations`
--

CREATE TABLE `session_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `page` enum('general','financial','personalization','notifications','seo','customization','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `page`, `name`, `updated_at`) VALUES
(1, 'seo', 'seo_metas', 1634974288),
(2, 'general', 'socials', 1634971281),
(4, 'other', 'footer', 1632071275),
(5, 'general', 'general', 1635104914),
(6, 'financial', 'financial', 1634973979),
(8, 'personalization', 'home_hero', 1634971489),
(12, 'customization', 'custom_css_js', 1617004328),
(14, 'personalization', 'page_background', 1634971398),
(15, 'personalization', 'home_hero2', 1634971643),
(20, 'other', 'report_reasons', 1632235945),
(22, 'notifications', 'notifications', 1617003551),
(23, 'financial', 'site_bank_accounts', 1634974003),
(24, 'other', 'contact_us', 1634982213),
(25, 'personalization', 'home_sections', 1619608986),
(26, 'other', 'navbar_links', 1632127511),
(27, 'personalization', 'home_video_or_image_box', 1634971776),
(28, 'other', '404', 1616998061),
(29, 'personalization', 'panel_sidebar', 1634971841),
(30, 'financial', 'referral', 1635104886);

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
(1, 1, 'en', '{\"home\":{\"title\":\"Home\",\"description\":\"home page Description\",\"robot\":\"index\"},\"search\":{\"title\":\"Search\",\"description\":\"search page Description\",\"robot\":\"index\"},\"categories\":{\"title\":\"Category\",\"description\":\"categories page Description\",\"robot\":\"index\"},\"login\":{\"title\":\"Login\",\"description\":\"login page description\",\"robot\":\"index\"},\"register\":{\"title\":\"Register\",\"description\":\"register page Description\",\"robot\":\"index\"},\"about\":{\"title\":\"about page title\",\"description\":\"about page Description\"},\"contact\":{\"title\":\"Contact\",\"description\":\"contact page Description update\",\"robot\":\"index\"},\"certificate_validation\":{\"title\":\"Certificate Validation\",\"description\":\"Certificate validation description\",\"robot\":\"index\"},\"classes\":{\"title\":\"Classes\",\"description\":\"Classes page Description\",\"robot\":\"index\"},\"blog\":{\"title\":\"Blog\",\"description\":\"Blog page description\",\"robot\":\"index\"},\"instructors\":{\"title\":\"Instructors\",\"description\":\"instructors page Description\",\"robot\":\"index\"},\"organizations\":{\"title\":\"Organizations\",\"description\":\"Organizations page description\",\"robot\":\"index\"}}'),
(2, 2, 'en', '{\"Instagram\":{\"title\":\"Instagram\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/instagram.svg\",\"link\":\"https:\\/\\/www.instagram.com\\/\",\"order\":\"1\"},\"Whatsapp\":{\"title\":\"Whatsapp\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/whatsapp.svg\",\"link\":\"https:\\/\\/web.whatsapp.com\\/\",\"order\":\"2\"},\"Twitter\":{\"title\":\"Twitter\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/twitter.svg\",\"link\":\"https:\\/\\/twitter.com\\/\",\"order\":\"3\"},\"Linkedin\":{\"title\":\"Linkedin\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/linkedin.svg\",\"link\":\"https:\\/\\/www.linkedin.com\\/\",\"order\":\"4\"},\"Facebook\":{\"title\":\"Facebook\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/facebook.svg\",\"link\":\"https:\\/\\/www.facebook.com\\/\",\"order\":\"5\"}}'),
(4, 5, 'en', '{\"site_name\":\"Rocket LMS\",\"site_email\":\"mail@lms.rocket-soft.org\",\"site_phone\":\"415-716-1166\",\"site_language\":\"EN\",\"register_method\":\"email\",\"user_languages\":[\"AR\",\"EN\",\"ES\"],\"rtl_languages\":[\"AR\"],\"fav_icon\":\"\\/store\\/1\\/favicon.png\",\"logo\":\"\\/store\\/1\\/default_images\\/website-logo.png\",\"footer_logo\":\"\\/store\\/1\\/default_images\\/website-logo-white.png\",\"webinar_reminder_schedule\":\"2\",\"preloading\":\"1\",\"hero_section2\":\"1\"}'),
(5, 6, 'en', '{\"commission\":\"20\",\"tax\":\"10\",\"minimum_payout\":\"40\",\"currency\":\"USD\"}'),
(6, 8, 'en', '{\"title\":\"Joy of learning & teaching...\",\"description\":\"Rocket LMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(7, 12, 'en', '{\"css\":null,\"js\":null}'),
(8, 14, 'en', '{\"admin_login\":\"\\/store\\/1\\/default_images\\/admin_login.jpg\",\"admin_dashboard\":\"\\/store\\/1\\/default_images\\/admin_dashboard.jpg\",\"login\":\"\\/store\\/1\\/default_images\\/front_login.jpg\",\"register\":\"\\/store\\/1\\/default_images\\/front_register.jpg\",\"remember_pass\":\"\\/store\\/1\\/default_images\\/password_recovery.jpg\",\"verification\":\"\\/store\\/1\\/default_images\\/verification.jpg\",\"search\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"categories\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"become_instructor\":\"\\/store\\/1\\/default_images\\/become_instructor.jpg\",\"certificate_validation\":\"\\/store\\/1\\/default_images\\/certificate_validation.jpg\",\"blog\":\"\\/store\\/1\\/default_images\\/blogs_cover.png\",\"instructors\":\"\\/store\\/1\\/default_images\\/instructors_cover.png\",\"organizations\":\"\\/store\\/1\\/default_images\\/organizations_cover.png\",\"dashboard\":\"\\/store\\/1\\/dashboard.png\",\"user_avatar\":\"\\/store\\/1\\/default_images\\/default_profile.jpg\",\"user_cover\":\"\\/store\\/1\\/default_images\\/default_cover.jpg\"}'),
(9, 15, 'en', '{\"title\":\"Joy of learning & teaching...\",\"description\":\"Rocket LMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(10, 20, 'en', '{\"1\":\"reason 3\",\"2\":\"reason 1\"}'),
(11, 22, 'en', '{\"new_comment_admin\":\"7\",\"support_message_admin\":\"10\",\"support_message_replied_admin\":\"11\",\"promotion_plan_admin\":\"29\",\"new_contact_message\":\"26\",\"new_badge\":\"2\",\"change_user_group\":\"3\",\"course_created\":\"4\",\"course_approve\":\"5\",\"course_reject\":\"6\",\"new_comment\":\"7\",\"support_message\":\"8\",\"support_message_replied\":\"9\",\"new_rating\":\"17\",\"webinar_reminder\":\"27\",\"new_financial_document\":\"12\",\"payout_request\":\"13\",\"payout_proceed\":\"14\",\"offline_payment_request\":\"18\",\"offline_payment_approved\":\"19\",\"offline_payment_rejected\":\"20\",\"new_sales\":\"15\",\"new_purchase\":\"16\",\"new_subscribe_plan\":\"21\",\"promotion_plan\":\"28\",\"new_appointment\":\"22\",\"new_appointment_link\":\"23\",\"appointment_reminder\":\"24\",\"meeting_finished\":\"25\",\"new_certificate\":\"30\",\"waiting_quiz\":\"31\",\"waiting_quiz_result\":\"32\",\"payout_request_admin\":\"13\"}'),
(12, 23, 'en', '[]'),
(13, 24, 'en', '{\"background\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"latitude\":\"43.45905\",\"longitude\":\"11.87300\",\"map_zoom\":\"16\"}'),
(14, 25, 'en', '{\"latest_classes\":\"1\",\"best_sellers\":\"1\",\"free_classes\":\"1\",\"discount_classes\":\"1\",\"best_rates\":\"1\",\"trend_categories\":\"1\",\"testimonials\":\"1\",\"subscribes\":\"1\",\"blog\":\"1\",\"organizations\":\"1\",\"instructors\":\"1\",\"video_or_image_section\":\"1\"}'),
(15, 26, 'en', ''),
(16, 27, 'en', '{\"link\":\"\\/classes\",\"title\":\"Start learning anywhere, anytime...\",\"description\":\"Use Rocket LMS to access high-quality education materials without any limitations in the easiest way.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(17, 28, 'en', '{\"error_image\":\"\\/bin\\/1\\/603bd3cde9c29.jpg\",\"error_title\":\"title for error 404\",\"error_description\":\"404 Error description\"}'),
(18, 29, 'en', '{\"link\":\"\\/panel\\/webinars\\/new\",\"background\":\"\\/store\\/1\\/sidebar-user.png\"}'),
(19, 30, 'en', '{\"affiliate_user_commission\":\"5\",\"affiliate_user_amount\":\"80\",\"referred_user_amount\":\"50\",\"referral_description\":\"You can share your affiliate URL you will get the above rewards when a user uses the platform.\"}'),
(20, 4, 'en', '{\"first_column\":{\"title\":\"About US\",\"value\":\"<p><span style=\\\"color: rgb(255, 255, 255);\\\">Rocket LMS is a fully-featured learning management system that helps you to run your education business in several hours. This platform helps instructors to create professional education materials and helps students to learn from the best instructors.<\\/span><\\/p>\"},\"second_column\":{\"title\":\"Additional Links\",\"value\":\"<p><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- Login<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- Register<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- Blog<\\/font><\\/a><\\/p><p><a href=\\\"\\/contact\\\"><font color=\\\"#ffffff\\\">- Contact us<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/certificate_validation\\\"><font color=\\\"#ffffff\\\">- Certificate validation<\\/font><\\/a><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- Become instructor<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- Terms &amp; rules<\\/font><\\/a><\\/p><p><a href=\\\"\\\"><font color=\\\"#ffffff\\\">- About us<\\/font><\\/a><\\/p>\"},\"third_column\":{\"title\":\"Similar Businesses\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><\\/p>\"},\"forth_column\":{\"title\":\"Purchase Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `special_offers`
--

CREATE TABLE `special_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `from_date` int(10) UNSIGNED NOT NULL,
  `to_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `usable_count` int(10) UNSIGNED NOT NULL,
  `days` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_translations`
--

CREATE TABLE `subscribe_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribe_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_uses`
--

CREATE TABLE `subscribe_uses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subscribe_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','close','replied','supporter_replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` int(10) UNSIGNED DEFAULT NULL,
  `updated_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_conversations`
--

CREATE TABLE `support_conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `support_id` int(10) UNSIGNED NOT NULL,
  `supporter_id` int(10) UNSIGNED DEFAULT NULL,
  `sender_id` int(10) UNSIGNED DEFAULT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_departments`
--

CREATE TABLE `support_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_department_translations`
--

CREATE TABLE `support_department_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_department_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `webinar_id`) VALUES
(7, 'course', 1);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_translations`
--

CREATE TABLE `testimonial_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `text_lessons`
--

CREATE TABLE `text_lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_time` int(10) UNSIGNED DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `order` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(10) UNSIGNED NOT NULL,
  `updated_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `text_lessons_attachments`
--

CREATE TABLE `text_lessons_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `text_lesson_id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `text_lesson_translations`
--

CREATE TABLE `text_lesson_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text_lesson_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `start_date` int(10) UNSIGNED DEFAULT NULL,
  `end_date` int(10) UNSIGNED DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_translations`
--

CREATE TABLE `ticket_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_users`
--

CREATE TABLE `ticket_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trend_categories`
--

CREATE TABLE `trend_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `trend_categories`
--

INSERT INTO `trend_categories` (`id`, `category_id`, `icon`, `color`, `created_at`) VALUES
(1, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336),
(2, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336),
(3, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336),
(4, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336),
(5, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336),
(6, 1, '/store/1/default_images/trend_categories_icons/palette.svg', '#45c0f9', 1605117336);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `organ_id` int(11) DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `financial_approval` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_img` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','pending','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `public_message` tinyint(1) NOT NULL DEFAULT 0,
  `account_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_scan` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` int(10) UNSIGNED DEFAULT NULL,
  `affiliate` tinyint(1) NOT NULL DEFAULT 1,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `ban_start_at` int(10) UNSIGNED DEFAULT NULL,
  `ban_end_at` int(10) UNSIGNED DEFAULT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `offline_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `role_name`, `role_id`, `organ_id`, `mobile`, `email`, `bio`, `password`, `google_id`, `facebook_id`, `remember_token`, `verified`, `financial_approval`, `avatar`, `cover_img`, `headline`, `about`, `address`, `status`, `language`, `newsletter`, `public_message`, `account_type`, `iban`, `account_id`, `identity_scan`, `certificate`, `commission`, `affiliate`, `ban`, `ban_start_at`, `ban_end_at`, `offline`, `offline_message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 2, NULL, '+413575228', 'admin@demo.com', NULL, '$2y$10$/yNE6dJJLir8WY6In/ECvuDtyssrzWht5RPqc9PZ3.9TGY6VNCCg6', NULL, NULL, 'kFZlrQUfbcKMSd97I3cEIDp1qnnQKUnMEooXOMMWNcrPl8IlzugEoFUpCZoa', 1, 0, '/store/1/default_images/logo-new.jpg', NULL, NULL, NULL, NULL, 'active', 'EN', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, 1597826952, 1597826952, NULL),
(2, 'Instructor user', 'teacher', 4, NULL, '+12025250175', 'instructor@demo.com', 'Network Technician at Cisco', '$2y$10$.f59Y9EXaEq/XXbnqLW40OQ6uooWncfJmqRXTQ49XelGPPKm1KEJa', NULL, NULL, 'mDHSGjzG7qfOyTj9CpexPSiNuYmpiBan8crUM92Gs03VkkIHBPQNXs45brbR', 0, 1, '/store/2/avatar/6175b47f54745.png', NULL, NULL, NULL, NULL, 'active', 'EN', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 1597826952, 1597826952, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_badges`
--

CREATE TABLE `users_badges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `badge_id` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_metas`
--

CREATE TABLE `users_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_occupations`
--

CREATE TABLE `users_occupations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_occupations`
--

INSERT INTO `users_occupations` (`id`, `user_id`, `category_id`) VALUES
(1001, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_zoom_api`
--

CREATE TABLE `users_zoom_api` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `jwt_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `mobile` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_at` int(10) UNSIGNED DEFAULT NULL,
  `expired_at` int(10) UNSIGNED DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `webinars`
--

CREATE TABLE `webinars` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('webinar','course','text_lesson') COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(10) UNSIGNED DEFAULT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL,
  `support` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `partner_instructor` tinyint(1) DEFAULT 0,
  `subscribe` tinyint(1) DEFAULT 0,
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `webinars`
--

INSERT INTO `webinars` (`id`, `teacher_id`, `creator_id`, `category_id`, `type`, `private`, `slug`, `start_date`, `duration`, `thumbnail`, `image_cover`, `video_demo`, `capacity`, `price`, `support`, `downloadable`, `partner_instructor`, `subscribe`, `message_for_reviewer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 1, 'course', 0, 'Sample-Course', NULL, 60, '/store/2/course_thumbnail.jpg', '/store/2/course_cover.jpg', '/store/2/Effective Time Management.mkv', NULL, 0, 1, 1, 0, 0, NULL, 'active', 1635062577, 1635105002, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `webinar_chapters`
--

CREATE TABLE `webinar_chapters` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `type` enum('file','session','text_lesson') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'file',
  `order` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'active',
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webinar_chapters`
--

INSERT INTO `webinar_chapters` (`id`, `user_id`, `webinar_id`, `type`, `order`, `status`, `created_at`) VALUES
(1, 2, 1, 'file', NULL, 'active', 1635063205);

-- --------------------------------------------------------

--
-- Table structure for table `webinar_chapter_translations`
--

CREATE TABLE `webinar_chapter_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `webinar_chapter_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webinar_chapter_translations`
--

INSERT INTO `webinar_chapter_translations` (`id`, `webinar_chapter_id`, `locale`, `title`) VALUES
(1, 1, 'en', 'Test Section');

-- --------------------------------------------------------

--
-- Table structure for table `webinar_filter_option`
--

CREATE TABLE `webinar_filter_option` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `filter_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `webinar_partner_teacher`
--

CREATE TABLE `webinar_partner_teacher` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `webinar_reports`
--

CREATE TABLE `webinar_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `webinar_reviews`
--

CREATE TABLE `webinar_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `content_quality` int(10) UNSIGNED NOT NULL,
  `instructor_skills` int(10) UNSIGNED NOT NULL,
  `purchase_worth` int(10) UNSIGNED NOT NULL,
  `support_quality` int(10) UNSIGNED NOT NULL,
  `rates` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `webinar_translations`
--

CREATE TABLE `webinar_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `webinar_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webinar_translations`
--

INSERT INTO `webinar_translations` (`id`, `webinar_id`, `locale`, `title`, `seo_description`, `description`) VALUES
(1, 1, 'en', 'Sample Course', 'SEO Description', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting`
--
ALTER TABLE `accounting`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `accounting_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `accounting_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `accounting_meeting_time_id_foreign` (`meeting_time_id`) USING BTREE,
  ADD KEY `accounting_promotion_id_foreign` (`promotion_id`) USING BTREE;

--
-- Indexes for table `advertising_banners`
--
ALTER TABLE `advertising_banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `advertising_banners_translations`
--
ALTER TABLE `advertising_banners_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertising_banners_translations_advertising_banner_id_foreign` (`advertising_banner_id`),
  ADD KEY `advertising_banners_translations_locale_index` (`locale`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliates_affiliate_user_id_foreign` (`affiliate_user_id`),
  ADD KEY `affiliates_referred_user_id_foreign` (`referred_user_id`);

--
-- Indexes for table `affiliates_codes`
--
ALTER TABLE `affiliates_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `affiliates_codes_code_unique` (`code`),
  ADD KEY `affiliates_codes_user_id_foreign` (`user_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `badges_type_index` (`type`) USING BTREE;

--
-- Indexes for table `badge_translations`
--
ALTER TABLE `badge_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `badge_translations_badge_id_foreign` (`badge_id`),
  ADD KEY `badge_translations_locale_index` (`locale`);

--
-- Indexes for table `become_instructors`
--
ALTER TABLE `become_instructors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `become_instructors_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `blog_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `slug` (`slug`) USING BTREE;

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_translations_blog_id_locale_unique` (`blog_id`,`locale`),
  ADD KEY `blog_translations_locale_index` (`locale`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cart_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `cart_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `cart_ticket_id_foreign` (`ticket_id`) USING BTREE,
  ADD KEY `cart_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  ADD KEY `cart_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  ADD KEY `cart_promotion_id_foreign` (`promotion_id`) USING BTREE,
  ADD KEY `cart_special_offer_id_foreign` (`special_offer_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE;

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_translations_category_id_foreign` (`category_id`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `certificates_quiz_id_foreign` (`quiz_id`) USING BTREE,
  ADD KEY `certificates_quiz_result_id_foreign` (`quiz_result_id`) USING BTREE,
  ADD KEY `certificates_student_id_foreign` (`student_id`) USING BTREE;

--
-- Indexes for table `certificates_templates`
--
ALTER TABLE `certificates_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `certificate_template_translations`
--
ALTER TABLE `certificate_template_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificate_template_id` (`certificate_template_id`),
  ADD KEY `certificate_template_translations_locale_index` (`locale`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `comments_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `comments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `comments_review_id_foreign` (`review_id`) USING BTREE,
  ADD KEY `comments_reply_id_foreign` (`reply_id`) USING BTREE;

--
-- Indexes for table `comments_reports`
--
ALTER TABLE `comments_reports`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `comments_reports_comment_id_foreign` (`comment_id`) USING BTREE;

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `course_learning`
--
ALTER TABLE `course_learning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_learning_user_id_foreign` (`user_id`),
  ADD KEY `course_learning_text_lesson_id_foreign` (`text_lesson_id`),
  ADD KEY `course_learning_file_id_foreign` (`file_id`),
  ADD KEY `course_learning_session_id_foreign` (`session_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `discounts_code_unique` (`code`),
  ADD KEY `discounts_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `discount_users`
--
ALTER TABLE `discount_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `discount_users_discount_id_foreign` (`discount_id`) USING BTREE,
  ADD KEY `discount_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `faqs_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `faqs_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_translations_faq_id_foreign` (`faq_id`),
  ADD KEY `faq_translations_locale_index` (`locale`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `favorites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `favorites_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `feature_webinars`
--
ALTER TABLE `feature_webinars`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `feature_webinars_webinar_id_index` (`webinar_id`) USING BTREE;

--
-- Indexes for table `feature_webinar_translations`
--
ALTER TABLE `feature_webinar_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_webinar_translations_feature_webinar_id_foreign` (`feature_webinar_id`),
  ADD KEY `feature_webinar_translations_locale_index` (`locale`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `files_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `files_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `files_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `file_translations`
--
ALTER TABLE `file_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_translations_file_id_foreign` (`file_id`),
  ADD KEY `file_translations_locale_index` (`locale`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `filters_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indexes for table `filter_options`
--
ALTER TABLE `filter_options`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `filter_options_filter_id_foreign` (`filter_id`) USING BTREE;

--
-- Indexes for table `filter_option_translations`
--
ALTER TABLE `filter_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_option_translations_filter_option_id_foreign` (`filter_option_id`),
  ADD KEY `filter_option_translations_locale_index` (`locale`);

--
-- Indexes for table `filter_translations`
--
ALTER TABLE `filter_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_translations_filter_id_foreign` (`filter_id`),
  ADD KEY `filter_translations_locale_index` (`locale`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `follows_follower_foreign` (`follower`) USING BTREE,
  ADD KEY `follows_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `groups_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `group_users_group_id_foreign` (`group_id`) USING BTREE,
  ADD KEY `group_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `meetings_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `meeting_times`
--
ALTER TABLE `meeting_times`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `meeting_times_meeting_id_foreign` (`meeting_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticeboards_organ_id_foreign` (`organ_id`),
  ADD KEY `noticeboards_user_id_foreign` (`user_id`);

--
-- Indexes for table `noticeboards_status`
--
ALTER TABLE `noticeboards_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticeboards_status_noticeboard_id_foreign` (`noticeboard_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `notifications_group_id_foreign` (`group_id`) USING BTREE;

--
-- Indexes for table `notifications_status`
--
ALTER TABLE `notifications_status`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_status_notification_id_foreign` (`notification_id`) USING BTREE;

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `offline_payments_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `order_items_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `order_items_order_id_foreign` (`order_id`) USING BTREE,
  ADD KEY `order_items_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `order_items_ticket_id_foreign` (`ticket_id`) USING BTREE,
  ADD KEY `order_items_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  ADD KEY `order_items_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  ADD KEY `order_items_promotion_id_foreign` (`promotion_id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_link_unique` (`link`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_translations_page_id_foreign` (`page_id`),
  ADD KEY `page_translations_locale_index` (`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `payment_channels`
--
ALTER TABLE `payment_channels`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `payouts_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `payu_transactions`
--
ALTER TABLE `payu_transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `payu_transactions_transaction_id_unique` (`transaction_id`) USING BTREE,
  ADD KEY `payu_transactions_status_index` (`status`) USING BTREE,
  ADD KEY `payu_transactions_verified_at_index` (`verified_at`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `permissions_role_id_index` (`role_id`) USING BTREE,
  ADD KEY `permissions_section_id_index` (`section_id`) USING BTREE;

--
-- Indexes for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `prerequisites_webinar_id_foreign` (`webinar_id`) USING BTREE;

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promotion_translations`
--
ALTER TABLE `promotion_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_translations_promotion_id_foreign` (`promotion_id`),
  ADD KEY `promotion_translations_locale_index` (`locale`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `purchases_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `purchases_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quizzes_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `quizzes_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `quizzes_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `quizzes_questions`
--
ALTER TABLE `quizzes_questions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quizzes_questions_quiz_id_foreign` (`quiz_id`) USING BTREE,
  ADD KEY `quizzes_questions_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `quizzes_questions_answers`
--
ALTER TABLE `quizzes_questions_answers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quizzes_questions_answers_question_id_foreign` (`question_id`) USING BTREE,
  ADD KEY `quizzes_questions_answers_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `quizzes_questions_answer_translations`
--
ALTER TABLE `quizzes_questions_answer_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_questions_answer_id` (`quizzes_questions_answer_id`),
  ADD KEY `quizzes_questions_answer_translations_locale_index` (`locale`);

--
-- Indexes for table `quizzes_results`
--
ALTER TABLE `quizzes_results`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `quizzes_results_quiz_id_foreign` (`quiz_id`) USING BTREE,
  ADD KEY `quizzes_results_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `quiz_question_translations`
--
ALTER TABLE `quiz_question_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_question_translations_quiz_question_id_foreign` (`quizzes_question_id`),
  ADD KEY `quiz_question_translations_locale_index` (`locale`);

--
-- Indexes for table `quiz_translations`
--
ALTER TABLE `quiz_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_translations_quiz_id_foreign` (`quiz_id`),
  ADD KEY `quiz_translations_locale_index` (`locale`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `rating_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `rating_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `rating_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `reserve_meetings`
--
ALTER TABLE `reserve_meetings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `reserve_meetings_meeting_time_id_foreign` (`meeting_time_id`) USING BTREE,
  ADD KEY `reserve_meetings_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `reserve_meetings_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sales_order_id_foreign` (`order_id`) USING BTREE,
  ADD KEY `sales_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `sales_meeting_id_foreign` (`meeting_id`) USING BTREE,
  ADD KEY `sales_ticket_id_foreign` (`ticket_id`) USING BTREE,
  ADD KEY `sales_buyer_id_foreign` (`buyer_id`) USING BTREE,
  ADD KEY `sales_seller_id_foreign` (`seller_id`) USING BTREE,
  ADD KEY `sales_promotion_id_foreign` (`promotion_id`) USING BTREE;

--
-- Indexes for table `sales_log`
--
ALTER TABLE `sales_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_status_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sessions_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `sessions_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `sessions_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `session_reminds`
--
ALTER TABLE `session_reminds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_reminds_session_id_foreign` (`session_id`),
  ADD KEY `session_reminds_user_id_foreign` (`user_id`);

--
-- Indexes for table `session_translations`
--
ALTER TABLE `session_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_translations_session_id_foreign` (`session_id`),
  ADD KEY `session_translations_locale_index` (`locale`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_translations_setting_id_foreign` (`setting_id`),
  ADD KEY `setting_translations_locale_index` (`locale`);

--
-- Indexes for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `special_offers_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `special_offers_webinar_id_foreign` (`webinar_id`) USING BTREE;

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `subscribe_translations`
--
ALTER TABLE `subscribe_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_translations_subscribe_id_foreign` (`subscribe_id`),
  ADD KEY `subscribe_translations_locale_index` (`locale`);

--
-- Indexes for table `subscribe_uses`
--
ALTER TABLE `subscribe_uses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `subscribe_uses_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `subscribe_uses_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `subscribe_uses_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  ADD KEY `subscribe_uses_sale_id_foreign` (`sale_id`) USING BTREE;

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `supports_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `supports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `supports_department_id_foreign` (`department_id`) USING BTREE;

--
-- Indexes for table `support_conversations`
--
ALTER TABLE `support_conversations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `support_conversations_support_id_foreign` (`support_id`) USING BTREE,
  ADD KEY `support_conversations_sender_id_foreign` (`sender_id`) USING BTREE,
  ADD KEY `support_conversations_supporter_id_foreign` (`supporter_id`) USING BTREE;

--
-- Indexes for table `support_departments`
--
ALTER TABLE `support_departments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `support_department_translations`
--
ALTER TABLE `support_department_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_department_id` (`support_department_id`),
  ADD KEY `support_department_translations_locale_index` (`locale`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tags_webinar_id_foreign` (`webinar_id`) USING BTREE;

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonial_translations_testimonial_id_foreign` (`testimonial_id`),
  ADD KEY `testimonial_translations_locale_index` (`locale`);

--
-- Indexes for table `text_lessons`
--
ALTER TABLE `text_lessons`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `text_lessons_creator_id_foreign` (`creator_id`) USING BTREE,
  ADD KEY `text_lessons_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `text_lessons_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `text_lessons_attachments`
--
ALTER TABLE `text_lessons_attachments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `text_lessons_attachments_text_lesson_id_foreign` (`text_lesson_id`) USING BTREE,
  ADD KEY `text_lessons_attachments_file_id_foreign` (`file_id`) USING BTREE;

--
-- Indexes for table `text_lesson_translations`
--
ALTER TABLE `text_lesson_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `text_lesson_id` (`text_lesson_id`),
  ADD KEY `text_lesson_translations_locale_index` (`locale`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tickets_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `tickets_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `ticket_translations`
--
ALTER TABLE `ticket_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_translations_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_translations_locale_index` (`locale`);

--
-- Indexes for table `ticket_users`
--
ALTER TABLE `ticket_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ticket_users_ticket_id_foreign` (`ticket_id`) USING BTREE,
  ADD KEY `ticket_users_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `trend_categories`
--
ALTER TABLE `trend_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `trend_categories_category_id_index` (`category_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`) USING BTREE;

--
-- Indexes for table `users_badges`
--
ALTER TABLE `users_badges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `users_badges_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `users_badges_badge_id_foreign` (`badge_id`) USING BTREE;

--
-- Indexes for table `users_metas`
--
ALTER TABLE `users_metas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_occupations`
--
ALTER TABLE `users_occupations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `users_occupations_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `users_occupations_category_id_foreign` (`category_id`) USING BTREE;

--
-- Indexes for table `users_zoom_api`
--
ALTER TABLE `users_zoom_api`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_zoom_api_user_id_foreign` (`user_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `verifications_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `webinars`
--
ALTER TABLE `webinars`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `webinars_slug_unique` (`slug`) USING BTREE,
  ADD KEY `webinars_teacher_id_foreign` (`teacher_id`) USING BTREE,
  ADD KEY `webinars_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `webinars_slug_index` (`slug`) USING BTREE,
  ADD KEY `webinars_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `webinar_chapters`
--
ALTER TABLE `webinar_chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webinar_chapters_user_id_foreign` (`user_id`),
  ADD KEY `webinar_chapters_webinar_id_foreign` (`webinar_id`);

--
-- Indexes for table `webinar_chapter_translations`
--
ALTER TABLE `webinar_chapter_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webinar_chapter_id` (`webinar_chapter_id`),
  ADD KEY `webinar_chapter_translations_locale_index` (`locale`);

--
-- Indexes for table `webinar_filter_option`
--
ALTER TABLE `webinar_filter_option`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `webinar_filter_option_filter_option_id_foreign` (`filter_option_id`) USING BTREE,
  ADD KEY `webinar_filter_option_webinar_id_foreign` (`webinar_id`) USING BTREE;

--
-- Indexes for table `webinar_partner_teacher`
--
ALTER TABLE `webinar_partner_teacher`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `webinar_partner_teacher_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `webinar_partner_teacher_teacher_id_foreign` (`teacher_id`) USING BTREE;

--
-- Indexes for table `webinar_reports`
--
ALTER TABLE `webinar_reports`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `webinar_reports_webinar_id_foreign` (`webinar_id`) USING BTREE;

--
-- Indexes for table `webinar_reviews`
--
ALTER TABLE `webinar_reviews`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `webinar_reviews_webinar_id_foreign` (`webinar_id`) USING BTREE,
  ADD KEY `webinar_reviews_creator_id_foreign` (`creator_id`) USING BTREE;

--
-- Indexes for table `webinar_translations`
--
ALTER TABLE `webinar_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webinar_translations_webinar_id_foreign` (`webinar_id`),
  ADD KEY `webinar_translations_locale_index` (`locale`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting`
--
ALTER TABLE `accounting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertising_banners`
--
ALTER TABLE `advertising_banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertising_banners_translations`
--
ALTER TABLE `advertising_banners_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliates_codes`
--
ALTER TABLE `affiliates_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `badge_translations`
--
ALTER TABLE `badge_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `become_instructors`
--
ALTER TABLE `become_instructors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates_templates`
--
ALTER TABLE `certificates_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_template_translations`
--
ALTER TABLE `certificate_template_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments_reports`
--
ALTER TABLE `comments_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_learning`
--
ALTER TABLE `course_learning`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_users`
--
ALTER TABLE `discount_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_webinars`
--
ALTER TABLE `feature_webinars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_webinar_translations`
--
ALTER TABLE `feature_webinar_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file_translations`
--
ALTER TABLE `file_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filter_options`
--
ALTER TABLE `filter_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filter_option_translations`
--
ALTER TABLE `filter_option_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filter_translations`
--
ALTER TABLE `filter_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_times`
--
ALTER TABLE `meeting_times`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticeboards`
--
ALTER TABLE `noticeboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticeboards_status`
--
ALTER TABLE `noticeboards_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications_status`
--
ALTER TABLE `notifications_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `offline_payments`
--
ALTER TABLE `offline_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_channels`
--
ALTER TABLE `payment_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payu_transactions`
--
ALTER TABLE `payu_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6445;

--
-- AUTO_INCREMENT for table `prerequisites`
--
ALTER TABLE `prerequisites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_translations`
--
ALTER TABLE `promotion_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quizzes_questions`
--
ALTER TABLE `quizzes_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `quizzes_questions_answers`
--
ALTER TABLE `quizzes_questions_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `quizzes_questions_answer_translations`
--
ALTER TABLE `quizzes_questions_answer_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `quizzes_results`
--
ALTER TABLE `quizzes_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_question_translations`
--
ALTER TABLE `quiz_question_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `quiz_translations`
--
ALTER TABLE `quiz_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserve_meetings`
--
ALTER TABLE `reserve_meetings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_log`
--
ALTER TABLE `sales_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1679;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_reminds`
--
ALTER TABLE `session_reminds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_translations`
--
ALTER TABLE `session_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `special_offers`
--
ALTER TABLE `special_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe_translations`
--
ALTER TABLE `subscribe_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe_uses`
--
ALTER TABLE `subscribe_uses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_conversations`
--
ALTER TABLE `support_conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_departments`
--
ALTER TABLE `support_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_department_translations`
--
ALTER TABLE `support_department_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `text_lessons`
--
ALTER TABLE `text_lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `text_lessons_attachments`
--
ALTER TABLE `text_lessons_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `text_lesson_translations`
--
ALTER TABLE `text_lesson_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_translations`
--
ALTER TABLE `ticket_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_users`
--
ALTER TABLE `ticket_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trend_categories`
--
ALTER TABLE `trend_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_badges`
--
ALTER TABLE `users_badges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_metas`
--
ALTER TABLE `users_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_occupations`
--
ALTER TABLE `users_occupations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `users_zoom_api`
--
ALTER TABLE `users_zoom_api`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webinars`
--
ALTER TABLE `webinars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webinar_chapters`
--
ALTER TABLE `webinar_chapters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webinar_chapter_translations`
--
ALTER TABLE `webinar_chapter_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webinar_filter_option`
--
ALTER TABLE `webinar_filter_option`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webinar_partner_teacher`
--
ALTER TABLE `webinar_partner_teacher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webinar_reports`
--
ALTER TABLE `webinar_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webinar_reviews`
--
ALTER TABLE `webinar_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webinar_translations`
--
ALTER TABLE `webinar_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounting`
--
ALTER TABLE `accounting`
  ADD CONSTRAINT `accounting_meeting_time_id_foreign` FOREIGN KEY (`meeting_time_id`) REFERENCES `meeting_times` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertising_banners_translations`
--
ALTER TABLE `advertising_banners_translations`
  ADD CONSTRAINT `advertising_banners_translations_advertising_banner_id_foreign` FOREIGN KEY (`advertising_banner_id`) REFERENCES `advertising_banners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD CONSTRAINT `affiliates_affiliate_user_id_foreign` FOREIGN KEY (`affiliate_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `affiliates_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affiliates_codes`
--
ALTER TABLE `affiliates_codes`
  ADD CONSTRAINT `affiliates_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `badge_translations`
--
ALTER TABLE `badge_translations`
  ADD CONSTRAINT `badge_translations_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `become_instructors`
--
ALTER TABLE `become_instructors`
  ADD CONSTRAINT `become_instructors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_special_offer_id_foreign` FOREIGN KEY (`special_offer_id`) REFERENCES `special_offers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_quiz_result_id_foreign` FOREIGN KEY (`quiz_result_id`) REFERENCES `quizzes_results` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificate_template_translations`
--
ALTER TABLE `certificate_template_translations`
  ADD CONSTRAINT `certificate_template_id` FOREIGN KEY (`certificate_template_id`) REFERENCES `certificates_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `webinar_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments_reports`
--
ALTER TABLE `comments_reports`
  ADD CONSTRAINT `comments_reports_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_learning`
--
ALTER TABLE `course_learning`
  ADD CONSTRAINT `course_learning_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_learning_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_learning_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_learning_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discount_users`
--
ALTER TABLE `discount_users`
  ADD CONSTRAINT `discount_users_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discount_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `faqs_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feature_webinars`
--
ALTER TABLE `feature_webinars`
  ADD CONSTRAINT `feature_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feature_webinar_translations`
--
ALTER TABLE `feature_webinar_translations`
  ADD CONSTRAINT `feature_webinar_translations_feature_webinar_id_foreign` FOREIGN KEY (`feature_webinar_id`) REFERENCES `feature_webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file_translations`
--
ALTER TABLE `file_translations`
  ADD CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filter_options`
--
ALTER TABLE `filter_options`
  ADD CONSTRAINT `filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filter_option_translations`
--
ALTER TABLE `filter_option_translations`
  ADD CONSTRAINT `filter_option_translations_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filter_translations`
--
ALTER TABLE `filter_translations`
  ADD CONSTRAINT `filter_translations_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_follower_foreign` FOREIGN KEY (`follower`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_users`
--
ALTER TABLE `group_users`
  ADD CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_times`
--
ALTER TABLE `meeting_times`
  ADD CONSTRAINT `meeting_times_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD CONSTRAINT `noticeboards_organ_id_foreign` FOREIGN KEY (`organ_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `noticeboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `noticeboards_status`
--
ALTER TABLE `noticeboards_status`
  ADD CONSTRAINT `noticeboards_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `noticeboards` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications_status`
--
ALTER TABLE `notifications_status`
  ADD CONSTRAINT `notifications_status_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD CONSTRAINT `offline_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permissions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `prerequisites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_translations`
--
ALTER TABLE `promotion_translations`
  ADD CONSTRAINT `promotion_translations_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes_questions`
--
ALTER TABLE `quizzes_questions`
  ADD CONSTRAINT `quizzes_questions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes_questions_answers`
--
ALTER TABLE `quizzes_questions_answers`
  ADD CONSTRAINT `quizzes_questions_answers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_questions_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes_questions_answer_translations`
--
ALTER TABLE `quizzes_questions_answer_translations`
  ADD CONSTRAINT `quizzes_questions_answer_id` FOREIGN KEY (`quizzes_questions_answer_id`) REFERENCES `quizzes_questions_answers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes_results`
--
ALTER TABLE `quizzes_results`
  ADD CONSTRAINT `quizzes_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_question_translations`
--
ALTER TABLE `quiz_question_translations`
  ADD CONSTRAINT `quiz_question_translations_quiz_question_id_foreign` FOREIGN KEY (`quizzes_question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_translations`
--
ALTER TABLE `quiz_translations`
  ADD CONSTRAINT `quiz_translations_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reserve_meetings`
--
ALTER TABLE `reserve_meetings`
  ADD CONSTRAINT `reserve_meetings_meeting_time_id_foreign` FOREIGN KEY (`meeting_time_id`) REFERENCES `meeting_times` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserve_meetings_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserve_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_log`
--
ALTER TABLE `sales_log`
  ADD CONSTRAINT `sales_status_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sessions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sessions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_reminds`
--
ALTER TABLE `session_reminds`
  ADD CONSTRAINT `session_reminds_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `session_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_translations`
--
ALTER TABLE `session_translations`
  ADD CONSTRAINT `session_translations_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD CONSTRAINT `special_offers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `special_offers_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribe_translations`
--
ALTER TABLE `subscribe_translations`
  ADD CONSTRAINT `subscribe_translations_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribe_uses`
--
ALTER TABLE `subscribe_uses`
  ADD CONSTRAINT `subscribe_uses_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribe_uses_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribe_uses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribe_uses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_conversations`
--
ALTER TABLE `support_conversations`
  ADD CONSTRAINT `support_conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_conversations_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_department_translations`
--
ALTER TABLE `support_department_translations`
  ADD CONSTRAINT `support_department_id` FOREIGN KEY (`support_department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `text_lessons`
--
ALTER TABLE `text_lessons`
  ADD CONSTRAINT `text_lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `text_lessons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `text_lessons_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `text_lessons_attachments`
--
ALTER TABLE `text_lessons_attachments`
  ADD CONSTRAINT `text_lessons_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `text_lessons_attachments_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `text_lesson_translations`
--
ALTER TABLE `text_lesson_translations`
  ADD CONSTRAINT `text_lesson_id` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_translations`
--
ALTER TABLE `ticket_translations`
  ADD CONSTRAINT `ticket_translations_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_users`
--
ALTER TABLE `ticket_users`
  ADD CONSTRAINT `ticket_users_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trend_categories`
--
ALTER TABLE `trend_categories`
  ADD CONSTRAINT `trend_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_badges`
--
ALTER TABLE `users_badges`
  ADD CONSTRAINT `users_badges_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_occupations`
--
ALTER TABLE `users_occupations`
  ADD CONSTRAINT `users_occupations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_occupations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_zoom_api`
--
ALTER TABLE `users_zoom_api`
  ADD CONSTRAINT `users_zoom_api_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinars`
--
ALTER TABLE `webinars`
  ADD CONSTRAINT `webinars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinars_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinars_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_chapters`
--
ALTER TABLE `webinar_chapters`
  ADD CONSTRAINT `webinar_chapters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinar_chapters_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_chapter_translations`
--
ALTER TABLE `webinar_chapter_translations`
  ADD CONSTRAINT `webinar_chapter_id` FOREIGN KEY (`webinar_chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_filter_option`
--
ALTER TABLE `webinar_filter_option`
  ADD CONSTRAINT `webinar_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinar_filter_option_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_partner_teacher`
--
ALTER TABLE `webinar_partner_teacher`
  ADD CONSTRAINT `webinar_partner_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinar_partner_teacher_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_reports`
--
ALTER TABLE `webinar_reports`
  ADD CONSTRAINT `webinar_reports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_reviews`
--
ALTER TABLE `webinar_reviews`
  ADD CONSTRAINT `webinar_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `webinar_reviews_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webinar_translations`
--
ALTER TABLE `webinar_translations`
  ADD CONSTRAINT `webinar_translations_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
