-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table elashes.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorias_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.categorias: ~12 rows (approximately)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Ojo de gato', NULL, 'img/Categoria/5-064737-0.jpeg', 8, NULL, '2021-05-17 01:25:40', '2021-05-18 18:47:37'),
	(2, 'Uñas', NULL, NULL, NULL, NULL, NULL, '2021-10-29 10:45:08'),
	(3, 'cat3', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'cat12', NULL, NULL, 1, NULL, NULL, NULL),
	(5, 'Mixta', NULL, 'http://192.168.0.14:8500/imgweb/default.jpg', 8, NULL, '2021-05-17 01:25:39', '2021-05-18 18:48:54'),
	(6, 'cat1234', NULL, NULL, 5, NULL, NULL, NULL),
	(7, 'newcat2', NULL, 'img/Categoria/3-012450-9.png', 2, NULL, '2021-05-17 01:24:51', '2021-05-17 01:24:51'),
	(8, 'Fibra natural', NULL, '/imgweb/default.jpg', 9, NULL, '2021-05-17 17:09:00', '2021-05-18 18:46:11'),
	(9, 'Pestañas', NULL, 'img/Categoria/4-064436-10.jpeg', NULL, NULL, '2021-05-18 18:44:36', '2021-05-18 18:44:36'),
	(10, 'aaaa', NULL, 'img/Categoria/3-080314-2.jpg', 8, NULL, '2021-05-29 20:03:14', '2021-05-29 20:03:14'),
	(11, 'Cejas', NULL, 'img/Categoria/9-033927-10.png', 3, NULL, '2021-10-27 15:39:27', '2021-10-29 10:46:37'),
	(12, 'Cabello', NULL, 'img/Categoria/1-104945-8.png', NULL, NULL, '2021-10-29 10:49:45', '2021-10-29 10:49:45');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Dumping structure for table elashes.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.clientes: ~37 rows (approximately)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `ci`, `celular`, `email`, `fecha_nacimiento`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'cliente1', '2222', '5555', NULL, '1994-06-07', NULL, '2021-05-16 18:06:45', '2021-05-16 18:06:45'),
	(2, 'cliente2', '23423', '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:41', '2021-05-16 18:07:41'),
	(3, 'cliente2', '23423', '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(4, 'cccc233', '344', '34534', NULL, '2021-05-06', NULL, '2021-05-16 18:44:18', '2021-05-16 18:44:18'),
	(5, 'nada32', '3423', '5555', NULL, '2021-04-29', NULL, '2021-05-16 18:45:09', '2021-05-16 18:45:09'),
	(6, 'cliente1', '2222', '5555', NULL, '1994-06-07', NULL, '2021-05-16 18:06:45', '2021-05-16 18:06:45'),
	(7, 'cccc233', '344', '34534', NULL, '2021-05-06', NULL, '2021-05-16 18:44:18', '2021-05-16 18:44:18'),
	(8, 'cliente2', '23423', '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(9, 'cliente2', '23423', '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:41', '2021-05-16 18:07:41'),
	(10, 'cliente2', '23423', '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(11, 'este es nuevo1', '23423', '4324323', NULL, '2021-05-29', NULL, '2021-05-16 20:20:32', '2021-05-17 00:46:42'),
	(12, 'aaaaaa', '23', '32', NULL, '2021-04-28', NULL, '2021-05-17 00:47:04', '2021-05-17 00:47:04'),
	(13, 'rene', '23423', '3242343', NULL, NULL, NULL, '2021-05-17 17:01:15', '2021-05-17 17:01:15'),
	(14, 'a1', 'ci1', 'cel1', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(15, 'a2', 'ci2', 'cel2', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(16, 'a3', 'ci3', 'cel3', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(17, 'a4', 'ci4', 'cel4', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(18, 'a5', 'ci5', 'cel5', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(19, 'a6', 'ci6', 'cel6', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(20, 'a7', 'ci7', 'cel7', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(21, 'a8', 'ci8', 'cel8', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(22, 'a9', 'ci9', 'cel9', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(23, 'nombre1', 'ci1', 'cel1', NULL, '1991-12-12', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(24, 'a2', 'ci2', 'cel2', NULL, '1991-12-13', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(25, 'a3', 'ci3', 'cel3', NULL, '1991-12-14', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(26, 'a4', 'ci4', 'cel4', NULL, '1991-12-15', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(27, 'a5', 'ci5', 'cel5', NULL, '1991-12-16', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(28, 'a6', 'ci6', 'cel6', NULL, '1991-12-17', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(29, 'a7', 'ci7', 'cel7', NULL, '1991-12-18', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(30, 'a8', 'ci8', 'cel8', NULL, '1991-12-19', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(31, 'a9', 'ci9', 'cel9', NULL, '1991-12-20', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(32, '123cli763', '12333', '61784422', 'cliente1@cliente1.com', '2021-06-26', NULL, '2021-06-06 21:36:21', '2021-06-14 00:58:30'),
	(33, 'siamon223', '44343', '3434', NULL, NULL, NULL, '2021-06-14 01:04:31', '2021-06-14 01:04:31'),
	(34, '3333333333', '333333333', '55555', NULL, NULL, NULL, '2021-06-14 01:04:47', '2021-06-14 01:04:47'),
	(35, 'f3333', '34', NULL, NULL, NULL, NULL, '2021-06-14 01:06:37', '2021-06-14 01:06:37'),
	(36, 'f55555', 'f5555', NULL, NULL, NULL, NULL, '2021-06-14 01:07:25', '2021-06-14 01:07:25'),
	(37, '65656', '565656', NULL, NULL, NULL, NULL, '2021-06-14 01:10:28', '2021-06-14 01:10:28'),
	(38, '999', '999', NULL, NULL, NULL, NULL, '2021-06-14 01:10:38', '2021-06-14 01:10:38'),
	(39, '655666', '565656', NULL, NULL, NULL, NULL, '2021-06-14 01:11:00', '2021-06-14 01:11:00'),
	(40, '9996', '96456', NULL, NULL, NULL, NULL, '2021-06-14 01:11:53', '2021-06-14 01:11:53'),
	(41, 's222244', '555', NULL, NULL, NULL, NULL, '2021-06-14 01:12:25', '2021-06-14 10:49:30'),
	(42, 'Timoteo', '589644', '5677875465', NULL, NULL, NULL, '2021-08-20 10:56:35', '2021-08-20 10:56:35'),
	(43, 'siamon', '555', '44545', 'abc@gmail.com', '2021-10-08', NULL, '2021-10-07 12:55:48', '2021-10-07 12:55:48'),
	(44, 'newsiamon', '76565', '34444', 'racsoscaree0007@gmail.com', '2021-10-07', NULL, '2021-10-07 12:57:44', '2021-10-07 12:57:44'),
	(45, 'Ana Delgado Lopez', '8798545', '77478775', 'ana@gmail.com', '2021-10-27', NULL, '2021-10-27 14:26:26', '2021-10-27 14:26:26'),
	(46, 'Mar Cruz', '1234556', '5677875465', 'mar@gmail.com', '2021-10-27', NULL, '2021-10-27 14:52:04', '2021-10-27 14:52:04'),
	(47, 'Carla Gomez', '123456', '7487545', NULL, '2000-08-22', NULL, '2021-10-28 10:10:48', '2021-10-28 10:10:48');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Dumping structure for table elashes.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table elashes.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.migrations: ~9 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_11_000000_create_sucursals_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2021_05_16_033805_create_categorias_table', 1),
	(6, '2021_05_16_033822_create_servicios_table', 1),
	(7, '2021_05_16_033847_create_clientes_table', 1),
	(10, '2021_05_16_033908_create_ventas_table', 2),
	(11, '2021_06_02_151303_sucursal_user', 3),
	(12, '2021_06_14_151611_create_recordatorios_table', 4),
	(13, '2021_07_07_101614_create_recordatorio_ventas_table', 5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table elashes.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table elashes.recordatorios
CREATE TABLE IF NOT EXISTS `recordatorios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `servicio_id` bigint(20) unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dias` int(11) NOT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recordatorios_servicio_id_foreign` (`servicio_id`),
  CONSTRAINT `recordatorios_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.recordatorios: ~5 rows (approximately)
/*!40000 ALTER TABLE `recordatorios` DISABLE KEYS */;
INSERT INTO `recordatorios` (`id`, `servicio_id`, `nombre`, `dias`, `mensaje`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 5, 'recordatorio 1', 1, 'mensaje 1', NULL, '2021-06-14 16:46:19', '2021-06-14 17:07:15'),
	(2, 5, 'recordatorio 2', 2, 'mensaje 2', NULL, '2021-06-14 16:46:37', '2021-06-14 17:26:37'),
	(3, 5, 'recordatorio 3', 3, 'mensaje 3', NULL, '2021-06-14 17:26:26', '2021-06-14 17:26:26'),
	(4, 8, 'Ana Delgado Lopez', 2, 'volver para el segundo tratamiento', NULL, '2021-10-27 15:26:34', '2021-10-27 15:26:34'),
	(5, 7, 'Recordas corte', 1, 'recodar el corte de pelo', NULL, '2021-10-27 16:32:23', '2021-10-27 16:32:23'),
	(6, 8, 'Pregunta sin descripcion', 3, 'volver', NULL, '2021-10-29 09:43:41', '2021-10-29 09:43:41');
/*!40000 ALTER TABLE `recordatorios` ENABLE KEYS */;

-- Dumping structure for table elashes.recordatorio_ventas
CREATE TABLE IF NOT EXISTS `recordatorio_ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordatorio_id` bigint(20) unsigned NOT NULL,
  `venta_id` bigint(20) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `recordado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recordatorio_ventas_recordatorio_id_foreign` (`recordatorio_id`),
  KEY `recordatorio_ventas_venta_id_foreign` (`venta_id`),
  CONSTRAINT `recordatorio_ventas_recordatorio_id_foreign` FOREIGN KEY (`recordatorio_id`) REFERENCES `recordatorios` (`id`),
  CONSTRAINT `recordatorio_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.recordatorio_ventas: ~45 rows (approximately)
/*!40000 ALTER TABLE `recordatorio_ventas` DISABLE KEYS */;
INSERT INTO `recordatorio_ventas` (`id`, `recordatorio_id`, `venta_id`, `fecha`, `recordado`, `created_at`, `updated_at`) VALUES
	(1, 1, 32, '2021-07-08', 0, NULL, NULL),
	(2, 2, 32, '2021-07-09', 1, NULL, '2021-07-08 14:08:40'),
	(3, 3, 32, '2021-07-10', 1, NULL, '2021-07-07 15:32:36'),
	(4, 1, 36, '2021-08-21', 0, NULL, NULL),
	(5, 2, 36, '2021-08-22', 0, NULL, NULL),
	(6, 3, 36, '2021-08-23', 0, NULL, NULL),
	(7, 1, 37, '2021-08-21', 0, NULL, NULL),
	(8, 2, 37, '2021-08-22', 0, NULL, NULL),
	(9, 3, 37, '2021-08-23', 0, NULL, NULL),
	(10, 1, 39, '2021-08-21', 0, NULL, NULL),
	(11, 2, 39, '2021-08-22', 0, NULL, NULL),
	(12, 3, 39, '2021-08-23', 0, NULL, NULL),
	(13, 1, 41, '2021-08-21', 0, NULL, NULL),
	(14, 2, 41, '2021-08-22', 0, NULL, NULL),
	(15, 3, 41, '2021-08-23', 0, NULL, NULL),
	(16, 1, 43, '2021-08-21', 0, NULL, NULL),
	(17, 2, 43, '2021-08-22', 0, NULL, NULL),
	(18, 3, 43, '2021-08-23', 0, NULL, NULL),
	(19, 1, 45, '2021-08-21', 0, NULL, NULL),
	(20, 2, 45, '2021-08-22', 0, NULL, NULL),
	(21, 3, 45, '2021-08-23', 1, NULL, '2021-10-07 13:10:14'),
	(22, 1, 48, '2021-08-21', 0, NULL, NULL),
	(23, 2, 48, '2021-08-22', 0, NULL, NULL),
	(24, 3, 48, '2021-08-23', 0, NULL, NULL),
	(25, 1, 50, '2021-08-21', 0, NULL, NULL),
	(26, 2, 50, '2021-08-22', 0, NULL, NULL),
	(27, 3, 50, '2021-08-23', 0, NULL, NULL),
	(28, 1, 52, '2021-08-21', 0, NULL, NULL),
	(29, 2, 52, '2021-08-22', 0, NULL, NULL),
	(30, 3, 52, '2021-08-23', 0, NULL, NULL),
	(31, 1, 53, '2021-08-21', 0, NULL, NULL),
	(32, 2, 53, '2021-08-22', 0, NULL, NULL),
	(33, 3, 53, '2021-08-23', 0, NULL, NULL),
	(34, 1, 55, '2021-08-21', 0, NULL, NULL),
	(35, 2, 55, '2021-08-22', 0, NULL, NULL),
	(36, 3, 55, '2021-08-23', 0, NULL, NULL),
	(37, 1, 57, '2021-09-23', 0, NULL, NULL),
	(38, 2, 57, '2021-09-24', 0, NULL, '2021-10-07 13:10:05'),
	(39, 3, 57, '2021-09-25', 1, NULL, '2021-10-27 15:02:35'),
	(40, 1, 65, '2021-10-28', 1, NULL, '2021-10-27 15:18:09'),
	(41, 2, 65, '2021-10-29', 0, NULL, NULL),
	(42, 3, 65, '2021-10-30', 0, NULL, NULL),
	(43, 1, 72, '2021-10-28', 0, NULL, '2021-10-27 15:31:03'),
	(44, 2, 72, '2021-10-29', 0, NULL, NULL),
	(45, 3, 72, '2021-10-30', 0, NULL, NULL),
	(46, 5, 74, '2021-10-28', 1, NULL, '2021-10-27 16:33:38'),
	(47, 4, 75, '2021-10-29', 0, NULL, NULL),
	(48, 4, 76, '2021-10-29', 0, NULL, NULL),
	(49, 1, 77, '2021-10-30', 0, NULL, NULL),
	(50, 2, 77, '2021-10-31', 0, NULL, NULL),
	(51, 3, 77, '2021-11-01', 0, NULL, NULL),
	(52, 4, 78, '2022-01-15', 0, NULL, NULL),
	(53, 6, 78, '2022-01-16', 0, NULL, NULL),
	(54, 4, 80, '2022-01-15', 0, NULL, NULL),
	(55, 6, 80, '2022-01-16', 0, NULL, NULL),
	(56, 4, 81, '2022-01-15', 0, NULL, NULL),
	(57, 6, 81, '2022-01-16', 0, NULL, NULL);
/*!40000 ALTER TABLE `recordatorio_ventas` ENABLE KEYS */;

-- Dumping structure for table elashes.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `comision` double(8,2) NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promocion` tinyint(1) DEFAULT '0',
  `estado` enum('habilitado','deshabilitado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicios_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `servicios_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.servicios: ~12 rows (approximately)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `imagen`, `precio`, `comision`, `codigo`, `promocion`, `estado`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'ccc2222223', NULL, 'img/Servicio/2-023826-5.jpg', 33.00, 0.00, '123', 0, 'habilitado', 7, NULL, '2021-05-17 11:00:14', '2021-06-08 11:36:55'),
	(2, 'ser14444', NULL, 'img/Servicio/1-125938-2.png', 44.00, 0.00, '23423', 0, 'habilitado', 1, NULL, '2021-05-17 17:12:48', '2021-06-08 11:36:53'),
	(3, 'Extensiones', NULL, 'img/Servicio/7-125924-8.jpg', 150.00, 0.00, '123123', 0, 'habilitado', 1, NULL, '2021-05-18 18:51:06', '2021-06-08 11:36:45'),
	(4, 'ssss123', NULL, 'img/Servicio/3-020204-9.jpeg', 323.00, 30.00, '332', 0, 'habilitado', 2, NULL, '2021-06-02 14:02:04', '2021-07-03 21:13:15'),
	(5, 'servicio recordado', NULL, 'img/Servicio/8-110724-7.png', 32.00, 10.00, 'null', 1, 'habilitado', 5, NULL, '2021-06-14 11:07:24', '2021-07-03 21:13:06'),
	(6, 'Servicio Rene', NULL, 'img/Servicio/9-011136-3.png', 150.00, 30.00, 'null', 0, 'habilitado', 10, NULL, '2021-07-05 13:11:37', '2021-07-05 13:11:58'),
	(7, 'Pestanas pelo a pelo', NULL, 'img/Servicio/6-022927-1.png', 70.00, 25.00, 'null', 1, 'habilitado', 9, NULL, '2021-10-27 14:29:27', '2021-10-27 14:29:40'),
	(8, 'Pestanas pelo a pelo natural', NULL, 'img/Servicio/2-044124-2.png', 70.00, 25.00, 'null', 1, 'habilitado', 8, NULL, '2021-10-27 15:21:41', '2021-10-27 17:56:47'),
	(9, 'unas', NULL, 'img/Servicio/8-103257-9.png', 70.00, 25.00, NULL, 0, 'habilitado', 2, NULL, '2021-10-29 10:32:57', '2021-10-29 10:32:57'),
	(10, 'Rizado de cabello', NULL, 'img/Servicio/5-103719-1.png', 90.00, 30.00, NULL, 0, 'habilitado', 3, NULL, '2021-10-29 10:37:19', '2021-10-29 10:37:19'),
	(11, 'Planchado de cabello', NULL, 'img/Servicio/1-103753-8.png', 70.00, 25.00, NULL, 0, 'habilitado', 3, NULL, '2021-10-29 10:37:53', '2021-10-29 10:37:53'),
	(12, 'unas de gel', NULL, 'img/Servicio/2-103819-3.png', 70.00, 25.00, NULL, 0, 'habilitado', 2, NULL, '2021-10-29 10:38:19', '2021-10-29 10:38:19');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Dumping structure for table elashes.sucursals
CREATE TABLE IF NOT EXISTS `sucursals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.sucursals: ~3 rows (approximately)
/*!40000 ALTER TABLE `sucursals` DISABLE KEYS */;
INSERT INTO `sucursals` (`id`, `direccion`, `telefono`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 's1', NULL, 's12111', NULL, NULL, '2021-05-17 11:36:25'),
	(2, 'Calle España #342', '12345678', '123', NULL, '2021-05-17 11:35:09', '2021-10-27 15:15:12'),
	(3, 'ddd', '312', 'sss4', NULL, '2021-05-17 17:15:04', '2021-06-14 11:22:22');
/*!40000 ALTER TABLE `sucursals` ENABLE KEYS */;

-- Dumping structure for table elashes.sucursal_user
CREATE TABLE IF NOT EXISTS `sucursal_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `sucursal_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_user_user_id_foreign` (`user_id`),
  KEY `sucursal_user_sucursal_id_foreign` (`sucursal_id`),
  CONSTRAINT `sucursal_user_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  CONSTRAINT `sucursal_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.sucursal_user: ~11 rows (approximately)
/*!40000 ALTER TABLE `sucursal_user` DISABLE KEYS */;
INSERT INTO `sucursal_user` (`id`, `user_id`, `sucursal_id`, `created_at`, `updated_at`) VALUES
	(5, 2, 1, NULL, NULL),
	(6, 2, 2, NULL, NULL),
	(7, 3, 1, NULL, NULL),
	(8, 1, 1, NULL, NULL),
	(10, 4, 1, NULL, NULL),
	(23, 5, 1, NULL, NULL),
	(24, 5, 2, NULL, NULL),
	(25, 5, 3, NULL, NULL),
	(26, 6, 1, NULL, NULL),
	(27, 6, 2, NULL, NULL),
	(28, 7, 1, NULL, NULL),
	(51, 8, 1, NULL, NULL),
	(52, 8, 2, NULL, NULL);
/*!40000 ALTER TABLE `sucursal_user` ENABLE KEYS */;

-- Dumping structure for table elashes.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` enum('root','admin','supervisor','secretario','operador') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nombre`, `celular`, `ci`, `fecha_nacimiento`, `username`, `email`, `email_verified_at`, `password`, `codigo`, `rol`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'root', NULL, NULL, NULL, 'root', 'root@root.com', NULL, '$2y$10$IlK7TBcefnjOrjvheCliOO8OB07JrS6UMCEauLRJlEjnZQhXP7Pi6', '000', 'root', NULL, NULL, '2021-05-16 01:48:31', '2021-06-02 16:12:41'),
	(2, 'osss123111', '44545', '555', '2021-04-27', 'racso', 'racso@racso.com', NULL, '$2y$10$JDxF/UWJ39jGMv.08.SGLOyk1g9rqKjB3UxQbPKxcvP4IxWlCFuPC', '222', 'admin', NULL, NULL, '2021-05-17 13:58:35', '2021-05-17 15:25:55'),
	(3, 'ffff', '32423', '2324', '2021-06-24', 'newuse', 'info@ffff.com', NULL, '$2y$10$qQ9RKjbJZQddP6ytsTF0kODw0N4eqXvE5GA7eZpfeXci4XGGaedxW', NULL, 'operador', NULL, NULL, '2021-06-02 16:10:44', '2021-06-02 16:10:44'),
	(4, 'ccc22222', '34343', '7777', '2021-06-15', 'operador', 'op@op.com', NULL, '$2y$10$JOpFhTmRnUtHM84NpCoFlOqDJBTV9mw7ZncRhI/1Ov61fBdHjeaB2', '111', 'secretario', NULL, NULL, '2021-06-02 16:14:20', '2021-06-07 14:47:14'),
	(5, 'supervisor123', '434534534', '1233555', '2021-07-09', '543545', 'supervisor@supervisor.com', NULL, '$2y$10$2Hgimd..hRPkwi4.MZx2ReBpluFZTsH9dsXMi8Gj3iUP5M/WDxoWm', '3333333', 'supervisor', NULL, NULL, '2021-07-08 11:21:11', '2021-07-13 09:44:58'),
	(6, 'Maria Villa', '77478775', '12345678', '2021-10-27', 'maria21', 'maria@gmail.com', NULL, '$2y$10$sAACyFi1b/lKuPfkYGGbl.0J3UlD0JCCwXTwtcZ65lHre0E2Nd1/m', '0000', 'supervisor', NULL, NULL, '2021-10-27 14:38:15', '2021-10-27 14:38:15'),
	(7, 'Alejandra Martínez', '77478775', '987654321', '2021-10-04', '12345678', 'ale@gmail.com', NULL, '$2y$10$QFIRkI8dm9AlyYDorOHfRunwOFb1NqVDjG4HBqzb5Sclt7bFsOiE.', '0000', 'operador', NULL, NULL, '2021-10-27 14:41:07', '2021-10-27 14:41:07'),
	(8, 'Luz', '5677875465', '12345678', '2021-10-27', 'luz123', 'luz@gmail.com', NULL, '$2y$10$Qch6oI/wu9wxVbywx2/hu.cLMHqusSXrtb0c9YBXShbDj4uqraia6', '2222', 'secretario', NULL, NULL, '2021-10-27 15:45:32', '2021-10-27 17:40:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table elashes.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint(20) unsigned NOT NULL,
  `sucursal_id` bigint(20) unsigned NOT NULL,
  `servicio_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ficha` int(11) DEFAULT NULL,
  `subtotal` double(8,2) NOT NULL,
  `descuento` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('aceptado','anulado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago` enum('efectivo','tarjeta','transferencia') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'efectivo',
  `facturado` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_cliente_id_foreign` (`cliente_id`),
  KEY `ventas_sucursal_id_foreign` (`sucursal_id`),
  KEY `ventas_servicio_id_foreign` (`servicio_id`),
  KEY `ventas_user_id_foreign` (`user_id`),
  CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `ventas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table elashes.ventas: ~56 rows (approximately)
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `cliente_id`, `sucursal_id`, `servicio_id`, `user_id`, `precio`, `cantidad`, `ficha`, `subtotal`, `descuento`, `total`, `descripcion`, `estado`, `pago`, `facturado`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(17, 13, 1, 5, NULL, 32.00, 1, 1, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 18:52:20', '2021-07-03 18:52:20'),
	(18, 13, 1, 1, NULL, 33.00, 1, 2, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 18:52:20', '2021-07-03 18:52:20'),
	(19, 36, 1, 2, 4, 44.00, 1, 3, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 18:52:47', '2021-07-03 18:52:47'),
	(20, 36, 1, 1, NULL, 33.00, 1, 4, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 18:52:47', '2021-07-03 18:52:47'),
	(21, 41, 1, 1, NULL, 33.00, 1, 5, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 18:55:14', '2021-07-03 18:55:14'),
	(22, 8, 1, 1, NULL, 33.00, 1, 6, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-03 19:05:56', '2021-07-03 19:05:56'),
	(23, 13, 1, 2, 4, 44.00, 1, 1, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-07-04 00:02:18', '2021-07-04 00:02:18'),
	(24, 13, 1, 1, NULL, 33.00, 1, 2, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-07-04 00:02:18', '2021-07-04 00:02:18'),
	(25, 13, 1, 3, 4, 150.00, 1, 3, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-07-04 00:02:18', '2021-07-04 00:02:18'),
	(26, 41, 1, 3, 3, 150.00, 1, 1, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-05 11:12:09', '2021-07-05 13:13:53'),
	(27, 41, 1, 2, NULL, 44.00, 1, 2, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-05 13:16:23', '2021-07-05 13:16:23'),
	(28, 33, 1, 2, NULL, 44.00, 1, 3, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-05 13:18:15', '2021-07-05 13:18:15'),
	(29, 33, 1, 3, NULL, 150.00, 1, 4, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-05 13:18:15', '2021-07-05 13:18:15'),
	(30, 13, 1, 5, 3, 32.00, 1, 1, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-07 10:49:14', '2021-07-07 10:49:14'),
	(31, 13, 1, 5, 3, 32.00, 1, 2, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-07 10:49:30', '2021-07-07 10:49:30'),
	(32, 13, 1, 5, 3, 32.00, 1, 3, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-07 10:50:04', '2021-07-07 11:51:32'),
	(33, 41, 1, 2, NULL, 44.00, 1, 1, 44.00, 0.00, 44.00, '', 'aceptado', 'tarjeta', 1, NULL, '2021-07-08 11:13:18', '2021-07-08 11:13:18'),
	(34, 41, 1, 3, NULL, 150.00, 1, 2, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-08 16:59:10', '2021-07-08 16:59:10'),
	(35, 41, 1, 2, NULL, 44.00, 1, 3, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-07-08 16:59:10', '2021-07-08 16:59:10'),
	(36, 42, 1, 5, 4, 32.00, 1, 1, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 10:57:53', '2021-08-20 10:57:53'),
	(37, 42, 1, 5, 4, 32.00, 1, 2, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:20:36', '2021-08-20 11:20:36'),
	(38, 42, 1, 1, 4, 33.00, 1, 3, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:20:36', '2021-08-20 11:20:36'),
	(39, 42, 1, 5, 4, 32.00, 1, 4, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:22:06', '2021-08-20 11:22:06'),
	(40, 42, 1, 1, 4, 33.00, 1, 5, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:22:06', '2021-08-20 11:22:06'),
	(41, 42, 1, 5, NULL, 32.00, 1, 6, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:28:39', '2021-08-20 11:28:39'),
	(42, 42, 1, 1, NULL, 33.00, 1, 7, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:28:39', '2021-08-20 11:28:39'),
	(43, 42, 1, 5, NULL, 32.00, 1, 8, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:43:26', '2021-08-20 11:43:26'),
	(44, 42, 1, 1, NULL, 33.00, 1, 9, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:43:26', '2021-08-20 11:43:26'),
	(45, 42, 1, 5, NULL, 32.00, 1, 10, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:48:06', '2021-08-20 11:48:06'),
	(46, 42, 1, 1, NULL, 33.00, 1, 11, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:48:06', '2021-08-20 11:48:06'),
	(47, 42, 1, 2, NULL, 44.00, 1, 12, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:48:06', '2021-08-20 11:48:06'),
	(48, 42, 1, 5, NULL, 32.00, 1, 13, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:59:29', '2021-08-20 11:59:29'),
	(49, 42, 1, 1, NULL, 33.00, 1, 14, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 11:59:29', '2021-08-20 11:59:29'),
	(50, 42, 1, 5, 3, 32.00, 1, 15, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 12:15:37', '2021-08-20 12:15:37'),
	(51, 42, 1, 1, NULL, 33.00, 1, 16, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 12:15:37', '2021-08-20 12:15:37'),
	(52, 42, 1, 5, NULL, 32.00, 1, 17, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 12:17:38', '2021-08-20 12:17:38'),
	(53, 33, 1, 5, NULL, 32.00, 1, 18, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 14:19:02', '2021-08-20 14:19:02'),
	(54, 33, 1, 1, NULL, 33.00, 1, 19, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 14:19:02', '2021-08-20 14:19:02'),
	(55, 33, 1, 5, NULL, 32.00, 1, 20, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 14:20:23', '2021-08-20 14:20:23'),
	(56, 33, 1, 1, NULL, 33.00, 1, 21, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-08-20 14:20:23', '2021-08-20 14:20:23'),
	(57, 13, 1, 5, 4, 32.00, 1, 1, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-09-22 11:33:28', '2021-09-22 11:33:28'),
	(58, 33, 1, 1, 3, 33.00, 1, 1, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-07 16:26:36', '2021-10-07 16:26:36'),
	(59, 33, 1, 2, NULL, 44.00, 1, 2, 44.00, 0.00, 44.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-07 16:26:36', '2021-10-07 16:26:36'),
	(60, 1, 1, 1, 3, 33.00, 1, 1, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 14:19:37', '2021-10-27 14:19:37'),
	(61, 1, 1, 3, 3, 150.00, 1, 2, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 14:19:37', '2021-10-27 14:19:37'),
	(62, 45, 1, 7, 7, 70.00, 1, 3, 70.00, 0.00, 71.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-10-27 14:49:42', '2021-10-27 14:49:42'),
	(63, 45, 1, 3, 7, 150.00, 1, 4, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-10-27 14:49:42', '2021-10-27 14:49:42'),
	(64, 46, 1, 4, 7, 323.00, 1, 5, 323.00, 0.00, 323.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 14:52:27', '2021-10-27 14:52:27'),
	(65, 46, 1, 5, NULL, 32.00, 1, 6, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 14:52:27', '2021-10-27 14:52:27'),
	(66, 45, 1, 2, NULL, 44.00, 1, 7, 44.00, 0.00, 44.00, '', 'aceptado', 'transferencia', 1, NULL, '2021-10-27 14:54:56', '2021-10-27 14:54:56'),
	(67, 45, 1, 1, NULL, 33.00, 1, 8, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 15:03:54', '2021-10-27 15:03:54'),
	(68, 46, 1, 3, 7, 150.00, 1, 9, 150.00, 0.00, 150.00, '', 'aceptado', 'tarjeta', 1, NULL, '2021-10-27 15:06:44', '2021-10-27 15:06:44'),
	(69, 45, 1, 7, NULL, 70.00, 1, 10, 70.00, 0.00, 70.00, '', 'anulado', 'transferencia', 0, NULL, '2021-10-27 15:08:59', '2021-10-27 15:20:05'),
	(70, 45, 2, 8, 7, 70.00, 1, 11, 70.00, 0.00, 70.00, '', 'anulado', 'tarjeta', 1, NULL, '2021-10-27 15:22:36', '2021-10-27 15:27:09'),
	(71, 45, 2, 3, 7, 150.00, 1, 12, 150.00, 0.00, 150.00, '', 'aceptado', 'transferencia', 0, NULL, '2021-10-27 15:28:58', '2021-10-27 15:28:58'),
	(72, 45, 2, 5, 7, 32.00, 1, 13, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 15:29:58', '2021-10-27 15:29:58'),
	(73, 45, 1, 3, 7, 150.00, 1, 14, 150.00, 0.00, 150.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 16:28:41', '2021-10-27 16:28:41'),
	(74, 45, 1, 7, 7, 70.00, 1, 15, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 16:33:11', '2021-10-27 16:33:11'),
	(75, 45, 1, 8, 7, 70.00, 1, 16, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-27 16:44:09', '2021-10-27 16:44:09'),
	(76, 45, 1, 8, 7, 70.00, 1, 17, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 1, NULL, '2021-10-27 17:23:06', '2021-10-27 17:23:06'),
	(77, 45, 1, 5, NULL, 32.00, 1, 1, 32.00, 0.00, 32.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-10-29 09:39:24', '2021-10-29 09:39:24'),
	(78, 43, 1, 8, 7, 70.00, 1, 1, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-01-13 12:33:55', '2022-01-13 12:33:55'),
	(79, 43, 1, 1, 7, 33.00, 1, 2, 33.00, 0.00, 33.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-01-13 12:33:55', '2022-01-13 12:33:55'),
	(80, 43, 1, 8, NULL, 70.00, 1, 3, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-01-13 14:35:35', '2022-01-13 14:35:35'),
	(81, 43, 1, 8, NULL, 70.00, 1, 4, 70.00, 0.00, 70.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-01-13 14:39:37', '2022-01-13 14:39:37');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
