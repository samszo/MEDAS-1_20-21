-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 25 avr. 2021 à 10:26
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e_commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client-commande`
--

DROP TABLE IF EXISTS `client-commande`;
CREATE TABLE IF NOT EXISTS `client-commande` (
  `FK_N_Client` int(11) NOT NULL,
  `FK_N_Commande` int(11) NOT NULL,
  PRIMARY KEY (`FK_N_Client`,`FK_N_Commande`),
  KEY `FK_N_Commande` (`FK_N_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `N_Client` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Prenom` varchar(45) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Code postal` varchar(5) NOT NULL,
  `Ville` varchar(100) NOT NULL,
  `Clientscol` varchar(45) NOT NULL,
  PRIMARY KEY (`N_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`N_Client`, `Nom`, `Prenom`, `Adresse`, `Code postal`, `Ville`, `Clientscol`) VALUES
(1, 'YOUSFI', 'Nassima', '1 rue de l\'écluse', '94140', 'Alfortville', ''),
(2, 'OUKHELIFA', 'Nassima', '41 rue des saules', '93800', 'Epinay sur seine', ''),
(3, 'OUABA', 'Dalil', '41 rue emile zola', '93800', 'Epinay sur seine', '');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `N_Commande` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Adresse livraison` varchar(200) NOT NULL,
  PRIMARY KEY (`N_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `FK_N_Produit` int(11) NOT NULL,
  `FK2_N_Commande` int(11) NOT NULL,
  PRIMARY KEY (`FK_N_Produit`,`FK2_N_Commande`),
  KEY `FK2_N_Commande` (`FK2_N_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(13, 'item_sets', 1, 1, 'Client', 'Client\nCommande'),
(14, 'items', 1, 1, 'Client', 'Client\nCommande'),
(15, 'item_sets', 1, 1, 'Commande', 'Commande\nClient\nCommande'),
(16, 'item_sets', 1, 1, 'Produit', 'Produit\nProduit\nCommande'),
(17, 'items', 1, 1, 'Commande', 'Commande\nClient\nProduit'),
(18, 'items', 1, 1, 'Produit', 'Produit\nCommande');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`) VALUES
(14),
(17),
(18);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(13, 0),
(15, 0),
(16, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
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
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
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

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `N_Produit` int(11) NOT NULL,
  `Libellé` varchar(200) NOT NULL,
  `Prix` decimal(10,0) NOT NULL,
  PRIMARY KEY (`N_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(185, 1, 5, 'accessToElement', 'Access to element', 'An entry rule refers to a specific Road element.'),
(186, 1, 5, 'approvedByPa', 'Approved by PA', 'To connect a resolution to the municipality that have approved it.'),
(187, 1, 5, 'arrangedOnRoad', 'Arranged on road', 'To connect each beacon to the road in which it is installed.'),
(188, 1, 5, 'atBusStop', 'At bus stop', 'Each forecast refers to a specific bus stop.'),
(189, 1, 5, 'beginsAtJunction', 'Begins at junction', 'Each routeLink, has a beginning and an end junction.'),
(190, 1, 5, 'belongToMunicipality', 'Belong to municipality', 'A municipality can be divided in districts.'),
(191, 1, 5, 'belongToRoad', 'Belong to road', 'Each road has street numbers.'),
(192, 1, 5, 'coincideWith', 'Coincide with', 'There is no exact match between Road and AdministrativeRoad.'),
(193, 1, 5, 'composeDirection', 'Compose direction', 'A railway Direction is composed by more railway element.'),
(194, 1, 5, 'composeSection', 'Compose section', 'A railway Section is composed by more railway element.'),
(195, 1, 5, 'concernLine', 'Concern line', 'An AVMrecord concert to a unique line.'),
(196, 1, 5, 'concerningNode', 'Concerning node', 'A maneuver takes place in correspondence of a node.'),
(197, 1, 5, 'consistOfElement', 'Consist of element', 'A railway Direction is composed by more railway element.'),
(198, 1, 5, 'containsElement', 'Contains element', 'A road is formed by more elements road.'),
(199, 1, 5, 'correspondToJunction', 'Correspond to junction', 'Train station and good yard are located precisely on a junction.'),
(200, 1, 5, 'correspondsTo', 'Corresponds to', 'There is no exact match between Road and AdministrativeRoad.'),
(201, 1, 5, 'endAtJunction', 'End at junction', 'A railway element is delimited by two junctions.'),
(202, 1, 5, 'endingJunction', 'Ending junction', 'A road link is delimited by two junctions.'),
(203, 1, 5, 'endsAtNode', 'Ends at node', 'A road element is delimited by 2 nodes.'),
(204, 1, 5, 'endsAtStop', 'Ends at stop', 'A route section is delimited by two consecutive bus stops.'),
(205, 1, 5, 'finishesAtJunction', 'Finishes at junction', 'Each routeLink, has a beginning and an end junction.'),
(206, 1, 5, 'formingAdminRoad', 'Forming administrative road', 'More road elements form an administrative road.'),
(207, 1, 5, 'formsTable', 'Forms table', 'More road sensors form a sensor Table.'),
(208, 1, 5, 'hasAVMRecord', 'Has avm record', 'The AVM refer to a specific ride code.'),
(209, 1, 5, 'hasAccess', 'Has acceess', 'Point corresponding to the house number of service.'),
(210, 1, 5, 'hasBObservation', 'Has beacon observation', 'To connect each beacon to observations that it produces.'),
(211, 1, 5, 'hasCarParkSensor', 'Has car park sensor', 'To connect each car park to its installed sensor.'),
(212, 1, 5, 'hasDistrict', 'Has district', 'A municipality can be divided in districts.'),
(213, 1, 5, 'hasElement', 'Has element', 'A railway line is composed by more railway element.'),
(214, 1, 5, 'hasExpectedTime', 'Has expected time', 'The expected time at the next bus stops.'),
(215, 1, 5, 'hasExternalAccess', 'Has external access', 'It corresponds to the outer gate of the building.'),
(216, 1, 5, 'hasFirstElem', 'Has first element', 'The first element concerned by the maneuver.'),
(217, 1, 5, 'hasFirstSection', 'Has first section', 'Defines which is the departure section of a route.'),
(218, 1, 5, 'hasFirstStop', 'Has first stop', 'Defines which is the departure stop of a route.'),
(219, 1, 5, 'hasForecast', 'Has forecast', 'Each forecast refers to a specific bus stop.'),
(220, 1, 5, 'hasGeometry', 'Has geometry', 'Some services and all railway elements have a specific geometry like polygons or linestrings.'),
(221, 1, 5, 'hasInternalAccess', 'Has internal access', 'It corresponds to the door of the building.'),
(222, 1, 5, 'hasLastStop', 'Has last stop', 'Defines which is the last stop of a route.'),
(223, 1, 5, 'hasLastStopTime', 'Has last stop time', 'The arrival time at last bus stops.'),
(224, 1, 5, 'hasManeuver', 'Has maneuver', 'An entry rule can be connected to a specific maneuver.'),
(225, 1, 5, 'hasMonitoringStation', 'Has monitoring station', 'Relates an ICQA agglomeration to its monitoring stations.'),
(226, 1, 5, 'hasMunicipality', 'Has municipality', 'A province is formed by more municipalities.'),
(227, 1, 5, 'hasObservation', 'Has observation', 'Each road sensor produce a report every 20 minutes.'),
(228, 1, 5, 'hasPrediction', 'Has prediction', 'A report is made up of more predictions.'),
(229, 1, 5, 'hasProvince', 'Has province', 'In a region there are more than one province.'),
(230, 1, 5, 'hasRecord', 'Has record', 'Every 10 minutes a sensor sends a report.'),
(231, 1, 5, 'hasRegularService', 'Has regular service', 'Regular services can be connected to transverse services.'),
(232, 1, 5, 'hasResolution', 'Has resolution', 'To connect a resolution to the municipality that have approved it.'),
(233, 1, 5, 'hasRoadElement', 'Has road element', 'More road elements form an administrative road.'),
(234, 1, 5, 'hasRoute', 'Has route', 'Each route refers to a line.'),
(235, 1, 5, 'hasRouteLink', 'Has route link', 'A route section is composed by more route link.'),
(236, 1, 5, 'hasRule', 'Has rule', 'Some road elements are subject to rules of access.'),
(237, 1, 5, 'hasSecondElem', 'Has second element', 'The second element concerned the maneuver.'),
(238, 1, 5, 'hasSection', 'Has section', 'Defines all the other section of a route.'),
(239, 1, 5, 'hasSegment', 'Has segment', 'Each road element can be see as a collection of consecutive road link.'),
(240, 1, 5, 'hasStatistic', 'Has statistic', 'To connect a statistic to the referred municipality.'),
(241, 1, 5, 'hasStreetNumber', 'Has street number', 'Each road has street numbers.'),
(242, 1, 5, 'hasThirdElem', 'Has third element', 'The third element concerned the maneuver.'),
(243, 1, 5, 'hasTransferService', 'Has transfer Service', 'To connect each train station to the correspondant service.'),
(244, 1, 5, 'hasTransverseService', 'Has transverse service', 'Regular services can be connected to transverse services.'),
(245, 1, 5, 'hasWeatherReport', 'Has weather report', 'Each weather forecasts is connected to a municipality.'),
(246, 1, 5, 'inMunicipalityOf', 'In municipality of', 'Municipality to which the road belongs.'),
(247, 1, 5, 'includeForecast', 'Include forecast', 'Each AVMrecord includes more forecasts.'),
(248, 1, 5, 'instantAVM', 'Instant avm', 'The arrival time at last bus stops.'),
(249, 1, 5, 'instantBObserv', 'Instant Beacon Observ', 'Time and date of each Beacon observation.'),
(250, 1, 5, 'instantForecast', 'Instant forecast', 'The expected time at the next bus stops.'),
(251, 1, 5, 'instantObserv', 'Instant observation', 'The time of one observation.'),
(252, 1, 5, 'instantParking', 'Instant parking', 'The generation time of one situation record.'),
(253, 1, 5, 'instantWReport', 'Instant weather report', 'The generation time of a new weather report.'),
(254, 1, 5, 'isComposedByElement', 'Is composed by element', 'A railway section is composed by more railway element.'),
(255, 1, 5, 'isInElement', 'Is in element', 'Each milestone need to refers to a road element.'),
(256, 1, 5, 'isInMunicipality', 'Is in municipality', 'A bus stop can be connected to the municipality to which belong.'),
(257, 1, 5, 'isInRoad', 'Is in road', 'Service and train station can be connected to the referred Road.\n'),
(258, 1, 5, 'isPartOfICQAAgglomeration', 'Is part of ICQA agglomeration', 'Relates each air quality monitoring station to the ICQA agglomerate where it is located.'),
(259, 1, 5, 'isPartOfLine', 'Is part of line', 'A railway line is composed by more railway element.'),
(260, 1, 5, 'isPartOfLot', 'Is part of lot', 'Bus stops and bus lines are part of a lot.'),
(261, 1, 5, 'isPartOfProvince', 'Is part of province', 'A province is formed by more municipalities.'),
(262, 1, 5, 'isPartOfRegion', 'Is part of region', 'In a region there are more than one province.'),
(263, 1, 5, 'isPartOfRoad', 'Is part of Road', 'More road elements compose a road.'),
(264, 1, 5, 'lastStop', 'Last stop', 'The AVMrecord specify which is the last bus stop made.'),
(265, 1, 5, 'managingAuthority', 'Managing authority', 'The authority that deals with the road elements management.'),
(266, 1, 5, 'measuredByBeacon', 'Measured by beacon', 'To connect each observation to the beacon that has produced it.'),
(267, 1, 5, 'measuredBySensor', 'Measured by sensor', 'Each observation refers to only one road sensor.'),
(268, 1, 5, 'measuredDate', 'Measured date', 'Time and date of each Beacon observation.'),
(269, 1, 5, 'measuredTime', 'Measured time', 'The time of one observation.'),
(270, 1, 5, 'observationTime', 'Observation time', 'The generation time of one situation record.'),
(271, 1, 5, 'observeCarPark', 'Observe car park', 'To connect each sensor to the referred car park service.'),
(272, 1, 5, 'onRoute', 'On route', 'Rides and AVMrecords refer to a specific route.'),
(273, 1, 5, 'ownerAuthority', 'Owner authority', 'The authority that owns the administrative road.'),
(274, 1, 5, 'placedInElement', 'Placed in element', 'Each entry need to refers to a road.'),
(275, 1, 5, 'placedOnRoad', 'Placed on road', 'To connect each road sensor to the road in which is installed.'),
(276, 1, 5, 'refersToMunicipality', 'Refers to municipality', 'Specifies the municipality for the weather forecast.'),
(277, 1, 5, 'refersToRide', 'Refers to ride', 'The AVM refer to a specific ride code.'),
(278, 1, 5, 'refersToRoadElement', 'Refers to road element', 'Refers to road element'),
(279, 1, 5, 'relatedToSensor', 'Related to sensor', 'Refers to the parking where the situation record was produced.'),
(280, 1, 5, 'scheduledOnLine', 'Scheduled on line', 'A ride can be scheduled on a single line.'),
(281, 1, 5, 'startAtJunction', 'Start at junction', 'A railway element is delimited by two junctions.'),
(282, 1, 5, 'startingJunction', 'Starting junction', 'A road link is delimited by two junctions.'),
(283, 1, 5, 'startsAtNode', 'Starts at node', 'A road element is delimited by 2 nodes.'),
(284, 1, 5, 'startsAtStop', 'Start at stop', 'A route section is delimited by two consecutive bus stops.'),
(285, 1, 5, 'updateTime', 'Update time', 'The generation time of a new weather report.'),
(286, 1, 5, 'wasteType', 'Waste type', 'Specify the waste type (plastics, paper, glass, and the like).'),
(287, 1, 5, 'abbreviation', 'Abbreviation', 'Abbreviation of the description of the service.'),
(288, 1, 5, 'accessType', 'Access type', 'It provides an information about the data retrieval method (HTTP, Rest, etc.)'),
(289, 1, 5, 'adRoadName', 'Administrative Road Name', 'Official name of the road'),
(290, 1, 5, 'addressVillage', 'address village', 'It helps locate the service, specifying, for example, the historic building where it is located, the neighborhood, or something else.'),
(291, 1, 5, 'adminClass', 'Admin class', 'Administrative classification of the road'),
(292, 1, 5, 'airQuality', 'Air quality', 'It provides a measurement of the level of air pollution'),
(293, 1, 5, 'airQualityBenzene', 'Air quality - Benzene', 'Daily average concentration of Benzene expressed in micrograms per cubic meter.'),
(294, 1, 5, 'airQualityCO', 'Air quality - CO', 'Maximum mobile average over 8h of CO concentration expressed in milligrams per cubic meter'),
(295, 1, 5, 'airQualityCombinedCounter', 'Air quality - Combined', 'It provides an overall measure of air quality, combining different indicators appropriately.'),
(296, 1, 5, 'airQualityH2S', 'Air quality - H2S', 'Maximum hourly concentration of H2S expressed in micrograms per cubic meter'),
(297, 1, 5, 'airQualityICQAValue', 'Air quality - ICQA', 'It provides the value of the ICQA index defined by the Tuscany Region for the measurement of air quality at urban agglomeration level'),
(298, 1, 5, 'airQualityNO2', 'Air quality - NO2', 'Maximum hourly concentration of NO2 expressed in micrograms per cubic meter'),
(299, 1, 5, 'airQualityO3', 'Air quality - O3', 'Maximum hourly concentration of O3 expressed in micrograms per cubic meter'),
(300, 1, 5, 'airQualityPM10', 'Air quality - PM10', 'Daily average concentration of PM10 expressed in micrograms per cubic meter'),
(301, 1, 5, 'airQualityPM2.5', 'Air quality - PM2.5', 'Daily average concentration of PM2.5 expressed in micrograms per cubic meter.'),
(302, 1, 5, 'airQualitySO2', 'Air quality - SO2', 'Maximum hourly concentration of SO2 expressed in micrograms per cubic meter'),
(303, 1, 5, 'alertArea', 'Alert area', 'It identifies ​​the alert area in the context of water hazard prevention'),
(304, 1, 5, 'allowedArmedForcesAccess', 'Allowed armed forces access', 'It indicates whether an access restriction is active but allows transit to the armed forces.'),
(305, 1, 5, 'allowedAuthorizedVehiclesAccess', 'Allowed authorized veihicles access', 'It indicates whether an access restriction is active but still permits transit to authorized vehicles.'),
(306, 1, 5, 'allowedBicycleAccess', 'Allowed bicycle access', 'It indicates whether an access restriction is active but still permits the transit of bicycles.'),
(307, 1, 5, 'allowedDisabledAccess', 'Allowed disabled access', 'It indicates whether an access restriction is active but still allows for the disabled.'),
(308, 1, 5, 'allowedDriverIncludedRentedCarAccess', 'Allowed access to driver included rented car', 'It indicates whether an access restriction is active but still permits transit to cars rented with a driver.'),
(309, 1, 5, 'allowedElectricBicycleAccess', 'Allowed electric bicycle access', 'It indicates whether an access restriction is active but allows transit to electric bicycles.'),
(310, 1, 5, 'allowedExtraurbanBusAccess', 'Allowed extraurban bus access', 'It indicates whether an access restriction is active but allows transit to non-urban buses.'),
(311, 1, 5, 'allowedOnlyEmergencyAccess', 'Allowed only emergency access', 'It indicates whether an access restriction is active but allows transit to rescue vehicles.'),
(312, 1, 5, 'allowedOperatingVehiclesAccess', 'Allowed operating vehicles access', 'It indicates whether an access restriction is active, however it allows transit to the means involved in the work.'),
(313, 1, 5, 'allowedPoliceAndEmergencyAccess', 'Allowed police and emergency access', 'It indicates whether an access restriction is active but allows transit to the police and rescue vehicles.'),
(314, 1, 5, 'allowedUrbanBusAccess', 'Allowed urban bus access', 'It indicates whether an access restriction is active but still allows for urban bus transit.'),
(315, 1, 5, 'alterCode', 'Alter code', 'It indicates an alternative code for the road.'),
(316, 1, 5, 'alternativeEmail', 'Alternative e-mail', 'It indicates a secondary e-mail address.'),
(317, 1, 5, 'alternativeFax', 'Alternative fax', 'It indicates a secondary fax number.'),
(318, 1, 5, 'alternativeTelephone', 'Alternative phone', 'It indicates a secondary phone number.'),
(319, 1, 5, 'altitude', 'Altitude', 'It indicates the altitude to which the weather station is located.'),
(320, 1, 5, 'annualPM10ExceedanceCount', 'Air quality - PM10 Exceedance', 'It provides the count of the number of PM10 threshold strides in the last year.'),
(321, 1, 5, 'areaCode', 'Area code', 'Area code, defined at the municipal level, where the service or sensor  is located.'),
(322, 1, 5, 'areaName', 'Area name', 'Name of the area, defined at the municipal level, where the service or the sensor is located.'),
(323, 1, 5, 'atecoCode', 'Ateco code', 'It provides the ATECO classification code for the service.'),
(324, 1, 5, 'automaticity', 'Automaticity', 'It specifies whether data capture can be executed in a totally automated way or if an operator is needed.'),
(325, 1, 5, 'averageDistance', 'Average distance', 'Average distance between two vehicles passing one from one to the other.'),
(326, 1, 5, 'averageSpeed', 'Average speed', 'Average speed at which vehicles pass.'),
(327, 1, 5, 'averageTime', 'Average time', 'Average time between 2 transits'),
(328, 1, 5, 'axialMass', 'Axial mass', 'It provides a railway line classification code based on the maximum allowed axial mass'),
(329, 1, 5, 'batteryLevel', 'Battery level', 'It indicates the level of the batteries, in a waste container with advanced features.'),
(330, 1, 5, 'blueCodeCount', 'Code blue count', 'It provides an indication of the number of red code patients present in the First Aid facility when detecting. The property is called blue code, resuming the classification used in some English-speaking countries.'),
(331, 1, 5, 'botanicalFamily', 'Botanical family', 'Botanical family'),
(332, 1, 5, 'capacity', 'Capacity', 'The capacity of the parking lot, or the garbage container.'),
(333, 1, 5, 'carParkStatus', 'Car park status', 'It describes the status of the parking lot, indicating whether there are any vacancies, if it is full, or if there is no information on the presence of vacant posts.'),
(334, 1, 5, 'category', 'Category', 'It provides the railway station category, an overall indicator of the quality of the railway line.'),
(335, 1, 5, 'classCode', 'Class code', 'It indicates the color of the civic number, for those cities where there are two independent numbering systems, the red numbers and the black numbers.'),
(336, 1, 5, 'collectionTime', 'Collection time', 'The time when the waste container is emptied.'),
(337, 1, 5, 'combinedTraffic', 'Combined traffic', 'It provides a technical information related to the railroad.'),
(338, 1, 5, 'composition', 'Composition', 'It indicates whether the stretch of road is on a single road or on separate roadways.'),
(339, 1, 5, 'concentration', 'Concentration', 'It provides the concentration of vehicles detected by the traffic sensor.'),
(340, 1, 5, 'currentWaterLevel', 'Current water level', 'It indicates the last detected water level.'),
(341, 1, 5, 'currentWindDirection', 'Current wind direction', 'It provides the last detected wind direction.'),
(342, 1, 5, 'currentWindGustSpeed', 'Current wind gust speed', 'Windness detected by equally fractionating the time, and  returning the peak of the last fraction.'),
(343, 1, 5, 'currentlyActive', 'Currently active', 'Currently active'),
(344, 1, 5, 'dailyO3ExceedanceCount', 'Air quality - O3 exceedance count', 'Number of times in the day that O3 concentracion is over 180mg/m3'),
(345, 1, 5, 'dailyO3ExceedanceHours', 'Air quality - O3 exceedance duration', 'Hours in the day that O3 concentracion is over 180mg/m3'),
(346, 1, 5, 'day', 'Day', 'Day to which the weather forecast refers.'),
(347, 1, 5, 'depthKm', 'Depth', 'Depth in kilometers'),
(348, 1, 5, 'direction', 'Direction', 'Direction of the route.'),
(349, 1, 5, 'distance', 'Distance', 'Distance between two stops within the route.'),
(350, 1, 5, 'districtCode', 'District code', 'Code of the neighborhood where the service is located.'),
(351, 1, 5, 'elemLocation', 'Element location', 'It provides a categorization of the road or rail segment, indicating whether it is on a bridge, rather than inside a tunnel or other.'),
(352, 1, 5, 'elementClass', 'Element class', 'It provides an indication of the importance of the road to which the road segment belongs (motorway, street, urban road and so on)'),
(353, 1, 5, 'elementType', 'Element type', 'It provides a categorization of the road or rail segment, for example, for a road segment, it says if it is located at a crossroad, on a roundabout, on a square, on a parking lot, and so on.'),
(354, 1, 5, 'enrolledStudents', 'number of enrolled students', NULL),
(355, 1, 5, 'entryType', 'Entry type', 'It indicates whether it is an interior pass, rather than an outside outcrop overlooking the public road, or something else.'),
(356, 1, 5, 'estimatedYearsToReturn', 'estimatedYearsToReturn', 'estimatedYearsToReturn'),
(357, 1, 5, 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours'),
(358, 1, 5, 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour'),
(359, 1, 5, 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours'),
(360, 1, 5, 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours'),
(361, 1, 5, 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours'),
(362, 1, 5, 'eventCategory', 'Event category', 'It provides the type of event, whether it is a theatrical work, a festival, an extraordinary opening, a sporting event, and so on.'),
(363, 1, 5, 'eventTime', 'Event time', 'It shows the start time of the event.'),
(364, 1, 5, 'exitRate', 'Exit rate', 'It provides the vehicle exit rate from the parking lot, ie the number of outgoing vehicles per hour.'),
(365, 1, 5, 'expectedTime', 'Expected time', 'Timetable for bus arrival at the stop. TO DELETE WHEN INSTANT FUNCTIONS TO PERFECT.'),
(366, 1, 5, 'exponent', 'Exponent', 'It provides the literal part of the civic number, if present.'),
(367, 1, 5, 'extendName', 'Extend name', 'It provides the full name of the road, including generic naming.'),
(368, 1, 5, 'extendNumber', 'Extend number', 'It provides the civic number for extended, including both the numerical part and the literal number where it is present.'),
(369, 1, 5, 'fillRate', 'Fill rate', 'It provides the parking rate, as the number of inbound vehicles per hour.'),
(370, 1, 5, 'firenzeCard', 'Firenze card', 'It provides whether the service is provided on favorable terms to holders of Firenze Card.'),
(371, 1, 5, 'firstAidState', 'State of First Aid', 'It indicates whether the counts refer to the total number of people standing in the First Aid with that specific code, or only to those who are at a specific stage (visiting, pending, observing, and so on).'),
(372, 1, 5, 'flowRate', 'Flow rate', 'Sliding rate'),
(373, 1, 5, 'free', 'Free', 'It provides the number of free places in the parking lot.'),
(374, 1, 5, 'freeEvent', 'Free event', 'It indicates whether the event is free or paid.'),
(375, 1, 5, 'freephone', 'freephone', 'It provides the green number to dial to get in touch with the service call center.'),
(376, 1, 5, 'gauge', 'Gauge', 'It provides the type of gauge, which can be reduced or standard.  It\'s a technical information relating to the railroad.'),
(377, 1, 5, 'geographicAreaType', 'Geographic area type', 'The geographic area type where the sensor is (eg. urban, suburban).'),
(378, 1, 5, 'greenCodeCount', 'Green code count', 'It provides the number of patients who are admitted to Green Emergency Rescue.'),
(379, 1, 5, 'heightHour', 'Height hour', 'It provides the time when the sun is expected to reach its maximum height.'),
(380, 1, 5, 'hour', 'Hour', 'It provides the time the weather forecast refers to.'),
(381, 1, 5, 'hourO3Max', 'Air quality - Maximum O3 exceedance', 'Hour in the day that O3 concentracion is at maximum'),
(382, 1, 5, 'houseNumber', 'House number', 'It provides the civic number where the service is located or where the event takes place.'),
(383, 1, 5, 'humidity', 'Humidity', 'Percentage of humidity.'),
(384, 1, 5, 'inAgglomeration', 'Agglomeration', 'The agglomeration where the monitoring station is'),
(385, 1, 5, 'internalTemperature', 'Internal temperature', 'Internal temperature'),
(386, 1, 5, 'isSelfService', 'is a self-service', 'It indicates whether the service is a refueling station self-service.'),
(387, 1, 5, 'juncType', 'Junction type', 'It indicates the type of railway junction, for example whether it is a level crossing, a track termination, a freight train, and so on.'),
(388, 1, 5, 'lastObservationHumidity', 'Last observation humidity', 'it indicates the last humidity value detected by the weather station.'),
(389, 1, 5, 'lastStopTime', 'Last stop time', 'The time the bus has reached the last stop. TO BE DELETED WHEN INSTANT FUNCTIONS TO PERFECT.'),
(390, 1, 5, 'lastTriples', 'Last triples', 'It indicates the last date when the RDF triples have been updated.'),
(391, 1, 5, 'lastUpdate', 'Last update', 'It indicates the last date when the source data has been updated.'),
(392, 1, 5, 'leafWetness', 'Leaf wetness', 'Humidity value detected by intelligent sprinkler.'),
(393, 1, 5, 'length', 'Length', 'It provides the length of the road segment (road element) or rail line.'),
(394, 1, 5, 'lineNumber', 'Line number', 'Indica il numero della linea a cui la fermata appartiene.'),
(395, 1, 5, 'lunarPhase', 'Lunar phase', 'Monn phase.'),
(396, 1, 5, 'magnitudeType', 'Magnitude type', 'It indicates the type of magnitude of the earthquake event.'),
(397, 1, 5, 'magnitudeValue', 'Magnitude value', 'It indicates the magnitude of the earthquake event.'),
(398, 1, 5, 'major', 'Major', 'The major, in a Beacon device, is a positive integer that, together with the minor and the UUID, uniquely identifies the device.'),
(399, 1, 5, 'managingAuth', 'Managing authority', 'It identifies the administration or the company responsible for managing the railway station.'),
(400, 1, 5, 'managingBy', 'Managing by', 'AVM system or road sensors operator.'),
(401, 1, 5, 'maneuverType', 'Maneuver type', 'It describes the type of restriction (bifurcation, forbidden maneuver, mandatory maneuver).'),
(402, 1, 5, 'maxTemp', 'Max temperature', 'It provides the maximum expected temperature.'),
(403, 1, 5, 'minTemp', 'Min temperature', 'It provides the minimum expected temperature.'),
(404, 1, 5, 'minor', 'Minor', 'The minor, in a Beacon device, is a positive integer that, together with the major and the UUID, uniquely identifies the device.'),
(405, 1, 5, 'monitoringStationType', 'Monitoring station type', 'Type of montioring station (e.g. fondo, traffico, industriale)'),
(406, 1, 5, 'moonrise', 'Moonrise', 'It provides the expected time for the moon to rise.'),
(407, 1, 5, 'moonset', 'Moonset', 'In indicates the expected time for the moon to set.'),
(408, 1, 5, 'multimediaResource', 'Multimedia resource', 'It provides the Internet address of a media resource related to the service.'),
(409, 1, 5, 'nodeType', 'Node type', 'It provides the node\'s category (intersection, toll, roundabout, roadway terminal, and so on).'),
(410, 1, 5, 'numTrack', 'Track number', 'The number of available tracks. Set to zero in the case of a railway section under construction or discarded.'),
(411, 1, 5, 'number', 'Number', 'It provides the numerical part of the civic number.'),
(412, 1, 5, 'occupancy', 'Occupancy', 'It provides the occupancy rate of the road detected by the traffic sensor.'),
(413, 1, 5, 'occupied', 'Occupied', 'Number of occupied parking spaces.'),
(414, 1, 5, 'operatingStatus', 'Operating status', 'It indicates whether the road element or railroad section is under construction, in operation, or has been discarded.'),
(415, 1, 5, 'otherHouseNumber', 'Other house number', 'It provides a second civic number to which the service can be accessed.'),
(416, 1, 5, 'otherStreetAddress', 'Other street address', 'It provides a second street address to which the service can be accessed.'),
(417, 1, 5, 'overtime', 'Overtime', 'It indicates the maximum execution time of the import process, after which it is killed.'),
(418, 1, 5, 'owner', 'Owner', 'AVM system owner.'),
(419, 1, 5, 'parkOccupancy', 'Park occupancy', 'Percentage of occupied parking spaces.'),
(420, 1, 5, 'parkingSpacesForDisabled', 'Parking spaces for disabled', 'It indicates the number of parking places reserved to disabled people.'),
(421, 1, 5, 'parkingSpacesForScooters', 'Parking spaces for scooters', 'It indicates the number of parking places reserved for scooters and similar.'),
(422, 1, 5, 'payingParkingSpaces', 'Paying parking spaces', 'It indicates the number of available paid places.'),
(423, 1, 5, 'perTemp', 'Perc. temperature', 'Indicates the expected perceived temperature.'),
(424, 1, 5, 'period', 'Period', 'It indicates the time expressed in seconds between two consecutive calls of the same process.'),
(425, 1, 5, 'physicalShape', 'Container shape', 'It indicates the shape of the waste bin with advanced features.'),
(426, 1, 5, 'placeName', 'Place name', 'It indicates the name of the place where the event takes place.'),
(427, 1, 5, 'pollenConcentration', 'Pollen', 'Pollen concentration'),
(428, 1, 5, 'pollenConcentrationLevel', 'Pollen concentration level', 'Pollen concentration level'),
(429, 1, 5, 'pollenConcentrationTrend', 'Pollen concentration trend', 'Pollen concentration trend.'),
(430, 1, 5, 'porteCochere', 'Porte cochere', 'It indicates if the entry is a porte cochere.'),
(431, 1, 5, 'power', 'Power', 'Indicates the power of the lamppost.'),
(432, 1, 5, 'primaryType', 'Primary type', 'It describes the main service that is provided.'),
(433, 1, 5, 'processType', 'Process type', 'It describes the type of process.'),
(434, 1, 5, 'public', 'Public', 'It indicates whether it is a public lighting streetlight.'),
(435, 1, 5, 'railDepartment', 'Rail department', 'It indicates the railway department of which the railway line is part.'),
(436, 1, 5, 'railwaySiding', 'Railway siding', 'It provides the number of sidings available in the goods yard.'),
(437, 1, 5, 'rainfall', 'Rainfall', 'Rainfall Detection'),
(438, 1, 5, 'rainfallLast12Hours', 'Rainfall last 12 hours', 'Rainfall detection within the last 12 hours.'),
(439, 1, 5, 'rainfallLast15Minutes', 'Rainfall last 15 minutes', 'Rainfall detection within the last 15 minutes.'),
(440, 1, 5, 'rainfallLast1Hour', 'Rainfall last 1 hour', 'Rainfall detection within the last hour.'),
(441, 1, 5, 'rainfallLast24Hours', 'Rainfall last 24 hours', 'Rainfall detection within the last 24 hours.'),
(442, 1, 5, 'rainfallLast36Hours', 'Rainfall last 36 hours', 'Rainfall detection within the last 36 hours.'),
(443, 1, 5, 'rainfallLast3Hours', 'Rainfall last 3 hours', 'Rainfall detection within the last 3 hours.'),
(444, 1, 5, 'rainfallLast6Hours', 'Rainfall last 6 hours', 'Rainfall detection within the last 6 hours.'),
(445, 1, 5, 'recTemp', 'Rec temp', 'It returns the temperature actually detected.'),
(446, 1, 5, 'rechargeState', 'Charging station status', 'Describes the status of the column for charging electric vehicles.'),
(447, 1, 5, 'redCodeCount', 'Red code count', 'It provides the number of patients who are admitted to Red Emergency Assistance.'),
(448, 1, 5, 'referencePerson', 'Reference person', 'Reference person'),
(449, 1, 5, 'restrictionType', 'Restriction type', 'It describes the type of the active restriction.'),
(450, 1, 5, 'restrictionValue', 'Restriction value', 'It provides a quantification for the active restriction, when applicable.'),
(451, 1, 5, 'rideState', 'Ride state', 'State of the ride: advance, late, on time.'),
(452, 1, 5, 'riverName', 'River name', 'River name'),
(453, 1, 5, 'roadName', 'Road name', 'It indicates the name of the road without the generic naming.'),
(454, 1, 5, 'roadType', 'Road type', 'It indicates the generic naming only.'),
(455, 1, 5, 'routeCode', 'Route code', 'It provides the code of the thematic path.'),
(456, 1, 5, 'routeLength', 'Route length', 'It provides the route length.'),
(457, 1, 5, 'routePosition', 'Route position', 'It provides the position of the service within the thematic path.'),
(458, 1, 5, 'severityCode', 'Severity code', 'It provides a code that describes the severity of the event, used for mobility events.'),
(459, 1, 5, 'shortDescription', 'Short description', 'Brief indication of where the service is provided.'),
(460, 1, 5, 'snow', 'Snow', 'It provides a forecast about the snowfalls.'),
(461, 1, 5, 'soilWaterPotential', 'Soil water potential', 'It provides the soil water potential detected by the intelligent sprinkler.'),
(462, 1, 5, 'speedLimit', 'Speed limit', 'It indicates the speed limit in force on the specific road section.'),
(463, 1, 5, 'speedPercentile', 'Speed percentile', 'Percentile calculated on the speeds detected by the traffic sensor.'),
(464, 1, 5, 'state', 'State', 'Describes the status of a charging station for electric vehicles, or a railway station.'),
(465, 1, 5, 'stopNumber', 'Stop number', 'It indicates the number of the TPL stop.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(466, 1, 5, 'streetWithCurb', 'Street with curb', 'It indicates if the middle line is replaced by a separation wall.'),
(467, 1, 5, 'streetWithRtzAccess', 'Street with Restricted Traffic Zone access', 'Indicates whether or not the street belongs to a restricted traffic zone.'),
(468, 1, 5, 'studentsAtRefectory', 'number of students at the refectory', NULL),
(469, 1, 5, 'studentsAtSchool', 'number of students present at school', NULL),
(470, 1, 5, 'sunHeight', 'Sun height', 'Indicates the maximum height that will reach the sun during the day.'),
(471, 1, 5, 'sunrise', 'Sunrise', 'Indicates the time at which the sun will rise.'),
(472, 1, 5, 'sunset', 'Sunset', 'Indicates the time at which the sun will set.'),
(473, 1, 5, 'supply', 'Supply', 'Indicates whether it is an electrified line or not.'),
(474, 1, 5, 'surfaceArea', 'Surface area', 'Surface area'),
(475, 1, 5, 'temperature', 'Temperature', 'Temperature detection.'),
(476, 1, 5, 'temperatureLastObservation', 'Temperature last observation', 'It indicates the latest detected temperature value.'),
(477, 1, 5, 'temperatureMaxToday', 'Today max temperature', 'It indicates the maximum temperature value detected during the day.'),
(478, 1, 5, 'temperatureMaxYesterday', 'Yesterday max temperature', 'It indicates the maximum temperature value recorded on the previous day.'),
(479, 1, 5, 'temperatureMinToday', 'Today min temperature', 'It indicates the minimum temperature value detected during the day.'),
(480, 1, 5, 'temperatureMinYesterday', 'Yesterday min temperature', 'It indicates the minimum temperature value recorded on the previous day.'),
(481, 1, 5, 'text', 'Text', 'Returns the text written on the milestone (mileage).'),
(482, 1, 5, 'thresholdPerc', 'Threshold perc', 'Threshold value for the percentile of the speeds detected by the traffic sensor.'),
(483, 1, 5, 'time', 'Time', 'Times of last detection, and times of detection of extreme values, of humidity, precipitation, temperature and wind.'),
(484, 1, 5, 'timeHumidityObservation', 'Time humidity observation', 'Times of last detection, and times of detection of extreme values, of humidity.'),
(485, 1, 5, 'timeLastObservationHumidity', 'Time humidity last observation', 'Time of last detection of the humidity.'),
(486, 1, 5, 'timeLastObservationTemperature', 'Time last temperature observation', 'Time when the most recent temperature test was performed.'),
(487, 1, 5, 'timeLastObservationWind', 'Time wind last observation', 'The time when the latest wind speed detection was performed.'),
(488, 1, 5, 'timeRainfallLastObservation', 'Time rainfall last observation', 'The most recent rainfall detection.'),
(489, 1, 5, 'timeTemperatureObservation', 'Time temperature observation', 'Times of last detection, and times of detection of extreme values, of temperature.'),
(490, 1, 5, 'timeTodayMaxHumidity', 'Time today max humidity', 'Time when the maximum humidity concentration in the air was detected during the day.'),
(491, 1, 5, 'timeTodayMaxTemperature', 'Time today max temperature', 'The time when the maximum temperature was detected during the day.'),
(492, 1, 5, 'timeTodayMaxWindVelocity', 'Time today max wind velocity', 'The time when the maximum windiness was detected during the day.'),
(493, 1, 5, 'timeTodayMinHumidity', 'Time today min humidity', 'The time when the lowest concentration of humidity in the air was detected during the day.'),
(494, 1, 5, 'timeTodayMinTemperature', 'Time today min temperature', 'Time when the minimum temperature was detected during the day.'),
(495, 1, 5, 'timeWaterLevelObservation', 'Time water level observation', 'Time when the most recent water level detection was performed.'),
(496, 1, 5, 'timeWindObservation', 'Time wind observation', 'Times of last detection, and times of detection of extreme values, of windness.'),
(497, 1, 5, 'timeYesterdayMaxHumidity', 'Time yesterday max humidity', 'The time when the highest humidity concentration was detected during the previous day.'),
(498, 1, 5, 'timeYesterdayMaxTemperature', 'Time yesterday max temperature', 'The time when the maximum temperature was detected during the previous day.'),
(499, 1, 5, 'timeYesterdayMaxWindVelocity', 'Time yesterday max wind velocity', 'The time when the maximum windiness was detected during the previous day.'),
(500, 1, 5, 'timeYesterdayMinHumidity', 'time yesterday min humidity', 'Time when the lowest humidity concentration was detected during the previous day.'),
(501, 1, 5, 'timeYesterdayMinTemperature', 'Time yesterday min temperature', 'The time when the lowest temperature was detected during the previous day.'),
(502, 1, 5, 'timestamp', 'Time slot', 'One-second time interval, usually used as a time instant, to provide time allocation to a generic event. EVEN IF INSTANT IS INTRODUCED, THIS ATTRIBUTE MUST BE PRESERVED.'),
(503, 1, 5, 'todayMaxHumidity', 'Today max humidity', 'It provides the maximum value of humidity detected by the weather station throughout the day.'),
(504, 1, 5, 'todayMaxWaterLevel', 'Today max water level', 'It indicates the highest level of water detected in the day.'),
(505, 1, 5, 'todayMaxWindAverageSpeed', 'Today max wind average speed', 'Average windness of the day, determined by averaging the peaks.'),
(506, 1, 5, 'todayMaxWindDirection', 'Today max wind direction', 'It provides the wind direction detected at the peak windness of the day.'),
(507, 1, 5, 'todayMaxWindGustSpeed', 'Today max wind gust speed', 'Windness detected by equally fractionating the day and considering for each fraction the peak value only.'),
(508, 1, 5, 'todayMinHumidity', 'Today min humidity', 'It provides the minimum moisture value detected by the weather station throughout the day.'),
(509, 1, 5, 'todayMinWaterLevel', 'Today min water level', 'It indicates the lowest level of water detected in the day.'),
(510, 1, 5, 'trackType', 'Track type', 'Indicates whether the railway section is single track or double track.'),
(511, 1, 5, 'trafficDir', 'Traffic dir', 'It indicates whether the road section can be traveled in one or both directions.'),
(512, 1, 5, 'type', 'Type', 'It provides a first indication about the service delivered but is not intended to be shown to users.'),
(513, 1, 5, 'typeLabel', 'Type label', 'It provides a first description of the service provided, intended to be displayed to users and therefore available in multiple languages.'),
(514, 1, 5, 'typeOfResale', 'Type of resale', 'It describes the type of resale of TPL tickets (bars, bookstores, tobacconists, stationery, etc.).'),
(515, 1, 5, 'typicalIrrigationTime', 'Typical irrigation time', 'It indicates the usual time when the irrigator comes into operation.'),
(516, 1, 5, 'underpass', 'Underpass', 'It indicates whether the railroad section is within a subway.'),
(517, 1, 5, 'userTagId', 'User tag ID', 'An identifier for the smart waste container user.'),
(518, 1, 5, 'uuid', 'Uuid', 'Identifier that, together with major and minor, uniquely identifies the Beacon device.'),
(519, 1, 5, 'uv', 'Uv', 'Forecast about the intensity of UV rays.'),
(520, 1, 5, 'validityStatus', 'Validity status', 'It indicates whether the parking sensor is active or not.'),
(521, 1, 5, 'value', 'Value', 'It indicates the resulting value from the statistical detection.'),
(522, 1, 5, 'vehicle', 'Vehicle', 'Unique identifier of a local public transport vehicle.'),
(523, 1, 5, 'vehicleFlow', 'Vehicle flow', 'It indicates the flow of vehicles detected by the traffic sensor.'),
(524, 1, 5, 'wasteLevel', 'Waste level', 'It indicates the fill level of the waste bin with advanced features.'),
(525, 1, 5, 'waterLevel', 'Water level', 'Indicators relating to inland water monitoring.'),
(526, 1, 5, 'waterLevelVariation', 'Water level variation', 'Variations detected in the water level sampled every 1, 3, or 6, hours.'),
(527, 1, 5, 'waterLevelVariationLast1Hour', 'Water level variation last 1 hour', 'Variations detected in the water level sampled at every hour.'),
(528, 1, 5, 'waterLevelVariationLast3Hours', 'Water level variation last 3 hours', 'Variations detected in the water level sampled every 3 hours.'),
(529, 1, 5, 'waterLevelVariationLast6Hours', 'Water level variation last 6 hours', 'Variations detected in the water level sampled every 6 hours.'),
(530, 1, 5, 'whiteCodeCount', 'White code count', 'Number of patients admitted to White Emergency Assistance.'),
(531, 1, 5, 'width', 'Width', 'Road section width.'),
(532, 1, 5, 'wind', 'Wind', 'Expected windness.'),
(533, 1, 5, 'windAverageSpeed', 'Wind average speed', 'Average windness.'),
(534, 1, 5, 'windDirection', 'Wind direction', 'Wind direction'),
(535, 1, 5, 'windGustSpeed', 'Wind gust speed', 'Windness detected by equally fractionating the time and considering for each fraction the peak value only.'),
(536, 1, 5, 'yardType', 'Yard type', 'It indicates whether the goods yard is public or private.'),
(537, 1, 5, 'year', 'Year', 'It indicates the year when the resolution was approved.'),
(538, 1, 5, 'yellowCodeCount', 'Yellow code count', 'Number of patients admitted to First Aid in Yellow Code.'),
(539, 1, 5, 'yesterdayMaxHumidity', 'Yesterday max humidity', 'It provides the maximum value of humidity detected by the weather station over the previous day.'),
(540, 1, 5, 'yesterdayMaxWaterLevel', 'Yesterday max water level', 'Maximum water level recorded over the previous day.'),
(541, 1, 5, 'yesterdayMaxWindAverageSpeed', 'Yesterday max wind average speed', 'Average windness of the previous day, determined by averaging the peaks.'),
(542, 1, 5, 'yesterdayMaxWindDirection', 'Yesterday max wind direction', 'It provides the wind direction detected at the peak windness of the previous day.'),
(543, 1, 5, 'yesterdayMaxWindGustSpeed', 'Yesterday max wind gust speed', 'Windness detected by equally fractionating the previous day and considering for each fraction the peak value only.'),
(544, 1, 5, 'yesterdayMinHumidity', 'Yesterday min humidity', 'It provides the minimum value of humidity detected by the weather station over the previous day.'),
(545, 1, 5, 'yesterdayMinWaterLevel', 'Yesterday min water level', 'Minimum water level recorded over the previous day.'),
(546, 1, 6, 'has_article', 'has_article', NULL),
(547, 1, 6, 'has_dem_ach', 'has_dem_ach', NULL),
(548, 1, 6, 'has_fournisseur', 'has_fournisseur', NULL),
(549, 1, 6, 'has_operateur', 'has_operateur', NULL),
(550, 1, 6, 'has_commande', 'has_commande', NULL),
(551, 1, 6, 'famille_article', 'famille_article', NULL),
(552, 1, 6, 'ss_famille_article', 'ss_famille_article', NULL),
(553, 1, 6, 'contact', 'contact', NULL),
(554, 1, 6, 'quantite', 'quantite', NULL),
(555, 1, 6, 'adresse_livraison', 'adresse_livraison', NULL),
(556, 1, 6, 'article_demande', 'article_demande', NULL),
(557, 1, 6, 'cmd_has_dem_ach', 'commande a comme demande d\'achat', NULL),
(601, 1, 11, 'NumClient', 'NumClient', NULL),
(602, 1, 11, 'DescriptionClient', 'DescriptionClient', NULL),
(603, 1, 11, 'NumCommandes', 'NumCommandes', NULL),
(604, 1, 11, 'DateCommandes', 'DateCommandes', NULL),
(605, 1, 11, 'DateExpedition', 'DateExpedition', NULL),
(606, 1, 11, 'NumSalarie', 'NumSalarie', NULL),
(607, 1, 11, 'NumProduit', 'NumProduit', NULL),
(608, 1, 11, 'NomProduit', 'NomProduit', NULL),
(609, 1, 11, 'DescriptionProduit', 'DescriptionProduit', NULL),
(610, 1, 11, 'PrixPublic', 'PrixPublic', NULL),
(611, 1, 11, 'QuantiteEnStock', 'QuantiteEnStock', NULL),
(612, 1, 11, 'NumFournisseur', 'NumFournisseur', NULL),
(613, 1, 11, 'AdresseFournisseur', 'AdresseFournisseur', NULL),
(614, 1, 11, 'VilleFournisseur', 'VilleFournisseur', NULL),
(615, 1, 11, 'CodePostalFournisseur', 'CodePostalFournisseur', NULL),
(616, 1, 11, 'TelephoneFournisseur', 'TelephoneFournisseur', NULL),
(617, 1, 11, 'TelecopieFournisseur', 'TelecopieFournisseur', NULL),
(618, 1, 12, 'N°Client', 'N°Client', NULL),
(619, 1, 12, 'Nom_Client', 'Nom_Client', NULL),
(620, 1, 12, 'Prénom_Client', 'Prénom_Client', NULL),
(621, 1, 12, 'Adresse_Client', 'Adresse_Client', NULL),
(622, 1, 12, 'N°Commandes', 'N°Commandes', NULL),
(623, 1, 12, 'Date_Commandes', 'Date_Commandes', NULL),
(624, 1, 12, 'Adresse_Livraison', 'Adresse_Livraison', NULL),
(625, 1, 12, 'NumClient', 'NumClient', NULL),
(626, 1, 12, 'N°Produit', 'N°Produit', NULL),
(627, 1, 12, 'Libellé_Produit', 'Libellé_Produit', NULL),
(628, 1, 12, 'Prix_Produit', 'Prix_Produit', NULL),
(629, 1, 12, 'NFournisseur', 'NumFournisseur', NULL),
(630, 1, 12, 'AdresseFournisseur', 'AdresseFournisseur', NULL),
(631, 1, 12, 'VilleFournisseur', 'VilleFournisseur', NULL),
(632, 1, 12, 'CodePostalFournisseur', 'CodePostalFournisseur', NULL),
(633, 1, 12, 'TelephoneFournisseur', 'TelephoneFournisseur', NULL),
(634, 1, 12, 'TelecopieFournisseur', 'TelecopieFournisseur', NULL),
(655, 1, 15, 'N°Client', 'N°Client', NULL),
(656, 1, 15, 'Effectue', 'Effectue', NULL),
(657, 1, 15, 'Contient', 'Contient', NULL),
(658, 1, 15, 'Nom_Client', 'Nom_Client', NULL),
(659, 1, 15, 'Prénom_Client', 'Prénom_Client', NULL),
(660, 1, 15, 'Adresse_Client', 'Adresse_Client', NULL),
(661, 1, 15, 'N°Commandes', 'N°Commandes', NULL),
(662, 1, 15, 'Date_Commandes', 'Date_Commandes', NULL),
(663, 1, 15, 'Adresse_Livraison', 'Adresse_Livraison', NULL),
(664, 1, 15, 'N°Produit', 'N°Produit', NULL),
(665, 1, 15, 'Libellé_Produit', 'Libellé_Produit', NULL),
(666, 1, 15, 'Prix_Produit', 'Prix_Produit', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(13, 1, NULL, NULL, NULL, 'Client', 1, '2021-04-25 07:29:14', '2021-04-25 09:38:15', 'Omeka\\Entity\\ItemSet'),
(14, 1, NULL, NULL, NULL, 'Client', 1, '2021-04-25 09:34:58', '2021-04-25 09:41:30', 'Omeka\\Entity\\Item'),
(15, 1, NULL, NULL, NULL, 'Commande', 1, '2021-04-25 09:35:26', '2021-04-25 09:39:50', 'Omeka\\Entity\\ItemSet'),
(16, 1, NULL, NULL, NULL, 'Produit', 1, '2021-04-25 09:39:03', '2021-04-25 09:40:42', 'Omeka\\Entity\\ItemSet'),
(17, 1, NULL, NULL, NULL, 'Commande', 1, '2021-04-25 09:42:16', '2021-04-25 09:44:18', 'Omeka\\Entity\\Item'),
(18, 1, NULL, NULL, NULL, 'Produit', 1, '2021-04-25 09:43:48', '2021-04-25 09:43:48', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(106, 1, 5, 'AVMRecord', 'AVM Record', 'Corsa programmata da una certa azienda TPL su un certo percorso di una certa linea'),
(107, 1, 5, 'Accommodation', 'Accommodation', 'Hotels and similar structures.'),
(108, 1, 5, 'Accommodation_or_office_containers_rental', 'Accommodation or office containers rental', 'The instances of this class represent, among all business activities, some companies that deal with rental of containers for housing and offices.'),
(109, 1, 5, 'Accountants', 'Accountants', 'The instances of this class represent, among all the business activities, certain commercial, tax and audit firms.'),
(110, 1, 5, 'Addiction_recovery_centre', 'Addiction recovery centre', 'The instances of this class represent, among all business activities, certain communities and recuperation centers from dependencies.'),
(111, 1, 5, 'AdministrativeRoad', 'Administrative Road', 'Class whose instances are the administrative extents defined in the road graph.'),
(112, 1, 5, 'Adult_clothing', 'Adult Clothing', 'The instances of this class represent, among all business activities, certain retail clothing stores for adults.'),
(113, 1, 5, 'Advertising', 'Advertising', 'Advertising-related services.'),
(114, 1, 5, 'Advertising_and_promotion', 'Advertising and promotion', 'The instances of this class represent, among all business activities, certain dealerships and advertising companies.'),
(115, 1, 5, 'Aestestic_medicine_centre', 'Aestestic medicine centre', NULL),
(116, 1, 5, 'Agents', 'Agents', 'The instances of this class represent, among all business activities, certain agencies and agents for the show and sport.'),
(117, 1, 5, 'AgricultureAndLivestock', 'Agriculture and livestock', 'Activities and services relating to agriculture and livestock farming.'),
(118, 1, 5, 'Agritourism', 'Agritourism', 'The instances of this class represent, among all the business activities, certain catering and accommodation activities related to agricultural activities.'),
(119, 1, 5, 'AirQualityObservation', 'Air quality observation', 'Each instance of this class represents an air quality detection.'),
(120, 1, 5, 'Air_quality_monitoring_station', 'Air quality monitoring station', 'The instances of this class are dust-level detectors in the air.\nEach instance represents a specific detector, of a specific type, located in a specific location located through a pair of geospatial coordinates. On the other hand, for each detector there is at most one instance representing it.'),
(121, 1, 5, 'Airfields', 'Airfields', 'The instances of this class represent, among all service locations, some airfields.'),
(122, 1, 5, 'Airplanes_rental', 'Airplanes rental', 'The instances of this class represent, among all business activities, certain chartering activities of air transport.'),
(123, 1, 5, 'Airport_lost_property_office', 'Airport lost property office', 'The instances of this class represent, among all service locations, some offices for lost items at the airport.'),
(124, 1, 5, 'Amusement_activities', 'Amusement activities', 'The instances of this class represent, among all the business activities, some creative, artistic and entertainment activities.'),
(125, 1, 5, 'Amusement_and_theme_parks', 'Amusement and theme parks', 'The instances of this class represent, among all business activities, some amusement and themed parks.'),
(126, 1, 5, 'AnemometryObservation', 'Anemometry observation', 'Each instance of this class represents a speed and wind direction detection.'),
(127, 1, 5, 'Animal_feeds_manufacture', 'Animal Feeds Manufacture', 'The instances of this class represent, among all business activities, some companies that produce animal feed.'),
(128, 1, 5, 'Animal_production', 'Animal Production', 'The instances of this class represent, among all business activities, some animal breeding companies.'),
(129, 1, 5, 'Antiques', 'Antiques', 'The instances of this class represent, among all business activities, certain retail companies of used furniture and antiques.'),
(130, 1, 5, 'Aquarium', 'Aquarium', 'The instances of this class represent, among all service locations, some aquariums.'),
(131, 1, 5, 'Archaeological_site', 'Archaeological site', 'The instances of this class represent, among all business activities, certain archaeological sites.'),
(132, 1, 5, 'Architectural_consulting', 'Architectural consulting', 'The instances of this class represent, among all the business activities, some activities of architectural studies.'),
(133, 1, 5, 'Area', 'Polygonal Service', 'Services represented by a polygonal form area.'),
(134, 1, 5, 'Art_galleries', 'Art Galleries', 'The instances of this class represent, among all the business activities, certain retail companies of art objects including art galleries.'),
(135, 1, 5, 'Artisan_shop', 'Artisanshop', 'The instances of this class represent, among all the business activities, some craft workshops.'),
(136, 1, 5, 'Assistance', 'Assistance', 'The instances of this class represent, among all the services, some personal assistance services.'),
(137, 1, 5, 'Associations', 'Associations', 'The instances of this class represent, among all the business activities, certain business activities carried out by associative organizations.'),
(138, 1, 5, 'Atm', 'Atm', 'The instances of this class represent, among all services, ATMs.'),
(139, 1, 5, 'Auctioning_houses', 'Auctioning Houses', 'The instances of this class represent, among all business activities, some retail auction houses, excluding auction houses via the Internet.'),
(140, 1, 5, 'Audio_and_video', 'Audio and Video', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of audio and video equipment in specialized stores.'),
(141, 1, 5, 'Auditing_activities', 'Auditing activities', 'The instances of this class represent, among all business activities, some auditing activities.'),
(142, 1, 5, 'Auditorium', 'Auditorium', 'The instances of this class represent, among all the business activities, some auditoriums.'),
(143, 1, 5, 'Automobile_driving_and_flying_schools', 'Automobile driving and flying schools', 'The instances of this class include, among all business activities, some driving, flying and nautical schools.'),
(144, 1, 5, 'Bakery', 'Bakery', 'The instances of this class represent, among all business activities, certain bread retail activities, as well as pies, sweets and confectionery.'),
(145, 1, 5, 'Bank', 'Bank', 'The instances of this class represent, among all business activities, some lenders and financial service activities in general.'),
(146, 1, 5, 'Bar', 'Bar', 'The instances of this class include, among all business activities, certain bars and other similar exercises without cooking.'),
(147, 1, 5, 'Beach', 'Beach', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune spiagge.'),
(148, 1, 5, 'Beach_resort', 'Beach resort', 'Such activities represent, among all service locations, some bathing establishments.'),
(149, 1, 5, 'Beacon', 'Beacon', 'Service associated to Beacon that allow to receive offers.'),
(150, 1, 5, 'BeaconObservation', 'Beacon observation', 'lettura proveniente da un singolo beacon'),
(151, 1, 5, 'Beauty_centre', 'Beauty centre', 'The instances of this class represent, among all the business activities, certain services of beauty institutes.'),
(152, 1, 5, 'Bed_and_breakfast', 'Bed and breakfast', 'The instances of this class represent, among all business activities, certain lodging activities in bed and breakfast.'),
(153, 1, 5, 'Bench', 'Bench', 'Each instance of this class represents a bench.'),
(154, 1, 5, 'Betting_shops', 'Betting shops', 'The instances of this class represent, among all business activities, certain betting shops.'),
(155, 1, 5, 'Beverage_manufacture', 'Beverage Manufacture', 'The instances of this class represent, among all business activities, certain beverage production activities.'),
(156, 1, 5, 'BikeRackObservation', 'Bike rack observation', 'Each instance of this class represents a finding of places available in a bicycle rack at a given instant.'),
(157, 1, 5, 'Bike_rack', 'Bike rack', 'Each instance of this class represents a bike rack.'),
(158, 1, 5, 'Bike_rental', 'Bike rental', 'The instances of this class represent, among all business activities, some bicycle rental activities.'),
(159, 1, 5, 'Bike_sharing_rack', 'Bike sharing rack', NULL),
(160, 1, 5, 'Boarding_house', 'Boarding house', 'The instances of this class represent, among all the business activities, certain guest houses.'),
(161, 1, 5, 'Boat_equipment', 'Boat equipment', 'The instances of this class represent, among all business activities, certain retail and boat related activities.'),
(162, 1, 5, 'Boats_and_ships_rental', 'Boats and ships rental', 'The instances of this class represent, among all the business activities, certain activities of renting sea and river transport.'),
(163, 1, 5, 'Bollard', 'Bollard', 'Each instance of this class represents a mobile bollard.'),
(164, 1, 5, 'Bookshop', 'Book Shop', 'The instances of this class represent, among all business activities, some retail business of new books.'),
(165, 1, 5, 'Botanical_and_zoological_gardens', 'Botanical and zoological gardens', 'The instances of this class represent, among all business activities, some activities of botanical gardens, zoological gardens and natural reserves.'),
(166, 1, 5, 'Boxoffice', 'Boxoffice', 'The instances of this class include, among all business activities, some resale of tickets for sporting events and entertainment.'),
(167, 1, 5, 'Building_and_industrial_cleaning_activities', 'Building and industrial cleaning activities', 'The instances of this class represent, among all business activities, certain sterilization activities of buildings, plant, industrial machinery and healthcare equipment.'),
(168, 1, 5, 'Building_construction', 'Building Construction', 'The instances of this class represent, among all the business activities, certain building design and building activities.'),
(169, 1, 5, 'Building_material', 'Building Material', 'The instances of this class represent, among all the business activities, certain retail business of building materials, ceramics, tiles.'),
(170, 1, 5, 'Building_materials_manufacture', 'Building Materials Manufacture', 'The instances of this class represent, among all the business activities, certain cement, lime, concrete, gypsum and other building compounds.'),
(171, 1, 5, 'BusStop', 'Bus Stop', 'Interconnection point between road segments to determine the path of a TPL line.'),
(172, 1, 5, 'BusStopForecast', 'BusStop Forecast', 'Arrival forecast at a certain stop.'),
(173, 1, 5, 'Bus_tickets_retail', 'Bus tickets retail', 'The instances of this class represent, among all business activities, some bus ticket resale services.'),
(174, 1, 5, 'Business_support', 'Business support', 'The instances of this class represent, among all business activities, certain types of business support activities. These are mainly companies of: exactorial management; distribution agencies of books, newspapers and magazines; services of public market management and public weights; request for certificates and public purses; request for certificates and practical drawings.'),
(175, 1, 5, 'Call_center', 'Call center', 'The instances of this class represent, among all business activities, some call center activities.'),
(176, 1, 5, 'Camper_service', 'Camper service', 'The instances of this class represent, among all the business activities, certain activities of traveling tourism services.'),
(177, 1, 5, 'Camping', 'Camping', 'The instances of this class include, among all business activities, some parking areas and areas equipped for motor homes and caravans.'),
(178, 1, 5, 'Canteens_and_food_service', 'Canteens and Food Service', 'The instances of this class represent, among all the business activities, certain canteens and continuous catering activities on a contractual basis.'),
(179, 1, 5, 'CarParkSensor', 'Car Park Sensor', 'Sensor collecting data inside a parking lot.'),
(180, 1, 5, 'Car_park', 'Car park', 'The instances of this class represent, among all business activities, some parking and caretaking activities.'),
(181, 1, 5, 'Car_rental_with_driver', 'Car Rental With Driver', 'The instances of this class represent, among all the business activities, certain transport activities by renting passenger cars with driver.'),
(182, 1, 5, 'Car_washing', 'Car Washing', 'The instances of this class represent, among all business activities, certain car wash activities.'),
(183, 1, 5, 'Carabinieri', 'Carabinieri', 'The instances of this class represent, among all service locations, some Carabinieri barracks.'),
(184, 1, 5, 'Cargo_handling', 'Cargo Handling', 'The instances of this class represent, among all the business activities, certain cargo handling activities on road and rail.'),
(185, 1, 5, 'Carpentry', 'Carpentry', 'The instances of this class represent, among all the business activities, some furniture repair and furnishing repair activities.'),
(186, 1, 5, 'Carpets', 'Carpets', 'The instances of this class represent, among all the business activities, certain carpet retail activities.'),
(187, 1, 5, 'Carpets_and_curtains', 'Carpets and Curtains', 'The instances of this class represent, among all the business activities, some retail activities of carpets, curtains and curtains.'),
(188, 1, 5, 'Cartographers', 'Cartographers', 'The instances of this class represent, among all the business activities, some cartography and aerial photogrammetry activities.'),
(189, 1, 5, 'Castle', 'Castle', 'The instances of this class represent some castles where tourist services of various kinds are offered.'),
(190, 1, 5, 'Catering', 'Catering', 'The instances of this class represent, among all the business activities, certain catering activities for events, banqueting, provision of meals prepared for catering and other catering services.'),
(191, 1, 5, 'Cemetery', 'Cemetery', 'The instances of this class each represent a cemetery.'),
(192, 1, 5, 'ChargeStationObservation', 'Charge station observation', 'Each instance of this class represents a state of a column for charging electric vehicles at a given instant.'),
(193, 1, 5, 'Charging_stations', 'Charging stations', 'The instances of this class represent, among all business activities, certain supply of columns for charging power supplies and related services.'),
(194, 1, 5, 'Charter_airlines', 'Charter Airlines', 'The instances of this class represent, among all business activities, some non-scheduled air transport activities (charter flights).'),
(195, 1, 5, 'Churches', 'Churches', 'The instances of this class represent, among all the places of service, certain places of worship and business activities related to places of worship.'),
(196, 1, 5, 'Cinema', 'Cinema', 'The instances of this class represent, among all the business activities, certain cinematic projection activities.'),
(197, 1, 5, 'CivilAndEdilEngineering', 'Civil and edil engineering', 'Services related to civil and construction engineering. '),
(198, 1, 5, 'Civil_airport', 'Civil airport', 'The instances of this class represent, among all business activities, certain activities carried out by civil airports, with particular reference to transfer and rental services.'),
(199, 1, 5, 'Civil_engineering', 'Civil Engineering', 'The instances of this class represent, among all the business activities, certain civil engineering activities, and in particular the activities of building public works.'),
(200, 1, 5, 'Civil_protection', 'Civil protection', 'The instances of this class represent, among all service locations, certain civil protection activities.'),
(201, 1, 5, 'Civil_registry', 'Civil registry', 'The instances of this class represent, among all service locations, certain registry offices.'),
(202, 1, 5, 'Cleaning_activities', 'Cleaning activities', 'The instances of this class represent, among all the business activities, some cleaning and disinfestation activities.'),
(203, 1, 5, 'Cleaning_materials', 'Cleaning Materials', 'The instances of this class represent, among all business activities, certain retail activities of soaps, detergents, polishing products and the like.'),
(204, 1, 5, 'Climbing', 'Climbing', 'The instances of this class represent, among all the business activities, some mountaineering activities.'),
(205, 1, 5, 'Clothing', 'Clothing', 'The instances of this class represent, among all the business activities, some clothing retail business.'),
(206, 1, 5, 'Clothing_accessories', 'Clothing Accessories', 'The instances of this class represent, among all business activities, certain retail activities of hats, umbrellas, gloves and ties.'),
(207, 1, 5, 'Clothing_and_linen', 'Clothing and Linen', 'The instances of this class represent, among all the business activities, certain retail trade activities of clothing, home furnishings and household linen.'),
(208, 1, 5, 'Clothing_children_and_infants', 'Clothing Children and Infants', 'The instances of this class represent, among all business activities, certain retail children\'s clothing.'),
(209, 1, 5, 'Clothing_factory_outlet', 'Clothing factory outlet', 'The instances of this class represent, among all business activities, certain activities of selling and selling outlets of clothing.'),
(210, 1, 5, 'Coast_guard_harbormaster', 'Coast guard harbormaster', 'The instances of this class represent, among all service locations, certain offices of the Coast Guard and the Harbor Captain.'),
(211, 1, 5, 'Coffee_rosters', 'Coffee Rosters', 'The instances of this class represent, among all business activities, some rotten coffee retail business.'),
(212, 1, 5, 'Coke_and_petroleum_derivatives', 'Coke and Petroleum Derivatives', 'The instances of this class represent, among all business activities, certain coke refining activities and other petroleum refining products.'),
(213, 1, 5, 'Combined_facilities_support_activities', 'Combined facilities support activities', 'The instances of this class represent, among all business activities, some integrated building management services.'),
(214, 1, 5, 'Commissariat_of_public_safety', 'Commissariat of public safety', 'The instances of this class represent, among all service locations, certain Commissariats of Public Safety.'),
(215, 1, 5, 'Community_centre', 'Community centre', 'The instances of this class represent, among all service locations, some day health care centers.'),
(216, 1, 5, 'Computer_data_processing', 'Computer data processing', 'The instances of this class represent, among all business activities, certain data bases management and electronic data processing.'),
(217, 1, 5, 'Computer_programming_and_consultancy', 'Computer programming and consultancy', 'The instances of this class include, among all business activities, certain software production activities, computer consultancy activities, configuration and management of facilities and computer equipment, and other IT related services.'),
(218, 1, 5, 'Computer_systems', 'Computer Systems', 'The instances of this class represent, among all business activities, certain retail business of computers, peripherals, software and office equipment in specialized stores.'),
(219, 1, 5, 'Computer_technician', 'Computer technician', 'The instances of this class represent, among all business activities, some repair and maintenance of computers and peripherals.'),
(220, 1, 5, 'Conservatory', 'Conservatory', 'The instances of this class represent, among all the business activities, certain activities of music conservators.'),
(221, 1, 5, 'Consulate', 'Consulate', 'The instances of this class represent, among all service locations, some foreign consulates in Italy.'),
(222, 1, 5, 'Consulting_services', 'Consulting services', 'The instances of this class represent, among all business activities, certain consulting activities in general, for example in the field of safety, hygiene, agriculture and so on.'),
(223, 1, 5, 'Controlled_parking_zone', 'Controlled parking zone', 'The instances of this class represent, among all service locations, certain controlled parking areas.'),
(224, 1, 5, 'Corps_of_forest_rangers', 'Corps of forest rangers', 'The instances of this class represent, among all service locations, certain sites of the Corp of Forest Rangers.'),
(225, 1, 5, 'Courier', 'Courier', 'The instances of this class represent, among all business activities, certain postal and courier activities on which no universal service obligation is involved (a statutory obligation to guarantee a minimum level of service to be rendered to all The affected user).'),
(226, 1, 5, 'Credit_collection_agencies', 'Credit collection agencies', 'The instances of this class represent, among all business activities, certain activities of credit recovery agencies.'),
(227, 1, 5, 'Crop_animal_production_hunting', 'Crop Animal Production Hunting', 'The instances of this class represent, among all business activities, certain agricultural production activities, processing of animal products, hunting, and other related activities.'),
(228, 1, 5, 'Crop_production', 'Crop Production', 'The instances of this class represent, among all the business activities, certain cultivation activities.'),
(229, 1, 5, 'CulturalActivity', 'Cultural Activity', 'Libraries, archives, museums and other cultural activities.'),
(230, 1, 5, 'Cultural_and_recreation_goods', 'Cultural and Recreation Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of cultural and recreational items in specialized stores.'),
(231, 1, 5, 'Cultural_centre', 'Cultural centre', 'The instances of this class represent, among all service locations, certain centers of cultural activity.'),
(232, 1, 5, 'Cultural_education', 'Cultural education', 'The instances of this class represent, among all business activities, some centers of cultural formation.'),
(233, 1, 5, 'Cultural_sites', 'Cultural sites', 'The instances of this class represent, among all business activities, certain activities of libraries, archives, museums and other places of culture.'),
(234, 1, 5, 'Curtains_and_net_curtains', 'Curtains and Net Curtains', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of curtains and curtains.'),
(235, 1, 5, 'Cycle_paths', 'Cycle paths', 'The instances of this class represent, among all service locations, certain cycling routes.'),
(236, 1, 5, 'Dairy_products', 'Dairy products', 'The demands of this class represent, among all business activities, certain retail trade activities of milk and dairy products.'),
(237, 1, 5, 'Dance_schools', 'Dance schools', 'The instances of this class represent, among all the business activities, some activities of conducting dance classes.'),
(238, 1, 5, 'Dating_service', 'Dating service', 'The instances of this class represent, among all the business activities, certain activities of marriage and meeting agencies.'),
(239, 1, 5, 'Day_care_centre', 'Day care centre', 'The instances of this class represent, among all service locations, some reception centers.'),
(240, 1, 5, 'Dentist', 'Dentist', 'The instances of this class represent, among all the business activities, some activities and services of dental surgeries.'),
(241, 1, 5, 'Department_of_motor_vehicles', 'Department of motor vehicles', 'The instances of this class represent, among all service locations, certain sites of Vehicle registration.'),
(242, 1, 5, 'Diet_products', 'Diet Products', 'The instances of this class represent, among all the business activities, some retail activities of macrobiotic and dietary products.'),
(243, 1, 5, 'DigitalLocation', 'Digital Location', 'Services classified by the city of Florence as Digital Location.'),
(244, 1, 5, 'Dining_hall', 'Dining hall', 'The instances of this class represent, among all service locations, certain canteens, not even structured in the form of a business.'),
(245, 1, 5, 'Disabled_parking_area', 'Disabled parking area', 'Ciascuna istanza di questa classe rappresenta un\'area di sosta riservata alle persone con ridotte capacità motorie.'),
(246, 1, 5, 'Discotheque', 'Discotheque', 'The instances of this class represent, among all the business activities, some activities of discos, ballrooms, nightclubs and the like.'),
(247, 1, 5, 'Discount', 'Discount', 'The instances of this class represent, among all business activities, some food discount activities.'),
(248, 1, 5, 'Disinfecting_and_exterminating_activities', 'Disinfecting and exterminating activities', 'The instances of this class represent, among all the business activities, certain disinfestation services.'),
(249, 1, 5, 'District', 'District', 'Class whose instances are the various neighborhoods in which a city can be subdivided.'),
(250, 1, 5, 'Diving_school', 'Diving school', 'The instances of this class represent, among all service locations, some diving schools.'),
(251, 1, 5, 'Doctor_office', 'Doctor office', 'The instances of this class represent, among all business activities, certain services of general medical practice.'),
(252, 1, 5, 'Dog_area', 'Dog area', 'Each instance of this class represents an area reserved for dog breeding.'),
(253, 1, 5, 'Door_to_door', 'Door to Door', 'The instances of this class represent, among all the business activities, certain retail activities of various products, by the intervention of a demonstrator or a sales agent (door to door).'),
(254, 1, 5, 'Drinking_fountain', 'Drinking fountain', 'The instances of this class represent, among all service locations, some drinking water fountains.'),
(255, 1, 5, 'EarthQuakeEvent', 'Earthquake', 'Each instance of this class represents an earthquake that affected the territory covered by the Km4City project.'),
(256, 1, 5, 'EducationAndResearch', 'EducationAndResearch', 'Services such as schools for all ages and training schools.'),
(257, 1, 5, 'Educational_support_activities', 'Educational support activities', 'The instances of this class include, among all business activities, certain education and training services, including counseling and school counseling services.'),
(258, 1, 5, 'Emergency', 'Emergency', 'Contiene tutte le classi relative ai servizi di emergenza'),
(259, 1, 5, 'Emergency_medical_care', 'Emergency medical care', 'The instances of this class include, among all business activities, certain health emergency services, blood banks, and others.'),
(260, 1, 5, 'Emergency_services', 'Emergency services', 'The instances of this class represent, among all service locations, certain roadside assistance services.'),
(261, 1, 5, 'Employment_exchange', 'Employment exchange', 'The instances of this class represent, among all service locations, some employment centers.'),
(262, 1, 5, 'Energy_supply', 'Energy Supply', 'The instances of this class represent, among all the business activities, certain activities of production, distribution, and trade in electricity and fuels.'),
(263, 1, 5, 'Engineering_consulting', 'Engineering consulting', 'The instances of this class represent, among all the business activities, certain activities of engineering studies.'),
(264, 1, 5, 'Entertainment', 'Entertainment', 'Entertainment services for the citizen.'),
(265, 1, 5, 'Entry', 'Entry', 'Classe le cui istanze sono i possibili ingressi ai numeri civici'),
(266, 1, 5, 'EntryRule', 'Entry Rule', 'Class whose instances are the rules of access to the different road elements.'),
(267, 1, 5, 'Environment', 'Environment', 'Environmentally friendly services.'),
(268, 1, 5, 'Equipment_for_events_and_shows_rental', 'Equipment for events and shows rental', 'The instances of this class represent, among all the business activities, some rental activities of facilities and equipment for events and shows.'),
(269, 1, 5, 'Estate_activities', 'Estate activities', 'The instances of this class represent, among all the business activities, certain leasing, sale, management and administration of real estate also for third parties.'),
(270, 1, 5, 'Event', 'Event', 'Events scheduled by the city of Florence and dusk.'),
(271, 1, 5, 'Extraction_of_natural_gas', 'Extraction of natural gas', 'The instances of this class represent, among all business activities, certain natural gas extraction activities.'),
(272, 1, 5, 'Extraction_of_salt', 'Extraction of salt', 'The instances of this class represent, among all the business activities, some salt extraction activities.'),
(273, 1, 5, 'Family_counselling', 'Family counselling', 'The instances of this class represent, among all service locations, some family counselors.'),
(274, 1, 5, 'Farm_house', 'Farm house', 'The cases of this class represent, among all the commercial activities, some activities of the hotel tourist residence.'),
(275, 1, 5, 'Fast_charging_station', 'Fast charging station', NULL),
(276, 1, 5, 'Ferry_stop', 'Ferry stop', 'The instances of this class are each a liner ferry port.'),
(277, 1, 5, 'FinancialService', 'Financial Service', 'Banks, monetary institutions and other financial services.'),
(278, 1, 5, 'Financial_institute', 'Financial institute', 'The instances of this class represent, among all business activities, certain financial services.'),
(279, 1, 5, 'Fine_arts_articles', 'Fine Arts Articles', 'The instances of this class represent, among all the business activities, certain retail activities of fine arts articles.'),
(280, 1, 5, 'Fire_brigade', 'Fire brigade', 'The instances of this class represent, among all service locations, certain fire brigades.'),
(281, 1, 5, 'First_aid', 'First aid', 'The instances of this class represent, among all service locations, some places of First Aid.'),
(282, 1, 5, 'First_aid_state', 'First Aid state', 'Each instance of this class represents a snapshot of how many people are, at a certain point in time, within a certain point of First Aid, in a certain condition, subdivided according to the urgency code assigned to them . The possible conditions in which a person who is in First Aid may be: destination, waiting, visiting, temporary observation. However, some instances report the total count, without taking into account the condition in which the different people are. In this case, the firstAidState property is valorized to \"Totali\".'),
(283, 1, 5, 'Fish_and_seafood', 'Fish and Seafood', 'The instances of this class represent, among all business activities, certain retail trade of fish, crustaceans and molluscs.'),
(284, 1, 5, 'Fishing_and_aquaculture', 'Fishing and Aquaculture', 'The instances of this class represent, among all business activities, certain fishing and aquaculture activities.'),
(285, 1, 5, 'Fishing_reserve', 'Fishing reserve', 'The instances of this class represent, among all service locations, some fishing reserves.'),
(286, 1, 5, 'Flight_companies', 'Flight Companies', 'The instances of this class represent, among all business activities, certain passenger liner air transport activities.'),
(287, 1, 5, 'Flower_shop', 'Flower shop', 'The instances of this class represent, among all the business activities, certain flower retail activities.'),
(288, 1, 5, 'Food_and_ice_cream_truck', 'Food and Ice Cream Truck', 'The instances of this class represent, among all the business activities, certain icecream, pastry and catering activities.'),
(289, 1, 5, 'Food_and_tobacconist', 'Food and Tobacconist', 'The instances of this class represent, among all business activities, certain retail activities of certain foodstuffs, beverages and tobacco.'),
(290, 1, 5, 'Food_manufacture', 'Food Manufacture', 'The instances of this class represent, among all business activities, certain industrial food production activities.'),
(291, 1, 5, 'Food_trade', 'Food trade', 'Each instance of this class represents a food resale activity.'),
(292, 1, 5, 'Footwear_and_accessories', 'Footwear and Accessories', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune attività di commercio al dettaglio di calzature e accessori.'),
(293, 1, 5, 'Footwear_and_leather_goods', 'Footwear and Leather Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and leather goods.'),
(294, 1, 5, 'Footwear_factory_outlet', 'Footwear factory outlet', 'The instances of this class represent, among all the business activities, certain activities of selling footwear in shops and outlets.'),
(295, 1, 5, 'Footwear_manufacture', 'Footwear Manufacture', 'The instances of this class represent, among all the business activities, certain footwear manufacturing and leather footwear manufacturing activities.'),
(296, 1, 5, 'Forest', 'Forest', 'Each instance of this class represents a forest.'),
(297, 1, 5, 'Forestry', 'Forestry', 'The instances of this class represent, among all the business activities, certain forestry activities and use of forest areas.'),
(298, 1, 5, 'Freight_transport_and_furniture_removal', 'Freight Transport and Furniture Removal', 'The instances of this class represent, among all business activities, certain removal and cargo transport services on the road.'),
(299, 1, 5, 'Fresh_place', 'Fresh place', 'Luoghi in cui e\' possibile sedere all\'aria condizionata durante l\'estate'),
(300, 1, 5, 'Frozen_food', 'Frozen Food', 'The instances of this class represent, among all business activities, certain retail trade activities of frozen products.'),
(301, 1, 5, 'Fruit_and_vegetables', 'Fruit and Vegetables', 'The instances of this class represent, among all business activities, certain fruit and vegetable retail activities.'),
(302, 1, 5, 'FuelStationObservation', 'Fuel station observation', 'Each instance of this class represents a state of a fuel distributor at a given instant.'),
(303, 1, 5, 'Fuel_station', 'Fuel station', 'The instances of this class represent, among all business activities, certain retail trade activities of automotive fuel.'),
(304, 1, 5, 'Funeral', 'Funeral', 'The instances of this class represent, among all the business activities, some funeral activities and related services.'),
(305, 1, 5, 'Funeral_and_cemetery_articles', 'Funeral and Cemetery Articles', 'The instances of this class represent, among all business activities, certain retail trade activities of funerary and cemeteries.'),
(306, 1, 5, 'Fur_and_leather_clothing', 'Fur and Leather Clothing', 'The instances of this class represent, among all the business activities, certain activities of retail trade of fur and leather clothing.'),
(307, 1, 5, 'Gambling_and_betting', 'Gambling and betting', 'The instances of this class represent, among all business activities, certain activities related to lotteries, betting, and gambling halls.'),
(308, 1, 5, 'Game_reserve', 'Game reserve', 'The instances of this class represent, amongst all service locations, some natural parks.'),
(309, 1, 5, 'Game_room', 'Game room', 'The instances of this class represent, among all the business activities, certain activities of playing rooms and billiards.'),
(310, 1, 5, 'Games_and_toys', 'Games and toys', 'The instances of this class represent, among all business activities, certain retail activities of games and toys (including electronic ones).'),
(311, 1, 5, 'Garden_and_agriculture', 'Garden and Agriculture', 'The instances of this class represent, among all business activities, certain retail trade activities of machinery, equipment and products for agriculture and gardening.'),
(312, 1, 5, 'Gardens', 'Gardens', 'The instances of this class represent, among all service locations, some parks and gardens.'),
(313, 1, 5, 'Geologists', 'Geologists', 'The instances of this class represent, among all business activities, certain geological and geo-survey and mining research activities.'),
(314, 1, 5, 'Gifts_and_smoking_articles', 'Gifts and Smoking Articles', 'The instances of this class represent, among all the business activities, certain activities of retail trade of gift items and smokers.'),
(315, 1, 5, 'Golf', 'Golf', 'The instances of this class represent, among all service locations, some golf courses.'),
(316, 1, 5, 'GoodsYard', 'Goods Yard', 'Goods Scale, are located at railway junctions with 1:1 ratio.'),
(317, 1, 5, 'GovernmentOffice', 'Government Office', 'Government offices open to the public.'),
(318, 1, 5, 'Green_areas', 'Green areas', 'The instances of this class represent, among all service locations, some green areas.'),
(319, 1, 5, 'Grill', 'Grill', 'Each instance of this class represents a rotisserie.'),
(320, 1, 5, 'Group_practice', 'Group practice', 'Each instance of this class represents an health centre.'),
(321, 1, 5, 'Gym_fitness', 'Gym fitness', 'The instances of this class represent, among all the business activities, some gym management activities.'),
(322, 1, 5, 'Haberdashery', 'Haberdashery', 'The instances of this class represent, among all the business activities, certain retail trade activities of knitting and knitting yarns.'),
(323, 1, 5, 'Haircare_centres', 'Haircare centres', 'The instances of this class represent, among all business activities, certain activities of trichological surgeries.'),
(324, 1, 5, 'Hairdressing', 'Hairdressing', 'The demands of this class represent, among all the business activities, certain services of barber and hairdresser salons.'),
(325, 1, 5, 'Hairdressing_and_beauty_treatment', 'Hairdressing and beauty treatment', 'The instances of this class represent, among all the business activities, certain services of hairdressers, manicures, pedicures and aesthetic treatments.'),
(326, 1, 5, 'Hardware_electrical_plumbing_and_heating', 'Hardware Electrical Plumbing and Heating', 'The instances of this class represent, among all business activities, certain retail trade of hardware, paints, flat glass and electrical and plumbing plumbing.'),
(327, 1, 5, 'Hardware_paints_and_glass', 'Hardware Paints and Glass', 'The instances of this class represent, among all the business activities, certain retail trade of hardware, paints, flat glass and building materials.'),
(328, 1, 5, 'HealthCare', 'Health Care', 'Hospitals, medical studios, analysis laboratories and other facilities providing health services.'),
(329, 1, 5, 'Health_district', 'Health district', 'The instances of this class represent, among all service locations, certain health districts.'),
(330, 1, 5, 'Health_reservations_centre', 'Health reservations centre', 'The instances of this class represent, among all service locations, certain single reservation centers established at health districts.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(331, 1, 5, 'Healthcare_centre', 'Healthcare centre', 'The instances of this class represent, among all service locations, certain health care centers established at health districts.'),
(332, 1, 5, 'Helipads', 'Helipads', 'The instances of this class represent, among all service locations, some hills.'),
(333, 1, 5, 'Herbalists_shop', 'Herbalist\'s Shop', 'The instances of this class represent, among all the business activities, some herbalists.'),
(334, 1, 5, 'Higher_education', 'Higher education', 'The instances of this class represent, among all business activities, some university and non-university post-secondary training centers.'),
(335, 1, 5, 'Highway_stop', 'Highway stop', 'The instances of this class represent, among all business activities, certain service areas along the main road arteries.'),
(336, 1, 5, 'Hippodrome', 'Hippodrome', 'The instances of this class represent, among all service locations, some racecourses.'),
(337, 1, 5, 'Historic_residence', 'Historic residence', 'The instances of this class represent, among all service locations, some historic residences that offer accommodation services.'),
(338, 1, 5, 'Historical_buildings', 'Historical buildings', 'The instances of this class represent, among all the service venues, some historic buildings.'),
(339, 1, 5, 'Holiday_village', 'Holiday village', 'The instances of this class represent, among all business activities, some holiday accommodation and other short-term accommodation, including resorts.'),
(340, 1, 5, 'Hostel', 'Hostel', 'The instances of this class represent, among all business activities, some youth hostels.'),
(341, 1, 5, 'Hotel', 'Hotel', 'The instances of this class represent, among all business activities, certain hotels and similar structures.'),
(342, 1, 5, 'Household_appliances_shop', 'Household appliances shop', 'The instances of this class represent, among all business activities, some retail trade of household appliances in specialized stores.'),
(343, 1, 5, 'Household_articles', 'Household Articles', 'The instances of this class represent, among all business activities, certain retail activities of certain household items.'),
(344, 1, 5, 'Household_fuel', 'Household Fuel', 'The instances of this class represent, among all business activities, certain retail trade activities of domestic and heating fuel.'),
(345, 1, 5, 'Household_furniture', 'Household Furniture', 'The instances of this class represent, among all the business activities, some retail business of home furniture.'),
(346, 1, 5, 'Household_products', 'Household Products', 'The instances of this class represent, among all business activities, certain retail activities of certain domestic products in specialized stores.'),
(347, 1, 5, 'Household_utensils', 'Household Utensils', 'The instances of this class represent, among all business activities, certain retail trade activities of household utensils, glassware and pottery.'),
(348, 1, 5, 'Human_health_activities', 'Human health activities', 'The instances of this class represent, among all business activities, certain health care activities.'),
(349, 1, 5, 'Hunting_trapping_and_services', 'Hunting Trapping and Services', 'The instances of this class represent, among all business activities, some hunting, animal trapping and related services.'),
(350, 1, 5, 'HydrometryObservation', 'Hydrometry observation', 'Each instance of this class represents a hydrometric detection.'),
(351, 1, 5, 'HygrometryObservation', 'Hygrometry observation', 'Each instance of this class represents a hygrometric detection.'),
(352, 1, 5, 'Hypermarket', 'Hypermarket', 'The instances of this class represent, among all business activities, some hypermarkets.'),
(353, 1, 5, 'ICQAAgglomeration', 'Air Quality Criticality Index agglomeration', 'Each instance of this class represents an agglomeration (suitably delimited geographical area) defined for air quality monitoring through the ICQA index, introduced by the Tuscany Region, Italy, in August 2016.'),
(354, 1, 5, 'ICQAObservation', 'ICQA Observation', 'Each instance of this class represents an air quality detection on an agglomeration.'),
(355, 1, 5, 'Ice_cream_parlour', 'Ice cream parlour', 'The instances of this class represent, among all business activities, some ice cream parlors and pastry shops.'),
(356, 1, 5, 'Ict_service', 'ICT service', 'The instances of this class represent, among all business activities, certain data processing, hosting and related activities, web portals, and other information service activities.'),
(357, 1, 5, 'Income_revenue_authority', 'Income revenue authority', 'The instances of this class represent, among all service locations, certain offices of the Revenue Agency.'),
(358, 1, 5, 'Industrial_laundries', 'industrial laundries', 'The instances of this class represent, among all the business activities, certain activities of industrial laundries.'),
(359, 1, 5, 'IndustryAndManufacturing', 'Industry and manufacturing', 'Services related to industry and work.'),
(360, 1, 5, 'Installation_of_industrial_machinery', 'Installation of Industrial Machinery', 'The instances of this class represent, among all the business activities, certain activities for the installation of industrial and medical equipment, such as: installation of electrical and electronic equipment for telecommunications and radio transmitting equipment; installation of instruments, apparatus for measuring, checking, testing, navigation and the like; installation of office machines, mainframes and similar computers; installation of other machines and industrial equipments; installation of motors, generators and transformers, electricity distribution and control equipment; installation of medical devices; installation of appliances and instruments for odontology; installation of motors, generators and transformers, electrical distribution and control equipment.'),
(361, 1, 5, 'Insurance', 'Insurance', 'The instances of this class include, among all business activities, certain insurance, agents, sub agents, brokers and other intermediaries, including for the purpose of opening pension funds and life insurance.'),
(362, 1, 5, 'Insurance_and_financial', 'Insurance and financial', 'The instances of this class represent, among all business activities, some auxiliary activities in financial services and insurance activities.'),
(363, 1, 5, 'Internet_point_and_public_telephone', 'Internet Point and Public Telephone', 'The instances of this class represent, among all business activities, certain activities of public telephone and Internet Point.'),
(364, 1, 5, 'Internet_service_provider', 'Internet Service Provider', 'The instances of this class represent, among all business activities, certain Internet access services.'),
(365, 1, 5, 'Investigation_activities', 'Investigation activities', 'The instances of this class represent, among all business activities, certain private investigation services.'),
(366, 1, 5, 'Irrigator', 'Irrigator', 'Each instance of this class represents an irrigator.'),
(367, 1, 5, 'Italian_finance_police', 'Italian finance police', 'The instances of this class represent, among all service locations, certain offices of the Italian financial police.'),
(368, 1, 5, 'Jeweller', 'Jeweller', 'The instances of this class represent, among all the business activities, certain remaking of watches and jewelery.'),
(369, 1, 5, 'Jewellery', 'Jewellery', 'The instances of this class represent, among all business activities, certain retail activities of watches, jewelery and silverware.'),
(370, 1, 5, 'Journalist', 'Journalist', 'The instances of this class represent, among all the business activities, certain activities of independent journalists.'),
(371, 1, 5, 'Junction', 'Junction', 'An interconnection point between road segments to draw a RoadElement.'),
(372, 1, 5, 'Knitted_manufacture', 'Knitted Manufacture', 'The instances of this class represent, among all the business activities, certain knitting, knitwear, jerseys, cardigans and other knitwear items.'),
(373, 1, 5, 'Labour_consultant', 'Labour consultant', 'The instances of this class represent, among all the business activities, certain activities of job counselors.'),
(374, 1, 5, 'Land_transport', 'Land Transport', 'The instances of this class represent, among all business activities, certain terrestrial passenger transport activities, and in particular: taxi transport, car hire with driver; terrestrial passenger transport in urban and suburban areas; terrestrial transport and transport by means of pipelines; other terrestrial passenger transport activities.'),
(375, 1, 5, 'Land_transport_rental', 'Land-transport rental', 'The instances of this class represent, among all business activities, certain rental activities of certain land transport vehicles.'),
(376, 1, 5, 'Landscape_care', 'Landscape care', 'The instances of this class represent, among all business activities, some landscape care and maintenance activities (including parks, gardens and flowerbeds).'),
(377, 1, 5, 'Language_courses', 'Language courses', 'The instances of this class represent, among all business activities, some activities of language courses by anyone organized, and language schools.'),
(378, 1, 5, 'Laundries_and_dry_cleaners', 'laundries and dry cleaners', 'The instances of this class represent, among all the business activities, some laundry and cleaning of textile and fur items.'),
(379, 1, 5, 'Leasing_of_intellectual_property', 'Leasing of intellectual property', 'The instances of this class represent, among all business activities, certain activities of granting intellectual property rights and similar products (excluding works protected by copyright).'),
(380, 1, 5, 'Leather_manufacture', 'Leather Manufacture', 'The instances of this class represent, among all the business activities, certain activities of making leather goods and the like.'),
(381, 1, 5, 'Legal_office', 'Legal office', 'The instances of this class represent, among all the business activities, certain activities of law firms and accounting.'),
(382, 1, 5, 'Library', 'Library', 'The instances of this class represent, among all the business activities, some library and archive activities.'),
(383, 1, 5, 'Lifting_and_handling_equipment_rental', 'Lifting and handling equipment rental', 'The instances of this class represent, among all business activities, certain rental activities without a lifting and handling equipment operator.'),
(384, 1, 5, 'Lighting', 'Lighting', 'The instances of this class represent, among all the business activities, certain retail activities of lighting articles.'),
(385, 1, 5, 'Literary_cafe', 'literary cafe', 'Each instance of this class represents a literary café.'),
(386, 1, 5, 'Local_health_authority', 'Local health authority', 'The instances of this class represent, among all service locations, some local health companies.'),
(387, 1, 5, 'Local_police', 'Local police', 'The instances of this class represent, among all service locations, some Local Police Offices.'),
(388, 1, 5, 'Logistics_activities', 'Logistics Activities', 'The instances of this class represent, among all business activities, certain activities related to handling and storage of goods, and in particular: logistical services relating to the distribution of goods; freight forwarders and customs agency agencies; transport intermediaries.'),
(389, 1, 5, 'Lot', 'TPL Lot', 'TPL line set, locally identifiable as a lot.'),
(390, 1, 5, 'Machinery_and_equipment_rental', 'Machinery and Eequipment Rental', 'The instances of this class represent, among all the business activities, certain rental activities of certain machines and equipment for professional use, and in particular: rental of machines and equipment for construction work and civil engineering; hire of office machinery and equipment (including computers); rental of agricultural machinery and equipment; hire of other machines, equipment and material assets, without operator.'),
(391, 1, 5, 'Machinery_repair_and_installation', 'Machinery Repair and Installation', 'The instances of this class represent, among all business activities, some repair and maintenance activities for both professional and domestic equipment.'),
(392, 1, 5, 'Maintenance_repair_of_motor_vehicles', 'Maintenance Repair of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain repair and maintenance activities for motor vehicles, in particular: mechanical repairs of motor vehicles; repair of carrozzerie of cars; repair of electrical installations and of alimentacion for cars; repair and replacement of tires for cars; maintenance and repair of cars; other attivita \'of maintenance and of repair of cars.'),
(393, 1, 5, 'Maintenance_repair_of_motorcycles', 'Maintenance Repair of Motorcycles', 'The instances of this class represent, among all business activities, some maintenance and repair activities on motorcycles and mopeds (including tires).'),
(394, 1, 5, 'Management_consultancy', 'Management consultancy', 'The instances of this class represent, among all the business activities, certain entrepreneurial consultancy activities, and in particular: public relations and communication; certain entrepreneurial and administrative-management consultancy activities; certain business planning activities; holdings of the holdings engaged in operating activities (holding companies); management consultancy activities; consultancy services for the management of company logistics; business management and management consulting.'),
(395, 1, 5, 'Maneuver', 'Maneuver', 'Class whose instances are the possible maneuvers that can be made on a road element.'),
(396, 1, 5, 'Manicure_and_pedicure', 'Manicure and pedicure', 'The instances of this class represent, among all business activities, certain manicure and pedicure services.'),
(397, 1, 5, 'Manufacture_of_basic_metals', 'Manufacture of Basic Metals', 'The instances of this class represent, among all the business activities, certain metalworking activities, and in particular: manufacture of precious and semi-finished metals; casting of cast iron and production of cast iron pipes and fittings; casting steel; manufacture of iron, steel and ferroleghe; cold ironing of bars; melting of light metals; foundries; manufacture of pipes, ducts, cable profiles and related accessories in steel (excluding those cast-iron); production of lead, zinc and pond and semilavorati; production of other metals non ferrosi and semilavorati; fusion of certain non-ferrous metals; cold rolling of strips; production of precious metal base and other non-ferrous metals; treatment of nuclear fuels; copper and semi-finished products; manufacture of certain products of the first steel processing; cold drawing; production of aluminum and semilavorati; manufacture of iron, steel and ferroleghe; certain other metallurgical activities; certain other steelworks.'),
(398, 1, 5, 'Manufacture_of_chemicals_products', 'Manufacture of Chemicals Products', 'The claims of this class represent, among all the business activities, certain chemical production activities, and in particular by way of example: industrial gases, perfumes, cosmetics, soaps, surfactant organic agents, polishing products, fertilizers, Nitrogen compounds, chemical treatment of fatty acids, plastics, synthetic rubber, glues, paints, varnishes, enamels, printing inks, mastics, fibers, photographic products, essential oils, chemicals for agriculture, fertilizers.'),
(399, 1, 5, 'Manufacture_of_clay_and_ceramic', 'Manufacture of Clay and Ceramic', 'The instances of this class represent, among all the business activities, certain brickwork, tiles, other terracotta materials for building, ceramics, porcelain.'),
(400, 1, 5, 'Manufacture_of_electrical_equipment', 'Manufacture of Electrical Equipment', 'The instances of this class represent, among all the business activities, certain manufacturing of electrical and electronic components and equipment, such as: motors, generators and transformers; equipment for distribution and control of electricity; electrical and lighting equipment; wiring harness; electric capacitors, resistors, capacitors and the like, accelerators; electrical signs and signaling electrical equipment; lighting and signaling equipment for means of transport; home appliances; non-electric household appliances; electrical equipment for welding and brazing; wires and cables, electrical and electronic; battery batteries and electrical accumulators.'),
(401, 1, 5, 'Manufacture_of_electronic_products', 'Manufacture of Electronic Products', 'The instances of this class represent, among all the business activities, certain manufacturing of electronic equipment and components, such as: irradiation equipment, electromedical and electrotherapeutic equipment; apparatus for the reproduction and recording of sound and images; computers and peripheral units; electronic components and electronic boards; magnetic and optical supports; radio and television transmitting equipment (including cameras); watches; certain measuring and regulating apparatus for meters of electricity, gas, water and other liquids, precision analytical scales (including stapled parts and accessories); electrical and electronic equipment for telecommunications; assembled electronic boards; optical elements and optical precision instruments; electrical and electronic equipment for telecommunications; manufacture of instruments and apparatus for measuring, testing and navigation (other than optical); optical instruments and photographic and cinematographic equipment; anti-theft and fire-fighting systems; tools for hydrology, geophysics and meteorology.'),
(402, 1, 5, 'Manufacture_of_furniture', 'Manufacture of Furniture', 'The instances of this class represent, among all the business activities, certain furniture manufacturing and furnishing, such as: office furniture and shops; armchairs and sofas; furniture finishing; furniture for domestic furniture; parts and accessories of furniture; kitchen furniture; mattresses; some chairs and seats.'),
(403, 1, 5, 'Manufacture_of_glass', 'Manufacture of Glass', 'The instances of this class represent, among all the business activities, certain manufacturing, processing and processing of flat, cable and artistic glass products.'),
(404, 1, 5, 'Manufacture_of_jewellery_bijouterie', 'Manufacture of Jewellery Bijouterie', 'The instances of this class represent, among all the business activities, certain jewelry manufacturing, jewelery, precious stones and coins.'),
(405, 1, 5, 'Manufacture_of_machinery_and_equipment', 'Manufacture of Machinery and Equipment', 'The instances of this class represent, among all business activities, certain machine manufacturing activities, including, for example: household appliances; conditioners; purifiers; industrial machinery for the food industry; machinery for laundries; machinery for the plastics and rubber industry; machinery for printing and binding; machinery for lifting and handling of goods; pumps; machinery for mines, quarries, construction sites; machinery for the textile industry; machinery for the paper industry; furnaces, furnaces, burners; leather processing machines; heating systems; machines for the agriculture, the silvicoltura and the zootecnia; office machinery and equipment; cartridges and toners; elevators, hoists, escalators; turbines; equipment for beauty salons.'),
(406, 1, 5, 'Manufacture_of_motor_vehicles', 'Manufacture of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain manufacturing of motor vehicles and trailers, bodywork and components, including electrical and electronic components.'),
(407, 1, 5, 'Manufacture_of_musical_instruments', 'Manufacture of Musical Instruments', 'The instances of this class represent, among all business activities, certain activities of making musical instruments (including parts and accessories).'),
(408, 1, 5, 'Manufacture_of_non_metallic_mineral_products', 'Manufacture of Non-Metallic Mineral Products', 'The instances of this class represent, among all business activities, certain manufacturing activities of non-metallic mineral products including abrasive products.'),
(409, 1, 5, 'Manufacture_of_paper', 'Manufacture of Paper', 'The instances of this class represent, among all the business activities, certain paper and paper making activities.'),
(410, 1, 5, 'Manufacture_of_paper_products', 'Manufacture of Paper Products', 'The instances of this class represent, among all the business activities, certain activities of making paper products, and in particular: corrugated paper and paperboard and paper and board packaging (other than paperboard); Articles of paper and cartone; Paper products; Sanitary and household products in paper and cellulose wadding.'),
(411, 1, 5, 'Manufacture_of_pharmaceutical_products', 'Manufacture of Pharmaceutical Products', 'The instances of this class represent, among all the business activities, certain pharmaceutical manufacturing and pharmaceutical preparations.'),
(412, 1, 5, 'Manufacture_of_plastics_products', 'Manufacture of Plastics Products', 'The instances of this class represent, among all the business activities, certain plastic products manufacturing activities, such as: plastic articles for the building; plastic parts for footwear; sheets, sheets, tubes and profilati in plastic materials; doors, windows, plastic frames; office items and plastic school.'),
(413, 1, 5, 'Manufacture_of_refined_petroleum_products', 'Manufacture of Refined Petroleum Products', 'The instances of this class represent, among all business activities, certain petroleum refining activities, and in particular: preparation or mixing of petroleum derivatives (excluding petrochemicals), manufacture of bitumen, tar and binder emulsions for use road mixing of liquefied petroleum gas (GPL) and bottling them.'),
(414, 1, 5, 'Manufacture_of_refractory_products', 'Manufacture of Refractory Products', 'The instances of this class represent, among all business activities, certain refractory products manufacturing.'),
(415, 1, 5, 'Manufacture_of_rubber_and_plastics_products', 'Manufacture of Rubber and Plastics Products', 'The instances of this class represent, among all the business activities, certain manufacturing of rubber articles and plastics.'),
(416, 1, 5, 'Manufacture_of_rubber_products', 'Manufacture of Rubber Products', 'The instances of this class represent, among all the business activities, certain manufacturing activities of rubber products, including in particular: rubber soles and other rubber parts for footwear; manufacture of tires and air chambers; regeneration and reconstruction of tires.'),
(417, 1, 5, 'Manufacture_of_sports_goods', 'Manufacture of Sports Goods', 'The instances of this class represent, among all the business activities, certain activities in the manufacture of sports goods.'),
(418, 1, 5, 'Manufacture_of_structural_metal_products', 'Manufacture of Structural Metal Products', 'The instances of this class represent, among all the business activities, some metal products manufacturing activities, such as: door frames and windows; gates; hinges; frames and other building elements; pots and crockery; radiators; springs; weapons and ammunition; bins and containers in general.'),
(419, 1, 5, 'Manufacture_of_textiles', 'Manufacture of textiles', 'The instances of this class represent, among all business activities, certain textile industries.'),
(420, 1, 5, 'Manufacture_of_toys_and_game', 'Manufacture of Toys and Game', 'The instances of this class represent, among all the business activities, some toys and toys manufacturing activities.'),
(421, 1, 5, 'Manufacture_of_transport_equipment', 'Manufacture of Transport Equipment', 'The instances of this class represent, among all the business activities, certain vehicle manufacturing and accessories activities, such as: accessories and parts detached for motorcycles and mopeds; ships and boats; motorcycles and motor vehicles (including engines); parts and accessories for bicycles; locomotives and other railway rolling stock, tranviario, filoviario, for metropolitane and for mines; bicycles; buildings metalliche and no metalliche in cantieri naval; aircraft, spacecraft and related devices; invalid vehicles (including parts and accessories).'),
(422, 1, 5, 'Manufacture_of_travel_articles', 'Manufacture of Travel Articles', 'The instances of this class represent, among all the business activities, certain activities of making travel articles, handbags and the like, leather goods and saddlery, whips and shawls for riding.'),
(423, 1, 5, 'Manufacture_of_wearing_apparel', 'Manufacture of Wearing Apparel', 'The instances of this class represent, among all the business activities, certain fabrication of garments, such as: leather clothing; fur coats; uniforms and work clothes; custom-made suits; shirts, shirts, underwear; sports clothing and technical clothing in general.'),
(424, 1, 5, 'Manufacture_of_wood', 'Manufacture of Wood', 'The instances of this class represent, among all the business activities, certain activities of the wood and wood and cork products industry, and are involved in the manufacture of straw articles and other plaiting products.'),
(425, 1, 5, 'Manufacture_of_wood_products', 'Manufacture of Wood Products', 'The instances of this class represent, among all the business activities, certain wood products production activities, such as: building materials; picture frames; packaging; fixtures; cork products, straw, and other weaving materials; wood panels; parquet.'),
(426, 1, 5, 'Marina', 'Marina', 'Each instance of this class represents a marina.'),
(427, 1, 5, 'Market_polling', 'Market polling', 'The instances of this class represent, among all the business activities, certain activities specializing in market research and opinion polls.'),
(428, 1, 5, 'Materials_recovery', 'Materials Recovery', 'The instances of this class represent, among all business activities, certain recycling and waste disposal activities, such as: recovery and preparation for recycling waste and scrap metal; recovery and preparation for the recycling of solid urban waste, industrial and biomass; recovery and preparation for the recycling of plastic material for the production of plastic raw materials, synthetic resins; demolition of carcasses.'),
(429, 1, 5, 'Meat_and_poultry', 'Meat and Poultry', 'The instances of this class represent, among all business activities, certain retail trade activities of meat and meat products.'),
(430, 1, 5, 'Mechanic_workshop', 'Mechanic Workshop', 'The instances of this class represent, among all the business activities, some workshop activities.'),
(431, 1, 5, 'Medical_analysis_laboratories', 'Medical analysis laboratories', 'The instances of this class represent, among all business activities, some clinical analysis laboratories, radiographic laboratories and other image diagnostic centers.'),
(432, 1, 5, 'Medical_and_orthopaedic_goods', 'Medical and Orthopaedic Goods', 'The instances of this class represent, among all the business activities, certain retail activities of medical and orthopedic articles.'),
(433, 1, 5, 'Mental_health_centre', 'Mental health centre', 'The instances of this class represent, among all service locations, certain centers of mental health.'),
(434, 1, 5, 'Milestone', 'milestone mileage', 'Classe le cui istanze sono i cippi chilometrici che si trovano lungo le principali strade'),
(435, 1, 5, 'Minimarket', 'Minimarket', 'The instances of this class represent, among all business activities, certain activities of minimarkets and other non-specialized foodstuffs.'),
(436, 1, 5, 'MiningAndQuarrying', 'Mining and quarrying', 'Services related to mining and quarrying.'),
(437, 1, 5, 'Mining_of_metal_ores', 'Mining of metal ores', 'The instances of this class represent, among all the business activities, certain activities of extraction of metallic minerals.'),
(438, 1, 5, 'Mining_support_services', 'Mining Support Services', ''),
(439, 1, 5, 'MobilityEvent', 'Mobility event', 'Each instance of this class represents an event that has had repercussions on the viability of the territory covered by the Km4City project, such as a road accident, a loss of cargo, a roadway restriction, a flood, a work deviation.'),
(440, 1, 5, 'Monument_location', 'Monument location', 'The instances of this class represent, among all business activities, some management of historical sites and monuments and similar attractions.'),
(441, 1, 5, 'Motion_picture_and_television_programme_activities', 'Motion picture and television programme activities', 'The instances of this class represent, among all the business activities, certain activities of production, post-production and film distribution, video and television programs.'),
(442, 1, 5, 'Motor_vehicles_wholesale_and_retail', 'Motor Vehicles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motor vehicles and brokerage in the sale of motor vehicles.'),
(443, 1, 5, 'Motorcycles_parts_wholesale_and_retail', 'Motorcycles Parts Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycle and moped parts and accessories, and brokering in the sale of parts and accessories for motorcycles and mopeds.'),
(444, 1, 5, 'Motorcycles_wholesale_and_retail', 'Motorcycles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycles, mopeds and their parts and accessories, and certain brokering activities in the sale of motorcycles, mopeds and parts thereof and accessories.'),
(445, 1, 5, 'Mountain_shelter', 'Mountain shelter', 'The instances of this class represent, among all business activities, some mountain shelters.'),
(446, 1, 5, 'Municipality', 'Municipality Administration', 'Class whose instances are the various municipalities.'),
(447, 1, 5, 'Museum', 'Museum', 'The instances of this class represent, among all the business activities, certain activities of the museums.'),
(448, 1, 5, 'Music_and_video_recordings', 'Music and Video Recordings', 'The instances of this class represent, among all business activities, certain retail trade activities of music and video recordings.'),
(449, 1, 5, 'Musical_instruments_and_scores', 'Musical Instruments and Scores', 'The instances of this class represent, among all the business activities, certain retail activities of musical instruments and scores.'),
(450, 1, 5, 'National_park', 'National park', 'Each instance of this class represents a national park.'),
(451, 1, 5, 'Natural_reserve', 'Natural reserve', 'Each instance of this class represents a natural reserve.'),
(452, 1, 5, 'News_agency', 'News agency', 'The instances of this class represent, among all the business activities, certain activities of the press agencies.'),
(453, 1, 5, 'Newspapers_and_stationery', 'Newspapers and Stationery', 'The instances of this class represent, among all the business activities, some retail activities of newspapers, magazines, periodicals, stationery and office supplies.'),
(454, 1, 5, 'Node', 'Node', 'Class whose instances are the nodes that connect the road elements.'),
(455, 1, 5, 'Non_food_large_retailers', 'non food large retailers', 'The instances of this class represent, among all service locations, certain non-food distribution facilities.'),
(456, 1, 5, 'Non_food_products', 'Non-Food Products', 'The instances of this class represent, among all business activities, certain retail activities of certain non-food products.'),
(457, 1, 5, 'Non_specialized_wholesale_trade', 'Non-specialized Wholesale Trade', 'The instances of this class represent, among all business activities, certain non-specialized wholesale activities.'),
(458, 1, 5, 'Observation', 'Observation', 'Single sensor for observing speed, traffic, concentration, or density.'),
(459, 1, 5, 'Office_administrative_and_support_activities', 'Office administrative and support activities', 'The instances of this class represent, among all business activities, certain temporary office management and support activities that are also integrated with the work of the office.'),
(460, 1, 5, 'Office_furniture', 'Office Furniture', 'The instances of this class represent, among all the business activities, some retail activities of office furniture.'),
(461, 1, 5, 'Operation_of_casinos', 'Operation of casinos', 'The instances of this class represent, among all business activities, certain asset management activities on devices that allow coin or coin-operated cash prizes.'),
(462, 1, 5, 'Optics_and_photography', 'Optics and Photography', 'The instances of this class represent, among all business activities, certain retail trade of optical and photographic material.'),
(463, 1, 5, 'Organization_of_conventions_and_trade_shows', 'Organization of conventions and trade shows', 'The instances of this class represent, among all the business activities, certain activities of organizing conferences and fairs.'),
(464, 1, 5, 'Other_accommodation', 'Other Accommodation', 'The instances of this class represent, among all the business activities, certain activities of short-term renters, holiday houses and apartments, bed and breakfasts, residences, farm-related accommodation, student and workers accommodation with some hotel services.'),
(465, 1, 5, 'Other_broadcasting', 'Other broadcasting', 'The instances of this class represent, among all business activities, certain activities of audio-visual programming and broadcasting.'),
(466, 1, 5, 'Other_goods', 'Other Goods', 'The instances of this class represent, among all business activities, certain retail activities of certain products in specialized stores.'),
(467, 1, 5, 'Other_manufacturing', 'Other Manufacturing', ''),
(468, 1, 5, 'Other_mining_and_quarrying', 'Other mining and quarrying', 'The instances of this class represent, among all the business activities, certain mining and quarry mining activities.'),
(469, 1, 5, 'Other_office', 'Other Office', 'The instances of this class represent, among all service locations, certain public and defense administration activities and compulsory social insurance.'),
(470, 1, 5, 'Other_retail_sale', 'Other Retail Sale', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses with a prevalence of non-food products.'),
(471, 1, 5, 'Other_specialized_construction', 'Other Specialized Construction', 'The instances of this class represent, among all the business activities, certain construction activities, including, for example: steam cleaning, sandblasting and similar activities for exterior walls of buildings; building of swimming pools and other skilled works of building; non-specialized works of construction work (masons); works of completamento and of finitura of the buildings; realization of coverings; hire of cranes and other equipment with operator for construction or demolition.'),
(472, 1, 5, 'Other_specialized_wholesale', 'Other Specialized Wholesale', 'The instances of this class represent, among all business activities, certain wholesale trade activities, such as: raw textile fibers and semi-finished textiles; hardware, appliances and accessories for plumbing and heating systems; fertilizers and other chemical products for agriculture; carpet and linoleum; raw rubber, plastics in primary and semi-finished forms; chemical products; fixtures; building materials; petroleum products and lubricants for haulage, of fuels for heating; chemical products for the industry; wallpaper, colors and paints; timber, semi-finished wood and artificial wood; building materials (including sanitary fixtures); coating materials (including sanitary fixtures); metallic minerals, of ferrous metals and semi-finished products; non-ferrous metals and semi-finished products; articles of iron and of other metals; packaging; timber and construction materials, sanitary fixtures, flat glass, paints and colors; scrap and metal by-products of industrial processing; appliances and accesorios for installations of fontaneras, heating and air conditioning; non-metallic recovery materials (glass, paper, cardboard, etc.); non-metallic by-products of industrial processing (waste).'),
(473, 1, 5, 'Other_telecommunications_activities', 'Other Telecommunications Activities', 'The instances of this class represent, among all business activities, certain telecommunications and brokering activities in telecommunication and data transmission services.'),
(474, 1, 5, 'Pa', 'Public Administration', 'Municipalities, regions and provinces.'),
(475, 1, 5, 'Packaging_activities', 'Packaging activities', 'The instances of this class represent, among all the business activities, some packaging and packaging activities also on behalf of third parties.'),
(476, 1, 5, 'Paramedical_activities', 'Paramedical activities', 'The instances of this class represent, among all business activities, certain independent paramedical activities.'),
(477, 1, 5, 'Parties_and_ceremonies', 'Parties and ceremonies', 'The instances of this class represent, among all the business activities, certain activities of organizing parties and ceremonies.'),
(478, 1, 5, 'Passenger_air_transport', 'Passenger Air Transport', 'The instances of this class represent, among all business activities, certain aviation activities.'),
(479, 1, 5, 'Pastry_shop', 'Pastry shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of cakes, sweets, confectionery.'),
(480, 1, 5, 'Path', 'String Service', 'Servizi rappresentati da una spezzata'),
(481, 1, 5, 'Pedestrian_zone', 'pedestrian zone', 'Each instance of this class represents an area reserved for pedestrian transit.'),
(482, 1, 5, 'Performing_arts_schools', 'Performing arts schools', 'The instances of this class represent, among all business activities, certain university and post-university, academy and conservation activities.'),
(483, 1, 5, 'Perfumery_and_cosmetic_articles', 'Perfumery and Cosmetic Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of cosmetics, perfumery, herbal medicine and personal hygiene.'),
(484, 1, 5, 'Personal_and_household_goods_rental', 'Personal and household goods rental', 'The instances of this class represent, among all business activities, certain rental activities of table linen, bed linen, bath linen and household linen, in addition to other personal and household goods.'),
(485, 1, 5, 'Personal_service_activities', 'Personal service activities', 'The instances of this class represent, among all business activities, certain services for the person.'),
(486, 1, 5, 'Pet_care_services', 'Pet care services', 'The instances of this class represent, among all business activities, certain pet care services (excluding veterinary services).'),
(487, 1, 5, 'Pet_shop', 'Pet Shop', 'The instances of this class represent, among all business activities, certain pet retail activities (including articles and food).'),
(488, 1, 5, 'Petroleum_and_natural_gas_extraction', 'Petroleum and natural gas extraction', 'The instances of this class represent, among all business activities, some activities supporting the extraction of oil and natural gas.'),
(489, 1, 5, 'Pharmaceuticals', 'Pharmaceuticals', 'The instances of this class represent, among all business activities, certain retail activities of medicinal products not subject to medical prescription.'),
(490, 1, 5, 'Pharmacy', 'Pharmacy', 'The demands of this class include, among all business activities, certain pharmacy and retail trade of medicines.'),
(491, 1, 5, 'Photographic_activities', 'Photographic activities', 'The instances of this class include, among all business activities, certain photographic activities, including photographic and aerial photography activities, and development and printing activities in photographic laboratories.'),
(492, 1, 5, 'Photovoltaic_system', 'Photovoltaic system', 'Geolocation of working photovoltaic plants.'),
(493, 1, 5, 'Physical_therapy_centre', 'Physical therapy centre', 'The instances of this class represent, among all business activities, some physiotherapy activities.'),
(494, 1, 5, 'Pizzeria', 'Pizzeria', 'The instances of this class represent, among all the business activities, some pizzerias.'),
(495, 1, 5, 'Poison_control_centre', 'Poison control centre', 'The instances of this class represent, among all service locations, some anti-theft centers.'),
(496, 1, 5, 'Police_headquarters', 'Police headquarters', 'The instances of this class represent, among all service locations, certain police headquarters.'),
(497, 1, 5, 'PollenObservation', 'Pollen observation', 'Each instance of this class represents a pollutant detection at a given time and place.'),
(498, 1, 5, 'PollenTrendObservation', 'Pollen trend observation', 'Each instance of this class represents a trend of pollutants with reference to a certain place and time interval.'),
(499, 1, 5, 'Pollen_monitoring_station', 'Pollen monitoring station', 'The instances of this class each represent an allergen level detector in the air.'),
(500, 1, 5, 'Pool', 'Pool', 'The instances of this class represent, among all business activities, some pools management activities.'),
(501, 1, 5, 'Port', 'Port', 'The instances of this class represent, among all service locations, certain ports.'),
(502, 1, 5, 'Post_secondary_education', 'Post-secondary education', 'The instances of this class represent, among all business activities, certain technical higher education and training (IFTS) activities.'),
(503, 1, 5, 'Postal_and_courier_activities', 'Postal and Courier Activities', 'The instances of this class represent, among all business activities, certain postal services and courier activities.'),
(504, 1, 5, 'Postal_office', 'Postal office', 'The instances of this class represent, among all the business activities, certain postal services with universal service obligation (on which, therefore, are legal obligations to ensure a minimum level of service for all users concerned, being a service of public interest).'),
(505, 1, 5, 'Pre_primary_education', 'Pre-primary education', 'The instances of this class represent, among all business activities, preparatory education activities: children\'s schools, special schools linked to primary schools.'),
(506, 1, 5, 'Prefecture', 'Prefecture', 'The instances of this class represent, among all service locations, certain offices of the Prefecture.'),
(507, 1, 5, 'Primary_education', 'Primary education', 'The instances of this class represent, among all business activities, certain primary education activities: elementary schools.'),
(508, 1, 5, 'Printing_and_recorded_media', 'Printing and Recorded Media', 'The instances of this class represent, among all business activities, some printing and reproduction of recorded media.'),
(509, 1, 5, 'Printing_and_services', 'Printing and Services', 'The instances of this class represent, among all the business activities, certain printing and bookbinding activities with related services, and certain newspaper printing activities.'),
(510, 1, 5, 'Private_clinic', 'Private clinic', 'The instances of this class represent, among all business activities, certain private clinics.'),
(511, 1, 5, 'Private_high_school', 'Private high school', 'The instances of this class represent, among all service locations, some private high schools.'),
(512, 1, 5, 'Private_infant_school', 'Private infant school', 'The instances of this class represent, among all service locations, some private infant schools.'),
(513, 1, 5, 'Private_junior_high_school', 'Private junior high school', 'The instances of this class represent, among all service locations, some private junior high school.'),
(514, 1, 5, 'Private_junior_school', 'Private junior school', 'The instances of this class represent, among all service locations, some private junior schools.'),
(515, 1, 5, 'Private_polytechnic_school', 'Private polytechnic school', 'The instances of this class represent, among all service locations, some private technical institutes.'),
(516, 1, 5, 'Private_preschool', 'Private preschool', 'The instances of this class represent, among all service locations, certain private nurseries.'),
(517, 1, 5, 'Private_professional_institute', 'Private professional institute', 'The instances of this class represent, among all service locations, some private professional institutes.'),
(518, 1, 5, 'Private_security', 'Private security', 'The instances of this class represent, among all business activities, certain private security services.'),
(519, 1, 5, 'Province', 'Provincial Administration', 'Class whose instances are the various provinces.'),
(520, 1, 5, 'Psychologists', 'Psychologists', 'The instances of this class represent, among all the business activities, some activities carried out by psychologists.'),
(521, 1, 5, 'PublicTransportLine', 'Bus Line', 'Line of a TPL company'),
(522, 1, 5, 'Public_high_school', 'Public high school', 'The instances of this class represent, among all service locations, some public high schools.'),
(523, 1, 5, 'Public_hospital', 'Public hospital', 'The instances of this class represent, among all service locations, some public hospitals.'),
(524, 1, 5, 'Public_infant_school', 'Public infant school', 'The instances of this class represent, among all service locations, some public nursery schools.'),
(525, 1, 5, 'Public_junior_high_school', 'Public junior high school', 'The instances of this class represent, among all service locations, some public middle schools.'),
(526, 1, 5, 'Public_junior_school', 'Public junior school', 'The instances of this class represent, among all service locations, some public junior schools.'),
(527, 1, 5, 'Public_polytechnic_school', 'Public polytechnic school', 'The instances of this class represent, among all service locations, some public technical institutes.'),
(528, 1, 5, 'Public_professional_institute', 'Public professional institute', 'The instances of this class represent, among all service locations, certain public professional institutes.'),
(529, 1, 5, 'Public_relations_office', 'Public relations office', 'The instances of this class represent, among all service locations, some Public Relations Offices (URPs).'),
(530, 1, 5, 'Public_university', 'Public university', 'The instances of this class represent, among all service locations, some public universities.'),
(531, 1, 5, 'Publishing_activities', 'Publishing activities', 'The instances of this class represent, among all business activities, certain activities of publishing newspapers, books, magazines, periodicals and other editorial activities.'),
(532, 1, 5, 'Quality_control_and_certification', 'Quality Control and Certification', 'The instances of this class represent, among all business activities, certain quality control activities and product, process and system certification, and certain activities for the protection of controlled production assets.'),
(533, 1, 5, 'Quarrying_of_stone_sand_and_clay', 'Quarrying of stone sand and clay', 'The instances of this class represent, among all the business activities, some extractive activities, and in particular: gravel and sand extraction; Extraction of clay and kaolin; Extraction of ornamental and construction stones, limestone, plaster, clay and slate stone.'),
(534, 1, 5, 'RTZgate', 'RTZ gate', 'Each instance of this class represents a gateway to a restricted traffic zone.'),
(535, 1, 5, 'Radio_broadcasting', 'Radio broadcasting', 'The instances of this class represent, among all business activities, certain radio broadcasting activities.'),
(536, 1, 5, 'Radiotherapy_centre', 'Radiotherapy centre', NULL),
(537, 1, 5, 'Rafting_kayak', 'Rafting kayak', 'The instances of this class represent, among all service locations, some locations where rafting, canoeing and kayaking can be practiced.'),
(538, 1, 5, 'RailwayDirection', 'Railway Direction', 'Class whose instances are the railway directives.'),
(539, 1, 5, 'RailwayElement', 'Railway Element', 'Class whose instances are the elements that make up the sections, sections or rail lines.'),
(540, 1, 5, 'RailwayJunction', 'Railway Junction', 'Two junctions delimit a railway element and represent railway stations or freight terminals.'),
(541, 1, 5, 'RailwayLine', 'Railway Line', 'Class whose instances are the railway lines.'),
(542, 1, 5, 'RailwaySection', 'Railway Section', 'Class whose instances are the railway sections.'),
(543, 1, 5, 'RainfallObservation', 'Rainfall observation', 'Each instance of this class represents a precipitation detection in a certain place and time interval.'),
(544, 1, 5, 'Recreation_room', 'Recreation room', 'The instances of this class represent, among all the service venues, some recreation rooms.'),
(545, 1, 5, 'Recreational_and_sports_goods_rental', 'Recreational and Sports Goods rental', 'The instances of this class represent, among all business activities, some rental activities of sports and recreational equipment, including pleasure boats and in particular pedalos.'),
(546, 1, 5, 'Recruitment', 'Recruitment', 'The instances of this class represent, among all business activities, certain research, selection, placement, management and support services for staff relocation.'),
(547, 1, 5, 'Red_cross', 'Red cross', 'The instances of this class represent, among all service locations, certain Red Cross seats.'),
(548, 1, 5, 'Region', 'Regional Administration', 'Class whose instances are the various regions.'),
(549, 1, 5, 'RegularService', 'Regular Service', 'Services that may have other features, represented as cross services.'),
(550, 1, 5, 'Religiuos_guest_house', 'Religious guest house', 'The instances of this class represent, among all service locations, certain holiday homes operated by monastic orders.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(551, 1, 5, 'Repair', 'Repair', 'The instances of this class represent, among all the business activities, some quick repair services, key duplication, sharpening knives, immediate printing on textile articles, quick metal engraving, non-precious metal repair items, and Repair of other articles of consumption for personal use and for the house.'),
(552, 1, 5, 'Repair_musical_instruments', 'Repair musical instruments', 'The instances of this class represent, among all the business activities, some musical instruments repair services.'),
(553, 1, 5, 'Repair_of_communication_equipment', 'Repair of communication equipment', 'The instances of this class represent, among all business activities, certain repair and maintenance services for fixed, cordless, cellular and other telecommunication equipment.'),
(554, 1, 5, 'Repair_of_consumer_electronics', 'Repair of consumer electronics', 'The instances of this class represent, among all business activities, some repair services for consumer electronics and audio and video products for personal and home use.'),
(555, 1, 5, 'Repair_of_footwear_and_leather_goods', 'Repair of footwear and leather goods', 'The instances of this class represent, among all business activities, certain repair services for footwear and luggage in leather, leather or similar materials.'),
(556, 1, 5, 'Repair_of_garden_equipment', 'Repair of garden equipment', 'The instances of this class represent, among all business activities, certain gardening repair services.'),
(557, 1, 5, 'Repair_of_home_equipment', 'Repair of home equipment', 'The instances of this class represent, among all business activities, certain repair services of other goods for personal and home use.'),
(558, 1, 5, 'Repair_of_household_appliances', 'Repair of household appliances', 'The instances of this class represent, among all the business activities, some repair services of household appliances and household items.'),
(559, 1, 5, 'Repair_of_sporting_goods', 'Repair of sporting goods', 'The instances of this class represent, among all business activities, certain repair services for sporting goods (excluding sportswear) and camping equipment (including bicycles).'),
(560, 1, 5, 'Reporting_agencies', 'Reporting agencies', 'The instances of this class represent, among all business activities, certain commercial information agencies.'),
(561, 1, 5, 'Reproduction_recorded_media', 'Reproduction Recorded Media', 'The instances of this class represent, among all business activities, certain activities of reproduction of recorded media.'),
(562, 1, 5, 'Rescuers', 'Rescuers area', 'Each instance of this class represents a meeting point for rescuers in case of disaster.'),
(563, 1, 5, 'Research_and_development', 'Research and development', 'The instances of this class represent, among all the business activities, certain scientific research and research and experimental development activities in the fields of geology, natural sciences, engineering, biotechnology, social sciences and humanities.'),
(564, 1, 5, 'Reserved_lane', 'Reserved lane', 'Each instance of this class represents a lane reserved for a specific type of user.'),
(565, 1, 5, 'Residential_care_activities', 'Residential care activities', 'The demands of this class include, among all business activities, certain residential care facilities for the elderly, disabled motorists, people with mental retardation, mental disorders, or abusing drugs.'),
(566, 1, 5, 'Resolution', 'Resolution', 'Resolution approved by a Public Administration.'),
(567, 1, 5, 'Rest_home', 'Rest home', 'The instances of this class represent, among all service locations, some rest homes.'),
(568, 1, 5, 'Restaurant', 'Restaurant', 'The instances of this class represent, among all business activities, certain catering services in a fixed location (including farmhouses), and all mobile catering services on trains, ships and others.'),
(569, 1, 5, 'Restorers', 'Restorers', 'The instances of this class represent, among all the business activities, some conservation and restoration works of art.'),
(570, 1, 5, 'Retail_motor_vehicles_parts', 'Retail Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles and brokering in the trade of motorcycle parts and accessories.'),
(571, 1, 5, 'Retail_sale_non_specialized_stores', 'Retail Sale Non-Specialized Stores', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses, including prevalence of food and beverages.'),
(572, 1, 5, 'Retail_trade', 'Retail Trade', 'The instances of this class represent, among all business activities, certain retail activities.'),
(573, 1, 5, 'Ride', 'Ride', 'Run scheduled by a certain TPL company on a certain route of a certain line.'),
(574, 1, 5, 'Riding_stables', 'Riding stables', 'The instances of this class represent, among all service locations, some riding stables activities.'),
(575, 1, 5, 'Road', 'Road', 'Class whose instances are the streets.'),
(576, 1, 5, 'RoadElement', 'Road element', 'Class whose instances are the elements that make up the streets.'),
(577, 1, 5, 'RoadLink', 'RoadLink', 'Linear road section bounded by two junctions that make up the road element.'),
(578, 1, 5, 'Roman_bridge', 'Roman bridge', 'The instances of this class represent the Roman bridges.'),
(579, 1, 5, 'Rope_cord_and_twine', 'Rope cord and twine', 'The instances of this class represent, among all business activities, certain retail activities of spades, ropes, canvases and jute bags and packaging products (excluding paper and board products).'),
(580, 1, 5, 'Route', 'Route', 'A route that is driven by public transport.'),
(581, 1, 5, 'RouteJunction', 'Route Junction', 'Interconnection point between road segments to determine the path of a TPL line.'),
(582, 1, 5, 'RouteLink', 'RouteLink', 'Road section bounded by two TPL junction that determines the path of a TPL line.'),
(583, 1, 5, 'RouteSection', 'Route Section', 'Road section between two successive bus stops in a certain line.'),
(584, 1, 5, 'Rtz_daily', 'Zona a traffico limitato diurno', 'Each instance of this class represents a limited active zone in the only daylight hours.'),
(585, 1, 5, 'Rtz_nightly', 'Restricted traffic zone nightly', 'Ciascuna istanza di questa classe rappresenta una zona a traffico limitato attiva nelle sole ore notturne.'),
(586, 1, 5, 'Sailing_school', 'Sailing school', 'The instances of this class represent, among all service locations, some sailing schools.'),
(587, 1, 5, 'Sale_motor_vehicles_parts', 'Sale Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles.'),
(588, 1, 5, 'Sale_of_motor_vehicles', 'Sale of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain car trade activities.'),
(589, 1, 5, 'Sale_of_motor_vehicles_and_motorcycles', 'Sale of Motor Vehicles and Motorcycles', 'The instances of this class represent, among all business activities, certain wholesale and retail activities and repair of motor vehicles and motorcycles.'),
(590, 1, 5, 'Sale_of_motorcycles', 'Sale of Motorcycles', 'The instances of this class represent, among all the business activities, certain activities of trade, maintenance and repair of motorcycles and related parts and accessories.'),
(591, 1, 5, 'Sale_via_mail_order_houses_or_via_internet', 'Sale Via Mail Order Houses or Via Internet', 'The instances of this class represent, among all business activities, certain retail activities of any type of correspondence, radio, telephone, Internet product.'),
(592, 1, 5, 'Sandwich_shop_pub', 'Sandwich shop pub', 'The instances of this class represent, among all business activities, some sandwich shops and pubs.'),
(593, 1, 5, 'Sanitary_equipment', 'Sanitary Equipment', 'The instances of this class represent, among all the business activities, certain retail activities of sanitary articles.'),
(594, 1, 5, 'Sawmilling', 'Sawmilling', 'The instances of this class represent, among all the business activities, some wood cutting and planing activities.'),
(595, 1, 5, 'SchoolObservation', 'SchoolObservation', NULL),
(596, 1, 5, 'Second_hand_books', 'Second-Hand Books', 'The instances of this class represent, among all the business activities, certain retail activities of second hand articles and books.'),
(597, 1, 5, 'Second_hand_goods', 'Second-Hand Goods', 'The instances of this class represent, among all business activities, certain retail activities of second hand items and clothing.'),
(598, 1, 5, 'Secondary_education', 'Secondary education', 'The instances of this class represent, among all business activities, secondary education of first and second grade general (high school), technical, vocational and artistic education.'),
(599, 1, 5, 'Secretarial_support_services', 'Secretarial support services', 'The instances of this class represent, among all business activities, certain photocopying, document preparation and other specialized support activities for office functions, and certain activities for the dispatch of propaganda material, compilation and address management .'),
(600, 1, 5, 'Security_systems', 'Security systems', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(601, 1, 5, 'Security_systems_service', 'Security systems service', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(602, 1, 5, 'Senior_centre', 'Senior centre', 'The instances of this class represent, among all the places of service, some old-age hospitals.'),
(603, 1, 5, 'SensorSite', 'Traffic sensor', 'Single sensor for observing speed, traffic, concentration or density'),
(604, 1, 5, 'SensorSiteTable', 'Sensor Site Table', 'Set of sensors representing a single installation, a single site.'),
(605, 1, 5, 'Service', 'Service', 'Business activities, services to the citizen, offices, services in general, which can be located at one point.'),
(606, 1, 5, 'Sewerage', 'Sewerage', 'The instances of this class represent, among all business activities, certain sewerage companies.'),
(607, 1, 5, 'Sexy_shop', 'Sexy Shop', 'The instances of this class represent, among all the business activities, some retail business of adult articles (sexy shop).'),
(608, 1, 5, 'Shelter_area', 'Shelter area', 'Ciascuna istanza di questa classe rappresenta un punto di raccolta della popolazione in caso di calamità.'),
(609, 1, 5, 'ShoppingAndService', 'Shopping and service', 'Shops, malls, stores, all forms of public sale activities.'),
(610, 1, 5, 'Shopping_centre', 'Shopping centre', 'The instances of this class represent, among all business activities, some department stores.'),
(611, 1, 5, 'Single_brand_store', 'Single brand store', 'The instances of this class represent, among all service locations, some single-brand stores.'),
(612, 1, 5, 'SituationRecord', 'Situation Record of a Car Park', 'Recording the situation of a given parking lot at a certain time.'),
(613, 1, 5, 'Ski_school', 'Ski school', 'The instances of this class represent, among all the service centers, some ski schools.'),
(614, 1, 5, 'Skiing_facility', 'Skiing facility', 'The instances of this class represent, amongst all service locations, some skiing facilties.'),
(615, 1, 5, 'Small_household_appliances', 'Small Household Appliances', 'The instances of this class represent, among all the business activities, some retail business of sewing machines and household knitwear.'),
(616, 1, 5, 'Small_shop', 'Small shop', 'The instances of this class represent, among all business activities, some grocery stores.'),
(617, 1, 5, 'SmartBenchObservation', 'Smart bench observation', 'Each instance of this class represents a detection from a bench equipped with advanced features.'),
(618, 1, 5, 'SmartIrrigatorObservation', 'Smart irrigator observation', 'Each instance of this class represents a detection from a sprinkler equipped with advanced features.'),
(619, 1, 5, 'SmartWasteContainerObservation', 'Smart waste container observation', 'Each instance of this class represents a detection from a waste container with advanced features.'),
(620, 1, 5, 'Smart_bench', 'Smart bench', 'Ciascuna istanza di questa classe rappresenta una panchina dotata di funzionalità evolute.'),
(621, 1, 5, 'Smart_irrigator', 'Smart irrigator', 'Each instance of this class represents an irrigator with advanced features.'),
(622, 1, 5, 'Smart_street_light', 'Smart street light', 'Each instance of this class represents a street lamp with advanced features.'),
(623, 1, 5, 'Smart_waste_container', 'Smart waste container', 'Each instance of this class represents a garbage dump with advanced features.'),
(624, 1, 5, 'Social_centre', 'Social centre', 'The instances of this class represent, among all service locations, some social centers.'),
(625, 1, 5, 'Social_security_service_office', 'Social security service office', 'The instances of this class represent, among all service locations, certain offices of the National Institute of Social Security.'),
(626, 1, 5, 'Social_work', 'Social work', 'The demands of this class include, among all business activities, certain nursery services, day care for disabled children and residential and non-residential social services for the elderly and disabled.'),
(627, 1, 5, 'Software_publishing', 'Software publishing', 'The instances of this class represent, among all the business activities, some computer and software play activities.'),
(628, 1, 5, 'Sound_recording_and_music_publishing', 'Sound Recording and Music Publishing', 'The instances of this class include, among all the business activities, some sound recording and music publishing activities also in sound recording studios.'),
(629, 1, 5, 'Souvenirs_craftwork_and_religious_articles', 'Souvenirs Craftwork and Religious Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of worship and decoration art, trinkets, costume jewelery and handicrafts.'),
(630, 1, 5, 'Specialized_construction', 'Specialized Construction', 'The instances of this class represent, among all the business activities, certain specialized construction activities, such as: installation of street lighting and signaling devices, illumination of the slopes of airports (including maintenance and repair); installation of sewage treatment plants for swimming pools (including maintenance and repair); Installation of irrigation systems for gardens (including maintenance and repair); drilling and perforation; works of thermal, acoustic or anti-vibration insulation; installation of electronic equipment (including maintenance and repair); installation of electrical installations in buildings or in other works of building (included maintenance and repair); tinteggiatura and pose in work of glasses; Installation of plumbing, heating and air conditioning (including maintenance and repair) in buildings or in other works of construction; poses in work of casseforti and infissi; completion and finishing of buildings; demolition of buildings; poses in work of infissi, furnitures, controsoffitti, mobile and alike walls; covering of floors and walls; preparation of the yard building and placing of the terrain; plastering and plastering; installation of gas distribution facilities (including maintenance and repair); installation of fire extinguishing systems, including integrated ones (including maintenance and repair); installation, repair and maintenance of elevators and escalators.'),
(631, 1, 5, 'Specialized_design', 'Specialized Design', 'The instances of this class represent, among all business activities, certain design activities including: some professional, scientific and technical activities; certain specialized design activities; fashion and industrial design activities; activities of technical designers; graphics and graphic design, including Web pages.'),
(632, 1, 5, 'Speed_camera', 'Speed camera', 'The instances of this class are each a speedcam.'),
(633, 1, 5, 'Sport_event_promoters', 'Sport event promoters', 'The instances of this class represent, among all the business activities, certain activities of sports organizations, including the promotion of sporting events.'),
(634, 1, 5, 'Sporting_equipment', 'Sporting Equipment', 'The instances of this class represent, among all business activities, certain retail activities of sporting goods, bicycles, leisure articles and underwater activities.'),
(635, 1, 5, 'Sports_and_recreation_education', 'Sports and recreation education', 'The instances of this class represent, among all the business activities, some activities of organizing sports and recreational courses.'),
(636, 1, 5, 'Sports_clubs', 'Sports clubs', 'The instances of this class represent, among all the business activities, some activities of sports clubs.'),
(637, 1, 5, 'Sports_facility', 'Sports facility', 'The instances of this class represent, among all the business activities, some sports facilities management activities.'),
(638, 1, 5, 'Squares', 'Squares', 'The instances of this class represent, among all the places of service, some squares of interest to carry out cultural activities.'),
(639, 1, 5, 'Stalls_and_markets', 'Stalls and Markets', 'The instances of this class represent, among all business activities, certain street retailing business activities.'),
(640, 1, 5, 'Stalls_and_markets_of_clothing_and_footwear', 'Stalls and Markets of Clothing and Footwear', 'The instances of this class represent, among all the business activities, certain street retailing business of textiles, home textiles, clothing, footwear and leather goods.'),
(641, 1, 5, 'Stalls_and_markets_of_food', 'Stalls and Markets of Food', 'The instances of this class represent, among all business activities, some street retailing business of foodstuffs and beverages, fruit and vegetables, fish products and meats.'),
(642, 1, 5, 'Stalls_and_markets_other_goods', 'Stalls and Markets Other Goods', 'The instances of this class represent, among all the business activities, certain street retailing business of machinery, equipment and products for agriculture, gardening equipment, trinkets, jewelery, garden furniture, furniture, carpets, Mats, household items, household appliances, electrical equipment, perfumes and cosmetics, soaps, detergents and other detergents for any use, flowers, plants, bulbs, seeds and fertilizers.'),
(643, 1, 5, 'Stamps_and_coins', 'Stamps and Coins', 'The instances of this class represent, among all the business activities, certain pharmacy, numismatics and collectibles retail activities.'),
(644, 1, 5, 'StatisticalData', 'StatisticalData', 'Value referring to a statistical data linked to a road or to a Public Administration.'),
(645, 1, 5, 'Stone_processing', 'Stone Processing', 'The instances of this class represent, among all the business activities, certain mining activities of various stones and minerals not related to the extraction, segagion and processing of stones and marble, artistic marble processing and other related stones , Mosaic work, cutting, molding and finishing of stones.'),
(646, 1, 5, 'StreetNumber', 'Street Number', 'Class whose instances are known civic numbers.'),
(647, 1, 5, 'Street_light', 'Street light', 'Each instance of this class represents a lamppost of the street lighting system.'),
(648, 1, 5, 'Street_sweeping', 'Street sweeping', 'The instances of this class include, among all the business activities, some cleaning and washing activities in public areas, removal of snow and ice.'),
(649, 1, 5, 'Summer_camp', 'Summer camp', 'The instances of this class represent, among all the business activities, certain activities of marine and mountain colonies.'),
(650, 1, 5, 'Summer_residence', 'Summer residence', 'The instances of this class represent, among all service locations, some holiday homes.'),
(651, 1, 5, 'Supermarket', 'Supermarket', 'The instances of this class represent, among all business activities, some supermarkets.'),
(652, 1, 5, 'Support_activities_for_transportation', 'Support Activities for Transportation', 'The instances of this class represent, among all business activities, certain services related to land, air, sea, and waterways transport.'),
(653, 1, 5, 'Support_animal_production', 'Support Animal Production', 'The instances of this class represent, among all the business activities, certain support activities for farming, including in particular agricultural crops associated with animal breeding, plant and animal production support activities, agriculture and subsequent collection activities.'),
(654, 1, 5, 'Surgical_activities', 'Surgical activities', NULL),
(655, 1, 5, 'Surveyor', 'Surveyor', 'The instances of this class represent, among all the business activities, certain technical activities carried out by geometers.'),
(656, 1, 5, 'Sushi_bar', 'Sushi bar', 'The instances of this class represent, among all business activities, some sushi bars.'),
(657, 1, 5, 'Take_away', 'Take Away', 'The instances of this class represent, among all the business activities, certain catering activities (without provision) for preparation of takeaway foods.'),
(658, 1, 5, 'Tannery', 'Tannery', 'The instances of this class include, among all the business activities, certain tanning activities of leather, manufacture of travel articles, handbags, leather goods and saddlery, fur preparation and dyeing.'),
(659, 1, 5, 'Tattoo_and_piercing', 'Tattoo and piercing', 'The instances of this class represent, among all the business activities, some tattoo and piercing activities.'),
(660, 1, 5, 'Tax_advice', 'Tax advice', 'The instances of this class represent, among all business activities, certain activities carried out by Tax Assistance Centers.'),
(661, 1, 5, 'Taxi_company', 'Taxi Company', 'The instances of this class represent, among all business activities, some taxi transport activities.'),
(662, 1, 5, 'Taxi_park', 'Taxi park', 'The instances of this class represent, among all service locations, certain parking areas for taxis.'),
(663, 1, 5, 'Technical_consultants', 'Technical consultants', 'The instances of this class represent, among all business activities, certain activities of architecture, engineering and other engineering studies.'),
(664, 1, 5, 'Technical_testing', 'Technical testing', 'The instances of this class represent, among all the business activities, certain testing and technical analysis activities.'),
(665, 1, 5, 'Telecommunications', 'Telecommunications', 'The instances of this class represent, among all business activities, certain retail trade activities of telecommunications equipment and telephony in specialized stores.'),
(666, 1, 5, 'Television_broadcasting', 'Television broadcasting', 'The instances of this class represent, among all the business activities, certain activities of television programming and broadcasting.'),
(667, 1, 5, 'Temp_agency', 'Temp agency', 'The instances of this class represent, among all the business activities, certain activities of the temporary employment agency.'),
(668, 1, 5, 'Textile_manufacturing', 'Textile Manufacturing', 'The instances of this class represent, among all the business activities, certain textile manufacturing activities, including: manufacture of twine, string, ropes and nets; manufacture of tulle, lace and lace; packaging of textile articles (excl. articles of clothing); manufacture of felt and textile articles diverse; manufacture of nonwovens and articles thereof (excl. articles of apparel); manufacture of embroidery; manufacture of carpets and carpets; finishing of textiles, of articles of changing room and similari activities; preparation and spinning of textile fibers; weaving; confezionamento of biancheria of bed, of table and for the amoblamiento; manufacture of knitted fabrics; manufacture of ribbons, labels and trimmings of textile fibers.'),
(669, 1, 5, 'Textiles_products', 'Textiles Products', 'The instances of this class represent, among all the business activities, certain retail trade activities of textile products.'),
(670, 1, 5, 'Theatre', 'Theatre', 'The instances of this class include, among all the business activities, certain theatrical activities, including in particular: activities in the field of directing; other activities supporting artistic representations; management of theaters, concert halls and other artistic structures; activities in the field of acting; artistic and literary creations; artistic representations; rental with operator of structures and equipment for events and shows.'),
(671, 1, 5, 'ThermometryObservation', 'Thermometry observation', 'Ciascuna istanza di questa classe rappresenta una rilevazione della temperatura eseguita in un certo luogo ad un certo istante di tempo.'),
(672, 1, 5, 'Ticket_sale', 'Ticket sale', 'The instances of this class represent, among all business activities, certain ticketing services for theatrical, sports and other recreational and entertainment events.'),
(673, 1, 5, 'Tobacco_industry', 'Tobacco Industry', 'The instances of this class represent, among all the business activities, certain tobacco industries.'),
(674, 1, 5, 'Tobacco_shop', 'Tobacco shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of monopolies (tobaccos).'),
(675, 1, 5, 'Toilet', 'Toilet', 'The instances of this class represent, among all the services, some public toilets, to be framed in the context of tourist services.'),
(676, 1, 5, 'Tour_operator', 'Tour operator', 'The instances of this class represent, among all business activities, certain activities of travel agencies.'),
(677, 1, 5, 'TourismService', 'Tourism Services', 'Activities of travel agency services, tour operators and booking services.'),
(678, 1, 5, 'Tourist_complaints_office', 'Tourist complaints office', 'The instances of this class represent, among all service locations, certain complaint offices dedicated to the tourism sector.'),
(679, 1, 5, 'Tourist_guides', 'Tourist guides', 'The instances of this class represent, among all the business activities, certain activities of guides and tour guides.'),
(680, 1, 5, 'Tourist_information_office', 'Tourist information office', 'The instances of this class represent, among all service locations, some tourist information offices.'),
(681, 1, 5, 'Tourist_trail', 'tourist trail', 'The instances of this class represent, among all service locations, certain tourist itineraries.'),
(682, 1, 5, 'Towing_and_roadside_assistance', 'Towing and Roadside Assistance', 'The instances of this class represent, among all the business activities, some towing and roadside assistance activities.'),
(683, 1, 5, 'TrafficConcentration', 'Traffic Concentration Observation', 'Subclass of observations on auto concentration.'),
(684, 1, 5, 'TrafficFlow', 'Traffic Flow Observation', 'Subclass of auto flow observations.'),
(685, 1, 5, 'TrafficHeadway', 'Traffic Headway Observation', 'Sub-class of observations on the average transit time between cars.'),
(686, 1, 5, 'TrafficObservation', 'Traffic observation', 'Each instance of this class represents a traffic detection performed at some point at some time.'),
(687, 1, 5, 'TrafficSpeed', 'TrafficSpeed Observation', 'Subclass of average velocity observations.'),
(688, 1, 5, 'Traffic_corps', 'Traffic corps', 'Each instance of this class represents a Street Police Station.'),
(689, 1, 5, 'Traffic_light', 'Traffic light', 'The instances of this class are each a semaphorical facility.'),
(690, 1, 5, 'TrainStation', 'Train Station', 'Railway station, are located at railway junctions with a ratio of 1:1'),
(691, 1, 5, 'Train_lost_property_office', 'Train lost property office', 'The instances of this class represent, among all service locations, some offices for the lost items located inside train stations.'),
(692, 1, 5, 'Train_station', 'Train station', 'The instances of this class represent, at all service locations, some railway stations.'),
(693, 1, 5, 'Training_school', 'Training school', 'The instances of this class represent, among all business activities, some training courses and professional updating courses.'),
(694, 1, 5, 'Training_school_for_teachers', 'Training school for teachers', 'The instances of this class represent, among all service locations, some master schools.'),
(695, 1, 5, 'Tram_stops', 'Tram stops', 'The instances of this class represent, at all service locations, some tram stops.'),
(696, 1, 5, 'Tramline', 'Tram line', 'The instances of this class represent, among all service locations, some tram lines.'),
(697, 1, 5, 'TransferServiceAndRenting', 'Transfer service and renting', 'Car parks, railway stations or buses, everything that must be located on a map and refers to transportation.'),
(698, 1, 5, 'Translation_and_interpreting', 'Translation and interpreting', 'The instances of this class represent, among all the business activities, some translation and interpretation activities.'),
(699, 1, 5, 'TransverseService', 'Transverse Service', 'Services often associated with other services, which have their own geolocation.'),
(700, 1, 5, 'Trattoria', 'Trattoria', 'The instances of this class represent, among all the business activities, some trattorias.'),
(701, 1, 5, 'Travel_agency', 'Travel agency', 'The instances of this class represent, among all business activities, some travel agencies.'),
(702, 1, 5, 'Travel_bureau', 'Travel bureau', 'The instances of this class represent, among all service locations, some tourist offices dedicated to guided tours.'),
(703, 1, 5, 'Travel_goods', 'Travel goods', 'The instances of this class represent, among all business activities, certain retail trade of leather goods and travel goods.'),
(704, 1, 5, 'Travel_information', 'Travel information', 'The instances of this class represent, among all business activities, certain services provided by travel agencies and tour operators, booking services, services of tourist interest made by subjects other than travel agencies and tour operators, and related activities.'),
(705, 1, 5, 'Trinkets', 'Trinkets', 'The instances of this class represent, among all the business activities, certain retail trade of trinkets and jewelery (including souvenirs and promotional items).'),
(706, 1, 5, 'Underwear_knitwear_and_shirts', 'Underwear, Knitwear and Shirts', 'The instances of this class represent, among all the business activities, some retail business of personal linen, knitwear, shirts.'),
(707, 1, 5, 'Upholsterer', 'Upholsterer', 'The instances of this class represent, among all the business activities, some upholstery workshops.'),
(708, 1, 5, 'Urban_bus', 'Urban bus', 'The instances of this class represent, among all service locations, the locations of certain local public transport companies operating on urban areas.'),
(709, 1, 5, 'Useful_numbers', 'Useful numbers', 'The instances of this class represent the numbers to be called in an emergency.'),
(710, 1, 5, 'UtilitiesAndSupply', 'Utilities and supply', 'Fornitura di utenze e servizi'),
(711, 1, 5, 'Vacating_service', 'Vacating service', 'The instances of this class represent, among all business activities, certain activities of clearing cellars, floors and garages.'),
(712, 1, 5, 'Vacation_resort', 'Vacation resort', 'The instances of this class represent, among all service locations, some holiday resorts.'),
(713, 1, 5, 'Vehicle_rental', 'Vehicle rental', 'The instances of this class represent, among all service locations, certain vehicle rental services.'),
(714, 1, 5, 'Vehicle_trade', 'Vehicle trade', 'This class represents, among all business activities, the business of buying and selling vehicles.'),
(715, 1, 5, 'Vending_machines', 'Vending Machines', 'The instances of this class represent, among all business activities, certain retail activities carried out by automated vending machines.'),
(716, 1, 5, 'Veterinary', 'Veterinary', 'The demands of this class represent, among all business activities, certain veterinary services.'),
(717, 1, 5, 'Video_tapes_disks_rental', 'Video tapes disks rental', 'The instances of this class represent, among all business activities, some hire of video cassettes, CDs, DVDs and discs containing audiovisual or video games.'),
(718, 1, 5, 'Viewpoint', 'Viewpoint', 'Ciascuna istanza di questa classe rappresenta un punto panoramico.'),
(719, 1, 5, 'Wallpaper_and_floor_coverings', 'Wallpaper and Floor Coverings', 'The instances of this class represent, among all business activities, some retail business of wallpaper and floor coverings (carpet and linoleum).'),
(720, 1, 5, 'Warehousing_and_storage', 'Warehousing and Storage', 'The instances of this class represent, among all business activities, certain storage and custody activities, and in particular: storage and custody; warehousing and transport support activities; refrigerated warehouses for third parties; warehouses of custody and deposit for third account.'),
(721, 1, 5, 'WasteType', 'Waste container type', 'Each instance of this class represents a particular type of waste container (undifferentiated, paper, plastic, glass, drugs, and so on).'),
(722, 1, 5, 'Waste_collection_and_treatment', 'Waste Collection and Treatment', 'The instances of this class represent, among all business activities, certain waste collection, treatment and disposal activities.'),
(723, 1, 5, 'Waste_container', 'Waste container', 'Each instance of this class represents a waste bin.'),
(724, 1, 5, 'Water_collection_treatment_and_supply', 'Water Collection Treatment and Supply', 'The instances of this class represent, among all business activities, certain activities of gathering, treating and supplying water.'),
(725, 1, 5, 'Water_resource', 'Water resource', 'Each instance of this class represents a water resource company or entity.'),
(726, 1, 5, 'Water_transport', 'Water Transport', 'The instances of this class represent, among all the business activities, certain maritime, coastal and inland waterway transport activities.'),
(727, 1, 5, 'Weapons_and_ammunition', 'Weapons and Ammunition', 'The instances of this class represent, among all business activities, certain retail trade activities of weapons, ammunition and military articles.'),
(728, 1, 5, 'WeatherPrediction', 'Weather prediction', 'Meteorological forecast for a specific part of the day.'),
(729, 1, 5, 'WeatherReport', 'Weather Report', 'Meteorological report with information on temperature, humidity, snow and the like.'),
(730, 1, 5, 'Weather_sensor', 'Weather sensor', 'Weather sensor releasing information on weather forecasts.'),
(731, 1, 5, 'Web_and_internet_provider', 'Web and Internet Provider', 'The instances of this class represent, among all business activities, some hosting and provision of application services, including Web portals.'),
(732, 1, 5, 'Wedding_favors', 'Wedding Favors', 'The instances of this class represent, among all business activities, certain candy-shop retail activities.'),
(733, 1, 5, 'Welfare_worker_office', 'Welfare worker office', 'The instances of this class represent, among all service locations, certain offices of social workers.'),
(734, 1, 5, 'Wellness_centre', 'Wellness centre', 'The instances of this class represent, among all business activities, certain activities of centers for physical well-being and spa facilities.'),
(735, 1, 5, 'Wholesale', 'Wholesale', 'Wholesale of anything.'),
(736, 1, 5, 'Wholesale_agricultural_raw_materials_live_animals', 'Wholesale Agricultural Raw Materials Live Animals', 'The instances of this class represent, among all business activities, certain wholesale trade in animal and vegetable products, including: cereals and pulses; Live animals; Leather and raw hides and skins (excluding fur skins); Raw skins and furskins; Seeds and feed for livestock (feed), officinal plants, oilseeds, potatoes; Cereals, raw tobacco, seed and livestock feed (feed); flowers and plants.'),
(737, 1, 5, 'Wholesale_commission_trade', 'Wholesale Commission Trade', 'The instances of this class represent, among all the business activities, certain activities of agents and trade representatives.'),
(738, 1, 5, 'Wholesale_food_beverages_tobacco', 'Wholesale Food Beverages Tobacco', 'The instances of this class represent, among all the business activities, certain activities of wholesale trade in food and tobacco products.'),
(739, 1, 5, 'Wholesale_household_goods', 'Wholesale Household Goods', 'The instances of this class represent, among all business activities, certain non-food wholesale trade activities.'),
(740, 1, 5, 'Wholesale_ict_equipment', 'Wholesale ICT Equipment', 'The instances of this class represent, among all business activities, certain wholesale activities of electronic, computer and similar equipment.'),
(741, 1, 5, 'Wholesale_machinery_equipmentent_supplies', 'Wholesale Machinery Equipmentent Supplies', 'The instances of this class represent, among all business activities, certain wholesale trade of professional equipment.'),
(742, 1, 5, 'Wholesale_motor_vehicles_parts', 'Wholesale Motor Vehicles Parts', 'The instances of this class represent, among all business activities, certain wholesale and brokering activities of parts and accessories of motor vehicles.'),
(743, 1, 5, 'Wholesale_trade', 'Wholesale Trade', 'The instances of this class represent, among all business activities, certain wholesale activities.'),
(744, 1, 5, 'Wifi', 'Free WiFi point', 'The instances of this class represent, among all service locations, certain access points to Wi-Fi networks.'),
(745, 1, 5, 'WineAndFood', 'Wine And Food', 'Restaurants, wine bars and all other food and wine activities.'),
(746, 1, 5, 'Wine_shop_and_wine_bar', 'Wine shop and wine bar', 'The instances of this class represent, among all business activities, certain beverage retail activities.'),
(747, 1, 5, 'Youth_assistance', 'Youth assistance', 'The instances of this class represent, among all service locations, some childcare centers.'),
(748, 1, 5, 'Youth_information_centre', 'Youth information centre', 'The instances of this class represent, among all service locations, certain youth information centres.'),
(749, 1, 6, 'demande_achat', 'demande_achat', NULL),
(750, 1, 6, 'commande', 'commande', NULL),
(751, 1, 6, 'facture', 'facture', NULL),
(752, 1, 6, 'operateur', 'operateur', NULL),
(753, 1, 6, 'article', 'article', NULL),
(754, 1, 6, 'fournisseur', 'fournisseur', NULL),
(766, 1, 11, 'Client', 'Client', NULL),
(767, 1, 11, 'Commandes', 'Commandes', NULL),
(768, 1, 11, 'Produits', 'Produits', NULL),
(769, 1, 11, 'Fournisseur', 'Fournisseur', NULL),
(770, 1, 12, 'Client', 'Client', NULL),
(771, 1, 12, 'Commandes', 'Commandes', NULL),
(772, 1, 12, 'Produits', 'Produits', NULL),
(773, 1, 12, 'Fournisseur', 'Fournisseur', NULL),
(782, 1, 15, 'Client', 'Client', NULL),
(783, 1, 15, 'Commandes', 'Commandes', NULL),
(784, 1, 15, 'Produits', 'Produits', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(14, 1, NULL, NULL, NULL, 'Client'),
(15, 1, 783, NULL, NULL, 'Commande'),
(16, 1, 784, NULL, NULL, 'Produit');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(52, 14, 1, NULL, NULL, 1, NULL, 0, 0),
(53, 14, 4, NULL, NULL, 2, NULL, 0, 0),
(54, 14, 656, NULL, NULL, 3, NULL, 0, 0),
(55, 15, 1, NULL, NULL, 1, NULL, 0, 0),
(56, 15, 4, NULL, NULL, 2, NULL, 0, 0),
(57, 15, 656, NULL, NULL, 3, NULL, 0, 0),
(58, 15, 657, NULL, NULL, 4, NULL, 0, 0),
(59, 16, 1, NULL, NULL, 1, NULL, 0, 0),
(60, 16, 4, NULL, NULL, 2, NULL, 0, 0),
(61, 16, 657, NULL, NULL, 3, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('1de78u2ev2klpolu8u7jpbgsom', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383931333335392e3935323031343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22633663336b64657535366e6a706f6c6c37396a63676674746936223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383931363934363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226565343431666165393664363233383332656133646661653364393035303564223b733a33323a226132366137653863346632626435373562396565656264653063316134316638223b733a33323a226634383832386664313737633664646131383361363033363831343762613035223b733a33323a223431396434383662363365623732353737663430346466323838396239316633223b7d733a343a2268617368223b733a36353a2234313964343836623633656237323537376634303464663238383962393166332d6634383832386664313737633664646131383361363033363831343762613035223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1618913360);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('9s0ajmkccrqls1kvirrgbrmbor', 0x5f5f4c616d696e61737c613a393a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393334363333362e3938373130383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226733326d69716f616f7572356e716c3361616d306b7470626533223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393333353234353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631393334393931353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393334383039373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393334393932373b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393334373639363b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393334313738383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393334373935353b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223739376566363266343535353662306466333165353963396636383366303861223b733a33323a223436323562613366313261636564633562313061313734626134303032346566223b7d733a343a2268617368223b733a36353a2234363235626133663132616365646335623130613137346261343030323465662d3739376566363266343535353662306466333165353963396636383366303861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353833323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36393a7b733a33323a223865346130663437666530633531653431336437633861353238373934313439223b733a33323a223532336430376131373063373937373939363364393963653461336465303432223b733a33323a223833353436313062663937333334366133303263356130346561393138313336223b733a33323a223839613031353065316334323563366330373765306163326362626635386465223b733a33323a223936373265343034613265646432356137636638623334613035303064636162223b733a33323a223965316162653635323466633836303262613936353937656462663266656630223b733a33323a223033366135323366326230313036623332386239343862633261353766376563223b733a33323a223832343030646230333532316563613030373639323138623230343538333036223b733a33323a223830373966616362633531663664633936613730323438356233303532623031223b733a33323a223033666330646230643862303637346261646231303132353161396562666264223b733a33323a226336303338393434643362643430623737366264663535303233326235353963223b733a33323a223337326166393262353234646162323039353432313130336531303966633937223b733a33323a223839343036666338393163326430623639373564616161643135313035623037223b733a33323a223034636639326534363839653566636533396639316365626165613263366333223b733a33323a223934343135666637636161306233666339663430386338303966356635353735223b733a33323a223036376539396535376533623633386162306466376263393862393237303730223b733a33323a223434643262363736626238643634613566373331343339626333343363343065223b733a33323a226331356361323539646133346331393136306437363338363639363932653135223b733a33323a223331386336326237326564626231383062353633323861346436333934333532223b733a33323a223263386632353764373663313636643363663031396634616565363962356538223b733a33323a223935666131343232333433643233336663633732626430363563316563636236223b733a33323a223030326634336232353665666364656262303337646633333433653837313263223b733a33323a223665633633303632326234613038666338656662366462613165396665373731223b733a33323a223438663762656366653438653639366538376366633333366539376632623666223b733a33323a223337353739653237313533643134666536653363396564663537653237353963223b733a33323a226433323665623937376530343964646432653566316135623663396339323663223b733a33323a223736396433663165396438396139633263383162333235303238333662326533223b733a33323a223135303933336634303539316364343237313832313939386232633932656464223b733a33323a226662383964353666313261333334353538353033323439643438323836663639223b733a33323a223765356537396239333064353437326532636439663964623866316664353464223b733a33323a223338386530353832633034646538626139313065356130373934323530366335223b733a33323a223133666463366231653534353862653430363137386435613136343935623431223b733a33323a223337313363376138326535613034393364646131333937363161373836656439223b733a33323a226562343738386166393461633237643939343732613963373933303063333461223b733a33323a226332643539316463653339333839386134646134343337613139313162653362223b733a33323a223638353536316530396534333130626436353464353934653039373664363565223b733a33323a226665363663373664656630663433313666646563393465636532613832633433223b733a33323a223334303834343332323035383430343539356137323161316662333162303666223b733a33323a226137336630333931626637353465393139333766326661343836313830613464223b733a33323a226438366665643137653066663835616339383135383136643938356232383536223b733a33323a223437636431656630666463313465393432376363643337613739353563366438223b733a33323a226130636239633437626435653233663139356236373861393863313433656664223b733a33323a223965653861333036363533323536343865393639383832366230633965353831223b733a33323a223663333235323063313037613862383935663334316562623764646133346561223b733a33323a226439383137323863373765386666393439373831353439323663623161333932223b733a33323a226133346633626532646638613661613264633438303165363736396266376135223b733a33323a223365346563303633636238643939383562666239653232656631663232633938223b733a33323a223430623435333231623932666531653639656539653962323362333666396365223b733a33323a226538313239653530393338373966666463306535353235353635653264616161223b733a33323a226635336463333834666665623634653464393332366636613562666164646664223b733a33323a223064323165663830323237386165613765373539383131393434333764363135223b733a33323a223237336262623831656466366537313837613731643632643762663039633063223b733a33323a223536346330356239373031383535303231383037613664653864633666613466223b733a33323a223931666632393763356565363664393131373465386166393339373166356134223b733a33323a226239653865386264626465653766333232666333393439323037333961353139223b733a33323a223930376634393363656636616139643464643562333564383964316562376432223b733a33323a223366323931343839313031363231333935343433646662653737393634383566223b733a33323a226230393162343566336132363864613538333738326164396133653439316164223b733a33323a226566313466633735363636386164616632653631303463313765656139373032223b733a33323a226530366235623339643632636461346137383961396362383034643565623665223b733a33323a223963656435316139633462333236303264663431643864363064626230346239223b733a33323a223632353964643335383935346662613737613936313234663936646238386163223b733a33323a223432303338623665633539386336336365336534616538656261383231326664223b733a33323a223432303263306632343932356365313961356233396633646438633965656132223b733a33323a226561636263353330613135386138376531363934383838666664356538343763223b733a33323a226531623630363835633734613663643065373162616431353034636537613831223b733a33323a223065663931306132363433653639663666386331366533383362383832323439223b733a33323a223936323137363032366664303537636339633363326636376535613738343164223b733a33323a223930303535393330633831306464353262623531316330653031623438353761223b733a33323a226334353563356637396561373933353234393464616166336138613664346533223b733a33323a223738373632383366666234616465363836616138633531653739643962626163223b733a33323a226130366162666630396464323234363237666137306335323236353039333139223b733a33323a223332646530613962383665333433323065373964383066346166353734623935223b733a33323a226339666131663930663530373330653132366266366337376361343966303465223b733a33323a223562303761663165373062643861643965353738613961343535646330643938223b733a33323a223434343737313332653635376137646530393331626535323966636333386439223b733a33323a223133383061616532346433333162373261623064306331373031343463343731223b733a33323a226265623466633437393263323236656337663966336338343237316264656535223b733a33323a223361303162643830323837663364333832303034303134336133316233373538223b733a33323a226335663039393065616161363738323566376230633536326633643837613064223b733a33323a223566646265383933323364323138353532613234623836373461633434353234223b733a33323a223263643262306162396462353331386533366532373961343634663763363964223b733a33323a226366343139636232393633653766613462613864376465303634383636306262223b733a33323a226139396432303236633562393136663636623930663230633137613136613935223b733a33323a226537353030393335313964613931633436393737653063336665633036353062223b733a33323a226461656436353032306565313734343434663139323237366436303333303332223b733a33323a223039396339303834643532346631643561616539323935623334343438373439223b733a33323a223030666436626566663031363133326437373337326435663662356233623738223b733a33323a223833636234626634343165303565333839363138653630393537356339366231223b733a33323a223335386563336535383734386335366539616634653730626131373230663764223b733a33323a226163353731386335616137373564353866393535343163383039346264633337223b733a33323a223332366634626464626262346132373031383638636630643266333734656163223b733a33323a226531616339653034366432356664353063303966373363323264393232393335223b733a33323a226237363835333262663163633965303630663434323164616134666630623131223b733a33323a223436383563353135333338323436666134366230356133356634396633336432223b733a33323a223038393935626563356531326261326637303731303564326130613038346530223b733a33323a223736306635643230666561353330333730653637356632316363616361646139223b733a33323a226236303465636563636136366462363839626139626437313135366436653737223b733a33323a226465373632376365623730376130303463633438626361363133646630306130223b733a33323a226336383735323231623564323335643031396531393566653431663231303136223b733a33323a223339646565643463316630646563653163343864363439356164653130613532223b733a33323a223938643563343962343139396237643563386462363839303466363634653138223b733a33323a226466353433373739363661303230616137333463393035326662363161366463223b733a33323a223362333338386238356435643437646238346435633938363365333334656362223b733a33323a223166393166623863636263636333373835386337393661396137303733396332223b733a33323a226136393131316561613862353930356236616563373538633065326465363765223b733a33323a226239633331366434313533376132353236313832653262656636636163626538223b733a33323a226537623332346334663964363865356434616334656630616630343631383135223b733a33323a226135363863336532316434646432623563616230363266613735376534643433223b733a33323a223933303135363530373863376434633431646362656138346332333565646362223b733a33323a223736373861376335623633616638396235353666366466333838366433646138223b733a33323a223965306130386238326462316362323237623361623665623633623161636663223b733a33323a226664306231366662373830613263386336393833373564323238336233323239223b733a33323a223239333335633463306261663764656331353239653935633863393938373336223b733a33323a223463343139363434656633373036313665346633633139353333346562363139223b733a33323a223838653762643437346438633231623162626436616365383462626434363332223b733a33323a226664626238393036633430323630653735363232613761653663626264313336223b733a33323a226663383039396631666539633461353435616133333363326439366435366261223b733a33323a223065383264666261636163346637643030656130326530343434656130336336223b733a33323a223664356530373266333361323663373434373865353162326134373035376564223b733a33323a223865363565386434353836646566316130633338316534636232363539323461223b733a33323a223963323562396365363636356437386536623064363664366330303530303764223b733a33323a226466363439653939313262356135613462396231636339383234636639386661223b733a33323a226435666339386537383163366135646265373334376637323631646537663761223b733a33323a226135383761383466333662326366643439313962323533623462656263353136223b733a33323a226661646336383461336665666538376462303765343831353637623732636362223b733a33323a223463663939386663616439613231313339323834383331346535663534613033223b733a33323a223631313935393831353139656230623630353538636238633561333336656437223b733a33323a226161323765323963633462356539616435336265663064396135633039613631223b733a33323a226239333734653966313430656566643062623637376630633563326633643833223b733a33323a223561646333653565653037633065316366313162636266353430323562366661223b733a33323a223538633964626635373266343431336133383331373339666161623331643465223b733a33323a223064323433633765393665633930626630323966653035386263646566366431223b733a33323a226133633038356266366364336462303438346137336537653235373761643566223b733a33323a226336373662323461656166366237356332656665663466396130316435366334223b733a33323a226233366662353466353033366330663666316363616132336635306130646638223b733a33323a223464333734343839353466383137333132656638396335636662343036306233223b733a33323a223833346238363132323165383663303364383436326135636662323562383535223b7d733a343a2268617368223b733a36353a2238333462383631323231653836633033643834363261356366623235623835352d3464333734343839353466383137333132656638396335636662343036306233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313931323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223961373038313066613730383330373531623365613639323436663533333762223b733a33323a226635356231343632323731373330363438373535353439323661636233316333223b733a33323a223462623633383133666636313534616135633963663938356661623562633831223b733a33323a226238356566646231626136323035393836346565626631393639626165353136223b733a33323a223133636139653566396263613338316161366538626538363961653837333965223b733a33323a223366316133386335333933626566313137666439613063633766626362396363223b733a33323a226530633631346563633934666366303862323563386239366138653632336336223b733a33323a226334343833323566323764336638636334653830316434343736633761326539223b733a33323a223164303733643335363564613039376636333066343235326334386234623637223b733a33323a226232386664653130306331343062316264376232366130663239653235333039223b733a33323a223262626239666363373834333362656234623735373863613363646337343034223b733a33323a223763313762653832303933393936383665383462616137373532346366626631223b733a33323a223237663765336264626636353539323664663963353138396534633439633333223b733a33323a223064343333333832363538613535613038313431646539396437616365323034223b733a33323a223032616139393033346462656132643166393537316165383064306265373335223b733a33323a226237626335663363316262326137666231373463393966336632653334333332223b733a33323a223739626334386333336639303938383739336131646437323831303431363964223b733a33323a226133393231613634303837623964663364313566326136343965663261616335223b733a33323a226566343565316431643136326134386662313961373038623864386136323566223b733a33323a226565393864316637336232343931343731646163613465366434343438323139223b733a33323a223537373135386134313565353661376230393133666463356365343062376136223b733a33323a226434303462316235396236363961353534643666313666333532633233666465223b733a33323a226161343736633733383935333532383565383036656339626235343965393966223b733a33323a226465346165616665306161636333626330393266306531323166316263636162223b733a33323a223365636163306534303535356562316164373664626338643866346164376530223b733a33323a223033613632313034386466373437356133666130666539633232356364646636223b733a33323a226266633139336161333235396232613839376362376637666431386236666662223b733a33323a223961373830623930306562613663633839356162356533383930663536633864223b733a33323a223035643235643630643166303262303063393635333261363033326337653063223b733a33323a226233303033643066353265663863376262613231663734613164623561356234223b733a33323a226463623162346164386437396532623466393036383936336630373031633735223b733a33323a226530343932663332383336613432393037643239646439633035343334313935223b733a33323a226564646432353464626433343335346463623532303330313066336264376536223b733a33323a223433633631386633633866356238333764343461353034663837323865346132223b733a33323a226332366235353462393635393839326132373632353666383163333566313563223b733a33323a226433643835303662353265386632313133323035333137343333326434306233223b733a33323a226232613332373435363730303162323730353732396263643532663037393864223b733a33323a223664386239643835616238383032633165613733303263333565363735346232223b733a33323a223931353166393966346633376266643433316561353764333262323862303061223b733a33323a223830373535333966366634333233316633643231393037363665363234653135223b7d733a343a2268617368223b733a36353a2238303735353339663666343332333166336432313930373636653632346531352d3931353166393966346633376266643433316561353764333262323862303061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a32313033333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3235393a7b733a33323a223031643962363265396332633733616239313036386135636262656438636466223b733a33323a223364323462353866336264306536613538356366333934626531333537633531223b733a33323a223765356430353234666632343037356665343330303765313133626261346665223b733a33323a223765333466363261653165323934323934363839363832383536643636343335223b733a33323a223339383839666438323966383430633530373666633831376632373664653639223b733a33323a223962303336616531383436653736306239643063363563393532373530393865223b733a33323a223734303039623537373562626563383931336665386233356464313538313634223b733a33323a223038353238306638383335616539623964343766303330343963336638323433223b733a33323a223131353265663135636230356462616130393563663462323765623661646634223b733a33323a223438616131356334613432323334633264353135313931663365376539623662223b733a33323a223066653433666535313863313063306534306232323834356632336231383536223b733a33323a226164333231336463333635376564653066636431323833396136383463303631223b733a33323a223863646538346436653861666365313732626134643431373637373832396339223b733a33323a223061333966393530666433643332383232653564386138373839623138636132223b733a33323a223139376465383862373933366634376133363839626635626439393462643236223b733a33323a226166353232656532353132616538343964656234656266373965643065316363223b733a33323a226531346234616133303133383965636361393832353962666262323334656632223b733a33323a226533393766666261353363363431633965353864336530663866666665623335223b733a33323a226563663934646133346266333730663564653639323839366531303338613365223b733a33323a226662626334643132313165653666663334633864623237666532343066633037223b733a33323a226638663566663339336637303334643638656364343239616161383039383634223b733a33323a223165393034376237393539616534343030633636333732663436373663376666223b733a33323a223634616133336463343966636361313235646538356438613730393231313936223b733a33323a223733383761326230393938353036353738646461653262613932643338303763223b733a33323a223837363536386162346466313331373838653462613964333835663434303765223b733a33323a226136613238363165366664323837643031376537613261623631663061386464223b733a33323a226465353238376331646438646430333135326565333763623832636666636437223b733a33323a223431346231343963313036656366306132666338396665373263313663623638223b733a33323a223433356465666430346433616536393365613462393139346663656438316261223b733a33323a223564303435366530363161613162356438316630323037316166623432326136223b733a33323a226636396161616338633536653733306239633439373336373336326566613563223b733a33323a226432633366383434306365616539623632643931356366343565643537616265223b733a33323a223135636635383766383432326166613635356535363331636135353233383333223b733a33323a226664623239666565616162623361383535313835643636333938353134393230223b733a33323a223861373762663438326333336336613133386338363036363237316633616463223b733a33323a223934663032643266663362373065313964353138343062356361656261666264223b733a33323a226265666263386139343236356535313935383663653135393961303064626434223b733a33323a223034333563616664373938376233663834666164383733363239623265626536223b733a33323a226334376565373463303262613033653062643636333862323038616136343137223b733a33323a223466613638396262383839653330333737353931636537626138333136366166223b733a33323a223034306462666135613465386630386461626461363536626335353234386161223b733a33323a223566623238653033656339636537306462336661393431396439623332353862223b733a33323a223430666166376333383761623935373037643234366466356638643433643061223b733a33323a226439326330613538363933663461363061313165316338643839333761643732223b733a33323a226136643936393735343164616662623432313063343039623832396565353665223b733a33323a223136323738313534316533613661316332336132303232386161613633396664223b733a33323a223831613463363230386532363733666366316163633438643462353465636232223b733a33323a223462356663646566376133346431353363616535353632313463613134303962223b733a33323a223464393039373237336633363330303537343634333537333361666534626238223b733a33323a223837383231396665646663613366303636353064373838616130353962323864223b733a33323a223235346539623932353233326136323265356536303834656635376461326233223b733a33323a223665646631613333613232373432313161383464313134393833383131336166223b733a33323a223166396638383739643763386131383836303336353736663136613639303437223b733a33323a223333636661613638663334343566366365356639383839373539383931343565223b733a33323a226363376533306232616135396239663930396561623934616531383466633664223b733a33323a226663623632633730326431393336336436373366633464306433343661363864223b733a33323a223538393264313763373333366461363533636336646138643338353864623537223b733a33323a223533636264353434336434366364636434663966393063323163366165383462223b733a33323a226434306233363839353433653132376336323939356333643137643961626138223b733a33323a226536313561653563343561613035376131336530356633656532613966323562223b733a33323a223836663336363962323265336336633838346162316432393233626432623861223b733a33323a226336396231643865383362643234343364353537613565386335636434656462223b733a33323a226165303433363238613330306635386238343539663264396266373062383163223b733a33323a223431363732343064373936383864623261393333346231356663343334666661223b733a33323a226561363834643533653763316134303833356634643361393234393264633033223b733a33323a223435303634386136626461353931633832653335653534626539393739343833223b733a33323a223765653530353136373636356335616662333437343832316333373264663765223b733a33323a223832393264643934383730633564353636666232623137313633356163383432223b733a33323a223261313563353762326665636438643266316632616664386265646332666531223b733a33323a226665643333336133303137336436346338366335623633363630656264323062223b733a33323a226433643266353834343265353733666466653039303065363636383465313365223b733a33323a223465363937663762626238663930326564623262393135393764386132323938223b733a33323a226464353361383764326466303664306666363061373136323439653338323739223b733a33323a226365653035363032613833313037323463316634376661613336373961363062223b733a33323a226638343539363630643031623033663365336638633334613338613630663539223b733a33323a223534393163623139323136343738383733666364333537393733306133626130223b733a33323a226636666133336261363065333561373930633032333764303332303861396465223b733a33323a226665323436383563383066616335323764323631313162306233363938333563223b733a33323a223234323030626631346364313138303861376136636134363962326236653539223b733a33323a223162303361346133663239383134636231633439313833623638363934633331223b733a33323a223839653466383464363464366135313531306331303439313561363261363534223b733a33323a226537323064343562376536626663396363313534646462643065616131316535223b733a33323a223633653463393566383833336365633732333635373066363036333661306432223b733a33323a223465313239313231653661633632313430663238376565333731343930656263223b733a33323a226663343436626363653137633737666433323533663330336138666662343562223b733a33323a223762666164316266393132343366623763313063616134386638336638636166223b733a33323a226662373730373431653564366536343561656631333437636538333966663034223b733a33323a223462396139306236303066383161306630653362326239333533326166356164223b733a33323a226262663263633864333936316563363363313132353030376461303864346535223b733a33323a226130376235376335353935363936363463303132363665656533656437623936223b733a33323a223633333530666633633735373537323962336165373363656435326135306534223b733a33323a226339353364353036343661366231326562363530623132306136303934666436223b733a33323a226135623664643030303830333434393731313039663132666433303932646663223b733a33323a223066626439316631653464343062333563656335363063346135306130623330223b733a33323a226466326536653337306162303930616431386565386564323564383866633262223b733a33323a226435343665643861356334383839613031393436613463663562313032613462223b733a33323a223233303661623933386635323931356236353561343437393331363035636266223b733a33323a223766373966626335383966376164653533316637656133666136623862633831223b733a33323a226234303063373731323935623230383139353161303766346463653530666465223b733a33323a223431613736313431346665396632376633656430363431343564656662383338223b733a33323a226164663462613332316163303432613830306361336334633864666565646235223b733a33323a223230653235396663656431643461343337333936306631623732346566376438223b733a33323a223637663437326338323834643530643639356233646632636362613933343331223b733a33323a226438656565386634346363316366346665393262373262616132633631383533223b733a33323a223139623632626635373361656665333162623937633138336632613263386532223b733a33323a223530643061326339353237303634376662663866613463366330326136316664223b733a33323a223165386665613434333666356430326339633930343663376661383830323730223b733a33323a226362646530393132363563656139633532343965356562366636396339306339223b733a33323a223731343635366361373436386433323930376362303339653264393663643937223b733a33323a223131323736323834663464323665363637613934376136646635396535343837223b733a33323a226434646362366262363432323531626466343162313964373266653538376637223b733a33323a223636373236393838666661653536343632613739383430373437363436313333223b733a33323a223633383038373865323466383138346364383333343235653736663563343931223b733a33323a223538616630353864653536616162396238376230616664613533393737356163223b733a33323a223836366264346237393035633433663034633935396539366631383632366662223b733a33323a226662376431306330653537386635633565666261396462363130633837373534223b733a33323a223135353065626138363731376431343066393466303931663131343534356431223b733a33323a223766353338646536346333336330646538616633373062363234366235663338223b733a33323a223337353139633964326430623462643231393635613534656464303830393566223b733a33323a223939363934373630613533643630663036303231643161323638613237613932223b733a33323a223731316666363534316231663865356539353335386165353932393530653462223b733a33323a223764303266396531333830623563303339313264613335383736306237353836223b733a33323a226363653863633363623335346339616339653434366639663039393538623330223b733a33323a223062373462613130326564313939333864636130343934613562343634646563223b733a33323a226161396236643363653934373532376363323766303236663063663935623562223b733a33323a223262633437653139306162656465346432656363363833646264353536363061223b733a33323a223566336332323331353465306536303763656238663961636166646633396236223b733a33323a223730373433386632333961653538656465396234613332656564643165623237223b733a33323a226130323162316262323661343465626331353037663262383335663838373130223b733a33323a223237633438353232643839653837643335653461663166643230653634626261223b733a33323a226538303333343036663264383262656633353532393466616262313866653661223b733a33323a226636643638303461646365343934313538613930643033396432396138356366223b733a33323a226261633831663432656137343566646532323366393664613665656465343230223b733a33323a226634363138373639623037623464616636313432623265373965663864663539223b733a33323a226630333732396437393638626331643836336531326331386431666238333362223b733a33323a226365323237613938363638303536613564383065383038303564383538306261223b733a33323a223064366438616364353835613066666534643435383762653434633131316564223b733a33323a223661646535656330653338316530363333616232366131653033303365346339223b733a33323a223930383964626638393664373663643738353730633233393165363330386464223b733a33323a223136636364643233373661353136626633323530333935623339356136306430223b733a33323a223537353261333763306237643839613338363538313334363732343132373863223b733a33323a223635333531383065633430366363363139373932336338303635326237666430223b733a33323a226236623235326133303435663834356232613231633264323165306237626134223b733a33323a223536336231663436633066313633306536353630626663653066313939326232223b733a33323a226534373030636363633536376136373938373262626364323061376634623532223b733a33323a226566346563646561313839633531656638383531313462363235373438663664223b733a33323a223531626263316137363337313238653934373064333036656663346136363630223b733a33323a226530383939653837366163313966356131303063623633316636623066353234223b733a33323a223833336662656533643831356535383330383937313236376232396137303533223b733a33323a223961396133663030333861313436356366366361363738363136303864633331223b733a33323a223133303133313331373232336362633033353565366532363631386333386366223b733a33323a226635643838623261323238313236396435396132306534396239373637633763223b733a33323a223834646361343832656361333466336562396566336635316166373634343235223b733a33323a226462373438656364613531666533613561633165326139366137666636326233223b733a33323a223039343863323864373664346538363735623038666664313434363830623337223b733a33323a223334633939313033313861346236663431326462393639636631663764383433223b733a33323a226139646638663736663066383365653331326431633437383037656635626166223b733a33323a223433616235326434616337643832356165363764383564623031656161623938223b733a33323a223438653339643332663863343037613665393464313361336431333961353436223b733a33323a226661303037303662663133636561646335636539363564633930373337343761223b733a33323a226166373136626638636337396431643638333435333861333535393763323138223b733a33323a223863376432623832643534386130383961376532633736643866313832336435223b733a33323a226332323131616636646662623633393062313838616130333231306538396435223b733a33323a226161653137366638623135343163306566633339316465303035346338613237223b733a33323a226237353163343562353864623932306539653762343734303665363362363137223b733a33323a226164656265326132393233396265383962353861303433663363663638366331223b733a33323a223761633666626266646434336630316538333030643931626466353462396466223b733a33323a226337323938356236396535323837306361393764626637383034656366666430223b733a33323a223861646561653530353237363862666334626333323261326338623164646464223b733a33323a223633376531373364383433363066336437393264353933653531626466356435223b733a33323a223933613736383361616561313632393937353538393632346466333263356266223b733a33323a223764356262623739383739306639386137613531653831376132326632383631223b733a33323a226533613563636663386130303761656266393161653364313134383366343338223b733a33323a223432623737363262363835386438366234346566626534323439376236346538223b733a33323a223535353836623064646236623032383263326330383832363265633531616431223b733a33323a226536663166383538363563323266643662306233363331366665323636626564223b733a33323a223165356333333164363332613436636465666234326337326131386436656436223b733a33323a226235633931356335666230393134643930663433653562376161623037646666223b733a33323a223332346161363534626331643136353665316136313336313531616561663563223b733a33323a223533323563633634326666373237326265383933666166326630313139666165223b733a33323a223031646461303764346664626661643537316531376562363439373533373864223b733a33323a226432316262643538363163333035333431613965306161336439356439333362223b733a33323a226132636164396463613735326363623666633336613061373737633265313233223b733a33323a223135633163303136366437623661386332623065626661333038366536633261223b733a33323a226465646166613864303333663434643866356166626537393038376130633431223b733a33323a223031333235316365323061376337326563656665643634633463613531366432223b733a33323a223238386132643137666364616235373632646631303064333830393133666139223b733a33323a223132346562623265303764366635303831343466663234316666356331353762223b733a33323a226439663338356433323132313563383462663634313762643633363539316262223b733a33323a223464396364306265316362633664333162343937623466303133356561613935223b733a33323a223536336132666366363330626434643932346565343063366164653063633030223b733a33323a223166643738633034616231633162386465663036353230353335303161316332223b733a33323a223231333462636466613166333737353261396665326437383134333062326234223b733a33323a223064353665623165353939656636663936393931353666633764646463363134223b733a33323a223633663263343938363831666536663631663238643964313239363931323363223b733a33323a223937633136383166346333316462336538313732626239376637636632623365223b733a33323a223939356534396539333534623637373431643764313032313063333237356339223b733a33323a223964303334613861663932656361366332306166393337323138643433336533223b733a33323a226338376661363133366436633035663633643935626464383765396534356433223b733a33323a226166393938323739626630353464343863336337343531353861633939633765223b733a33323a223832393035396138383331646233303037633533636431363761623934396630223b733a33323a223432653438623031363965353834343064376436336431373730663962356165223b733a33323a226362373932666539313230346664636637386236396261366434363333333738223b733a33323a226264396165356462303833366236653961663831336666323566393731323463223b733a33323a223461333037666266353237396666346235646666653563626164613639623337223b733a33323a226262663636353234333936653265343263336332313730616638346161653834223b733a33323a226130333730366237343939363633366539316562653631326639386263363663223b733a33323a226236616432653937383935633631633437363163393031326465363862353034223b733a33323a226264656130346639646134386638613432653436373238343130626134313834223b733a33323a223333646132613761663963626463356132313037633733336536613430643263223b733a33323a223865623533323135343230646664303735643061343136316164643134333533223b733a33323a223864666361346536653661623437363333393039613337613564646534326639223b733a33323a223830633735316239333261363866666338333234663037336236323761623130223b733a33323a226437383832383065626365613833346537316232363532353535633866313933223b733a33323a223462613633653633323465326165346466363939323063376630633634663537223b733a33323a223830373063313731356234623564313161663831616337396363313265616430223b733a33323a223166313537343230626633373732373763333632323962336331383135616232223b733a33323a223261383931356633336466323861396138323631373262376137626463313237223b733a33323a223130393466366332666537383136353862323833333962613966396332383938223b733a33323a226137303663306263616333323832363333646363316438653135633730616363223b733a33323a223235643036613137396466396632313463623235633564323365383864633233223b733a33323a223636386231613830623037396165626162633335343934343462653962623061223b733a33323a226366303464303162363038303166396335303961663037633132313262633431223b733a33323a226633643366663635636566646339316639393032623566646238323731303862223b733a33323a223734376261313938376136396337333565303761633666383035363931643832223b733a33323a226266666463306635623534303133613734346361623031626635303464363064223b733a33323a226532666265653561396638376266313961656338353763333363633137363734223b733a33323a223133303530353433663666623664393965633365613064373439346262643866223b733a33323a226662313866343833613062663433363638363030646662336531616232613735223b733a33323a223739666466653932656433613738306133613134653431666366373332373732223b733a33323a223562633363356335633763303735623234323538343462633763633963336663223b733a33323a223336663031663365643561313038396266386135393662376538663133376666223b733a33323a223863303336383833616361626133363337396531353131333939663930303766223b733a33323a223537316535653361303937666637366236363362363933353837313362383364223b733a33323a223061666563633734613662653762356233343436356336306637623661386339223b733a33323a226562623364633264633265366334316138386638306235643239636566343838223b733a33323a223961613861373265303566393738306430616533363033313230313461313764223b733a33323a226232623164656663353061643639373139636239396634303761653961383232223b733a33323a223665646264346435363964346132323732643566326132306236373665333939223b733a33323a226566323136613035643733346533323730353261623961343464633939376436223b733a33323a223035353130643866666130373832366138393732346165653635386634636463223b733a33323a223838633737323135323062346539363362636436306637643131356233613335223b733a33323a223533376430356539333631396330393966313234653864383261663939326230223b733a33323a226665646439333932383930613637306435626337653834356131653166643464223b733a33323a223230323264343132623961333830663432356535313366623236373763303064223b733a33323a223163386462343537633632393433326466306661326265616634386463333238223b733a33323a223233343534626361363534383932396331306334323630386566666536656337223b733a33323a223165396566646465636566333337656537386634343665393532313634396534223b733a33323a226337326162353733323335653632616339323535376461333432333937366334223b733a33323a223164656364356465643932336465646166663462336436373565616138373232223b733a33323a226532393565393131613435636533656238636565323461373265333338633633223b733a33323a223366316633386235336436373262316566636131383262363663643233663530223b733a33323a226637343563316135633838613566396133616432303138613037623564363036223b733a33323a223132613037613865386334336262313535656438376465393732393030356630223b733a33323a226365333536353063663234313736346131653038396434343437653435636163223b733a33323a226637636330623562653661356131326535383631363466333261666537313161223b733a33323a226130363838363863343165323361393831313832643238316232313333616638223b733a33323a226333356133326139343264303930376363666439323264383061663131343661223b733a33323a223235626661396630346239366332333561366433323137386530643432356131223b733a33323a223037613464316531363632383266376332336565623630643762626361303836223b733a33323a226466353261623366653233623936313561656537393537666662356262346563223b733a33323a223436636464343663393166323634653536633032393237383765396464343563223b733a33323a223436633066363034363333376362393363383431343738393133646232363662223b733a33323a223536393262633231373633653336323239323465623236643235393963323536223b733a33323a223137336138613032383733303432643733306333333633613636333166376332223b733a33323a226339643130353966656366373334623633333033303165643564663938346231223b733a33323a223036626439623337646530313664616535316639633363613761376661373732223b733a33323a223238386233616336613930333734373661613162653437383264373433353664223b733a33323a226266343034373166333038353566373662656338336365613339393063346438223b733a33323a223835393632623235363030633937633933646162333362613563326135656438223b733a33323a223266396561613162363965326532613730343231303237633734383232346132223b733a33323a226533336364653137316266346631353661656133336334343463346539326630223b733a33323a223137343331373232623839343934323034353863633938336366393235316466223b733a33323a223562613838356631303939333933393836393830316331393663373133373364223b733a33323a223264636231633666616262633037653333393231383938646263313636356634223b733a33323a223431366132643135653362356239376132303862326264656236316464653966223b733a33323a226437383238336566373961393166336638306264633739353737303137643837223b733a33323a223031346632666139373263326331306537356336313266363338643136366336223b733a33323a226638626332373661383330366164356134643536353162396365373161656531223b733a33323a226263616537666665633332366435626664373538353231313731623034633237223b733a33323a226334643565326139613635633535313464666565353439663362303636613337223b733a33323a223565616232353739633636653734363665626431393732636537323535343466223b733a33323a223661313533366366666564363966356666386266653934656535383633393865223b733a33323a223962666538656263633365363463383862646532333161333265303237313864223b733a33323a226636383362346439373330323935373033383539623736326431353835343930223b733a33323a226436363366623638636332636265643939356565303831646664303338613636223b733a33323a223330373364633262383439373637633433313432366561373563663263393334223b733a33323a226233643333663632383365353865313434353030303038626330666535326266223b733a33323a223335613463363138326463306536333666343865353862633730336465303231223b733a33323a223461616238623735633465363662383638333966326562393231643162323863223b733a33323a223635393733343864376565313465313230636431363832386134306339393532223b733a33323a223135316336663466623734343862333837666362313363643135323463643166223b733a33323a223661396334643365613737633930643439666365626365303830316630663435223b733a33323a223631323730343535653362326331373732643563313764343261353635343939223b733a33323a223237396432333233346239633164623236663932316561613932353232333634223b733a33323a223263643561633333373162363764323266333438633736666132363031663964223b733a33323a226231323461333731356533646432653362393237306638623438303962313538223b733a33323a223864653735383330373765313738393936316564363238383161346439666636223b733a33323a226436366165633863643764336335326435376431316430613637373231313866223b733a33323a223862363633363536323930373664356532346136333263313138303133303663223b733a33323a226164373564366230656430303333636537636434313361346535373365393739223b733a33323a223638313938316536303034303432383637303836626235313033363338623661223b733a33323a223631306238336364636566613231366333373762386537363836666265313139223b733a33323a223031333336636235663133396432656639393438623631663636663461653232223b733a33323a223532626461313130303336636338333862323639616463353663346531386439223b733a33323a223730333834353533643361336665343764313238316534356530396336343634223b733a33323a223234353535313539636663663562653335623032376461386136656230346532223b733a33323a223966666462626438383631323239313934616336373737313865313261666333223b733a33323a226431393930316166326337333162393362396338323934393034653139646563223b733a33323a226536623562626237623531353862666165636235323261393138363261636130223b733a33323a226266613738306533303533323236346138616335613366396664343238646635223b733a33323a223937646261633132626666373033666436626562373038613533333032363533223b733a33323a223963616666636330383264666465386336373464306430346533653235663466223b733a33323a223461303362336338613434653131373838396161383264653631373833326638223b733a33323a223861366430643339623133383638643038363366353262613939303637393031223b733a33323a223939633261653835316631323837386266633736303233313037346461353732223b733a33323a226237623234663266653665383335366264323534333832316666623963323664223b733a33323a223936303461616465666535636630346433356636316237643833326637303439223b733a33323a223164366431376537643634666237613234323166386633613335306666613866223b733a33323a226131646237376134636265353539636639393832343739336530633637393565223b733a33323a226163613162366665663961663938383331303838623462626532643136376531223b733a33323a226331303062343166383239646133386662646461633635613232326134316536223b733a33323a223561313238633265663135633265333965306530306433656565663633653331223b733a33323a226433323366356164666330323239613435396138633061663937373366643736223b733a33323a223437303565383735353039656362376338326463373532376334386166633235223b733a33323a223265366563623661323231643334333634653432656263393566633136343464223b733a33323a223937303237616331353930383463623963646339346664633632616532346632223b733a33323a226466366565323437333035386630643739373934633165613532316639396331223b733a33323a226136666532653938396239326163333934643130633538316262653161323663223b733a33323a223330326433353634666366663730616330646239353930313232393562393030223b733a33323a223230383463373638383836373061346134386430326237346239663864386134223b733a33323a223833653833306536613762323764373532646235303332643035373338343265223b733a33323a226530373063613764626133653432373436343334393239623363616434633064223b733a33323a226234633739376564666464323036373662393263346330356465363362353661223b733a33323a226461313037353039303436383935633863663735363236363934613863653162223b733a33323a223539653037663335343537626535323533363932343162623436343562343262223b733a33323a223766373366623133623430623634393065316137643035313761393331313064223b733a33323a223532383034396130626132636665613262616265393938373531383835646436223b733a33323a223762323137376462333864323532623930376137306561373731386662393237223b733a33323a223965663361633238623765633936616134653637653738366563363061373562223b733a33323a223630353237646139613530316631636335363837356661383965323630353661223b733a33323a226531333632616331623563313761386661316236353362303838393436666663223b733a33323a223532363065346562326462316363613139363765633133636535366135356461223b733a33323a226132386439353530303664643064346464373364343566376666353730633131223b733a33323a226132303634643232643139306562653932356538643532393665613333346665223b733a33323a223436346364356536303361303964613763623665303631303530383065653364223b733a33323a223833353630386530333034316665646666373830343965623332356434393832223b733a33323a226331663165393163633438306663343566633938643237663661643235646131223b733a33323a226239393735326265333032623135366265643864393565636230393132383364223b733a33323a223636363265613261333430303932343437633530343765393130376263366562223b733a33323a223366623463306563636266393162383365666632633433636433656232313031223b733a33323a226439393762393935343032373535613531646635366465376330303761643937223b733a33323a223636613830303237643738326139343632623733313831613833613737383237223b733a33323a223938333062303836393930396235373333303235353333393430323164633865223b733a33323a226330636139346236363961336666633839626139653430643831346339323532223b733a33323a223237326535633239663039613066323266353432663039646364306633303838223b733a33323a223930633531626236346365346664383938663135376366323063383161343363223b733a33323a226235313363626665666638373663323331376435376238623236653336386438223b733a33323a223731633062383338383130396665616466623236646663343066353235656532223b733a33323a226264313935623932313362343036363765396330316234303536623162363161223b733a33323a223034383162623033633332313835306266316362653366636136633063303138223b733a33323a223862333634313565623562356436353737333865306363623537633565663834223b733a33323a223661393164343064326239633363373865336431306535326434396565613865223b733a33323a226165383634343863393163663638393835336137353538343839623337653336223b733a33323a226134643439656461343166393031393233626563656636323935326535393361223b733a33323a223832653734373534306230613336616663353938393636376537363834653437223b733a33323a223335326436663564373337333730353036323464616465316439306534656330223b733a33323a223638353532643763633138306266313130623636363063326166633864336564223b733a33323a226464383062633362303766353262343831313732393538656231643565663437223b733a33323a226230646166613963366136633937333264383964393365353038336134323563223b733a33323a226531386438353163353461343439393963653263363336633866643935363832223b733a33323a223466633931646538353266353665386637323132383735663639326332363932223b733a33323a223038306333316465623261616663393366396366333066363434623366313830223b733a33323a223933356663613565373939626361373634663966643537346163303131333630223b733a33323a223232653837616566613366316132623630616330666234393065323837666634223b733a33323a223630656434663566663762633038323830666337373334396632393930666435223b733a33323a223162653038663061363731376535666635303062303039663330623466333232223b733a33323a223137343135356230646163396162646361663938303161326536623364343263223b733a33323a223533313931353266303764326433643235626564316337383236626539303431223b733a33323a226234646266353563383638633733303935306363386532353637313239646630223b733a33323a226162653131326136303165373735323939313431353536616632316334353663223b733a33323a226164373663666261373934663434373865376362353839663733353962323836223b733a33323a223235346265646433333433356531336262393262393764613664623137646631223b733a33323a223832313032653236336435373862373935383236613866386634346139383538223b733a33323a223930303330396139306331386535343633643863646264616433386564643234223b733a33323a223163333038353232383730376261616437303466656238376639663032383237223b733a33323a223839663138656531393962323836356664623666623330323264336234393263223b733a33323a223961353733636363613737613637306566633065623834356632643832373532223b733a33323a226439323261313164613430373231633436623762646532316266643566356533223b733a33323a226230366162616261356633396236383139613161336536386330353065323634223b733a33323a223735613561396466396666383963343632353763316564616263653730643561223b733a33323a223766643332616430613861383330303066653231633863323361353062616334223b733a33323a223262303238376434363061633734353835386335636631643564636462373962223b733a33323a223261343161636233363962303236323334306261646463333936316536303366223b733a33323a223766636132303765343965316237356636316330393133396231333362653630223b733a33323a223638363135306233353763666266363533313035393562366562386331316564223b733a33323a223664363131333539393732666537323831636531336333336636343931356332223b733a33323a226235373431373736373635313437316261663636656437623037316162363462223b733a33323a223163393464353236623039656661326366623933316266336338363037393063223b733a33323a226263663837643737386338303935346532383438623938303136653161336264223b733a33323a226262363237323663666330663661386630646132656532343239313833326439223b733a33323a223934343331333461346166616262613039656161376536646636326564646337223b733a33323a223936386264346337353837626565363966663737653238633131643565303031223b733a33323a223862353465333861383362653136636334353733636534336136376436323263223b733a33323a223633346534663334633237366230646634636562366533346462313763623663223b733a33323a223133366131316130663363316634303136313763306435336334623833356633223b733a33323a223939393861353230343262663764656461613236646561303832383636336463223b733a33323a226434366165396163363338326335656662306634386365393833313164376666223b733a33323a223239333561363132636232383231393534306232323535346366306437633965223b733a33323a226161323732656137613537393966326462623332326465346266336138323363223b733a33323a226263346136633334666362353236353761353339643662663866316564356335223b733a33323a223364613863666666643131643562373134666463313432653364383961666530223b733a33323a226665613232366431633964666134653136643233666463643562373931323933223b733a33323a223139303064316238363137383662666432396166383530366633343062356137223b733a33323a226365333938623135343165633565326238316531636339653030396335376338223b733a33323a226533333562653266333535396238306663343233653462306333346632313162223b733a33323a226638346135313362356433366232383036343737666433613066316566633833223b733a33323a223765616538633464346339316665653136306664623731373633653539343332223b733a33323a226335303831646638343837346236653034616665386230353235326431666432223b733a33323a223331643437616266623433646662626430353963356537386264663531656265223b733a33323a223035306239663933383133303831353337306237333262613862316561643539223b733a33323a223332396263306333613061646337366238636131373336363239366437633837223b733a33323a223430383831643637626165663637386166303063636537663964653739616262223b733a33323a226161386665643061626262343738313131393931656437306264613330663239223b733a33323a223930326131643930346634646662616235316433326135636563323765316231223b733a33323a223235396533366663663638633334333732666133636364343435653265316238223b733a33323a226135376136363961613031396566663462303036656630316439613961306639223b733a33323a223132336462636334633435646366653763326632643931346234313036633463223b733a33323a226137656235626662396435346264313862323430666562646530333432653661223b733a33323a226332376139626263633663386265386436623863633264663766343931313338223b733a33323a223738366564393831643263623736383433383866663336633530653538616538223b733a33323a226238313334653139633561663063613136393762336237323938316335396332223b733a33323a223933313266363462653333646566613062623438666364616165366661313733223b733a33323a226438636431393462303466396639613962396263326261616562663635366365223b733a33323a223434323633666638383562383865326163343766623439623861333363373063223b733a33323a223737353233616233363939616334373737363835393666396534383733386134223b733a33323a226635393431313633613465633637366562353461326434656130336137323937223b733a33323a223937666561366134633631326537626438323836613038643265306234393037223b733a33323a223330623266633135373438333532376237623433373536323265313034343336223b733a33323a226263353931386562333339356232386332323838353665633161343735626437223b733a33323a223934343437343264306639393638363830383764343632353338346535326334223b733a33323a226464613434326437633863323533393233356538656238613666323234653931223b733a33323a223033656665303962353432646236616566303639613836343066663235366237223b733a33323a223736663165363463666365366435333833646330313634373663636630663933223b733a33323a226161636432356635373763396134316239633930303732646463643939303462223b733a33323a226136306237623464353136386537366562613135343036626538323263306265223b733a33323a226634366431373465306330386635303133313264343430653630373135373837223b733a33323a226163303163663363666334656539393239303733656530386435366366623033223b733a33323a223533613236376566663333666639363232333262306533653831396432326131223b733a33323a223262626638353339353332343536333265313631633637626262326662333034223b733a33323a226237363766306337366162336234643033393631313832396433343666343162223b733a33323a223963613230323135393865653162643036646138663439346264386530623631223b733a33323a226530313162616237653634363239633433663232316631643336363064623732223b733a33323a223636303634313337353030666230666632373831613031343661643632356538223b733a33323a223661363566643331626538356136626262633662396138303065313830303035223b733a33323a226364326361393939623364643932323636346531363466323066613238616563223b733a33323a223964383234346439316265663933313639393065346438336661616462323432223b733a33323a226634326639363537326539643330366163346433646366646166646336326531223b733a33323a226235653363663862336233326461333134386463636338303865633937326265223b733a33323a223439366465343466613665373036613231633334356332346133376539616262223b733a33323a226433313737633334633565616537613737643632363333626363313439656333223b733a33323a226564616233303065383865333462646561346634316437666135333939393138223b733a33323a223365316531366166383163386130633637353237386131313433393036376233223b733a33323a223539636633663162623663316630303236396339363166323461313033313061223b733a33323a223661383363643333373735396333386138626434643336393133323833323763223b733a33323a226366613835313065613432383761623138343732313832333832366439616337223b733a33323a226333643735373331373831393361323262306637396464306438346563663430223b733a33323a226633653465663165663462633139366331666362363738653236663064313165223b733a33323a223334353162393532343762303062666665353562366131316263656439353163223b733a33323a226636316435346366623264363336393761336564653031376162393830306261223b733a33323a226333623631646634333538353035346236306262663165643238396364383530223b733a33323a223237396232366236636265653737353335623737626463396164373666366534223b733a33323a223132633436306639643034313461623239343238646163323731366434383464223b733a33323a226530643534313965373363326331656536323032353136333065316464303234223b733a33323a226438313139353039393032613563373533393566316132643739396235613039223b733a33323a226434346135643735326439376539613966323166393633393235356361653530223b733a33323a223132666235333861613932356232383238326134376532333465323431646436223b733a33323a223533656163336432306633363639346134323830363432366233613439643732223b733a33323a226133383530303439623132333930356231623865613834646635653061633838223b733a33323a223533393539393638626639343835373931353537366134326532383631386364223b733a33323a223465623531613338303030636266653338616134323364616664653061623532223b733a33323a223236343334333161356466616263333162393164643632643266316262353539223b733a33323a223938373632633130663163353239306261323839363466323664666437363937223b733a33323a223832643331373162643137306164323463323039653462353765376363633338223b733a33323a226565383663653333343561323064393139306361376231613632393865663366223b733a33323a223662323134366136633466363761393234366532343432633162636530323866223b733a33323a223634633166623934623934323565633636363030393862663031346330343034223b733a33323a223538383531306636376535663961333861653835643039626234326236383766223b733a33323a223262663935633636356431333166343034383665333035396262656139373634223b733a33323a226437636139663731373038343633323238303964373964613035393033366633223b733a33323a223439613939326661633765666531643332323738353362333261643137366365223b733a33323a226230313835326262353438333736373438346433383137326165333366333132223b733a33323a226265353665613465643536366132323764303938623464353535366461353836223b733a33323a226263613335333334653064386231636434613334623137333933336637333235223b733a33323a226261653464306634643062396265626131646132363632626433356330313835223b733a33323a223961623561666437343837653465373530316634383631646232616435326532223b733a33323a223164306130386434643630383263343861383136666430376637346332383931223b733a33323a223638323565643136633935613738643735306132383733393436306139653239223b733a33323a223135666133393537313062343235623533336231363432366535323234316531223b733a33323a223462336133633935633537613930633031373033333031666434393331393163223b733a33323a223562653466346537333037343861663266376238626431616564633235663836223b733a33323a226363663131616161313430643339633238653863313834366435333763636439223b733a33323a223364663264626235666531393835663138313937346265353435363264393265223b733a33323a223064663138616633613863326364323064623462656138376437306636393133223b733a33323a226332656232373764373363353431363465663830663930393464626536303034223b733a33323a223861323364353336653662313030653265666166303063333062303461633062223b733a33323a223532306330353732613630356633306363616466316631626239366663616163223b733a33323a223937646532643432613436623332373338626136653231663839346630356631223b733a33323a226661656434333937613538373164623833663563313539656138386265313237223b733a33323a223037633064663734653334323631626461623138656435613532633039633664223b733a33323a226635366532613461333161353136396163356261353835323431633930643138223b733a33323a223831346265343839383432373564316166636535663338353930333939303935223b733a33323a223665383130303661323533653964373964316434393031646439633861623561223b733a33323a223530306466303663393962636335326535636632393133313832303662636137223b733a33323a223531623837653138393836643333343534396330343561316632383661373362223b733a33323a226239656530383766633838623838666363343066623535306237313230306637223b733a33323a226333626332613233363831343861306432336366323163643562303563323431223b733a33323a226131616131323066326466626232386163393261656562366530333961626336223b7d733a343a2268617368223b733a36353a2261316161313230663264666262323861633932616565623665303339616263362d6333626332613233363831343861306432336366323163643562303563323431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223966333665643066383738643139656634386430306530393037396664383638223b733a33323a223231356362633131353530313637393665626137306665353134616366666130223b733a33323a226262326561373535656363623136333961363730303265656239396165633239223b733a33323a223333626535343338623434373466363965313066646465336337393630313036223b7d733a343a2268617368223b733a36353a2233336265353433386234343734663639653130666464653363373936303130362d6262326561373535656363623136333961363730303265656239396165633239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223739623761353237643233633263326163376663333036623435653737306530223b733a33323a226435643833343238643935393330633230666364373431323466626630653661223b733a33323a226336623663386136386530396136313138636564666566373962383334393438223b733a33323a223031396131643633323339663762346335653734616538643464663339656634223b7d733a343a2268617368223b733a36353a2230313961316436333233396637623463356537346165386434646633396566342d6336623663386136386530396136313138636564666566373962383334393438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333335323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a226235623335353464383265383331336562626436363230316435623263333762223b733a33323a223232623466613530383165376634366236356137643332393631653562383639223b733a33323a223437383035313734616531623562333734303531393330386235303737666339223b733a33323a223866343965333266383434383438613235663035316530366266353566323563223b733a33323a223433376666623131643135343238396430363630613062656539656233356637223b733a33323a226531663933663338626265643332613834326437336539353863343030366436223b733a33323a223063366534396232343430323864353532643435383061326436393834656533223b733a33323a226666396365633063363062323030343966646339316134333436383037336564223b733a33323a223465333132383763343534343630396166633034666234626338653935376433223b733a33323a223637653361336633303266643734393734663264383162336161626435653435223b733a33323a223737623832613630616533656333306566343933373532663831343835623432223b733a33323a223539336662303831396566386162633831336666323831633164623130343233223b733a33323a226138643139376138303939303361643432323232633165333335376134353433223b733a33323a223762333533393561393666623230663932303236346632333137363062363861223b733a33323a223461643963613339373737613866363734333238376335656330376139643166223b733a33323a223234396334613831313063663839353435343333306532393735346536303134223b733a33323a223131653735633963366365613833633132613265666433653538643163376161223b733a33323a223661613230636636366565633434363963353138343933633732336236663232223b733a33323a223265323539633162363663626665323030656430316333373766383532306433223b733a33323a223631333131346334623134333162643064323866356665613436663339656438223b733a33323a223037326132356539363934636538383364323964313666346533333830633563223b733a33323a223938383035643038663763323938636463306538306265626639303139653762223b733a33323a223033623961316531623337373735636432376563663261643136653665393531223b733a33323a223437363237323564623130633465656433336630386639306464343262333861223b733a33323a226563623133363564303834383539663434373737343836353733363539616132223b733a33323a226530626664623965323138343138373237303736383434353463363937356234223b733a33323a226134373235373435613934373536323066356233393934363131633536326338223b733a33323a223736623332643930386665626665326133363235383666666164623662653262223b733a33323a226139663333363965656135626362656361356433653863303935613865626261223b733a33323a223533353331313636333532316531323936373563623163386633633262343139223b733a33323a226263363030316137666434636366343362346430383134623261643433323330223b733a33323a223230613563363665366131653439343339323331333730646339663738393839223b733a33323a223564653666613636613861346130366431303965653737643665613162643132223b733a33323a223935646232663935383235306663323337663936616532356631633366646336223b733a33323a223634343535323166323133313535326662643034626164353237393530356638223b733a33323a223331613066643363393734356535653032656232353034643066323136663066223b733a33323a226635313931326361383462626635353334343637336366613332383338663736223b733a33323a223235613365336532326362323939613664396134303961666132383735633632223b733a33323a223165376231613566623230313534356437366536383938653061666232366261223b733a33323a226636626239386338343861386533313236663739326534313433643666613436223b733a33323a223765383165373335326462353738316363373233623531643538333962336136223b733a33323a223564616666623630346137393162333235353134666232333166393236633836223b733a33323a223732376361666531646365316231666561653762323132396565386664373766223b733a33323a226339333663353066326361303635333434343866663436643964653464356339223b733a33323a223363616239663437373864616465646335616137656137303839616238323031223b733a33323a226135303531336534616636376663363237363363393661326462353666363938223b733a33323a223937353966343034306261383361363863303535646433333064303665383838223b733a33323a226533326464346337353761633531623539343731633737383264343233643132223b733a33323a223132623431313039343861626465383833326439343130373933643664353465223b733a33323a223563343739643437313861393838336333393666376235366430323037643732223b733a33323a226366393564643630333962353836346634363330346630366165393334313634223b733a33323a223935613363303137373662383562303634383763666335343761383335633437223b733a33323a223665653638323361313031636536366362346165303930313564613864633030223b733a33323a223930313733613839326666333338316630353663353366313130623536333664223b733a33323a226331656666313935316436376231653137646333663963633137653164613566223b733a33323a223339663233333739383036343461346235616639646435343266633538633066223b733a33323a223333666431373838356465353462383434333634653930393137323633333965223b733a33323a223363616163356136326638303731323163366135663833623161333065356563223b733a33323a226364326262386566376165356666646132386432353733373330613564326630223b733a33323a223032326433333835343061663235393864623736366663633037356462356263223b733a33323a223963333363336166636230343939376336353137613932353738653330303464223b733a33323a223665663335306661376464303061373263326637663364323762653661356539223b733a33323a226466333338323862313734663461316432303632303337633739386565656637223b733a33323a226630396439396538653964353235323938306661633164663930643334663733223b733a33323a223033336264643237643530326466633735353237653432616135313662613635223b733a33323a226663633932623139373765343634613766333061366563393633316539313631223b733a33323a226264343065656162363763643161373166333839303965346164373132333636223b733a33323a223365613739373566343862306562386132353861636565373439346563346132223b733a33323a223166323336663831656534393034346634356331303864613239376365323931223b733a33323a226563363434343963376162303761356338666236356165343565613831643964223b733a33323a223533376162636538346430306332376234626666653730383264346538383132223b733a33323a223530366365313738346666353236663163333535626437613632343534636232223b733a33323a226666336139636538363135663732633135383838313061626433376162393635223b733a33323a223338356434626565643561373433613331623731663730326131666631393231223b733a33323a223139396137323331633935656135363632636632393561653839393866383034223b733a33323a226565613262653331356534646563346134323030333463626231666635653438223b7d733a343a2268617368223b733a36353a2265656132626533313565346465633461343230303334636262316666356534382d3139396137323331633935656135363632636632393561653839393866383034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619346337);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('b1811np61o9fhdl1rc47ge69c6', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383931333834322e3334303536383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226866726733703062733635346536676b696864306a746b616731223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383931373433323b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226637633634633337333062353864336437363533346665343437396262643735223b733a33323a223361613831383933626335663933656330646364643238626633646263353763223b7d733a343a2268617368223b733a36353a2233616138313839336263356639336563306463646432386266336462633537632d6637633634633337333062353864336437363533346665343437396262643735223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618913846),
('iopp8qt7diq4sstl5bn4tr5q8j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383931333832302e3338323239333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696f707038717437646971347373746c35626e3474723571386a223b7d7d, 1618913825),
('qtliju76gs8or0718ieiqvb9f0', 0x5f5f4c616d696e61737c613a393a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383932323036322e3134323338393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2231346a65356263746c6863366d71306569636a3562343961366c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383931383334363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383932353631303b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383932343831313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383932353533343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383932353536333b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383932343835363b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383932343735393b7d7d72656469726563745f75726c7c733a32383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223635343931306331653430363439343962326538636433636636316235623434223b733a33323a226137656462653862613131313564653830393130656132623239383730303764223b7d733a343a2268617368223b733a36353a2261376564626538626131313135646538303931306561326232393837303037642d3635343931306331653430363439343962326538636433636636316235623434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223835653135386430663632663635646630386537323335613761376362613738223b733a33323a223665356361656463373532383064613531613730373838303830333638353534223b733a33323a223034396366373831386131623466363330353566383064376536303834393634223b733a33323a223364343237363661323966653533633362336130373539313934363536313965223b7d733a343a2268617368223b733a36353a2233643432373636613239666535336333623361303735393139343635363139652d3034396366373831386131623466363330353566383064376536303834393634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223834653632633064386632643234623961303330343965356463386637633830223b733a33323a223863373934636566306236336163323664333631376466386335303162363064223b733a33323a226133366466373834643932386138613364633862646135343031356265616661223b733a33323a226232623062366564386566613632323065323131333434613566313565616233223b733a33323a223733646634303664323937353933616535393931383537313734353963336334223b733a33323a226337633061373337646236323837316635376165616431643161626434646462223b733a33323a223462356166333737383265616130313863313332646439316663313236626534223b733a33323a223138646162306333393031636234343165323337623764613732303666336334223b733a33323a223430653361346532336538636435666330653761336364333233383335333233223b733a33323a226561623837333336333566363665396466386366306537656535313436313162223b733a33323a226231353666326535363937323262663234313361663931663766373831373531223b733a33323a223030353633366237633132386665336537363437363536623534393833313537223b733a33323a223234356637363762343730656363636332663462333334333331393638646665223b733a33323a223939306135393132653263633161666633386663633830613263626164393566223b733a33323a223363663164313633646362623164313238323030346462656361613364323932223b733a33323a226336643737376437623438656139646433333439656436623939366463366439223b733a33323a226430383965663866663135616638613031353532376438646136646136346664223b733a33323a223835636666353734383830346334306637663861326535303333313732393238223b733a33323a223263323361616337336439343931333538393334326631626537306134366234223b733a33323a223764393936346639363961393336663637333862336639326563623732633235223b733a33323a226236643532653632303330346130316638636334376263333234613461323466223b733a33323a226338656237613864336631383838366230653833633866323532653264333435223b733a33323a226532363037363432646531623666353162626336306132306131346436346537223b733a33323a223532303236643438333939656262316438376333333033323838343137646561223b733a33323a223565336438666433643830396230396337306537643662633338366266376337223b733a33323a223036313665633036386438653763643533326466623837633034333737616435223b733a33323a226638613163643235616437613339386661383035623435373663666466313239223b733a33323a223332636238316531373365363335333536343135646438356637646436323864223b733a33323a223234616433633564326133396136626465326362316532346137366533333034223b733a33323a226365386235663930393964363939653634333965616161326464383637666430223b733a33323a223662333732616239373331353933663066396333623631313034326563376139223b733a33323a223433623830363335626630366464626336633964363462643835613537316331223b733a33323a223466616634623135333365316165343765353063356537643534633831646163223b733a33323a226336643636316164623937643436646638303130326135346432366435653363223b733a33323a223633316561613031386263633635316331636539613664396262356664333431223b733a33323a223430626436613735366136383334383365373130396466303763386565333366223b733a33323a223865356264323236333538623331316162373031313137363935343639646431223b733a33323a223737613831633337366161386632346136386264393337373361663331616238223b733a33323a223764333533643530373262623034626431613465626235623065356538623662223b733a33323a223739353039646633636231393439326234653965636561663034383261333732223b733a33323a223865636239383563336534666635306437353439303361386136373362613762223b733a33323a223765616265613836663333633439623830373037303763383130646534643732223b733a33323a226339336132316631646463363239393865643765393534653531636665336239223b733a33323a223966346132623566663763633161663737343136643439656365653236383038223b7d733a343a2268617368223b733a36353a2239663461326235666637636331616637373431366434396563656532363830382d6339336132316631646463363239393865643765393534653531636665336239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223965326531383665343434336535396630343438323936386165666137303538223b733a33323a223438663966326561346137613361656335663238363433373738656334373833223b733a33323a223363323934663037626164386432386663646435343839383837663636653836223b733a33323a223130623763643331646364343461363632623664386663653561376332663061223b733a33323a226439653863336361613034613033653766356239356362636632663239623434223b733a33323a223032663062633064323336643434316237373166653266626566653739656136223b733a33323a223965386333393533303731643737316233303064376531313536613161393536223b733a33323a223463316336353239346533656135353134626265663961333932306366616135223b733a33323a223864316566366639303332623932346539336263336239616465623032396362223b733a33323a223639343562316534616238643037333061613133643436303735643936323365223b733a33323a223739313163346430303132633533636366393831346534613230366638613937223b733a33323a223338613035386437386166343134376531363935653865373664633139613430223b733a33323a223166333861643931613566386166313338333766626535633934396535636135223b733a33323a223964323864393563366235366534356534366534313762646332663465376433223b733a33323a226331326464366437653538353536653632666134386136383834636564303461223b733a33323a223830373637343861643162376431383565333863646361613036373739323837223b733a33323a226461646639633862656532383763336239633333356631363335313833633964223b733a33323a226133373662386266613436663639363361346665303662666238643335333863223b733a33323a223063373037393564663734653361616139656238626633646633346333356161223b733a33323a226366663063336231383835343166366539313333333162623432333466376533223b733a33323a226533326534623238656137313666333239303961666238316434653832393539223b733a33323a223835353930366261636534313362356161313861646433323161333533323033223b733a33323a223939613234353961353666316266363039613962343263396665366637386136223b733a33323a223365623966623663656363666630386462303162666563623962616262316563223b733a33323a223063666666663566663236333064633763666332626361343961663838613164223b733a33323a223636373266646132353162313964646663626334626364373564336634383634223b733a33323a223162303162303963396163313031383139383232633462316164336434383934223b733a33323a223732643561633634646633366361313538653235653439333863363333316165223b733a33323a223038343333306236333234333430306438343030356134636534393164376165223b733a33323a223032656335316238663335333061613866633638343564613932653265323738223b7d733a343a2268617368223b733a36353a2230326563353162386633353330616138666336383435646139326532653237382d3038343333306236333234333430306438343030356134636534393164376165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313637323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223961366133303733333364646638383932313964633533376363393734343861223b733a33323a226633656362636633633262366635616462353839613966303862393565396239223b733a33323a223130343262313634646463633231316435653636356435323266626366623461223b733a33323a223162663062333865623131663734346130656130333765373266323564343537223b733a33323a223839333139353363643164326436396538356134326664303632656138616266223b733a33323a223430643737666532666531393038336135373265353131323865613833386261223b733a33323a223765643039663132656437343338316230376265646165393539623131646663223b733a33323a226231306566346338313338336635313330383535613364356465343338393938223b733a33323a223135366336373765663331333034373165316665373262343038643139613466223b733a33323a226231313163393966666433643331346332353361656233336436316539303966223b733a33323a223837373864646165313339333835313961333739343939643463633732386237223b733a33323a223436366564613439633261613432663334663535643738363734346239313533223b733a33323a226639623361346432383935313463306338666435626562306666363766346464223b733a33323a226164636331363632636365333639616265656338643164663661396566363039223b733a33323a223634363164616339396333373132616536303733306532366266653539633737223b733a33323a226566623832373436356361346130343931396234636464663436393263353437223b733a33323a223366636565626137343863623831376164383766366637666237663938336536223b733a33323a223861613366656436616263623335653730633765386564343833333066633933223b733a33323a223232653066383834396535396439323433396133353333646662383535316366223b733a33323a226437663261656330616133393431313331633134633736643563323239636437223b733a33323a223630666534323932343130323930313430373338653863653830376133666536223b733a33323a223261386639376533636130363762646237633437666663346532373238323035223b733a33323a226462333739343131383433626439386633353130336339366265636364613561223b733a33323a223363323464646538643630393838623463313664303537383631383734373337223b733a33323a226430316437663163323734646534316465323032376434376564666466356662223b733a33323a223861373431636162623135633963613162343130623332323232326531383661223b733a33323a223231623730663563336639376364363535373933646362346262393731316138223b733a33323a223932643638363539336264333333356130653936636665323632623933336132223b733a33323a226236653463386438323763323635333462363434616333633734376166343935223b733a33323a226465366563646137366235363030343034333533353532373436396337653765223b733a33323a223262613538326563303036313561653862616564636664623863626631306539223b733a33323a223435316130316262666536323537666639663262333164633665373631393534223b733a33323a223963343036656434623439393861633137336430376461613731393261363931223b733a33323a226638616661646661336463363865373761303138633063663030653261636131223b7d733a343a2268617368223b733a36353a2266386166616466613364633638653737613031386330636630306532616361312d3963343036656434623439393861633137336430376461613731393261363931223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223337373138316635323530656565373465613534313830653165666634626666223b733a33323a223531306466356230343862366465636231663030306564393839306466396466223b733a33323a223064623665306432336332373939373032336331636365356138643131333436223b733a33323a226339353664623237633631356561386264306461303261343437346266626439223b7d733a343a2268617368223b733a36353a2263393536646232376336313565613862643064613032613434373462666264392d3064623665306432336332373939373032336331636365356138643131333436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223864636165303865386261343234393434353437356238336464646334643632223b733a33323a223261393735393766633966373336366232313461313935643664366266646365223b7d733a343a2268617368223b733a36353a2232613937353937666339663733363662323134613139356436643662666463652d3864636165303865386261343234393434353437356238336464646334643632223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618922062);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"nassima.oukhelifa@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"e_commerce \"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('version', '\"3.0.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'nassima.oukhelifa@gmail.com', 'nassima', '2021-04-20 10:08:37', '2021-04-20 10:08:38', '$2y$10$Eg8MRTHOp7gfABfGeDvk2OiBTjs3K1QIYEas/dL4hRp8gOY4sUk4C', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('default_resource_template', 1, '\"\"'),
('locale', 1, '\"fr\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(11, 13, 1, NULL, 'literal', '', 'Client', NULL, 1),
(12, 15, 1, NULL, 'literal', '', 'Commande', NULL, 1),
(13, 13, 656, 15, 'resource', NULL, NULL, NULL, 1),
(14, 15, 656, 13, 'resource', NULL, NULL, NULL, 1),
(15, 16, 1, NULL, 'literal', '', 'Produit', NULL, 1),
(16, 16, 4, 16, 'resource', NULL, NULL, NULL, 1),
(17, 15, 657, 15, 'resource', NULL, NULL, NULL, 1),
(18, 16, 657, 15, 'resource', NULL, NULL, NULL, 1),
(19, 14, 1, NULL, 'literal', '', 'Client', NULL, 1),
(20, 14, 656, 15, 'resource', NULL, NULL, NULL, 1),
(21, 17, 1, NULL, 'literal', '', 'Commande', NULL, 1),
(22, 17, 656, 13, 'resource', NULL, NULL, NULL, 1),
(23, 18, 1, NULL, 'literal', '', 'Produit', NULL, 1),
(24, 18, 4, 17, 'resource', NULL, NULL, NULL, 1),
(25, 17, 657, 18, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://www.disit.org/km4city/schema#', 'km4c', 'Retail Trade', ''),
(6, 1, 'https://circuit-achat.cnam.fr/onto/ca#', 'ca', 'ecommerce', ''),
(11, 1, 'https://ecommerce.univ-paris8.fr/onto/emc#', 'emc', 'ecommerce', ''),
(12, 1, 'https://ecommerce.univ-paris8.fr/onto/ecm1#', 'emc1', 'ecommerce 3', ''),
(15, 1, 'https://ecommerce.univ-paris8.fr/onto/emc2#', 'ecm2', 'ecommerce4', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

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
-- Contraintes pour la table `client-commande`
--
ALTER TABLE `client-commande`
  ADD CONSTRAINT `FK_N_Client` FOREIGN KEY (`FK_N_Client`) REFERENCES `clients` (`N_Client`),
  ADD CONSTRAINT `FK_N_Commande` FOREIGN KEY (`FK_N_Commande`) REFERENCES `commandes` (`N_Commande`);

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `FK2_N_Commande` FOREIGN KEY (`FK2_N_Commande`) REFERENCES `commandes` (`N_Commande`),
  ADD CONSTRAINT `FK_N_Produit` FOREIGN KEY (`FK_N_Produit`) REFERENCES `produit` (`N_Produit`);

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
