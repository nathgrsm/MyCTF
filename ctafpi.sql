-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.28-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour ctfapi
CREATE DATABASE IF NOT EXISTS `ctfapi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `ctfapi`;

-- Listage de la structure de la table ctfapi. challenges
CREATE TABLE IF NOT EXISTS `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du challenge',
  `competition_id` int(11) NOT NULL COMMENT 'Identifiant de la compétition à laquelle appartient le challenge',
  `name` varchar(255) NOT NULL COMMENT 'Nom du challenge',
  `category` varchar(255) NOT NULL COMMENT 'Catégorie du challenge',
  `description` text NOT NULL COMMENT 'Description du challenge',
  `points` int(11) NOT NULL COMMENT 'Nombre de points attribués pour résoudre le challenge',
  `flag` varchar(255) NOT NULL COMMENT 'Flag du challenge',
  PRIMARY KEY (`id`),
  KEY `competition_id` (`competition_id`),
  CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les challenges';

-- Listage des données de la table ctfapi.challenges : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. competitions
CREATE TABLE IF NOT EXISTS `competitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de la compétition',
  `name` varchar(255) NOT NULL COMMENT 'Nom de la compétition',
  `status` int(11) NOT NULL DEFAULT 3 COMMENT '1: Passé, 2: En cours, 3: À venir',
  `start_date` date NOT NULL COMMENT 'Date de début de la compétition',
  `end_date` date NOT NULL COMMENT 'Date de fin de la compétition',
  `location` varchar(255) NOT NULL COMMENT 'Lieu de la compétition',
  `description` text NOT NULL COMMENT 'Description de la compétition',
  `is_online` tinyint(1) NOT NULL COMMENT 'Indique si la compétition est en ligne (1) ou en personne (0)',
  `online_link` varchar(255) DEFAULT NULL COMMENT 'Lien vers la compétition en ligne (si applicable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les compétitions';

-- Listage des données de la table ctfapi.competitions : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. schools
CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de l''école',
  `name` varchar(255) NOT NULL COMMENT 'Nom de l''école',
  `address` varchar(255) NOT NULL COMMENT 'Adresse de l''école',
  `city` varchar(255) NOT NULL COMMENT 'Ville où se trouve l''école',
  `country` varchar(255) NOT NULL COMMENT 'Pays où se trouve l''école',
  `website` varchar(255) NOT NULL COMMENT 'Site web de l''école',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les écoles';

-- Listage des données de la table ctfapi.schools : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. social_networks
CREATE TABLE IF NOT EXISTS `social_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the social network',
  `name` varchar(255) NOT NULL COMMENT 'Name of the social network',
  `url` varchar(255) NOT NULL COMMENT 'URL of the social network',
  `icon` varchar(255) NOT NULL COMMENT 'Icon of the social network',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table containing social networks of the website';

-- Listage des données de la table ctfapi.social_networks : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. sponsors
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du sponsor',
  `nom` varchar(255) NOT NULL COMMENT 'Nom du sponsor',
  `logo` varchar(255) NOT NULL COMMENT 'URL du logo du sponsor',
  `site_web` varchar(255) NOT NULL COMMENT 'Site web du sponsor',
  `description` text NOT NULL COMMENT 'Description du sponsor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les sponsors';

