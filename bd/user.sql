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

-- Dumping data for table elashes.sucursals: ~3 rows (approximately)
/*!40000 ALTER TABLE `sucursals` DISABLE KEYS */;
INSERT INTO `sucursals` (`id`, `direccion`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 's1', 's12111', NULL, NULL, '2021-05-17 11:36:25'),
	(2, NULL, '123', NULL, '2021-05-17 11:35:09', '2021-05-17 11:36:35'),
	(3, NULL, 'sss4', NULL, '2021-05-17 17:15:04', '2021-05-17 17:15:04');
/*!40000 ALTER TABLE `sucursals` ENABLE KEYS */;

-- Dumping data for table elashes.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nombre`, `celular`, `ci`, `fecha_nacimiento`, `username`, `email`, `email_verified_at`, `password`, `codigo`, `rol`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'root', NULL, NULL, NULL, 'root', 'root@root.com', NULL, '$2y$10$IlK7TBcefnjOrjvheCliOO8OB07JrS6UMCEauLRJlEjnZQhXP7Pi6', '000', 'root', NULL, NULL, '2021-05-16 01:48:31', '2021-06-02 16:12:41'),
	(2, 'osss123111', '44545', '555', '2021-04-27', 'racso', 'racso@racso.com', NULL, '$2y$10$JDxF/UWJ39jGMv.08.SGLOyk1g9rqKjB3UxQbPKxcvP4IxWlCFuPC', '222', 'admin', NULL, NULL, '2021-05-17 13:58:35', '2021-05-17 15:25:55'),
	(3, 'ffff', '32423', '2324', '2021-06-24', 'newuse', 'info@ffff.com', NULL, '$2y$10$qQ9RKjbJZQddP6ytsTF0kODw0N4eqXvE5GA7eZpfeXci4XGGaedxW', NULL, 'operador', NULL, NULL, '2021-06-02 16:10:44', '2021-06-02 16:10:44'),
	(4, 'ccc22222', '34343', '7777', '2021-06-15', 'operador', 'op@op.com', NULL, '$2y$10$JOpFhTmRnUtHM84NpCoFlOqDJBTV9mw7ZncRhI/1Ov61fBdHjeaB2', '111', 'operador', NULL, NULL, '2021-06-02 16:14:20', '2021-06-07 14:47:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
