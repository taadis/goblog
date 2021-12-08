# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.31)
# Database: blog
# Generation Time: 2021-09-07 13:59:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'法会','2021-08-15 14:09:06','2021-09-05 19:17:53'),
	(2,'放生','2021-08-15 14:09:31','2021-08-15 14:09:35'),
	(3,'素食','2021-08-15 14:09:42','2021-08-15 14:09:42');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ident` varchar(20) NOT NULL DEFAULT '''''',
  `title` varchar(100) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `ident`, `title`, `content`)
VALUES
	(1,'about','关于我','### 佛语'),
	(2,'read','阅读清单','### 随缘');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `is_top` tinyint(1) NOT NULL DEFAULT '0',
  `tag_ids` json NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `description` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO `post` (`id`, `title`, `status`, `created_at`, `updated_at`, `category_id`, `is_top`, `tag_ids`, `views`, `description`)
VALUES
	(10,'佛语',1,'2021-09-07 21:48:15','2021-09-07 21:48:15',1,0,0,1,'一些内容');

/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_content`;

CREATE TABLE `post_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `post_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `post_content` WRITE;
/*!40000 ALTER TABLE `post_content` DISABLE KEYS */;

INSERT INTO `post_content` (`id`, `content`, `post_id`)
VALUES
	(17,'有缘人...',10);

/*!40000 ALTER TABLE `post_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;

INSERT INTO `tag` (`id`, `name`, `count`, `created_at`, `updated_at`)
VALUES
	(1,'PHP',1,'2021-08-15 22:20:14','2021-08-15 22:20:17'),
	(2,'Go',2,'2021-08-15 23:39:18','2021-08-15 23:39:18'),
	(3,'Nginx',1,'2021-08-15 23:39:26','2021-08-15 23:39:26'),
	(4,'Mysql',1,'2021-08-15 23:39:33','2021-08-15 23:39:33'),
	(5,'Redis',1,'2021-08-15 23:39:40','2021-08-15 23:39:40'),
	(6,'Kafka',1,'2021-08-15 23:39:46','2021-08-15 23:39:46'),
	(7,'ElasticSearch',1,'2021-08-15 23:39:58','2021-08-17 22:17:40'),
	(8,'Mogodb',1,'2021-08-17 22:17:39','2021-08-17 22:17:41'),
	(9,'Java',1,'2021-08-17 22:17:50','2021-08-17 22:17:50'),
	(10,'Memcache',1,'2021-08-17 22:18:02','2021-08-17 22:18:02'),
	(11,'Laravel',1,'2021-08-17 22:19:13','2021-08-17 22:19:13'),
	(12,'ELK',1,'2021-08-17 22:19:20','2021-08-17 22:19:20'),
	(13,'haha',0,'2021-09-05 00:37:06','2021-09-05 00:37:56'),
	(14,'hehe',0,'2021-09-05 00:37:14','2021-09-05 00:37:57'),
	(15,'go',0,'2021-09-05 00:38:44','2021-09-05 00:38:44'),
	(16,'go',0,'2021-09-05 00:38:44','2021-09-05 00:38:44'),
	(17,'go',0,'2021-09-05 00:38:44','2021-09-05 00:38:44'),
	(18,'a',0,'2021-09-05 00:43:03','2021-09-05 00:43:03'),
	(19,'',0,'2021-09-07 21:48:15','2021-09-07 21:48:15');

/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `email`, `password`)
VALUES
	(1,'admin@taadis.com','$2a$08$Y6d32US/4pvvPR9Pau1tp.YYe.w0pUM3f7GRuSR8FfSmbJVoAOTGO');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
