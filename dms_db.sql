-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Feb 04, 2024 at 05:24 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting_documents`
--

CREATE TABLE `accounting_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_documents`
--

INSERT INTO `accounting_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN4319016TS5T0E7SYV514D.png\"]', 'accounting', 'admin', 'Enim eum quibusdam e', 'Non omnis molestiae ', 'approved', '2024-02-02 22:38:15', 1, '2024-02-02 14:39:07', '2024-02-02 14:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `accounting_send_documents`
--

CREATE TABLE `accounting_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_send_documents`
--

INSERT INTO `accounting_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"]', 'admin', 'engineering', 'Cumque dolor explicabo Dolor volupta', 'Consequatur Quam ci', 'approved', '2024-02-02 21:59:16', 1, '2024-02-02 05:59:16', '2024-02-02 05:59:30'),
(2, '[\"01HNN27168M6N57NW1EQPT1EXF.png\"]', 'admin', 'logistics', 'Sed voluptas beatae sunt ut nemo ullam quis id a', 'Ut aut corporis qui ', 'approved', '2024-02-02 22:05:29', 1, '2024-02-02 06:05:29', '2024-02-02 06:05:42'),
(10, '[\"01HNQ1K4GC0X8F86KF9N91FEBX.png\"]', 'admin', 'sales', 'Expedita voluptas autem blanditiis sapi', 'Eum et doloribus qui', 'revised', '2024-02-03 16:33:06', 1, '2024-02-03 00:33:06', '2024-02-03 00:33:06');

--
-- Triggers `accounting_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger1` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger2` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger3` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger37` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger4` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger5` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger6` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null}}', NULL, '2024-02-01 01:53:23', '2024-02-01 01:53:23'),
(2, 'default', 'created', 'App\\Models\\Role', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:09', '2024-02-01 02:02:09'),
(3, 'default', 'created', 'App\\Models\\Role', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:19', '2024-02-01 02:02:19'),
(4, 'default', 'created', 'App\\Models\\Role', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:29', '2024-02-01 02:02:29'),
(5, 'default', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null},\"old\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null}}', NULL, '2024-02-01 02:02:50', '2024-02-01 02:02:50'),
(6, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"}}', NULL, '2024-02-01 02:07:05', '2024-02-01 02:07:05'),
(7, 'default', 'created', 'App\\Models\\AccountingDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 02:19:13', '2024-02-01 02:19:13'),
(8, 'default', 'created', 'App\\Models\\User', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"vince\",\"email\":\"vince@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-01 02:21:06', '2024-02-01 02:21:06'),
(9, 'default', 'created', 'App\\Models\\SalesDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.com\"}}', NULL, '2024-02-01 02:24:25', '2024-02-01 02:24:25'),
(10, 'default', 'updated', 'App\\Models\\SalesDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comss\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.com\"}}', NULL, '2024-02-01 02:49:10', '2024-02-01 02:49:10'),
(11, 'default', 'updated', 'App\\Models\\SalesDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comssss\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comss\"}}', NULL, '2024-02-01 03:02:35', '2024-02-01 03:02:35'),
(12, 'default', 'created', 'App\\Models\\ProcurementDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdas\"}}', NULL, '2024-02-01 03:07:37', '2024-02-01 03:07:37'),
(13, 'default', 'updated', 'App\\Models\\ProcurementDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdasasdada\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdas\"}}', NULL, '2024-02-01 03:09:07', '2024-02-01 03:09:07'),
(14, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 03:23:07', '2024-02-01 03:23:07'),
(15, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:08', '2024-02-01 04:46:08'),
(16, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:08', '2024-02-01 04:46:08'),
(17, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 1, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29'),
(18, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 1, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29'),
(19, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 2, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29'),
(20, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 2, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29'),
(21, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 3, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:48', '2024-02-01 04:46:48'),
(22, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 3, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:48', '2024-02-01 04:46:48'),
(23, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:12:57', '2024-02-01 05:12:57'),
(24, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:12:57', '2024-02-01 05:12:57'),
(25, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 3, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12'),
(26, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 3, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12'),
(27, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 4, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12'),
(28, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 4, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12'),
(29, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 5, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:13:29', '2024-02-01 05:13:29'),
(30, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 5, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:13:29', '2024-02-01 05:13:29'),
(31, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:22:37', '2024-02-01 05:22:37'),
(32, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:22:37', '2024-02-01 05:22:37'),
(33, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 5, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:24:36', '2024-02-01 05:24:36'),
(34, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 6, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:24:36', '2024-02-01 05:24:36'),
(35, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 7, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Quam est in labore \"}}', NULL, '2024-02-01 05:24:54', '2024-02-01 05:24:54'),
(36, 'default', 'created', 'App\\Models\\LogisticsDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Fugiat qui voluptate\"}}', NULL, '2024-02-01 05:39:23', '2024-02-01 05:39:23'),
(37, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[],\"from\":\"hehe\",\"recipient\":\"procurement\",\"message\":\"hehe\"}}', NULL, '2024-02-01 06:40:14', '2024-02-01 06:40:14'),
(38, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"}}', NULL, '2024-02-01 07:52:11', '2024-02-01 07:52:11'),
(39, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNM7A9S4AJJ1RSFQV4D5ME86.png\"],\"from\":\"Molestiae enim amet deserunt eiusmod dolorum labore quis in non\",\"recipient\":\"admin\",\"message\":\"Ratione aperiam et voluptatum quis quisquam voluptate placeat laborum Alias excepturi atque\"}}', NULL, '2024-02-01 22:15:24', '2024-02-01 22:15:24'),
(40, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 22:48:17', '2024-02-01 22:48:17'),
(41, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNM97VE7TP5D804G9D47RNK8.png\"],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"},\"old\":{\"upload_documents\":[],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 22:49:01', '2024-02-01 22:49:01'),
(42, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNMA6WBMNXEGYH2Y0A7EVBS3.png\"],\"from\":\"vince\",\"recipient\":\"admin\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:05:58', '2024-02-01 23:05:58'),
(43, 'default', 'created', 'App\\Models\\SalesDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":null,\"recipient\":null,\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:18:30', '2024-02-01 23:18:30'),
(44, 'default', 'created', 'App\\Models\\AccountingDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":null,\"recipient\":null,\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:31:06', '2024-02-01 23:31:06'),
(45, 'default', 'created', 'App\\Models\\User', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 00:28:19', '2024-02-02 00:28:19'),
(46, 'default', 'created', 'App\\Models\\Documents', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"qwe\"}}', NULL, '2024-02-02 03:31:16', '2024-02-02 03:31:16'),
(47, 'default', 'created', 'App\\Models\\Documents', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"qwe\"}}', NULL, '2024-02-02 03:31:46', '2024-02-02 03:31:46'),
(48, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMSKH81YP04PG5XJMMFKD78.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Enim vero temporibu\"}}', NULL, '2024-02-02 03:35:01', '2024-02-02 03:35:01'),
(49, 'default', 'deleted', 'App\\Models\\User', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 03:37:58', '2024-02-02 03:37:58'),
(50, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT3G5VXWN9HQZDQYVSCV4S.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Pariatur Ex rem minus est aut \"}}', NULL, '2024-02-02 03:43:44', '2024-02-02 03:43:44'),
(51, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 03:44:09', '2024-02-02 03:44:09'),
(52, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Voluptate nobis labore velit perferendis \"}}', NULL, '2024-02-02 03:44:36', '2024-02-02 03:44:36'),
(53, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT66WYS7WBXG9CBV5CAN76.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Esse Nam eveniet architecto reru\"}}', NULL, '2024-02-02 03:45:13', '2024-02-02 03:45:13'),
(54, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT75SEJ4GA4ABQGVQKWSMM.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Aperiam possimus accusantium consequa\"}}', NULL, '2024-02-02 03:45:45', '2024-02-02 03:45:45'),
(55, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMTAT0T83FF4GBMJJ27130Q.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Libero eos odit itaque ipsum ullam incid\"}}', NULL, '2024-02-02 03:47:44', '2024-02-02 03:47:44'),
(56, 'default', 'created', 'App\\Models\\PurchasingDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Perferendis esse qu\"}}', NULL, '2024-02-02 03:48:12', '2024-02-02 03:48:12'),
(57, 'default', 'created', 'App\\Models\\ProcurementDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ad sunt e\"}}', NULL, '2024-02-02 03:48:37', '2024-02-02 03:48:37'),
(58, 'default', 'created', 'App\\Models\\LogisticsDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Sit magna velit in \"}}', NULL, '2024-02-02 03:49:12', '2024-02-02 03:49:12'),
(59, 'default', 'deleted', 'App\\Models\\LogisticsDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Sit magna velit in \"}}', NULL, '2024-02-02 04:00:41', '2024-02-02 04:00:41'),
(60, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Voluptate nobis labore velit perferendis \"},\"old\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Voluptate nobis labore velit perferendis \"}}', NULL, '2024-02-02 04:02:29', '2024-02-02 04:02:29'),
(61, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"}}', NULL, '2024-02-02 04:13:14', '2024-02-02 04:13:14'),
(62, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"},\"old\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"}}', NULL, '2024-02-02 04:14:15', '2024-02-02 04:14:15'),
(63, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:15:48', '2024-02-02 04:15:48'),
(64, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:16:29', '2024-02-02 04:16:29'),
(65, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"},\"old\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 04:17:56', '2024-02-02 04:17:56'),
(66, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:24:16', '2024-02-02 04:24:16'),
(67, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:24:29', '2024-02-02 04:24:29'),
(68, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"logistics\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:25:08', '2024-02-02 04:25:08'),
(69, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"}}', NULL, '2024-02-02 04:28:32', '2024-02-02 04:28:32'),
(70, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"},\"old\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"}}', NULL, '2024-02-02 04:28:50', '2024-02-02 04:28:50'),
(71, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Minim distinctio Dolor esse Nam la\"}}', NULL, '2024-02-02 04:31:30', '2024-02-02 04:31:30'),
(72, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim distinctio Dolor esse Nam la\"},\"old\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Minim distinctio Dolor esse Nam la\"}}', NULL, '2024-02-02 04:31:43', '2024-02-02 04:31:43'),
(73, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"}}', NULL, '2024-02-02 04:32:26', '2024-02-02 04:32:26'),
(74, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"},\"old\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"}}', NULL, '2024-02-02 04:32:41', '2024-02-02 04:32:41'),
(75, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:41:22', '2024-02-02 04:41:22'),
(76, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:41:41', '2024-02-02 04:41:41'),
(77, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:42:12', '2024-02-02 04:42:12'),
(78, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:42:47', '2024-02-02 04:42:47'),
(79, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXM5621KHQRT46Z20C1CPT.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem est voluptates \"}}', NULL, '2024-02-02 04:45:16', '2024-02-02 04:45:16'),
(80, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:46:31', '2024-02-02 04:46:31'),
(81, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:46:46', '2024-02-02 04:46:46'),
(82, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 04:54:17', '2024-02-02 04:54:17'),
(83, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"},\"old\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 04:54:30', '2024-02-02 04:54:30'),
(84, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY9X9K2YX9CTNB3TNE3P1Z.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Iste ex et dolore rerum soluta quasi et bea\"}}', NULL, '2024-02-02 04:57:09', '2024-02-02 04:57:09'),
(85, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 04:57:37', '2024-02-02 04:57:37'),
(86, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"},\"old\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 04:57:49', '2024-02-02 04:57:49'),
(87, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"}}', NULL, '2024-02-02 05:00:23', '2024-02-02 05:00:23'),
(88, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"},\"old\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"}}', NULL, '2024-02-02 05:00:47', '2024-02-02 05:00:47'),
(89, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"}}', NULL, '2024-02-02 05:02:39', '2024-02-02 05:02:39'),
(90, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"},\"old\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"}}', NULL, '2024-02-02 05:03:00', '2024-02-02 05:03:00'),
(91, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:07:29', '2024-02-02 05:07:29'),
(92, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"},\"old\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:07:44', '2024-02-02 05:07:44'),
(93, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ0E3KHQ15NWXQFHFHKV6G.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"In alias nihil in elit quaerat consequatur Minus\"}}', NULL, '2024-02-02 05:09:27', '2024-02-02 05:09:27'),
(94, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"}}', NULL, '2024-02-02 05:10:04', '2024-02-02 05:10:04'),
(95, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"},\"old\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"}}', NULL, '2024-02-02 05:10:16', '2024-02-02 05:10:16'),
(96, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ5922A6C33VG37G0AZD9Y.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Tenetur nostrud labo\"}}', NULL, '2024-02-02 05:12:05', '2024-02-02 05:12:05'),
(97, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 05:12:25', '2024-02-02 05:12:25'),
(98, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"}}', NULL, '2024-02-02 05:16:00', '2024-02-02 05:16:00'),
(99, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"},\"old\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"}}', NULL, '2024-02-02 05:16:17', '2024-02-02 05:16:17'),
(100, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"}}', NULL, '2024-02-02 05:16:46', '2024-02-02 05:16:46'),
(101, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"},\"old\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"}}', NULL, '2024-02-02 05:17:21', '2024-02-02 05:17:21'),
(102, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:18:06', '2024-02-02 05:18:06'),
(103, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"},\"old\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:18:25', '2024-02-02 05:18:25'),
(104, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59'),
(105, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMY9X9K2YX9CTNB3TNE3P1Z.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Iste ex et dolore rerum soluta quasi et bea\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59'),
(106, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59'),
(107, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59'),
(108, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59'),
(109, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"}}', NULL, '2024-02-02 05:20:27', '2024-02-02 05:20:27'),
(110, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"},\"old\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"}}', NULL, '2024-02-02 05:20:42', '2024-02-02 05:20:42'),
(111, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:13', '2024-02-02 05:22:13'),
(112, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"},\"old\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:34', '2024-02-02 05:22:34'),
(113, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"},\"old\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:46', '2024-02-02 05:22:46'),
(114, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Molestias temporibus sed quo totam possi\"}}', NULL, '2024-02-02 05:28:53', '2024-02-02 05:28:53'),
(115, 'default', 'updated', 'App\\Models\\SalesSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Molestias temporibus sed quo totam possi\"},\"old\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Molestias temporibus sed quo totam possi\"}}', NULL, '2024-02-02 05:30:20', '2024-02-02 05:30:20'),
(116, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"}}', NULL, '2024-02-02 05:33:42', '2024-02-02 05:33:42'),
(117, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"},\"old\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"}}', NULL, '2024-02-02 05:34:00', '2024-02-02 05:34:00'),
(118, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"}}', NULL, '2024-02-02 05:59:16', '2024-02-02 05:59:16'),
(119, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"},\"old\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"}}', NULL, '2024-02-02 05:59:30', '2024-02-02 05:59:30'),
(120, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"}}', NULL, '2024-02-02 06:05:29', '2024-02-02 06:05:29'),
(121, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"},\"old\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"}}', NULL, '2024-02-02 06:05:42', '2024-02-02 06:05:42'),
(122, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:07:26', '2024-02-02 06:07:26'),
(123, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"},\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:07:42', '2024-02-02 06:07:42'),
(124, 'default', 'updated', 'App\\Models\\PurchasingDocument', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"},\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:08:39', '2024-02-02 06:08:39'),
(125, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-02 06:15:41', '2024-02-02 06:15:41'),
(126, 'default', 'updated', 'App\\Models\\SalesSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"},\"old\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-02 06:16:08', '2024-02-02 06:16:08'),
(127, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-02 06:17:43', '2024-02-02 06:17:43'),
(128, 'default', 'updated', 'App\\Models\\SalesSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"},\"old\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-02 06:17:58', '2024-02-02 06:17:58'),
(129, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-02 06:21:01', '2024-02-02 06:21:01'),
(130, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"},\"old\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-02 06:21:16', '2024-02-02 06:21:16'),
(131, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-02 06:24:50', '2024-02-02 06:24:50'),
(132, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"},\"old\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-02 06:25:11', '2024-02-02 06:25:11'),
(133, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-02 06:36:59', '2024-02-02 06:36:59'),
(134, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Inventore aut enim repellendu\"},\"old\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-02 06:37:21', '2024-02-02 06:37:21'),
(135, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 06:38:15', '2024-02-02 06:38:15'),
(136, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Enim eum quibusdam e\"},\"old\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 06:39:07', '2024-02-02 06:39:07');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(137, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-02 18:25:00', '2024-02-02 18:25:00'),
(138, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"},\"old\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-02 18:25:18', '2024-02-02 18:25:18'),
(139, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"}}', NULL, '2024-02-02 18:32:39', '2024-02-02 18:32:39'),
(140, 'default', 'updated', 'App\\Models\\SendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"},\"old\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"}}', NULL, '2024-02-02 18:33:02', '2024-02-02 18:33:02'),
(141, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Quaerat harum consectetur eli\"}}', NULL, '2024-02-02 18:33:25', '2024-02-02 18:33:25'),
(142, 'default', 'created', 'App\\Models\\User', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Camille Tyson\",\"email\":\"fefiri@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 18:50:37', '2024-02-02 18:50:37'),
(143, 'default', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"hehe\",\"email\":\"hehe@gmail.com\",\"department\":null},\"old\":{\"name\":\"Camille Tyson\",\"email\":\"fefiri@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:04:01', '2024-02-02 19:04:01'),
(144, 'default', 'created', 'App\\Models\\User', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"zxc\",\"email\":\"zxc@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 19:05:25', '2024-02-02 19:05:25'),
(145, 'default', 'updated', 'App\\Models\\User', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"zxc\",\"email\":\"hahahaha@gmail.com\",\"department\":null},\"old\":{\"name\":\"zxc\",\"email\":\"zxc@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 19:06:08', '2024-02-02 19:06:08'),
(146, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPEXXANHVF1CV88GZHDANQJ.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Corporis et quae velit ipsam nihil\"}}', NULL, '2024-02-02 19:06:56', '2024-02-02 19:06:56'),
(147, 'default', 'created', 'App\\Models\\User', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:10:38', '2024-02-02 19:10:38'),
(148, 'default', 'updated', 'App\\Models\\User', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"purchasing\"},\"old\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:14:27', '2024-02-02 19:14:27'),
(149, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPFPR5DTN4DBCXY9SPJ3X21.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Consequatur aliquid iure ea m\"}}', NULL, '2024-02-02 19:20:30', '2024-02-02 19:20:30'),
(150, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPKZVDBVH5G11JH9E43HVMZ.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Id qui obcaecati do\"}}', NULL, '2024-02-02 20:35:22', '2024-02-02 20:35:22'),
(151, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPMFVFSKE8E66KYQS5CZSG0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Rerum fuga Quasi no\"}}', NULL, '2024-02-02 20:44:07', '2024-02-02 20:44:07'),
(152, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPNB6J8VXXY0E0GD0KZ28AR.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ut aut i\"}}', NULL, '2024-02-02 20:59:03', '2024-02-02 20:59:03'),
(153, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ0T517ZSX2TSAPWCD90D2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Recusandae Ducimus\"}}', NULL, '2024-02-02 21:28:19', '2024-02-02 21:28:19'),
(154, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ2K3Q7KXZJR68A0H41VH0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quia magna nostrum i\"}}', NULL, '2024-02-02 21:29:18', '2024-02-02 21:29:18'),
(155, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ5D5A9Q340GC2N2T36MD0.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Rerum delectus nobi\"}}', NULL, '2024-02-02 21:30:50', '2024-02-02 21:30:50'),
(156, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQA8X64M4FQCAR1YTH4HK3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Non quod quaerat ali\"}}', NULL, '2024-02-02 21:33:29', '2024-02-02 21:33:29'),
(157, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQDBRGFX0D6XVGDM6Q8JG5.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Perspiciatis dolor \"}}', NULL, '2024-02-02 21:35:11', '2024-02-02 21:35:11'),
(158, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(159, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPKZVDBVH5G11JH9E43HVMZ.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Id qui obcaecati do\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(160, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPMFVFSKE8E66KYQS5CZSG0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Rerum fuga Quasi no\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(161, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPNB6J8VXXY0E0GD0KZ28AR.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ut aut i\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(162, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ0T517ZSX2TSAPWCD90D2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Recusandae Ducimus\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(163, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ2K3Q7KXZJR68A0H41VH0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quia magna nostrum i\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(164, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ5D5A9Q340GC2N2T36MD0.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Rerum delectus nobi\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(165, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQA8X64M4FQCAR1YTH4HK3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Non quod quaerat ali\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(166, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQDBRGFX0D6XVGDM6Q8JG5.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Perspiciatis dolor \"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34'),
(167, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPSEWFP68AZ2513RQZWNBT5.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Nobis et reiciendis duis e\"}}', NULL, '2024-02-02 22:10:58', '2024-02-02 22:10:58'),
(168, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPSWNFYXT6X85H542YMK236.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptas alias aut in tempore similique pa\"}}', NULL, '2024-02-02 22:18:29', '2024-02-02 22:18:29'),
(169, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTHT0YQ4ZHJM8QHB0ND8SF.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Rerum ad laborum Labore minim et in nobis\"}}', NULL, '2024-02-02 22:30:02', '2024-02-02 22:30:02'),
(170, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTKPND0M1A2HJM235S7MES.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Maiores quidem sequi officia dol\"}}', NULL, '2024-02-02 22:31:04', '2024-02-02 22:31:04'),
(171, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTNV04RH6JTQYH1N0GFAJB.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Qui consequatur duis fugiat maxime ut aliquip sed reiciendis labore officia excepturi sapiente dolorem quis autem enim\"}}', NULL, '2024-02-02 22:32:14', '2024-02-02 22:32:14'),
(172, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPV3NFHKTA6A6ZCVTV5X494.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Eu esse iste blanditiis rerum ea quae omnis accusantium\"}}', NULL, '2024-02-02 22:39:47', '2024-02-02 22:39:47'),
(173, 'default', 'created', 'App\\Models\\User', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Vince Ramirez\",\"email\":\"vinceramirez@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 23:29:23', '2024-02-02 23:29:23'),
(174, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPYR3FYT6J9Z3EST4VCDHK4.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Recusandae Q\"}}', NULL, '2024-02-02 23:43:23', '2024-02-02 23:43:23'),
(175, 'default', 'created', 'App\\Models\\User', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Salvador Haney\",\"email\":\"mybopoci@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-02 23:55:59', '2024-02-02 23:55:59'),
(176, 'default', 'created', 'App\\Models\\User', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Gage Hunter\",\"email\":\"mywyd@mailinator.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 23:56:30', '2024-02-02 23:56:30'),
(177, 'default', 'created', 'App\\Models\\User', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Quemby Melendez\",\"email\":\"wizixu@mailinator.com\",\"department\":\"logistics\"}}', NULL, '2024-02-02 23:59:03', '2024-02-02 23:59:03'),
(178, 'default', 'created', 'App\\Models\\User', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Cassandra Perkins\",\"email\":\"cyhi@mailinator.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:05:56', '2024-02-03 00:05:56'),
(179, 'default', 'created', 'App\\Models\\User', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Yoko Watson\",\"email\":\"dolygigume@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-03 00:07:30', '2024-02-03 00:07:30'),
(180, 'default', 'created', 'App\\Models\\User', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Madeson Wagner\",\"email\":\"xono@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-03 00:08:51', '2024-02-03 00:08:51'),
(181, 'default', 'deleted', 'App\\Models\\User', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"hehe\",\"email\":\"hehe@gmail.com\",\"department\":null}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(182, 'default', 'deleted', 'App\\Models\\User', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"zxc\",\"email\":\"hahahaha@gmail.com\",\"department\":null}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(183, 'default', 'deleted', 'App\\Models\\User', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(184, 'default', 'deleted', 'App\\Models\\User', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Vince Ramirez\",\"email\":\"vinceramirez@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(185, 'default', 'deleted', 'App\\Models\\User', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Salvador Haney\",\"email\":\"mybopoci@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(186, 'default', 'deleted', 'App\\Models\\User', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Gage Hunter\",\"email\":\"mywyd@mailinator.com\",\"department\":\"engineering\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(187, 'default', 'deleted', 'App\\Models\\User', 'deleted', 10, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Quemby Melendez\",\"email\":\"wizixu@mailinator.com\",\"department\":\"logistics\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(188, 'default', 'deleted', 'App\\Models\\User', 'deleted', 13, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Cassandra Perkins\",\"email\":\"cyhi@mailinator.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20'),
(189, 'default', 'created', 'App\\Models\\User', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Judah Mercer\",\"email\":\"fyrileh@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-03 00:10:36', '2024-02-03 00:10:36'),
(190, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(191, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPSEWFP68AZ2513RQZWNBT5.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Nobis et reiciendis duis e\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(192, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPSWNFYXT6X85H542YMK236.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptas alias aut in tempore similique pa\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(193, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTHT0YQ4ZHJM8QHB0ND8SF.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Rerum ad laborum Labore minim et in nobis\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(194, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTKPND0M1A2HJM235S7MES.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Maiores quidem sequi officia dol\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(195, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTNV04RH6JTQYH1N0GFAJB.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Qui consequatur duis fugiat maxime ut aliquip sed reiciendis labore officia excepturi sapiente dolorem quis autem enim\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(196, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPV3NFHKTA6A6ZCVTV5X494.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Eu esse iste blanditiis rerum ea quae omnis accusantium\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25'),
(197, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNQ1K4GC0X8F86KF9N91FEBX.png\"],\"from\":\"admin\",\"forward\":\"sales\",\"message\":\"Expedita voluptas autem blanditiis sapi\"}}', NULL, '2024-02-03 00:33:06', '2024-02-03 00:33:06'),
(198, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNQ1PZ7KK89T0ZT6V8KSTX2P.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Animi maxime voluptatem D\"}}', NULL, '2024-02-03 00:35:11', '2024-02-03 00:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `sales_documents`
--

CREATE TABLE `sales_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_documents`
--

INSERT INTO `sales_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN40PQ73CJKH36G16S484NK.png\"]', 'sales', 'admin', 'Inventore aut enim repellendu', 'Molestias consectetu', 'approved', '2024-02-02 22:36:58', 1, '2024-02-02 14:37:21', '2024-02-02 14:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `sales_send_documents`
--

