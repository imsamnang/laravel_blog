-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2019 at 10:28 AM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_programkit`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', 'php-2018-09-24-5ba8a5e47d70f.jpg', '2018-09-24 01:52:53', '2018-09-24 01:52:53'),
(2, 'Laravel', 'laravel', 'laravel-2018-09-24-5ba8a5efede7f.png', '2018-09-24 01:53:04', '2018-09-24 01:53:04'),
(3, 'Codeigniter', 'codeigniter', 'codeigniter-2018-09-24-5ba8a5ff4b474.png', '2018-09-24 01:53:19', '2018-09-24 01:53:19'),
(4, 'Angular', 'angular', 'angular-2018-09-24-5ba8a60d95356.png', '2018-09-24 01:53:34', '2018-09-24 01:53:34'),
(5, 'VueJS', 'vuejs', 'vuejs-2018-09-24-5ba8a61c34fa1.jpeg', '2018-09-24 01:53:48', '2018-09-24 01:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
CREATE TABLE IF NOT EXISTS `category_post` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-09-24 01:55:49', '2018-09-24 01:55:49'),
(2, 1, 3, '2018-09-24 01:55:49', '2018-09-24 01:55:49'),
(3, 2, 2, '2018-09-24 01:56:37', '2018-09-24 01:56:37'),
(4, 2, 3, '2018-09-24 01:56:37', '2018-09-24 01:56:37'),
(5, 3, 3, '2018-09-24 02:01:52', '2018-09-24 02:01:52'),
(6, 4, 4, '2018-09-24 02:03:34', '2018-09-24 02:03:34'),
(7, 5, 4, '2018-09-24 02:04:14', '2018-09-24 02:04:14'),
(8, 6, 1, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(9, 6, 2, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(10, 6, 3, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(11, 7, 1, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(12, 7, 3, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(13, 8, 1, '2018-09-24 02:07:22', '2018-09-24 02:07:22'),
(14, 8, 2, '2018-09-24 02:07:22', '2018-09-24 02:07:22'),
(15, 9, 1, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(16, 9, 2, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(17, 9, 3, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(18, 9, 4, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(19, 10, 1, '2018-10-28 02:24:23', '2018-10-28 02:24:23'),
(20, 10, 2, '2018-10-28 02:24:23', '2018-10-28 02:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"eb11bc78-471c-4eed-b4b8-22b7a309257e\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537779818, 1537779818),
(2, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"cfe97554-7d45-4090-af84-abb4e2affabe\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537779854, 1537779854),
(3, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"394d9b22-cdfc-4b31-9832-d8080b51fa3a\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537779894, 1537779894),
(4, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"4a444cd3-be6a-4e57-8066-275d0a735f44\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537779939, 1537779939),
(5, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApproved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:36:\\\"App\\\\Notifications\\\\AuthorPostApproved\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2c5d0976-9f71-42b5-995d-c088fcadbc03\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537780309, 1537780309),
(6, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:12:\\\"kk@yahoo.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"540ffc55-b345-4e22-a120-a07f34573b11\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537780309, 1537780309),
(7, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:15:\\\"bosba@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"066730b6-fdc7-4cf0-ab2b-d868242446fc\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537780309, 1537780309),
(8, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:11:\\\"jj@blog.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"19caec8c-7b95-4112-a758-cb57e948d9d6\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1537780309, 1537780309),
(9, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"470642a3-5766-4361-8044-88eee37f3095\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1540718663, 1540718663),
(10, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApproved\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:36:\\\"App\\\\Notifications\\\\AuthorPostApproved\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"465873c5-80d0-4e76-9710-cf0423c5257d\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1540718777, 1540718777),
(11, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:12:\\\"kk@yahoo.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"419d6551-c747-42a8-9528-351a6905331e\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1540718777, 1540718777),
(12, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:15:\\\"bosba@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"fa1b6fe3-8a88-43df-847e-0956454c4e81\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1540718777, 1540718777),
(13, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:11:\\\"jj@blog.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":8:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"27143a6c-1301-4f5f-9cde-930a54999525\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1540718777, 1540718777);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_24_044733_create_roles_table', 1),
(4, '2018_09_05_034923_create_tags_table', 1),
(5, '2018_09_08_160030_create_categories_table', 1),
(6, '2018_09_09_151032_create_posts_table', 1),
(7, '2018_09_09_151418_create_category_post_table', 1),
(8, '2018_09_09_151453_create_post_tag_table', 1),
(9, '2018_09_17_065423_create_subscribers_table', 1),
(10, '2018_09_21_022235_create_jobs_table', 1),
(11, '2018_09_24_074755_create_post_user_table', 1),
(12, '2018_10_11_092129_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, 'How to Fix Canon Printer Carriage Jam Issue', 'how-to-fix-canon-printer-carriage-jam-issue', 'how-to-fix-canon-printer-carriage-jam-issue-2018-09-24-5ba8a6949b7d1.jpg', '<p>Unlike other printing devices, Canon Printer has proven its presence over the minds for office as well as home use. It fits the picture of an ideal printing device and gives out sleek and crisp printouts in a go. But you can also get problems related to quality, ink cartridges and sometimes paper jam. If you are facing such issue, you must connect the tech supporters at&nbsp;<a href=\"http://www.printer-customercare-number.co.uk/\">Canon Printer Technical Support Number UK</a>&nbsp;08081782624 instantly.</p>\r\n<p>If you have any printing device, you know that the carriage of a printer holds the ink cartridges and even slides back and forth for transferring ink onto the printing sheet. But you must know that if some Paper jams issue is obtained into the machine, it can sometimes lead to the carriage jams, mainly after you print on the thicker paper. And you should also know that the carriage stalls, you will probably hear a grinding noise as the printer goes on to move on the carriage. It happens because of the issue that the actuator arm is stuck, which is preventing the carriage and don&rsquo;t allow it to move. If you want to resolve such problem, you should follow the steps as suggested below:</p>\r\n<ul>\r\n<li>You need to unplug the power cord from the device and open the cover to disclose the carriage assembly.<br /><br /></li>\r\n<li>And then, squeeze the two levers underneath the paper tray together for removing the tray.<br /><br /></li>\r\n<li>Thereafter, you just have to slide the carriage assembly from the left side of the printer into the middle where you can access it easily. And when the carriage assembly doesn&rsquo;t slide, you can move to the next step.<br /><br /></li>\r\n<li>After that, push down the large black bar that can be seen above the rollers and then you need to release it so that it springs back up. And then shift the carriage assembly to the right again. If it still does, just forward to the next step.<br /><br /></li>\r\n<li>Now, look for the flat black component seen below the rollers in the tray compartment. You will see some flat lying component that is parallel with the base of the printer. And when it is pointing upward, just push it downward.<br /><br /></li>\r\n<li>Now, you need to slide the carriage assembly towards the right and put all the parts in a correct manner.<br /><br /></li>\r\n<li>Thereafter, lift the actuator arm, which is located directly above the white or gray gear assembly at the left side of the printer. When you lift and release it, you should have to restore it to the proper position.<br /><br /></li>\r\n<li>And now, you have to put the paper tray back in the device. When the cover of the printer remains still open, plug in the power cord and turns the printer on.<br /><br /></li>\r\n<li>You can press and hold Resume, then close the cover of the printing device.</li>\r\n</ul>', 1, 1, 1, '2018-09-24 01:55:49', '2018-10-11 02:10:03'),
(2, 1, 'Get best deals with Microsoft Office 365 Business Premium Promo Code', 'get-best-deals-with-microsoft-office-365-business-premium-promo-code', 'get-best-deals-with-microsoft-office-365-business-premium-promo-code-2018-09-24-5ba8a6c389585.png', '<p>If you want to get the best Office Software Suite for your business, you must look for Office 365 Business Premium because nothing is better than it. You can get loads of features which are essential for your work professionally and hence will make your life easier than earlier. For example you will get a business class email outlook, which is much rich in features, and can be accessed from either Desktop or from web browsers. If you have several clients you can send attachments up to 150MB, which is required every time. You can store all your work in OneDrive which will allow around 1TB of storage which can be used and accessed virtually from any place for your collaboration with your colleagues. Your PCs can be synced with the software for offline access as well. This will help you to exchange documents inside as well as outside the organization without any limitation.<br /><br />Microsoft has also announced several&nbsp;<a href=\"http://www.office2016promotionalcode.com/microsoft-office-365-business-premium-promo-code-coupons.html\">Office 365 Business Premium Promo Code&nbsp;</a>so that you can buy the software upon redemption at the time of purchase. These can give you lots of discounts and allow you to get the software at a lesser price. It is now easier to hold online conferences with A/V using the feature called one click screen sharing and the users can also create a chat based workspace for instant messaging. What can be better than this? You can also make a corporate social network to allow your employees get connected to the clients, and share information seamlessly across teams. It is now much easier to manage work with Software planner so that you and your team mates can create and organize new plans and share the work with others. Online scheduling is possible with Microsoft Bookings and thus you can manage your time with clients about creating appointments.<br /><br />The Outlook customer manager is the ideal way to create small business CRM and thus maintain a better customer relationship. You can use Sway which is required for creating interactive reports and presentations, from any of the devices. Office Delve can collect analyzed signals from user&rsquo;s behavior and thus can maintain personal insights for better experience. There are few additional features that you might get like building automated workflow, synchronize files<a href=\"http://www.articlesfactory.com/\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Find Article\" border=\"0\" /></a>, and many more. You can also publish business apps specially customized for your office for mobile and web based applications through PowerApps exclusively designed by the company for your ease of use.<br /><br />All these features make Office 365 quite on the costlier side; hence you need to definitely grab some of the well designed Microsoft Office 365 Business Premium Renewal promo code so that the right discounts can be obtained at the time of purchase. But you need to be conscious about that fact that you must grab these codes at the earliest. They are in huge demand and can simply exhaust out within few weeks of their announcements. You can search for the same online and get the best offers you can redeem. Otherwise you can also check out some of the retail stores of Microsoft which can offer you the same. What can be better than this?</p>', 0, 1, 1, '2018-09-24 01:56:37', '2018-09-24 01:56:37'),
(3, 1, 'My MacBook is not charging. What do I do?', 'my-macbook-is-not-charging-what-do-i-do', 'my-macbook-is-not-charging-what-do-i-do-2018-09-24-5ba8a8000b64b.jpg', '<p>And when the battery become dead or charge comes to zero percent, you can no more use it. Therefore, you can&rsquo;t even imagine your MacBook without any charge source and thus you can&rsquo;t access it effectively. If you are using any MacBook, then you can contact the professionals at +44-800-260-5673&nbsp;<a href=\"http://www.applehelpnumber.co.uk/mac-support.html\">MacBook Customer Care Number UK</a>&nbsp;for effective solutions.</p>\r\n<p>There are many reasons that make your MacBook not charging up. It might be broken connections, some Hardware issue, or Battery critical condition. Sometimes, this situation appears due to overheating or incorrect settings. If you are looking for the steps that help troubleshoot a MacBook that is not charging, then you can follow the steps as suggested below:</p>\r\n<ul>\r\n<li>Check for any Hardware Problem:</li>\r\n</ul>\r\n<p>Before you initiate, you must look for the basic errors or inspect the hardware carefully. When your MacBook battery is not charging, just check upon the power cable and inspect everything. Upon finding any damage in the charging cable you need to replace it soon. This is also possible that dust has build up in the charging port and it is blocking the connection as well. Do check whether you have plugged your laptop in the wall socket. Also ensure that it is turned on or you can also try a different socket if there is something wrong with it.</p>\r\n<ul>\r\n<li>Rebooting Can Also Help:</li>\r\n</ul>\r\n<p>As applications on your MacBook get frozen, there are chances that hardware of the charging option will also get frozen. Therefore, when your MacBook won&rsquo;t charge, just try to restart it as soon as possible. For doing so, you need to click on the Apple logo on your screen and then click Restart. After that, you have to wait for the reboot and then try charging your MacBook once again.</p>\r\n<ul>\r\n<li>Analyze the battery:</li>\r\n</ul>\r\n<p>I hope you already know that the MacBook battery might wear out in some days. This is recommended that you should always check on its status. You should timely analyze your battery position when your Mac is not charging up. For viewing the state of the battery status, just press and hold Alt key and click on the icon of the battery in the Menu Bar. Now, you can check the battery status.</p>\r\n<ul>\r\n<li>Reset the SMC:</li>\r\n</ul>\r\n<p>You must know that the System Management Controller or SMC is active for the battery management and the indicator lights. And when your Mac battery is not charging, resetting the SMC is the good option. There are two different ways while resetting the SMC for MacBook&rsquo;s that is for removable battery and a non-removable battery. The older Mac has removable batteries and the latest ones include non-removable batteries but resetting the SMC is different for both of them.</p>\r\n<ul>\r\n<li>Cooling Your MacBook can be effective:</li>\r\n</ul>\r\n<p>Sometimes, simple reasons can cause big trouble. This can also be possible that your MacBook battery is not charging because of the overheating. This might block out the access to the battery as a safety measure and if your MacBook is too hot to touch then simply turn it off and leave it for some time. Cooling it will be the right choice if it is the reason behind this problematic situation.</p>\r\n<p>If you have any other related query<a href=\"http://www.articlesfactory.com/articles/computers.html\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Computer Technology Articles\" border=\"0\" /></a>, you can talk to the tech personalities at +44-800-260-5673&nbsp;<a href=\"http://www.applehelpnumber.co.uk/\">Apple Support Number UK</a>&nbsp;for on the spot guidance. The technical personalities truly understand your problem and help you against them.</p>', 1, 1, 1, '2018-09-24 02:01:52', '2018-10-11 02:09:53'),
(4, 2, 'Convert MP4 to AMV with MP4 to AMV Converter Easily', 'convert-mp4-to-amv-with-mp4-to-amv-converter-easily', 'convert-mp4-to-amv-with-mp4-to-amv-converter-easily-2018-09-24-5ba8a86604c2b.jpg', '<p>Why Convert MP4 to AMV?</p>\r\n<p>Is it confused that why it is a necessity to convert MP4 to AMV as it seems MP4 is much more popular now? In fact, MP4 is not that powerful as we think. Here are some reasons why converting MP4 to AMV is a necessary.</p>\r\n<ul>\r\n<li>Reason 1:&nbsp;Need to share videos on anime-sharing sites.</li>\r\n</ul>\r\n<ul>\r\n<li>Reason 2:&nbsp;Want relevant videos with small size for MP4/MP3 Players.</li>\r\n</ul>\r\n<ul>\r\n<li>Reason 3:&nbsp;Have MP4 codec issues when playing MP4 videos in MP4/MP3 Players and choose MP4/MP3 Players more proper format AMV for them.</li>\r\n</ul>\r\n<p>This article aims to solve MP4 to AMV conversion issues for you. So the following passage is going to introduce you a step by step guide on&nbsp;<a href=\"http://www.cicever.com/videos/convert-mp4-to-amv.html\">how to convert MP4 to AMV on Windows and Mac with a professional MP4 to AMV Converter</a>.</p>\r\n<p>Powerful MP4 to AMV Converter for You</p>\r\n<p>This advanced MP4 to AMV Converter is definitely the most professional tool in converting MP4 to AMV. You may choose to convert MP4 to AMV Converter in batch with fast converting speed. With the good MP4 to AMV Converter, it will be never a problem to share videos on anime-sharing sites, play any MP4 videos on MP4 Player and MP3 Player.</p>\r\n<p>Besides, the ideal MP4 to AMV conversion tool is sweetly designed for both PC and Mac customers. So users can free get your MP4 to AMV converting tool.</p>\r\n<p>In addition to converting MP4 to AMV, the nice MP4 to AMV Converter can also convert among all the popular video and audio formats with high quality or convert among MP4, AVI, WMV, MPEG, MKV, FLV, VOB, MTS, ARF, DAT, MXF, ASF, WebM, 3GP, DivX, Xvid, ProRes, SWF, MP3, AAC, ALAC, AIFF, WMA, WAV, M4A, FLAC etc. You can easily freely manage your videos audios on any players, devices, editors, video audio sharing sites etc.</p>\r\n<p>Furthermore, MP4 to AMV Converter can edit videos like join videos, split videos, cut videos, clip videos, compress video or audio, rotate videos, do 3D effects to videos, adjust video bitrate/sound volume/audio channel etc.</p>\r\n<p>Compare MP4 with AMV</p>\r\n<p>1)&nbsp;&nbsp; MP4 File Format</p>\r\n<ul>\r\n<li>Pros:&nbsp;MP4 is much more popular nowadays for its high compatibility for most tools like players, devices, editing tools, DVD<a href=\"http://www.articlesfactory.com/\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Free Web Content\" border=\"0\" /></a>, video audio sharing sites etc.</li>\r\n</ul>\r\n<ul>\r\n<li>Cons:&nbsp;Varied video audio codec makes many codec issues when playing.</li>\r\n</ul>\r\n<p>2)&nbsp;&nbsp; AMV File Extension</p>\r\n<ul>\r\n<li>Pros:&nbsp;High reputation in anime-sharing sites. Small video size. More common in MP4/MP3 Players.</li>\r\n</ul>\r\n<ul>\r\n<li>Cons:&nbsp;Relatively low compatibility compared with MP4.</li>\r\n</ul>', 1, 1, 0, '2018-09-24 02:03:34', '2018-10-11 02:09:57'),
(5, 2, 'Buy Brother LC103 Ink Cartridges Online for Your Printing Needs', 'buy-brother-lc103-ink-cartridges-online-for-your-printing-needs', 'buy-brother-lc103-ink-cartridges-online-for-your-printing-needs-2018-09-24-5ba8a88d4872a.png', '<p>Are you looking for ink for your Brother Printer or want to refill the cartridge with multi-color ink or the key &ndash; black ink?</p>\r\n<p>For a printer cartridge or toner, ink is the most vital thing to keep your printing needs fulfilled and provides you a stable and maximum page yield. Depending on your printer type and requirement, you can choose high quality printer ink including Brother LC103 Ink that is of high quality and keep your printouts stable and look new like for the time to come.</p>\r\n<p><a href=\"https://asapinkjets.com/cic/eg/inkjetcartridge.php?cartridge=brother-lc101bk\">Brother LC103 ink</a>&nbsp;series is available in different models like BK, C, M, Y and different others. They are compatible cartridges that come in combo packs and available in the category of OEM cartridges. They come with refill kits, bulk ink, refill accessories, photo paper and cleaner. There is a lot more associated with them that are sure to keep your printing needs fulfilled. Here, you have to make the right decision to choose the best one that is ideal for you and place your order. Prices are backed by attractive discounts too; while you will also get a gamut of added features and benefits. You have to go through the details and make a contact.</p>\r\n<p>How to Find the Best Store for Brother LC103 Ink?</p>\r\n<p>In order to get the best Brother LC103 Ink, what all you have to do is simply search for the right store that is convenient for you, go through the details and make a contact as per your requirement. Online search is one of the time-saving and convenient ways to help you in fulfilling your needs. You will come in contact with a number of reputed stores and suppliers that have proven track record and years of experience. Their main motive is to bring to you the best quality printing accessories to keep your printing needs fulfilled on-time and without any delay. You can choose OEM cartridges, re-manufactured one, and compatible one or any kind of other at competitive rates. Prices are backed by attractive discounts too; while a user guide and maintenance support guide are some other services offered to you.</p>\r\n<p>ASAP Inkjet, for instance, is a reliable retailer bringing to you high quality inkjet cartridges and a variety of ink kits that include Brother LC103 ink. You have to place your order and wait for the delivery in a safe and secure way to your address. ASAP Inkjets has been offering discount inkjet cartridges and toner cartridges for all makes and models at enormous savings. When you compare prices to local retail stores, you\'ll find that you can save up to 80% in some cases by using brand new compatible, or quality remanufactured ink cartridges that are shipped to your door, and backed by 100% Guarantee.</p>\r\n<p>So, what you are looking for<a href=\"http://www.articlesfactory.com/\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Free Web Content\" border=\"0\" /></a>, place your order now and get the Brother LC103 Ink delivered to your address.</p>', 0, 1, 1, '2018-09-24 02:04:14', '2018-09-24 02:11:49'),
(6, 2, 'Inkjet Cartridges – Choose the Best One According to Your Printer Type', 'inkjet-cartridges-choose-the-best-one-according-to-your-printer-type', 'inkjet-cartridges-choose-the-best-one-according-to-your-printer-type-2018-09-24-5ba8a8b63ffc9.jpg', '<p>An ink cartridge or inkjet cartridge is the most essential part of an inkjet printer &ndash; containing the ink that is deposited onto paper during printing. Each ink cartridge is containing one or more ink reservoirs; while different manufacturers also add electronic contacts and a chip that communicates with the printer. Inkjet printers that run on the basis of such cartridges use liquid ink to produce text and images by simply spraying microscopic droplets onto the paper where it soaks in. You can get inkjet ink that typically comes in two forms. Dye-based inks are cheaper, but produce images that can fade over time or when exposed to ultraviolet light.</p>\r\n<p>How Do Inkjet Cartridges Work?</p>\r\n<p>Depending your choice and budget, you can get high quality inkjet printers that are made by renowned brand names like HP, Lexmark, Canon, Brother and different others that use a thermal inkjet inside each partition of the ink reservoir &ndash; a heating element is taken into use with a tiny metal plate or resistor. As soon as one give printer a command through desktop or laptop or even through Smartphone, a tiny current flows through the metal or resistor making it warm and the ink in contact with the heated resistor is vaporized into a tiny steam bubble inside the nozzle. In this way, an ink droplet is forced out of the cartridge nozzle onto the paper and the process takes a fraction of a millisecond.</p>\r\n<p>Choose the Best Inkjet Cartridges</p>\r\n<p>Different types of inkjet cartridges are available in the market. Some of them use the CMYK color model that include Cyan, Magenta, Yellow and the Key &ndash; that is black. The key ink is available in two forms for graphical printing and near-waterproof variant for text. Modern inkjets carry a black cartridge for text and either a single; while CMYK combined or a discrete cartridge for each color. At the same time as keeping colors separate has become a common thing. You can also get some cartridges that contain ink specialty formulated for printing photographs. Printer manufacturers are also involved in the manufacturing of&nbsp;<a href=\"https://499inks.com/\">printer inkjet cartridges</a>. However, replacing the existing empty cartridge with an OEM one is not a good decision as the costing of per page printout can be more expensive for you.</p>\r\n<p>Here, you need to choose something as alternative that can help you in reduce the cost to a great level. For this<a href=\"http://www.articlesfactory.com/articles/health.html\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Health Fitness Articles\" border=\"0\" /></a>, you can get compatible or re-manufactured or re-filled cartridges as per the type of printer model.</p>\r\n<p>How to Buy the Best Inkjet Cartridges?</p>\r\n<p>Going online is one of the time-saving and convenient ways to help you in getting the best quality inkjet cartridges that are easy to install and come with a gamut of added features and benefits. You have to go through the details and place your order accordingly. You have to reach the right supplier or a store for them.</p>', 0, 1, 1, '2018-09-24 02:04:54', '2018-10-28 02:26:17'),
(7, 2, 'Batch Convert MKV Files to WTV for Free Playback', 'batch-convert-mkv-files-to-wtv-for-free-playback', 'batch-convert-mkv-files-to-wtv-for-free-playback-2018-09-24-5ba8a8e25d2ac.png', '<p>MKV to WTV Conversion Demands</p>\r\n<p>Have needs to convert MKV to WTV? Want to convert MKV files to WTV with no quality loss? Wonder&nbsp;<a href=\"http://www.cicever.com/videos/convert-mkv-to-wtv.html\">how to convert MKV to WTV in batch</a>&nbsp;so that lots of time can be saved? Intend to solve all MKV to WTV converting trouble?</p>\r\n<p>If so, this article will be a life-savor for you. This article will introduce a detailed guide on how to convert MKV files to WTV with a professional MKV to WTV Converter.</p>\r\n<p>MKV to WTV Converter for You</p>\r\n<p>MKV to WTV Converter is an ideal tool for MKV to WTV conversion and has both Windows and Mac version. So both Mac users and Windows users can begin converting MKV to WTV with it.</p>\r\n<p>More Powerful Features Shown</p>\r\n<ul>\r\n<li>Convert MKV to WTV in batch mode with wonderful quality.</li>\r\n</ul>\r\n<ul>\r\n<li>Convert all kinds of MKV to WTV on Windows and Mac.</li>\r\n</ul>\r\n<ul>\r\n<li>Convert MKV files to WTV for playback in Windows Media Center.</li>\r\n</ul>\r\n<ul>\r\n<li>Good MKV Converter: Being a MKV Converter, this software is able to convert any format to MKV with high quality. Of course, it also features to MKV to any format.&nbsp;</li>\r\n</ul>\r\n<ul>\r\n<li>Nice WTV Converter: Being a WTV Converter, it features to convert plenty of formats to/from WTV format.&nbsp;</li>\r\n</ul>\r\n<ul>\r\n<li>Total video and audio converter: MKV to WTV Converter enable to convert among almost 200 popular video and audio formats without trouble.</li>\r\n</ul>\r\n<ul>\r\n<li>Video Audio Editor: trim files, split video audio files, merge files, rotate files, add subtitles or watermark, adjust video or audio codec, bitrate<a href=\"http://www.articlesfactory.com/\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Free Web Content\" border=\"0\" /></a>, channel and more.</li>\r\n</ul>', 0, 1, 0, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(8, 1, 'Things that services businesses must get right in order to survive and grow', 'things-that-services-businesses-must-get-right-in-order-to-survive-and-grow', 'things-that-services-businesses-must-get-right-in-order-to-survive-and-grow-2018-09-24-5ba8a94a40d52.jpg', '<p>But for a long time these service managers have been using tools and processes that were initially designed to handle product company issues. The real question is, do they prove to be sufficient? Do service based companies need new techniques and tools? Before we can answer these questions we have to find out if service business economy is going through the desired phase or not? What exactly are the aspects which needs to be corrected in order to survive and eventually grow? Let us find out.<br /><br />1. Take care of the offering<br /><br />The problem that many businesses offering IT services in New York faces is the challenge with the design. The business will not be able to have a long grasp if the design itself is largely flawed. It must be able to satisfy the desires and needs of a large group of attractive customers. This improvement in design has to performed by changing the perspective of the managers. Instead of thinking so much about the most valued characteristics by the customers, managers must think hard and determine the most valued experience from a customer&rsquo;s point of view. Add friendly interaction, add convenience to your design and you are on the right path of constructing an effective offering.<br /><br />2. The mechanism of funding<br /><br />When you are striving for excellence you must also understand the fact that it comes at a cost, like most things. Any tangible product depends on a hefty price tag in order to make it superior. In the case of a service business such as that of IT services in New York, finding the sufficient funds for boosting excellence can be a very complicated issue to solve. It might necessarily be transaction based but it might involve various valuable elements including a subscription. They have to make sure that even non-buyers can derive value out of such service environments.&nbsp;<br /><br />3. Palatable charging of the customer<br /><br />Searching for a convenient way for the customers to pay is something that boosts the value provided by your service to a large extent. Finding that palatable charging method which might appear as less objectionable to the customer is something every service business must master. A good example of such a case might be found in Office 365 Solutions for business in Rutherford<a href=\"http://www.articlesfactory.com/articles/health.html\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Health Fitness Articles\" border=\"0\" /></a>, New Jersey. This changes a lot of perception for most customer regarding your business and in hindsight will strengthen your customer base in the general market.<br /><br />4. Create a win-win situation<br /><br />A clever management team will think of a way to enhance customer experience in spite of spending a few. These innovations sometimes provide temporary advantage in terms of competition. They are temporary because most businesses recognize these patterns and copy them therefore neutralizing the advantage to a large extent. Yet the temporary effect it can provide is of no less worth. This responsiveness level from the services is much appreciated by the customers and hence they earn brownie points for doing so. Creating such a win-win situation is something every company must strive for. -</p>', 2, 1, 1, '2018-09-24 02:07:22', '2018-10-11 01:54:17'),
(9, 1, 'Get business computers to support your business in New York.', 'get-business-computers-to-support-your-business-in-new-york', 'get-business-computers-to-support-your-business-in-new-york-2018-09-24-5ba8a9707b3a5.png', '<p>They are known for their services regarding fully managed information and various other technologies. The service is offered to one and all. A company that has been in power for more than five hundred years or a company that just crossed the five-year landmark. At, Business Computer support in New York everyone is welcome. If you too are looking for someone who will help you out with your IT support, then call us. More than often companies find it hard to appoint a full-time person who is adept in the field of IT.</p>\r\n<p>&nbsp;</p>\r\n<p>The professional level services provided by Business Computer support in New York region is worth mentioning. So, it is time you start expecting an increase in profit and productivity for the services rendered by Business Computer support in New York.</p>\r\n<p>&nbsp;</p>\r\n<p>Why should you choose Business Computer Support in New York?</p>\r\n<p>&nbsp;</p>\r\n<p>The question might arise as to why choose the services by Business Computer Support in New York, when there are so many more. Let, us tell you why. You will not find IT services that is more reliable, affordable and worthy than this for your small and medium sized business.</p>\r\n<p>&nbsp;</p>\r\n<p>What do Business Computer Support in New York aim at?</p>\r\n<p>&nbsp;</p>\r\n<p>The goal that we have is simple yet effective. We wish to provide services related to Information Technology to small and medium sized businesses. We achieve our goal by understanding what is it that they need and give them a solution for it. The technology that the businesses end up receiving makes their life easier and more simple. It helps them to easily undertake the day to day work. Your network and system is about to stay updated from time to time. When the Business Computer support in New York does their work, they build a secured and reliable network infrastructure. This is done by providing managed and informed Information Technology to the clients. The clients then find the work of expanding their business easier and way less complicated.</p>\r\n<p>&nbsp;</p>\r\n<p>That is why, we ask you to hand us over your technology related problems. We can deal with each and every one of them. For more and detailed information or in case of query you can contact our services any time of the day. We are known for our remarkable and prompt customer services. Join us at Facebook, Twitter, Google plus, and other social networking sites.</p>\r\n<p>&nbsp;</p>\r\n<p>Time for Virtual Servers Support in Rutherford, New Jersey.</p>\r\n<p>&nbsp;</p>\r\n<p>Are your servers not getting you the results you need? The Virtual Servers Support in Rutherford, New Jersey is the leading provider of maintenance. They can handle everything related to delivering on-site support for hardware to storage, and also deals with network systems.<br /><br />It is extremely easy to connect to our services. Within half an hour, our engineers will reach out to you. We are available all day, every day. So, everytime your business needs IT related help<a href=\"http://www.articlesfactory.com/articles/computers.html\"><img src=\"http://www.articlesfactory.com/pic/x.gif\" alt=\"Computer Technology Articles\" border=\"0\" /></a>, it is us you should call and rely on. Our credentials must have reached you by now. We are one of the most reputable and award winning service providers that you will come across. Call our services and get all the aid you need.</p>', 4, 1, 1, '2018-09-24 02:08:01', '2018-10-11 00:28:28'),
(10, 1, 'ftestosmg', 'ftestosmg', 'ftestosmg-2018-12-15-5c1537a044868.png', '<p>fo;kosdkfkdsfkodskfl;dsfa</p>', 0, 0, 1, '2018-10-28 02:24:23', '2018-12-15 10:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-09-24 01:55:49', '2018-09-24 01:55:49'),
(2, 2, 2, '2018-09-24 01:56:37', '2018-09-24 01:56:37'),
(3, 3, 3, '2018-09-24 02:01:52', '2018-09-24 02:01:52'),
(4, 3, 4, '2018-09-24 02:01:52', '2018-09-24 02:01:52'),
(5, 4, 4, '2018-09-24 02:03:35', '2018-09-24 02:03:35'),
(6, 4, 6, '2018-09-24 02:03:35', '2018-09-24 02:03:35'),
(7, 5, 4, '2018-09-24 02:04:14', '2018-09-24 02:04:14'),
(8, 5, 5, '2018-09-24 02:04:14', '2018-09-24 02:04:14'),
(9, 6, 2, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(10, 6, 4, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(11, 6, 5, '2018-09-24 02:04:54', '2018-09-24 02:04:54'),
(12, 7, 1, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(13, 7, 2, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(14, 7, 5, '2018-09-24 02:05:39', '2018-09-24 02:05:39'),
(15, 8, 2, '2018-09-24 02:07:22', '2018-09-24 02:07:22'),
(16, 9, 3, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(17, 9, 4, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(18, 9, 6, '2018-09-24 02:08:01', '2018-09-24 02:08:01'),
(19, 10, 1, '2018-10-28 02:24:23', '2018-10-28 02:24:23'),
(20, 10, 3, '2018-10-28 02:24:23', '2018-10-28 02:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
CREATE TABLE IF NOT EXISTS `post_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_post_id_foreign` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 9, 2, '2018-09-24 03:54:31', '2018-09-24 03:54:31'),
(2, 8, 2, '2018-09-24 04:02:10', '2018-09-24 04:02:10'),
(5, 5, 1, '2018-09-24 19:51:13', '2018-09-24 19:51:13'),
(6, 4, 1, '2018-09-24 19:51:23', '2018-09-24 19:51:23'),
(8, 8, 1, '2018-09-24 19:53:41', '2018-09-24 19:53:41'),
(9, 7, 1, '2018-09-24 19:55:39', '2018-09-24 19:55:39'),
(11, 9, 1, '2018-09-24 23:59:16', '2018-09-24 23:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'kk@yahoo.com', '2018-09-24 02:09:46', '2018-09-24 02:09:46'),
(2, 'bosba@gmail.com', '2018-09-24 02:09:52', '2018-09-24 02:09:52'),
(3, 'jj@blog.com', '2018-09-24 02:10:23', '2018-09-24 02:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', '2018-09-24 01:05:38', '2018-09-24 01:05:38'),
(2, 'Laravel', 'laravel', '2018-09-24 01:05:48', '2018-09-24 01:05:48'),
(3, 'Codeigniter', 'codeigniter', '2018-09-24 01:06:23', '2018-09-24 01:06:23'),
(4, 'Framework', 'framework', '2018-09-24 01:06:39', '2018-09-24 01:06:39'),
(5, 'React Native', 'react-native', '2018-09-24 01:06:48', '2018-09-24 01:06:48'),
(6, 'Angular', 'angular', '2018-09-24 01:07:02', '2018-09-24 01:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'MD.Admin', 'admin', 'admin@blog.com', '$2y$10$Mv0xDOXI6fKwQrRbr5MmU.VDxjJHLt7TQiAZI4fvMSrQcmMMbmCzC', 'mdadmin-2018-09-25-5ba9bda573506.jpg', 'About Admin User.', 'zgHLyHXmv1qJlStiomWu1IWN7WSqWIgHcUQ7qE36i3u7yA8TO8iAYDjJVUR7', '2018-10-08 17:00:00', '2018-09-24 21:46:29'),
(2, 2, 'MD.Author', 'author', 'author@blog.com', '$2y$10$3XKVcXJQJRmaHdfRDnbF4.T7fzwLC6KeNUtO8A79xZQ5x/XhPr18.', 'mdauthor-2018-09-25-5ba9bdea690be.jpg', 'About Author User.', '6DWzCdT7TbwmWOaQ4cNdaUKflhpaFlVfRC0KpvOW8Kkr3YTjU4pLVj5wD0mq', '2018-10-01 17:00:00', '2018-09-24 21:47:38');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
