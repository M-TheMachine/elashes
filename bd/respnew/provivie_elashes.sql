-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-03-2022 a las 08:09:56
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `provivie_elashes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pestañas', NULL, 'img/Categoria/8-050800-8.jpg', NULL, NULL, '2021-12-02 00:08:00', '2021-12-02 00:08:00'),
(2, 'Extensiones Superiores', NULL, 'img/Categoria/4-050855-7.jpg', 1, NULL, '2021-12-02 00:08:55', '2021-12-02 22:23:21'),
(3, 'Seda sintética', NULL, 'img/Categoria/9-050929-9.jpg', 2, NULL, '2021-12-02 00:09:29', '2021-12-02 00:09:29'),
(4, 'Curva B', NULL, 'img/Categoria/8-051000-6.jpg', 3, NULL, '2021-12-02 00:10:00', '2021-12-02 00:10:00'),
(5, 'Curva D', NULL, 'img/Categoria/6-053418-1.jpg', 3, NULL, '2021-12-02 00:34:18', '2021-12-02 00:34:18'),
(6, 'Curva L', NULL, 'img/Categoria/7-055924-3.jpg', 3, NULL, '2021-12-02 00:59:24', '2021-12-02 00:59:24'),
(7, 'Extra largas', NULL, 'img/Categoria/4-060043-8.jpg', 3, NULL, '2021-12-02 01:00:43', '2021-12-02 01:00:43'),
(8, 'Ultra finas', NULL, 'img/Categoria/3-024442-6.jpg', 3, NULL, '2021-12-02 21:44:42', '2021-12-02 21:44:42'),
(9, 'Fibra Semi-tupida', NULL, 'img/Categoria/1-030047-8.jpg', 2, NULL, '2021-12-02 22:00:47', '2021-12-02 22:00:47'),
(10, 'Fit lashes', NULL, 'img/Categoria/2-030601-3.jpg', 2, NULL, '2021-12-02 22:06:01', '2021-12-02 22:06:01'),
(11, 'Fibra Nano', NULL, 'img/Categoria/10-031126-8.jpg', 2, NULL, '2021-12-02 22:11:26', '2021-12-02 22:11:26'),
(12, 'Fibra Natural', NULL, 'img/Categoria/1-031901-1.jpg', 2, NULL, '2021-12-02 22:19:01', '2021-12-02 22:19:01'),
(13, 'Extensiones Inferiores', NULL, 'img/Categoria/9-032208-9.jpg', 1, NULL, '2021-12-02 22:22:08', '2021-12-02 22:23:38'),
(14, 'Seda sintética', NULL, 'img/Categoria/6-032423-0.jpg', 13, NULL, '2021-12-02 22:24:23', '2021-12-02 22:24:23'),
(15, 'Curva B', NULL, 'img/Categoria/7-032457-7.jpg', 14, NULL, '2021-12-02 22:24:57', '2021-12-02 22:24:57'),
(16, 'Curva D', NULL, 'img/Categoria/9-033431-5.jpg', 14, NULL, '2021-12-02 22:34:31', '2021-12-02 22:34:31'),
(18, 'Curva L', NULL, 'img/Categoria/3-035035-9.jpg', 14, NULL, '2021-12-02 22:50:35', '2021-12-02 22:50:35'),
(19, 'Extra largas', NULL, 'img/Categoria/5-035315-4.jpg', 14, NULL, '2021-12-02 22:53:15', '2021-12-02 22:53:15'),
(20, 'Ultra finas', NULL, 'img/Categoria/5-035908-4.jpg', 14, NULL, '2021-12-02 22:59:08', '2021-12-02 22:59:08'),
(21, 'Fibra Semi-tupida', NULL, 'img/Categoria/5-040635-5.jpg', 13, NULL, '2021-12-02 23:06:35', '2021-12-02 23:06:35'),
(22, 'Fit lashes', NULL, 'img/Categoria/9-041103-3.jpg', 13, NULL, '2021-12-02 23:11:03', '2021-12-02 23:11:03'),
(23, 'Fibra Nano', NULL, 'img/Categoria/2-042029-10.jpg', 13, NULL, '2021-12-02 23:20:29', '2021-12-02 23:20:29'),
(24, 'Fibra Natural', NULL, 'img/Categoria/1-042324-1.jpg', 13, NULL, '2021-12-02 23:23:24', '2021-12-02 23:23:24'),
(25, 'Tinte', NULL, 'img/Categoria/9-042906-4.jpg', 1, NULL, '2021-12-02 23:29:06', '2021-12-02 23:29:06'),
(26, 'Cejas', NULL, 'img/Categoria/4-043245-1.jpeg', NULL, NULL, '2021-12-02 23:32:45', '2021-12-02 23:32:45'),
(27, 'Depilaciones', NULL, 'img/Categoria/10-043945-6.jpeg', 26, NULL, '2021-12-02 23:39:45', '2021-12-02 23:39:45'),
(28, 'Hilo', NULL, 'img/Categoria/8-044015-1.jpeg', 27, NULL, '2021-12-02 23:40:15', '2021-12-02 23:40:15'),
(29, 'Pintado', NULL, 'img/Categoria/9-044324-9.jpeg', 26, NULL, '2021-12-02 23:43:24', '2021-12-02 23:43:24'),
(30, 'Henna', NULL, 'img/Categoria/8-044345-8.jpeg', 29, NULL, '2021-12-02 23:43:45', '2021-12-02 23:44:58'),
(31, 'Laminado', NULL, 'img/Categoria/1-044850-1.jpeg', 26, NULL, '2021-12-02 23:48:50', '2021-12-02 23:48:50'),
(32, 'Tinte', NULL, 'img/Categoria/10-044922-10.jpeg', 26, NULL, '2021-12-02 23:49:22', '2021-12-02 23:49:22'),
(33, 'Rostro', NULL, 'img/Categoria/5-045230-6.jpeg', NULL, NULL, '2021-12-02 23:52:30', '2021-12-02 23:52:30'),
(34, 'Depilaciones', NULL, 'img/Categoria/6-045338-7.jpeg', 33, NULL, '2021-12-02 23:53:38', '2021-12-02 23:53:38'),
(35, 'Cera', NULL, 'img/Categoria/10-045408-0.jpeg', 34, NULL, '2021-12-02 23:54:08', '2021-12-02 23:54:47'),
(36, 'Hilo', NULL, 'img/Categoria/1-045741-1.jpeg', 34, NULL, '2021-12-02 23:57:41', '2021-12-02 23:57:41'),
(37, 'Limpieza', NULL, 'img/Categoria/7-050303-8.jpeg', 33, NULL, '2021-12-03 00:03:03', '2021-12-03 00:03:03'),
(38, 'Básica', NULL, 'img/Categoria/0-050404-1.jpeg', 37, NULL, '2021-12-03 00:04:04', '2021-12-03 00:04:39'),
(39, 'Profunda', NULL, 'img/Categoria/1-050747-7.jpeg', 37, NULL, '2021-12-03 00:07:47', '2021-12-03 00:07:47'),
(40, 'Cuerpo', NULL, 'img/Categoria/7-051137-2.jpeg', NULL, NULL, '2021-12-03 00:11:37', '2021-12-03 00:11:37'),
(41, 'Depilaciones', NULL, 'img/Categoria/8-051208-0.jpeg', 40, NULL, '2021-12-03 00:12:08', '2021-12-03 00:12:08'),
(42, 'Cera', NULL, 'img/Categoria/10-051239-5.jpeg', 41, NULL, '2021-12-03 00:12:39', '2021-12-03 00:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `ci`, `celular`, `email`, `fecha_nacimiento`, `deleted_at`, `created_at`, `updated_at`) VALUES
(33, 'Maria Cecilia', '9776654', '76545677', NULL, '1987-02-22', NULL, '2021-06-08 22:10:47', '2021-06-22 23:35:55'),
(34, 'Noelia Cartagena', '77987', '222282', NULL, '2021-05-19', NULL, '2021-06-08 22:52:59', '2021-06-22 23:36:35'),
(35, 'Liliana Heredia', '123456789', '12345687', NULL, '2021-06-18', NULL, '2021-06-08 22:55:20', '2021-06-08 22:55:20'),
(36, 'Valeria Fuentes', '645124512', '7597421', NULL, NULL, NULL, '2021-06-22 23:36:15', '2021-06-22 23:36:15'),
(37, 'Carla Ortiz', '345676', '776567', 'dfgdfgdf@ghffg.com', '2021-10-22', NULL, '2021-10-06 01:49:07', '2021-10-06 01:49:07'),
(38, 'Rene Carlos Gumiel Cerezo', '656565', '75757575', 'bitproject.online@gmail.com', NULL, NULL, '2021-10-07 17:47:36', '2021-10-07 17:47:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

CREATE TABLE `recordatorios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dias` int(11) NOT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recordatorios`
--

