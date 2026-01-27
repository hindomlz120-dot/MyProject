-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.4.3 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour stages_db
CREATE DATABASE IF NOT EXISTS `stages_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stages_db`;

-- Listage de la structure de table stages_db. candidatures
DROP TABLE IF EXISTS `candidatures`;
CREATE TABLE IF NOT EXISTS `candidatures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_etudiant` varchar(255) DEFAULT NULL,
  `id_offre` int DEFAULT NULL,
  `statut` varchar(20) DEFAULT 'En attente',
  PRIMARY KEY (`id`),
  KEY `id_etudiant` (`id_etudiant`),
  KEY `id_offre` (`id_offre`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stages_db.candidatures : ~3 rows (environ)
INSERT INTO `candidatures` (`id`, `id_etudiant`, `id_offre`, `statut`) VALUES
	(1, 'programmed12@gmail.com', 1, 'En attente'),
	(2, 'imenmzl185@gmail.com', 3, 'En attente'),
	(3, 'hind@email.com', 2, 'En attente'),
	(18, 'rioppjo@gfjk.com', 2, 'En attente'),
	(19, 'hind@email.com', 1, 'En attente');

-- Listage de la structure de table stages_db. etudiants
DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stages_db.etudiants : ~0 rows (environ)

-- Listage de la structure de table stages_db. offres
DROP TABLE IF EXISTS `offres`;
CREATE TABLE IF NOT EXISTS `offres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `description` text,
  `domaine` varchar(50) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stages_db.offres : ~3 rows (environ)
INSERT INTO `offres` (`id`, `titre`, `description`, `domaine`, `date_debut`) VALUES
	(1, 'Développeure', 'Stage PFE Algiers', 'Informatique', '2026-02-01'),
	(2, 'Devloppeure', 'Stage chez Sonatrach', 'bootstrap', '2026-03-15'),
	(3, 'Devloppeure', 'stage chez icosnet', 'php', '2026-03-15');

-- Listage de la structure de table stages_db. utilisateurs
DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table stages_db.utilisateurs : ~1 rows (environ)
INSERT INTO `utilisateurs` (`id`, `email`, `password`, `role`) VALUES
	(1, 'admin@email.com', '1234', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