CREATE TABLE `sales_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_send_documents`
--

INSERT INTO `sales_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"]', 'admin', 'purchasing', 'Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita', 'Ab commodi ducimus ', 'approved', '2024-02-02 22:15:41', 1, '2024-02-02 06:15:41', '2024-02-02 06:16:08'),
(2, '[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"]', 'admin', 'logistics', 'Cum ullamco nihil eos nesciunt duis eni', 'Officiis iusto dolor', 'approved', '2024-02-02 22:17:43', 1, '2024-02-02 06:17:43', '2024-02-02 06:17:58');

--
-- Triggers `sales_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger10` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger11` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger12` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger39` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger7` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger8` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger9` AFTER UPDATE ON `sales_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"]', 'admin', 'admin', 'Quo quia non aut esse nihil dolore nesc', 'Vitae ullamco expedi', 'approved', '2024-02-03 10:25:00', 1, '2024-02-03 02:25:18', '2024-02-03 02:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `engineering_documents`
--

CREATE TABLE `engineering_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `engineering_documents`
--

INSERT INTO `engineering_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"]', 'engineering', 'admin', 'Quaerat harum consectetur eli', 'At atque consequatur', 'approved', '2024-02-03 10:33:25', 1, '2024-02-03 02:33:25', '2024-02-03 02:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `engineering_send_documents`
--

