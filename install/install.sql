-- --------------------------------------------------------
-- Hôte:                         nas
-- Version du serveur:           5.5.42-MariaDB - Source distribution
-- Serveur OS:                   Linux
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour okovision
-- DROP DATABASE IF EXISTS `okovision`;
-- CREATE DATABASE IF NOT EXISTS `okovision` /*!40100 DEFAULT CHARACTER SET utf8 */;
-- USE `okovision`;


-- Export de la structure de table okovision. oko_saisons
DROP TABLE IF EXISTS `oko_saisons`;
CREATE TABLE IF NOT EXISTS `oko_saisons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saison` tinytext NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Export de données de la table okovision.oko_saisons: ~1 rows (environ)
DELETE FROM `oko_saisons`;
/*!40000 ALTER TABLE `oko_saisons` DISABLE KEYS */;
INSERT INTO `oko_saisons` (`id`, `saison`, `date_debut`, `date_fin`) VALUES
	(1, '2014-2015', '2014-09-01', '2015-08-30');
/*!40000 ALTER TABLE `oko_saisons` ENABLE KEYS */;


-- Export de la structure de table okovision. oko_dateref
DROP TABLE IF EXISTS `oko_dateref`;
CREATE TABLE IF NOT EXISTS `oko_dateref` (
  `jour` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table de reference des dates, sur 30ans a partir du 1er Septembre 2014';
/*!40000 ALTER TABLE `oko_dateref` ENABLE KEYS */;


-- Export de la structure de table okovision. oko_resume_day
DROP TABLE IF EXISTS `oko_resume_day`;
CREATE TABLE IF NOT EXISTS `oko_resume_day` (
  `jour` date NOT NULL,
  `tc_ext_max` decimal(3,1) DEFAULT NULL,
  `tc_ext_min` decimal(3,1) DEFAULT NULL,
  `conso_kg` decimal(6,2) DEFAULT NULL,
  `dju` decimal(6,2) DEFAULT NULL,
  `nb_cycle` int(1) unsigned zerofill DEFAULT '0',
  PRIMARY KEY (`jour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
DROP TABLE IF EXISTS `oko_historique`;
CREATE TABLE IF NOT EXISTS `oko_historique` (
  `oko_capteur_id` int(3) NOT NULL,
  `jour` date NOT NULL,
  `heure` time NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`oko_capteur_id`,`jour`,`heure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/

DROP TABLE IF EXISTS `oko_historique_full`;
CREATE TABLE IF NOT EXISTS `oko_historique_full` (
	`jour` DATE NOT NULL,
	`heure` TIME NOT NULL,
	`col_2` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_3` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_4` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_5` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_6` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_7` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_8` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_9` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_10` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_11` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_12` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_13` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_14` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_15` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_16` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_17` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_18` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_19` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_20` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_21` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_22` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_23` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_24` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_25` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_26` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_27` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_28` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_29` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_30` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_31` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_32` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_33` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_34` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_35` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_36` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_37` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_38` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_39` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_40` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_41` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_42` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_43` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_44` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_45` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_46` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_47` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_48` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_49` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_50` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_51` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_52` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_53` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_54` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_55` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_56` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_57` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_58` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_59` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_60` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_61` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_62` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_63` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_64` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_65` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_66` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_67` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_68` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_69` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_70` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_71` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_72` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_73` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_74` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_75` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_76` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_77` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_78` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_79` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_80` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_81` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_82` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_83` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_84` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_85` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_86` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_87` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_88` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_89` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_90` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_91` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_92` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_93` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_94` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_95` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_96` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_97` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_98` DECIMAL(6,2) NULL DEFAULT NULL,
	`col_99` DECIMAL(6,2) NULL DEFAULT NULL,
	PRIMARY KEY (`jour`, `heure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oko_graphe`;
CREATE TABLE IF NOT EXISTS `oko_graphe` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `position` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oko_capteur`;
CREATE TABLE IF NOT EXISTS `oko_capteur` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `position_column_csv` int(2) NOT NULL,
  `column_oko` int(2) NOT NULL,
  `original_name` mediumtext NOT NULL,
  `type` mediumtext DEFAULT NULL, /* tc_ext, tps_vis, tps_vis_pause, start_cycle */
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oko_asso_capteur_graphe`;
CREATE TABLE IF NOT EXISTS `oko_asso_capteur_graphe` (
  `oko_graphe_id` tinyint(3) NOT NULL,
  `oko_capteur_id` tinyint(3) NOT NULL,
  `position` tinyint(3) NOT NULL DEFAULT '0',
  `correction_effect` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;