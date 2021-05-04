-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: May 04, 2021 at 01:23 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omeka`
--
CREATE DATABASE IF NOT EXISTS `omeka` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `omeka`;

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
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
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
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
-- Table structure for table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(3, 'site_pages', 1, 1, 'Fournisseurs', ''),
(4, 'items', 1, 1, 'ope_azerty', 'ope_azerty\nope@company.fr\nidf\nbati005\ntelecom\napprovisionneur'),
(4, 'site_pages', 1, 1, 'Commandes', ''),
(5, 'items', 1, 1, 'suppr', 'suppr\nsuppr\n7 rue Balou\nsuppr@suppr.fr'),
(5, 'site_pages', 1, 1, 'Commandes', ''),
(6, 'items', 1, 1, 'cable EP 200m', 'cable EP 200m\nEP\nCAB'),
(6, 'site_pages', 1, 1, 'Besoins', ''),
(7, 'items', 1, 1, 'cable lampadaire', 'cable lampadaire\n20/04/2021\ncable 200m\n2\n22 avenue du pli\nope_azerty'),
(8, 'items', 1, 1, 'lampadaire avenue du pli', 'lampadaire avenue du pli\n20/04/2021\ncable EP 200m\n3\nsuppr\n22 avenue du pli\nope_azerty\ncable lampadaire'),
(9, 'items', 1, 1, 'Martin', 'Martin\nmartin\n21\nici\n06 12 XX XX XX'),
(10, 'items', 1, 1, 'pcr', 'pcr\n50'),
(11, 'items', 1, 1, 'Albo', 'Albo\npablo\ninfirmier_e\n06 51 XX XX XX'),
(12, 'items', 1, 1, 'antigenique', 'antigenique\n30\nNantes'),
(13, 'items', 1, 1, '2021-05-04', 'Albo\nMartin\n2021-05-04\n16:45\nantigenique\nnon\nNantes'),
(14, 'items', 1, 1, 'Martin', 'Martin\nmartin\n21\nici\n06 12 XX XX XX');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
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
(14);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
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
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T21:52:15+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 21:52:15', '2021-05-02 21:52:15'),
(2, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T21:53:04+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 21:53:04', '2021-05-02 21:53:04'),
(3, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T21:54:20+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 21:54:20', '2021-05-02 21:54:20'),
(4, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-02T21:55:09+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-02 21:55:09', '2021-05-02 21:55:09'),
(5, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"owner_id\":\"\"}},\"action\":\"add\"}', '2021-05-03T08:25:29+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 08:25:29', '2021-05-03 08:25:29'),
(6, 1, NULL, 'error', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"2\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"remove_all\"}', '2021-05-03T08:25:52+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:57\nStack trace:\n#0 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\MAMP\\htdocs\\omeka\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\MAMP\\htdocs\\omeka\\application\\src\\Controller\\SiteAdmin\\IndexController.php(254): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Updat...\', Array)\n#3 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(77): Omeka\\Controller\\SiteAdmin\\IndexController->resourcesAction()\n#4 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(103): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(139): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(321): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(178): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\MAMP\\htdocs\\omeka\\vendor\\laminas\\laminas-mvc\\src\\Application.php(331): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\MAMP\\htdocs\\omeka\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2021-05-03 08:25:52', '2021-05-03 08:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
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
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
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
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('UniversalViewer', 1, '3.6.4.3');

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('tjXRTKuK70i1zl41K41OaPMDPbutcLha', 2, '2021-04-17 13:56:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
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
(185, 1, 5, 'inseeCode', 'INSEE code', 'numerical indexing code used by the French National Institute for Statistics and Economic Studies (INSEE) to identify various entities'),
(186, 1, 6, 'subOrganizationOf', 'subOrganization of', 'Represents hierarchical containment of Organizations or OrganizationalUnits; indicates an Organization which contains this Organization. Inverse of `org:hasSubOrganization`.'),
(187, 1, 6, 'transitiveSubOrganizationOf', 'transitive sub-organization', 'The transitive closure of subOrganizationOf, giving a representation of all organizations that contain this one. Note that technically this is a super property of the transitive closure so it could contain additional assertions but such usage is discouraged.'),
(188, 1, 6, 'hasSubOrganization', 'has SubOrganization', 'Represents hierarchical containment of Organizations or Organizational Units; indicates an organization which is a sub-part or child of this organization.  Inverse of `org:subOrganizationOf`.'),
(189, 1, 6, 'purpose', 'purpose', 'Indicates the purpose of this Organization. There can be many purposes at different levels of abstraction but the nature of an organization is to have a reason for existence and this property is a means to document that reason. An Organization may have multiple purposes. It is recommended that the purpose be denoted by a controlled term or code list, ideally a `skos:Concept`. However, the range is left open to allow for other types of descriptive schemes. It is expected that specializations or application profiles of this vocabulary will constrain the range of the purpose. Alternative names: _remit_ _responsibility_ (esp. if applied to OrganizationalUnits such as Government Departments).'),
(190, 1, 6, 'hasUnit', 'has Unit', 'Indicates a unit which is part of this Organization, e.g. a Department within a larger FormalOrganization. Inverse of `org:unitOf`.'),
(191, 1, 6, 'unitOf', 'unit Of', 'Indicates an Organization of which this Unit is a part, e.g. a Department within a larger FormalOrganization. This is the inverse of `org:hasUnit`.'),
(192, 1, 6, 'classification', 'classification', 'Indicates a classification for this Organization within some classification scheme. Extension vocabularies may wish to specialize this property to have a range corresponding to a specific `skos:ConceptScheme`. This property is under discussion and may be revised or removed - in many cases organizations are best categorized by defining a sub-class hierarchy in an extension vocabulary.'),
(193, 1, 6, 'identifier', 'identifier', 'Gives an identifier, such as a company registration number, that can be used to used to uniquely identify the organization. Many different national and international identier schemes are available. The org ontology is neutral to which schemes are used. The particular identifier scheme should be indicated by the datatype of the identifier value.  Using datatypes to distinguish the notation scheme used is consistent with recommended best practice for `skos:notation` of which this property is a specialization.'),
(194, 1, 6, 'linkedTo', 'linked to', 'Indicates an arbitrary relationship between two organizations. Specializations of this can be used to, for example, denote funding or supply chain relationships.'),
(195, 1, 6, 'memberOf', 'member of', 'Indicates that a person is a member of the Organization with no indication of the nature of that membership or the role played. Note that the choice of property name is not meant to limit the property to only formal membership arrangements, it is also indended to cover related concepts such as affilliation or other involvement in the organization. Extensions can specialize this relationship to indicate particular roles within the organization or more nuanced relationships to the organization. Has an optional inverse, `org:hasmember`.'),
(196, 1, 6, 'hasMember', 'has member', 'Indicates a person who is a member of the subject Organization. Inverse of `org:memberOf`, see that property for further clarification. Provided for compatibility with `foaf:member`.'),
(197, 1, 6, 'reportsTo', 'reports to', 'Indicates a reporting relationship as might be depicted on an organizational chart. The precise semantics of the reporting relationship will vary by organization but is intended to encompass both direct supervisory relationships (e.g. carrying objective and salary setting authority) and more general reporting or accountability relationships (e.g. so called _dotted line_ reporting).'),
(198, 1, 6, 'member', 'member', 'Indicates the Person (or other Agent including Organization) involved in the Membership relationship. Inverse of `org:hasMembership`'),
(199, 1, 6, 'organization', 'organization', 'Indicates Organization in which the Agent is a member.'),
(200, 1, 6, 'role', 'role', 'Indicates the Role that the Agent plays in a Membership relationship with an Organization.'),
(201, 1, 6, 'hasMembership', 'membership', 'Indicates a membership relationship that the Agent plays. Inverse of `org:member`.'),
(202, 1, 6, 'memberDuring', 'member During', 'Optional property to indicate the interval for which the membership is/was valid.'),
(203, 1, 6, 'roleProperty', 'role (property)', 'This is a metalevel property which is used to annotate an `org:Role` instance with a sub-property of `org:memberOf` that can be used to directly indicate the role for easy of query. The intended semantics is a Membership relation involving the Role implies the existence of a direct property relationship through an inference rule of the form:  `{ [] org:member ?p; org:organization ?o; org:role [org:roleProperty ?r] } -> {?p ?r ?o}`.'),
(204, 1, 6, 'headOf', 'head of', 'Indicates that a person is the leader or formal head of the Organization. This will normally mean that they are the root of the `org:reportsTo` (acyclic) graph, though an organization may have more than one head.'),
(205, 1, 6, 'remuneration', 'remuneration', 'Indicates a salary or other reward associated with the role. Typically this will be denoted using an existing representation scheme such as `gr:PriceSpecification` but the range is left open to allow applications to specialize it (e.g. to remunerationInGBP).'),
(206, 1, 6, 'siteAddress', 'site Address', 'Indicates an address for the site in a suitable encoding. Use of vCard (using the http://www.w3.org/TR/vcard-rdf/ vocabulary) is encouraged but the range is left open to allow other encodings to be used. The address may include email, telephone, and geo-location information and is not restricted to a physical address. '),
(207, 1, 6, 'hasSite', 'has site', 'Indicates a site at which the Organization has some presence even if only indirect (e.g. virtual office or a professional service which is acting as the registered address for a company). Inverse of `org:siteOf`.'),
(208, 1, 6, 'siteOf', 'site Of', 'Indicates an Organization which has some presence at the given site. This is the inverse of `org:hasSite`.'),
(209, 1, 6, 'hasPrimarySite', 'primary Site', 'Indicates a primary site for the Organization, this is the default means by which an Organization can be contacted and is not necessarily the formal headquarters.'),
(210, 1, 6, 'hasRegisteredSite', 'registered Site', 'Indicates the legally registered site for the organization, in many legal jurisdictions there is a requirement that FormalOrganizations such as Companies or Charities have such a primary designed site. '),
(211, 1, 6, 'basedAt', 'based At', 'Indicates the site at which a person is based. We do not restrict the possibility that a person is based at multiple sites.'),
(212, 1, 6, 'location', 'location', 'Gives a location description for a person within the organization, for example a _Mail Stop_ for internal posting purposes.'),
(213, 1, 6, 'originalOrganization', 'original organization', 'Indicates one or more organizations that existed before the change event. Depending on the event they may or may not have continued to exist after the event. Inverse of `org:changedBy`.'),
(214, 1, 6, 'changedBy', 'changed by', 'Indicates a change event which resulted in a change to this organization. Depending on the event the organization may or may not have continued to exist after the event. Inverse of `org:originalOrganization`.'),
(215, 1, 6, 'resultedFrom', 'resulted from', 'Indicates an event which resulted in this organization. Inverse of `org:resultingOrganization`.'),
(216, 1, 6, 'resultingOrganization', 'resulted in', 'Indicates an organization which was created or changed as a result of the event. Inverse of `org:resultedFrom`.'),
(217, 1, 6, 'holds', 'holds', 'Indicates a Post held by some Agent.'),
(218, 1, 6, 'heldBy', 'held by', 'Indicates an Agent which holds a Post.'),
(219, 1, 6, 'postIn', 'post in', 'Indicates the Organization in which the Post exists.'),
(220, 1, 6, 'hasPost', 'post', 'Indicates a Post which exists within the Organization.'),
(221, 1, 8, 'hasEMail', 'hasEMail', NULL),
(222, NULL, 5, 'region', 'region', 'The regin where the thing is located or is connected to.'),
(223, NULL, 5, 'locationIdentifier', 'Location Identifier', NULL),
(236, 1, 11, 'has_article', 'has_article', NULL),
(237, 1, 11, 'has_fournisseur', 'has_fournisseur', NULL),
(238, 1, 11, 'has_operateur', 'has_operateur', NULL),
(239, 1, 11, 'has_commande', 'has_commande', NULL),
(240, 1, 11, 'famille_article', 'famille_article', NULL),
(241, 1, 11, 'ss_famille_article', 'ss_famille_article', NULL),
(242, 1, 11, 'contact', 'contact', NULL),
(243, 1, 11, 'quantite', 'quantite', NULL),
(244, 1, 11, 'adresse_livraison', 'adresse_livraison', NULL),
(245, 1, 11, 'article_demande', 'article_demande', NULL),
(246, NULL, 11, 'has_dem_ach', 'has_dem_ach', NULL),
(247, NULL, 11, 'cmd_has_dem_ach', 'commande a comme demande d\'achat', NULL),
(248, 1, 12, 'nom', 'Nom', NULL),
(249, 1, 12, 'prenom', 'Prenom', NULL),
(250, 1, 12, 'age', 'Age', NULL),
(251, 1, 12, 'adresse', 'Adresse', NULL),
(252, 1, 12, 'nb_dispo', 'Quantité disponible', NULL),
(253, 1, 12, 'tel', 'Tel', NULL),
(254, 1, 12, 'tel_pro', 'Tel pro', NULL),
(255, 1, 12, 'poste', 'Poste', NULL),
(256, 1, 12, 'heure', 'Heure', NULL),
(257, 1, 12, 'avec_ordonnance', 'Y a-t-il une ordonnance ?', NULL),
(258, 1, 12, 'pos_ou_neg', 'Le résultat du test est-il positif ou négatif ?', NULL),
(259, 1, 12, 'commentaire', 'Commentaire(s)', NULL),
(260, NULL, 12, 'has_encadrant', 'encadré par', NULL),
(261, NULL, 12, 'has_personne', 'rdv pour', NULL),
(262, NULL, 12, 'has_test', 'avec le test', NULL),
(263, NULL, 12, 'has_rdv', 'concernant le rdv', NULL),
(264, NULL, 12, 'lieu', 'Lieu du test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
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
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 1, 133, 2, NULL, 'ope_azerty', 1, '2021-04-20 07:59:39', '2021-05-02 22:09:39', 'Omeka\\Entity\\Item'),
(5, 1, 135, 3, NULL, 'suppr', 1, '2021-04-20 08:01:07', '2021-05-02 22:09:27', 'Omeka\\Entity\\Item'),
(6, 1, 134, 4, NULL, 'cable EP 200m', 1, '2021-04-20 08:02:25', '2021-05-02 22:09:13', 'Omeka\\Entity\\Item'),
(7, 1, 130, 5, NULL, 'cable lampadaire', 1, '2021-04-20 08:05:03', '2021-05-02 21:57:47', 'Omeka\\Entity\\Item'),
(8, 1, 131, 6, NULL, 'lampadaire avenue du pli', 1, '2021-04-20 08:08:37', '2021-05-02 22:08:46', 'Omeka\\Entity\\Item'),
(9, 1, 136, 8, NULL, 'Martin', 1, '2021-05-04 11:17:02', '2021-05-04 11:31:31', 'Omeka\\Entity\\Item'),
(10, 1, 137, 9, NULL, 'pcr', 1, '2021-05-04 11:25:11', '2021-05-04 11:31:21', 'Omeka\\Entity\\Item'),
(11, 1, 138, 10, NULL, 'Albo', 1, '2021-05-04 11:26:02', '2021-05-04 11:31:07', 'Omeka\\Entity\\Item'),
(12, 1, 137, 9, NULL, 'antigenique', 1, '2021-05-04 11:29:34', '2021-05-04 13:21:59', 'Omeka\\Entity\\Item'),
(13, 1, 139, 11, NULL, '2021-05-04', 1, '2021-05-04 11:30:27', '2021-05-04 11:54:55', 'Omeka\\Entity\\Item'),
(14, 1, 136, 8, NULL, 'Martin', 1, '2021-05-04 11:55:40', '2021-05-04 11:55:40', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_class`
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
(106, NULL, 5, 'Place', 'place', 'Immobile things or locations.'),
(107, 1, 6, 'Organization', 'Organization', 'Represents a collection of people organized together into a community or other social, commercial or political structure. The group has some common purpose or reason for existence which goes beyond the set of people belonging to it and can act as an Agent. Organizations are often decomposable into hierarchical structures.  It is recommended that SKOS lexical labels should be used to label the Organization. In particular `skos:prefLabel` for the primary (possibly legally recognized name), `skos:altLabel` for alternative names (trading names, colloquial names) and `skos:notation` to denote a code from a code list. Alternative names: _Collective_ _Body_ _Org_ _Group_'),
(108, 1, 6, 'FormalOrganization', 'Formal Organization', 'An Organization which is recognized in the world at large, in particular in legal jurisdictions, with associated rights and responsibilities. Examples include a Corporation, Charity, Government or Church. Note that this is a super class of `gr:BusinessEntity` and it is recommended to use the GoodRelations vocabulary to denote Business classifications such as DUNS or NAICS.'),
(109, 1, 6, 'OrganizationalUnit', 'OrganizationalUnit', 'An Organization such as a University Support Unit which is part of some larger FormalOrganization and only has full recognition within the context of that FormalOrganization, it is not a Legal Entity in its own right. Units can be large and complex containing other Units and even FormalOrganizations. Alternative names: _OU_ _Unit_ _Department_'),
(110, 1, 6, 'Role', 'Role', 'Denotes a role that a Person or other Agent can take in an organization. Instances of this class describe the abstract role; to denote a specific instance of a person playing that role in a specific organization use an instance of `org:Membership`. It is common for roles to be arranged in some taxonomic structure and we use SKOS to represent that. The normal SKOS lexical properties should be used when labelling the Role. Additional descriptive properties for the Role, such as a Salary band, may be added by extension vocabularies.'),
(111, 1, 6, 'Membership', 'Membership', 'Indicates the nature of an Agent\'s membership of an organization. Represents an n-ary relation between an Agent, an Organization and a Role. It is possible to directly indicate membership, independent of the specific Role, through use of the `org:memberOf` property.'),
(112, 1, 6, 'Site', 'Site', 'An office or other premise at which the organization is located. Many organizations are spread across multiple sites and many sites will host multiple locations. In most cases a Site will be a physical location. However, we don\'t exclude the possibility of non-physical sites such as a virtual office with an associated post box and phone reception service. Extensions may provide subclasses to denote particular types of site.'),
(113, 1, 6, 'OrganizationalCollaboration', 'Endeavour', 'A collaboration between two or more Organizations such as a project. It meets the criteria for being an Organization in that it has an identity and defining purpose independent of its particular members but is neither a formally recognized legal entity nor a sub-unit within some larger organization. Might typically have a shorter lifetime than the Organizations within it, but not necessarily. All members are `org:Organization`s rather than individuals and those Organizations can play particular roles within the venture. Alternative names: _Project_ _Venture_  _Endeavour_ _Consortium_ _Endeavour_'),
(114, 1, 6, 'ChangeEvent', 'Change Event', 'Represents an event which resulted in a major change to an organization such as a merger or complete restructuring. It is intended for situations where the resulting organization is sufficient distinct from the original organizations that it has a distinct identity and distinct URI. Extension vocabularies should define sub-classes of this to denote particular categories of event. The instant or interval at which the event occurred should be given by `prov:startAtTime` and `prov:endedAtTime`, a description should be given by `dct:description`. '),
(115, 1, 6, 'Post', 'Post', 'A Post represents some position within an organization that exists independently of the person or persons filling it. Posts may be used to represent situations where a person is a member of an organization ex officio (for example the Secretary of State for Scotland is part of UK Cabinet by virtue of being Secretary of State for Scotland, not as an individual person). A post can be held by multiple people and hence can be treated as a organization in its own right.'),
(117, NULL, 5, 'Group', 'group', 'An (informal) group of people.'),
(130, 1, 11, 'demande_achat', 'demande_achat', NULL),
(131, 1, 11, 'commande', 'commande', NULL),
(132, 1, 11, 'facture', 'facture', NULL),
(133, 1, 11, 'operateur', 'operateur', NULL),
(134, 1, 11, 'article', 'article', NULL),
(135, 1, 11, 'fournisseur', 'fournisseur', NULL),
(136, 1, 12, 'personne', 'Personne', NULL),
(137, 1, 12, 'test', 'Test', NULL),
(138, 1, 12, 'encadrant', 'Encadrant', NULL),
(139, 1, 12, 'rdv', 'RDV', NULL),
(140, 1, 12, 'resultat', 'Résultat', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 133, NULL, NULL, 'Operator'),
(3, 1, 135, NULL, NULL, 'Supplier'),
(4, 1, 134, NULL, NULL, 'Article'),
(5, 1, 130, NULL, NULL, 'Buying Demand'),
(6, 1, 131, NULL, NULL, 'Order'),
(7, 1, 132, NULL, NULL, 'Invoice'),
(8, 1, 136, 248, NULL, 'Personne'),
(9, 1, 137, NULL, NULL, 'Test'),
(10, 1, 138, 248, NULL, 'Encadrant'),
(11, 1, 139, 7, NULL, 'RDV'),
(12, 1, 140, 263, NULL, 'Resultat');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
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
-- Dumping data for table `resource_template_property`
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
(26, 2, 221, NULL, NULL, 2, NULL, 0, 0),
(27, 2, 212, NULL, NULL, 3, NULL, 0, 0),
(29, 2, 199, NULL, NULL, 5, NULL, 0, 0),
(30, 2, 200, NULL, NULL, 6, NULL, 0, 0),
(31, 2, 223, NULL, NULL, 4, NULL, 0, 0),
(33, 3, 138, NULL, NULL, 2, NULL, 0, 0),
(34, 3, 212, NULL, NULL, 3, NULL, 0, 0),
(40, 5, 45, NULL, NULL, 2, NULL, 0, 0),
(46, 3, 1, NULL, NULL, 1, NULL, 0, 0),
(59, 7, 45, NULL, NULL, 2, NULL, 0, 0),
(66, 6, 20, NULL, NULL, 2, NULL, 0, 0),
(75, 4, 1, NULL, NULL, 1, NULL, 0, 0),
(76, 5, 1, NULL, NULL, 1, NULL, 0, 0),
(77, 7, 1, NULL, NULL, 1, NULL, 0, 0),
(78, 2, 1, NULL, NULL, 1, NULL, 0, 0),
(79, 6, 1, NULL, NULL, 1, NULL, 0, 0),
(80, 4, 240, NULL, NULL, 2, NULL, 0, 0),
(81, 4, 241, NULL, NULL, 3, NULL, 0, 0),
(82, 4, 237, NULL, NULL, 4, NULL, 0, 0),
(83, 5, 245, NULL, NULL, 3, NULL, 0, 0),
(84, 5, 243, NULL, NULL, 4, NULL, 0, 0),
(85, 5, 244, NULL, NULL, 5, NULL, 0, 0),
(86, 5, 238, NULL, NULL, 6, NULL, 0, 0),
(87, 7, 236, NULL, NULL, 3, NULL, 0, 0),
(88, 7, 243, NULL, NULL, 4, NULL, 0, 0),
(89, 7, 237, NULL, NULL, 5, NULL, 0, 0),
(90, 7, 244, NULL, NULL, 6, NULL, 0, 0),
(91, 6, 236, NULL, NULL, 3, NULL, 0, 0),
(92, 6, 243, NULL, NULL, 4, NULL, 0, 0),
(93, 6, 237, NULL, NULL, 5, NULL, 0, 0),
(94, 6, 244, NULL, NULL, 6, NULL, 0, 0),
(95, 6, 238, NULL, NULL, 7, NULL, 0, 0),
(96, 3, 242, NULL, NULL, 4, NULL, 0, 0),
(97, 6, 246, NULL, NULL, 8, NULL, 0, 0),
(99, 8, 248, NULL, NULL, 1, NULL, 0, 0),
(100, 8, 249, NULL, NULL, 2, NULL, 0, 0),
(101, 8, 250, NULL, NULL, 3, NULL, 0, 0),
(102, 8, 251, NULL, NULL, 4, NULL, 0, 0),
(103, 8, 253, NULL, NULL, 5, NULL, 0, 0),
(104, 8, 4, NULL, NULL, 6, NULL, 0, 0),
(105, 9, 1, NULL, NULL, 1, NULL, 0, 0),
(106, 9, 252, NULL, NULL, 2, NULL, 0, 0),
(107, 9, 4, NULL, NULL, 4, NULL, 0, 0),
(109, 10, 248, NULL, NULL, 1, NULL, 0, 0),
(110, 10, 249, NULL, NULL, 2, NULL, 0, 0),
(111, 10, 255, NULL, NULL, 3, NULL, 0, 0),
(112, 10, 254, NULL, NULL, 4, NULL, 0, 0),
(113, 10, 4, NULL, NULL, 5, NULL, 0, 0),
(115, 11, 260, NULL, NULL, 1, NULL, 0, 0),
(116, 11, 261, NULL, NULL, 2, NULL, 0, 0),
(117, 11, 7, NULL, NULL, 3, NULL, 0, 0),
(118, 11, 256, NULL, NULL, 4, NULL, 0, 0),
(119, 11, 262, NULL, NULL, 5, NULL, 0, 0),
(120, 11, 257, NULL, NULL, 6, NULL, 0, 0),
(121, 11, 4, NULL, NULL, 8, NULL, 0, 0),
(123, 12, 263, NULL, NULL, 1, NULL, 0, 0),
(124, 12, 258, NULL, NULL, 2, NULL, 0, 0),
(126, 12, 259, NULL, NULL, 3, NULL, 0, 0),
(127, 11, 264, NULL, NULL, 7, NULL, 0, 0),
(128, 9, 264, NULL, NULL, 3, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('897c735c993004291033fcaeb323acc9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393939383331372e35363532313839323534373630373432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223839376337333563393933303034323931303333666361656233323361636339223b7d7d, 1619998323),
('a4a1e30ba820e7fb2c208e70130b2e62', 0x5f5f4c616d696e61737c613a31323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303133343533302e333638313139393535303632383636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226330386564663735626166383935383065373933626235613331356266323839223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383837333139333b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133323739353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133383133303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133383031313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303133383133303b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f556e6976657273616c5669657765725f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313631383837363232363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133323830313b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033333935373b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393939373434333b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393939373132373b7d7d72656469726563745f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73743a38312f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223861373133636261633066333235326335626335373938663666386234383162223b733a33323a223137646438316664363136643638633039366335623931316435366635356337223b7d733a343a2268617368223b733a36353a2231376464383166643631366436386330393663356239313164353666353563372d3861373133636261633066333235326335626335373938663666386234383162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223664386134623766656366663162303631393233633361326232323831383837223b733a33323a223161346637643739393036613063336431333231353561386566383937663463223b733a33323a223936316266633338626538623634633835386137303664316231613534323731223b733a33323a223161393465616639663235333162663638613061636462666163626461366536223b733a33323a223332333830383030613738303733326234313831656533643030393661303339223b733a33323a226334313836383062303031326436363536643830623630363035326364663331223b733a33323a223439333333326662333763333334646363326335323666646135346662396133223b733a33323a226236363662316339376161643265633730326264393364376235623730306165223b733a33323a226366373830303162303031663931663162313733333463373237373866353630223b733a33323a226163613933316436656564326263643638313531393033363161366437316335223b733a33323a223064623438303332366630653034343239323462633962623333666537663137223b733a33323a223639353531626264313836396532313434376565323139353166333064633937223b7d733a343a2268617368223b733a36353a2236393535316262643138363965323134343765653231393531663330646339372d3064623438303332366630653034343239323462633962623333666537663137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353637323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36373a7b733a33323a226132646437353966383034313563613862356565323230656631646331363762223b733a33323a226363643639663538323061333162356437393031383563373563393162653263223b733a33323a223236326133363935313963666361393065336334343337373234393233356237223b733a33323a226534343838353633373736613039653861623634313833623562313330643731223b733a33323a226336633464393432313262356564303736653438626233663032323761626237223b733a33323a223532663630623663623036353462356261666266363433616564626232633331223b733a33323a223730396535396139636664363363353864353039323963393432633164303137223b733a33323a223238393838393763303335386230376439383164363235653238396338366232223b733a33323a223766313939666634643863333232373733356461306233666437313038613162223b733a33323a223365323539336266316661613762636639343262353865323639393931336563223b733a33323a226266633262393638316634623436376233393934646565626136303431643735223b733a33323a223336333663303438626463313731646337346635316232393862616263666365223b733a33323a223136656536356238656162633465313365313337626564316433313638373861223b733a33323a223636613336306534363439373338656138323631313234653332633738383538223b733a33323a223333633737356635633966353830323836376163666163633438373830643766223b733a33323a226165386431623461383131623132316232373365326338386331343836373565223b733a33323a223766356662333064623463353434393933616536346530383031663232656435223b733a33323a226531653365346635353835643765386133313934386363613430333032313765223b733a33323a226535313333646361626335343230386638376634646539343030613034316637223b733a33323a226265636333663161353338316365393565393264343863646138373163393866223b733a33323a223963616631323530653763316232656638646637616232356530356235323466223b733a33323a226365666339376338396362343162386539653966373630303839666163653836223b733a33323a223364323831313662636231306234363539643961623235386432663435653062223b733a33323a226334333330363133363334626430613733656662306334666131326634666362223b733a33323a223064653133346237303834336533316432383763306434353736343230653461223b733a33323a226463356463353432316365623134343165376334363036313731653166303133223b733a33323a223966373365333833313332656137323234333034353739366465656463663162223b733a33323a223362613161343232383364363432333864366265643131353464316535666236223b733a33323a223833333362366566626165323265343832306662663961326464633361376437223b733a33323a223462313837373831393432643630396635303465373063333835336561353330223b733a33323a223763373566666432633931343038356339373162363634353137346464363439223b733a33323a223763646538376230396135643162356262373966373362363365313639646331223b733a33323a223463316662666466316665376431633038393439343837633136646132363339223b733a33323a223566386139373637393734393537616330336238393637616465303765326334223b733a33323a223233303961653435323961363738396636383136363036306131383939613737223b733a33323a223336363031303936663730623636623237373363333139306237626130343537223b733a33323a223936643861363935343132633264633164343564373463346337383435376432223b733a33323a223632666636646132656537323338373234323261323663313763616339626461223b733a33323a226364656335373833343763363234316662313230376139656166633561633634223b733a33323a226363386537333134333866613731633563363962663032373031316531303137223b733a33323a223866356566323932326537393136666339303935383134643661306236623134223b733a33323a223532343137646135343431316631323033663266353930653661633932303166223b733a33323a223065653636366331363237336465643162363435376537623837383039376339223b733a33323a226635346263663565376633386633623662316665333035313037313765633466223b733a33323a223865326137616261363466636362376438323436616263663763663965656261223b733a33323a226539373531646663393663363437636633623535313835346566663663353561223b733a33323a226165626330366231323931323831373335336563333735313935323135646139223b733a33323a226531653033303438643339343434366237336434653630336230646463313661223b733a33323a226362343466653736316232343932383337393639316636363666636232656562223b733a33323a223565356239646266303132303166373861666230346537623539343762333965223b733a33323a226364616263373732353539383935396139386138653238303534353462306134223b733a33323a223533613363353461616662393365646561356239386635376534326133396531223b733a33323a226137343333396661626462393930353361646230393063373236333763303764223b733a33323a223664613634383765623566663838643835666535333863333863306638663266223b733a33323a226138633537376438653361613332313331326663633361653232323334653536223b733a33323a226238633465316435653036613932393864653736346432303735623234353133223b733a33323a226234663132303236383539666330663330326561333563313136633761356138223b733a33323a223962366165366133303732383462323633623962343038356261386564633936223b733a33323a223963383433326562353037393163396433646162636166613263653163316439223b733a33323a223032323631333161396532336437396262323131636632353663656431393961223b733a33323a223064383562376262326531363465366432626361323463383437643662663032223b733a33323a223034623666623564336264363038616466396130326332336432613831656537223b733a33323a223434643533313563646139633931663537326162643961386163313331313438223b733a33323a223235616139653665393833343435323366333438333263363631643466373261223b733a33323a223166343137646462306634333034396164383133306261353330316531313238223b733a33323a226238346333616536356361646566623364663731303866346435626536323563223b733a33323a223733666531623534613532333832363439326165306565303862613737363437223b733a33323a226265363761313838373431653332623532383864376332376330663638613964223b733a33323a223765383164613335623136643939636164353966643633316433613765323566223b733a33323a226662383134343139346430663535336333656532613163376333333138393135223b733a33323a226466346336666366316539393330616163643433353730303639343634393730223b733a33323a223064646134613263666638383432663731353936363762346134383333313563223b733a33323a223631303730613062653133383531613533323062323636613466303734303832223b733a33323a223963386566336331663131613964613565313636616530343735643436366163223b733a33323a223539303661656363656162613932656632626637366539363738336361623965223b733a33323a223066653761366432343336373865643139363337373966336534323164303532223b733a33323a226230383537343535313964353435636430376666313262653962633563396538223b733a33323a226464396438393039663663366633666632313465383938633630633437353861223b733a33323a223938313238303236613166326538313735393636626130313137333239353637223b733a33323a226335396632393862643734636433656536613935376633636537383163646536223b733a33323a223336323863393833663362336637643430343739373532316235356533353833223b733a33323a223531306264353332613963326263343632663264333433313031313664386362223b733a33323a226233383464613361643733306531616165323861303666633562656366666434223b733a33323a226335336463353763323034623231323663343535653961376238356563663437223b733a33323a226331396561663437626464313239363239326333323437383731323438396365223b733a33323a223765633839373663633636393137653166383133626238323237353635666232223b733a33323a223263633738653764616562336636306561396165396632346337366562313665223b733a33323a226666363066643365386535396162376434373630666336373064396365303465223b733a33323a223431363038633930653764333265373366363862393264363033383931313664223b733a33323a226135343964613734663531326630343962346338373365363931633831356537223b733a33323a223765396366663230303933323464626233633065616330373430383131633038223b733a33323a223863343935393866626566373837313637313534393263653534306535346165223b733a33323a223933663637306335346632333166663331346132393136616231313463646136223b733a33323a226231383936356538306430383032323531623239303231636438396566316536223b733a33323a223132323533663332323235323031376266383736393264346638313964326231223b733a33323a226630396365356664636666643263623964656131393337663439386433363230223b733a33323a226633663666613763646261633230306163646262386530393330383264613634223b733a33323a226161643566376431636637383561636435626462396532316565356238636265223b733a33323a223231343562616133666563623339363663316330653664316433333336396366223b733a33323a223366393834393438653263353363313662636139323236643162346537656139223b733a33323a223339646663313538303637663139633530353961666564343436373139636564223b733a33323a226537383339613339376635643931613165383961316130623565313935366334223b733a33323a223531326537333439656634616630313532383034616362643036613738313231223b733a33323a226261363663396135353638373639376330323935323539393633323231333066223b733a33323a226635313435636133356332323932376663613966323236653364363432363935223b733a33323a223237326137313366393461306338386634623734636639656365386465313562223b733a33323a226363636233383139656234316565373531373837396331643564623861316434223b733a33323a226230336364396263633763636336623637633562613032653731663431646265223b733a33323a223237373366393564333835613162613039653764646237313131656664353264223b733a33323a223462336337353166656363636462663166666361383736396162643931663362223b733a33323a223434663032633933376137326436373939326630343038393435363261333134223b733a33323a226337383030373338653362656333313966336164373463346339336666633236223b733a33323a223663653163666231613661303138376663356263326164376162396465643263223b733a33323a226334323464653333623135313233383530343434323966653334643834363265223b733a33323a223730323633613133313463336332396462623663353162333361653034343266223b733a33323a223163636534356437356439366561303936656136626136313765323530653736223b733a33323a223763656332663133663766336439323465326534373632653164666536383563223b733a33323a226138616362323437626637656165343739633561313130656132343865646139223b733a33323a223235656563326233396134343966363462363030383532653364336336636532223b733a33323a226562306562353336373733373236376463323830376232613530323764306437223b733a33323a223633313865323037363932383139356566376164316466616232336539306566223b733a33323a223065666430386533353861626434336161316631373732343461653661326534223b733a33323a223334313236386265666636616230633165343033333563643234333337663434223b733a33323a226235353137386164663539646332306231393731376235656239346537316336223b733a33323a226264623739663766323331376631366336356531353738393761333331616563223b733a33323a223365326666393263666337656637333462633732356262313530656533343332223b733a33323a226236313730393361333031363364636464313137636634636232373839303662223b733a33323a223730613832336231656166643466373864373262383130376232343238666238223b733a33323a223936373539386333643734333937663334313761636638373639316162376636223b733a33323a223662613363363264636565323462366335636235316633323765313230633135223b733a33323a223763333733366133353438653633313137346534323036643932323331643730223b733a33323a223963356563663163343364303433666233616639633032653934626631636363223b733a33323a223034663934333361626639643735643432626637376330613337653230363334223b733a33323a226230316330633435666432633133313265343437633863323033633234343361223b7d733a343a2268617368223b733a36353a2262303163306334356664326331333132653434376338633230336332343433612d3034663934333361626639643735643432626637376330613337653230363334223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223237323139646138656434666664646363363531373737363461303830623034223b733a33323a226561316165336266643435626534663563306133383136656363303438383965223b7d733a343a2268617368223b733a36353a2265613161653362666434356265346635633061333831366563633034383839652d3237323139646138656434666664646363363531373737363461303830623034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223837353964316336386231376461363134626661353535656438643530343535223b733a33323a226563613830663435393866303461616232383764343361613564633266313566223b733a33323a223832366466376665363966613164313435326633346439336433353165386431223b733a33323a223633656635643034346432383233356563643531343865363862643437666439223b7d733a343a2268617368223b733a36353a2236336566356430343464323832333565636435313438653638626434376664392d3832366466376665363966613164313435326633346439336433353165386431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f556e6976657273616c5669657765725f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226439346265653764666636633737333866316562666335333261326165313964223b733a33323a226565326462313734323835623735663862626161336330346263373430326136223b7d733a343a2268617368223b733a36353a2265653264623137343238356237356638626261613363303462633734303261362d6439346265653764666636633737333866316562666335333261326165313964223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223535333761393233326161663136383931306533343635343639666333633831223b733a33323a226565313533393733653062333264333061376537303531326539326330653563223b733a33323a223662666633336436303634343566303536333538316531356536316430616165223b733a33323a223530613633626230313239373035613039393233393538373830383936316332223b7d733a343a2268617368223b733a36353a2235306136336262303132393730356130393932333935383738303839363163322d3662666633336436303634343566303536333538316531356536316430616165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223032313337643033316464616331653662646634653266396434643538306536223b733a33323a223164623537363861316539373330373136373337333866393861336462636138223b733a33323a223366343738643635333363393930333832303863316661336564646662393636223b733a33323a223533323432323835306138353565313634333236613638386663613662386263223b733a33323a223234303634383361323630353330356438616431633431653365613334333537223b733a33323a226238323236616136396262656630633138653563636635626637383564383831223b733a33323a226161626464393436346163613331663338666564366661363961326436333166223b733a33323a223633643732303966356566343032613364316335376232373236306530656334223b7d733a343a2268617368223b733a36353a2236336437323039663565663430326133643163353762323732363065306563342d6161626464393436346163613331663338666564366661363961326436333166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a226462333764336432343566393764643133643662373135393732326262303333223b733a33323a226139386436336134313833643065643465613932336231623833323930643732223b733a33323a226566363733663636353236616237336635623564656534366530616662333966223b733a33323a226534356534303739353662323566313631346465353166316361363061343461223b733a33323a223135346366366239656562643337343764346438613432363931393135643733223b733a33323a223834613033303437373838633939613939326266653638393233333264653036223b733a33323a223137386430636635643865386237376434353063346234383036633663636638223b733a33323a226165346339383864663231396630343133383861613338363737353732666163223b733a33323a223537303230373339306262393061323562616361313862323635363730623333223b733a33323a226331373164373538323339366338623536343764633464636533643039656266223b733a33323a223162396662666266336132393037663232303533356465313136336639353332223b733a33323a223333363138613465376330383265313130303761326635363365373765353666223b733a33323a223833323739376165366361616336626631623632333664356164653266313365223b733a33323a223633663063306332386466326330333463633230323434396265316637643534223b733a33323a223734356537356136356237356632623766633865346132316331613465613661223b733a33323a226265633133373536613566666638323265363162623535646433626138313736223b733a33323a223433666565366563656461376330616165346636323230656638343966646639223b733a33323a223936306638343832623836363264356430306262343930633566633238666238223b733a33323a223839336437386136386465303333383931653363626465666266663534616164223b733a33323a223832323365653166323262393033636438316638306234666566303262366332223b733a33323a226632666164366337376431363139373832386332363038633136306430376662223b733a33323a223561383430376333653039346564363965663938613333323861316461343335223b733a33323a226131623035316563306263323533626162363733616534396533623536306537223b733a33323a223635386535646436636635663435336532306237333463373238336264646335223b733a33323a226662626362613166343939383965623637613131633534333033386266626263223b733a33323a223933326664383162376434393430373764313034613333363437656666373234223b733a33323a226632343433313034623866303134343537343033343033356161363335373164223b733a33323a223165653039336236313662373765626139623034336565653230616632343432223b733a33323a223161393462316165376365396664623731383531343630356332643064633033223b733a33323a226165623733653063353831393361313431656361323435313065656163376266223b733a33323a223862643765623361623036376230383563613264316664326333626264366261223b733a33323a223966323037366537656432306336353035313933656132333439643331656463223b733a33323a226337626465373862613932323161656365353938616562303462396561356633223b733a33323a226234616235366231323334656666666134623362383035626539646665353137223b733a33323a223930333862396266316636656562656261663663366665343030326563396464223b733a33323a223732326333663366623832636463323164636464333134306564616136633738223b733a33323a223935343964386261616661343430303361663063303439663066323765323563223b733a33323a223634393965316538643963323538393439623235313264383537623534396636223b733a33323a226561623462393336363465393465353161653630323964386438383035386234223b733a33323a223164653063656263343061323263396539626232363734653964333764356462223b733a33323a223935666362636530636439666334323235663836646139636661633737663663223b733a33323a226637356238663866666536613265353835633735353738663132376231643634223b733a33323a223834656132663163323236336336613733613362366166313461303664666436223b733a33323a223563313133613165303836343732393133313364656532313636383861636533223b7d733a343a2268617368223b733a36353a2235633131336131653038363437323931333133646565323136363838616365332d3834656132663163323236336336613733613362366166313461303664666436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313131323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223531653666363565323036623836343635333161313865653231643537616664223b733a33323a226238303831636562666632343263353232366138313236376431383631353535223b733a33323a223338663964373033653233396338303164373739653236663837656263373335223b733a33323a223836633131363134643236626532393432336634663633393237636431303062223b733a33323a223839323765343864316334353739616133333934646534646435353737383136223b733a33323a223438653537396562616239303666353331643739613938316465366137363334223b733a33323a226664636530366161323266366333306632313838623566316439666465323361223b733a33323a226166313437303662343636636162376166616363363033386630303632333232223b733a33323a223661633064626666393363663639363731666132343631663433653462393039223b733a33323a223364623836363562303764653539626135306539303838376535366335643665223b733a33323a223761663063613930303731353263336132363431656639646364626639366162223b733a33323a223239353036663365333236666366666130373831326439306662336639613032223b733a33323a226364343366323835626565663138626264393638363963633763653434653834223b733a33323a226665353534383763333561303832363963393631373563343562326439353739223b733a33323a223639363139326261326431653835343139636233366636626533666336333362223b733a33323a226138333831373466326561663933613266653065396532613633303231666238223b733a33323a223866373265393134616465656232646632363965623065303131663062376365223b733a33323a226132316230373237373064393534353433386166643638626432373763366536223b733a33323a223365633434343534346634386230383361653430336633313834343835633137223b733a33323a223462616331393633323235653534306438373635353662666137363330616162223b7d733a343a2268617368223b733a36353a2234626163313936333232356535343064383736353536626661373633306161622d3365633434343534346634386230383361653430336633313834343835633137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620134530);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"maeva.barandao@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('iiifserver_manifest_external_property', '\"dcterms:hasFormat\"'),
('installation_title', '\"BDD\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('version', '\"3.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
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
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(2, 2, 1, 'section-achat', 'foundation', 'Section Achat', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Rechercher\",\"query\":\"\"},\"links\":[]}]', '[]', '2021-05-02 21:50:48', '2021-05-03 08:25:52', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
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
-- Table structure for table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
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
-- Dumping data for table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(2, 2, 'welcome', 'Welcome', 1, '2021-05-02 21:50:48', '2021-05-02 21:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(2, 2, 'html', '{\"html\":\"Welcome to your new site. This is an example page.\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(2, 2, 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 2, '\"item\"'),
('browse_attached_items', 2, '\"0\"'),
('browse_body_property_term', 2, '\"\"'),
('browse_heading_property_term', 2, '\"\"'),
('disable_jsonld_embed', 2, '\"0\"'),
('item_media_embed', 2, '\"0\"'),
('locale', 2, '\"\"'),
('search_resource_names', 2, '[\"site_pages\",\"items\"]'),
('search_restrict_templates', 2, '\"0\"'),
('search_type', 2, '\"sitewide\"'),
('show_attached_pages', 2, '\"1\"'),
('show_page_pagination', 2, '\"1\"'),
('show_user_bar', 2, '\"0\"');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'maeva.barandao@gmail.com', 'Maeva BARANDAO', '2021-04-17 13:47:29', '2021-04-17 13:47:29', '$2y$10$XdHQBk0SOoOZRh1RP05WSeZ01W6E5zjRBnn.srXY53VpHz5Eai.C6', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-04-17 13:56:57', '2021-04-17 13:57:44', '$2y$10$MFO8.Kwyo5Doaj5mFXY9MOYGgBjZ/dWY1Hyx/AV1V6tIuoj9u0.Rq', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('default_resource_template', 2, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

DROP TABLE IF EXISTS `value`;
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
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(19, 4, 1, NULL, 'literal', '', 'ope_azerty', NULL, 1),
(20, 4, 221, NULL, 'literal', '', 'ope@company.fr', NULL, 1),
(21, 4, 212, NULL, 'literal', '', 'idf', NULL, 1),
(22, 4, 223, NULL, 'literal', '', 'bati005', NULL, 1),
(23, 4, 199, NULL, 'literal', '', 'telecom', NULL, 1),
(24, 4, 200, NULL, 'literal', '', 'approvisionneur', NULL, 1),
(25, 5, 1, NULL, 'literal', '', 'suppr', NULL, 1),
(26, 5, 138, NULL, 'literal', '', 'suppr', NULL, 1),
(27, 5, 212, NULL, 'literal', '', '7 rue Balou', NULL, 1),
(28, 5, 242, NULL, 'literal', '', 'suppr@suppr.fr', NULL, 1),
(29, 6, 1, NULL, 'literal', '', 'cable EP 200m', NULL, 1),
(30, 6, 240, NULL, 'literal', '', 'EP', NULL, 1),
(31, 6, 241, NULL, 'literal', '', 'CAB', NULL, 1),
(33, 7, 1, NULL, 'literal', '', 'cable lampadaire', NULL, 1),
(34, 7, 45, NULL, 'literal', '', '20/04/2021', NULL, 1),
(35, 7, 245, NULL, 'literal', '', 'cable 200m', NULL, 1),
(36, 7, 243, NULL, 'literal', '', '2', NULL, 1),
(37, 7, 244, NULL, 'literal', '', '22 avenue du pli', NULL, 1),
(38, 7, 238, 4, 'resource', NULL, NULL, NULL, 1),
(39, 8, 1, NULL, 'literal', '', 'lampadaire avenue du pli', NULL, 1),
(40, 8, 20, NULL, 'literal', '', '20/04/2021', NULL, 1),
(41, 8, 236, 6, 'resource', NULL, NULL, NULL, 1),
(42, 8, 243, NULL, 'literal', '', '3', NULL, 1),
(43, 8, 237, 5, 'resource', NULL, NULL, NULL, 1),
(44, 8, 244, NULL, 'literal', '', '22 avenue du pli', NULL, 1),
(45, 8, 238, 4, 'resource', NULL, NULL, NULL, 1),
(46, 8, 246, 7, 'resource', NULL, NULL, NULL, 1),
(47, 9, 248, NULL, 'literal', '', 'Martin', NULL, 1),
(48, 9, 249, NULL, 'literal', '', 'martin', NULL, 1),
(49, 9, 250, NULL, 'literal', '', '21', NULL, 1),
(50, 9, 251, NULL, 'literal', '', 'ici', NULL, 1),
(51, 9, 253, NULL, 'literal', '', '06 12 XX XX XX', NULL, 1),
(52, 10, 1, NULL, 'literal', '', 'pcr', NULL, 1),
(53, 10, 252, NULL, 'literal', '', '50', NULL, 1),
(54, 11, 248, NULL, 'literal', '', 'Albo', NULL, 1),
(55, 11, 249, NULL, 'literal', '', 'pablo', NULL, 1),
(56, 11, 255, NULL, 'literal', '', 'infirmier_e', NULL, 1),
(57, 11, 254, NULL, 'literal', '', '06 51 XX XX XX', NULL, 1),
(58, 12, 1, NULL, 'literal', '', 'antigenique', NULL, 1),
(59, 12, 252, NULL, 'literal', '', '30', NULL, 1),
(60, 13, 260, 11, 'resource', NULL, NULL, NULL, 1),
(61, 13, 261, 9, 'resource', NULL, NULL, NULL, 1),
(62, 13, 7, NULL, 'literal', '', '2021-05-04', NULL, 1),
(63, 13, 256, NULL, 'literal', '', '16:45', NULL, 1),
(64, 13, 262, 12, 'resource', NULL, NULL, NULL, 1),
(65, 13, 257, NULL, 'literal', '', 'non', NULL, 1),
(66, 13, 264, NULL, 'literal', '', 'Nantes', NULL, 1),
(67, 14, 248, NULL, 'literal', '', 'Martin', NULL, 1),
(68, 14, 249, NULL, 'literal', '', 'martin', NULL, 1),
(69, 14, 250, NULL, 'literal', '', '21', NULL, 1),
(70, 14, 251, NULL, 'literal', '', 'ici', NULL, 1),
(71, 14, 253, NULL, 'literal', '', '06 12 XX XX XX', NULL, 1),
(72, 12, 264, NULL, 'literal', '', 'Nantes', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', ''),
(6, 1, 'http://www.w3.org/ns/org#', 'org', 'org', ''),
(8, 1, 'http://www.ontotext.com/proton/protonext#hasEMail', 'pext', 'ontotext', ''),
(11, 1, 'https://circuit-achat.cnam.fr/onto/ca#', 'ca', 'achat', ''),
(12, 1, 'https://gestion-test-covid.cnam.fr/onto/gtc#', 'gtc', 'gestion_test_covid', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indexes for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indexes for table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Indexes for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indexes for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indexes for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indexes for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indexes for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indexes for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indexes for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Constraints for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Constraints for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Constraints for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