INSERT INTO `recordatorios` (`id`, `servicio_id`, `nombre`, `dias`, `mensaje`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 183, 'Cita para la Depilaciones con cera cuerpo completo', -1, 'Cita para la Depilaciones con cera cuerpo completo', NULL, '2021-12-14 00:18:01', '2021-12-14 00:35:50'),
(2, 133, 'Recordatorio 1', 0, 'E-lashes quiere recordarle que...', NULL, '2021-12-15 23:23:30', '2021-12-15 23:33:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio_ventas`
--

CREATE TABLE `recordatorio_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recordatorio_id` bigint(20) UNSIGNED NOT NULL,
  `venta_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `recordado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recordatorio_ventas`
--

INSERT INTO `recordatorio_ventas` (`id`, `recordatorio_id`, `venta_id`, `fecha`, `recordado`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2021-12-13', 1, NULL, '2021-12-15 23:47:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `comision` double(8,2) DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promocion` tinyint(1) DEFAULT '0',
  `estado` enum('habilitado','deshabilitado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `imagen`, `precio`, `comision`, `codigo`, `promocion`, `estado`, `categoria_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Natural', NULL, 'img/Servicio/3-051111-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:11:11', '2021-12-02 00:11:11'),
(2, 'Ojo de gato', NULL, 'img/Servicio/10-051826-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:18:26', '2021-12-02 00:18:26'),
(3, 'Mixta', NULL, 'img/Servicio/4-052018-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:20:18', '2021-12-02 00:20:18'),
(4, 'Kylie Jenner', NULL, 'img/Servicio/5-052131-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:21:31', '2021-12-02 00:21:31'),
(5, 'Sexi lashes', NULL, 'img/Servicio/3-052308-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:23:08', '2021-12-02 00:23:08'),
(6, 'Californiana', NULL, 'img/Servicio/7-052437-9.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:24:37', '2021-12-02 00:24:37'),
(7, 'Volumen Extremo', NULL, 'img/Servicio/2-052636-8.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:26:36', '2021-12-02 00:26:36'),
(8, 'Tupido', NULL, 'img/Servicio/3-052841-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:28:41', '2021-12-02 00:28:41'),
(9, 'Japonesa', NULL, 'img/Servicio/4-053056-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:30:56', '2021-12-02 00:30:56'),
(10, 'Multilevel', NULL, 'img/Servicio/6-053159-3.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 4, NULL, '2021-12-02 00:31:59', '2021-12-02 00:31:59'),
(11, 'Semi-tupido', NULL, 'img/Servicio/2-053332-7.jpeg', 0.00, 0.00, 'null', 0, 'habilitado', 4, NULL, '2021-12-02 00:33:32', '2021-12-02 22:33:20'),
(12, 'Natural', NULL, 'img/Servicio/10-055256-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:52:56', '2021-12-02 00:52:56'),
(13, 'Ojo de gato', NULL, 'img/Servicio/0-055358-6.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:53:58', '2021-12-02 00:53:58'),
(14, 'Mixta', NULL, 'img/Servicio/3-055435-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:54:35', '2021-12-02 00:54:35'),
(15, 'Kylie Jenner', NULL, 'img/Servicio/3-055519-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:55:19', '2021-12-02 00:55:19'),
(16, 'Sexi lashes', NULL, 'img/Servicio/6-055607-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:56:07', '2021-12-02 00:56:07'),
(17, 'Californiana', NULL, 'img/Servicio/7-055636-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:56:36', '2021-12-02 00:56:36'),
(18, 'Volumen Extremo', NULL, 'img/Servicio/4-055703-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:57:03', '2021-12-02 00:57:03'),
(19, 'Tupido', NULL, 'img/Servicio/4-055739-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:57:39', '2021-12-02 00:57:39'),
(20, 'Japonesa', NULL, 'img/Servicio/5-055807-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:58:07', '2021-12-02 00:58:07'),
(21, 'Multilevel', NULL, 'img/Servicio/4-055827-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 5, NULL, '2021-12-02 00:58:27', '2021-12-02 00:58:27'),
(22, 'Semi-tupido', NULL, 'img/Servicio/4-055854-2.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 5, NULL, '2021-12-02 00:58:54', '2021-12-02 22:32:31'),
(23, 'Sexi lashes', NULL, 'img/Servicio/1-060009-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 6, NULL, '2021-12-02 01:00:09', '2021-12-02 01:00:09'),
(24, 'Natural', NULL, 'img/Servicio/8-023846-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:38:46', '2021-12-02 21:38:46'),
(25, 'Ojo de gato', NULL, 'img/Servicio/1-024034-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:40:34', '2021-12-02 21:40:34'),
(26, 'Mixta', NULL, 'img/Servicio/4-024059-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:40:59', '2021-12-02 21:40:59'),
(27, 'Kylie Jenner', NULL, 'img/Servicio/8-024126-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:41:26', '2021-12-02 21:41:26'),
(28, 'Sexi lashes', NULL, 'img/Servicio/3-024204-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:42:04', '2021-12-02 21:42:04'),
(29, 'Californiana', NULL, 'img/Servicio/8-024223-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:42:23', '2021-12-02 21:42:23'),
(30, 'Volumen Extremo', NULL, 'img/Servicio/1-024254-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:42:54', '2021-12-02 21:42:54'),
(31, 'Tupido', NULL, 'img/Servicio/1-024318-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:43:18', '2021-12-02 21:43:18'),
(32, 'Japonesa', NULL, 'img/Servicio/2-024338-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:43:38', '2021-12-02 21:43:38'),
(33, 'Multilevel', NULL, 'img/Servicio/9-024401-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 7, NULL, '2021-12-02 21:44:01', '2021-12-02 21:44:01'),
(34, 'Semi-tupido', NULL, 'img/Servicio/5-024420-0.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 7, NULL, '2021-12-02 21:44:20', '2021-12-02 22:31:31'),
(35, 'Natural', NULL, 'img/Servicio/4-024518-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:45:18', '2021-12-02 21:45:18'),
(36, 'Ojo de gato', NULL, 'img/Servicio/4-025020-6.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:50:20', '2021-12-02 21:50:20'),
(37, 'Mixta', NULL, 'img/Servicio/7-025322-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:53:22', '2021-12-02 21:53:22'),
(38, 'Kylie Jenner', NULL, 'img/Servicio/1-025426-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:54:26', '2021-12-02 21:54:26'),
(39, 'Sexi lashes', NULL, 'img/Servicio/3-025611-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:56:11', '2021-12-02 21:56:11'),
(40, 'Californiana', NULL, 'img/Servicio/9-025638-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:56:38', '2021-12-02 21:56:38'),
(41, 'Volumen Extremo', NULL, 'img/Servicio/1-025656-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:56:56', '2021-12-02 21:56:56'),
(42, 'Tupido', NULL, 'img/Servicio/4-025734-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:57:34', '2021-12-02 21:57:34'),
(43, 'Japonesa', NULL, 'img/Servicio/4-025750-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:57:50', '2021-12-02 21:57:50'),
(44, 'Multilevel', NULL, 'img/Servicio/10-025806-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 8, NULL, '2021-12-02 21:58:06', '2021-12-02 21:58:06'),
(45, 'Semi-tupido', NULL, 'img/Servicio/2-025826-10.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 8, NULL, '2021-12-02 21:58:26', '2021-12-02 22:32:50'),
(46, 'Californiana', NULL, 'img/Servicio/4-030138-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:01:38', '2021-12-02 22:01:38'),
(47, 'Natural', NULL, 'img/Servicio/8-030207-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:02:07', '2021-12-02 22:02:07'),
(48, 'Tupido', NULL, 'img/Servicio/2-030223-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:02:23', '2021-12-02 22:02:23'),
(49, 'Japonesa', NULL, 'img/Servicio/7-030242-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:02:42', '2021-12-02 22:02:42'),
(50, 'Mixta', NULL, 'img/Servicio/1-030328-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:03:28', '2021-12-02 22:03:28'),
(51, 'Ojo de gato', NULL, 'img/Servicio/4-030343-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:03:43', '2021-12-02 22:03:43'),
(52, 'Multilevel', NULL, 'img/Servicio/10-030411-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 9, NULL, '2021-12-02 22:04:11', '2021-12-02 22:04:11'),
(53, 'Semi-tupido', NULL, 'img/Servicio/10-030432-4.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 9, NULL, '2021-12-02 22:04:32', '2021-12-02 22:32:00'),
(54, 'Californiana', NULL, 'img/Servicio/6-030656-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:06:56', '2021-12-02 22:06:56'),
(55, 'Natural', NULL, 'img/Servicio/6-030721-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:07:21', '2021-12-02 22:07:21'),
(56, 'Semi-tupido', NULL, 'img/Servicio/7-030739-0.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 10, NULL, '2021-12-02 22:07:39', '2021-12-02 22:31:05'),
(57, 'Japonesa', NULL, 'img/Servicio/9-030835-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:08:35', '2021-12-02 22:08:35'),
(58, 'Mixta', NULL, 'img/Servicio/9-030901-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:09:01', '2021-12-02 22:09:01'),
(59, 'Ojo de gato', NULL, 'img/Servicio/10-030945-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:09:45', '2021-12-02 22:09:45'),
(60, 'Multilevel', NULL, 'img/Servicio/4-031008-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 10, NULL, '2021-12-02 22:10:08', '2021-12-02 22:10:08'),
(61, 'Californiana', NULL, 'img/Servicio/5-031343-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 11, NULL, '2021-12-02 22:13:43', '2021-12-02 22:13:43'),
(62, 'Multilevel', NULL, 'img/Servicio/0-031404-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 11, NULL, '2021-12-02 22:14:04', '2021-12-02 22:14:04'),
(63, 'Semi-tupido', NULL, 'img/Servicio/4-031427-4.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 11, NULL, '2021-12-02 22:14:27', '2021-12-02 22:30:55'),
(64, 'Japonesa', NULL, 'img/Servicio/4-031443-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 11, NULL, '2021-12-02 22:14:43', '2021-12-02 22:14:43'),
(65, 'Mixta', NULL, 'img/Servicio/4-031523-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 11, NULL, '2021-12-02 22:15:23', '2021-12-02 22:15:23'),
(66, 'Ojo de gato', NULL, 'img/Servicio/2-031537-6.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 11, NULL, '2021-12-02 22:15:37', '2021-12-02 22:15:37'),
(67, 'Natural', NULL, 'img/Servicio/1-031944-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 12, NULL, '2021-12-02 22:19:44', '2021-12-02 22:19:44'),
(68, 'Natural', NULL, 'img/Servicio/7-032533-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:25:33', '2021-12-02 22:25:33'),
(69, 'Ojo de gato', NULL, 'img/Servicio/0-032556-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:25:56', '2021-12-02 22:25:56'),
(70, 'Mixta', NULL, 'img/Servicio/1-032621-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:26:21', '2021-12-02 22:26:21'),
(71, 'Kylie Jenner', NULL, 'img/Servicio/6-032644-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:26:44', '2021-12-02 22:26:44'),
(72, 'Sexi lashes', NULL, 'img/Servicio/5-032709-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:27:09', '2021-12-02 22:27:09'),
(73, 'Californiana', NULL, 'img/Servicio/9-032833-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:28:33', '2021-12-02 22:28:33'),
(74, 'Volumen Extremo', NULL, 'img/Servicio/2-032851-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:28:51', '2021-12-02 22:28:51'),
(75, 'Tupido', NULL, 'img/Servicio/3-032912-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:29:12', '2021-12-02 22:29:12'),
(76, 'Japonesa', NULL, 'img/Servicio/10-032929-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:29:29', '2021-12-02 22:29:29'),
(77, 'Multilevel', NULL, 'img/Servicio/3-033008-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:30:08', '2021-12-02 22:30:08'),
(78, 'Semi-tupido', NULL, 'img/Servicio/2-033042-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 15, NULL, '2021-12-02 22:30:42', '2021-12-02 22:30:42'),
(79, 'Natural', NULL, 'img/Servicio/8-034142-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:41:42', '2021-12-02 22:41:42'),
(80, 'Ojo de gato', NULL, 'img/Servicio/8-034239-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:42:39', '2021-12-02 22:42:39'),
(81, 'Mixta', NULL, 'img/Servicio/10-034258-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:42:58', '2021-12-02 22:42:58'),
(82, 'Kylie Jenner', NULL, 'img/Servicio/0-034341-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:43:41', '2021-12-02 22:43:41'),
(83, 'Sexi lashes', NULL, 'img/Servicio/6-034411-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:44:11', '2021-12-02 22:44:11'),
(84, 'Californiana', NULL, 'img/Servicio/9-034442-6.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:44:42', '2021-12-02 22:44:42'),
(85, 'Volumen Extremo', NULL, 'img/Servicio/10-034514-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:45:14', '2021-12-02 22:45:14'),
(86, 'Tupido', NULL, 'img/Servicio/3-034748-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:47:48', '2021-12-02 22:47:48'),
(87, 'Japonesa', NULL, 'img/Servicio/4-034815-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:48:15', '2021-12-02 22:48:15'),
(88, 'Multilevel', NULL, 'img/Servicio/7-034843-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:48:43', '2021-12-02 22:48:43'),
(89, 'Semi-tupido', NULL, 'img/Servicio/10-034910-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 16, NULL, '2021-12-02 22:49:10', '2021-12-02 22:49:10'),
(90, 'Sexi lashes', NULL, 'img/Servicio/6-035112-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 18, NULL, '2021-12-02 22:51:12', '2021-12-02 22:51:12'),
(91, 'Natural', NULL, 'img/Servicio/8-035342-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:53:42', '2021-12-02 22:53:42'),
(92, 'Ojo de gato', NULL, 'img/Servicio/7-035405-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:54:05', '2021-12-02 22:54:05'),
(93, 'Mixta', NULL, 'img/Servicio/8-035427-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:54:27', '2021-12-02 22:54:27'),
(94, 'Kylie Jenner', NULL, 'img/Servicio/3-035451-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:54:51', '2021-12-02 22:54:51'),
(95, 'Sexi lashes', NULL, 'img/Servicio/6-035528-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:55:29', '2021-12-02 22:55:29'),
(96, 'Californiana', NULL, 'img/Servicio/3-035605-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:56:05', '2021-12-02 22:56:05'),
(97, 'Volumen Extremo', NULL, 'img/Servicio/9-035635-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:56:35', '2021-12-02 22:56:35'),
(98, 'Tupido', NULL, 'img/Servicio/6-035658-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:56:58', '2021-12-02 22:56:58'),
(99, 'Japonesa', NULL, 'img/Servicio/0-035718-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:57:18', '2021-12-02 22:57:18'),
(100, 'Multilevel', NULL, 'img/Servicio/9-035735-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:57:35', '2021-12-02 22:57:35'),
(101, 'Semi-tupido', NULL, 'img/Servicio/7-035759-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 19, NULL, '2021-12-02 22:57:59', '2021-12-02 22:57:59'),
(102, 'Natural', NULL, 'img/Servicio/7-040008-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:00:08', '2021-12-02 23:00:08'),
(103, 'Ojo de gato', NULL, 'img/Servicio/0-040035-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:00:35', '2021-12-02 23:00:35'),
(104, 'Mixta', NULL, 'img/Servicio/8-040108-0.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:01:08', '2021-12-02 23:01:08'),
(105, 'Kylie Jenner', NULL, 'img/Servicio/8-040134-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:01:34', '2021-12-02 23:01:34'),
(106, 'Sexi lashes', NULL, 'img/Servicio/0-040242-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:02:42', '2021-12-02 23:02:42'),
(107, 'Californiana', NULL, 'img/Servicio/6-040306-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:03:06', '2021-12-02 23:03:06'),
(108, 'Volumen Extremo', NULL, 'img/Servicio/10-040354-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:03:54', '2021-12-02 23:03:54'),
(109, 'Tupido', NULL, 'img/Servicio/0-040422-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:04:22', '2021-12-02 23:04:22'),
(110, 'Japonesa', NULL, 'img/Servicio/1-040438-8.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:04:38', '2021-12-02 23:04:38'),
(111, 'Multilevel', NULL, 'img/Servicio/3-040507-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:05:07', '2021-12-02 23:05:07'),
(112, 'Semi-tupido', NULL, 'img/Servicio/4-040530-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 20, NULL, '2021-12-02 23:05:30', '2021-12-02 23:05:30'),
(113, 'Californiana', NULL, 'img/Servicio/4-040707-8.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:07:07', '2021-12-02 23:07:07'),
(114, 'Natural', NULL, 'img/Servicio/9-040732-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:07:32', '2021-12-02 23:07:32'),
(115, 'Tupido', NULL, 'img/Servicio/1-040758-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:07:58', '2021-12-02 23:07:58'),
(116, 'Japonesa', NULL, 'img/Servicio/9-040815-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:08:15', '2021-12-02 23:08:15'),
(117, 'Mixta', NULL, 'img/Servicio/1-040835-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:08:35', '2021-12-02 23:08:35'),
(118, 'Ojo de gato', NULL, 'img/Servicio/1-040852-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:08:52', '2021-12-02 23:08:52'),
(119, 'Multilevel', NULL, 'img/Servicio/6-040918-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:09:18', '2021-12-02 23:09:18'),
(120, 'Semi-tupudo', NULL, 'img/Servicio/4-040944-9.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 21, NULL, '2021-12-02 23:09:44', '2021-12-02 23:09:44'),
(121, 'Californiana', NULL, 'img/Servicio/2-041205-6.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 22, NULL, '2021-12-02 23:12:05', '2021-12-02 23:15:03'),
(122, 'Natural', NULL, 'img/Servicio/6-041650-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:16:50', '2021-12-02 23:16:50'),
(123, 'Tupido', NULL, 'img/Servicio/3-041739-6.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:17:39', '2021-12-02 23:17:39'),
(124, 'Japonesa', NULL, 'img/Servicio/8-041806-10.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:18:06', '2021-12-02 23:18:06'),
(125, 'Mixta', NULL, 'img/Servicio/2-041838-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:18:38', '2021-12-02 23:18:38'),
(126, 'Ojo de gato', NULL, 'img/Servicio/7-041901-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:19:01', '2021-12-02 23:19:01'),
(127, 'Multilevel', NULL, 'img/Servicio/2-041930-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 22, NULL, '2021-12-02 23:19:30', '2021-12-02 23:19:30'),
(128, 'Californiana', NULL, 'img/Servicio/6-042055-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 23, NULL, '2021-12-02 23:20:55', '2021-12-02 23:20:55'),
(129, 'Multilevel', NULL, 'img/Servicio/0-042116-4.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 23, NULL, '2021-12-02 23:21:16', '2021-12-02 23:21:16'),
(130, 'Semi-tupido', NULL, 'img/Servicio/9-042143-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 23, NULL, '2021-12-02 23:21:43', '2021-12-02 23:21:43'),
(131, 'Japonesa', NULL, 'img/Servicio/7-042211-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 23, NULL, '2021-12-02 23:22:11', '2021-12-02 23:22:11'),
(132, 'Mixta', NULL, 'img/Servicio/10-042227-1.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 23, NULL, '2021-12-02 23:22:27', '2021-12-02 23:22:27'),
(133, 'Ojo de gato', NULL, 'img/Servicio/9-042239-5.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 23, NULL, '2021-12-02 23:22:39', '2021-12-02 23:24:11'),
(134, 'Natural', NULL, 'img/Servicio/4-042504-5.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 24, NULL, '2021-12-02 23:25:04', '2021-12-02 23:25:04'),
(135, 'Lifting Inferior', NULL, 'img/Servicio/1-042628-9.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 1, NULL, '2021-12-02 23:26:28', '2021-12-02 23:26:28'),
(136, 'Lifting Superior', NULL, 'img/Servicio/8-042701-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 1, NULL, '2021-12-02 23:27:01', '2021-12-02 23:27:01'),
(137, 'Ondulado', NULL, 'img/Servicio/4-042728-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 1, NULL, '2021-12-02 23:27:28', '2021-12-02 23:27:28'),
(138, 'Negro', NULL, 'img/Servicio/10-042931-3.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 25, NULL, '2021-12-02 23:29:31', '2021-12-02 23:29:31'),
(139, 'Café', NULL, 'img/Servicio/0-042957-2.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 25, NULL, '2021-12-02 23:29:57', '2021-12-02 23:29:57'),
(140, 'Cera', NULL, 'img/Servicio/0-044044-7.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 27, NULL, '2021-12-02 23:40:44', '2021-12-02 23:40:44'),
(141, 'Ombré', NULL, 'img/Servicio/3-044124-7.jpeg', 0.00, 0.00, 'null', 0, 'habilitado', 28, NULL, '2021-12-02 23:41:24', '2021-12-02 23:46:58'),
(142, 'Marrón', NULL, 'img/Servicio/6-044421-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 30, NULL, '2021-12-02 23:44:21', '2021-12-02 23:44:21'),
(143, 'Marrón Chocolate', NULL, 'img/Servicio/4-044525-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 30, NULL, '2021-12-02 23:45:25', '2021-12-02 23:45:25'),
(144, 'Castaño Medio', NULL, 'img/Servicio/5-044555-2.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 30, NULL, '2021-12-02 23:45:55', '2021-12-02 23:45:55'),
(145, 'Castaño Oscuro', NULL, 'img/Servicio/2-044611-1.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 30, NULL, '2021-12-02 23:46:11', '2021-12-02 23:46:11'),
(146, 'Negro', NULL, 'img/Servicio/8-044642-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 30, NULL, '2021-12-02 23:46:42', '2021-12-02 23:46:42'),
(147, 'Alisado', NULL, 'img/Servicio/10-044725-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 26, NULL, '2021-12-02 23:47:25', '2021-12-02 23:47:25'),
(148, 'Brow Maping', NULL, 'img/Servicio/9-044809-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 26, NULL, '2021-12-02 23:48:09', '2021-12-02 23:48:09'),
(149, 'Ombré', NULL, 'img/Servicio/5-045006-2.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 31, NULL, '2021-12-02 23:50:06', '2021-12-02 23:50:06'),
(150, 'Negro', NULL, 'img/Servicio/10-045030-3.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 32, NULL, '2021-12-02 23:50:30', '2021-12-02 23:50:30'),
(151, 'Castaño Oscuro', NULL, 'img/Servicio/5-045052-3.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 32, NULL, '2021-12-02 23:50:52', '2021-12-02 23:50:52'),
(152, 'Castaño Claro', NULL, 'img/Servicio/1-045118-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 32, NULL, '2021-12-02 23:51:18', '2021-12-02 23:51:18'),
(153, 'Chocolate', NULL, 'img/Servicio/8-045138-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 32, NULL, '2021-12-02 23:51:38', '2021-12-02 23:51:38'),
(154, 'Frente', NULL, 'img/Servicio/9-045513-4.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 35, NULL, '2021-12-02 23:55:13', '2021-12-02 23:55:13'),
(155, 'Mejillas', NULL, 'img/Servicio/2-045541-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 35, NULL, '2021-12-02 23:55:41', '2021-12-02 23:55:41'),
(156, 'Patillas', NULL, 'img/Servicio/2-045603-8.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 35, NULL, '2021-12-02 23:56:03', '2021-12-02 23:56:03'),
(157, 'Bozo', NULL, 'img/Servicio/9-045630-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 35, NULL, '2021-12-02 23:56:30', '2021-12-02 23:56:30'),
(158, 'Mandíbula', NULL, 'img/Servicio/8-045657-3.jpeg', 0.00, 0.00, 'null', 0, 'habilitado', 35, NULL, '2021-12-02 23:56:57', '2022-01-27 19:44:11'),
(159, 'Frente', NULL, 'img/Servicio/8-050022-10.jpeg', 0.00, 0.00, 'null', 0, 'habilitado', 36, NULL, '2021-12-03 00:00:22', '2022-01-27 19:43:54'),
(160, 'Mejillas', NULL, 'img/Servicio/6-050047-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 36, NULL, '2021-12-03 00:00:47', '2021-12-03 00:00:47'),
(161, 'Patillas', NULL, 'img/Servicio/3-050106-4.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 36, NULL, '2021-12-03 00:01:06', '2021-12-03 00:01:06'),
(162, 'Bozo', NULL, 'img/Servicio/10-050124-2.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 36, NULL, '2021-12-03 00:01:24', '2021-12-03 00:01:24'),
(163, 'Mandíbula', NULL, 'img/Servicio/4-050143-9.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 36, NULL, '2021-12-03 00:01:43', '2021-12-03 00:01:43'),
(164, 'Mascarillas', NULL, 'img/Servicio/2-050517-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 38, NULL, '2021-12-03 00:05:17', '2021-12-03 00:05:17'),
(165, 'Exfoliantes', NULL, 'img/Servicio/0-050538-4.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 38, NULL, '2021-12-03 00:05:38', '2021-12-03 00:05:38'),
(166, 'Cremas', NULL, 'img/Servicio/9-050706-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 38, NULL, '2021-12-03 00:07:06', '2021-12-03 00:07:06'),
(167, 'Punta de diamante', NULL, 'img/Servicio/9-050955-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 39, NULL, '2021-12-03 00:09:55', '2021-12-03 00:09:55'),
(168, 'Mascara led', NULL, 'img/Servicio/8-051009-5.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 39, NULL, '2021-12-03 00:10:09', '2021-12-03 00:10:09'),
(169, 'Alta frecuencia', NULL, 'img/Servicio/1-051023-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 39, NULL, '2021-12-03 00:10:23', '2021-12-03 00:10:23'),
(170, 'Pierna completa', NULL, 'img/Servicio/0-051331-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:13:31', '2021-12-03 00:13:31'),
(171, 'Media pierna', NULL, 'img/Servicio/3-051351-2.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:13:51', '2021-12-03 00:13:51'),
(172, 'Brazo completo', NULL, 'img/Servicio/1-051422-4.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:14:22', '2021-12-03 00:14:22'),
(173, 'Medio Brazo', NULL, 'img/Servicio/8-051450-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:14:50', '2021-12-03 00:14:50'),
(174, 'Manos', NULL, 'img/Servicio/7-051514-7.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:15:14', '2021-12-03 00:15:14'),
(175, 'Pies', NULL, 'img/Servicio/0-051534-8.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:15:34', '2021-12-03 00:15:34'),
(176, 'Pecho', NULL, 'img/Servicio/9-051557-0.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:15:57', '2021-12-03 00:15:57'),
(177, 'Abdomen', NULL, 'img/Servicio/10-051617-1.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:16:17', '2021-12-03 00:16:17'),
(178, 'Espalda', NULL, 'img/Servicio/10-051635-4.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:16:35', '2021-12-03 00:16:35'),
(179, 'Glúteos', NULL, 'img/Servicio/2-051719-10.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:17:19', '2021-12-03 00:17:19'),
(180, 'Bikini', NULL, 'img/Servicio/3-051737-6.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:17:37', '2021-12-03 00:17:37'),
(181, 'Cola', NULL, 'img/Servicio/4-051756-2.jpg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:17:56', '2021-12-03 00:17:56'),
(182, 'Cuello', NULL, 'img/Servicio/8-051814-9.jpeg', 0.00, 0.00, NULL, 0, 'habilitado', 42, NULL, '2021-12-03 00:18:14', '2021-12-03 00:18:14'),
(183, 'Axila', NULL, 'img/Servicio/7-051840-8.jpg', 0.00, 0.00, 'null', 0, 'habilitado', 42, NULL, '2021-12-03 00:18:40', '2022-01-27 19:43:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursals`
--

CREATE TABLE `sucursals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursals`
--

INSERT INTO `sucursals` (`id`, `direccion`, `telefono`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Plaza Bolivar', '484542', 'Quillacollo', NULL, NULL, '2021-06-22 22:53:25'),
(2, 'Av. Blanco Galindo y Peru', '45454545', 'Supermall', NULL, '2021-05-17 17:35:09', '2021-06-22 22:52:21'),
(3, 'Av. America', '4444444', 'America', NULL, '2021-05-17 23:15:04', '2021-06-22 22:51:57'),
(4, 'Av. Heroinas', '4245421', 'SKYBOX', NULL, '2021-06-22 22:52:58', '2021-06-22 22:52:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_user`
--

CREATE TABLE `sucursal_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursal_user`
--

INSERT INTO `sucursal_user` (`id`, `user_id`, `sucursal_id`, `created_at`, `updated_at`) VALUES
(8, 1, 1, NULL, NULL),
(31, 5, 3, NULL, NULL),
(32, 6, 3, NULL, NULL),
(42, 2, 1, NULL, NULL),
(43, 2, 2, NULL, NULL),
(44, 2, 3, NULL, NULL),
(45, 2, 4, NULL, NULL),
(49, 7, 3, NULL, NULL),
(63, 3, 1, NULL, NULL),
(64, 3, 2, NULL, NULL),
(65, 3, 3, NULL, NULL),
(66, 3, 4, NULL, NULL),
(71, 8, 1, NULL, NULL),
(72, 4, 1, NULL, NULL),
(73, 4, 2, NULL, NULL),
(74, 4, 3, NULL, NULL),
(75, 4, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `celular`, `ci`, `fecha_nacimiento`, `username`, `email`, `email_verified_at`, `password`, `codigo`, `rol`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'root', NULL, NULL, NULL, 'root', 'root@root.com', NULL, '$2y$10$IlK7TBcefnjOrjvheCliOO8OB07JrS6UMCEauLRJlEjnZQhXP7Pi6', '000', 'root', NULL, NULL, '2021-05-16 07:48:31', '2021-06-02 22:12:41'),
(2, 'Oscar123', '44545', '555555', '2021-04-27', 'racso', 'racso@racso.com', NULL, '$2y$10$JDxF/UWJ39jGMv.08.SGLOyk1g9rqKjB3UxQbPKxcvP4IxWlCFuPC', '222', 'admin', NULL, NULL, '2021-05-17 19:58:35', '2021-07-13 02:15:09'),
(3, 'Guido', '7787878', '123456', '2021-06-22', 'guido', 'guido@elashes.com', NULL, '$2y$10$zlFMymGZaW0JFq3ODY.BEOiCNrvd8WrLPern2hRYbbDRPPXFi0zLS', '111', 'admin', NULL, NULL, '2021-06-02 22:10:44', '2022-01-27 19:49:51'),
(4, 'Rene', '34343', '123456', '2021-06-15', 'rene', 'rene@elashes.com', NULL, '$2y$10$22EC4d73.t59UbhMU8FSG.iOc7mh4.EFefF1Io1imnlOlI5c0PANq', '111', 'admin', NULL, NULL, '2021-06-02 22:14:20', '2022-01-27 19:52:54'),
(5, 'Sara', '7875749', '65265325', '2021-06-18', 'sara', 'sara@mail.com', NULL, '$2y$10$sipO6bdXHy1ah7SvQWnaNOshG3vLx1DFKgLoqzQvXCv9EHRlRfI/W', NULL, 'operador', NULL, NULL, '2021-06-22 23:31:18', '2021-06-22 23:31:18'),
(6, 'Silvia', '7597563', '6525412', '2021-06-04', 'silvia', 'silvia@mail.com', NULL, '$2y$10$pap0nat9i6VDhY/3UAsCpeoWlbr5VFK28WTB1z7YrQ2x4XJMPrapG', NULL, 'operador', NULL, NULL, '2021-06-22 23:32:17', '2021-06-22 23:32:17'),
(7, 'Mariana', '75757575', '656565', '2021-10-05', 'mariana', 'mariana@mariana.com', NULL, '$2y$10$4WxrK0Z/KaHOiAgaW4kQ5OEN6qnhEU3lAnyuf9KgUyNagdawt8Be2', '123', '', NULL, NULL, '2021-10-05 15:51:49', '2021-10-05 15:51:49'),
(8, 'Ana Villa Gomez', '77478776', '8945478', '2000-06-22', 'Ana', 'ana@gmail.com', NULL, '$2y$10$QXYhATdNDGzLpJAZSZ59wuV8CIH9R9uCdw9FVK3erwku8AApXdhYW', '1234', 'supervisor', NULL, NULL, '2021-12-09 23:55:33', '2021-12-10 00:30:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` double(8,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ficha` int(11) DEFAULT NULL,
  `subtotal` double(8,2) NOT NULL,
  `descuento` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('aceptado','anulado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago` enum('efectivo','tarjeta','transferencia') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facturado` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cliente_id`, `sucursal_id`, `servicio_id`, `user_id`, `precio`, `cantidad`, `ficha`, `subtotal`, `descuento`, `total`, `descripcion`, `estado`, `pago`, `facturado`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 36, 1, 1, NULL, 0.00, 1, 1, 0.00, 0.00, 0.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-12-13 20:41:37', '2021-12-13 20:41:37'),
(2, 36, 1, 2, NULL, 0.00, 1, 2, 0.00, 0.00, 0.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-12-13 20:41:37', '2021-12-13 20:41:37'),
(3, 36, 1, 133, NULL, 0.00, 1, 1, 0.00, 0.00, 0.00, '', 'aceptado', 'efectivo', 0, NULL, '2021-12-15 23:24:35', '2021-12-15 23:24:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recordatorios_servicio_id_foreign` (`servicio_id`);

--
-- Indices de la tabla `recordatorio_ventas`
--
ALTER TABLE `recordatorio_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recordatorio_ventas_recordatorio_id_foreign` (`recordatorio_id`),
  ADD KEY `recordatorio_ventas_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicios_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal_user`
--
ALTER TABLE `sucursal_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal_user_user_id_foreign` (`user_id`),
  ADD KEY `sucursal_user_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `ventas_servicio_id_foreign` (`servicio_id`),
  ADD KEY `ventas_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recordatorio_ventas`
--
ALTER TABLE `recordatorio_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sucursal_user`
--
ALTER TABLE `sucursal_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD CONSTRAINT `recordatorios_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `recordatorio_ventas`
--
ALTER TABLE `recordatorio_ventas`
  ADD CONSTRAINT `recordatorio_ventas_recordatorio_id_foreign` FOREIGN KEY (`recordatorio_id`) REFERENCES `recordatorios` (`id`),
  ADD CONSTRAINT `recordatorio_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `sucursal_user`
--
ALTER TABLE `sucursal_user`
  ADD CONSTRAINT `sucursal_user_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `sucursal_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  ADD CONSTRAINT `ventas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
