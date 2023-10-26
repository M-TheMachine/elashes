-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla elashes.categorias
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.categorias: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(16, 'Pestañas', NULL, 'img/Categoria/2-053422-6.jpeg', NULL, NULL, '2022-03-16 16:45:23', '2022-03-16 17:34:22'),
	(17, 'Cejas', NULL, 'img/Categoria/1-053708-1.jpeg', NULL, NULL, '2022-03-16 17:37:08', '2022-03-16 17:37:08');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.clientes: ~49 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `ci`, `observaciones`, `celular`, `email`, `fecha_nacimiento`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'cliente1', '2222', NULL, '5555', NULL, '1994-06-07', NULL, '2021-05-16 18:06:45', '2021-05-16 18:06:45'),
	(2, 'cliente2', '23423', NULL, '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:41', '2021-05-16 18:07:41'),
	(3, 'cliente2', '23423', NULL, '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(4, 'cccc233', '344', NULL, '34534', NULL, '2021-05-06', NULL, '2021-05-16 18:44:18', '2021-05-16 18:44:18'),
	(5, 'nada32', '3423', NULL, '5555', NULL, '2021-04-29', NULL, '2021-05-16 18:45:09', '2021-05-16 18:45:09'),
	(6, 'cliente1', '2222', NULL, '5555', NULL, '1994-06-07', NULL, '2021-05-16 18:06:45', '2021-05-16 18:06:45'),
	(7, 'cccc233', '344', NULL, '34534', NULL, '2021-05-06', NULL, '2021-05-16 18:44:18', '2021-05-16 18:44:18'),
	(8, 'cliente2', '23423', NULL, '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(9, 'cliente2', '23423', NULL, '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:41', '2021-05-16 18:07:41'),
	(10, 'cliente2', '23423', NULL, '34534', NULL, '2021-04-28', NULL, '2021-05-16 18:07:56', '2021-05-16 18:07:56'),
	(11, 'este es nuevo1', '23423', NULL, '4324323', NULL, '2021-05-29', NULL, '2021-05-16 20:20:32', '2021-05-17 00:46:42'),
	(12, 'aaaaaa', '23', NULL, '32', NULL, '2021-04-28', NULL, '2021-05-17 00:47:04', '2021-05-17 00:47:04'),
	(13, 'rene', '23423', NULL, '3242343', NULL, NULL, NULL, '2021-05-17 17:01:15', '2021-05-17 17:01:15'),
	(14, 'a1', 'ci1', NULL, 'cel1', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(15, 'a2', 'ci2', NULL, 'cel2', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(16, 'a3', 'ci3', NULL, 'cel3', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(17, 'a4', 'ci4', NULL, 'cel4', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(18, 'a5', 'ci5', NULL, 'cel5', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(19, 'a6', 'ci6', NULL, 'cel6', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(20, 'a7', 'ci7', NULL, 'cel7', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(21, 'a8', 'ci8', NULL, 'cel8', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(22, 'a9', 'ci9', NULL, 'cel9', NULL, NULL, NULL, '2021-05-29 16:34:41', '2021-05-29 16:34:41'),
	(23, 'nombre1', 'ci1', NULL, 'cel1', NULL, '1991-12-12', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(24, 'a2', 'ci2', NULL, 'cel2', NULL, '1991-12-13', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(25, 'a3', 'ci3', NULL, 'cel3', NULL, '1991-12-14', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(26, 'a4', 'ci4', NULL, 'cel4', NULL, '1991-12-15', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(27, 'a5', 'ci5', NULL, 'cel5', NULL, '1991-12-16', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(28, 'a6', 'ci6', NULL, 'cel6', NULL, '1991-12-17', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(29, 'a7', 'ci7', NULL, 'cel7', NULL, '1991-12-18', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(30, 'a8', 'ci8', NULL, 'cel8', NULL, '1991-12-19', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(31, 'a9', 'ci9', NULL, 'cel9', NULL, '1991-12-20', NULL, '2021-05-29 18:01:13', '2021-05-29 18:01:13'),
	(32, '123cli763', '12333', NULL, '61784422', 'cliente1@cliente1.com', '2021-06-26', NULL, '2021-06-06 21:36:21', '2021-06-14 00:58:30'),
	(33, 'siamon223', '44343', NULL, '3434', NULL, NULL, NULL, '2021-06-14 01:04:31', '2021-06-14 01:04:31'),
	(34, '3333333333', '333333333', NULL, '55555', NULL, NULL, NULL, '2021-06-14 01:04:47', '2021-06-14 01:04:47'),
	(35, 'f3333', '34', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:06:37', '2021-06-14 01:06:37'),
	(36, 'f55555', 'f5555', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:07:25', '2021-06-14 01:07:25'),
	(37, '65656', '565656', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:10:28', '2021-06-14 01:10:28'),
	(38, '999', '999', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:10:38', '2021-06-14 01:10:38'),
	(39, '655666', '565656', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:11:00', '2021-06-14 01:11:00'),
	(40, '9996', '96456', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:11:53', '2021-06-14 01:11:53'),
	(41, 's222244', '555', NULL, NULL, NULL, NULL, NULL, '2021-06-14 01:12:25', '2021-06-14 10:49:30'),
	(42, 'Timoteo', '589644', NULL, '5677875465', NULL, NULL, NULL, '2021-08-20 10:56:35', '2021-08-20 10:56:35'),
	(43, 'siamon', '555', 'Solo la atiende Silvia', '44545', 'abc@gmail.com', '2021-10-08', NULL, '2021-10-07 12:55:48', '2022-03-18 17:35:04'),
	(44, 'newsiamon', '76565', NULL, '34444', 'racsoscaree0007@gmail.com', '2021-10-07', NULL, '2021-10-07 12:57:44', '2021-10-07 12:57:44'),
	(45, 'Ana Delgado Lopez', '8798545', NULL, '77478775', 'ana@gmail.com', '2021-10-27', NULL, '2021-10-27 14:26:26', '2021-10-27 14:26:26'),
	(46, 'Mar Cruz', '1234556', 'Especial', '5677875465', 'mar@gmail.com', '2021-10-27', NULL, '2021-10-27 14:52:04', '2022-03-18 17:33:45'),
	(47, 'Carla Gomez', '123456', NULL, '7487545', 'racso@racso.com', '2000-08-22', NULL, '2021-10-28 10:10:48', '2022-03-10 17:22:28'),
	(48, 'Esther', '123456', 'Alergica al tinte de pestañas', '7487545', 'racso@racso.com', '2000-06-28', NULL, '2022-03-10 17:58:51', '2022-03-21 11:24:24'),
	(49, 'Lucia', '3453453', NULL, '132434', 'lucia@gmail.com', '2022-03-10', NULL, '2022-03-18 17:37:46', '2022-03-18 17:37:46'),
	(50, 'cliente facturado', '345435', NULL, '78756785', NULL, '1980-03-17', NULL, '2022-03-22 10:54:04', '2022-03-22 10:54:04');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.failed_jobs
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

-- Volcando datos para la tabla elashes.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.migrations: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_11_000000_create_sucursals_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2021_05_16_033805_create_categorias_table', 1),
	(6, '2021_05_16_033822_create_servicios_table', 1),
	(7, '2021_05_16_033847_create_clientes_table', 1),
	(11, '2021_06_02_151303_sucursal_user', 3),
	(12, '2021_06_14_151611_create_recordatorios_table', 4),
	(14, '2021_05_16_033907_create_tecnicas_table', 5),
	(15, '2021_05_16_033908_create_ventas_table', 5),
	(16, '2021_07_07_101614_create_recordatorio_ventas_table', 5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.recordatorios
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.recordatorios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `recordatorios` DISABLE KEYS */;
INSERT INTO `recordatorios` (`id`, `servicio_id`, `nombre`, `dias`, `mensaje`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 20, 'Recordatorio 1', 0, 'E-lashes quiere recordarle que..', NULL, '2022-03-22 10:49:43', '2022-03-22 15:44:51');
/*!40000 ALTER TABLE `recordatorios` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.recordatorio_ventas
CREATE TABLE IF NOT EXISTS `recordatorio_ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recordatorio_id` bigint(20) unsigned NOT NULL,
  `venta_id` bigint(20) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `recordado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recordatorio_ventas_recordatorio_id_foreign` (`recordatorio_id`),
  KEY `recordatorio_ventas_venta_id_foreign` (`venta_id`),
  CONSTRAINT `recordatorio_ventas_recordatorio_id_foreign` FOREIGN KEY (`recordatorio_id`) REFERENCES `recordatorios` (`id`),
  CONSTRAINT `recordatorio_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.recordatorio_ventas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `recordatorio_ventas` DISABLE KEYS */;
INSERT INTO `recordatorio_ventas` (`id`, `recordatorio_id`, `venta_id`, `fecha`, `recordado`, `created_at`, `updated_at`) VALUES
	(1, 1, 19, '2022-03-22', 0, NULL, '2022-03-22 15:51:21');
/*!40000 ALTER TABLE `recordatorio_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `comision` double(8,2) NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promocion` tinyint(1) DEFAULT '0',
  `extra` tinyint(1) DEFAULT '0',
  `estado` enum('habilitado','deshabilitado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicios_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `servicios_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.servicios: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `imagen`, `precio`, `comision`, `codigo`, `promocion`, `extra`, `estado`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(14, 'Extensiones de pestañas con Nano Fibra', NULL, 'img/Servicio/4-044851-1.jpeg', 100.00, 20.00, 'null', 0, 0, 'habilitado', 16, NULL, '2022-03-16 16:48:51', '2022-03-16 17:03:58'),
	(15, 'Lifting de  pestañas naturales', NULL, 'img/Servicio/8-045332-5.jpeg', 70.00, 15.00, 'null', 0, 0, 'habilitado', 16, NULL, '2022-03-16 16:53:33', '2022-03-16 17:11:29'),
	(16, '123456', NULL, 'img/Servicio/5-050627-4.jpg', 70.00, 15.00, 'null', 1, 0, 'habilitado', 16, NULL, '2022-03-16 17:06:28', '2022-03-16 17:06:42'),
	(17, 'Extensiones con nano fibra', NULL, 'img/Servicio/6-031233-9.jpeg', 100.00, 20.00, NULL, 0, 0, 'habilitado', 16, NULL, '2022-03-17 15:12:33', '2022-03-17 15:12:33'),
	(18, 'laminado', NULL, 'img/Servicio/9-033908-10.jpeg', 80.00, 15.00, NULL, 0, 0, 'habilitado', 17, NULL, '2022-03-18 15:39:08', '2022-03-18 15:39:08'),
	(19, 'Henna', NULL, 'img/Servicio/2-033930-9.jpeg', 70.00, 20.00, NULL, 0, 0, 'habilitado', 17, NULL, '2022-03-18 15:39:30', '2022-03-18 15:39:30'),
	(20, 'Californiana Colores', NULL, 'img/Servicio/2-035421-7.jpeg', 30.00, 10.00, NULL, 0, 1, 'habilitado', 16, NULL, '2022-03-18 15:54:22', '2022-03-18 15:54:22');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.sucursals
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

-- Volcando datos para la tabla elashes.sucursals: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursals` DISABLE KEYS */;
INSERT INTO `sucursals` (`id`, `direccion`, `telefono`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 's1', NULL, 's12111', NULL, NULL, '2021-05-17 11:36:25'),
	(2, 'Calle España #342', '12345678', '123', NULL, '2021-05-17 11:35:09', '2021-10-27 15:15:12'),
	(3, 'ddd', '312', 'sss4', NULL, '2021-05-17 17:15:04', '2021-06-14 11:22:22');
/*!40000 ALTER TABLE `sucursals` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.sucursal_user
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.sucursal_user: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal_user` DISABLE KEYS */;
INSERT INTO `sucursal_user` (`id`, `user_id`, `sucursal_id`, `created_at`, `updated_at`) VALUES
	(7, 3, 1, NULL, NULL),
	(8, 1, 1, NULL, NULL),
	(10, 4, 1, NULL, NULL),
	(26, 6, 1, NULL, NULL),
	(27, 6, 2, NULL, NULL),
	(28, 7, 1, NULL, NULL),
	(55, 9, 1, NULL, NULL),
	(56, 10, 1, NULL, NULL),
	(57, 11, 1, NULL, NULL),
	(58, 2, 1, NULL, NULL),
	(59, 8, 1, NULL, NULL),
	(60, 5, 1, NULL, NULL);
/*!40000 ALTER TABLE `sucursal_user` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.tecnicas
CREATE TABLE IF NOT EXISTS `tecnicas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tecnicas_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `tecnicas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.tecnicas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tecnicas` DISABLE KEYS */;
INSERT INTO `tecnicas` (`id`, `nombre`, `descripcion`, `deleted_at`, `categoria_id`, `created_at`, `updated_at`) VALUES
	(1, 'asdasd', NULL, NULL, 16, '2022-03-18 12:18:32', '2022-03-18 12:18:32'),
	(2, 'ojo de gato', 'rizado de extension de pestañas', NULL, 16, '2022-03-18 12:32:53', '2022-03-21 12:12:44'),
	(3, 'brow lamination', 'Es una nueva técnica de belleza semipermanente que alisa y fija las cejas.', NULL, 17, '2022-03-18 15:41:46', '2022-03-18 15:41:46'),
	(4, 'brow mapping', 'Es una técnica a través de la cual, tras estudiar y medir las facciones de la cliente, se encuentra el diseño de cejas ideal y acorde con su rostro.', NULL, 17, '2022-03-18 15:42:30', '2022-03-21 12:27:10'),
	(5, 'Lifting de  pestañas naturales', 'asdada', '2022-03-21 12:29:49', 16, '2022-03-21 12:13:12', '2022-03-21 12:29:49'),
	(6, 'adsad', 'dasdasda', '2022-03-21 12:30:03', 17, '2022-03-21 12:14:38', '2022-03-21 12:30:03'),
	(7, 'dasdsadas', 'dasdasdsda', '2022-03-21 12:30:13', 16, '2022-03-21 12:14:54', '2022-03-21 12:30:13');
/*!40000 ALTER TABLE `tecnicas` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.users
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.users: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nombre`, `celular`, `ci`, `fecha_nacimiento`, `username`, `email`, `email_verified_at`, `password`, `codigo`, `rol`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'root', NULL, NULL, NULL, 'root', 'root@root.com', NULL, '$2y$10$IlK7TBcefnjOrjvheCliOO8OB07JrS6UMCEauLRJlEjnZQhXP7Pi6', '000', 'root', NULL, NULL, '2021-05-16 01:48:31', '2021-06-02 16:12:41'),
	(2, 'osss123111', '44545', '555', '2021-04-27', 'racso', 'racso@racso.com', NULL, '$2y$10$JDxF/UWJ39jGMv.08.SGLOyk1g9rqKjB3UxQbPKxcvP4IxWlCFuPC', '12345', 'admin', NULL, NULL, '2021-05-17 13:58:35', '2022-03-15 15:11:17'),
	(3, 'ffff', '32423', '2324', '2021-06-24', 'newuse', 'info@ffff.com', NULL, '$2y$10$qQ9RKjbJZQddP6ytsTF0kODw0N4eqXvE5GA7eZpfeXci4XGGaedxW', NULL, 'operador', NULL, NULL, '2021-06-02 16:10:44', '2021-06-02 16:10:44'),
	(4, 'ccc22222', '34343', '7777', '2021-06-15', 'operador', 'op@op.com', NULL, '$2y$10$JOpFhTmRnUtHM84NpCoFlOqDJBTV9mw7ZncRhI/1Ov61fBdHjeaB2', '111', 'secretario', NULL, NULL, '2021-06-02 16:14:20', '2021-06-07 14:47:14'),
	(5, 'supervisor123', '434534534', '1233555', '2021-07-09', '543545', 'supervisor@supervisor.com', NULL, '$2y$10$dkDtxJ7dqGNLTPR9dSMiXet3i8Tg20Jxv490l4rK56AJwFF3rht/m', '3333333', 'supervisor', NULL, NULL, '2021-07-08 11:21:11', '2022-03-18 17:44:16'),
	(6, 'Maria Villa', '77478775', '12345678', '2021-10-27', 'maria21', 'maria@gmail.com', NULL, '$2y$10$sAACyFi1b/lKuPfkYGGbl.0J3UlD0JCCwXTwtcZ65lHre0E2Nd1/m', '0000', 'supervisor', NULL, NULL, '2021-10-27 14:38:15', '2021-10-27 14:38:15'),
	(7, 'Alejandra Martínez', '77478775', '987654321', '2021-10-04', '12345678', 'ale@gmail.com', NULL, '$2y$10$QFIRkI8dm9AlyYDorOHfRunwOFb1NqVDjG4HBqzb5Sclt7bFsOiE.', '0000', 'operador', NULL, NULL, '2021-10-27 14:41:07', '2021-10-27 14:41:07'),
	(8, 'Luz Rosario', '5677875465', '12345678', '2021-10-27', 'luz123', 'secretaria@gmail.com', NULL, '$2y$10$i0xrexhjirNFvQtVTnuZkORVYud6/argcoKD47CnUIEwHeDDebF9y', '2222', 'secretario', NULL, NULL, '2021-10-27 15:45:32', '2022-03-18 17:22:12'),
	(9, 'user de prueba', '67656756', '2341234', '1995-02-24', 'kuki', 'asdas@gmail.com', NULL, '$2y$10$VRW8iC38s6IlKppJV0YwAOa0EwHQWUBGIODQRMrFwRgaHIgxtrjuu', '1111111', 'supervisor', NULL, NULL, '2022-03-11 16:13:31', '2022-03-11 16:15:57'),
	(10, 'Esther', '7487545', '123456', '1997-12-05', 'Esther', 'esthmurmerez@gmail.com', NULL, '$2y$10$rGAUGP9HGS2/I8lDh.rDo.L50K5gI9fwEy3a2kl3MkRWLI8Zy0fqe', '1111111', 'admin', NULL, NULL, '2022-03-14 17:02:55', '2022-03-14 17:02:55'),
	(11, 'pruebaSupervisor', '7487545', '1234', '2022-03-24', 'prueba', 'prueba@gmail.com', NULL, '$2y$10$fvsovAV2GzSR5nUDU9wnaeCQlfvoG3J353QfR/1EcDcetreBUE1CK', '234', 'supervisor', NULL, NULL, '2022-03-14 23:39:59', '2022-03-14 23:39:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla elashes.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint(20) unsigned NOT NULL,
  `sucursal_id` bigint(20) unsigned NOT NULL,
  `servicio_id` bigint(20) unsigned NOT NULL,
  `tecnica_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ficha` int(11) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `descuento` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `comision` double(8,2) DEFAULT NULL,
  `caja` double(8,2) DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('aceptado','anulado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago` enum('efectivo','tarjeta','transferencia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `facturado` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_cliente_id_foreign` (`cliente_id`),
  KEY `ventas_sucursal_id_foreign` (`sucursal_id`),
  KEY `ventas_servicio_id_foreign` (`servicio_id`),
  KEY `ventas_tecnica_id_foreign` (`tecnica_id`),
  KEY `ventas_user_id_foreign` (`user_id`),
  CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `ventas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  CONSTRAINT `ventas_tecnica_id_foreign` FOREIGN KEY (`tecnica_id`) REFERENCES `tecnicas` (`id`),
  CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elashes.ventas: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `cliente_id`, `sucursal_id`, `servicio_id`, `tecnica_id`, `user_id`, `precio`, `cantidad`, `ficha`, `subtotal`, `descuento`, `total`, `comision`, `caja`, `descripcion`, `estado`, `pago`, `facturado`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 43, 1, 14, 2, 7, 100.00, 1, 1, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-18 15:07:10', '2022-03-18 15:07:10'),
	(2, 43, 1, 14, 2, 3, 100.00, 1, 2, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-18 15:07:49', '2022-03-18 15:22:29'),
	(3, 43, 1, 17, 1, NULL, 100.00, 1, 3, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-18 15:07:49', '2022-03-18 15:22:07'),
	(4, 11, 1, 19, 3, 7, 70.00, 1, 4, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-18 17:27:07', '2022-03-18 17:27:07'),
	(5, 41, 1, 18, 3, NULL, 80.00, 1, 1, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 10:50:59', '2022-03-21 10:50:59'),
	(6, 41, 1, 18, 3, NULL, 80.00, 1, 2, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 11:03:41', '2022-03-21 11:03:41'),
	(7, 13, 1, 18, 3, NULL, 80.00, 1, 3, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 11:03:48', '2022-03-21 11:03:48'),
	(8, 13, 1, 18, 3, NULL, 80.00, 1, 4, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 11:04:01', '2022-03-21 11:04:01'),
	(9, 13, 1, 18, 3, 7, 80.00, 1, 5, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'anulado', 'efectivo', 0, NULL, '2022-03-21 11:05:08', '2022-03-21 11:06:20'),
	(10, 13, 1, 19, NULL, NULL, 70.00, 1, 6, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'anulado', 'efectivo', 0, NULL, '2022-03-21 11:05:08', '2022-03-21 11:06:20'),
	(11, 13, 1, 14, NULL, 7, 100.00, 1, 7, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'anulado', 'efectivo', 0, NULL, '2022-03-21 11:05:08', '2022-03-21 11:06:20'),
	(12, 46, 1, 19, 3, NULL, 70.00, 1, 8, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 15:03:48', '2022-03-21 15:03:48'),
	(13, 46, 1, 14, 2, NULL, 100.00, 1, 9, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-21 15:03:49', '2022-03-21 15:03:49'),
	(14, 48, 1, 18, 4, NULL, 80.00, 1, 1, 80.00, 0.00, 80.00, 15.00, 65.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:13:10', '2022-03-22 10:13:10'),
	(15, 46, 1, 14, 2, 7, 100.00, 1, 2, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:17:10', '2022-03-22 10:17:10'),
	(16, 46, 1, 17, NULL, 7, 100.00, 1, 3, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:17:10', '2022-03-22 10:17:10'),
	(17, 46, 1, 19, 3, NULL, 70.00, 1, 4, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:25:47', '2022-03-22 10:25:47'),
	(18, 43, 1, 15, 2, NULL, 70.00, 1, 5, 70.00, 0.00, 70.00, 15.00, 55.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:35:58', '2022-03-22 10:35:58'),
	(19, 13, 1, 20, 2, NULL, 30.00, 1, 6, 30.00, 0.00, 30.00, 10.00, 20.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 10:51:30', '2022-03-22 10:51:30'),
	(20, 50, 1, 15, 2, 7, 70.00, 1, 7, 70.00, 0.00, 70.00, 15.00, 55.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-22 10:54:19', '2022-03-22 15:38:46'),
	(21, 50, 1, 14, NULL, 7, 100.00, 1, 8, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-22 10:54:19', '2022-03-22 15:38:46'),
	(22, 50, 1, 19, 3, 7, 70.00, 1, 9, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-22 10:54:19', '2022-03-22 16:27:21'),
	(23, 50, 1, 14, NULL, NULL, 100.00, 1, 10, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'anulado', 'efectivo', 0, NULL, '2022-03-22 11:06:43', '2022-03-22 16:27:21'),
	(24, 50, 1, 14, NULL, 7, 100.00, 1, 11, 100.00, 0.00, 100.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-22 11:07:29', '2022-03-22 15:38:46'),
	(25, 50, 1, 19, 4, 7, 70.00, 1, 12, 70.00, 0.00, 70.00, 20.00, 50.00, '', 'aceptado', 'efectivo', 1, NULL, '2022-03-22 15:21:02', '2022-03-22 16:27:21'),
	(26, 50, 1, 15, 2, 7, 70.00, 1, 13, 70.00, 0.00, 70.00, 15.00, 55.00, '', 'anulado', 'efectivo', 1, NULL, '2022-03-22 15:21:02', '2022-03-22 16:27:21'),
	(27, 43, 1, 14, 2, NULL, 100.00, 1, 14, 100.00, 10.00, 90.00, 20.00, 80.00, '', 'aceptado', 'efectivo', 0, NULL, '2022-03-22 16:54:52', '2022-03-22 16:54:52');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