CREATE TABLE `engineering_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `engineering_send_documents`
--

INSERT INTO `engineering_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"]', 'admin', 'procurement', 'Libero minima eveniet aliquid eligendi porro ', 'Qui dolor nisi beata', 'approved', '2024-02-02 22:21:01', 1, '2024-02-02 06:21:01', '2024-02-02 06:21:16'),
(2, '[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"]', 'admin', 'procurement', 'Ex nemo commodo nemo natus omnis irurem et', 'Recusandae Aut culp', 'approved', '2024-02-02 22:24:50', 1, '2024-02-02 06:24:50', '2024-02-02 06:25:11');

--
-- Triggers `engineering_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger13` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger14` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger15` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger16` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger17` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger18` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger38` AFTER UPDATE ON `engineering_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

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
-- Table structure for table `logistics_documents`
--

CREATE TABLE `logistics_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistics_documents`
--

INSERT INTO `logistics_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"]', 'logistics', 'admin', 'Cum ullamco nihil eos nesciunt duis eni', 'Officiis iusto dolor', 'approved', '2024-02-02 22:17:43', 1, '2024-02-02 14:17:58', '2024-02-02 14:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `logistics_send_documents`
--

CREATE TABLE `logistics_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `logistics_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger19` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger20` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger21` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger22` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger23` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger24` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger42` AFTER UPDATE ON `logistics_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_29_052156_create_permission_tables', 1),
(8, '2024_01_29_115607_create_departments_table', 1),
(9, '2024_01_30_024902_create_activity_log_table', 1),
(10, '2024_01_30_024903_add_event_column_to_activity_log_table', 1),
(11, '2024_01_30_024904_add_batch_uuid_column_to_activity_log_table', 1),
(83, '2024_01_29_054514_create_documents_table', 58),
(84, '2024_01_29_065258_create_send_documents_table', 59),
(85, '2024_01_30_134627_create_engineering_documents_table', 60),
(86, '2024_01_30_140536_create_sales_documents_table', 61),
(87, '2024_01_30_140913_create_procurement_documents_table', 62),
(88, '2024_01_30_141236_create_purchasing_documents_table', 63),
(89, '2024_01_30_142744_create_logistics_documents_table', 64),
(90, '2024_01_30_142953_create_accounting_documents_table', 65),
(91, '2024_01_30_145720_create_accounting_send_documents_table', 66),
(92, '2024_01_30_153656_create_sales_send_documents_table', 67),
(93, '2024_01_31_021203_create_engineering_send_documents_table', 68),
(94, '2024_01_31_024308_create_logistics_send_documents_table', 69),
(95, '2024_01_31_042946_create_purchasing_send_documents_table', 70),
(96, '2024_02_01_091158_create_procurement_send_documents_table', 71);

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
(10, 'App\\Models\\User', 2),
(15, 'App\\Models\\User', 2),
(20, 'App\\Models\\User', 2),
(25, 'App\\Models\\User', 2),
(35, 'App\\Models\\User', 2),
(40, 'App\\Models\\User', 2),
(45, 'App\\Models\\User', 2),
(50, 'App\\Models\\User', 2),
(55, 'App\\Models\\User', 2),
(60, 'App\\Models\\User', 2),
(65, 'App\\Models\\User', 2),
(75, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'View Role', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(2, 'Create Role', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(3, 'Update Role', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(4, 'Delete Role', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(5, 'CRUD Role', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(6, 'View Accounting Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(7, 'Create Accounting Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(8, 'Update Accounting Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(9, 'Delete Accounting Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(10, 'CRUD Accounting Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(11, 'View Accounting Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(12, 'Create Accounting Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(13, 'Update Accounting Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(14, 'Delete Accounting Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(15, 'CRUD Accounting Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(16, 'View Sales Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(17, 'Create Sales Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(18, 'Update Sales Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(19, 'Delete Sales Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(20, 'CRUD Sales Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(21, 'View Sales Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(22, 'Create Sales Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(23, 'Delete Sales Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(24, 'Update Sales Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(25, 'CRUD Sales Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(26, 'View Admin Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(27, 'Create Admin Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(28, 'Delete Admin Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(29, 'Update Admin Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(30, 'CRUD Admin Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(31, 'View Engineering Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(32, 'Create Engineering Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(33, 'Update Engineering Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(34, 'Delete Engineering Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(35, 'CRUD Engineering Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(36, 'View Engineering Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(37, 'Create Engineering Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(38, 'Update Engineering Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(39, 'Delete Engineering Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(40, 'CRUD Engineering Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(41, 'View Logistics Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(42, 'Create Logistics Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(43, 'Update Logistics Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(44, 'Delete Logistics Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(45, 'CRUD Logistics Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(46, 'View Logistics Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(47, 'Create Logistics Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(48, 'Update Logistics Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(49, 'Delete Logistics Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(50, 'CRUD Logistics Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(51, 'View Procurement Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(52, 'Create Procurement Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(53, 'Update Procurement Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(54, 'Delete Procurement Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(55, 'CRUD Procurement Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(56, 'View Procurement Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(57, 'Create Procurement Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(58, 'Update Procurement Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(59, 'Delete Procurement Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(60, 'CRUD Procurement Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(61, 'View Purchasing Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(62, 'Create Purchasing Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(63, 'Update Purchasing Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(64, 'Delete Purchasing Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(65, 'CRUD Purchasing Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(66, 'View Admin Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(67, 'Create Admin Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(68, 'Update Admin Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(69, 'Delete Admin Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(70, 'CRUD Admin Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(71, 'View Purchasing Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(72, 'Create Purchasing Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(73, 'Update Purchasing Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(74, 'Delete Purchasing Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(75, 'CRUD Purchasing Send Documents', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procurement_documents`
--

CREATE TABLE `procurement_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_documents`
--

INSERT INTO `procurement_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"]', 'procurement', 'admin', 'Libero minima eveniet aliquid eligendi porro ', 'Qui dolor nisi beata', 'approved', '2024-02-02 22:21:01', 1, '2024-02-02 14:21:16', '2024-02-02 14:21:16'),
(2, '[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"]', 'procurement', 'admin', 'Ex nemo commodo nemo natus omnis irurem et', 'Recusandae Aut culp', 'approved', '2024-02-02 22:24:50', 1, '2024-02-02 14:25:11', '2024-02-02 14:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `procurement_send_documents`
--

CREATE TABLE `procurement_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `procurement_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger25` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger26` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger27` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger28` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger29` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger30` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger41` AFTER UPDATE ON `procurement_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchasing_documents`
--

CREATE TABLE `purchasing_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasing_documents`
--

INSERT INTO `purchasing_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"]', 'engineering', 'admin', 'Est id ratione doloremque quae obcaecati ullaoluptas', 'Ut ex quia sunt volu', 'approved', '2024-02-02 22:07:26', 1, '2024-02-02 14:07:42', '2024-02-02 06:08:39'),
(2, '[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"]', 'purchasing', 'admin', 'Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita', 'Ab commodi ducimus ', 'approved', '2024-02-02 22:15:41', 1, '2024-02-02 14:16:08', '2024-02-02 14:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `purchasing_send_documents`
--

CREATE TABLE `purchasing_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasing_send_documents`
--

INSERT INTO `purchasing_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNN40PQ73CJKH36G16S484NK.png\"]', 'admin', 'sales', 'Inventore aut enim repellendu', 'Molestias consectetu', 'approved', '2024-02-02 22:36:58', 1, '2024-02-02 06:36:58', '2024-02-02 06:37:21'),
(2, '[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"]', 'admin', 'admin', 'Quo quia non aut esse nihil dolore nesc', 'Vitae ullamco expedi', 'approved', '2024-02-03 10:25:00', 1, '2024-02-02 18:25:00', '2024-02-02 18:25:18'),
(3, '[\"01HNPEXXANHVF1CV88GZHDANQJ.png\"]', 'admin', 'engineering', 'Corporis et quae velit ipsam nihil', 'Est in fugiat nisi ', 'approved', '2024-02-03 11:06:56', 1, '2024-02-02 19:06:56', '2024-02-02 19:06:56'),
(4, '[\"01HNPFPR5DTN4DBCXY9SPJ3X21.png\"]', 'admin', 'admin', 'Consequatur aliquid iure ea m', 'Illo maxime tempore', 'revised', '2024-02-03 11:20:30', 1, '2024-02-02 19:20:30', '2024-02-02 19:20:30');

--
-- Triggers `purchasing_send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigge31` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger32` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger33` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger34` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger35` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger36` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger40` AFTER UPDATE ON `purchasing_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

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
(1, 'Admin', 'web', '2024-02-01 02:02:09', '2024-02-01 02:02:09'),
(2, 'Department Head', 'web', '2024-02-01 02:02:19', '2024-02-01 02:02:19'),
(3, 'Department Staff', 'web', '2024-02-01 02:02:29', '2024-02-01 02:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `send_documents`
--

CREATE TABLE `send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forward` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `send_documents`
--

INSERT INTO `send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"]', 'admin', 'purchasing', 'Ea ut reprehenderit harum et accusamus ut non optio in', 'Rerum officiis ut de', 'approved', '2024-02-03 10:32:39', 1, '2024-02-02 18:32:39', '2024-02-02 18:33:02'),
(2, '[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"]', 'admin', 'engineering', 'Quaerat harum consectetur eli', 'At atque consequatur', 'approved', '2024-02-03 10:33:25', 1, '2024-02-02 18:33:25', '2024-02-02 18:33:25'),
(3, '[\"01HNPYR3FYT6J9Z3EST4VCDHK4.png\"]', 'admin', 'engineering', 'Recusandae Q', 'Praesentium ut ipsum', 'reject', '2024-02-03 15:43:23', 1, '2024-02-02 23:43:23', '2024-02-02 23:43:23'),
(4, '[\"01HNQ1PZ7KK89T0ZT6V8KSTX2P.png\"]', 'admin', 'admin', 'Animi maxime voluptatem D', 'Suscipit qui lorem q', 'approved', '2024-02-03 16:35:11', 1, '2024-02-03 00:35:11', '2024-02-03 00:35:11');

--
-- Triggers `send_documents`
--
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger43` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'accounting' THEN
        INSERT INTO accounting_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger44` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger45` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger46` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger47` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger48` AFTER INSERT ON `send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `department`, `role`, `permission`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$3twSLn/Ci4ZIGX64vcP/qOQwY/y4U3EbSfOweUDeOztOQq5wgl5Ui', NULL, '1', NULL, NULL, '2024-02-01 01:53:23', '2024-02-01 02:02:50'),
(2, 'vince', 'vince@gmail.com', NULL, '$2y$12$kwk76opiqI/EWtBZN9uFwOsmtM3Zeb/LtBtrVdlH1y/yb4DUPMjXe', 'engineering', '3', NULL, NULL, '2024-02-01 02:21:06', '2024-02-01 02:21:06'),
(14, 'Yoko Watson', 'dolygigume@mailinator.com', NULL, '$2y$12$WGqu82eVQrfeHDC7qWkQRegFdJX6C9DeAdjIQVuskZ67k1dSYyjOO', 'accounting', '1', NULL, NULL, NULL, NULL),
(15, 'Madeson Wagner', 'xono@mailinator.com', NULL, '$2y$12$PeliLsNNYdayw7RJn4iWEOpyj6aclf71ZjDiBpNuqNRHp4RaCtFke', 'procurement', '1', NULL, NULL, '2024-02-03 08:08:51', '2024-02-03 08:08:51'),
(16, 'Judah Mercer', 'fyrileh@mailinator.com', NULL, '$2y$12$w0L4GgT5/Bh8hHULvmBf2eH43O3F6Zy1j74CWZ8mbUGlBgV0l/Yw6', 'procurement', '1', NULL, NULL, '2024-02-03 08:10:36', '2024-02-03 08:10:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounting_documents`
--
ALTER TABLE `accounting_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounting_send_documents`
--
ALTER TABLE `accounting_send_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `sales_documents`
--
ALTER TABLE `sales_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_send_documents`
--
ALTER TABLE `sales_send_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `engineering_documents`
--
ALTER TABLE `engineering_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `engineering_send_documents`
--
ALTER TABLE `engineering_send_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `logistics_documents`
--
ALTER TABLE `logistics_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistics_send_documents`
--
ALTER TABLE `logistics_send_documents`
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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `procurement_documents`
--
ALTER TABLE `procurement_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procurement_send_documents`
--
ALTER TABLE `procurement_send_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasing_documents`
--
ALTER TABLE `purchasing_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasing_send_documents`
--
ALTER TABLE `purchasing_send_documents`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `send_documents`
--
ALTER TABLE `send_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting_documents`
--
ALTER TABLE `accounting_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounting_send_documents`
--
ALTER TABLE `accounting_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `sales_documents`
--
ALTER TABLE `sales_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_send_documents`
--
ALTER TABLE `sales_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engineering_documents`
--
ALTER TABLE `engineering_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engineering_send_documents`
--
ALTER TABLE `engineering_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logistics_documents`
--
ALTER TABLE `logistics_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistics_send_documents`
--
ALTER TABLE `logistics_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procurement_documents`
--
ALTER TABLE `procurement_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `procurement_send_documents`
--
ALTER TABLE `procurement_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchasing_documents`
--
ALTER TABLE `purchasing_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchasing_send_documents`
--
ALTER TABLE `purchasing_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `send_documents`
--
ALTER TABLE `send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
