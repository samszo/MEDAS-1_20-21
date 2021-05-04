-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 04 mai 2021 à 12:32
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `omeka-s_medas1_20-21`
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
(1, 'items', 1, 1, 'Titi', 'Titi\nTweety\nPetit oiseau malin'),
(3, 'items', 1, 1, 'Gros minet', 'Gros minet'),
(4, 'items', 1, 1, 'Antoine de Saint-Exupéry', 'Antoine de Saint-Exupéry\nRomancier'),
(5, 'items', 1, 1, 'Le Petit Prince', 'Le Petit Prince\nRoman'),
(6, 'items', 1, 1, 'Roman', 'Roman\nLe roman est un genre littéraire caractérisé essentiellement par une narration fictionnelle'),
(7, 'items', 1, 1, 'Title', 'Title\nDescription'),
(8, 'items', 1, 1, 'Albert Camus', 'Albert Camus'),
(9, 'items', 1, 1, 'L\'Étranger', 'L\'Étranger\nRoman'),
(10, 'items', 1, 1, 'Centre médical Europe', '1\nEurope\n750\n1205\nCentre médical Europe'),
(11, 'items', 1, 1, 'Personne MARTIN', '1\nMARTIN\nWilliam\n25\nPersonne MARTIN'),
(12, 'items', 1, 1, 'Livraison 1', '1\nvaccin\n600\n2021-05-09\n2\nLivraison 1'),
(13, 'items', 1, 1, 'RDV  1', '1\n2021-05-04\ntest\n1\n1\nRDV  1');

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
(1),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13);

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
(1, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2);

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
(1, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:04:01+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:04:01+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:04:01', '2021-04-30 14:04:01'),
(2, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:04:23+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:04:23+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:04:22', '2021-04-30 14:04:23'),
(3, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:05:04+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:05:04+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:05:03', '2021-04-30 14:05:04'),
(4, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:07:18+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:07:18+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:07:18', '2021-04-30 14:07:18'),
(5, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:09:31+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:09:31+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:09:31', '2021-04-30 14:09:31'),
(6, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:10:50+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:10:50+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:10:50', '2021-04-30 14:10:50'),
(7, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"replace\"}', '2021-04-30T14:17:11+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:17:11+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:17:11', '2021-04-30 14:17:11'),
(8, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-04-30T14:17:28+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2021-04-30T14:17:28+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:62\nStack trace:\n#0 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\laragon\\www\\omeka-s_medas1_20-21\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(105): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\laragon\\www\\omeka-s_medas1_20-21\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\laragon\\www\\omeka-s_medas1_20-21\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-04-30 14:17:28', '2021-04-30 14:17:28');

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

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`) VALUES
(2, 1, 'html', 'html', '{\"o:is_public\":\"1\",\"dcterms:title\":[{\"@value\":\"\",\"property_id\":\"1\",\"type\":\"literal\"}],\"html\":\"<p>https:\\/\\/www.google.com\\/search?tbs=lf:1,lf_ui:4&amp;tbm=lcl&amp;sxsrf=ALeKk020a6i0tFCzK3iqBTZhgs-TRP6jdw:1615555594287&amp;q=cnam&amp;rflfq=1&amp;num=10&amp;ved=2ahUKEwiYwL_K7arvAhUK2BoKHcf2BR0QtgN6BAgQEAc#rlfi=hd:;si:5105630760880276412,l,CgRjbmFtIgOIAQFIto2QAVoQCgRjbmFtEAAYACIEY25hbZIBF2VkdWNhdGlvbmFsX2luc3RpdHV0aW9uqgEMEAEqCCIEY25hbSgE;mv:[[48.917883499999995,2.3619133999999997],[48.863851399999994,2.3519058999999998]]<\\/p>\\r\\n\",\"o:ingester\":\"html\"}', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);

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
('sSv3YYSxnhc4DzJGAMtfY0OndGVc97mX', 2, '2021-02-23 11:16:58', 1);

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
(195, 1, 9, 'idPersonne', 'idPersonne', NULL),
(196, 1, 9, 'Nom', 'Nom', NULL),
(197, 1, 9, 'Prenom', 'Prenom', NULL),
(198, 1, 9, 'Age', 'Age', NULL),
(199, 1, 9, 'idCentre_medical', 'idCentre_medical', NULL),
(200, 1, 9, 'stock_vaccin', 'stock_vaccin', NULL),
(201, 1, 9, 'stock_test', 'stock_test', NULL),
(202, 1, 9, 'idLivraison', 'idLivraison', NULL),
(203, 1, 9, 'type', 'type', NULL),
(204, 1, 9, 'nb', 'nb', NULL),
(205, 1, 9, 'date', 'date', NULL),
(206, 1, 9, 'idRDV', 'idRDV', NULL);

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
(1, 1, 1, 2, NULL, 'Titi', 1, '2021-03-12 13:03:55', '2021-04-30 14:20:20', 'Omeka\\Entity\\Item'),
(2, 1, NULL, NULL, NULL, NULL, 1, '2021-03-12 13:26:59', '2021-03-12 13:26:59', 'Omeka\\Entity\\Media'),
(3, 1, 1, 2, NULL, 'Gros minet', 1, '2021-03-12 14:26:23', '2021-04-30 14:20:05', 'Omeka\\Entity\\Item'),
(4, 1, 107, 4, NULL, 'Antoine de Saint-Exupéry', 1, '2021-04-09 20:36:24', '2021-04-30 14:19:58', 'Omeka\\Entity\\Item'),
(5, 1, 109, 6, NULL, 'Le Petit Prince', 1, '2021-04-09 20:39:41', '2021-04-30 14:18:44', 'Omeka\\Entity\\Item'),
(6, 1, 108, 5, NULL, 'Roman', 1, '2021-04-09 20:40:41', '2021-04-30 14:20:35', 'Omeka\\Entity\\Item'),
(7, 1, 106, 3, NULL, 'Title', 1, '2021-04-09 20:58:08', '2021-04-30 14:20:27', 'Omeka\\Entity\\Item'),
(8, 1, 107, 6, NULL, 'Albert Camus', 1, '2021-04-30 14:13:35', '2021-04-30 14:13:35', 'Omeka\\Entity\\Item'),
(9, 1, 109, 6, NULL, 'L\'Étranger', 1, '2021-04-30 14:15:20', '2021-04-30 14:19:12', 'Omeka\\Entity\\Item'),
(10, 1, 122, 21, NULL, 'Centre médical Europe', 1, '2021-05-04 12:13:57', '2021-05-04 12:17:04', 'Omeka\\Entity\\Item'),
(11, 1, 121, 20, NULL, 'Personne MARTIN', 1, '2021-05-04 12:14:33', '2021-05-04 12:17:56', 'Omeka\\Entity\\Item'),
(12, 1, 123, 22, NULL, 'Livraison 1', 1, '2021-05-04 12:15:25', '2021-05-04 12:18:21', 'Omeka\\Entity\\Item'),
(13, 1, 124, 23, NULL, 'RDV  1', 1, '2021-05-04 12:15:56', '2021-05-04 12:18:42', 'Omeka\\Entity\\Item');

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
(106, 1, 5, 'Book', 'book', NULL),
(107, 1, 6, 'auteur', 'auteur', NULL),
(108, 1, 6, 'genre', 'genre', NULL),
(109, 1, 6, 'livre', 'livre', NULL),
(110, 1, 6, 'livre_has_auteur', 'livre_has_auteur', NULL),
(121, 1, 9, 'personne', 'personne', NULL),
(122, 1, 9, 'centre_medical', 'centre_medical', NULL),
(123, 1, 9, 'livraison', 'livraison', NULL),
(124, 1, 9, 'rdv', 'rdv', NULL);

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
(2, 1, 1, NULL, NULL, 'Personnage de dessins animés'),
(3, 1, 106, NULL, NULL, 'Book'),
(4, 1, 107, NULL, NULL, 'auteur'),
(5, 1, 108, NULL, NULL, 'genre'),
(6, 1, 109, NULL, NULL, 'livre'),
(7, 1, 110, NULL, NULL, 'de'),
(20, 1, 121, NULL, NULL, 'personne'),
(21, 1, 122, NULL, NULL, 'centre_medical'),
(22, 1, 123, NULL, NULL, 'livraison'),
(23, 1, 124, NULL, NULL, 'rdv');

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
(21, 2, 1, NULL, NULL, 1, NULL, 0, 0),
(22, 2, 4, NULL, NULL, 2, NULL, 0, 0),
(23, 2, 2, NULL, NULL, 3, NULL, 0, 0),
(24, 2, 20, NULL, NULL, 4, NULL, 0, 0),
(25, 3, 1, NULL, NULL, 1, NULL, 0, 0),
(26, 3, 4, NULL, NULL, 2, NULL, 0, 0),
(27, 4, 1, NULL, NULL, 1, NULL, 0, 0),
(28, 4, 4, NULL, NULL, 2, NULL, 0, 0),
(29, 5, 1, NULL, NULL, 1, NULL, 0, 0),
(30, 5, 4, NULL, NULL, 2, NULL, 0, 0),
(31, 6, 1, NULL, NULL, 1, NULL, 0, 0),
(32, 6, 4, NULL, NULL, 2, NULL, 0, 0),
(33, 7, 1, NULL, NULL, 1, NULL, 0, 0),
(34, 7, 4, NULL, NULL, 2, NULL, 0, 0),
(71, 20, 195, NULL, NULL, 1, NULL, 0, 0),
(72, 20, 196, NULL, NULL, 2, NULL, 0, 0),
(73, 20, 197, NULL, NULL, 3, NULL, 0, 0),
(74, 20, 198, NULL, NULL, 4, NULL, 0, 0),
(75, 21, 199, NULL, NULL, 1, NULL, 0, 0),
(76, 21, 196, NULL, NULL, 2, NULL, 0, 0),
(77, 21, 200, NULL, NULL, 3, NULL, 0, 0),
(78, 21, 201, NULL, NULL, 4, NULL, 0, 0),
(79, 22, 202, NULL, NULL, 1, NULL, 0, 0),
(80, 22, 203, NULL, NULL, 2, NULL, 0, 0),
(81, 22, 204, NULL, NULL, 3, NULL, 0, 0),
(82, 22, 205, NULL, NULL, 4, NULL, 0, 0),
(83, 22, 199, NULL, NULL, 5, NULL, 0, 0),
(84, 23, 206, NULL, NULL, 1, NULL, 0, 0),
(85, 23, 205, NULL, NULL, 2, NULL, 0, 0),
(86, 23, 203, NULL, NULL, 3, NULL, 0, 0),
(87, 23, 195, NULL, NULL, 4, NULL, 0, 0),
(88, 23, 199, NULL, NULL, 5, NULL, 0, 0);

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
('00l43gfh5dkhr2n1achtkqcmrk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353535333031372e3636303430383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2230306c343367666835646b6872326e31616368746b71636d726b223b7d7d, 1615553017),
('0o2dohmd1iar0nub5bl2n1gfsu', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393139323836342e3739333638383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306f32646f686d6431696172306e756235626c326e3167667375223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393139363436343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223035663663343839383639333839336532356433643137363561313565633238223b733a33323a223834346639323338333639333461363036616538306236653161613037303937223b7d733a343a2268617368223b733a36353a2238343466393233383336393334613630366165383062366531616130373039372d3035663663343839383639333839336532356433643137363561313565633238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619192864),
('1ljfn0titpv3v8u54l9pl7db9d', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393739333438392e3438383835323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316c6a666e3074697470763376387535346c39706c3764623964223b7d7d, 1619793489),
('3mdpvhn4lr8gb7purfu7udlhf3', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393739333438392e3037363639383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336d647076686e346c723867623770757266753775646c686633223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739373038393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223739343962633231643433613666656665353639663265663630613330633563223b733a33323a223038663838356533373062633334316232653833363332363030313833333566223b7d733a343a2268617368223b733a36353a2230386638383565333730626333343162326538333633323630303138333335662d3739343962633231643433613666656665353639663265663630613330633563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619793489),
('68pvnnml3hk9v1c4gvcncg78om', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353535333031372e3332333632333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363870766e6e6d6c33686b39763163346776636e636737386f6d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363631373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223134313733346239333265383862326536623436633536663434653839393433223b733a33323a226665613431323930653731386461353062343361366234653736333365343965223b7d733a343a2268617368223b733a36353a2266656134313239306537313864613530623433613662346537363333653439652d3134313733346239333265383862326536623436633536663434653839393433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615553017),
('7r0neqkjq6msvsndgivs3cv1aj', 0x5f5f4c616d696e61737c613a31303a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393739373930382e3338323531373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226767386832727670676a6f303570397262303932333368633161223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393335373839323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393830313234333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631393830313234333b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739353830393b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739353834383b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739353435383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739353734373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393739353735353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226662643036643638643337303932663830356661303534363931316363323034223b733a33323a226230303264633565653462366365336137623931373235313361613437316537223b7d733a343a2268617368223b733a36353a2262303032646335656534623663653361376239313732353133616134373165372d6662643036643638643337303932663830356661303534363931316363323034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353131323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36303a7b733a33323a226665653036396135336139353730313435353563363066393566646636346664223b733a33323a226630613537653535313862316530623565376663623264326335316232373438223b733a33323a223830643763333264663264353061313163313362633639356130646564323861223b733a33323a223631313664393365376233653861313461346666646137643339343632316366223b733a33323a226137396662303637663563626161306437343133616234356234623536313162223b733a33323a226638653530643737393066613763626534373236393731373938323933393031223b733a33323a223334613831313362663134396265383532373766613562323330326664343961223b733a33323a226464393935653739313238633334623039396666363765313961383032316266223b733a33323a223964316133343661303238616239373331393064623065323464393834383666223b733a33323a223637313739623732653630623764343063356339343564643536353962366532223b733a33323a223966643466633530613563633163663465373032643137313439393461633735223b733a33323a226333613864373731356565346630303337343934653637376135623132373065223b733a33323a223033346565313362636666386632653138613061333561316235306533613939223b733a33323a223232646266613631663338643333333566396335323764336636643763616631223b733a33323a226666663635303061396263343033613864316336326534353632373832393438223b733a33323a223935386630323966386332616265366234326631623036393338393234336631223b733a33323a223132303431633535333662626463336661323738323636346534656161343238223b733a33323a223764613031383463306336643164333662643364386631353236383532366266223b733a33323a226165373932386134653038653336323239626165323761643734386265386661223b733a33323a226535363463373461383533323836393431326164623639306532653835363763223b733a33323a223935366231393435623761333939643261396336376130393337316563366338223b733a33323a226333343965393833663363653565393134333932353239383134633033633132223b733a33323a223030663430643138303239613964376662393664313066626534623961393364223b733a33323a226133363435303238346263663132306561373230303962396365613739366463223b733a33323a223433366137353539323835616232313632383233396239376138666436616361223b733a33323a223834616539306136393566346565623464383834393239333063656365333061223b733a33323a223833393236666261666362363864613163666336666138333838633836663139223b733a33323a223163396165636137616633306565383930616234353037366333343162393433223b733a33323a223334613862656637623765323739613833326635666335316432333731396464223b733a33323a223166336134363938336163353536663031363634663966353239353761313963223b733a33323a226436326535623535386333373761616663336632643261323938383964666437223b733a33323a226636333763336538396265366164313130343361356262356266373833613032223b733a33323a223939653232353061326637646464646536363136643062323239386264363836223b733a33323a223239383466643231366437303835623139386435346265333333333264623933223b733a33323a226163386232613530666235613234373736333963366238616434326665376135223b733a33323a223839343733396331343334643363666433386533623831393932623964656261223b733a33323a223039326637653366333066656235346463613233653262656636383336383136223b733a33323a223739313931346461616462653437626361393363386332626161313733373731223b733a33323a223666336562383532306431356336643534643863373864663731363331353664223b733a33323a223031646164616563616161313836333536623433623131613835393764383731223b733a33323a226366663530376562386234303662643663346163626665616139353439646436223b733a33323a226433643337313332323238643235346434373032666139393666363063613137223b733a33323a223631316239653639366165623438396438656362653965643666326333386432223b733a33323a223462616431643764636639306534386437613263356537623066353063316163223b733a33323a223433653134356262393431386638393734353261393933656363393062303038223b733a33323a226331376236346337356337383463336233323734343139313361396130353861223b733a33323a223034393965646561646334636562383261663033663336633766373335653836223b733a33323a223133373661336130313735383866396430613435346565383239636638303565223b733a33323a223531333561386532623964316331646532636362613861666636343933643733223b733a33323a223939623366633739396430376561343062656332303739623061306161623333223b733a33323a223436336338313362633461313930653363643831393263316461386138353937223b733a33323a223131653066303639653438626566303931366530373230663663626639623835223b733a33323a226136356237323439396431616562356238326435333039623365326563373230223b733a33323a223234366163666364326636343531613666653963646465353234613638333963223b733a33323a223637303239613339366465663563613538616630336661353235623430316666223b733a33323a223331336166333730393033386362313463656262313066343463656533313334223b733a33323a226662643035323333656661393864366565646464646362393333653238306466223b733a33323a223666353763653866666662613937363331313962316237343432333833366264223b733a33323a226165336139376239333936636631636337633964306537663563306362363264223b733a33323a223362643337333233393536643136323639643634346237656530386162663435223b733a33323a223234396639373531663331633964616333643339313137616230363438623537223b733a33323a223738656139303762663732303036373065663138393562376666346263663636223b733a33323a226163353937366333613431396664643237363165396639623138383661303531223b733a33323a223237303361303937303266356430636166633333326564393736366432343965223b733a33323a223265366232376366336462613938303039666133366163613039356461306162223b733a33323a226331336438353036613366383936653139396538623031383233613232356135223b733a33323a223931653839643635386138626336643933633831623361396362366531613465223b733a33323a226665353536393066316333623434656430343932336661366562623937376339223b733a33323a226532653963633032336638356661646266333134663964363464666661633761223b733a33323a223466636265366566353532373337336536353037306566613839613936383261223b733a33323a223461613166336338393564396265303263663733353837373832666161666664223b733a33323a223933333462356161623737636430323039633165323730656233313461646563223b733a33323a223033333136326237386238366562323039303765343735396364326437653036223b733a33323a226135346638306265316233633739643266373831343161306163323939343832223b733a33323a226333313436393930326166363663643664326461393236396465633134336139223b733a33323a226165393966363235343837613835356163386364623735333866633961373438223b733a33323a226132356332383232613633653939643339333266653563386664623561313735223b733a33323a223665386534383330636361363366376431393864396262356532333936346364223b733a33323a223932353962373234373666323061623233376536323932646436393833346135223b733a33323a223966383564613731383639623437646232363661303066653165366132646337223b733a33323a223936303964666639316564663234353931363761383565656366373464366132223b733a33323a226136656136616239663034393539373963633332313364316231633161333338223b733a33323a223239383834313261393666363065663261383665396135313066303037393239223b733a33323a223235633932373933653232633731323731306631363037333965393031363565223b733a33323a223732313164373864643637393537356637373665616535336331613436353166223b733a33323a223130626162396533316564333036306563316136383864333637623135663537223b733a33323a223932646134386136303330396364306332303065393065333866383864333430223b733a33323a226630323966643066396564653339366234313336616439313135656634663966223b733a33323a226437653033623431323830366263613030666563336435316430313538643637223b733a33323a223832336636346135646138643431313762643661393664376535363836613366223b733a33323a223237386631303335376265663037393665646666363265323030636636383765223b733a33323a223766343036326338353032666638343664326533643039306135373233636230223b733a33323a223132303638346439613731343832303062323534373663636439623365323963223b733a33323a226565363539636363656134653636393230343233643634643239353866613062223b733a33323a223235333364656231633736376364643430336435336535666362383463313231223b733a33323a226163313731373861623436356662373666363733396133333533666434656130223b733a33323a223332323462653236353739316266613939663737353832306539343230626339223b733a33323a226232616236393361656563313630663136613135313731633834343937373862223b733a33323a223330356566346534393132613831633566643936306163656464353939366565223b733a33323a223964633531343636613864373331663862313435363463373235376238666233223b733a33323a226664313736313536383663376433383338336130333465393432373638313161223b733a33323a226466663136653364373066343231353935386532363162316330366236343233223b733a33323a223639636565616535633635323435313062616564363034663662646163666632223b733a33323a223937346432666630653832623065636438303065333533353631343130363361223b733a33323a226337663730623439303132633339356230353637343435646639353035343238223b733a33323a223131643039356366633537663831666565346662346535366564353437346438223b733a33323a223137343438323264636539316464313034646466323431373834653931353665223b733a33323a223936356561303431666330303038393931613364393131616239646437306339223b733a33323a223762303162383061623865313834393634376535373634623732366266386463223b733a33323a223664343463326231613466323665396165366137633661303030343533316132223b733a33323a223137323461633161643761373762653664316664623139666366393362313965223b733a33323a223736353062303531356362383936653566346133336364356365663164313261223b733a33323a226366663762653933323830316238313737626462656562353739303533353831223b733a33323a226533393033353762376131323863386166376434303463396234353164393636223b733a33323a223534306166616535633365373262653235646662643530343863663432643237223b733a33323a226136386361366232613432613939333037373339636665303764373461376130223b733a33323a223637306434356235666633353539636535333466643639303939363834343733223b733a33323a226139653330336231316636303061306237656635383333303539353532363930223b733a33323a223435633933636163626134643162303062386132643933333138666436653434223b733a33323a223931613039306231333739333932336335376136363631626336653362393830223b7d733a343a2268617368223b733a36353a2239316130393062313337393339323363353761363636316263366533623938302d3435633933636163626134643162303062386132643933333138666436653434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223437393130373466386635326361376337383734353537336263633061646136223b733a33323a226130613162623265366132373431366565323434666635663164643137616630223b733a33323a223232373931633763623536303835396231386562663431316437636330346531223b733a33323a223933663338383866326630333530303837643333643338393763633439393066223b733a33323a223536343761303836363365393230303562346462653832373331666336626435223b733a33323a223164306137626634666164646537396465303933313530323365633164366564223b733a33323a223539323434303564313732396439633336633433343835346230326566313033223b733a33323a223363616566633362626266313336346134613564656562666536623632356632223b733a33323a223065363233323061356461613033646161323361633565623766323864353530223b733a33323a226430333739386532366431633434386336356636343134303164613934616461223b733a33323a223261306533633339393137323635653264653064313463303837653161323532223b733a33323a223036633930613663373366623738303662353965316537663333643563303331223b7d733a343a2268617368223b733a36353a2230366339306136633733666237383036623539653165376633336435633033312d3261306533633339393137323635653264653064313463303837653161323532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223864373265306363326462333938643764343931663166346431666532643732223b733a33323a226138353166356236643636313039643863316332396134363637313037303135223b733a33323a226366613632636564636562346631386461373933316530386464363161303362223b733a33323a223765633738363262393436343961666336376465663732303831636538623662223b733a33323a223233633534303933663333666662303037386139383833313034366361303363223b733a33323a226238653633363661353138363930363439323062316431393930356162343963223b733a33323a226339646631393730613033643261653333383361653736323062383430626130223b733a33323a226538373537653430313563353066623839393637643336666337343435316233223b733a33323a223239343666353834653561643361303230663065386530383235366335306662223b733a33323a226131393730663965313761376334316630333135393136393835666335323333223b7d733a343a2268617368223b733a36353a2261313937306639653137613763343166303331353931363938356663353233332d3239343666353834653561643361303230663065386530383235366335306662223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313539323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223865363133376330393537366363366238343836313266336463393632306139223b733a33323a223434623338666635386433383033363463326530636234333038396537383436223b733a33323a223161656161366666343065646538643639653637373161663534373966363633223b733a33323a226137626335363662643839383239373138343761626364636236303238356530223b733a33323a223836373837636538396133353736653037396362653836613765373739343134223b733a33323a223531313032316235633864353535633239396534303836623331626333663635223b733a33323a223834343766623962316464306535333331383366393134623534636532316630223b733a33323a223462393331373264636339386239323634316436373265316337343564643234223b733a33323a226139646661306532343766623030393035323430363131343631656539313431223b733a33323a223339326633313239313765376662346636303462643533666339656633666162223b733a33323a223062393839313138363633373433393931616239343433383963306536313534223b733a33323a223637343761376135313861333435313532363834643733653938373866643434223b733a33323a226432643937326334626135316432356365356535623962366331646464333839223b733a33323a223065663563353364643437316238646238666661623039653961633937313163223b733a33323a226562383637303161636630613831393136303431363765386363666435323935223b733a33323a223837333264613132646463343037313732386466613832636638343761333837223b733a33323a226263303633633835343866393132383831656539643434316435356238383939223b733a33323a223233396562633031353435386532613866363535303635313137366561303033223b733a33323a226237363930356665356630366537626263656137356463323538613834616231223b733a33323a226137306437633334316166646134616332323436306335316165383935613438223b733a33323a226464373162613534363762356432623631616661363135636134623738363437223b733a33323a226161336163366339373636646663363634633938343135323633613235336366223b733a33323a223938306366656564336166336361376535323337386564653731333033303866223b733a33323a226165366236323465626263326237323137633039323930663565396266353934223b733a33323a223035613237646239643234613734356132383265616134346437623434316464223b733a33323a223437383233613433373062306362343735616564626337633738336331613166223b733a33323a223738636461653139366135376263393438393762386536326432653865363631223b733a33323a226362363361373661366538363066313765663463343039633031336235323330223b733a33323a223437383932393763643138303637313764623434663466326138333263333330223b733a33323a223431353464616663626136613832626232393864623835373263343230353034223b733a33323a223833386266386463333739653236643962633137383861646630323136383261223b733a33323a223632386438613334366461626262636531313032306539613963313136386437223b7d733a343a2268617368223b733a36353a2236323864386133343664616262626365313130323065396139633131363864372d3833386266386463333739653236643962633137383861646630323136383261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223335623438616234363562643030663666656431346264623637323439626233223b733a33323a223834613530653863666135623932653433313163323364363437626633386661223b7d733a343a2268617368223b733a36353a2238346135306538636661356239326534333131633233643634376266333866612d3335623438616234363562643030663666656431346264623637323439626233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226230383163346561623634656635333237613762666634386563306238343263223b733a33323a223461386236306439313830383261643934663138313666653931313261666433223b7d733a343a2268617368223b733a36353a2234613862363064393138303832616439346631383136666539313132616664332d6230383163346561623634656635333237613762666634386563306238343263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226530363534373836313666336336363235336535623733376139313135393635223b733a33323a226436303461623662383538393562313636353932313565636365326130346634223b7d733a343a2268617368223b733a36353a2264363034616236623835383935623136363539323135656363653261303466342d6530363534373836313666336336363235336535623733376139313135393635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619797908),
('8pj2b4s38j5hp8l8fbt6bubrm0', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303032373833342e3737323932343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666d656b74676f6f68377276356437616e66746f71346a6a6f6c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033303938303b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033313034333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033313038303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226266653435623637653439646461383830363832333435646538303232653636223b733a33323a226333653639393138633936366130313231383632626364666137656665633462223b7d733a343a2268617368223b733a36353a2263336536393931386339363661303132313836326263646661376566656334622d6266653435623637653439646461383830363832333435646538303232653636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223933643531393837323362623939356332656338613833323163323965353062223b733a33323a226439643234393865613566376566663831346463323430346266336366313236223b7d733a343a2268617368223b733a36353a2264396432343938656135663765666638313464633234303462663363663132362d3933643531393837323362623939356332656338613833323163323965353062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223937656432386238393931303262393466333939323335666663633930363965223b733a33323a223533393636643236373663353431336133666139383366303066663061373638223b733a33323a226533343464393631623236316464313634326663323634376361363334326536223b733a33323a223437323438393466383732653331636135336666343665613435653836393462223b7d733a343a2268617368223b733a36353a2234373234383934663837326533316361353366663436656134356538363934622d6533343464393631623236316464313634326663323634376361363334326536223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620027835),
('9vk6f34ccons7m4r0uvpa94155', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393139343836322e3733313930383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239766b3666333463636f6e73376d347230757670613934313535223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393139383436323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226266633362646532646462326532326664373037316338346164343166303762223b733a33323a226365636363313363383662366461613433313562393837366361643535363461223b7d733a343a2268617368223b733a36353a2263656363633133633836623664616134333135623938373663616435353634612d6266633362646532646462326532326664373037316338346164343166303762223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619194863),
('bq27mp8st75r8vg2qqdddi7sa6', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393139343836332e3230323639323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22627132376d703873743735723876673271716464646937736136223b7d7d, 1619194863),
('e8shnb4u4i9lb0ra9sjure5tfd', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393139323836352e3135313732333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653873686e6234753469396c6230726139736a75726535746664223b7d7d, 1619192865);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('gq95ircdjq7okudfnpuovsk5s8', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353536313035392e31373838343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223674646e6e6b373632376d647374687438666a6e737070716465223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363533383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353536343635323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353536343635323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353536323633383b7d7d72656469726563745f75726c7c733a33383a22687474703a2f2f6f6d656b612d735f6d65646173315f32302d32312e746573742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223464373334323939303430393466393939383833623237303164373335373938223b733a33323a223736626533386435663631323962666461356565363632623463343866613833223b7d733a343a2268617368223b733a36353a2237366265333864356636313239626664613565653636326234633438666138332d3464373334323939303430393466393939383833623237303164373335373938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333433323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33393a7b733a33323a223365396438643364336234346631343031666433626362646162333761383133223b733a33323a223238383061303938366437616136633864383263646338353539613330643333223b733a33323a226138393565333332306135333135643863613136656666643839363065623438223b733a33323a226362383365356465386435643433366439656639653737663233363330663637223b733a33323a223762363763626532333834623336396564383839343433373133346431363436223b733a33323a223239643661613134656635656561623864613763663734396435333965663237223b733a33323a226232623332656337366136633364383938626336653636626265646462376437223b733a33323a223862333465343335626438306337376561356431323764373338353237633534223b733a33323a223135393031376534343332323466663266323234386461333661393134376461223b733a33323a226631386230326561636661353034323163383865303335646530663639316331223b733a33323a223337633363363333633434666534306161313539346563653363626231303365223b733a33323a223039356433333263346537326463313066326238336436666435313739333936223b733a33323a226462313939656462343235343136613466346636636666306335343735326434223b733a33323a223435653664353030663536626637623431633165623133363531376431353863223b733a33323a226635613933323532343539303862363036613130373636663364333162633637223b733a33323a226364336438356636353965653138336566633039643964313531663965313338223b733a33323a226166336639663661636633623662613738313337613161306261343532396262223b733a33323a223265353538303961366238343566356163633238623534386433643833353364223b733a33323a223330393936396564313234303564363833356231613331663461373636363735223b733a33323a223333316363306230636564333230633031343335616164613163376330313830223b733a33323a223739613733376466646263343035396364326161363138343861383665383764223b733a33323a223333366662363538373333373562353462376335666335353535636566646138223b733a33323a223261396635643565353938303466336664633539303637313631636164376236223b733a33323a223062613334383663366561306165383631376663623238623634663439663863223b733a33323a226133333261353264656466333133333664383039623931333139656438363733223b733a33323a226565653464326232626236616531376138653239346361663161323735646361223b733a33323a226634643439646164666665343938313365316566643539373166333435303665223b733a33323a223837643764353665353138373832366537353837336135323230656131626431223b733a33323a223831333061366535353232313332623963613231656636373766616663653230223b733a33323a226262306333396134656238646330623738326434343435633862356338653737223b733a33323a223463396561333634326164363738353932616336393731643733643733366335223b733a33323a223033376463386138303739373565616637646630663866613365393938663263223b733a33323a226635306166663934653732393263343932346236316361336365633430633633223b733a33323a223236666638656336373764636239616234633738353161613232323162333034223b733a33323a223138643932636336653230346265303239353330366464313263313732333833223b733a33323a226132313063313265353138396337363031653136303831653331386534636466223b733a33323a223639633631616331643431343334393765633136333933633336356639303134223b733a33323a223861366633316662373032333464326532356461313361636434316265363333223b733a33323a223235353534633030383566326634636231306434323437396365656566663963223b733a33323a223133356530356135616636376263623332353733356263326136323931616538223b733a33323a223561646266373638353631623133613466383664356431386137396663373063223b733a33323a226533363039386665373061393932316430636262363462656137336331363533223b733a33323a223665343534373636386466303730373863303436623632306337366666643961223b733a33323a226266633164653937383538373466393133346134613738363933316466376361223b733a33323a223366313461353439366339373631353864313364613238393037353336306139223b733a33323a223532613936393662373930383734623433663166373065613537626134656561223b733a33323a223731663062396362623765666631613435633861366237383164323638363163223b733a33323a223134386537376339633561336136346135363861656132356665323936643539223b733a33323a223964393839653734633961316335336362613562663233633264396664366161223b733a33323a226636323961323937323361633863386232613838626339653130666238613762223b733a33323a226633313233376534346463326262336539636264626537626662386663666133223b733a33323a223461313664366334383161333430383930363332343935646331313862343739223b733a33323a223338626261383630316439353132643162656465373963366163623536353238223b733a33323a226665646432356265373838383238323737366435626537643034626663313730223b733a33323a223137353130303066653064633466363165356339666131363931353130363465223b733a33323a226632376334613832326264396633366435323565613963633563323064313433223b733a33323a223661383335333039316635346139633363383930623632323830346538336232223b733a33323a223337316436656431343436393330643732356438656536626466326266346164223b733a33323a223431316662356262306462386136626237366162636566366461633363343531223b733a33323a223761613733613032336238316364333235653735613234373162326262346630223b733a33323a226166336161326130323863613532646533663464323631613032353737663138223b733a33323a223237326461376266316664646432346262333339303131313536663733313736223b733a33323a226231616436653236363565633536663062613134333933306139646433396162223b733a33323a223336333530373739363031656365326462376635383336323438346664623761223b733a33323a226266363237303736306331346534633034623438373264363832653138646636223b733a33323a223661343937366536373535386632333835616234613836373931356136343832223b733a33323a223032333234373134646161376337366363633433663437323362313739643434223b733a33323a223532383237366133343234313731643231353764623133363832316530326531223b733a33323a223633653736376231313132353639333961303863313965663732663964616437223b733a33323a223934613239613132313335333934353833633662333636383864353631646132223b733a33323a223261366132643434633435663237613538333965383632373966356237633864223b733a33323a226336363930623536663036623833613039396534306266373432353430326466223b733a33323a223962353263303466623737396466663065653131623166656138653830386137223b733a33323a223835643162343261663330313231306538643539383738313266333435646431223b733a33323a223235313663343931636235623332623264356438656162653736303139376436223b733a33323a223464313261613565633632363035373061363563333237356362623834653331223b733a33323a223661663334326464656561333636623961393862303334633736353932646361223b733a33323a226131336631343165313030633931333736366266323162613330623439373739223b7d733a343a2268617368223b733a36353a2261313366313431653130306339313337363662663231626133306234393737392d3661663334326464656561333636623961393862303334633736353932646361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313637323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223833626561326437633931663636653230303035366238623334663834333864223b733a33323a226138623066373162336536383430616665313563336332643863323334323633223b733a33323a223131336135366137313837393263363335353139306163376535343433373266223b733a33323a223666663634323038356233656136626432353366353661343662343161313264223b733a33323a226564373833313130333434386132373735623138613739303962623130663132223b733a33323a223363353337653533656165333138666363303639633966303864363238643361223b733a33323a223039623932653366376166646430626466393631386166396439636564316334223b733a33323a223565653130623265656239666433326566636136363762336437656661333430223b733a33323a226132356564393030633961396439363761386630636134366461353062343431223b733a33323a226330333437643734393835613464666361663432313430383836616433346235223b733a33323a223438323433656331626463376562346164343335383563313239323437306262223b733a33323a223534396238363762316137346135343835646261666661613332393335363031223b733a33323a223736653064663466323532316465363038663466373635316463376636346330223b733a33323a223932383339313363356332313535396562386536323530626432373564613564223b733a33323a226236313865356434336138343030353232313131373035616663353032643233223b733a33323a223863653630346338666632323062333132356235333461616530646239653563223b733a33323a223533303364626633396331323836316536343064326634326639653337373962223b733a33323a223931376532633038396633333865393766646264663331613431343032646632223b733a33323a223965643638623933656237626130353161623463653463333433326138323166223b733a33323a223539316639613962346566303636313531316237386334303831613666373238223b733a33323a223561656466363734656330363363353066613639666537363431313434656362223b733a33323a226136373539326430623566353464323237373962386239616138613732623265223b733a33323a223339646566363231613764393665373635643735613930663731663566366134223b733a33323a223866383533323463633337336666613639333238623166663365633531346363223b733a33323a226364656633613061353939366135623563333161376566346637326132613131223b733a33323a223039643533343239393636376630376461633936636532633435313562303264223b733a33323a226531336465303534626232353233356166356464366631653732326434373332223b733a33323a226661316363303463653434646663653362363136363134323637393764396164223b733a33323a223562356638656531666566396562663062383462626362383034396263383264223b733a33323a226464656663333231626532616666323633336261333332343336616136616635223b733a33323a223936653033353265633933626363653663353835313365383035626261333466223b733a33323a226434373764623637393533656633303530366366663163323237326666306266223b733a33323a223635613737313931306463346462623730323339306661386134613230353631223b733a33323a223332343337373634346430306135346638653666653933633563616465393962223b7d733a343a2268617368223b733a36353a2233323433373736343464303061353466386536666539336335636164653939622d3635613737313931306463346462623730323339306661386134613230353631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223464353337616161623530663063366335616336313163303030623862393036223b733a33323a226365363564633864643564336566303636393465656131613439633836643835223b7d733a343a2268617368223b733a36353a2263653635646338646435643365663036363934656561316134396338366438352d3464353337616161623530663063366335616336313163303030623862393036223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615561059),
('o2glhkucvvcgepun23hmun5oi4', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303133303733302e39333531353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223232647076707331636a6d336f74646f756d6b6270676a6b3972223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133303436393b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133333636363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133333832383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133343333313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303133343330363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226566343233303664643831646333313034633966623739383133623731623066223b733a33323a223136393835653764396131613865393636396439343064316332353961303436223b7d733a343a2268617368223b733a36353a2231363938356537643961316138653936363964393430643163323539613034362d6566343233303664643831646333313034633966623739383133623731623066223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223830616132313433656463353438613963666337363339336235363031383230223b733a33323a226463393865383263303965666530626361323436623864383930303235653562223b733a33323a226634303030343166636432326439653638656531386133356462616663656361223b733a33323a223838363032336364643438353833376533393938343564613862393533626630223b733a33323a223963376365646136643764346334316339366238383662636535303830633930223b733a33323a226664633439373562323363643063643533646163643034393734653432646537223b7d733a343a2268617368223b733a36353a2266646334393735623233636430636435336461636430343937346534326465372d3963376365646136643764346334316339366238383662636535303830633930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313539323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223633346633316238386335313636326539616366616538653362626164663536223b733a33323a223336333932653961613135653831373365353965643735613335396432393833223b733a33323a226463326333393636326335373063663430353733396132393966613938653431223b733a33323a223635366265636663383262663432353836656234646162656132316661313938223b733a33323a223430646265393936333938646262373865373239613130616637653864653834223b733a33323a226334393234363964333638393565343931356539373261653462663332666430223b733a33323a223637316531636130323735383139633262363933653562336339313239636464223b733a33323a226137643037333031343934303235306264663539663330306438623332363930223b733a33323a223730653762643332643563376635343862616232343664303137316234323735223b733a33323a223764303235643635653435333330616237353638386137366534663137366537223b733a33323a226538376432316532613237346139663532316339333237623330316537653830223b733a33323a226539393464663334343233616337333962336637326263336437663061633462223b733a33323a223437363332613837663332626233633137303630306461623838356335396161223b733a33323a223635346230363963396635333264643531663630326635653361316233353166223b733a33323a226430303937613632633238366262393433356432633230633038373335656632223b733a33323a223336663864326635323137353732366434313936653030393734613661303064223b733a33323a223838303533623765343139353863653536636135386430636530663766313831223b733a33323a223466343631366135363733353962373366366466663831333837306330633233223b733a33323a226532346639633464396234656336653566343532656262633130343333356635223b733a33323a223532303831376666646361323635666235653337393432636233313236643765223b733a33323a223463633965333766326332383337653030623366663666363439613537326131223b733a33323a226232393834383331326437376365663435373062653264323938383736346436223b733a33323a226263326538666638616632396266323566356630326365396236383932383730223b733a33323a223463373666386637316661663862636130343839303665373732633631306465223b733a33323a223037666237656336313738323562323737666233366533663863326234383235223b733a33323a226336383538313139356239613235336339386535653339366334373435386561223b733a33323a223262353733613033626361333662643039393335343634633661313765333133223b733a33323a223365366163313463313439376331343835303835623735636561646562386636223b733a33323a223163656161306465343837313838643566636566313430383466303565633363223b733a33323a223034353130333432313735633237626162613436316361656561386531336234223b733a33323a226264373866613337353263353631613665656537646163653965646339646535223b733a33323a226263366231363464666534393330303562386438353063656262323237333566223b7d733a343a2268617368223b733a36353a2262633662313634646665343933303035623864383530636562623232373335662d6264373866613337353263353631613665656537646163653965646339646535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333237323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33373a7b733a33323a223438653238353866393839633638383861626266333064343331343065366363223b733a33323a223930343435316662306133623934636433333530373135326637313161316266223b733a33323a223064383333313335303065356631333934326531626238663861653134316534223b733a33323a223832333966386636656533393435343030663464646233656634383330343431223b733a33323a226266656135326638636337386262316164346164656536656233663833373162223b733a33323a223834386533363864613636333363383335643137633835383135666363633361223b733a33323a223430323461333934356332303237613134333237663961326630343263363466223b733a33323a226139303164616435383866616638643738646435306233396130353534643831223b733a33323a223436343838343237363765383666393839646563646432653239363163666365223b733a33323a226466633734666265393136313665353232343938653332626238373033346635223b733a33323a223364383463336463373436613236633139363462343439303937313934323162223b733a33323a223834656162393334643231663937366132343064656331616436643733653362223b733a33323a223937343732306665646364656633333762396362653566373539363462376133223b733a33323a223262356631376533613639363233616131616166613965623436633639376461223b733a33323a226533646665613430343935323830333637663735336563313633333539303430223b733a33323a223335303430373164376130353966393239306430613563393438333262376435223b733a33323a223333626436356539386664623134323166663639373730623865613532303165223b733a33323a226666653830303266653738366565363464393538393736663662346431333934223b733a33323a226263633131303637613636616463323938393336343364326339376635333666223b733a33323a226633656230386539636430633163313939386637303139333038343232323538223b733a33323a223637656334616630336630323837653035656234373933626638646533323265223b733a33323a226162353865326434356564393931656362653139633338316438626264323430223b733a33323a223465393764613365626535376563303339346335333730333562316661656361223b733a33323a223533323439663430643131643065376232663134383662356639333739613739223b733a33323a223635346464323434343137383239313930383138343536356631396366623364223b733a33323a223765313736623338643434353961633233613332343836613231666134383866223b733a33323a226630633561326631613063623365653962313361373262653039363836643931223b733a33323a223031363764393665636239373464383037383435333231393864323466373461223b733a33323a223465653164346266353064666235636366626566343234363130376336343263223b733a33323a223530623736343238343462636535656537616662646466353631653333383835223b733a33323a223031316163383066376565643430626137643165376464353464373033343463223b733a33323a223466313164646437386436373137353038613835313931363732316536363036223b733a33323a223632303133636135366166336366343837346464663436326237386134356438223b733a33323a223835383534343935313533653634613862336635613537313163623037663661223b733a33323a223262343932383132626637653439626239376139346162663739623637616564223b733a33323a223231393939623165396531623565376366343464626330636364336438653363223b733a33323a223035613636656136313236323263366532643037313433323163626163356463223b733a33323a226665666466363261353531346536636532306233663537653033306666366135223b733a33323a223361646466333639336537613964636635616237393739393336323733643336223b733a33323a223032336363343135326138366330663061626166393936326233653038343063223b733a33323a223238653862633436373063353235306565393039346639653763383038663531223b733a33323a223961316565336564643635313230663861373066303336336139656131643765223b733a33323a223465623865616665323861343561363430623531393631613362333565643432223b733a33323a223730663562653464636539616233363265396630323561393336633438653630223b733a33323a226166623464366565393036356561626361616265613730666565663164333065223b733a33323a223733626662366163326137613265386239636164353738376634326137663063223b733a33323a223537393362346637393833646636383439366435303231653833343665343662223b733a33323a223664326437306263666439306330646334396662656339363961363966353531223b733a33323a223836336437306564643131646138653464656266636133333335646438306166223b733a33323a223638373464306365383932386565643562386534616266623966616239373530223b733a33323a223862336337656663313833313330383933373465353233393864353432626430223b733a33323a223436613436666564336132613432393934633534393566396232393630393139223b733a33323a226438363234333332663835353031366663653739333239663237343664303964223b733a33323a223966336134373466616134643563346635373031626261373362636364393839223b733a33323a226536616164643235623665653335633062303938333036313166373262623763223b733a33323a223231613934363836393431376565636161383733636264323563613237653163223b733a33323a223831376334393766326361663333303734633734666435363237306166343032223b733a33323a226361393162656165303239363966663632323533653035353632386131653735223b733a33323a226664386631656139373134316666643462393632646535366562656266616436223b733a33323a223530313063373265393235346166333764366163666432326265386431323463223b733a33323a223337363331313838396563333733636630663237613861333833303666353961223b733a33323a223838613037663363623562333638326231303039396333663230346564396635223b733a33323a226530306265326662626134353539343632626330653435663538313634383964223b733a33323a223763326138613564323665656134353462623336623831326630333464346237223b733a33323a223037323532386534336234333736343266353164313131666139313330633238223b733a33323a223437333165373433313166356134316638353230633966336664303030623837223b733a33323a223962613162303238366161376530353431643136623837373266346665623739223b733a33323a223534613835613130363866373835326331383434343563666134656666343437223b733a33323a223338353161623637303835333630393761613737616138383865323333656637223b733a33323a223837303238633336666362386133656131326666393539366334346130356562223b733a33323a226531326137353562333535303363633437313339306566366135623563316339223b733a33323a226434653565646237323564373534653734306330376561363764336365333462223b733a33323a226333373735363435373062653539336131363834393861353061373436356537223b733a33323a223632666537313738393434663737356164366364656132636464653833356565223b7d733a343a2268617368223b733a36353a2236326665373137383934346637373561643663646561326364646538333565652d6333373735363435373062653539336131363834393861353061373436356537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313033313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223465346363643834653735383866373630306663366434636639313039383862223b733a33323a226666396566363333383931653766613763343531363636383765636234626232223b733a33323a226136303336343166633966623536316438616339633333346439343832626364223b733a33323a223964353065366665636662393165666364643231336162353235616332323662223b733a33323a223236313662306462313532626261623637623064653130323634626161636263223b733a33323a223735316532646330613332653865626365663866613434653733383461326630223b733a33323a226332356237343265386661383937333564613461363032363462373338303934223b733a33323a223661666261386135323231666264663163666633666564393134323833303939223b733a33323a223736383334383239613535386339623331363539383239623438646136326364223b733a33323a226136656331646235386436333462636561393738376239326532666661393036223b733a33323a223164363533653733646230323865313465333933616636333766326166643134223b733a33323a226337653539333166303464306461626631303964633962336463353261373739223b733a33323a223730363165396432636630343635356437643831336564303439393231623365223b733a33323a226536626236653430346531653435373161366534323834386261366438383961223b733a33323a226164643335643032303530646666626663653034623833316438333338626365223b733a33323a223633343761396235356562313235623132626134666663373663623262346166223b733a33323a223734346465326565373136616431386336373866356439626366653232373861223b733a33323a223466373162633162646230656464366538653762313532363537393733653233223b7d733a343a2268617368223b733a36353a2234663731626331626462306564643665386537623135323635373937336532332d3734346465326565373136616431386336373866356439626366653232373861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620130731),
('oekvtlb7d6gf48n9jt0spni5cs', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393139323736342e36333739343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235307463326f686b74636339376a63736d746a31737472317334223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393139353135343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223337323737633631666135646538363334646562663433653362643538333261223b733a33323a223436373635383766313465376535343039366636393364666438613835633134223b7d733a343a2268617368223b733a36353a2234363736353837663134653765353430393666363933646664386138356331342d3337323737633631666135646538363334646562663433653362643538333261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619192764),
('qmkj16v06bk5vcsem8dhturda0', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631363433323335372e3537383633393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f6763696b6431753333393839376b6e6a353669373467653634223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363433333830373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363433353637333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363433353733363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363433353733363b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363433353339323b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226431353230613961663964346137343639306363333130333536313563626365223b733a33323a223733643163373032333639336362383866633335306364373236336435616564223b7d733a343a2268617368223b733a36353a2237336431633730323336393363623838666333353063643732363364356165642d6431353230613961663964346137343639306363333130333536313563626365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313433323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226237386236626563333833323532663531626262306261343630336338383438223b733a33323a223534383839383664336164316338643938396431363834313261373836636536223b733a33323a223665336134643033636461646430393036346636396566343934306635373762223b733a33323a223231376531323339643233613664363038383765666363353162616139303763223b733a33323a223339323031353262626535386331353937636439626135393738393236356136223b733a33323a223261343633663133346161666433643932663765356634306165336630373331223b733a33323a223935363161393964323137643063316465373434303133393663663530653731223b733a33323a223165396637363335376630393163323934376165333135653931346365633664223b733a33323a223263306538373735333938643366303732373364323836303735656463623461223b733a33323a226462336263306234623337393865303134323132376161316230333330383739223b733a33323a223062336265386239373631373335303237663938396131623362633966316637223b733a33323a226635623333646161326565396263613636396439663030303538323637333638223b733a33323a223636313733623165316562616438363963393733643832303238646663633561223b733a33323a223339613331613932616534613461326339386565666561316662613130373965223b733a33323a223739613265396161373262393464633931306662376666363866356338343934223b733a33323a223733396566353134363966616638623337623763373863383834633463656463223b733a33323a223665343837626461353062373665376430336332303963393038303238613531223b733a33323a226231323165396336303131656336303237373639656431393866363137343837223b733a33323a223966376335333764653636623336363133626661363761656138313764343733223b733a33323a223661363338346165623837343334313833313230343639306336636466386364223b733a33323a226431643031333665336639633038383930363030653334613132353931613738223b733a33323a226138346636363262323966383033386664316430396463633433646635303761223b733a33323a223966613262366435306435396164633334653338366532646562653766323739223b733a33323a226437613330303161633737656532376164616565306631666237653231303862223b733a33323a226563386133663232353966633461356366623537656461303738653766386463223b733a33323a223764393033643633316565396163326632633764616632626336666264313237223b733a33323a223735303565383234343834386435356164353531643438643337313530366361223b733a33323a223734623230623033383664626462646432623235363062666662366439376339223b7d733a343a2268617368223b733a36353a2237346232306230333836646264626464326232353630626666623664393763392d3735303565383234343834386435356164353531643438643337313530366361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313335323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223861636236383165666136303963383733626665373337386263336366366133223b733a33323a223663393338363738623165356334386238356265373365386463363165313061223b733a33323a226136393335393434613931396131383836306535636335356630626561316531223b733a33323a223736633439306334633832626163333633653461346163623936656539333538223b733a33323a226134303064386633366437393761613161643535303933356634666431373132223b733a33323a223932303135326361396265333761616132333933643030356136396262373630223b733a33323a226433323334643133616139363534643261616462393263623261393765373636223b733a33323a226534303062646132646130623234353430316265333137343831653135333662223b733a33323a223731323361323531373535323130656533366339633863323632653662656136223b733a33323a223461633264396233616561633036633430383033306136313666303361343461223b733a33323a223339383733636238316532363764366662656166383635343639653437333866223b733a33323a226137346432336264396538643033343261366562376130393135373462353735223b733a33323a223261396239313337616632343463633438653663356665343937336431653534223b733a33323a223038363361383463366537343433303134636363653266623066656637363638223b733a33323a223835393262356162656130333238313463303038353432396432316465656438223b733a33323a223466373963663763663261656663326535626130356534313466653965663535223b733a33323a226233633235366238653064616563666532363538303262373261623561313734223b733a33323a223061323739353434343037346338666562393561393161373838656330306161223b733a33323a226637643130623863376461656330386363313562653338393138343632343235223b733a33323a223934663061656462663630626133313965663134353738633230623634376538223b733a33323a223730623863653831643834373535373434616134306332383337306335666130223b733a33323a223265376638396366666261333833303563396132363162376432376234663432223b733a33323a226232313033653631353538333236633166306266316138313264373262613862223b733a33323a226566666336363535346530396530323030356264633963616334613334633930223b733a33323a223937333361383064656163613536366166663063303939353966623838383037223b733a33323a223232356535333039643162306164306162623963663631366331313665313735223b7d733a343a2268617368223b733a36353a2232323565353330396431623061643061626239636636313663313136653137352d3937333361383064656163613536366166663063303939353966623838383037223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223931626162626438353730663361383361336362343361633934306433393235223b733a33323a226232333963333164646139613332346161393361656132323165366565666665223b733a33323a223631616236316333663739336435653862343631336265336561663764643963223b733a33323a223364623639333761343936396237313465333334646339303036366433383730223b733a33323a223162663261386335336432323633306163656634623435373830353032663139223b733a33323a223562326662623565616136633266316334653265346135316334323135656665223b733a33323a226638386130616235323636663065333364343961663837353830373238616235223b733a33323a226338373937613633303565373933303232376439306464643033636636313463223b733a33323a226536373164653537666332386332306239383530353931316531343936316363223b733a33323a223961663466323831666634303631633532376637363138363835346237666533223b733a33323a223034383432353635353332646263636265343434373633323865653035306262223b733a33323a226233313131336239393539303834663230303635623565656338663431653734223b7d733a343a2268617368223b733a36353a2262333131313362393935393038346632303036356235656563386634316537342d3034383432353635353332646263636265343434373633323865653035306262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226264303334323733373538306362656536336337306364383431393733633137223b733a33323a223938656338333035323763616463383662666331333333353966383031366331223b7d733a343a2268617368223b733a36353a2239386563383330353237636164633836626663313333333539663830313663312d6264303334323733373538306362656536336337306364383431393733633137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1616432357);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('qt1urrmheegh6j402sptf0lnsd', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383030323035362e3530383437383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22663570646f36346d7132663936636967396866376c766b756375223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383030313934353b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383030333639373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383030353634393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383030353435303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383030343236363b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383030333935333b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223938313332363262313362363233376532306361386336643065393933363561223b733a33323a223335343261343337613334653666643639346462313961616264633431313833223b7d733a343a2268617368223b733a36353a2233353432613433376133346536666436393464623139616162646334313138332d3938313332363262313362363233376532306361386336643065393933363561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226361356131383166666537343636363537306231633631343330363731326565223b733a33323a223531383636393538643937623565636139626434653532386139386333393933223b733a33323a226338616638393834636237356262316536363939323336386562663163393336223b733a33323a223939646333613361373832353331613161303432643132386539303434393935223b7d733a343a2268617368223b733a36353a2239396463336133613738323533316131613034326431323865393034343939352d6338616638393834636237356262316536363939323336386562663163393336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313735323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31383a7b733a33323a223666356133316363363064353130613839366131636262323939366164303032223b733a33323a226264393237636335363135643666366565613561626135623465363966383631223b733a33323a223333326538616438373466353636643237653663393630386431366130363639223b733a33323a226430353466626630363734313332653162386332333735643363386664303739223b733a33323a226132643964663233623030663431646230383765333136616634303062623135223b733a33323a226666343830653831306636303935636563396434626238303664326338643262223b733a33323a226461383863386537666464663166396163316431376564393536306636356330223b733a33323a226535623062353935646533633666306138366334666531383536613965613039223b733a33323a223634343962373134383365633738373361303633623030613733656566393563223b733a33323a226535376631353062306437343230323131343564313131393038326436313335223b733a33323a223466646666393232316464663836323035303737336134663561303334326365223b733a33323a223632346630396330663430326639343731376363653139393934343830383639223b733a33323a223935623130316431636464393839623936353765346133323331363661326136223b733a33323a223134656433363234666139373233356633643930306636336462653866396534223b733a33323a223037316531303831376165316331316436356464333730363463643031653066223b733a33323a226563633261663664326337376661646630313463313362343435326435386666223b733a33323a226133616161366131323636643332626333323363663066653162373531663261223b733a33323a223463333232323561616166633166353132663335353036383665343862633736223b733a33323a223738373238393666303236663535356661623762336561643637343838653139223b733a33323a226231373361353432363564666536383533326338323837373335376561333266223b733a33323a223561393130373665383036323834653265373361323464386566323262373239223b733a33323a226565613635336266323265306438623238656266373334633137316164623962223b733a33323a223937393130323463633930323766333563333162353864373631636637356139223b733a33323a223636336163313739373135316332666430666232393262363831646435353762223b733a33323a226562616332393739316632356632623139336330633537313232616562346564223b733a33323a223061346439333831633435393266323931353837623462633938313530656232223b733a33323a223336363238656634663838333436616333333230393230313632633566323839223b733a33323a223262363032373832333338383432333336623263396238356163623038616232223b733a33323a223932653235366431393634363063626261623864316439333436636537396335223b733a33323a226164363435303834373633313932353565666330326339626236363134633636223b733a33323a223135313234623765326330306164303437633836316132366366636337393966223b733a33323a223836306366383734306263353766386561633261643932363332613136643261223b733a33323a226366626138386464323738393062616163653538316136376531303931656566223b733a33323a223964393439663463363366363635333562633838343665343937643735626437223b733a33323a223762316434643966383937623135363532336665346232303834373765323266223b733a33323a223865306131396337363231396436353535333663643166336535663366643934223b7d733a343a2268617368223b733a36353a2238653061313963373632313964363535353336636431663365356633666439342d3762316434643966383937623135363532336665346232303834373765323266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223862373031653332393264363435313665653735666331306530656433303334223b733a33323a223932393930666165346134356338363431376635666433636432613738346138223b733a33323a223431343266616538303239373835343930643663373365623566363639383936223b733a33323a223430343931396437623161623663636133393465613430356234653365666330223b733a33323a223266326665313231393465613330383538363164386661373436613839323235223b733a33323a223235353835613264326236626366383832386638373163353531343665336461223b733a33323a223763396339386363393836363334616239343130326264356438623830363836223b733a33323a223733666162636131393864333666326563316264303163353935356537306336223b733a33323a223966666265313437623862303631383631643833393638326665666537326235223b733a33323a223838666335316463323231303132633236343634643662656536626364333264223b733a33323a226632343261623266383566366635623534633030623232343730343765383664223b733a33323a223439313261363836633866353834386561646435626361613036663864653732223b733a33323a223039643933663363633266656361646532343565313732376563616132373833223b733a33323a223766656363383364343265323462666165306537303266656336666663663363223b7d733a343a2268617368223b733a36353a2237666563633833643432653234626661653065373032666563366666636633632d3039643933663363633266656361646532343565313732376563616132373833223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226132346564653532333165333965313063356362393134643238623062643633223b733a33323a223036373662386131616563636361613837613463646130386165653434356663223b733a33323a223438643237373662316165656361623464626138663132336431356263393163223b733a33323a226264393537326664313939343464666532643233333066653232316535666261223b733a33323a226237393334373239633362636632613965633037613136326235393338383661223b733a33323a226230383933656364393132356362333062393236653334396662323961646236223b733a33323a226238663539626666303234346638616530383630346637666334666639663332223b733a33323a223766333263623934653839313362613437386139383461626662653964316631223b733a33323a223037373330646535306662336162633834353936643433616138353737363637223b733a33323a226130616638656266306533643561343561326637333030396465623662636539223b733a33323a223866663235643463326635353364313031663263393066313262616363393063223b733a33323a223435666565343239316130316136383939396136353038393335376236633463223b7d733a343a2268617368223b733a36353a2234356665653432393161303161363839393961363530383933353762366334632d3866663235643463326635353364313031663263393066313262616363393063223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226239383266306636646463616263383630613831623933376532616261383430223b733a33323a226632616533653332326134666465363561636465633438373739353938346630223b7d733a343a2268617368223b733a36353a2266326165336533323261346664653635616364656334383737393539383466302d6239383266306636646463616263383630613831623933376532616261383430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618002056),
('tgpbvjd9matf9s85n7gbpnng7u', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393830303334332e3334353139353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22657534616e3673736438333930697369356e316370653136336d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393830333839353b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d735f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223834373633643035636135356230376532346263373036613361333564373838223b733a33323a223538343464396337306664353637666534303063313037376538333638386665223b733a33323a223239353235313636653263373662333866633130626261623430353433316166223b733a33323a226563613030396562323535653066626464363566373565333335663630373762223b7d733a343a2268617368223b733a36353a2265636130303965623235356530666264643635663735653333356636303737622d3239353235313636653263373662333866633130626261623430353433316166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619800343);

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
('administrator_email', '\"rayane.el-jounaid.auditeur@lecnam.net\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omeka-s_medas1_20-21\"'),
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
(2, NULL, 1, 'site-items', 'foundation', 'Site Items', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]}]', '[]', '2021-04-30 14:10:34', '2021-04-30 15:47:23', 1, 1);

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
(2, 2, 'welcome', 'Welcome', 1, '2021-04-30 14:10:34', '2021-04-30 14:10:34');

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
(2, 2, 'html', '{\"html\":\"Welcome to your new site. This is an example page.\"}', 1);

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
(2, 2, 1, 'admin');

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
('attachment_link_type', 2, '\"item\"'),
('browse_attached_items', 2, '\"0\"'),
('browse_body_property_term', 2, '\"\"'),
('browse_heading_property_term', 2, '\"\"'),
('disable_jsonld_embed', 2, '\"0\"'),
('item_media_embed', 2, '\"0\"'),
('locale', 2, '\"\"'),
('search_resource_names', 2, '[\"site_pages\",\"items\",\"item_sets\"]'),
('search_restrict_templates', 2, '\"0\"'),
('search_type', 2, '\"sitewide\"'),
('show_attached_pages', 2, '\"1\"'),
('show_page_pagination', 2, '\"1\"'),
('show_user_bar', 2, '\"0\"');

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
(1, 'rayane.el-jounaid.auditeur@lecnam.net', 'Rayane EL JOUNAID', '2021-02-23 11:06:01', '2021-02-23 11:18:20', '$2y$10$0Fi4vUTY3lf1i275oxIEEu.bpsjPHBMoVjL.7JBfQAME95mhrPjvK', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-02-23 11:16:58', '2021-02-23 11:17:17', '$2y$10$q5ScvvOSqgfqnLdpVoRFDueOkKHLZH98NwsR2LAcaBPwI3XGrvd..', 'global_admin', 1);

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
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"en_US\"'),
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
(1, 1, 1, NULL, 'literal', 'FR', 'Titi', NULL, 1),
(2, 1, 1, NULL, 'literal', 'EN', 'Tweety', NULL, 1),
(3, 1, 4, NULL, 'literal', '', 'Petit oiseau malin', NULL, 1),
(4, 3, 1, NULL, 'literal', '', 'Gros minet', NULL, 1),
(5, 4, 1, NULL, 'literal', '', 'Antoine de Saint-Exupéry', NULL, 1),
(6, 4, 4, NULL, 'literal', '', 'Romancier', NULL, 1),
(7, 5, 1, NULL, 'literal', '', 'Le Petit Prince', NULL, 1),
(8, 5, 4, NULL, 'literal', '', 'Roman', NULL, 1),
(9, 6, 1, NULL, 'literal', '', 'Roman', NULL, 1),
(10, 6, 4, NULL, 'literal', '', 'Le roman est un genre littéraire caractérisé essentiellement par une narration fictionnelle', NULL, 1),
(11, 7, 1, NULL, 'literal', '', 'Title', NULL, 1),
(12, 7, 4, NULL, 'literal', '', 'Description', NULL, 1),
(13, 8, 1, NULL, 'literal', '', 'Albert Camus', NULL, 1),
(14, 9, 1, NULL, 'literal', '', 'L\'Étranger', NULL, 1),
(15, 9, 4, NULL, 'literal', '', 'Roman', NULL, 1),
(16, 10, 199, NULL, 'literal', '', '1', NULL, 1),
(17, 10, 196, NULL, 'literal', '', 'Europe', NULL, 1),
(18, 10, 200, NULL, 'literal', '', '750', NULL, 1),
(19, 10, 201, NULL, 'literal', '', '1205', NULL, 1),
(20, 11, 195, NULL, 'literal', '', '1', NULL, 1),
(21, 11, 196, NULL, 'literal', '', 'MARTIN', NULL, 1),
(22, 11, 197, NULL, 'literal', '', 'William', NULL, 1),
(23, 11, 198, NULL, 'literal', '', '25', NULL, 1),
(24, 12, 202, NULL, 'literal', '', '1', NULL, 1),
(25, 12, 203, NULL, 'literal', '', 'vaccin', NULL, 1),
(26, 12, 204, NULL, 'literal', '', '600', NULL, 1),
(27, 12, 205, NULL, 'literal', '', '2021-05-09', NULL, 1),
(28, 12, 199, NULL, 'literal', '', '2', NULL, 1),
(29, 13, 206, NULL, 'literal', '', '1', NULL, 1),
(30, 13, 205, NULL, 'literal', '', '2021-05-04', NULL, 1),
(31, 13, 203, NULL, 'literal', '', 'test', NULL, 1),
(32, 13, 195, NULL, 'literal', '', '1', NULL, 1),
(33, 13, 199, NULL, 'literal', '', '1', NULL, 1),
(34, 10, 1, NULL, 'literal', '', 'Centre médical Europe', NULL, 1),
(35, 11, 1, NULL, 'literal', '', 'Personne MARTIN', NULL, 1),
(36, 12, 1, NULL, 'literal', '', 'Livraison 1', NULL, 1),
(37, 13, 1, NULL, 'literal', '', 'RDV  1', NULL, 1);

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
(5, 1, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', 'book'),
(6, 1, 'https://livres.yaya.fr/onto/jdc#', 'rls', 'vocab_livres', ''),
(9, 1, 'https://covid.yaya.fr/covid-19/', 'cov', 'Covid-19', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
