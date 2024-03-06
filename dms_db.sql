-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2024 at 03:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounting_send_documents`
--

CREATE TABLE `accounting_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_send_documents`
--

INSERT INTO `accounting_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(14, '[\"01HR43CCBX0NCGTP6HVFQ2E4J1.pdf\"]', 'admin', 'accounting', 'check it ', NULL, 'pending', '2024-02-22 15:45:42', 1, '2024-02-21 23:45:42', '2024-03-03 22:45:53'),
(15, '[\"01HQBDH6GKPSM4P1Y3T71NJ55D.jpg\"]', 'accounting', 'engineering', 'continue', NULL, 'pending', '2024-02-24 00:42:16', 17, '2024-02-23 08:42:16', '2024-02-23 08:42:16');

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
    IF NEW.status = 'approved' AND NEW.forward = 'sales' THEN
        INSERT INTO sales_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger3` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'purchasing' THEN
        INSERT INTO purchasing_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
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
    IF NEW.status = 'approved' AND NEW.forward = 'procurement' THEN
        INSERT INTO procurement_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger5` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'logistics' THEN
        INSERT INTO logistics_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger6` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'engineering' THEN
        INSERT INTO engineering_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
        VALUES (NEW.upload_documents, NEW.forward, NEW.`from`, NEW.message, NEW.remarks, NEW.status, NEW.published_at, NEW.user_id, NOW(), NOW());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `approve_forward_trigger61` AFTER UPDATE ON `accounting_send_documents` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' AND NEW.forward = 'admin' THEN
        INSERT INTO approved_documents (upload_documents, forward, `from`, message, remarks, status, published_at, user_id, created_at, updated_at)
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
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `upload_documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`, `upload_documents`) VALUES
(1, 'default', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null}}', NULL, '2024-02-01 01:53:23', '2024-02-01 01:53:23', NULL),
(2, 'default', 'created', 'App\\Models\\Role', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:09', '2024-02-01 02:02:09', NULL),
(3, 'default', 'created', 'App\\Models\\Role', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:19', '2024-02-01 02:02:19', NULL),
(4, 'default', 'created', 'App\\Models\\Role', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":null}}', NULL, '2024-02-01 02:02:29', '2024-02-01 02:02:29', NULL),
(5, 'default', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null},\"old\":{\"name\":\"admin\",\"email\":\"admin@gmail.com\",\"department\":null}}', NULL, '2024-02-01 02:02:50', '2024-02-01 02:02:50', NULL),
(6, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"}}', NULL, '2024-02-01 02:07:05', '2024-02-01 02:07:05', NULL),
(7, 'default', 'created', 'App\\Models\\AccountingDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 02:19:13', '2024-02-01 02:19:13', NULL),
(8, 'default', 'created', 'App\\Models\\User', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"vince\",\"email\":\"vince@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-01 02:21:06', '2024-02-01 02:21:06', NULL),
(9, 'default', 'created', 'App\\Models\\BusinessDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.com\"}}', NULL, '2024-02-01 02:24:25', '2024-02-01 02:24:25', NULL),
(10, 'default', 'updated', 'App\\Models\\BusinessDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comss\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.com\"}}', NULL, '2024-02-01 02:49:10', '2024-02-01 02:49:10', NULL),
(11, 'default', 'updated', 'App\\Models\\BusinessDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comssss\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"vince@gmail.comss\"}}', NULL, '2024-02-01 03:02:35', '2024-02-01 03:02:35', NULL),
(12, 'default', 'created', 'App\\Models\\ProcurementDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdas\"}}', NULL, '2024-02-01 03:07:37', '2024-02-01 03:07:37', NULL),
(13, 'default', 'updated', 'App\\Models\\ProcurementDocument', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdasasdada\"},\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"asdas\"}}', NULL, '2024-02-01 03:09:07', '2024-02-01 03:09:07', NULL),
(14, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 03:23:07', '2024-02-01 03:23:07', NULL),
(15, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:08', '2024-02-01 04:46:08', NULL),
(16, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:08', '2024-02-01 04:46:08', NULL),
(17, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 1, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29', NULL),
(18, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 1, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"haha\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29', NULL),
(19, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 2, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29', NULL),
(20, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 2, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:29', '2024-02-01 04:46:29', NULL),
(21, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 3, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:48', '2024-02-01 04:46:48', NULL),
(22, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 3, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 04:46:48', '2024-02-01 04:46:48', NULL),
(23, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:12:57', '2024-02-01 05:12:57', NULL),
(24, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:12:57', '2024-02-01 05:12:57', NULL),
(25, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 3, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12', NULL),
(26, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 3, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"hehe\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12', NULL),
(27, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 4, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12', NULL),
(28, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 4, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Voluptas ea minus au\"}}', NULL, '2024-02-01 05:13:12', '2024-02-01 05:13:12', NULL),
(29, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 5, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:13:29', '2024-02-01 05:13:29', NULL),
(30, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 5, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:13:29', '2024-02-01 05:13:29', NULL),
(31, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:22:37', '2024-02-01 05:22:37', NULL),
(32, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:22:37', '2024-02-01 05:22:37', NULL),
(33, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 5, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Ipsam vel commodo ex\"}}', NULL, '2024-02-01 05:24:36', '2024-02-01 05:24:36', NULL),
(34, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 6, 'App\\Models\\User', 2, '{\"old\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Dignissimos do dolor\"}}', NULL, '2024-02-01 05:24:36', '2024-02-01 05:24:36', NULL),
(35, 'default', 'created', 'App\\Models\\EngineeringDocument', 'created', 7, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Quam est in labore \"}}', NULL, '2024-02-01 05:24:54', '2024-02-01 05:24:54', NULL),
(36, 'default', 'created', 'App\\Models\\LogisticsDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":null,\"from\":null,\"recipient\":null,\"message\":\"Fugiat qui voluptate\"}}', NULL, '2024-02-01 05:39:23', '2024-02-01 05:39:23', NULL),
(37, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[],\"from\":\"hehe\",\"recipient\":\"procurement\",\"message\":\"hehe\"}}', NULL, '2024-02-01 06:40:14', '2024-02-01 06:40:14', NULL),
(38, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNJ25SEXJXFX4GY87YVTXDBS.pdf\",\"01HNJ25SF243Z1ABM5Z9TNV6HV.pdf\"],\"from\":\"hehe\",\"recipient\":\"admin\",\"message\":\"hehe\"}}', NULL, '2024-02-01 07:52:11', '2024-02-01 07:52:11', NULL),
(39, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNM7A9S4AJJ1RSFQV4D5ME86.png\"],\"from\":\"Molestiae enim amet deserunt eiusmod dolorum labore quis in non\",\"recipient\":\"admin\",\"message\":\"Ratione aperiam et voluptatum quis quisquam voluptate placeat laborum Alias excepturi atque\"}}', NULL, '2024-02-01 22:15:24', '2024-02-01 22:15:24', NULL),
(40, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 22:48:17', '2024-02-01 22:48:17', NULL),
(41, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNM97VE7TP5D804G9D47RNK8.png\"],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"},\"old\":{\"upload_documents\":[],\"from\":\"vince\",\"recipient\":\"logistics\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 22:49:01', '2024-02-01 22:49:01', NULL),
(42, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNMA6WBMNXEGYH2Y0A7EVBS3.png\"],\"from\":\"vince\",\"recipient\":\"admin\",\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:05:58', '2024-02-01 23:05:58', NULL),
(43, 'default', 'created', 'App\\Models\\BusinessDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":null,\"recipient\":null,\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:18:30', '2024-02-01 23:18:30', NULL),
(44, 'default', 'created', 'App\\Models\\AccountingDocument', 'created', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":null,\"recipient\":null,\"message\":\"hehehe\"}}', NULL, '2024-02-01 23:31:06', '2024-02-01 23:31:06', NULL),
(45, 'default', 'created', 'App\\Models\\User', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 00:28:19', '2024-02-02 00:28:19', NULL),
(46, 'default', 'created', 'App\\Models\\Documents', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"qwe\"}}', NULL, '2024-02-02 03:31:16', '2024-02-02 03:31:16', NULL),
(47, 'default', 'created', 'App\\Models\\Documents', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"qwe\"}}', NULL, '2024-02-02 03:31:46', '2024-02-02 03:31:46', NULL),
(48, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMSKH81YP04PG5XJMMFKD78.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Enim vero temporibu\"}}', NULL, '2024-02-02 03:35:01', '2024-02-02 03:35:01', NULL),
(49, 'default', 'deleted', 'App\\Models\\User', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 03:37:58', '2024-02-02 03:37:58', NULL),
(50, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT3G5VXWN9HQZDQYVSCV4S.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Pariatur Ex rem minus est aut \"}}', NULL, '2024-02-02 03:43:44', '2024-02-02 03:43:44', NULL),
(51, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 03:44:09', '2024-02-02 03:44:09', NULL),
(52, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Voluptate nobis labore velit perferendis \"}}', NULL, '2024-02-02 03:44:36', '2024-02-02 03:44:36', NULL),
(53, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT66WYS7WBXG9CBV5CAN76.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Esse Nam eveniet architecto reru\"}}', NULL, '2024-02-02 03:45:13', '2024-02-02 03:45:13', NULL),
(54, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT75SEJ4GA4ABQGVQKWSMM.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Aperiam possimus accusantium consequa\"}}', NULL, '2024-02-02 03:45:45', '2024-02-02 03:45:45', NULL),
(55, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMTAT0T83FF4GBMJJ27130Q.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Libero eos odit itaque ipsum ullam incid\"}}', NULL, '2024-02-02 03:47:44', '2024-02-02 03:47:44', NULL),
(56, 'default', 'created', 'App\\Models\\PurchasingDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Perferendis esse qu\"}}', NULL, '2024-02-02 03:48:12', '2024-02-02 03:48:12', NULL),
(57, 'default', 'created', 'App\\Models\\ProcurementDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ad sunt e\"}}', NULL, '2024-02-02 03:48:37', '2024-02-02 03:48:37', NULL),
(58, 'default', 'created', 'App\\Models\\LogisticsDocument', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Sit magna velit in \"}}', NULL, '2024-02-02 03:49:12', '2024-02-02 03:49:12', NULL),
(59, 'default', 'deleted', 'App\\Models\\LogisticsDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"Vince (1) (4) (1).png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Sit magna velit in \"}}', NULL, '2024-02-02 04:00:41', '2024-02-02 04:00:41', NULL),
(60, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Voluptate nobis labore velit perferendis \"},\"old\":{\"upload_documents\":[\"01HNMT52QZGH6A8HVJRYXKBYKC.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Voluptate nobis labore velit perferendis \"}}', NULL, '2024-02-02 04:02:29', '2024-02-02 04:02:29', NULL),
(61, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"}}', NULL, '2024-02-02 04:13:14', '2024-02-02 04:13:14', NULL),
(62, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"},\"old\":{\"upload_documents\":[\"01HNMVSFWDK2BBZ7MHTXQ60MW0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Et iusto consequuntur facilis voluptate\"}}', NULL, '2024-02-02 04:14:15', '2024-02-02 04:14:15', NULL),
(63, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:15:48', '2024-02-02 04:15:48', NULL),
(64, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:16:29', '2024-02-02 04:16:29', NULL),
(65, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"},\"old\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 04:17:56', '2024-02-02 04:17:56', NULL),
(66, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:24:16', '2024-02-02 04:24:16', NULL),
(67, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:24:29', '2024-02-02 04:24:29', NULL),
(68, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"logistics\",\"message\":\"Nemo officiis eveniet adipisci nost\"},\"old\":{\"upload_documents\":[\"01HNMVY6YJGM5ZG740FAGHSQS5.png\"],\"from\":\"vince\",\"forward\":\"accounting\",\"message\":\"Nemo officiis eveniet adipisci nost\"}}', NULL, '2024-02-02 04:25:08', '2024-02-02 04:25:08', NULL),
(69, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"}}', NULL, '2024-02-02 04:28:32', '2024-02-02 04:28:32', NULL),
(70, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"},\"old\":{\"upload_documents\":[\"01HNMWNH9X6V40BX1KPP93D0AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Dolores velit do commodi uis\"}}', NULL, '2024-02-02 04:28:50', '2024-02-02 04:28:50', NULL),
(71, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Minim distinctio Dolor esse Nam la\"}}', NULL, '2024-02-02 04:31:30', '2024-02-02 04:31:30', NULL),
(72, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim distinctio Dolor esse Nam la\"},\"old\":{\"upload_documents\":[\"01HNMWTYACK4B2Y143HE99K7RY.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Minim distinctio Dolor esse Nam la\"}}', NULL, '2024-02-02 04:31:43', '2024-02-02 04:31:43', NULL),
(73, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"}}', NULL, '2024-02-02 04:32:26', '2024-02-02 04:32:26', NULL),
(74, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"},\"old\":{\"upload_documents\":[\"01HNMWWN8FAN4C5G2T6HPN78AS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Minim duis est anim velit distinctio Accusamus nulla est velit magna sit\"}}', NULL, '2024-02-02 04:32:41', '2024-02-02 04:32:41', NULL),
(75, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:41:22', '2024-02-02 04:41:22', NULL),
(76, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:41:41', '2024-02-02 04:41:41', NULL),
(77, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:42:12', '2024-02-02 04:42:12', NULL),
(78, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXD0SJ89ZKZ03X53HQ8V8T.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:42:47', '2024-02-02 04:42:47', NULL),
(79, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXM5621KHQRT46Z20C1CPT.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem est voluptates \"}}', NULL, '2024-02-02 04:45:16', '2024-02-02 04:45:16', NULL),
(80, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:46:31', '2024-02-02 04:46:31', NULL),
(81, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"},\"old\":{\"upload_documents\":[\"01HNMXPEVVEPEJ48DJWDME052E.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"hehe\"}}', NULL, '2024-02-02 04:46:46', '2024-02-02 04:46:46', NULL),
(82, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 04:54:17', '2024-02-02 04:54:17', NULL),
(83, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"},\"old\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 04:54:30', '2024-02-02 04:54:30', NULL),
(84, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMY9X9K2YX9CTNB3TNE3P1Z.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Iste ex et dolore rerum soluta quasi et bea\"}}', NULL, '2024-02-02 04:57:09', '2024-02-02 04:57:09', NULL),
(85, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 04:57:37', '2024-02-02 04:57:37', NULL),
(86, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"},\"old\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 04:57:49', '2024-02-02 04:57:49', NULL),
(87, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"}}', NULL, '2024-02-02 05:00:23', '2024-02-02 05:00:23', NULL),
(88, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"},\"old\":{\"upload_documents\":[\"01HNMYFV8CX95EEEC24STVC08B.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quas at ea voluptatem volupt\"}}', NULL, '2024-02-02 05:00:47', '2024-02-02 05:00:47', NULL),
(89, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"}}', NULL, '2024-02-02 05:02:39', '2024-02-02 05:02:39', NULL),
(90, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"},\"old\":{\"upload_documents\":[\"01HNMYKZZ068BH2BXS2C58D2EM.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Aut voluptate eaque veritatis qua\"}}', NULL, '2024-02-02 05:03:00', '2024-02-02 05:03:00', NULL),
(91, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:07:29', '2024-02-02 05:07:29', NULL),
(92, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"},\"old\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:07:44', '2024-02-02 05:07:44', NULL),
(93, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ0E3KHQ15NWXQFHFHKV6G.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"In alias nihil in elit quaerat consequatur Minus\"}}', NULL, '2024-02-02 05:09:27', '2024-02-02 05:09:27', NULL),
(94, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"}}', NULL, '2024-02-02 05:10:04', '2024-02-02 05:10:04', NULL),
(95, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"},\"old\":{\"upload_documents\":[\"01HNMZ1JDNHA08AER9GVDKHKQ4.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Rerum quasi sed \"}}', NULL, '2024-02-02 05:10:16', '2024-02-02 05:10:16', NULL),
(96, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZ5922A6C33VG37G0AZD9Y.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Tenetur nostrud labo\"}}', NULL, '2024-02-02 05:12:05', '2024-02-02 05:12:05', NULL),
(97, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMT48C7BX02V4WZV61MQW7Q.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Similique nostrud perferendis sint ab voluptas duis similique voluptate distinctio Tempor ratione esse voluptas quis voluptatem nostrum ullamco\"}}', NULL, '2024-02-02 05:12:25', '2024-02-02 05:12:25', NULL),
(98, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"}}', NULL, '2024-02-02 05:16:00', '2024-02-02 05:16:00', NULL),
(99, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"},\"old\":{\"upload_documents\":[\"01HNMZCDKX1E187QZZ60T8TKYY.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Excepteur vel tenetur dolor ipsum lorem et re\"}}', NULL, '2024-02-02 05:16:17', '2024-02-02 05:16:17', NULL),
(100, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"}}', NULL, '2024-02-02 05:16:46', '2024-02-02 05:16:46', NULL),
(101, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"},\"old\":{\"upload_documents\":[\"01HNMZDTVD40ZC7FNAFRB55KT3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Incidunt quo conseq\"}}', NULL, '2024-02-02 05:17:21', '2024-02-02 05:17:21', NULL),
(102, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:18:06', '2024-02-02 05:18:06', NULL),
(103, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"},\"old\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:18:25', '2024-02-02 05:18:25', NULL),
(104, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMY4N5NSSQK97PA2TZ9FFHS.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Assumenda aliquip non laborum Et ut t\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59', NULL),
(105, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMY9X9K2YX9CTNB3TNE3P1Z.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Iste ex et dolore rerum soluta quasi et bea\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59', NULL),
(106, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMYARZXAC0060Z9G34N64Q0.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Tenetur laudantium non enim ea fu\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59', NULL),
(107, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMYWV7XM44TGJFE8WGNHB5X.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"In autem excepteur deserunt est voluptatum arum ncabo\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59', NULL),
(108, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNMZG9DCG3ANE7AVP9NEMZMV.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Et esse molestiae et voluptas quis atque provident veniam sed ipsam voluptatem laborum enim pariatur Perspiciatis rem\"}}', NULL, '2024-02-02 05:19:59', '2024-02-02 05:19:59', NULL),
(109, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"}}', NULL, '2024-02-02 05:20:27', '2024-02-02 05:20:27', NULL),
(110, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"},\"old\":{\"upload_documents\":[\"01HNMZMJD69ADWCT68KZJKBWZQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Rerum cillum est magni sunt su\"}}', NULL, '2024-02-02 05:20:42', '2024-02-02 05:20:42', NULL),
(111, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:13', '2024-02-02 05:22:13', NULL),
(112, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"},\"old\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:34', '2024-02-02 05:22:34', NULL),
(113, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"},\"old\":{\"upload_documents\":[\"01HNMZQTM7ZVF41RD7NMVJVWB1.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolores porro ipsum quia sint\"}}', NULL, '2024-02-02 05:22:46', '2024-02-02 05:22:46', NULL),
(114, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Molestias temporibus sed quo totam possi\"}}', NULL, '2024-02-02 05:28:53', '2024-02-02 05:28:53', NULL),
(115, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Molestias temporibus sed quo totam possi\"},\"old\":{\"upload_documents\":[\"01HNN041DMXJGN6R05REK7V8N7.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Molestias temporibus sed quo totam possi\"}}', NULL, '2024-02-02 05:30:20', '2024-02-02 05:30:20', NULL),
(116, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"}}', NULL, '2024-02-02 05:33:42', '2024-02-02 05:33:42', NULL),
(117, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"},\"old\":{\"upload_documents\":[\"01HNN0CTRN4SG396VP2MPZ2J87.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Culpa fugit temporibus ratione magn\"}}', NULL, '2024-02-02 05:34:00', '2024-02-02 05:34:00', NULL),
(118, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"}}', NULL, '2024-02-02 05:59:16', '2024-02-02 05:59:16', NULL),
(119, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"},\"old\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"}}', NULL, '2024-02-02 05:59:30', '2024-02-02 05:59:30', NULL),
(120, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"}}', NULL, '2024-02-02 06:05:29', '2024-02-02 06:05:29', NULL),
(121, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"},\"old\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"}}', NULL, '2024-02-02 06:05:42', '2024-02-02 06:05:42', NULL),
(122, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:07:26', '2024-02-02 06:07:26', NULL),
(123, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"},\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:07:42', '2024-02-02 06:07:42', NULL),
(124, 'default', 'updated', 'App\\Models\\PurchasingDocument', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"},\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-02 06:08:39', '2024-02-02 06:08:39', NULL),
(125, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-02 06:15:41', '2024-02-02 06:15:41', NULL),
(126, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"},\"old\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-02 06:16:08', '2024-02-02 06:16:08', NULL),
(127, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-02 06:17:43', '2024-02-02 06:17:43', NULL),
(128, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"},\"old\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-02 06:17:58', '2024-02-02 06:17:58', NULL),
(129, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-02 06:21:01', '2024-02-02 06:21:01', NULL),
(130, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"},\"old\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-02 06:21:16', '2024-02-02 06:21:16', NULL),
(131, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-02 06:24:50', '2024-02-02 06:24:50', NULL),
(132, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"},\"old\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-02 06:25:11', '2024-02-02 06:25:11', NULL),
(133, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-02 06:36:59', '2024-02-02 06:36:59', NULL),
(134, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Inventore aut enim repellendu\"},\"old\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-02 06:37:21', '2024-02-02 06:37:21', NULL);
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`, `upload_documents`) VALUES
(135, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 06:38:15', '2024-02-02 06:38:15', NULL),
(136, 'default', 'updated', 'App\\Models\\ProcurementSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Enim eum quibusdam e\"},\"old\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 06:39:07', '2024-02-02 06:39:07', NULL),
(137, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-02 18:25:00', '2024-02-02 18:25:00', NULL),
(138, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"},\"old\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-02 18:25:18', '2024-02-02 18:25:18', NULL),
(139, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"}}', NULL, '2024-02-02 18:32:39', '2024-02-02 18:32:39', NULL),
(140, 'default', 'updated', 'App\\Models\\SendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"},\"old\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"}}', NULL, '2024-02-02 18:33:02', '2024-02-02 18:33:02', NULL),
(141, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Quaerat harum consectetur eli\"}}', NULL, '2024-02-02 18:33:25', '2024-02-02 18:33:25', NULL),
(142, 'default', 'created', 'App\\Models\\User', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Camille Tyson\",\"email\":\"fefiri@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 18:50:37', '2024-02-02 18:50:37', NULL),
(143, 'default', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"hehe\",\"email\":\"hehe@gmail.com\",\"department\":null},\"old\":{\"name\":\"Camille Tyson\",\"email\":\"fefiri@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:04:01', '2024-02-02 19:04:01', NULL),
(144, 'default', 'created', 'App\\Models\\User', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"zxc\",\"email\":\"zxc@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 19:05:25', '2024-02-02 19:05:25', NULL),
(145, 'default', 'updated', 'App\\Models\\User', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"zxc\",\"email\":\"hahahaha@gmail.com\",\"department\":null},\"old\":{\"name\":\"zxc\",\"email\":\"zxc@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 19:06:08', '2024-02-02 19:06:08', NULL),
(146, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPEXXANHVF1CV88GZHDANQJ.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Corporis et quae velit ipsam nihil\"}}', NULL, '2024-02-02 19:06:56', '2024-02-02 19:06:56', NULL),
(147, 'default', 'created', 'App\\Models\\User', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:10:38', '2024-02-02 19:10:38', NULL),
(148, 'default', 'updated', 'App\\Models\\User', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"purchasing\"},\"old\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-02 19:14:27', '2024-02-02 19:14:27', NULL),
(149, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPFPR5DTN4DBCXY9SPJ3X21.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Consequatur aliquid iure ea m\"}}', NULL, '2024-02-02 19:20:30', '2024-02-02 19:20:30', NULL),
(150, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPKZVDBVH5G11JH9E43HVMZ.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Id qui obcaecati do\"}}', NULL, '2024-02-02 20:35:22', '2024-02-02 20:35:22', NULL),
(151, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPMFVFSKE8E66KYQS5CZSG0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Rerum fuga Quasi no\"}}', NULL, '2024-02-02 20:44:07', '2024-02-02 20:44:07', NULL),
(152, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPNB6J8VXXY0E0GD0KZ28AR.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ut aut i\"}}', NULL, '2024-02-02 20:59:03', '2024-02-02 20:59:03', NULL),
(153, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ0T517ZSX2TSAPWCD90D2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Recusandae Ducimus\"}}', NULL, '2024-02-02 21:28:19', '2024-02-02 21:28:19', NULL),
(154, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ2K3Q7KXZJR68A0H41VH0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quia magna nostrum i\"}}', NULL, '2024-02-02 21:29:18', '2024-02-02 21:29:18', NULL),
(155, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQ5D5A9Q340GC2N2T36MD0.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Rerum delectus nobi\"}}', NULL, '2024-02-02 21:30:50', '2024-02-02 21:30:50', NULL),
(156, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQA8X64M4FQCAR1YTH4HK3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Non quod quaerat ali\"}}', NULL, '2024-02-02 21:33:29', '2024-02-02 21:33:29', NULL),
(157, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPQDBRGFX0D6XVGDM6Q8JG5.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Perspiciatis dolor \"}}', NULL, '2024-02-02 21:35:11', '2024-02-02 21:35:11', NULL),
(158, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(159, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPKZVDBVH5G11JH9E43HVMZ.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Id qui obcaecati do\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(160, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPMFVFSKE8E66KYQS5CZSG0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Rerum fuga Quasi no\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(161, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPNB6J8VXXY0E0GD0KZ28AR.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptatem ut aut i\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(162, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ0T517ZSX2TSAPWCD90D2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Recusandae Ducimus\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(163, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ2K3Q7KXZJR68A0H41VH0.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quia magna nostrum i\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(164, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQ5D5A9Q340GC2N2T36MD0.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Rerum delectus nobi\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(165, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQA8X64M4FQCAR1YTH4HK3.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Non quod quaerat ali\"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(166, 'default', 'deleted', 'App\\Models\\ProcurementSendDocuments', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPQDBRGFX0D6XVGDM6Q8JG5.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Perspiciatis dolor \"}}', NULL, '2024-02-02 21:35:34', '2024-02-02 21:35:34', NULL),
(167, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPSEWFP68AZ2513RQZWNBT5.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Nobis et reiciendis duis e\"}}', NULL, '2024-02-02 22:10:58', '2024-02-02 22:10:58', NULL),
(168, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPSWNFYXT6X85H542YMK236.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptas alias aut in tempore similique pa\"}}', NULL, '2024-02-02 22:18:29', '2024-02-02 22:18:29', NULL),
(169, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTHT0YQ4ZHJM8QHB0ND8SF.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Rerum ad laborum Labore minim et in nobis\"}}', NULL, '2024-02-02 22:30:02', '2024-02-02 22:30:02', NULL),
(170, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTKPND0M1A2HJM235S7MES.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Maiores quidem sequi officia dol\"}}', NULL, '2024-02-02 22:31:04', '2024-02-02 22:31:04', NULL),
(171, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPTNV04RH6JTQYH1N0GFAJB.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Qui consequatur duis fugiat maxime ut aliquip sed reiciendis labore officia excepturi sapiente dolorem quis autem enim\"}}', NULL, '2024-02-02 22:32:14', '2024-02-02 22:32:14', NULL),
(172, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPV3NFHKTA6A6ZCVTV5X494.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Eu esse iste blanditiis rerum ea quae omnis accusantium\"}}', NULL, '2024-02-02 22:39:47', '2024-02-02 22:39:47', NULL),
(173, 'default', 'created', 'App\\Models\\User', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Vince Ramirez\",\"email\":\"vinceramirez@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 23:29:23', '2024-02-02 23:29:23', NULL),
(174, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNPYR3FYT6J9Z3EST4VCDHK4.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Recusandae Q\"}}', NULL, '2024-02-02 23:43:23', '2024-02-02 23:43:23', NULL),
(175, 'default', 'created', 'App\\Models\\User', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Salvador Haney\",\"email\":\"mybopoci@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-02 23:55:59', '2024-02-02 23:55:59', NULL),
(176, 'default', 'created', 'App\\Models\\User', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Gage Hunter\",\"email\":\"mywyd@mailinator.com\",\"department\":\"engineering\"}}', NULL, '2024-02-02 23:56:30', '2024-02-02 23:56:30', NULL),
(177, 'default', 'created', 'App\\Models\\User', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Quemby Melendez\",\"email\":\"wizixu@mailinator.com\",\"department\":\"logistics\"}}', NULL, '2024-02-02 23:59:03', '2024-02-02 23:59:03', NULL),
(178, 'default', 'created', 'App\\Models\\User', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Cassandra Perkins\",\"email\":\"cyhi@mailinator.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:05:56', '2024-02-03 00:05:56', NULL),
(179, 'default', 'created', 'App\\Models\\User', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Yoko Watson\",\"email\":\"dolygigume@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-03 00:07:30', '2024-02-03 00:07:30', NULL),
(180, 'default', 'created', 'App\\Models\\User', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Madeson Wagner\",\"email\":\"xono@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-03 00:08:51', '2024-02-03 00:08:51', NULL),
(181, 'default', 'deleted', 'App\\Models\\User', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"hehe\",\"email\":\"hehe@gmail.com\",\"department\":null}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(182, 'default', 'deleted', 'App\\Models\\User', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"zxc\",\"email\":\"hahahaha@gmail.com\",\"department\":null}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(183, 'default', 'deleted', 'App\\Models\\User', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"gaga@gmail.com\",\"email\":\"gaga@gmail.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(184, 'default', 'deleted', 'App\\Models\\User', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Vince Ramirez\",\"email\":\"vinceramirez@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(185, 'default', 'deleted', 'App\\Models\\User', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Salvador Haney\",\"email\":\"mybopoci@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(186, 'default', 'deleted', 'App\\Models\\User', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Gage Hunter\",\"email\":\"mywyd@mailinator.com\",\"department\":\"engineering\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(187, 'default', 'deleted', 'App\\Models\\User', 'deleted', 10, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Quemby Melendez\",\"email\":\"wizixu@mailinator.com\",\"department\":\"logistics\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(188, 'default', 'deleted', 'App\\Models\\User', 'deleted', 13, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Cassandra Perkins\",\"email\":\"cyhi@mailinator.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-03 00:10:20', '2024-02-03 00:10:20', NULL),
(189, 'default', 'created', 'App\\Models\\User', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Judah Mercer\",\"email\":\"fyrileh@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-03 00:10:36', '2024-02-03 00:10:36', NULL),
(190, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(191, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPSEWFP68AZ2513RQZWNBT5.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Nobis et reiciendis duis e\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(192, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPSWNFYXT6X85H542YMK236.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Voluptas alias aut in tempore similique pa\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(193, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTHT0YQ4ZHJM8QHB0ND8SF.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Rerum ad laborum Labore minim et in nobis\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(194, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTKPND0M1A2HJM235S7MES.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Maiores quidem sequi officia dol\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(195, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPTNV04RH6JTQYH1N0GFAJB.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Qui consequatur duis fugiat maxime ut aliquip sed reiciendis labore officia excepturi sapiente dolorem quis autem enim\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(196, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 9, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPV3NFHKTA6A6ZCVTV5X494.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Eu esse iste blanditiis rerum ea quae omnis accusantium\"}}', NULL, '2024-02-03 00:17:25', '2024-02-03 00:17:25', NULL),
(197, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNQ1K4GC0X8F86KF9N91FEBX.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Expedita voluptas autem blanditiis sapi\"}}', NULL, '2024-02-03 00:33:06', '2024-02-03 00:33:06', NULL),
(198, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HNQ1PZ7KK89T0ZT6V8KSTX2P.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Animi maxime voluptatem D\"}}', NULL, '2024-02-03 00:35:11', '2024-02-03 00:35:11', NULL),
(199, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP70ZAC0RFKXBECQ914D8GVA.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Sit sapiente et nostrud reprehenderit officia aut c\"}}', NULL, '2024-02-09 05:30:07', '2024-02-09 05:30:07', NULL),
(200, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP70ZAC0RFKXBECQ914D8GVA.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"HAHAHAHAHAHAHAHA\"},\"old\":{\"upload_documents\":[\"01HP70ZAC0RFKXBECQ914D8GVA.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Sit sapiente et nostrud reprehenderit officia aut c\"}}', NULL, '2024-02-09 05:30:27', '2024-02-09 05:30:27', NULL),
(201, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP710T7M7JP495RH2YC51K53.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolor est non voluptas voluptatibus \"}}', NULL, '2024-02-09 05:30:56', '2024-02-09 05:30:56', NULL),
(202, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP710T7M7JP495RH2YC51K53.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"HAHAHAHAHA\"},\"old\":{\"upload_documents\":[\"01HP710T7M7JP495RH2YC51K53.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolor est non voluptas voluptatibus \"}}', NULL, '2024-02-09 05:32:59', '2024-02-09 05:32:59', NULL),
(203, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP715FB9T9DYJBF92DHRW542.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ipsum aut veritatis expedita nihil proident e\"}}', NULL, '2024-02-09 05:33:29', '2024-02-09 05:33:29', NULL),
(204, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP715FB9T9DYJBF92DHRW542.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"HAHAHAHAHAHAHAHA\"},\"old\":{\"upload_documents\":[\"01HP715FB9T9DYJBF92DHRW542.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ipsum aut veritatis expedita nihil proident e\"}}', NULL, '2024-02-09 05:33:47', '2024-02-09 05:33:47', NULL),
(205, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Est dolorem sed ut pariatur Rerum hic commodi proident\"}}', NULL, '2024-02-09 05:35:15', '2024-02-09 05:35:15', NULL),
(206, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"HAHAHAHAHA\"},\"old\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Est dolorem sed ut pariatur Rerum hic commodi proident\"}}', NULL, '2024-02-09 05:35:32', '2024-02-09 05:35:32', NULL),
(207, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-12 07:24:57', '2024-02-12 07:24:57', NULL),
(208, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"},\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-12 07:25:11', '2024-02-12 07:25:11', NULL),
(209, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"},\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-12 07:25:25', '2024-02-12 07:25:25', NULL),
(210, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"},\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-12 07:25:35', '2024-02-12 07:25:35', NULL),
(211, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"},\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-12 07:26:06', '2024-02-12 07:26:06', NULL),
(212, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN1VNJ9FDN59EMQ3NG4X77W.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Cumque dolor explicabo Dolor volupta\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(213, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN27168M6N57NW1EQPT1EXF.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sed voluptas beatae sunt ut nemo ullam quis id a\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(214, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 10, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNQ1K4GC0X8F86KF9N91FEBX.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Expedita voluptas autem blanditiis sapi\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(215, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 11, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP70ZAC0RFKXBECQ914D8GVA.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"HAHAHAHAHAHAHAHA\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(216, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 12, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP710T7M7JP495RH2YC51K53.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"HAHAHAHAHA\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(217, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 13, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP715FB9T9DYJBF92DHRW542.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"HAHAHAHAHAHAHAHA\"}}', NULL, '2024-02-13 02:58:48', '2024-02-13 02:58:48', NULL),
(218, 'default', 'deleted', 'App\\Models\\EngineeringSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-13 02:59:02', '2024-02-13 02:59:02', NULL),
(219, 'default', 'deleted', 'App\\Models\\EngineeringSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-13 02:59:02', '2024-02-13 02:59:02', NULL),
(220, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-13 02:59:10', '2024-02-13 02:59:10', NULL),
(221, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-13 02:59:10', '2024-02-13 02:59:10', NULL),
(222, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"HAHAHAHAHA\"}}', NULL, '2024-02-13 02:59:10', '2024-02-13 02:59:10', NULL),
(223, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-13 02:59:25', '2024-02-13 02:59:25', NULL),
(224, 'default', 'deleted', 'App\\Models\\PurchasingSendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-13 02:59:34', '2024-02-13 02:59:34', NULL),
(225, 'default', 'deleted', 'App\\Models\\PurchasingSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-13 02:59:34', '2024-02-13 02:59:34', NULL),
(226, 'default', 'deleted', 'App\\Models\\PurchasingSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPEXXANHVF1CV88GZHDANQJ.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Corporis et quae velit ipsam nihil\"}}', NULL, '2024-02-13 02:59:34', '2024-02-13 02:59:34', NULL),
(227, 'default', 'deleted', 'App\\Models\\PurchasingSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPFPR5DTN4DBCXY9SPJ3X21.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Consequatur aliquid iure ea m\"}}', NULL, '2024-02-13 02:59:34', '2024-02-13 02:59:34', NULL),
(228, 'default', 'deleted', 'App\\Models\\PurchasingDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2AM5YCBDYHC1QMMD1TZ73.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est id ratione doloremque quae obcaecati ullaoluptas\"}}', NULL, '2024-02-13 02:59:42', '2024-02-13 02:59:42', NULL),
(229, 'default', 'deleted', 'App\\Models\\PurchasingDocument', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2SPXVBGBV5TNX7E741DW2.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Accusamus dolorum aut eius enimi soluta voluptas id cillum expedita\"}}', NULL, '2024-02-13 02:59:42', '2024-02-13 02:59:42', NULL),
(230, 'default', 'deleted', 'App\\Models\\ProcurementDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN33FEWM5ZE12Z1HN95R10V.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Libero minima eveniet aliquid eligendi porro \"}}', NULL, '2024-02-13 02:59:51', '2024-02-13 02:59:51', NULL),
(231, 'default', 'deleted', 'App\\Models\\ProcurementDocument', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN3AFS2R1BWG9NEX892K7E2.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Ex nemo commodo nemo natus omnis irurem et\"}}', NULL, '2024-02-13 02:59:51', '2024-02-13 02:59:51', NULL),
(232, 'default', 'deleted', 'App\\Models\\LogisticsDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN2XE5FE8H1QBTYJ2ZBWZ9S.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Cum ullamco nihil eos nesciunt duis eni\"}}', NULL, '2024-02-13 03:00:02', '2024-02-13 03:00:02', NULL),
(233, 'default', 'deleted', 'App\\Models\\LogisticsDocument', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-13 03:00:02', '2024-02-13 03:00:02', NULL),
(234, 'default', 'deleted', 'App\\Models\\EngineeringDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Quaerat harum consectetur eli\"}}', NULL, '2024-02-13 03:00:11', '2024-02-13 03:00:11', NULL),
(235, 'default', 'deleted', 'App\\Models\\BusinessDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN40PQ73CJKH36G16S484NK.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Inventore aut enim repellendu\"}}', NULL, '2024-02-13 03:00:18', '2024-02-13 03:00:18', NULL),
(236, 'default', 'deleted', 'App\\Models\\AccountingDocument', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNN4319016TS5T0E7SYV514D.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Enim eum quibusdam e\"}}', NULL, '2024-02-13 03:00:27', '2024-02-13 03:00:27', NULL),
(237, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(238, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP710T7M7JP495RH2YC51K53.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Dolor est non voluptas voluptatibus \"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(239, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"HAHAHAHAHA\"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(240, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HP718PJBXMGKVY2XB343Q44B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Est dolorem sed ut pariatur Rerum hic commodi proident\"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(241, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(242, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPEYQQ9QGKQ2M6HSCB6R6SXQ.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Nisi esse enim dolor ex ratione eligendi eveniet\"}}', NULL, '2024-02-13 03:00:36', '2024-02-13 03:00:36', NULL),
(243, 'default', 'deleted', 'App\\Models\\SendDocuments', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPCZ4CX0WTZBP12HJDCMVJC.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Ea ut reprehenderit harum et accusamus ut non optio in\"}}', NULL, '2024-02-13 03:00:47', '2024-02-13 03:00:47', NULL),
(244, 'default', 'deleted', 'App\\Models\\SendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPD0HQCPR2RK4ZK5QDZ5BTP.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Quaerat harum consectetur eli\"}}', NULL, '2024-02-13 03:00:47', '2024-02-13 03:00:47', NULL),
(245, 'default', 'deleted', 'App\\Models\\SendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPYR3FYT6J9Z3EST4VCDHK4.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Recusandae Q\"}}', NULL, '2024-02-13 03:00:47', '2024-02-13 03:00:47', NULL),
(246, 'default', 'deleted', 'App\\Models\\SendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNQ1PZ7KK89T0ZT6V8KSTX2P.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Animi maxime voluptatem D\"}}', NULL, '2024-02-13 03:00:47', '2024-02-13 03:00:47', NULL),
(247, 'default', 'deleted', 'App\\Models\\Documents', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HNPCH4H3GGAW6VW6G8X72GJF.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Quo quia non aut esse nihil dolore nesc\"}}', NULL, '2024-02-13 03:00:54', '2024-02-13 03:00:54', NULL),
(248, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2228HWK5GQ1WD317303VF.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est voluptatem libero eligen\"}}', NULL, '2024-02-13 03:01:30', '2024-02-13 03:01:30', NULL),
(249, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH22JF8X1BN80VH37VXTQ7B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Labore itaque quas proident tempore of\"}}', NULL, '2024-02-13 03:01:47', '2024-02-13 03:01:47', NULL),
(250, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH22JF8X1BN80VH37VXTQ7B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Labore itaque quas proident tempore of\"},\"old\":{\"upload_documents\":[\"01HPH22JF8X1BN80VH37VXTQ7B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Labore itaque quas proident tempore of\"}}', NULL, '2024-02-13 03:02:03', '2024-02-13 03:02:03', NULL),
(251, 'default', 'updated', 'App\\Models\\EngineeringSendDocuments', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2228HWK5GQ1WD317303VF.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est voluptatem libero eligen\"},\"old\":{\"upload_documents\":[\"01HPH2228HWK5GQ1WD317303VF.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est voluptatem libero eligen\"}}', NULL, '2024-02-13 03:08:52', '2024-02-13 03:08:52', NULL),
(252, 'default', 'deleted', 'App\\Models\\EngineeringSendDocuments', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH2228HWK5GQ1WD317303VF.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est voluptatem libero eligen\"}}', NULL, '2024-02-13 03:09:07', '2024-02-13 03:09:07', NULL),
(253, 'default', 'deleted', 'App\\Models\\EngineeringSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH22JF8X1BN80VH37VXTQ7B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Labore itaque quas proident tempore of\"}}', NULL, '2024-02-13 03:09:07', '2024-02-13 03:09:07', NULL),
(254, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH2228HWK5GQ1WD317303VF.png\"],\"from\":\"admin\",\"forward\":\"engineering\",\"message\":\"Est voluptatem libero eligen\"}}', NULL, '2024-02-13 03:09:15', '2024-02-13 03:09:15', NULL),
(255, 'default', 'deleted', 'App\\Models\\AllDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH22JF8X1BN80VH37VXTQ7B.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Labore itaque quas proident tempore of\"}}', NULL, '2024-02-13 03:09:15', '2024-02-13 03:09:15', NULL),
(256, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2H8QW99VQJEJQ04YQ232A.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Dolores et fuga Reprehenderperspiciatis\"}}', NULL, '2024-02-13 03:09:48', '2024-02-13 03:09:48', NULL),
(257, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2H8QW99VQJEJQ04YQ232A.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Dolores et fuga Reprehenderperspiciatis\"},\"old\":{\"upload_documents\":[\"01HPH2H8QW99VQJEJQ04YQ232A.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Dolores et fuga Reprehenderperspiciatis\"}}', NULL, '2024-02-13 03:10:02', '2024-02-13 03:10:02', NULL),
(258, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2TWZEZ4YJYWHDW9H7H7T3.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Deserunt saepe repudiandae deser\"}}', NULL, '2024-02-13 03:15:04', '2024-02-13 03:15:04', NULL),
(259, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH2TWZEZ4YJYWHDW9H7H7T3.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Deserunt saepe repudiandae deser\"},\"old\":{\"upload_documents\":[\"01HPH2TWZEZ4YJYWHDW9H7H7T3.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Deserunt saepe repudiandae deser\"}}', NULL, '2024-02-13 03:15:19', '2024-02-13 03:15:19', NULL),
(260, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH2H8QW99VQJEJQ04YQ232A.png\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Dolores et fuga Reprehenderperspiciatis\"}}', NULL, '2024-02-13 03:19:47', '2024-02-13 03:19:47', NULL),
(261, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH2TWZEZ4YJYWHDW9H7H7T3.png\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"Deserunt saepe repudiandae deser\"}}', NULL, '2024-02-13 03:19:47', '2024-02-13 03:19:47', NULL),
(262, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH3MPW8MB3VSDY7N22H22Q8.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Velit aliqua Quia deleniti molestiae pa\"}}', NULL, '2024-02-13 03:29:10', '2024-02-13 03:29:10', NULL),
(263, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:29:26', '2024-02-13 03:29:26', NULL),
(264, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"},\"old\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:33:07', '2024-02-13 03:33:07', NULL),
(265, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"},\"old\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:33:47', '2024-02-13 03:33:47', NULL),
(266, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"},\"old\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:34:05', '2024-02-13 03:34:05', NULL),
(267, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH40C62899XH4GAQEAJP12W.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sapiente eiusmod dolorum Nam aliqua Aut vel\"}}', NULL, '2024-02-13 03:35:32', '2024-02-13 03:35:32', NULL),
(268, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH4125G27YQ217GNEVA5AR2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ut optio dolores optio corrupti impedit reici\"}}', NULL, '2024-02-13 03:35:54', '2024-02-13 03:35:54', NULL),
(269, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HPH4125G27YQ217GNEVA5AR2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ut optio dolores optio corrupti impedit reici\"},\"old\":{\"upload_documents\":[\"01HPH4125G27YQ217GNEVA5AR2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ut optio dolores optio corrupti impedit reici\"}}', NULL, '2024-02-13 03:36:18', '2024-02-13 03:36:18', NULL),
(270, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH3MPW8MB3VSDY7N22H22Q8.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"Velit aliqua Quia deleniti molestiae pa\"}}', NULL, '2024-02-13 03:36:31', '2024-02-13 03:36:31', NULL),
(271, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:36:31', '2024-02-13 03:36:31', NULL),
(272, 'default', 'deleted', 'App\\Models\\BusinessSendDocuments', 'deleted', 8, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH4125G27YQ217GNEVA5AR2.png\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"Ut optio dolores optio corrupti impedit reici\"}}', NULL, '2024-02-13 03:36:31', '2024-02-13 03:36:31', NULL),
(273, 'default', 'deleted', 'App\\Models\\LogisticsSendDocuments', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH40C62899XH4GAQEAJP12W.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"Sapiente eiusmod dolorum Nam aliqua Aut vel\"}}', NULL, '2024-02-13 03:36:39', '2024-02-13 03:36:39', NULL),
(274, 'default', 'deleted', 'App\\Models\\PurchasingDocument', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"Voluptatem Velit est cum odit qui officia\"}}', NULL, '2024-02-13 03:36:47', '2024-02-13 03:36:47', NULL),
(275, 'default', 'deleted', 'App\\Models\\User', 'deleted', 14, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Yoko Watson\",\"email\":\"dolygigume@mailinator.com\",\"department\":\"accounting\"}}', NULL, '2024-02-21 23:42:41', '2024-02-21 23:42:41', NULL),
(276, 'default', 'deleted', 'App\\Models\\User', 'deleted', 15, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Madeson Wagner\",\"email\":\"xono@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-21 23:42:53', '2024-02-21 23:42:53', NULL),
(277, 'default', 'deleted', 'App\\Models\\User', 'deleted', 16, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Judah Mercer\",\"email\":\"fyrileh@mailinator.com\",\"department\":\"procurement\"}}', NULL, '2024-02-21 23:42:53', '2024-02-21 23:42:53', NULL),
(278, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HQ7WE0E4ZC1BQC4H2M86VMHQ.jpg\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"check it \"}}', NULL, '2024-02-21 23:45:42', '2024-02-21 23:45:42', NULL);
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`, `upload_documents`) VALUES
(279, 'default', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"chris\",\"email\":\"chris@gmail.com\",\"department\":\"engineering\"},\"old\":{\"name\":\"chris\",\"email\":\"chris@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-21 23:46:18', '2024-02-21 23:46:18', NULL),
(280, 'default', 'created', 'App\\Models\\User', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"department\":\"accounting\"}}', NULL, '2024-02-22 00:00:50', '2024-02-22 00:00:50', NULL),
(281, 'default', 'created', 'App\\Models\\User', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accountingstaff\",\"email\":\"accstaff@gmail.com\",\"department\":\"accounting\"}}', NULL, '2024-02-22 00:06:01', '2024-02-22 00:06:01', NULL),
(282, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"continue\"}}', NULL, '2024-02-22 00:25:59', '2024-02-22 00:25:59', NULL),
(283, 'default', 'updated', 'App\\Models\\BusinessSendDocuments', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"continue\"},\"old\":{\"upload_documents\":[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"],\"from\":\"admin\",\"forward\":\"business\",\"message\":\"continue\"}}', NULL, '2024-02-22 00:30:24', '2024-02-22 00:30:24', NULL),
(284, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HQ7ZJWDVBZXYBCXMZQGQHPS0.pdf\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"check it\"}}', NULL, '2024-02-22 00:40:47', '2024-02-22 00:40:47', NULL),
(285, 'default', 'created', 'App\\Models\\User', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"department\":\"business\"}}', NULL, '2024-02-22 01:05:31', '2024-02-22 01:05:31', NULL),
(286, 'default', 'created', 'App\\Models\\User', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"department\":\"engineering\"}}', NULL, '2024-02-22 01:07:49', '2024-02-22 01:07:49', NULL),
(287, 'default', 'created', 'App\\Models\\User', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"department\":\"logistics\"}}', NULL, '2024-02-22 01:09:28', '2024-02-22 01:09:28', NULL),
(288, 'default', 'created', 'App\\Models\\User', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"procurement\",\"email\":\"procurement@gmail.com\",\"department\":\"procurement\"}}', NULL, '2024-02-22 01:10:39', '2024-02-22 01:10:39', NULL),
(289, 'default', 'created', 'App\\Models\\User', 'created', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"purchasing\",\"email\":\"purchasing@gmail.com\",\"department\":\"purchasing\"}}', NULL, '2024-02-22 01:12:37', '2024-02-22 01:12:37', NULL),
(290, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"purchasing\",\"message\":\"for approval JAS \"}}', NULL, '2024-02-22 01:18:44', '2024-02-22 01:18:44', NULL),
(291, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"purchasing\",\"message\":\"for approval JAS \"},\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"purchasing\",\"message\":\"for approval JAS \"}}', NULL, '2024-02-22 01:19:05', '2024-02-22 01:19:05', NULL),
(292, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"for approval JAS \"},\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"purchasing\",\"message\":\"for approval JAS \"}}', NULL, '2024-02-22 01:23:52', '2024-02-22 01:23:52', NULL),
(293, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"for approval JAS \"},\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"for approval JAS \"}}', NULL, '2024-02-22 01:26:34', '2024-02-22 01:26:34', NULL),
(294, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"engineering\",\"message\":\"for approval JAS \"},\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"for approval JAS \"}}', NULL, '2024-02-22 01:27:45', '2024-02-22 01:27:45', NULL),
(295, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 6, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HQB92E34WNJD6ME28QXR3T15.png\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"continue\"}}', NULL, '2024-02-23 07:24:18', '2024-02-23 07:24:18', NULL),
(296, 'default', 'created', 'App\\Models\\BusinessSendDocuments', 'created', 10, 'App\\Models\\User', 19, '{\"attributes\":{\"upload_documents\":[\"01HQB9PGHCV9NDE0B90CW3CWXM.jpg\"],\"from\":\"sales\",\"forward\":\"purchasing\",\"message\":\"continue\"}}', NULL, '2024-02-23 07:35:15', '2024-02-23 07:35:15', NULL),
(297, 'default', 'updated', 'App\\Models\\User', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"department\":\"accounting\"},\"old\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"department\":\"accounting\"}}', NULL, '2024-02-23 08:40:26', '2024-02-23 08:40:26', NULL),
(298, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 15, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HQBDH6GKPSM4P1Y3T71NJ55D.jpg\"],\"from\":\"accounting\",\"forward\":\"engineering\",\"message\":\"continue\"}}', NULL, '2024-02-23 08:42:16', '2024-02-23 08:42:16', NULL),
(299, 'default', 'created', 'App\\Models\\EngineeringSendDocuments', 'created', 7, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HQBF5NS99QFYX09PT2X8H8XJ.jpg\"],\"from\":\"accounting\",\"forward\":\"engineering\",\"message\":\"continue\"}}', NULL, '2024-02-23 09:10:55', '2024-02-23 09:10:55', NULL),
(300, 'default', 'created', 'App\\Models\\SalesSendDocuments', 'created', 11, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HQWPH238BQHKW7823TDC43RE.png\"],\"from\":\"accounting\",\"forward\":\"sales\",\"message\":\"check it \"}}', NULL, '2024-03-01 01:46:33', '2024-03-01 01:46:33', NULL),
(301, 'default', 'updated', 'App\\Models\\SalesSendDocuments', 'updated', 11, 'App\\Models\\User', 19, '{\"attributes\":{\"upload_documents\":[\"01HQWRYN22K6FY9RQZPKH8ZMCV.png\"],\"from\":\"accounting\",\"forward\":\"sales\",\"message\":\"check it \"},\"old\":{\"upload_documents\":[\"01HQWPH238BQHKW7823TDC43RE.png\"],\"from\":\"accounting\",\"forward\":\"sales\",\"message\":\"check it \"}}', NULL, '2024-03-01 02:28:56', '2024-03-01 02:28:56', NULL),
(302, 'default', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:04:05', '2024-03-03 01:04:05', NULL),
(303, 'default', 'updated', 'App\\Models\\User', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:04:20', '2024-03-03 01:04:20', NULL),
(304, 'default', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:05:55', '2024-03-03 01:05:55', NULL),
(305, 'default', 'created', 'App\\Models\\SendDocuments', 'created', 6, 'App\\Models\\User', 19, '{\"attributes\":{\"upload_documents\":[\"01HR1S2FQKVZN7M4P5WMMNH1PW.png\"],\"from\":\"sales\",\"forward\":\"admin\",\"message\":\"Approval\"}}', NULL, '2024-03-03 01:07:14', '2024-03-03 01:07:14', NULL),
(306, 'default', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:14:09', '2024-03-03 01:14:09', NULL),
(307, 'default', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:18:04', '2024-03-03 01:18:04', NULL),
(308, 'default', 'updated', 'App\\Models\\User', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"accounting\",\"email\":\"accounting@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:20:10', '2024-03-03 01:20:10', NULL),
(309, 'default', 'updated', 'App\\Models\\User', 'updated', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"procurement\",\"email\":\"procurement@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"procurement\",\"email\":\"procurement@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:24:39', '2024-03-03 01:24:39', NULL),
(310, 'default', 'updated', 'App\\Models\\User', 'updated', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"purchasing\",\"email\":\"purchasing@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"purchasing\",\"email\":\"purchasing@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 01:26:29', '2024-03-03 01:26:29', NULL),
(311, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR1WBDD79398VVSEX29T4EAP.png\"],\"from\":\"admin\",\"forward\":\"logistics\",\"message\":\"check\"}}', NULL, '2024-03-03 02:04:32', '2024-03-03 02:04:32', NULL),
(312, 'default', 'created', 'App\\Models\\ProcurementSendDocuments', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR1WCFVFM04JGH4EHDCEF9KV.png\"],\"from\":\"admin\",\"forward\":\"procurement\",\"message\":\"continue\"}}', NULL, '2024-03-03 02:05:07', '2024-03-03 02:05:07', NULL),
(313, 'default', 'deleted', 'App\\Models\\PurchasingDocument', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"purchasing\",\"message\":\"for approval JAS \"}}', NULL, '2024-03-03 02:05:33', '2024-03-03 02:05:33', NULL),
(314, 'default', 'deleted', 'App\\Models\\SalesDocument', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"],\"from\":\"purchasing\",\"forward\":\"business\",\"message\":\"for approval JAS \"}}', NULL, '2024-03-03 02:07:08', '2024-03-03 02:07:08', NULL),
(315, 'default', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 04:27:42', '2024-03-03 04:27:42', NULL),
(316, 'default', 'created', 'App\\Models\\User', 'created', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 04:32:15', '2024-03-03 04:32:15', NULL),
(317, 'default', 'updated', 'App\\Models\\User', 'updated', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"alex\",\"email\":\"alex@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 04:34:04', '2024-03-03 04:34:04', NULL),
(318, 'default', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 04:39:25', '2024-03-03 04:39:25', NULL),
(319, 'default', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"engineering\",\"email\":\"engineering@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 04:46:49', '2024-03-03 04:46:49', NULL),
(320, 'default', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 05:15:58', '2024-03-03 05:15:58', NULL),
(321, 'default', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 05:21:44', '2024-03-03 05:21:44', NULL),
(322, 'default', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"sales\",\"email\":\"sales@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 06:58:28', '2024-03-03 06:58:28', NULL),
(323, 'default', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"logistics\",\"email\":\"logistics@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 06:59:05', '2024-03-03 06:59:05', NULL),
(324, 'default', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accountingstaff\",\"email\":\"accstaff@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"accountingstaff\",\"email\":\"accstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 19:15:44', '2024-03-03 19:15:44', NULL),
(325, 'default', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"accountingstaff\",\"email\":\"accstaff@gmail.com\",\"upload_documents\":null},\"old\":{\"name\":\"accountingstaff\",\"email\":\"accstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-03 21:53:54', '2024-03-03 21:53:54', NULL),
(326, 'default', 'created', 'App\\Models\\AccountingSendDocuments', 'created', 16, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR40K8YWSBVRSD4XT52W586B.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 21:57:13', '2024-03-03 21:57:13', NULL),
(327, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 16, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR40K8YWSBVRSD4XT52W586B.txt\",\"01HR40MFAJ5JRJS34KZVJB5HT1.jpg\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"},\"old\":{\"upload_documents\":[\"01HR40K8YWSBVRSD4XT52W586B.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 21:57:52', '2024-03-03 21:57:52', NULL),
(328, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 16, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR410BJ1SN0KN176DA1AEBXW.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"},\"old\":{\"upload_documents\":[\"01HR40K8YWSBVRSD4XT52W586B.txt\",\"01HR40MFAJ5JRJS34KZVJB5HT1.jpg\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 22:04:21', '2024-03-03 22:04:21', NULL),
(329, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 16, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR419H9KA0MQSR66FJ90A6SR.jpg\",\"01HR419H9WFY9ND03FA3M32KA2.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"},\"old\":{\"upload_documents\":[\"01HR410BJ1SN0KN176DA1AEBXW.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 22:09:22', '2024-03-03 22:09:22', NULL),
(330, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 16, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR4259TM5DRQQ47035KTMF1D.jpg\",\"01HR4259TS1EGWZT55BBPF1RPC.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"},\"old\":{\"upload_documents\":[\"01HR419H9KA0MQSR66FJ90A6SR.jpg\",\"01HR419H9WFY9ND03FA3M32KA2.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 22:24:32', '2024-03-03 22:24:32', NULL),
(331, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR439VEEJJ4WZGSGYEC6FQCE.txt\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"check it \"},\"old\":{\"upload_documents\":[\"01HQ7WE0E4ZC1BQC4H2M86VMHQ.jpg\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"check it \"}}', NULL, '2024-03-03 22:44:30', '2024-03-03 22:44:30', NULL),
(332, 'default', 'updated', 'App\\Models\\AccountingSendDocuments', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR43CCBX0NCGTP6HVFQ2E4J1.pdf\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"check it \"},\"old\":{\"upload_documents\":[\"01HR439VEEJJ4WZGSGYEC6FQCE.txt\"],\"from\":\"admin\",\"forward\":\"accounting\",\"message\":\"check it \"}}', NULL, '2024-03-03 22:45:53', '2024-03-03 22:45:53', NULL),
(333, 'default', 'deleted', 'App\\Models\\SalesSendDocuments', 'deleted', 11, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HQWRYN22K6FY9RQZPKH8ZMCV.png\"],\"from\":\"accounting\",\"forward\":\"sales\",\"message\":\"check it \"}}', NULL, '2024-03-03 22:50:08', '2024-03-03 22:50:08', NULL),
(334, 'default', 'deleted', 'App\\Models\\AccountingSendDocuments', 'deleted', 16, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HR4259TM5DRQQ47035KTMF1D.jpg\",\"01HR4259TS1EGWZT55BBPF1RPC.txt\"],\"from\":\"accounting\",\"forward\":\"accounting\",\"message\":\"for accounting staff (KIM)\"}}', NULL, '2024-03-03 22:52:08', '2024-03-03 22:52:08', NULL),
(335, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 7, 'App\\Models\\User', 17, '{\"attributes\":{\"upload_documents\":[\"01HR45ZPAF4015691330K47KVE.pdf\"],\"from\":\"accounting\",\"forward\":\"purchasing\",\"message\":\"continue\"}}', NULL, '2024-03-03 23:31:23', '2024-03-03 23:31:23', NULL),
(336, 'default', 'created', 'App\\Models\\PurchasingSendDocuments', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR4NN5CBZWGF1CAP0N9WW2A7.txt\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"confidential\"}}', NULL, '2024-03-04 04:05:15', '2024-03-04 04:05:15', NULL),
(337, 'default', 'created', 'App\\Models\\User', 'created', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"salestaff\",\"email\":\"salestaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 08:01:20', '2024-03-04 08:01:20', NULL),
(338, 'default', 'created', 'App\\Models\\User', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"engineeringstaff\",\"email\":\"engineeringstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 08:09:05', '2024-03-04 08:09:05', NULL),
(339, 'default', 'created', 'App\\Models\\Documents', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Emails-Notes-2 (1).txt\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Approve to continue (G.M)\"}}', NULL, '2024-03-04 09:37:49', '2024-03-04 09:37:49', NULL),
(340, 'default', 'created', 'App\\Models\\User', 'created', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"logisticstaff\",\"email\":\"logisticstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 17:04:02', '2024-03-04 17:04:02', NULL),
(341, 'default', 'created', 'App\\Models\\User', 'created', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"procurementstaff\",\"email\":\"procurementstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 17:07:48', '2024-03-04 17:07:48', NULL),
(342, 'default', 'created', 'App\\Models\\User', 'created', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"purchasingstaff\",\"email\":\"purchasingstaff@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 17:10:38', '2024-03-04 17:10:38', NULL),
(343, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 8, 'App\\Models\\User', 18, '{\"attributes\":{\"upload_documents\":[\"01HR4NN5CBZWGF1CAP0N9WW2A7.txt\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"confidential\"},\"old\":{\"upload_documents\":[\"01HR4NN5CBZWGF1CAP0N9WW2A7.txt\"],\"from\":\"admin\",\"forward\":\"purchasing\",\"message\":\"confidential\"}}', NULL, '2024-03-04 17:20:20', '2024-03-04 17:20:20', NULL),
(344, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 4, 'App\\Models\\User', 18, '{\"attributes\":{\"upload_documents\":[\"01HR637K8XRT5TAEWE9ZTPNVGE.png\"],\"from\":\"accountingstaff\",\"forward\":\"logistics\",\"message\":\"Hello! This is sent yesterday.\"}}', NULL, '2024-03-04 17:21:45', '2024-03-04 17:21:45', NULL),
(345, 'default', 'created', 'App\\Models\\User', 'created', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"brena\",\"email\":\"brena@gmail.com\",\"upload_documents\":null}}', NULL, '2024-03-04 17:54:05', '2024-03-04 17:54:05', NULL),
(346, 'default', 'created', 'App\\Models\\Documents', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Still I Rise pdf.pdf\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Revised! (3rd stanza) - G.M niel\"}}', NULL, '2024-03-04 19:20:20', '2024-03-04 19:20:20', NULL),
(347, 'default', 'updated', 'App\\Models\\Documents', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"Still I Rise pdf.pdf\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Revised it ASAP! (3rd stanza) - G.M niel\"},\"old\":{\"upload_documents\":[\"Still I Rise pdf.pdf\"],\"from\":\"admin\",\"forward\":\"admin\",\"message\":\"Revised! (3rd stanza) - G.M niel\"}}', NULL, '2024-03-04 20:37:13', '2024-03-04 20:37:13', NULL),
(348, 'default', 'deleted', 'App\\Models\\SalesDocument', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\":{\"upload_documents\":[\"01HQWRYN22K6FY9RQZPKH8ZMCV.png\"],\"from\":\"accounting\",\"forward\":\"sales\",\"message\":\"check it \"}}', NULL, '2024-03-04 22:33:07', '2024-03-04 22:33:07', NULL),
(349, 'default', 'updated', 'App\\Models\\PurchasingSendDocuments', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"upload_documents\":[\"01HR45ZPAF4015691330K47KVE.pdf\"],\"from\":\"accounting\",\"forward\":\"purchasing\",\"message\":\"continue it\"},\"old\":{\"upload_documents\":[\"01HR45ZPAF4015691330K47KVE.pdf\"],\"from\":\"accounting\",\"forward\":\"purchasing\",\"message\":\"continue\"}}', NULL, '2024-03-04 22:33:42', '2024-03-04 22:33:42', NULL),
(350, 'default', 'created', 'App\\Models\\LogisticsSendDocuments', 'created', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[],\"from\":\"purchasing\",\"forward\":\"logistics\",\"message\":\"Wrong cargo. Double Check it\"}}', NULL, '2024-03-04 22:36:42', '2024-03-04 22:36:42', NULL),
(351, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HR6NBNAGXWE8QGSRAP1Z3KRF.docx\"],\"from\":\"purchasing\",\"forward\":\"logistics\",\"message\":\"Wrong cargo. Double Check it\"},\"old\":{\"upload_documents\":[],\"from\":\"purchasing\",\"forward\":\"logistics\",\"message\":\"Wrong cargo. Double Check it\"}}', NULL, '2024-03-04 22:38:32', '2024-03-04 22:38:32', NULL),
(352, 'default', 'updated', 'App\\Models\\LogisticsSendDocuments', 'updated', 5, 'App\\Models\\User', 23, '{\"attributes\":{\"upload_documents\":[\"01HR6NEMTB4G8GDHZ8FZG2VF96.docx\"],\"from\":\"purchasing\",\"forward\":\"logistics\",\"message\":\"Wrong cargo. Double Check it\"},\"old\":{\"upload_documents\":[\"01HR6NBNAGXWE8QGSRAP1Z3KRF.docx\"],\"from\":\"purchasing\",\"forward\":\"logistics\",\"message\":\"Wrong cargo. Double Check it\"}}', NULL, '2024-03-04 22:40:10', '2024-03-04 22:40:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `all_documents`
--

CREATE TABLE `all_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) DEFAULT NULL,
  `message` varchar(2048) DEFAULT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_documents`
--

INSERT INTO `all_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(9, '[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"]', 'admin', 'business', 'continue', NULL, 'approved', '2024-02-22 16:25:59', 1, '2024-02-13 11:09:48', '2024-02-22 08:30:24'),
(10, '[\"01HPH2TWZEZ4YJYWHDW9H7H7T3.png\"]', 'admin', 'business', 'Deserunt saepe repudiandae deser', 'Dolor aperiam et pro', 'pending', '2024-02-13 19:15:04', 1, '2024-02-13 11:15:04', '2024-02-13 11:15:04'),
(11, '[\"01HPH3MPW8MB3VSDY7N22H22Q8.png\"]', 'admin', 'procurement', 'Velit aliqua Quia deleniti molestiae pa', 'Incididunt dolore ne', 'pending', '2024-02-13 19:29:10', 1, '2024-02-13 11:29:10', '2024-02-13 11:29:10'),
(12, '[\"01HPH3N6XH9CA6SFX5NVHRKDM0.png\"]', 'admin', 'purchasing', 'Voluptatem Velit est cum odit qui officia', 'Aute quam facere sed', 'pending', '2024-02-13 19:29:26', 1, '2024-02-13 11:29:26', '2024-02-13 11:29:26'),
(13, '[\"01HPH40C62899XH4GAQEAJP12W.png\"]', 'admin', 'logistics', 'Sapiente eiusmod dolorum Nam aliqua Aut vel', 'In officia voluptate', 'pending', '2024-02-13 19:35:32', 1, '2024-02-13 11:35:32', '2024-02-13 11:35:32'),
(14, '[\"01HPH4125G27YQ217GNEVA5AR2.png\"]', 'admin', 'accounting', 'Ut optio dolores optio corrupti impedit reici', 'Dignissimos et sed e', 'pending', '2024-02-13 19:35:54', 1, '2024-02-13 11:35:54', '2024-02-13 11:35:54'),
(15, '[\"01HQ7WE0E4ZC1BQC4H2M86VMHQ.jpg\"]', 'admin', 'accounting', 'check it ', NULL, 'pending', '2024-02-22 15:45:42', 1, '2024-02-22 07:45:42', '2024-02-22 07:45:42'),
(16, '[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"]', 'admin', 'business', 'continue', NULL, 'pending', '2024-02-22 16:25:59', 1, '2024-02-22 08:25:59', '2024-02-22 08:25:59'),
(17, '[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"]', 'purchasing', 'purchasing', 'for approval JAS ', NULL, 'pending', '2024-02-22 17:18:44', 23, '2024-02-22 09:18:44', '2024-02-22 09:18:44'),
(18, '[\"01HQB92E34WNJD6ME28QXR3T15.png\"]', 'purchasing', 'business', 'continue', NULL, 'pending', '2024-02-23 23:24:17', 23, '2024-02-23 15:24:17', '2024-02-23 15:24:17'),
(19, '[\"01HQB9PGHCV9NDE0B90CW3CWXM.jpg\"]', 'sales', 'purchasing', 'continue', NULL, 'pending', '2024-02-23 23:35:15', 19, '2024-02-23 15:35:15', '2024-02-23 15:35:15'),
(20, '[\"01HQBDH6GKPSM4P1Y3T71NJ55D.jpg\"]', 'accounting', 'engineering', 'continue', NULL, 'pending', '2024-02-24 00:42:16', 17, '2024-02-23 16:42:16', '2024-02-23 16:42:16'),
(21, '[\"01HQBF5NS99QFYX09PT2X8H8XJ.jpg\"]', 'accounting', 'engineering', 'continue', NULL, 'pending', '2024-02-24 01:10:55', 17, '2024-02-23 17:10:55', '2024-02-23 17:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department` varchar(2048) NOT NULL,
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
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(2, '[\"Emails-Notes-2 (1).txt\"]', 'admin', 'admin', 'Approve to continue (G.M)', NULL, 'approved', '2024-03-05 01:37:49', 1, '2024-03-04 09:37:49', '2024-03-04 09:37:49'),
(3, '[\"Still I Rise pdf.pdf\"]', 'admin', 'admin', 'Revised it ASAP! (3rd stanza) - G.M niel', NULL, 'revised', '2024-03-05 11:20:20', 1, '2024-03-04 19:20:20', '2024-03-04 20:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `engineering_documents`
--

CREATE TABLE `engineering_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engineering_send_documents`
--

CREATE TABLE `engineering_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(100) NOT NULL DEFAULT 'engineering',
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `engineering_send_documents`
--

INSERT INTO `engineering_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(7, '[\"01HQBF5NS99QFYX09PT2X8H8XJ.jpg\"]', 'accounting', 'engineering', 'continue', NULL, 'pending', '2024-02-24 01:10:55', 17, '2024-02-23 09:10:55', '2024-02-23 09:10:55');

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
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logistics_documents`
--

CREATE TABLE `logistics_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logistics_send_documents`
--

CREATE TABLE `logistics_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistics_send_documents`
--

INSERT INTO `logistics_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(3, '[\"01HR1WBDD79398VVSEX29T4EAP.png\"]', 'admin', 'logistics', 'check', NULL, 'pending', '2024-03-03 18:04:32', 1, '2024-03-03 02:04:32', '2024-03-03 02:04:32'),
(4, '[\"01HR637K8XRT5TAEWE9ZTPNVGE.png\"]', 'accountingstaff', 'logistics', 'Hello! This is sent yesterday.', 'Please Review ASAP!', 'pending', '2024-03-05 09:21:45', 18, '2024-03-04 17:21:45', '2024-03-04 17:21:45'),
(5, '[\"01HR6NEMTB4G8GDHZ8FZG2VF96.docx\"]', 'purchasing', 'logistics', 'Wrong cargo. Double Check it', NULL, 'reject', '2024-03-05 14:36:42', 23, '2024-03-04 22:36:42', '2024-03-04 22:40:10');

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
  `migration` varchar(255) NOT NULL,
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
(86, '2024_01_30_140536_create_business_documents_table', 61),
(87, '2024_01_30_140913_create_procurement_documents_table', 62),
(88, '2024_01_30_141236_create_purchasing_documents_table', 63),
(89, '2024_01_30_142744_create_logistics_documents_table', 64),
(90, '2024_01_30_142953_create_accounting_documents_table', 65),
(91, '2024_01_30_145720_create_accounting_send_documents_table', 66),
(92, '2024_01_30_153656_create_business_send_documents_table', 67),
(93, '2024_01_31_021203_create_engineering_send_documents_table', 68),
(94, '2024_01_31_024308_create_logistics_send_documents_table', 69),
(95, '2024_01_31_042946_create_purchasing_send_documents_table', 70),
(96, '2024_02_01_091158_create_procurement_send_documents_table', 71),
(97, '2024_02_08_123708_create_all_documents_table', 72);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(6, 'App\\Models\\User', 17),
(6, 'App\\Models\\User', 18),
(11, 'App\\Models\\User', 17),
(11, 'App\\Models\\User', 18),
(11, 'App\\Models\\User', 19),
(11, 'App\\Models\\User', 20),
(11, 'App\\Models\\User', 21),
(11, 'App\\Models\\User', 22),
(11, 'App\\Models\\User', 23),
(11, 'App\\Models\\User', 24),
(11, 'App\\Models\\User', 25),
(11, 'App\\Models\\User', 26),
(11, 'App\\Models\\User', 27),
(11, 'App\\Models\\User', 28),
(11, 'App\\Models\\User', 29),
(12, 'App\\Models\\User', 18),
(12, 'App\\Models\\User', 24),
(12, 'App\\Models\\User', 25),
(12, 'App\\Models\\User', 26),
(12, 'App\\Models\\User', 27),
(12, 'App\\Models\\User', 28),
(12, 'App\\Models\\User', 29),
(13, 'App\\Models\\User', 18),
(13, 'App\\Models\\User', 24),
(13, 'App\\Models\\User', 25),
(13, 'App\\Models\\User', 26),
(13, 'App\\Models\\User', 27),
(13, 'App\\Models\\User', 28),
(13, 'App\\Models\\User', 29),
(15, 'App\\Models\\User', 17),
(15, 'App\\Models\\User', 19),
(15, 'App\\Models\\User', 20),
(15, 'App\\Models\\User', 21),
(15, 'App\\Models\\User', 22),
(15, 'App\\Models\\User', 23),
(16, 'App\\Models\\User', 19),
(16, 'App\\Models\\User', 25),
(16, 'App\\Models\\User', 29),
(18, 'App\\Models\\User', 26),
(21, 'App\\Models\\User', 17),
(21, 'App\\Models\\User', 18),
(21, 'App\\Models\\User', 19),
(21, 'App\\Models\\User', 20),
(21, 'App\\Models\\User', 21),
(21, 'App\\Models\\User', 22),
(21, 'App\\Models\\User', 23),
(21, 'App\\Models\\User', 24),
(21, 'App\\Models\\User', 25),
(21, 'App\\Models\\User', 26),
(21, 'App\\Models\\User', 27),
(21, 'App\\Models\\User', 28),
(22, 'App\\Models\\User', 18),
(22, 'App\\Models\\User', 24),
(22, 'App\\Models\\User', 25),
(22, 'App\\Models\\User', 26),
(22, 'App\\Models\\User', 27),
(22, 'App\\Models\\User', 28),
(22, 'App\\Models\\User', 29),
(24, 'App\\Models\\User', 18),
(24, 'App\\Models\\User', 24),
(24, 'App\\Models\\User', 25),
(24, 'App\\Models\\User', 27),
(24, 'App\\Models\\User', 28),
(24, 'App\\Models\\User', 29),
(25, 'App\\Models\\User', 17),
(25, 'App\\Models\\User', 19),
(25, 'App\\Models\\User', 20),
(25, 'App\\Models\\User', 21),
(25, 'App\\Models\\User', 22),
(25, 'App\\Models\\User', 23),
(31, 'App\\Models\\User', 20),
(31, 'App\\Models\\User', 24),
(31, 'App\\Models\\User', 26),
(32, 'App\\Models\\User', 20),
(36, 'App\\Models\\User', 17),
(36, 'App\\Models\\User', 18),
(36, 'App\\Models\\User', 19),
(36, 'App\\Models\\User', 20),
(36, 'App\\Models\\User', 21),
(36, 'App\\Models\\User', 22),
(36, 'App\\Models\\User', 23),
(36, 'App\\Models\\User', 24),
(36, 'App\\Models\\User', 25),
(36, 'App\\Models\\User', 26),
(36, 'App\\Models\\User', 27),
(36, 'App\\Models\\User', 28),
(36, 'App\\Models\\User', 29),
(37, 'App\\Models\\User', 18),
(37, 'App\\Models\\User', 20),
(37, 'App\\Models\\User', 24),
(37, 'App\\Models\\User', 25),
(37, 'App\\Models\\User', 26),
(37, 'App\\Models\\User', 27),
(37, 'App\\Models\\User', 28),
(37, 'App\\Models\\User', 29),
(38, 'App\\Models\\User', 18),
(38, 'App\\Models\\User', 24),
(38, 'App\\Models\\User', 25),
(38, 'App\\Models\\User', 26),
(38, 'App\\Models\\User', 27),
(38, 'App\\Models\\User', 28),
(38, 'App\\Models\\User', 29),
(39, 'App\\Models\\User', 20),
(40, 'App\\Models\\User', 17),
(40, 'App\\Models\\User', 19),
(40, 'App\\Models\\User', 20),
(40, 'App\\Models\\User', 21),
(40, 'App\\Models\\User', 22),
(40, 'App\\Models\\User', 23),
(41, 'App\\Models\\User', 21),
(41, 'App\\Models\\User', 27),
(46, 'App\\Models\\User', 17),
(46, 'App\\Models\\User', 18),
(46, 'App\\Models\\User', 19),
(46, 'App\\Models\\User', 20),
(46, 'App\\Models\\User', 21),
(46, 'App\\Models\\User', 22),
(46, 'App\\Models\\User', 23),
(46, 'App\\Models\\User', 24),
(46, 'App\\Models\\User', 25),
(46, 'App\\Models\\User', 26),
(46, 'App\\Models\\User', 27),
(46, 'App\\Models\\User', 28),
(46, 'App\\Models\\User', 29),
(47, 'App\\Models\\User', 18),
(47, 'App\\Models\\User', 24),
(47, 'App\\Models\\User', 25),
(47, 'App\\Models\\User', 26),
(47, 'App\\Models\\User', 27),
(47, 'App\\Models\\User', 28),
(47, 'App\\Models\\User', 29),
(48, 'App\\Models\\User', 18),
(48, 'App\\Models\\User', 24),
(48, 'App\\Models\\User', 25),
(48, 'App\\Models\\User', 26),
(48, 'App\\Models\\User', 27),
(48, 'App\\Models\\User', 28),
(48, 'App\\Models\\User', 29),
(50, 'App\\Models\\User', 17),
(50, 'App\\Models\\User', 19),
(50, 'App\\Models\\User', 20),
(50, 'App\\Models\\User', 21),
(50, 'App\\Models\\User', 22),
(50, 'App\\Models\\User', 23),
(51, 'App\\Models\\User', 22),
(51, 'App\\Models\\User', 28),
(56, 'App\\Models\\User', 17),
(56, 'App\\Models\\User', 18),
(56, 'App\\Models\\User', 19),
(56, 'App\\Models\\User', 20),
(56, 'App\\Models\\User', 21),
(56, 'App\\Models\\User', 22),
(56, 'App\\Models\\User', 23),
(56, 'App\\Models\\User', 24),
(56, 'App\\Models\\User', 25),
(56, 'App\\Models\\User', 26),
(56, 'App\\Models\\User', 27),
(56, 'App\\Models\\User', 28),
(56, 'App\\Models\\User', 29),
(57, 'App\\Models\\User', 18),
(57, 'App\\Models\\User', 24),
(57, 'App\\Models\\User', 25),
(57, 'App\\Models\\User', 26),
(57, 'App\\Models\\User', 27),
(57, 'App\\Models\\User', 28),
(57, 'App\\Models\\User', 29),
(58, 'App\\Models\\User', 18),
(58, 'App\\Models\\User', 24),
(58, 'App\\Models\\User', 25),
(58, 'App\\Models\\User', 26),
(58, 'App\\Models\\User', 27),
(58, 'App\\Models\\User', 28),
(58, 'App\\Models\\User', 29),
(60, 'App\\Models\\User', 17),
(60, 'App\\Models\\User', 19),
(60, 'App\\Models\\User', 20),
(60, 'App\\Models\\User', 21),
(60, 'App\\Models\\User', 22),
(60, 'App\\Models\\User', 23),
(61, 'App\\Models\\User', 23),
(61, 'App\\Models\\User', 29),
(66, 'App\\Models\\User', 17),
(66, 'App\\Models\\User', 19),
(66, 'App\\Models\\User', 20),
(66, 'App\\Models\\User', 21),
(66, 'App\\Models\\User', 22),
(66, 'App\\Models\\User', 23),
(70, 'App\\Models\\User', 17),
(70, 'App\\Models\\User', 19),
(70, 'App\\Models\\User', 20),
(70, 'App\\Models\\User', 21),
(70, 'App\\Models\\User', 22),
(70, 'App\\Models\\User', 23),
(71, 'App\\Models\\User', 17),
(71, 'App\\Models\\User', 18),
(71, 'App\\Models\\User', 19),
(71, 'App\\Models\\User', 20),
(71, 'App\\Models\\User', 21),
(71, 'App\\Models\\User', 22),
(71, 'App\\Models\\User', 23),
(71, 'App\\Models\\User', 24),
(71, 'App\\Models\\User', 25),
(71, 'App\\Models\\User', 26),
(71, 'App\\Models\\User', 27),
(71, 'App\\Models\\User', 28),
(71, 'App\\Models\\User', 29),
(72, 'App\\Models\\User', 18),
(72, 'App\\Models\\User', 24),
(72, 'App\\Models\\User', 25),
(72, 'App\\Models\\User', 26),
(72, 'App\\Models\\User', 27),
(72, 'App\\Models\\User', 28),
(72, 'App\\Models\\User', 29),
(73, 'App\\Models\\User', 18),
(73, 'App\\Models\\User', 24),
(73, 'App\\Models\\User', 25),
(73, 'App\\Models\\User', 26),
(73, 'App\\Models\\User', 27),
(73, 'App\\Models\\User', 28),
(73, 'App\\Models\\User', 29),
(75, 'App\\Models\\User', 17),
(75, 'App\\Models\\User', 19),
(75, 'App\\Models\\User', 20),
(75, 'App\\Models\\User', 21),
(75, 'App\\Models\\User', 22),
(75, 'App\\Models\\User', 23);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
(16, 'View Sales Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(17, 'Create Sales Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(18, 'Update Sales Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(19, 'Delete Sales Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(20, 'CRUD Sales Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(21, 'View Sales Send Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(22, 'Create Sales Send Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(23, 'Delete Sales Send Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(24, 'Update Sales Send Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
(25, 'CRUD Sales Send Document', 'web', '2024-02-01 01:52:47', '2024-02-01 01:52:47'),
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
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procurement_send_documents`
--

CREATE TABLE `procurement_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_send_documents`
--

INSERT INTO `procurement_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(10, '[\"01HR1WCFVFM04JGH4EHDCEF9KV.png\"]', 'admin', 'procurement', 'continue', NULL, 'pending', '2024-03-03 18:05:07', 1, '2024-03-03 02:05:07', '2024-03-03 02:05:07');

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
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasing_documents`
--

INSERT INTO `purchasing_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(5, '[\"01HR45ZPAF4015691330K47KVE.pdf\"]', 'purchasing', 'accounting', 'continue it', NULL, 'approved', '2024-03-04 15:31:23', 17, '2024-03-05 06:33:42', '2024-03-05 06:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `purchasing_send_documents`
--

CREATE TABLE `purchasing_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasing_send_documents`
--

INSERT INTO `purchasing_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(5, '[\"01HQ81RC193K5M7QCS493VHM1F.pdf\"]', 'purchasing', 'engineering', 'for approval JAS ', NULL, 'pending', '2024-02-22 17:18:44', 23, '2024-02-22 01:18:44', '2024-02-22 01:27:44'),
(6, '[\"01HQB92E34WNJD6ME28QXR3T15.png\"]', 'purchasing', 'business', 'continue', NULL, 'pending', '2024-02-23 23:24:17', 23, '2024-02-23 07:24:17', '2024-02-23 07:24:17'),
(7, '[\"01HR45ZPAF4015691330K47KVE.pdf\"]', 'accounting', 'purchasing', 'continue it', NULL, 'approved', '2024-03-04 15:31:23', 17, '2024-03-03 23:31:23', '2024-03-04 22:33:42'),
(8, '[\"01HR4NN5CBZWGF1CAP0N9WW2A7.txt\"]', 'admin', 'purchasing', 'confidential', 'Accomplish, ASAP!', 'pending', '2024-03-04 20:05:15', 1, '2024-03-04 04:05:15', '2024-03-04 17:20:20');

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
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
-- Table structure for table `sales_documents`
--

CREATE TABLE `sales_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_documents`)),
  `forward` varchar(2048) NOT NULL,
  `from` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(2048) NOT NULL,
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_documents`
--

INSERT INTO `sales_documents` (`id`, `upload_documents`, `forward`, `from`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(2, '[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"]', 'business', 'admin', 'continue', NULL, 'approved', '2024-02-22 16:25:59', 1, '2024-02-22 08:30:24', '2024-02-22 08:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `sales_send_documents`
--

CREATE TABLE `sales_send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_send_documents`
--

INSERT INTO `sales_send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(9, '[\"01HQ7YQRT8X8YWXEYRQX56KJZ8.pdf\"]', 'admin', 'business', 'continue', NULL, 'approved', '2024-02-22 16:25:59', 1, '2024-02-22 00:25:59', '2024-02-22 00:30:24'),
(10, '[\"01HQB9PGHCV9NDE0B90CW3CWXM.jpg\"]', 'sales', 'purchasing', 'continue', NULL, 'pending', '2024-02-23 23:35:15', 19, '2024-02-23 07:35:15', '2024-02-23 07:35:15');

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
-- Table structure for table `send_documents`
--

CREATE TABLE `send_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`upload_documents`)),
  `from` varchar(2048) NOT NULL,
  `forward` varchar(2048) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `published_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `send_documents`
--

INSERT INTO `send_documents` (`id`, `upload_documents`, `from`, `forward`, `message`, `remarks`, `status`, `published_at`, `user_id`, `created_at`, `updated_at`) VALUES
(5, '[\"01HQ7ZJWDVBZXYBCXMZQGQHPS0.pdf\"]', 'admin', 'admin', 'check it', NULL, 'approved', '2024-02-22 16:40:47', 1, '2024-02-22 00:40:47', '2024-02-22 00:40:47'),
(6, '[\"01HR1S2FQKVZN7M4P5WMMNH1PW.png\"]', 'sales', 'admin', 'Approval', NULL, 'pending', '2024-03-03 17:07:14', 19, '2024-03-03 01:07:14', '2024-03-03 01:07:14');

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
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `department`, `role`, `permission`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$3twSLn/Ci4ZIGX64vcP/qOQwY/y4U3EbSfOweUDeOztOQq5wgl5Ui', NULL, '1', NULL, NULL, '2024-02-01 01:53:23', '2024-02-01 02:02:50'),
(2, 'chris', 'chris@gmail.com', NULL, '$2y$12$LmyAOikA/XUf6JhArHmI3e9HqHPjhHB./SAEZXKl/evqvAPXe6vZS', 'engineering', '1', NULL, NULL, '2024-02-01 02:21:06', '2024-02-22 07:46:18'),
(17, 'accounting', 'accounting@gmail.com', NULL, '$2y$12$IZSe7AbjjpoRsCc.BDrm/OmTuIBQm7n3SYoJMNRYqnRBSMO/QROFC', 'accounting', '2', NULL, NULL, '2024-02-22 08:00:50', '2024-03-03 09:20:10'),
(18, 'accountingstaff', 'accstaff@gmail.com', NULL, '$2y$12$nzYhatdmnzoMquOSeiaae.4qILZYXugfvflb.xIeo/0awZBHs7KPC', 'accounting', '3', NULL, NULL, '2024-02-22 08:06:01', '2024-03-04 05:53:54'),
(19, 'sales', 'sales@gmail.com', NULL, '$2y$12$.1KNZMYr6Qc8UgZy0U.FAOoDuedg5Zmhu7gVRi3KDuRKjU0YZ35L.', 'sales', '2', NULL, NULL, '2024-02-22 09:05:31', '2024-03-03 14:58:27'),
(20, 'engineering', 'engineering@gmail.com', NULL, '$2y$12$dOxAA3LoL6szJv9zPrAPlepTvAPo75dxKTsy4LTGHvDf06wEeuqk6', 'engineering', '2', NULL, NULL, '2024-02-22 09:07:49', '2024-03-03 12:46:49'),
(21, 'logistics', 'logistics@gmail.com', NULL, '$2y$12$OQ27sBkjVQY57TcnGROULO7K8okL1.Rw8aAQjv0htfYZSBkrQJvwm', 'logistics', '2', NULL, NULL, '2024-02-22 09:09:28', '2024-03-03 14:59:05'),
(22, 'procurement', 'procurement@gmail.com', NULL, '$2y$12$XLSPNjrAfVpdRS2SYnJGAO/ybSQxJps4k8/hwMX3VoQDzyueu3MJC', 'procurement', '2', NULL, NULL, '2024-02-22 09:10:39', '2024-03-03 09:24:39'),
(23, 'purchasing', 'purchasing@gmail.com', NULL, '$2y$12$oo4klBk66SWaBjXBdYXVmeDZoYjyD29.jMHv9AFOkXDVwMN0ZDOTu', 'purchasing', '2', NULL, NULL, '2024-02-22 09:12:37', '2024-03-03 09:26:29'),
(24, 'alex', 'alex@gmail.com', NULL, '$2y$12$Rjas77inxx0pDrtGbv34HOz4ZaA78mSzvHhMoaszqzHMoDL1NGhZe', 'engineering', '2', NULL, NULL, '2024-03-03 12:32:15', '2024-03-03 12:34:04'),
(25, 'salestaff', 'salestaff@gmail.com', NULL, '$2y$12$VhPW/Dc0iWnZhi6WTJ6TM.1LWlJ.o/wkwYha.MDBAHe.2Rc5Ujw8y', 'sales', '3', NULL, NULL, '2024-03-04 16:01:19', '2024-03-04 16:01:19'),
(26, 'engineeringstaff', 'engineeringstaff@gmail.com', NULL, '$2y$12$6HCdTXazxJ4J4eJETdAJpeazCkOIVN9VSD7a//m6yml5pze5y45xa', 'engineering', '3', NULL, NULL, '2024-03-04 16:09:05', '2024-03-04 16:09:05'),
(27, 'logisticstaff', 'logisticstaff@gmail.com', NULL, '$2y$12$IiFTar0PtbkfNjUP0Lh5WuiboF0cx8oiF9.kmUQABZUSpDerP4.8q', 'logistics', '3', NULL, NULL, '2024-03-05 01:04:02', '2024-03-05 01:04:02'),
(28, 'procurementstaff', 'procurementstaff@gmail.com', NULL, '$2y$12$z3.XwO5YgnQARGwTy.8SxeZb2e9sd6fsNRr1wndL.mWi78vnWYK3C', 'procurement', '3', NULL, NULL, '2024-03-05 01:07:48', '2024-03-05 01:07:48'),
(29, 'purchasingstaff', 'purchasingstaff@gmail.com', NULL, '$2y$12$3hbz8xkzt9S8/q66guikPuGJ/cMmSRmX1q.LQzoKvsGTkYQ.n0VU2', 'purchasing', '3', NULL, NULL, '2024-03-05 01:10:38', '2024-03-05 01:10:38'),
(30, 'brena', 'brena@gmail.com', NULL, '$2y$12$Xe3fYQC75CBgusNv3SGlI..1Px1ogQV/PsMoOPtcOtmFxgvMk/uiK', 'sales', '1', NULL, NULL, '2024-03-05 01:54:05', '2024-03-05 01:54:05');

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
-- Indexes for table `all_documents`
--
ALTER TABLE `all_documents`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `all_documents`
--
ALTER TABLE `all_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `engineering_documents`
--
ALTER TABLE `engineering_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `engineering_send_documents`
--
ALTER TABLE `engineering_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logistics_documents`
--
ALTER TABLE `logistics_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logistics_send_documents`
--
ALTER TABLE `logistics_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchasing_documents`
--
ALTER TABLE `purchasing_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchasing_send_documents`
--
ALTER TABLE `purchasing_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_documents`
--
ALTER TABLE `sales_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_send_documents`
--
ALTER TABLE `sales_send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `send_documents`
--
ALTER TABLE `send_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
