-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 03 mai 2021 à 07:33
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk_medas`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(4, 'items', 2, 1, 'Monsieur Pichon', 'Monsieur Pichon\nProfesseur de Mathématique\nPorte des Alpes\nE184'),
(5, 'items', 2, 1, 'Louise Opiot', 'Louise Opiot\nAgent d\'entretien\nBerges du Rhône'),
(6, 'items', 2, 1, 'Mila Sarandi', 'Mila Sarandi\nEtudiante en philosophie\nPorte des Alpes\nD895\nLicence\nhttps://fr.wikipedia.org/wiki/Licence_(grade_universitaire) Licence universitaire\nID0654895233642E22'),
(7, 'items', 2, 1, 'Université Lumière Lyon 2', 'Université Lumière Lyon 2\nhttps://www.univ-lyon2.fr/ Site officiel :\nUne très bonne université en France\n45896'),
(8, 'items', 2, 1, 'Classe C453', 'Classe C453\nMéDAS 1\nBerge du Rhône\nMaster\n16'),
(9, 'items', 2, 1, 'L3_D144', 'L3_D144\nGiscard Destin\n15,6\nBerges-du-Rhône\nHistoire de l\'art\nSémiotique du langage'),
(10, 'items', 2, 1, 'M2_A026', 'M2_A026\nJacques Chilax\n12,03\nPortes-des-Alpes\nSémiotique du langage\nMathématiques'),
(11, 'items', 2, 1, 'L2_B325', 'L2_B325\nJack Long\n13,50\nPortes-des-Alpes\nHistoire de l\'art\nMathématiques'),
(12, 'items', 2, 1, 'Ségolène Imperial', 'Ségolène Imperial\nProfesseur\n1333,33€\n12 rue des avenues blanches, LYON\nsego.impe@univ.fr'),
(13, 'items', 2, 1, 'Martine Aucomté', 'Martine Aucomté\nCuisinière Resto U\n4963,00€\n99 avenue des boulevards verts, BRON\nmart.cont@univ.fr'),
(14, 'items', 2, 1, 'Marine Thegomme', 'Marine Thegomme\nDocumentaliste\n1231,10€\n28 boulevard des rues bleues, VENISSIEUX\nmari.gom@univ.fr'),
(15, 'items', 2, 1, 'Distributeur boisson n°6', 'Distributeur boisson n°6\nMachine à café et à soupe à la tomate\nDistributeur\nNon\nCampus PDA - Bat L'),
(16, 'items', 2, 1, 'Terrain de rugby', 'Terrain de rugby\nDisponible le lundi et le jeudi (sur réservation)\nEquipement sportif\nOui\nCampus PDA - Extérieur'),
(17, 'items', 2, 1, 'Studio d\'enregistrement', 'Studio d\'enregistrement\nStudio pour enregistrements musicaux. Inclus micros, logiciels de montages et table de mixage\nLocal\nOui\nCampus BDR - Bat I'),
(18, 'items', 2, 1, 'Mathématiques', 'Mathématiques\nCampus BDR - Bat A\nJames Léchifres\n8,7'),
(19, 'items', 2, 1, 'Histoire de l\'art', 'Histoire de l\'art\nCampus BDR - Bat H\nStéphanie Bern\n18,00'),
(20, 'items', 2, 1, 'Sémiotique du langage', 'Sémiotique du langage\nCampus PDA - Bat R\nHélèm Uette\n15,4'),
(21, 'items', 2, 1, 'Philippine Etchebest', 'Philippine Etchebest\n85 rue gourmand, LYON\nphil.etch@univ.fr\nL2_B325'),
(22, 'items', 2, 1, 'Pierre Bocuse', 'Pierre Bocuse\n66 boulevard des bouchons, LYON\npier.boc@univ.fr\nL3_D144'),
(23, 'items', 2, 1, 'Jeane-Françoise Piège', 'Jeane-Françoise Piège\n34 rue de l\'assiette, VILLEURBANE\nJeaFra.pieg@univ.fr\nM2_A026');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`) VALUES
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(12, 1),
(13, 1),
(14, 1),
(21, 1),
(22, 1),
(23, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T23:57:38+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-02T23:57:38+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 23:57:38', '2021-05-02 23:57:38'),
(2, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T23:58:45+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-02T23:58:45+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 23:58:45', '2021-05-02 23:58:45'),
(3, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T23:59:09+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-02T23:59:09+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 23:59:09', '2021-05-02 23:59:09'),
(4, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T00:03:44+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T00:03:44+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 00:03:44', '2021-05-03 00:03:44'),
(5, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T00:03:48+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T00:03:48+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 00:03:48', '2021-05-03 00:03:48'),
(6, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"191\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T00:04:25+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T00:04:25+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 00:04:25', '2021-05-03 00:04:25'),
(7, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T00:06:43+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T00:06:43+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 00:06:43', '2021-05-03 00:06:43'),
(8, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"114\"],\"resource_template_id\":[\"8\"],\"item_set_id\":[\"\"],\"owner_id\":\"2\"}},\"action\":\"add\"}', '2021-05-03T00:07:20+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T00:07:20+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 00:07:19', '2021-05-03 00:07:20'),
(9, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"remove_all\"}', '2021-05-03T07:21:36+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:21:36+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:21:36', '2021-05-03 07:21:36'),
(10, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T07:23:16+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:23:16+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:23:16', '2021-05-03 07:23:16'),
(11, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T07:23:48+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:23:48+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:23:48', '2021-05-03 07:23:48'),
(12, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T07:26:00+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:26:00+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:26:00', '2021-05-03 07:26:00'),
(13, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T07:29:16+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:29:16+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:29:15', '2021-05-03 07:29:16'),
(14, 2, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T07:29:38+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-05-03T07:29:38+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 D:\\Documents\\Master MEDAS - CNAM\\MAMP\\htdocs\\omeka-s_MEDAS\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 07:29:38', '2021-05-03 07:29:38');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('24xE6Igc70GtCMIVS4aF99w3dKBeX3AE', 2, '2021-03-09 10:21:07', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, NULL, 5, 'classes', 'classes', NULL),
(186, NULL, 5, 'campus', 'campus', 'Πανεπιστημιούπολη εννοείται κάθε πολεοδομικό συγκρότημα που προσφέρει οικιστικές, διδακτικές και ερευνητικές διευκολύνσεις στους φοιτητές ενός πανεπιστημίου.'),
(187, NULL, 5, 'student', 'student', NULL),
(188, NULL, 5, 'grades', 'grades', NULL),
(189, 2, 7, 'moyenne', 'moyenne', NULL),
(190, 2, 7, 'adresse', 'adresse', NULL),
(191, 2, 7, 'professeur', 'professeur', NULL),
(192, 2, 7, 'profession', 'profession', NULL),
(193, 2, 7, 'nom', 'nom', NULL),
(194, 2, 7, 'salaire_net', 'salaire net', NULL),
(195, 2, 7, 'email', 'courriel', NULL),
(196, 2, 7, 'nature', 'nature', NULL),
(197, 2, 7, 'gratuité', 'gratuité', NULL),
(198, 2, 7, 'localisation', 'localisation', NULL),
(199, 2, 7, 'classe', 'classe', NULL),
(200, NULL, 7, 'héberge', 'héberge', NULL),
(201, NULL, 7, 'acommecours', 'a comme cours', NULL),
(202, NULL, 7, 'acommeclasse', 'a comme classe', NULL),
(203, NULL, 7, 'utilisecommeservice', 'utilise comme service', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 2, 107, 4, NULL, 'Monsieur Pichon', 1, '2021-03-22 22:46:34', '2021-03-22 22:46:34', 'Omeka\\Entity\\Item'),
(5, 2, 101, 4, NULL, 'Louise Opiot', 1, '2021-03-22 22:48:49', '2021-03-22 22:48:49', 'Omeka\\Entity\\Item'),
(6, 2, 94, 4, NULL, 'Mila Sarandi', 1, '2021-03-22 22:52:20', '2021-03-22 22:52:20', 'Omeka\\Entity\\Item'),
(7, 2, 106, 4, NULL, 'Université Lumière Lyon 2', 1, '2021-03-22 22:55:32', '2021-03-22 22:55:32', 'Omeka\\Entity\\Item'),
(8, 2, 97, 4, NULL, 'Classe C453', 1, '2021-03-22 23:02:49', '2021-03-22 23:02:49', 'Omeka\\Entity\\Item'),
(9, 2, 114, 5, NULL, 'L3_D144', 1, '2021-04-19 23:25:32', '2021-04-20 08:11:40', 'Omeka\\Entity\\Item'),
(10, 2, 114, 5, NULL, 'M2_A026', 1, '2021-04-19 23:27:15', '2021-04-20 08:11:02', 'Omeka\\Entity\\Item'),
(11, 2, 114, 5, NULL, 'L2_B325', 1, '2021-04-19 23:29:10', '2021-04-20 08:10:05', 'Omeka\\Entity\\Item'),
(12, 2, 115, 6, NULL, 'Ségolène Imperial', 1, '2021-04-19 23:31:25', '2021-05-03 00:09:29', 'Omeka\\Entity\\Item'),
(13, 2, 115, 6, NULL, 'Martine Aucomté', 1, '2021-04-19 23:38:28', '2021-05-03 00:09:13', 'Omeka\\Entity\\Item'),
(14, 2, 115, 6, NULL, 'Marine Thegomme', 1, '2021-04-19 23:42:06', '2021-05-03 00:08:53', 'Omeka\\Entity\\Item'),
(15, 2, 116, 7, NULL, 'Distributeur boisson n°6', 1, '2021-04-19 23:43:53', '2021-04-19 23:43:53', 'Omeka\\Entity\\Item'),
(16, 2, 116, 7, NULL, 'Terrain de rugby', 1, '2021-04-19 23:45:54', '2021-04-19 23:45:54', 'Omeka\\Entity\\Item'),
(17, 2, 116, 7, NULL, 'Studio d\'enregistrement', 1, '2021-04-19 23:48:33', '2021-04-19 23:48:33', 'Omeka\\Entity\\Item'),
(18, 2, 117, 8, NULL, 'Mathématiques', 1, '2021-04-19 23:50:13', '2021-04-19 23:50:13', 'Omeka\\Entity\\Item'),
(19, 2, 117, 8, NULL, 'Histoire de l\'art', 1, '2021-04-19 23:51:35', '2021-04-19 23:51:35', 'Omeka\\Entity\\Item'),
(20, 2, 117, 8, NULL, 'Sémiotique du langage', 1, '2021-04-19 23:53:11', '2021-04-19 23:53:11', 'Omeka\\Entity\\Item'),
(21, 2, 118, 9, NULL, 'Philippine Etchebest', 1, '2021-04-19 23:55:17', '2021-05-03 00:08:38', 'Omeka\\Entity\\Item'),
(22, 2, 118, 9, NULL, 'Pierre Bocuse', 1, '2021-04-19 23:56:43', '2021-05-03 00:08:23', 'Omeka\\Entity\\Item'),
(23, 2, 118, 9, NULL, 'Jeane-Françoise Piège', 1, '2021-04-19 23:59:13', '2021-05-03 00:05:36', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 2, 5, 'University', 'university', NULL),
(107, NULL, 5, 'Professor', 'professor', NULL),
(114, 2, 7, 'classe', 'classe', NULL),
(115, 2, 7, 'employee', 'employé', NULL),
(116, 2, 7, 'service', 'service', NULL),
(117, 2, 7, 'cours', 'cours', NULL),
(118, 2, 7, 'student', 'étudiant', NULL),
(119, 2, 7, 'campus', 'campus', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(4, 2, 106, NULL, NULL, 'University'),
(5, 2, 114, NULL, NULL, 'Classes'),
(6, 2, 115, NULL, NULL, 'Employes'),
(7, 2, 116, NULL, NULL, 'Services'),
(8, 2, 117, NULL, NULL, 'Cours'),
(9, 2, 118, NULL, NULL, 'Etudiants');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0),
(27, 4, 1, NULL, NULL, 1, NULL, 0, 0),
(28, 4, 4, NULL, NULL, 2, NULL, 0, 0),
(29, 4, 186, NULL, NULL, 3, NULL, 0, 0),
(30, 4, 185, NULL, NULL, 4, NULL, 0, 0),
(31, 4, 188, NULL, NULL, 5, NULL, 0, 0),
(32, 4, 187, NULL, NULL, 6, NULL, 0, 0),
(33, 5, 189, NULL, NULL, 3, NULL, 0, 0),
(34, 5, 191, NULL, NULL, 2, NULL, 0, 0),
(35, 5, 186, NULL, NULL, 4, NULL, 0, 0),
(37, 6, 192, NULL, NULL, 2, NULL, 0, 0),
(38, 6, 194, NULL, NULL, 3, NULL, 0, 0),
(39, 6, 190, NULL, NULL, 4, NULL, 0, 0),
(40, 6, 195, NULL, NULL, 5, NULL, 0, 0),
(42, 7, 4, NULL, NULL, 2, NULL, 0, 0),
(43, 7, 196, NULL, NULL, 3, NULL, 0, 0),
(44, 7, 197, NULL, NULL, 4, NULL, 0, 0),
(45, 7, 198, NULL, NULL, 5, NULL, 0, 0),
(46, 8, 1, NULL, NULL, 1, NULL, 0, 0),
(47, 8, 198, NULL, NULL, 2, NULL, 0, 0),
(48, 8, 191, NULL, NULL, 3, NULL, 0, 0),
(49, 8, 189, NULL, NULL, 4, NULL, 0, 0),
(52, 9, 190, NULL, NULL, 2, NULL, 0, 0),
(53, 9, 195, NULL, NULL, 3, NULL, 0, 0),
(54, 5, 1, NULL, NULL, 1, NULL, 0, 0),
(55, 6, 1, NULL, NULL, 1, NULL, 0, 0),
(56, 9, 1, NULL, NULL, 1, NULL, 0, 0),
(57, 7, 1, NULL, NULL, 1, NULL, 0, 0),
(58, 5, 201, NULL, NULL, 5, NULL, 0, 0),
(59, 9, 202, NULL, NULL, 4, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('3a22de4ffeb0e86d990421d13a6b7a75', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353238343937312e31353433313439393438313230313137313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226433336536313837363336666163653939643635313964646439366533396438223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353238383433393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223162663262653963346262656630323530666261613064393737356366356637223b733a33323a223132643963323864326338363062326136303032353734626261326266373631223b7d733a343a2268617368223b733a36353a2231326439633238643263383630623261363030323537346262613262663736312d3162663262653963346262656630323530666261613064393737356366356637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1615284971),
('3f3eecfa5db662f9769cf4b2cfb984d4', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383930363330382e3332323838353033363436383530353835393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226364653332343165306461393264303364313566333733396632623164303030223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383837363137313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383930393235353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383930393930393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383930393430303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383930393837333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383930393237313b7d7d72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d656461732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226263313832326631396264323466303963666264643865323562396531383839223b733a33323a223033616664633834333931613933616135643865383062306131363533353632223b7d733a343a2268617368223b733a36353a2230336166646338343339316139336161356438653830623061313635333536322d6263313832326631396264323466303963666264643865323562396531383839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223136626436663832336130303531646364336336656637363663303132616332223b733a33323a223862326164393832303163336366663539623235393461323239663161353733223b7d733a343a2268617368223b733a36353a2238623261643938323031633363666635396232353934613232396631613537332d3136626436663832336130303531646364336336656637363663303132616332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333131323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33353a7b733a33323a223932643132656265373364313339363839646361393062323864353737363437223b733a33323a223965386461356139373730393233373631333936393065366461363437376164223b733a33323a226662376164333035373432626464316139666364626462326433336564663862223b733a33323a226133616437313332663963636433386233366336613831333330306430393061223b733a33323a223362353634373563623132373462393235636538383139323933306661363263223b733a33323a226236376538396431303761326362396430653033353861633239366262643562223b733a33323a223839393434646532613162343530333362646362613264343563303061616136223b733a33323a226134306366313864656464643266643563633534646639323538326366333439223b733a33323a226538343634396662356234343236306337346431663834323533316531653637223b733a33323a223063333139323032343237346638343633643065643165363761343337623531223b733a33323a223532356131323864393064306435626539643335316437356138643138333734223b733a33323a226431643438623730616539343634633235383330353139323336643335666339223b733a33323a223663386133653334376631393839346264396666643332363732613138373339223b733a33323a226132663563636462356364396433653562306632633462653264313337613837223b733a33323a223636363934316331616530376635306236353933303064386336306238343438223b733a33323a223332623134353464303039623266316266303539343565653765353837386638223b733a33323a226330343564316134613936613532626131663561633531393264663037393739223b733a33323a226161313832653336333964383866653430356162613433613963313739663263223b733a33323a223834616233626633343965323539356132666566333830636631653765646232223b733a33323a226465366539666238656265356134653335323430363063306333383966626666223b733a33323a223036313265366462646639383465333565313030383337396661386664346439223b733a33323a226562333735613933323633323832333732323632653431646565633031313335223b733a33323a223233643532356436396166633732306238616662663735333436353935336435223b733a33323a226361623735613431303434663166343961346361613231613162326436303664223b733a33323a226365393865323935653733643530343433383162626637356365373237323033223b733a33323a226363653734393834316336666632336661633565656333396162313966643134223b733a33323a223565666631663862343736626232346636653632306432343962343863336632223b733a33323a223561616638353465613664373935643533326135373966386236633739353664223b733a33323a223635326131326666663266316337646537623633653031343265636330346239223b733a33323a226534313432376439333762383230306130383663613632303065333137663737223b733a33323a223761323064663432393532616333393061333839303063616434396239386136223b733a33323a223862623634336333636562376537353365616634353230316437363137336635223b733a33323a226431323236646535343133393334663662643233393062356337663034373939223b733a33323a223539663561343663376633333031613434376463666336363561373435373334223b733a33323a223038356137376437326336326238323866356133333162386163373464323932223b733a33323a223064646465383932313338393435363264616264623264323733643132663561223b733a33323a223934323239623533316466326233636263356163333163636232356635323834223b733a33323a223935336162386234343962313539396339663436316532613262633132343132223b733a33323a223831616537323339623034643263633034663037376366613762353863616364223b733a33323a223437333030373935303736386462333861353435386165363861643661376563223b733a33323a223637663339636535613330303835663861373534366531646463356336353935223b733a33323a226564313766366432363538393565383234636534326366313133323633383331223b733a33323a223663613932363064313431393964613738633430653737353036383366616363223b733a33323a223865393739656464393031323963666236316263656666633739663964353931223b733a33323a226563626161393735643932376364316435653732353139643366663763616564223b733a33323a226333353631666339643631643730383932353135393537643936376339643834223b733a33323a223866666235336461343661313030653964336634616164663836316430656230223b733a33323a223437353063656162633635663231303235613534373636333234623033363336223b733a33323a226533626138626638383739653833326361366564626232373364653265633731223b733a33323a223133363734643563653339613062623166636136356631393965613566353566223b733a33323a223137373164643666396531356236653831366162353236303264383330613261223b733a33323a223761623034393361363636323139633834303532396266323065643232303461223b733a33323a223165313636333064333230643634383631303532393131363639653538323438223b733a33323a223463613738616266643638343965373865343537343666623534633036313365223b733a33323a226361633732396465386137313839376461393932643762303831633733643632223b733a33323a223739383539393832323162326533643038353263643939613266353737653935223b733a33323a223166346332633566363631343831363864323863376233393536636165386536223b733a33323a226632303933353639323466396631616334393634326564346135356364636362223b733a33323a223636626330376566343765393135346531353636313731373834623235356662223b733a33323a223338333766303834386166323236396232666530643035313935336133326437223b733a33323a223765623530383466303537613163376333623233353263623830646634306264223b733a33323a226633613766353637356463626539353532323031313665346630323166626131223b733a33323a223437343961613539366333633066633736383930346364353732326436373931223b733a33323a223139376339663762336136336531616533366136363232343965626262306632223b733a33323a226361333165656431323361386334393035363666643462613266316335643436223b733a33323a226535333036613938333334623238306333646562366239663932306630666633223b733a33323a223734393634636464383535323339393263626433376637343732376564666135223b733a33323a223139643563643663336239383339326536363262363665353836366261613635223b733a33323a223936663536666134653538376436366431346264306466633739653535626139223b733a33323a223639333032653138343663326630613331323332653835343063393362323166223b7d733a343a2268617368223b733a36353a2236393330326531383436633266306133313233326538353430633933623231662d3936663536666134653538376436366431346264306466633739653535626139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223939613966623661656262333535316230376133326131613630316466663838223b733a33323a223862353132363437373737653630383839643466623161663938363632663032223b733a33323a226265623635666233326433666537393538613233656238343839346139356661223b733a33323a226562306134353936666137613735393764623130643065366639346162336361223b733a33323a226464316361613962393336626161383535653162393964646239303464633463223b733a33323a223362663537666336306135393233353036343338333531313137623433366439223b7d733a343a2268617368223b733a36353a2233626635376663363061353932333530363433383335313131376234333664392d6464316361613962393336626161383535653162393964646239303464633463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313033313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223961373561326239306163346464323164336664663564313634616335326636223b733a33323a223236333635303835613636303734626532393866323164373133396234376263223b733a33323a223061353233653664323934376331343765666238653462666166313231656163223b733a33323a226632653431306662376562333762623862383337383566663739386638323763223b733a33323a223538306634343965656436336638316130383661623434356434353536303037223b733a33323a223865663439393730396131646534633338323964656635326430313162643938223b733a33323a223330313961613761613531633539633661346130326232376634653139616135223b733a33323a226330383331663466303233336135613233653832653934343536336638663763223b733a33323a226663333235323966633237323235653836643835666235313335383365313039223b733a33323a226366626130626430623865616565313265643566353261383762323364663436223b733a33323a223438643937363731366464346332336533653862323339366232366633333965223b733a33323a226235343463633161316439366334373033326333643639616531323133326633223b733a33323a226436643332303261376463653034663364373163616137383361356261366662223b733a33323a223331653235623438636562363037356630623638353166316335303266626665223b733a33323a223837623461366633356462383633343830616566636231636639333133373462223b733a33323a226430366165363932306337623563666461363634616561373131363239613332223b733a33323a226433643631383465303565643965616634636565666565623762653231313861223b733a33323a226431633632363036636537623139303635373462346136353837303731373538223b7d733a343a2268617368223b733a36353a2264316336323630366365376231393036353734623461363538373037313735382d6433643631383465303565643965616634636565666565623762653231313861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223835346661373635303138383334626339366165643462626137386230646463223b733a33323a226533323931303766316232653439336161353564383139333531393033613633223b7d733a343a2268617368223b733a36353a2265333239313037663162326534393361613535643831393335313930336136332d3835346661373635303138383334626339366165643462626137386230646463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618906309),
('56792ca71d4d9ce3677b82c4b199a3e2', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353238353835352e313538373937303235363830353431393932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226630383333303630626631343066356266346466646139313631313761326463223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353238393431373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223739613863653434633264373865623562613335643534626566383935313530223b733a33323a223736663636303966383539356638643064356431353936663161623461306264223b7d733a343a2268617368223b733a36353a2237366636363039663835393566386430643564313539366631616234613062642d3739613863653434633264373865623562613335643534626566383935313530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1615285855),
('6912cdda92e29bb34b48475843f1618a', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631363439353839352e37313633363239353331383630333531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223439613533313731336630643732356438643565633337343835343933323964223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435323530373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363439343633373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435353939353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363439393439363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435353535323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631363439393435343b7d7d72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f4d454441532f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226131363335653537386466663032396661653438313631326465316464346162223b733a33323a226664343337363564323131303134626436356237363032343538363966316338223b7d733a343a2268617368223b733a36353a2266643433373635643231313031346264363562373630323435383639663163382d6131363335653537386466663032396661653438313631326465316464346162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226434316465373664353464343036306562643530356161356533346439623539223b733a33323a223133613535383235386238343235643463623038316234306561643037353738223b7d733a343a2268617368223b733a36353a2231336135353832353862383432356434636230383162343065616430373537382d6434316465373664353464343036306562643530356161356533346439623539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226231633536376230643064333663633162666466646639303339323562376365223b733a33323a223963333530613230646230323365323162343638383530306665346664323934223b733a33323a226665373436303765336139373838393532316531623234666339383536393561223b733a33323a223165653131343331373433316661326562613734646238653366643266366238223b733a33323a223938363663306135643632643662343830393035623262633137623736366137223b733a33323a226430396465653862383835623936316234636365323236363031653430336634223b733a33323a223737623633306433303761366639643763336638343736343963346537383063223b733a33323a223132653565613634323766663737376436633430613238613361343563616463223b7d733a343a2268617368223b733a36353a2231326535656136343237666637373764366334306132386133613435636164632d3737623633306433303761366639643763336638343736343963346537383063223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3935313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223265393565353464326261613339373239303661383532623565356632663836223b733a33323a223330613362633639643830383961613763383632663339323135663736613539223b733a33323a226532393732373436326430656133313162616461383965666431623432393365223b733a33323a223438316634323337326533653262613864363830353430316637626561383835223b733a33323a223031643531626439373935366436383939306664633732366634303933666461223b733a33323a223233376265353534313833343061633935393331373065326165393432366161223b733a33323a226531623431613666316331623465356663373238353863333038386234303539223b733a33323a223635303135623030346339383761383966323030623932303336323135383135223b733a33323a223963386232643766353766623733363337376366633965626639313533353435223b733a33323a223339393266386362386666626436383132343632383836383834616537303461223b733a33323a223637306364643437663039336432353130613438666334303736343134623937223b733a33323a226433353534333264653363653063323065616336646538376135333338623237223b733a33323a226565353231393861363838333733663962333964346433616232306230373062223b733a33323a223566646662303762353534353436663066646534396663323861633463366237223b733a33323a226234636566633265633836666530626666643337643865663432663861313661223b733a33323a223363616430303166363766316430393966653831376231353239303430616531223b7d733a343a2268617368223b733a36353a2233636164303031663637663164303939666538313762313532393034306165312d6234636566633265633836666530626666643337643865663432663861313661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226237653565363966653839393365313265383732303433343932346565616538223b733a33323a226438396235363034393366333738633831613563633833336365386131663862223b733a33323a223834623164353861663732383965306264636166643435613039643139643631223b733a33323a223031323236306539363765333966623666313064376438653461656261313664223b733a33323a223666633861373963383634336431366664396635353461306233666636626566223b733a33323a226436386634363966303336326263373065383566373631353938303862376463223b733a33323a226261373736343134313663336639623465366430356337363664626264626263223b733a33323a226235343037653764653361353362396634376632306637623934663638393232223b733a33323a223330343765316563313230353433346335646431633465353235656465616363223b733a33323a226638323138666635333965636232316265643666306436626234653466653863223b733a33323a223965333831346234386666613466613034363162393561303935313837656262223b733a33323a223362613630613933356537343364366133656263303161366137393964653562223b733a33323a223634376330376161316234633939656430363535386136303864613764336538223b733a33323a223465643939366662613332656237636531363936616136353039663337316166223b7d733a343a2268617368223b733a36353a2234656439393666626133326562376365313639366161363530396633373161662d3634376330376161316234633939656430363535386136303864613764336538223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223630346238623536356563393233303335396436346130313930393036333263223b733a33323a223965323439636561313434363138383664666161333730353361653264303463223b733a33323a223864363731383332353532623666353663356663633439326430333365653764223b733a33323a226535663730616137373238646662363334356634613237626164663234623634223b7d733a343a2268617368223b733a36353a2265356637306161373732386466623633343566346132376261646632346236342d3864363731383332353532623666353663356663633439326430333365653764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1616495896),
('876013ff886224069e485bace5440e94', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353238353831372e333739353335393133343637343037323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223634636161353737396461373235633930646438623033383263326561613861223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353238383537313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353238393131323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353238393231373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223337646561633162656363393364613462643835346439353562373835383639223b733a33323a223631363437323935376431346361326637343962386230626132636234643232223b7d733a343a2268617368223b733a36353a2236313634373239353764313463613266373439623862306261326362346432322d3337646561633162656363393364613462643835346439353562373835383639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223235653737633466353332613033353835646136333530396639323938383034223b733a33323a223931323461346131343766343630313134653139313837376439633762343737223b733a33323a223964313038356134313231656231613739353630396339316432386135376430223b733a33323a223638636264393433376539336531366430323737333137323763613261363933223b733a33323a223363393534626565393662623765333030376562646336313137353866663936223b733a33323a223334666335363839363162383637363066623861343838343533326436663936223b733a33323a223537393839376131373338343762616231333964363562343637643964333636223b733a33323a223065623437316531343633623766643034306261626333613265393162303763223b7d733a343a2268617368223b733a36353a2230656234373165313436336237666430343062616263336132653931623037632d3537393839376131373338343762616231333964363562343637643964333636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223335636633666139303335303631336638623438393866663938643733663936223b733a33323a226232393438656564313130343166386131343637323764623330373033633238223b733a33323a223833303531383561353761653935393831303434333439653063616164356531223b733a33323a223865616466663433616161656331646462336538323332623633613730633763223b733a33323a223263303430303462396331336361633135633661303538653161653533643033223b733a33323a226632626565613135346262623632633539363464326363636563386139356533223b7d733a343a2268617368223b733a36353a2266326265656131353462626236326335393634643263636365633861393565332d3263303430303462396331336361633135633661303538653161653533643033223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615285817);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('9d6c344e44032815b0a696819c34460f', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353535383433362e303833323437393030303039313535323733343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226663323437316339366632633130663133663762666538653437373432373031223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535373333393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353536323030393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353536323033363b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353536313332343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353536313733393b7d7d72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f4d454441532f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226366303831323830306534636138323430323266333263666532653736306232223b733a33323a223939653934663362383430313033386434326134346266326464373162333137223b7d733a343a2268617368223b733a36353a2239396539346633623834303130333864343261343462663264643731623331372d6366303831323830306534636138323430323266333263666532653736306232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313335323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226630313532333239393634313439336633646133653737643362393865333763223b733a33323a223232376539613065613132356431326131636231323264633336306433376163223b733a33323a223063383030383262333761636261663663333462633434393239323938646166223b733a33323a223666613138386563343665643835643736363738323862356161303434316136223b733a33323a223265323364303332636563366632313964346463373539343635653031623936223b733a33323a226437386131663165373433366231663338366662636632383830646563323439223b733a33323a223266396536323235383634383861353138666333326135633935613036373361223b733a33323a226534613035366237396432313531383834613536613635666238376365366638223b733a33323a226265616139656333356430653631393930656535656365633065333135396234223b733a33323a223135393039383336653633386562376138363937666434363163333632323465223b733a33323a223131643562633239303337316236336662303661323735306665623534306131223b733a33323a226631346331336430616631373037313765633330376635663939313432383666223b733a33323a223633376665363435663566346464393031306138333533313962653538383165223b733a33323a226632663831656362633539313936363232333066626533313437663564323437223b733a33323a223061356263326631646563666464373535613338623962633837636132323835223b733a33323a226263366138643666306538656337316239643137356639643761396561313162223b733a33323a226436653766366132333062376439616262636561383637376435333734616133223b733a33323a223134386161383165643764363963353936663462643833643334343064346438223b733a33323a223437373230313061643065333364653336636161376361613565323430363239223b733a33323a223130343966303435626465323562656431343864636130646336363666373765223b733a33323a223236613032616262346238643163633064336633613239303863646564353563223b733a33323a223731623361313666396539366531356635663332346531316230313861636333223b733a33323a223239386633623436373037646237373862643566363061643237323634666230223b733a33323a223739353836356636646139346432353635393639663564323530613264303231223b733a33323a226636306632646238663662373634316262363463353566626631303161393862223b733a33323a226266343139633262333135613665323439653631333430306639363139323532223b7d733a343a2268617368223b733a36353a2262663431396332623331356136653234396536313334303066393631393235322d6636306632646238663662373634316262363463353566626631303161393862223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333139323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33363a7b733a33323a223361396535323738356565323066333235353432626635383834356230336261223b733a33323a223131343136663766666137663930333965613339316365663861393038313338223b733a33323a223765383530393632326232623361633466333464396337393731353339363139223b733a33323a226535316536353239653931313139363834326162353563336237656563343835223b733a33323a223933333735623334306566386333353461373165313266346638323762396439223b733a33323a223862366535353966333035656166653462333863653734633531643437373030223b733a33323a226535353964616661653137396431313232656662303532303539376636353961223b733a33323a223533333138363339323136313966663830336234303665303165363537633637223b733a33323a223365316561353462323936626339393636353961326334626330383434373031223b733a33323a223734313763326633373637646339363231356239613863353230623137363734223b733a33323a223630623936373764373565626263396262616232663631656233316537636563223b733a33323a223936653333383531303466316261363032663236653366613563366235346439223b733a33323a223337393138646638643463663534356135326339393866383062323661626539223b733a33323a223632613235656563376130356162323663323637633961616131306266626361223b733a33323a226463366163303364626230366666313339393231303435383039353435303634223b733a33323a223262396337373965383966633532353063316437626263623137633533653837223b733a33323a223931333132316132373761343664636535626435643638353636346634303233223b733a33323a223538623830386666363762663166336363336363346166323361303333656436223b733a33323a223566323430383133343962646365646362306235346539616231333935313636223b733a33323a226334313164376561633634353230643765663366303565343664336662626431223b733a33323a223561383430333836613539363964346632373431333734663533643566613335223b733a33323a223033363662643561613937383731323135646134643133353034376131363133223b733a33323a226465356264656432373935323964313066316165663537643534646361353036223b733a33323a226637656131616630373631333439646561663635353465626661396436313833223b733a33323a226431396633323036616431373039646230316266373661373439353832333333223b733a33323a226135376532663633383061306661306661663038623533666363366437373137223b733a33323a226437633035396466326261663862363664343431343633333365366265633963223b733a33323a223937313937643463303763316237363437393162393465633738356335373966223b733a33323a223539656163666435323938663131613966313661336163346537316530653030223b733a33323a226435633631316366363666313066393836613965393462356236313333633166223b733a33323a223762313331396438336636623162363132656532396466306430363830663663223b733a33323a223061316264343037373865616531396261346437663530356635303733393665223b733a33323a223739386266316238343437386434663331626438646538393537386638633561223b733a33323a226465656462636431326362393163376239356363666434666131366236306561223b733a33323a223062303638666336346363373638383935636164346432396332383938356232223b733a33323a226665663363393134303161663132613961643530643762386334353838323439223b733a33323a223634376566336432386438376662623135393431343332616163646662646433223b733a33323a223964333738636334386238353336623865653963656236613730363966326439223b733a33323a226130643464646365666436613965393766313833326661363563376565626366223b733a33323a226261663833616361626238383961663237333933623038343834366662336539223b733a33323a223930663532643330303437616265616535393239386661633362383531383534223b733a33323a223632653466656632303464386332626266666263646665343538303634613264223b733a33323a223162333530373336353761383934323537363333626461626662353361346338223b733a33323a223765646136373462643137636632373436626634633762363464623232663036223b733a33323a223761383261356336396338396561386136303662373335613834656266643833223b733a33323a223864303639373630643134363430373763353132316361383339316538393638223b733a33323a223934623432343562343634333963376535643066653862623230393635303431223b733a33323a223565323765386535613166336562303635376331306630306263386239636131223b733a33323a223466633363363034313330383662363364323230643966306635633037626432223b733a33323a223837613033353936376534323538623334306430386463396639653830356539223b733a33323a223364316230333566636533336462663631353763633536663065656366303535223b733a33323a226263326566306637323063633337633537383639356162653130306136653435223b733a33323a226635313034373139386438626633323932633965626431633164386666353964223b733a33323a223330636462626437646366383131336635386363343134643437306532643636223b733a33323a223534653530393230613266646266616638373733373134333034643937653737223b733a33323a226438646362386265313565656337303663653535383239303662643837303236223b733a33323a223736613438383164373064323432646430653830616137653263306539353735223b733a33323a226365626638666165623364663034616661383763656366663830346564393239223b733a33323a223231643365323934653339353136366633616537353864383466313738373631223b733a33323a226234623639313538646437373837393438343232616534613337373661663433223b733a33323a223332666338636133666432353539323138303834643333373136626335656536223b733a33323a223565646231373534313736626265393931313733353938633066653930663831223b733a33323a226138323763313935623563383863316438633933613439616166356266666361223b733a33323a226263616136613264373839383863353037643739663134666363396364373132223b733a33323a223266346631323865333133336232643665613965353866343365666165343365223b733a33323a223234303165393136636539616537623662653762633461656165613535323934223b733a33323a226436633835343133636633646463623835306132393862396636396339663838223b733a33323a226466643762316437363564306434333235353338323366616564316463636136223b733a33323a223833393034336361393062356238343739336531336639643662383331383631223b733a33323a223966613235663031353635323035396562376437393337393039656434373462223b733a33323a223937626531623136626338663032356262346237306166373563643030663265223b733a33323a226337653835386165373962346365383566356662646235333933333965666236223b7d733a343a2268617368223b733a36353a2263376538353861653739623463653835663566626462353339333339656662362d3937626531623136626338663032356262346237306166373563643030663265223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226237303065346164356266356631343734613630393238303565663239613430223b733a33323a223233636135313137666265373637613436343266343331326431393266313066223b7d733a343a2268617368223b733a36353a2232336361353131376662653736376134363432663433313264313932663130662d6237303065346164356266356631343734613630393238303565663239613430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226464666639656437653937366366653562626261376130633865636130616635223b733a33323a226330346634613062306162373834623434323930323733613535306232353031223b7d733a343a2268617368223b733a36353a2263303466346130623061623738346234343239303237336135353062323530312d6464666639656437653937366366653562626261376130633865636130616635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615558436),
('b19a96b269e76c12b133cf641dfa1eb2', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303032363939322e353034323635303639393631353437383531353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226363323763313637636466333766346131393934653263306164643237663931223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393939363135363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303033303530363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033303530363b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033303539323b7d7d72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f4d454441532f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223565663939636139656366643265366634303332383561336365623434313732223b733a33323a226666386564323738626261383439373434363431616161636266393035366564223b7d733a343a2268617368223b733a36353a2266663865643237386262613834393734343634316161616362663930353665642d3565663939636139656366643265366634303332383561336365623434313732223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226535356164333762623033373739363664343737343033363139303164653762223b733a33323a226266666534646630616332613439633964356365366264616163613130376162223b733a33323a226138303535386333646430313161333065313765356434323630333136306336223b733a33323a223465363461653061636239656365646364393337313965653133306138616665223b733a33323a226333336439323032303331363536656361363966343834343939323934323233223b733a33323a223864643266623531663563336265313966316530646634613261303236313961223b733a33323a223030613038303336373462636433333136393635643763663835303233316532223b733a33323a226233643439343164633166376462363666376162343838383936623333636634223b733a33323a223235663166323130613939363137636238663433326235613461643964653930223b733a33323a223234633837366362353732623033363635613934623236363835376461363638223b733a33323a223430626361663066643635336263323866646332333232646638336237316130223b733a33323a226231633132613736386233663936383439643036393334376533363662303066223b733a33323a223162643536633531666136376334313135376332323430646566356432333530223b733a33323a223266363637386261383562356365326130333936633731633266643963646265223b7d733a343a2268617368223b733a36353a2232663636373862613835623563653261303339366337316332666439636462652d3162643536633531666136376334313135376332323430646566356432333530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313033313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223930626330663137336330633965333038373537623232613363366365633139223b733a33323a226234646439633833343262626665313162383031303535363433663037613333223b733a33323a223039653531663538343665303237633365323366303935653633313564326337223b733a33323a223964623934303338643830313130376265313831306332383636643135313363223b733a33323a223562343136663866333064613231303334316235656334613063636332653266223b733a33323a223465353565663136343765323861636530613565373263333663653166326535223b733a33323a223661666533626132366635313364663763633464306563373664663234373333223b733a33323a223633643535316434613635343166316637623031383534636630323338656536223b733a33323a223666316334316162636134336261316139353337613939363061396664336537223b733a33323a226366656363643062346465653732393463643461306138336535303036383666223b733a33323a223964313239343338333863353632383838363230303432653834613639376131223b733a33323a223866663139346532623662643231653136313565326339363239366163613837223b733a33323a226632393063613363386463383834363837346263393361393763333366343533223b733a33323a223738313265633963303433356330346238636537646234336432313634306262223b733a33323a226334333235353933646234343766303236356337613139643065336537346566223b733a33323a223433363366653333633934383630356465343137393932363334313363643863223b733a33323a223464383533396434333262393530666134366339643763353062663837313061223b733a33323a223732356162663832386464323362306166333837653962376434353566326265223b7d733a343a2268617368223b733a36353a2237323561626638323864643233623061663338376539623764343535663262652d3464383533396434333262393530666134366339643763353062663837313061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a226436326534653361373663336366363835396462646665656265663335663732223b733a33323a223163666135623563653363636663336436643934303139346132633165636633223b733a33323a226462346636633338626239373662643036383961623731343137643035646336223b733a33323a223065303566666438356339623631303631313933303761313137303461313234223b733a33323a223038346165386334336130393165656435613932613461346530643330386666223b733a33323a223536613235653130336264336530333137373137623530613938366265626262223b733a33323a223033376464616434356538616236363562613635616434316337363666663232223b733a33323a223166373030363965643462346539623364316436633533353964633163633361223b733a33323a226637623561663538346634393639313736333936396561303464303532356134223b733a33323a223766373136373537336335343230366139323663623837613833386465326530223b733a33323a223566653431663436616437323937373265363137333433323062646166623633223b733a33323a223230373638616664323564643264363666323964336263396165656432613664223b733a33323a223034373466653337313766386464333932633661633863353263643264306565223b733a33323a223432356163343937306462666563353065643439343137643836613064633739223b733a33323a223666386331303935623139623863303734656366323463303862306464623636223b733a33323a226136343765323865656430613564346532343866333365646263633131353937223b733a33323a226639646338653634323565663635383566613963633033353466343331653764223b733a33323a223062383262663735316232633832313262366530346463316335333836646533223b733a33323a223437626364636463363033363539316565383034316637323232333337376662223b733a33323a226138663134336431383430383031363338333964363563666339636536396262223b733a33323a226334623131613230366162643264333536363430663135363035383264383934223b733a33323a223137376365333633623337613630356261376461353763653232636634643034223b733a33323a226236336534623437643466613264323830393934623834353964323832353235223b733a33323a226339386265613862656537616265633336373538633566633164316132663162223b733a33323a223534373638353465303831373663366536613466663033346463363932353935223b733a33323a223066356236313565393638303837376337316166616531666461633938613063223b733a33323a226163363161346365333438326336373133653036326237666265303133613962223b733a33323a226339623530353637316563336138623236386634333433393365313665633535223b733a33323a226530626635323636663364383532643139316462323764376532653233383630223b733a33323a226136333431336663623330646530393034623034643661356462663163663465223b7d733a343a2268617368223b733a36353a2261363334313366636233306465303930346230346436613564626631636634652d6530626635323636663364383532643139316462323764376532653233383630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620026993);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"samuel.szoniecky@univ-paris8.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Mon universit\\u00e9\"'),
('locale', '\"fr\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('version', '\"3.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, 2, 'les-meilleurs-eleves-et-professeurs', 'default', 'Les meilleurs élèves et professeurs', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Parcourir\",\"query\":\"\"},\"links\":[]}]', '{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}', '2021-05-02 23:53:15', '2021-05-03 00:25:37', 1, 1),
(2, NULL, 2, 'test', 'default', 'test', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Parcourir\",\"query\":\"\"},\"links\":[]}]', '{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"1\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}', '2021-05-03 07:19:44', '2021-05-03 07:29:38', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Bienvenue', 1, '2021-05-02 23:53:15', '2021-05-02 23:53:15'),
(2, 2, 'welcome', 'Bienvenue', 1, '2021-05-03 07:19:44', '2021-05-03 07:19:44');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"Bienvenue sur votre nouveau site. Ceci est une page d\\u2019exemple.\"}', 1),
(2, 2, 'html', '{\"html\":\"Bienvenue sur votre nouveau site. Ceci est une page d\\u2019exemple.\"}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 2, 'admin'),
(2, 2, 2, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 1, '\"item\"'),
('browse_attached_items', 1, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('search_resource_names', 1, '[\"site_pages\",\"items\",\"item_sets\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"cross-site\"'),
('show_attached_pages', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-03-09 10:13:57', '2021-03-09 10:13:58', '$2y$10$omPjoRxzWIZHPR/alxDfi.87AZC1iffmAVdUEm927NLChqfjNbGCO', 'global_admin', 1),
(2, 'tom.blachon@gmail.com', 'Tom Blachon', '2021-03-09 10:21:06', '2021-03-09 10:26:57', '$2y$10$qIGo/.tFBEyAhB742/kaMuFF3.VO9VJKn0g3XUMBnYfSmKCGqECa6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('default_resource_template', 2, '\"\"'),
('locale', 2, '\"fr\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(10, 4, 1, NULL, 'literal', '', 'Monsieur Pichon', NULL, 1),
(11, 4, 4, NULL, 'literal', '', 'Professeur de Mathématique', NULL, 1),
(12, 4, 186, NULL, 'literal', '', 'Porte des Alpes', NULL, 1),
(13, 4, 185, NULL, 'literal', '', 'E184', NULL, 1),
(14, 5, 1, NULL, 'literal', '', 'Louise Opiot', NULL, 1),
(15, 5, 4, NULL, 'literal', '', 'Agent d\'entretien', NULL, 1),
(16, 5, 186, NULL, 'literal', '', 'Berges du Rhône', NULL, 1),
(17, 6, 1, NULL, 'literal', '', 'Mila Sarandi', NULL, 1),
(18, 6, 4, NULL, 'literal', '', 'Etudiante en philosophie', NULL, 1),
(19, 6, 186, NULL, 'literal', '', 'Porte des Alpes', NULL, 1),
(20, 6, 185, NULL, 'literal', '', 'D895', NULL, 1),
(21, 6, 188, NULL, 'literal', '', 'Licence', NULL, 1),
(22, 6, 188, NULL, 'uri', NULL, 'Licence universitaire', 'https://fr.wikipedia.org/wiki/Licence_(grade_universitaire)', 1),
(23, 6, 187, NULL, 'literal', '', 'ID0654895233642E22', NULL, 1),
(24, 7, 1, NULL, 'literal', '', 'Université Lumière Lyon 2', NULL, 1),
(25, 7, 1, NULL, 'uri', NULL, 'Site officiel :', 'https://www.univ-lyon2.fr/', 1),
(26, 7, 4, NULL, 'literal', '', 'Une très bonne université en France', NULL, 1),
(27, 7, 187, NULL, 'literal', '', '45896', NULL, 1),
(28, 8, 1, NULL, 'literal', '', 'Classe C453', NULL, 1),
(29, 8, 4, NULL, 'literal', '', 'MéDAS 1', NULL, 1),
(30, 8, 186, NULL, 'literal', '', 'Berge du Rhône', NULL, 1),
(31, 8, 188, NULL, 'literal', '', 'Master', NULL, 1),
(32, 8, 187, NULL, 'literal', '', '16', NULL, 1),
(33, 9, 1, NULL, 'literal', '', 'L3_D144', NULL, 1),
(34, 9, 191, NULL, 'literal', '', 'Giscard Destin', NULL, 1),
(35, 9, 189, NULL, 'literal', '', '15,6', NULL, 1),
(36, 9, 186, NULL, 'literal', '', 'Berges-du-Rhône', NULL, 1),
(37, 10, 1, NULL, 'literal', '', 'M2_A026', NULL, 1),
(38, 10, 191, NULL, 'literal', '', 'Jacques Chilax', NULL, 1),
(39, 10, 189, NULL, 'literal', '', '12,03', NULL, 1),
(40, 10, 186, NULL, 'literal', '', 'Portes-des-Alpes', NULL, 1),
(41, 11, 1, NULL, 'literal', '', 'L2_B325', NULL, 1),
(42, 11, 191, NULL, 'literal', '', 'Jack Long', NULL, 1),
(43, 11, 189, NULL, 'literal', '', '13,50', NULL, 1),
(44, 11, 186, NULL, 'literal', '', 'Portes-des-Alpes', NULL, 1),
(45, 12, 1, NULL, 'literal', '', 'Ségolène Imperial', NULL, 1),
(46, 12, 192, NULL, 'literal', '', 'Professeur', NULL, 1),
(47, 12, 194, NULL, 'literal', '', '1333,33€', NULL, 1),
(48, 12, 190, NULL, 'literal', '', '12 rue des avenues blanches, LYON', NULL, 1),
(49, 12, 195, NULL, 'literal', '', 'sego.impe@univ.fr', NULL, 1),
(50, 13, 1, NULL, 'literal', '', 'Martine Aucomté', NULL, 1),
(51, 13, 192, NULL, 'literal', '', 'Cuisinière Resto U', NULL, 1),
(52, 13, 194, NULL, 'literal', '', '4963,00€', NULL, 1),
(53, 13, 190, NULL, 'literal', '', '99 avenue des boulevards verts, BRON', NULL, 1),
(54, 13, 195, NULL, 'literal', '', 'mart.cont@univ.fr', NULL, 1),
(55, 14, 1, NULL, 'literal', '', 'Marine Thegomme', NULL, 1),
(56, 14, 192, NULL, 'literal', '', 'Documentaliste', NULL, 1),
(57, 14, 194, NULL, 'literal', '', '1231,10€', NULL, 1),
(58, 14, 190, NULL, 'literal', '', '28 boulevard des rues bleues, VENISSIEUX', NULL, 1),
(59, 14, 195, NULL, 'literal', '', 'mari.gom@univ.fr', NULL, 1),
(60, 15, 1, NULL, 'literal', '', 'Distributeur boisson n°6', NULL, 1),
(61, 15, 4, NULL, 'literal', '', 'Machine à café et à soupe à la tomate', NULL, 1),
(62, 15, 196, NULL, 'literal', '', 'Distributeur', NULL, 1),
(63, 15, 197, NULL, 'literal', '', 'Non', NULL, 1),
(64, 15, 198, NULL, 'literal', '', 'Campus PDA - Bat L', NULL, 1),
(65, 16, 1, NULL, 'literal', '', 'Terrain de rugby', NULL, 1),
(66, 16, 4, NULL, 'literal', '', 'Disponible le lundi et le jeudi (sur réservation)', NULL, 1),
(67, 16, 196, NULL, 'literal', '', 'Equipement sportif', NULL, 1),
(68, 16, 197, NULL, 'literal', '', 'Oui', NULL, 1),
(69, 16, 198, NULL, 'literal', '', 'Campus PDA - Extérieur', NULL, 1),
(70, 17, 1, NULL, 'literal', '', 'Studio d\'enregistrement', NULL, 1),
(71, 17, 4, NULL, 'literal', '', 'Studio pour enregistrements musicaux. Inclus micros, logiciels de montages et table de mixage', NULL, 1),
(72, 17, 196, NULL, 'literal', '', 'Local', NULL, 1),
(73, 17, 197, NULL, 'literal', '', 'Oui', NULL, 1),
(74, 17, 198, NULL, 'literal', '', 'Campus BDR - Bat I', NULL, 1),
(75, 18, 1, NULL, 'literal', '', 'Mathématiques', NULL, 1),
(76, 18, 198, NULL, 'literal', '', 'Campus BDR - Bat A', NULL, 1),
(77, 18, 191, NULL, 'literal', '', 'James Léchifres', NULL, 1),
(78, 18, 189, NULL, 'literal', '', '8,7', NULL, 1),
(79, 19, 1, NULL, 'literal', '', 'Histoire de l\'art', NULL, 1),
(80, 19, 198, NULL, 'literal', '', 'Campus BDR - Bat H', NULL, 1),
(81, 19, 191, NULL, 'literal', '', 'Stéphanie Bern', NULL, 1),
(82, 19, 189, NULL, 'literal', '', '18,00', NULL, 1),
(83, 20, 1, NULL, 'literal', '', 'Sémiotique du langage', NULL, 1),
(84, 20, 198, NULL, 'literal', '', 'Campus PDA - Bat R', NULL, 1),
(85, 20, 191, NULL, 'literal', '', 'Hélèm Uette', NULL, 1),
(86, 20, 189, NULL, 'literal', '', '15,4', NULL, 1),
(87, 21, 1, NULL, 'literal', '', 'Philippine Etchebest', NULL, 1),
(88, 21, 190, NULL, 'literal', '', '85 rue gourmand, LYON', NULL, 1),
(89, 21, 195, NULL, 'literal', '', 'phil.etch@univ.fr', NULL, 1),
(90, 21, 202, 11, 'resource', NULL, NULL, NULL, 1),
(91, 22, 1, NULL, 'literal', '', 'Pierre Bocuse', NULL, 1),
(92, 22, 190, NULL, 'literal', '', '66 boulevard des bouchons, LYON', NULL, 1),
(93, 22, 195, NULL, 'literal', '', 'pier.boc@univ.fr', NULL, 1),
(94, 22, 202, 9, 'resource', NULL, NULL, NULL, 1),
(95, 23, 1, NULL, 'literal', '', 'Jeane-Françoise Piège', NULL, 1),
(96, 23, 190, NULL, 'literal', '', '34 rue de l\'assiette, VILLEURBANE', NULL, 1),
(97, 23, 195, NULL, 'literal', '', 'JeaFra.pieg@univ.fr', NULL, 1),
(98, 23, 202, 10, 'resource', NULL, NULL, NULL, 1),
(99, 11, 201, 19, 'resource', NULL, NULL, NULL, 1),
(100, 11, 201, 18, 'resource', NULL, NULL, NULL, 1),
(101, 10, 201, 20, 'resource', NULL, NULL, NULL, 1),
(102, 10, 201, 18, 'resource', NULL, NULL, NULL, 1),
(103, 9, 201, 19, 'resource', NULL, NULL, NULL, 1),
(104, 9, 201, 20, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 2, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', ''),
(7, 2, 'https://univlikeuniverse.univ-verse.fr/onto/univ#', 'univ', 'Mon Université', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
