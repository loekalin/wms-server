-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 08:33 AM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `small_wms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_uuid`, `category_name`) VALUES
(1, '8aa97048-f3e9-301f-a4e5-fcdd49a704aa', 'Penyiar Radio'),
(2, '59d3c4c5-34ba-369a-ba3c-1ca05446596b', 'Penyelam'),
(3, 'fd549c31-e11a-3f12-9639-889140c2e90a', 'Karyawan BUMD'),
(4, '4005b372-f848-31cc-bc90-e3716b3ed6ce', 'Penata Rambut'),
(5, 'e243f6a2-d650-3e94-9ed1-de5c1c3f1c52', 'Industri');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuings`
--

CREATE TABLE `issuings` (
  `id` bigint UNSIGNED NOT NULL,
  `issuing_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuing_date` timestamp NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issuings`
--

INSERT INTO `issuings` (`id`, `issuing_uuid`, `issuing_date`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '484251bc-5bc8-3f0c-a6b9-f5e746b2b43f', '2012-11-24 12:55:46', 4, '2023-05-24 02:40:05', '2023-05-24 02:40:05'),
(2, '898e56ab-860f-331a-9c75-8c02378944ed', '1997-11-22 09:45:23', 4, '2023-05-24 02:40:05', '2023-05-24 02:40:05'),
(3, '41c476b5-6c3c-3733-9450-09ae38b1d34a', '1984-03-28 05:50:01', 4, '2023-05-24 02:40:05', '2023-05-24 02:40:05'),
(4, '11cb8b63-0532-399b-a946-a263ce8936d1', '1988-12-18 13:36:20', 5, '2023-05-24 02:40:05', '2023-05-24 02:40:05'),
(5, '146c5fb3-11a9-3a78-b78f-3b04b4cbd4d4', '1984-07-04 17:18:23', 4, '2023-05-24 02:40:05', '2023-05-24 02:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `issuing_details`
--

CREATE TABLE `issuing_details` (
  `id` bigint UNSIGNED NOT NULL,
  `issuingdetail_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuing_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issuing_details`
--

INSERT INTO `issuing_details` (`id`, `issuingdetail_uuid`, `issuing_id`, `product_id`) VALUES
(1, 'c8668ac7-982b-3a63-beac-4e784b098d3d', 2, 1),
(2, 'e54eecdd-d0fe-359b-ada7-9611b10126c4', 2, 1),
(3, '4896360e-ad0d-3023-a8d6-199bb4ce5341', 3, 2),
(4, '4d81f7e4-d2d5-3ac3-9479-668328d2b9a4', 3, 5),
(5, 'ab3f5e7c-4726-3ecf-8fa8-0ffe201145c4', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `merks`
--

CREATE TABLE `merks` (
  `id` bigint UNSIGNED NOT NULL,
  `merk_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merks`
--

INSERT INTO `merks` (`id`, `merk_uuid`, `merk_name`) VALUES
(1, 'f12eab34-dddc-3765-8b32-f3eb29879969', 'PT Padmasari'),
(2, 'fb258429-daa0-3f09-8d88-e7092fd521b8', 'PD Handayani'),
(3, '27bade1f-f005-3bcf-bc4c-6a4c7e2a4afc', 'Perum Handayani Wijaya'),
(4, 'ad2cf3c6-1db5-3368-82d6-4e74ec751533', 'Yayasan Pratiwi Handayani Tbk'),
(5, '9356070a-e50b-3fc7-be10-10b2766c46b8', 'CV Dongoran');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_11_043851_create_products_table', 1),
(6, '2023_04_11_062628_create_categories_table', 1),
(7, '2023_04_11_070238_create_merks_table', 1),
(8, '2023_04_11_115945_create_satuans_table', 1),
(9, '2023_04_11_133601_create_suppliers_table', 1),
(10, '2023_04_11_134555_create_sub_categories_table', 1),
(11, '2023_04_12_021354_create_issuings_table', 1),
(12, '2023_04_12_021402_create_receivings_table', 1),
(13, '2023_04_12_021451_create_issuing_details_table', 1),
(14, '2023_04_12_021638_create_receiving_details_table', 1),
(15, '2023_04_13_021019_create_stocks_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `satuan_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_uuid`, `product_name`, `category_id`, `satuan_id`, `sub_category_id`, `supplier_id`, `created_at`, `updated_at`) VALUES
(1, 'a40aca2d-63a4-3229-8a6a-b78f7f2c5263', 'Suci Jelita Haryanti M.Kom.', 1, 4, 5, 2, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(2, 'f381895d-3f2b-3fc3-b70c-db0778141d64', 'Praba Kawaya Natsir', 3, 2, 1, 2, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(3, 'f707a574-50d7-39e6-8373-07aba307d1f6', 'Zulaikha Sudiati', 2, 1, 3, 3, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(4, 'fe4f1dd3-c25a-3e45-acae-2d99d9bfe770', 'Damar Hidayat', 3, 1, 4, 2, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(5, '5ab0799c-9653-3755-aba0-1d35ed9e1975', 'Dodo Bakda Budiman', 4, 3, 3, 2, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(6, '1da7ff7c-f55b-324c-8de4-2610d90a48cd', 'Anom Firmansyah', 3, 1, 1, 5, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(7, '1b4243c4-1ead-3e5a-bdc0-6058b94a58f8', 'Jasmin Handayani', 1, 3, 1, 5, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(8, '39dafc24-3a44-3d93-b9b8-731ec45fcd4b', 'Radika Sinaga', 3, 2, 2, 4, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(9, 'a5ae33aa-b8f5-369c-bf2f-44d82132e865', 'Siti Wijayanti', 1, 5, 4, 1, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(10, '63aaadd5-1450-3a8a-9e87-174af580d8db', 'Alika Pertiwi', 4, 4, 3, 3, '2023-05-24 02:40:01', '2023-05-24 02:40:01'),
(11, 'dr344-ffg6666-3a8a-9e87-gh55553dddsf', 'Eko handoks', 1, 4, 3, 1, '2023-05-24 02:40:01', '2023-05-24 02:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `receivings`
--

CREATE TABLE `receivings` (
  `id` bigint UNSIGNED NOT NULL,
  `receiving_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `receiving_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receivings`
--

INSERT INTO `receivings` (`id`, `receiving_uuid`, `user_id`, `receiving_date`, `created_at`, `updated_at`) VALUES
(1, '1b99777b-be90-3591-adb2-fb76437dc364', 1, '1998-12-19 21:34:50', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(2, 'a5d61389-0eda-3e6c-8f93-97cd28cbdd2b', 5, '1980-01-29 19:10:19', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(3, '63780037-c53f-39df-ae55-88d3285d2ab3', 3, '1990-09-25 02:00:42', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(4, '1d1d7cde-c685-3e24-b2d5-a721d700b4d4', 2, '1996-08-14 21:06:33', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(5, '8c5aeaad-184d-3d5a-8678-5622bc41011e', 4, '1978-12-20 08:33:28', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(6, 'e7cfba2b-d133-3148-8220-984f9ed5ecf8', 3, '2008-10-24 02:32:35', '2023-05-24 02:40:06', '2023-05-24 02:40:06'),
(7, '06e3383b-3bae-3a79-ad68-8249886f9890', 3, '2011-01-15 12:02:07', '2023-05-24 02:40:07', '2023-05-24 02:40:07'),
(8, 'f5704563-de6e-367e-a213-a5953eaa1623', 5, '2016-07-08 05:32:38', '2023-05-24 02:40:07', '2023-05-24 02:40:07'),
(9, 'f85decf4-cfa9-3fb6-b666-b10686f51481', 1, '1988-02-19 18:47:46', '2023-05-24 02:40:07', '2023-05-24 02:40:07'),
(10, '0a6469d2-861b-3406-a984-2711d61124fc', 1, '2002-09-13 06:41:35', '2023-05-24 02:40:07', '2023-05-24 02:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `receiving_details`
--

CREATE TABLE `receiving_details` (
  `id` bigint UNSIGNED NOT NULL,
  `receivingdetail_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiving_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receiving_details`
--

INSERT INTO `receiving_details` (`id`, `receivingdetail_uuid`, `receiving_id`, `product_id`) VALUES
(1, 'cbf2b192-418e-39c8-89f6-e73599ce393e', 2, 4),
(2, '5ff2520c-12c0-3fb2-9e32-4bc25db6eaec', 3, 3),
(3, 'b163d5b6-47df-308d-80ad-f0ed3b917b97', 1, 1),
(4, '250f1d83-4cab-382a-88b5-02fd0b477853', 4, 3),
(5, 'ce31d074-43b5-3070-8e98-cc0b0b8acf96', 5, 5),
(6, '604d3db6-8078-3d65-b759-ec030877cbcc', 6, 3),
(7, '58da39d6-1767-3483-a705-876108b24ffd', 7, 1),
(8, 'abe01b56-a647-33b9-8808-196c92713b85', 8, 2),
(9, 'fd1f5c4d-f248-370b-a0c8-48e2a15c9316', 9, 4),
(10, '5d016326-a728-3834-942f-8fbf290aac9c', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `satuans`
--

CREATE TABLE `satuans` (
  `id` bigint UNSIGNED NOT NULL,
  `satuan_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `satuans`
--

INSERT INTO `satuans` (`id`, `satuan_uuid`, `satuan_name`, `created_at`, `updated_at`) VALUES
(1, '456b577c-49eb-30e2-9800-b704cafb5e2f', 'Guru', NULL, NULL),
(2, '9e932c13-9360-363f-9730-cb8822e3394a', 'Promotor Acara', NULL, NULL),
(3, '393a5417-d02f-3616-a744-21ff9b3ad747', 'Tukang Gigi', NULL, NULL),
(4, 'e000e2dd-bd11-37ea-bac2-788f93b52730', 'Pramugari', NULL, NULL),
(5, '6238af3e-527e-328b-abb9-777ee4c10f80', 'Akuntan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `stock_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_value` bigint NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `stock_uuid`, `stock_value`, `product_id`, `created_at`, `updated_at`) VALUES
(1, '054da3f9-af86-3be3-830a-55d59f63075e', 958, 1, NULL, NULL),
(2, '58c44e5d-9964-3504-8647-882cbc95c15b', 97, 2, NULL, NULL),
(3, '37fa269e-579a-36f7-8f2e-324cc8292624', 240, 3, NULL, NULL),
(4, '11c45839-6d89-3d46-9a5b-3ae96d109591', 478, 4, NULL, NULL),
(5, 'd89400f5-eaa7-3ec3-b1af-1217c1186e36', 109, 5, NULL, NULL),
(6, 'a40d2784-fbed-3508-8bf7-3be8a33c5917', 27, 6, NULL, NULL),
(7, 'e8fad5e3-6189-301e-82d3-697b1cdb7057', 243, 7, NULL, NULL),
(8, '4c7efe36-eb32-3da9-bd93-1d1a2cbe454a', 819, 8, NULL, NULL),
(9, '3c096af4-2f52-3537-b872-af7964fec09c', 821, 9, NULL, NULL),
(10, 'cf48c504-3f3c-3273-b4d0-478dcced089c', 586, 10, NULL, NULL),
(11, 'cf48c504-3f3c-g4tt-g4g4-e4444g4g4', 5888, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `subcategory_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `subcategory_uuid`, `subcategory_name`) VALUES
(1, 'dc2c82c8-f3dc-3a62-8aff-d6a0fc45eee2', 'Carub Prayoga M.Kom.'),
(2, '0fc602ad-1adc-3f6c-aaa2-7f95d8b94987', 'Mulyanto Bagiya Utama S.H.'),
(3, '74af8cb6-f433-3f4d-9e13-181102da3d07', 'Malika Patricia Yuniar'),
(4, 'a2ba50b5-cd2d-3433-9379-d38cc3d1c607', 'Calista Mayasari'),
(5, 'af1c4b31-b5da-39d1-91b6-093cce0e9afc', 'Cawisadi Ardianto'),
(6, 'b4106125-3d7c-3663-9ea6-8520993645b6', 'Vanya Umi Nurdiyanti S.Pt'),
(7, '74b5bbce-c1c1-3e3f-aa16-2a41304dcd99', 'Labuh Gading Siregar'),
(8, '90788e9e-8c53-3a82-9cf1-f79891dd26ce', 'Alika Cinthia Wulandari'),
(9, '7b62b1f0-224c-3c0c-9279-a6ef820a4cb5', 'Jamalia Halimah M.Pd'),
(10, 'bd906794-0ed6-3f96-971c-c596063659d2', 'Zalindra Mardhiyah');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_uuid`, `supplier_name`) VALUES
(1, '39815bf7-b9d3-31da-a2ed-2022c0189809', 'Martana Raihan Firmansyah S.H.'),
(2, '347393c9-16fc-3fbe-8966-ae2ebf2ce81e', 'Irwan Iswahyudi S.E.I'),
(3, '4297a3c7-2ca3-359d-9548-b97f1b649bab', 'Uchita Pratiwi'),
(4, '4be9fae7-82a9-3a14-9c1b-c7772e41eb8c', 'Danang Gunarto S.Pt'),
(5, '9446d517-2e0b-324e-bb09-3e3c2d49f4a4', 'Widya Palastri');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_uuid`, `username`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'ff52f022-ada1-3ab8-bf9d-8f41c6d426af', 'agustina.septi', 'admin', '$2y$10$tBZgilUVK2im2VUlV8mMgOLG.QtJ7o1Q6dXUBWxtm6mcJCwyrewhK', '2023-05-24 02:40:08', '2023-05-24 02:40:08'),
(2, '78b08139-7828-3524-93e9-9f0a10849e96', 'karta.sihombing', 'user', '$2y$10$gL7UATgR8Wq7pvNTqXOALezj.ZM8xJUoHfw1R0MptoP2sYTjDxpU.', '2023-05-24 02:40:08', '2023-05-24 02:40:08'),
(3, 'a468e45a-3f18-332a-9cb5-af8e77736872', 'calista.yolanda', 'user', '$2y$10$mfTjf66KlHuyFDUexDU6O.f01JnNM2uMjMOD4EicbopBOVk0cU1Cu', '2023-05-24 02:40:08', '2023-05-24 02:40:08'),
(4, '0ac8939a-c46a-376c-bc53-54f6b37289a6', 'bhartati', 'user', '$2y$10$n8n2/oz/lMEuhFc.wsWuieJGmTPV/q9gKNHset4INhV4Kw30IJyKK', '2023-05-24 02:40:08', '2023-05-24 02:40:08'),
(5, '0933afe3-f345-37e9-8081-c24a210bc850', 'ajiono.yuniar', 'user', '$2y$10$nLniwVMI5WpsONCIsTTK.O67La0Bq8Vn3.t4jMzwkcAffZMKPbVl6', '2023-05-24 02:40:08', '2023-05-24 02:40:08'),
(6, 'ed3b619e-e6e3-31a9-88fe-6e62ccf264b8', 'rizky', 'admin', '$2y$10$TdqrImQRlS2ukg3VWJf8bOoYrNC4zRDVWS62pLtTeovgRIImA67Ue', '2023-05-24 02:59:04', '2023-05-24 02:59:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_uuid_unique` (`category_uuid`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `issuings`
--
ALTER TABLE `issuings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `issuings_issuing_uuid_unique` (`issuing_uuid`);

--
-- Indexes for table `issuing_details`
--
ALTER TABLE `issuing_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `issuing_details_issuingdetail_uuid_unique` (`issuingdetail_uuid`);

--
-- Indexes for table `merks`
--
ALTER TABLE `merks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merks_merk_uuid_unique` (`merk_uuid`),
  ADD UNIQUE KEY `merks_merk_name_unique` (`merk_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_uuid_unique` (`product_uuid`),
  ADD UNIQUE KEY `products_product_name_unique` (`product_name`);

--
-- Indexes for table `receivings`
--
ALTER TABLE `receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_details`
--
ALTER TABLE `receiving_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuans`
--
ALTER TABLE `satuans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `satuans_satuan_uuid_unique` (`satuan_uuid`),
  ADD UNIQUE KEY `satuans_satuan_name_unique` (`satuan_name`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stocks_stock_uuid_unique` (`stock_uuid`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_subcategory_uuid_unique` (`subcategory_uuid`),
  ADD UNIQUE KEY `sub_categories_subcategory_name_unique` (`subcategory_name`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_supplier_uuid_unique` (`supplier_uuid`),
  ADD UNIQUE KEY `suppliers_supplier_name_unique` (`supplier_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_uuid_unique` (`user_uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuings`
--
ALTER TABLE `issuings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `issuing_details`
--
ALTER TABLE `issuing_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `merks`
--
ALTER TABLE `merks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `receivings`
--
ALTER TABLE `receivings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `receiving_details`
--
ALTER TABLE `receiving_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `satuans`
--
ALTER TABLE `satuans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