-- Listage des données de la table ctfapi.sponsors : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. submissions
CREATE TABLE IF NOT EXISTS `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de la soumission',
  `user_id` int(11) NOT NULL COMMENT 'Identifiant de l''utilisateur qui a soumis la réponse',
  `challenge_id` int(11) NOT NULL COMMENT 'Identifiant du challenge pour lequel la réponse a été soumise',
  `submission_date` datetime NOT NULL COMMENT 'Date et heure de la soumission',
  `is_correct` tinyint(1) NOT NULL COMMENT 'Indique si la réponse soumise est correcte (1) ou non (0)',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les soumissions';

-- Listage des données de la table ctfapi.submissions : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de l''abonnement',
  `name` varchar(255) NOT NULL COMMENT 'Nom de l''abonnement',
  `description` text NOT NULL COMMENT 'Description de l''abonnement',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les différents types d''abonnements';

-- Listage des données de la table ctfapi.subscriptions : ~3 rows (environ)
INSERT INTO `subscriptions` (`id`, `name`, `description`) VALUES
	(1, 'Free', 'Abonnement gratuit pour tout le monde'),
	(2, 'Pro', 'Abonnement pour les médias et les passionnés de CTFs'),
	(3, 'Dashboard', 'Abonnement pour les marques, les équipes et les organisateurs de CTFs');

-- Listage de la structure de la table ctfapi. team
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'L''identifiant unique de l''équipe (auto-incrémenté)',
  `name` varchar(50) NOT NULL COMMENT 'Le nom de l''équipe',
  `country` varchar(50) DEFAULT NULL COMMENT 'Le pays de résidence de l''équipe',
  `city` varchar(50) DEFAULT NULL COMMENT 'La ville de résidence de l''équipe',
  `school_id` int(11) DEFAULT NULL COMMENT 'L''identifiant de l''école ou l''université de l''équipe',
  `flags_captured` int(11) DEFAULT NULL COMMENT 'Le nombre total de drapeaux capturés par l''équipe',
  `members_count` int(11) DEFAULT NULL COMMENT 'Le nombre total de membres dans l''équipe',
  `description` text DEFAULT NULL COMMENT 'La description de l''équipe',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'La date et l''heure de création de l''enregistrement (par défaut à la date et l''heure actuelles)',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'La date et l''heure de la dernière mise à jour de l''enregistrement (par défaut à la date et l''heure actuelles)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les informations des équipes inscrites sur le site.';

-- Listage des données de la table ctfapi.team : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'L''identifiant unique de l''utilisateur (auto-incrémenté)',
  `username` varchar(50) NOT NULL COMMENT 'Le nom d''utilisateur de l''utilisateur',
  `email` varchar(100) NOT NULL COMMENT 'L''adresse e-mail de l''utilisateur',
  `password` varchar(255) NOT NULL COMMENT 'Le mot de passe de l''utilisateur (hashé)',
  `first_name` varchar(50) DEFAULT NULL COMMENT 'Le prénom de l''utilisateur',
  `last_name` varchar(50) DEFAULT NULL COMMENT 'Le nom de famille de l''utilisateur',
  `country` varchar(50) DEFAULT NULL COMMENT 'Le pays de résidence de l''utilisateur',
  `city` varchar(50) DEFAULT NULL COMMENT 'La ville de résidence de l''utilisateur',
  `school_id` int(11) DEFAULT NULL COMMENT 'L''identifiant de l''école ou l''université de l''utilisateur',
  `team_id` int(11) DEFAULT NULL COMMENT 'L''identifiant de l''équipe à laquelle l''utilisateur appartient',
  `rank_global` int(11) DEFAULT NULL COMMENT 'Le rang mondial de l''utilisateur',
  `rank_national` int(11) DEFAULT NULL COMMENT 'Le rang national de l''utilisateur',
  `flags_captured` int(11) DEFAULT NULL COMMENT 'Le nombre total de drapeaux capturés par l''utilisateur',
  `competitions_participated` int(11) DEFAULT NULL COMMENT 'Le nombre total de compétitions auxquelles l''utilisateur a participé',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'La date et l''heure de création de l''enregistrement (par défaut à la date et l''heure actuelles)',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'La date et l''heure de la dernière mise à jour de l''enregistrement (par défaut à la date et l''heure actuelles)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les informations des utilisateurs inscrits sur le site.';

-- Listage des données de la table ctfapi.users : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. website_statistics
CREATE TABLE IF NOT EXISTS `website_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'L''identifiant unique de la statistique (auto-incrémenté)',
  `total_users` int(11) DEFAULT NULL COMMENT 'Le nombre total d''utilisateurs inscrits sur le site',
  `total_teams` int(11) DEFAULT NULL COMMENT 'Le nombre total d''équipes inscrites sur le site',
  `total_flags_captured` int(11) DEFAULT NULL COMMENT 'Le nombre total de drapeaux capturés sur le site',
  `total_competitions` int(11) DEFAULT NULL COMMENT 'Le nombre total de compétitions organisées sur le site',
  `website_status` enum('on','off') NOT NULL COMMENT 'Le statut actuel du site (en ligne ou hors ligne)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'La date et l''heure de création de l''enregistrement (par défaut à la date et l''heure actuelles)',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'La date et l''heure de la dernière mise à jour de l''enregistrement (par défaut à la date et l''heure actuelles)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les statistiques du site web.';

-- Listage des données de la table ctfapi.website_statistics : ~0 rows (environ)

-- Listage de la structure de la table ctfapi. writeups
CREATE TABLE IF NOT EXISTS `writeups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du writeup',
  `user_id` int(11) NOT NULL COMMENT 'Identifiant de l''utilisateur qui a rédigé le writeup',
  `challenge_id` int(11) NOT NULL COMMENT 'Identifiant du challenge correspondant au writeup',
  `titre` varchar(255) NOT NULL COMMENT 'Titre du writeup',
  `contenu` text NOT NULL COMMENT 'Contenu du writeup',
  `date_creation` datetime NOT NULL COMMENT 'Date de création du writeup',
  `temps_lecture` int(11) NOT NULL COMMENT 'Temps de lecture estimé en minutes',
  `nb_commentaires` int(11) NOT NULL DEFAULT 0 COMMENT 'Nombre de commentaires sur le writeup',
  `nb_likes` int(11) NOT NULL DEFAULT 0 COMMENT 'Nombre de j''aime sur le writeup',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `writeups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `writeups_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table contenant les writeups des challenges';

-- Listage des données de la table ctfapi.writeups : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
