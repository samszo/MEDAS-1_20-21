-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 19 avr. 2021 à 18:49
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
-- Base de données : `omk`
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
(1, 'items', 1, 1, 'Titi', 'Titi\nTweety\nAmi de Grominet\nBird'),
(2, 'items', 1, 1, 'SuckerPunch', 'SuckerPunch\n110'),
(3, 'items', 1, 1, 'Princesse Mononoké', 'Princesse Mononoké\nPrincess Mononoke\n135'),
(4, 'items', 1, 1, 'Le voyage de Chihiro', 'Le voyage de Chihiro\nSpirited Away\n122'),
(6, 'items', 1, 1, 'Emily Browning', 'Emily\nBrowning\n1988-12-07\nEmily Browning'),
(7, 'items', 1, 1, 'Ariel Hauts-de-Rueil', 'Ariel Hauts-de-Rueil\n58 avenue de Fouilleuse\nReuil-Malmaison\n92500\nAriel Hauts-de-Rueil');

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
(1),
(2),
(3),
(4),
(6),
(7);

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

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('NmdmcmwHSoxhEfSWlQYMn2RVK2t9IvOp', 2, '2021-03-08 17:03:09', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(244, 1, 9, 'accompanying', 'Accompanying', 'Be present or associated with a person.'),
(245, 1, 9, 'acquaintanceOf', 'Acquaintance Of', 'Any friend or an acquaintance tie among occupants.'),
(246, 1, 9, 'adjacentTo', 'Adjacent To', 'Nearest in space or position; immediately adjoining without intervening space or element; an exact neighbour.'),
(247, 1, 9, 'assignedRoute', 'Assigned Route', 'A set of connected spaces(normally in the form of rdf:list) assigned to a social unit.'),
(248, 1, 9, 'connectedTo', 'Connected To', 'Being joined by a common element; more specificially, a physical connection between two space elements.'),
(249, 1, 9, 'context', 'Context', 'The circumstances that form the setting for an event, statement, or idea, and in terms of which it can be fully understood and assessed (Oxford Dictionary of English).'),
(250, 1, 9, 'excludedFor', 'Excluded For', 'Expresses the removal of any physical space or point of interest for the consideration of any social unit.'),
(251, 1, 9, 'familiarWith', 'Familiar With', 'States the familiarity of any social unit with a physical space or point of interest.'),
(252, 1, 9, 'forPerson', 'For Person', 'A property to express a foaf:Person in a n-ary relation for sbeo:Parameter.'),
(253, 1, 9, 'hasAbility', 'Has Ability', 'A property to express a sbeo:Ability in a n-ary relation for sbeo:PersonAbility.'),
(254, 1, 9, 'hasActivityStatus', 'Has Activity Status', 'The status of an activity being performed by a social unit.'),
(255, 1, 9, 'hasAvailabilityStatus', 'Has Availability Status', 'The status of something in terms of availability. For example, available or unavailable.'),
(256, 1, 9, 'hasDescription', 'Has Description', 'Expresses a descriptive information about any specific space, point, activiy, event or device.'),
(257, 1, 9, 'hasDeviationState', 'Has Deviation State', 'A deviation status of a person depending on how ofthen one deviates from the proposed route.'),
(258, 1, 9, 'hasFitnessStatus', 'Has Fitness Status', 'A fitness status is associated with a person that represent the quality of being suitable for a specific activity. There are three different levels of fitness levels are introduced that can be extended according to the needs of the application. These are \'Fit\', \'Exhausted\' and \'Injured\'.'),
(259, 1, 9, 'hasImpact', 'Has Impact', 'A property to express the impact of a particular sbeo:Activity or sbeo:Event.'),
(260, 1, 9, 'hasIntensity', 'Has Intensity', 'A property to express the intensity of a particular sbeo:Activity or sbeo:Event.'),
(261, 1, 9, 'hasMember', 'Has Member', 'Expresses one of the persons who compose a social group.'),
(262, 1, 9, 'hasMotionState', 'Has Motion State', 'The motion state of a person.'),
(263, 1, 9, 'hasNavigationalState', 'Has Navigational State', 'A navigational state of a social unit while following any path.'),
(264, 1, 9, 'hasNavigationalType', 'Has Navigation Type', 'A type of navigation provided to a person to perform a specific activity.'),
(265, 1, 9, 'hasQuality', 'Has Quality', 'A property to express a quality of something in terms of different levels. For example, good, bad, medium, perfect, mild, and so forth.'),
(266, 1, 9, 'hasSeverity', 'Has Severity', 'A property to express a sbeo:Severity in a n-ary relation for sbeo:ActivitySeverity or  sbeo:EventSeverity.'),
(267, 1, 9, 'installedIn', 'Installed In', 'Place or fix (equipment or machinery) in position ready for use (Oxford Dictionary of English).'),
(268, 1, 9, 'leadsTo', 'Lead To', 'Be a means of access to a particular space or point.'),
(269, 1, 9, 'locatedIn', 'Located In', 'States the location of any social unit, activity, event, physical space, or a point of interest at any other physical space.'),
(270, 1, 9, 'lower', 'Lower', 'Associates the lower storey in a building.'),
(271, 1, 9, 'meansOfNotification', 'Means of Notification', 'A method of notifying a social unit.'),
(272, 1, 9, 'notificationPreference', 'Notification Preference', 'A notification preference for any kind of social unit.'),
(273, 1, 9, 'ofActivity', 'Of Activity', 'A property to express a sbeo:Activity in a n-ary relation for sbeo:ActivitySeverity.'),
(274, 1, 9, 'ofEvent', 'Of Event', 'A property to express a sbeo:Event in a n-ary relation for sbeo:EventSeverity.'),
(275, 1, 9, 'ofSpace', 'Of Space', 'A property to express a sbeo:Space in a n-ary relation for sbeo:Parameter.'),
(276, 1, 9, 'partOf', 'Part Of', 'Expresses a physical space as a part or a fragment of another physical space. For example, a block of apartments can be a part of apartment building, etc.'),
(277, 1, 9, 'performedBy', 'Performed by', 'Expresses an activity carried out by a social unit.'),
(278, 1, 9, 'player', 'Player', 'It express an agent that plays a role in a specific context.'),
(279, 1, 9, 'responsibleTo', 'Responsible To', 'Having an obligation to do something, or having control over or care for someone, as part of one\'s role (Oxford Dictionary of English).'),
(280, 1, 9, 'role', 'Role', 'Expresses a role of an agent.'),
(281, 1, 9, 'routePreference', 'Route Preference', 'Route preference of a social unit to perform an activity.'),
(282, 1, 9, 'routeType', 'Route Type', 'This property is used to express the type of a route in terms of graph-based routes, such as Shortest Path, Simplest Path etc.'),
(283, 1, 9, 'upper', 'Upper', 'Associates the upper storey in a building.'),
(284, 1, 9, 'uses', 'Uses', 'Expresses a momentary information about a physical space or a point being used by a social unit.'),
(285, 1, 9, 'accommodationCapacity', 'Accommodation Capacity', 'The accommodating capacity (in terms of persons) of a particular space.'),
(286, 1, 9, 'atTime', 'At Time', 'The time at which an activity or event occurred.'),
(287, 1, 9, 'cost', 'Cost', 'A numeric value associated with an edge or a complete route(path). It is also reffered to as a weight.'),
(288, 1, 9, 'currentOccupancy', 'Current Occupancy', 'The current occupancy (in terms of persons) of a particular space.'),
(289, 1, 9, 'dynamicDescription', 'Dynamic Description', 'A dynamic or momentary information about a specific activity, event, social unit, or a space.'),
(290, 1, 9, 'endedAtTime', 'Ended At Time', 'The time at which an activity ended.'),
(291, 1, 9, 'hasValue', 'Value', 'Provides a value that is a direct representation of an entity.'),
(292, 1, 9, 'hasXTimesDeviated', 'Has X Time Deviated', 'Number of times a social unit is deviated while following the provided path.'),
(293, 1, 9, 'id', 'Identification Number', 'An unique identification number of something such as, social unit, device, etc.'),
(294, 1, 9, 'length', 'Length', 'The measurement or extent of something from end to end (Oxford Dictionary of English).'),
(295, 1, 9, 'number', 'Has Number', 'A number assigned to anything.'),
(296, 1, 9, 'size', 'Size', ' the relative extent of something; a thing\'s overall dimensions or magnitude (Oxford Dictionary of English).'),
(297, 1, 9, 'speed', 'Speed', 'The average speed of a person.'),
(298, 1, 9, 'speedFactor', 'Speed Factor', 'A multiplying factor that may affect the speed of person while passing through a specific space.'),
(299, 1, 9, 'startedAtTime', 'Started At Time', 'Start is when an activity is deemed to have been started by an entity, known as trigger.'),
(300, 1, 9, 'staticDescription', 'Static Description', 'A static or a fix information about any activity, event, space, social unit, or point of interest.'),
(301, 1, 9, 'timeDuration', 'Time Duration', 'The length of time during which any activity or event lasts.'),
(302, 1, 9, 'width', 'Width', 'The measurement or extent of something from side to side (Oxford Dictionary of English).'),
(325, 1, 17, 'prixSeance', 'Prix Seance', NULL),
(326, 1, 17, 'dateSeance', 'Date Seance', NULL),
(327, 1, 17, 'horraireSeance', 'Horraire Seance', NULL),
(328, 1, 17, 'nomFilm', 'Nom Film', NULL),
(329, 1, 17, 'dureeFilm', 'Duree Film', NULL),
(330, 1, 17, 'dateNaissanceActeur', 'Date de Naissance Acteur', NULL),
(331, 1, 17, 'nationaliteActeur', 'Nationalite Acteur', NULL),
(332, 1, 17, 'nomActeur', 'Nom Acteur', NULL),
(333, 1, 17, 'prenomActeur', 'Prenom Acteur', NULL),
(334, 1, 17, 'nomCinema', 'Nom Cinema', NULL),
(335, 1, 17, 'adrCinema', 'Adresse Cinema', NULL),
(336, 1, 17, 'villeCinema', 'Ville Cinema', NULL),
(337, 1, 17, 'cpCinema', 'CP Cinema', NULL),
(338, 1, 17, 'nbPlacesSalle', 'Nb Places', NULL),
(339, 1, 17, 'nomClient', 'Nom Client', NULL),
(340, 1, 17, 'prenomClient', 'Prenom Client', NULL),
(341, NULL, 17, 'adrClient', 'Adresse Client', NULL),
(342, NULL, 17, 'cpClient', 'CP Client', NULL),
(343, NULL, 17, 'villeClient', 'Ville Client', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 1, NULL, NULL, 'Titi', 1, '2021-03-12 13:08:58', '2021-03-12 13:08:58', 'Omeka\\Entity\\Item'),
(2, 1, 56, 3, NULL, 'SuckerPunch', 1, '2021-04-19 13:43:02', '2021-04-19 13:43:02', 'Omeka\\Entity\\Item'),
(3, 1, 56, 3, NULL, 'Princesse Mononoké', 1, '2021-04-19 13:44:35', '2021-04-19 13:46:13', 'Omeka\\Entity\\Item'),
(4, 1, 56, 3, NULL, 'Le voyage de Chihiro', 1, '2021-04-19 13:45:34', '2021-04-19 13:45:54', 'Omeka\\Entity\\Item'),
(6, 1, 419, 5, NULL, 'Emily Browning', 1, '2021-04-19 18:45:47', '2021-04-19 18:45:47', 'Omeka\\Entity\\Item'),
(7, 1, 447, 6, NULL, 'Ariel Hauts-de-Rueil', 1, '2021-04-19 18:47:02', '2021-04-19 18:47:02', 'Omeka\\Entity\\Item');

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
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(262, 1, 8, 'CinemaBuilding', 'Cinema Building', 'A building in which movies are shown.'),
(263, 1, 9, 'Ability', 'Ability', 'Possession of the means or skill to do something (Oxford Dictionary of English).'),
(264, 1, 9, 'AbilityToHear', 'Ability To Hear', 'An ability to hear.'),
(265, 1, 9, 'AbilityToRun', 'Ability To Run', 'An ability to run.'),
(266, 1, 9, 'AbilityToSee', 'Ability To See', 'An ability to hear.'),
(267, 1, 9, 'AbilityToTalk', 'Ability To Talk', 'An ability to talk.'),
(268, 1, 9, 'AbilityToTouch', 'Ability To Touch', 'An ability to touch.'),
(269, 1, 9, 'AbilityToUseStairs', 'Ability To Use Stairs', 'An ability to use the stairs. Note that the people on the wheelchair are not considered to have this ability no matter the stairs have a stairlift and a ramp.'),
(270, 1, 9, 'AbilityToWalk', 'Ability To Walk', 'An ability of a person to walk. A person who is using crutches is also considered to have this ability.'),
(271, 1, 9, 'ActiveFireProtectionDevice', 'Active Fire Protection Device', 'It is an integral part of the fire protection used as a first response to minimize the spread of fire and related effects.'),
(272, 1, 9, 'Activity', 'Activity', 'A process that a person, group of persons, or machine does during a specific amount of time, such as visiting, shopping, etc.'),
(273, 1, 9, 'ActivityImpact', 'Activity Impact', 'A parameter to express the impact of an activity on a specific person (or type of persons) in terms of any specific value or a type.'),
(274, 1, 9, 'ActivitySeverity', 'Activity Severity', 'A parameter to express the severity of an activity for a specific person (or type of persons) in terms of  potential severity levels.'),
(275, 1, 9, 'ActivityStatus', 'Activity Status', 'It expresses the status of a specific activity being performed by a person.'),
(276, 1, 9, 'AlertingDevice', 'Alerting Device', 'Alerting devices are those devices that are used to react to normal as well as alarming situations to let people know that some specific condition is occuring.'),
(277, 1, 9, 'AlertingDeviceForImpairedPerson', 'Alerting Device For Impaired Person', 'An alerting device that is used to assist or notify people with impairments during a specific circumstance.'),
(278, 1, 9, 'AlzheimersDiseasedPerson', 'Alzheimer\'s Diseased Person', 'A person having an Alzheimer\'s disease.'),
(279, 1, 9, 'Apartment', 'Apartment', 'A suite of rooms usually on one floor of an apartment house (Cambridge English Dictionary).'),
(280, 1, 9, 'AppartmentBuilding', 'Appartment Building', 'A set of one or more buildings that contain apartments in it.'),
(281, 1, 9, 'AssemblyPoint', 'Assembly Point', 'A place where people in an office, etc. should go if there is an emergency, for example, a fire (Cambridge English Dictionary) .'),
(282, 1, 9, 'AudioDescription', 'Audio Description', 'A type of description in which sounds such as voices, are used to provide the information about any entity.'),
(283, 1, 9, 'AutonomousMobilityPerson', 'Autonomous Mobility Person', 'A person who can walk on his/her with a help of a non-motorised device, e.g. crutches.'),
(284, 1, 9, 'AvailabilityStatus', 'Availability Status', 'It expresses the status of something that is either available or not.'),
(285, 1, 9, 'BlindPerson', 'Blind Person', 'A person who has lost the vision completly and can neither see naturally nor with the help of any device.'),
(286, 1, 9, 'BuildingEntrance', 'Building Entrance', 'A logical point that is used to represent the entrance to a building.'),
(287, 1, 9, 'BuildingExit', 'Building Exit', 'A logical point that is used to represent the exit of a building.'),
(288, 1, 9, 'ChemicalSpill', 'Chemical Spill', 'A hazardous event that happens due to the spillage or leakge of any toxic chemical in the building.'),
(289, 1, 9, 'CinemaBuilding', 'Cinema Building', 'A building in which movies are shown.'),
(290, 1, 9, 'Classroom', 'Classroom', 'A room, typically in a school, in which a class of students is taught (Oxford Dictionary of English).'),
(291, 1, 9, 'ColourBlindPerson', 'Colour Blind Person', 'A person having the decreased ability to see color or differences in color.'),
(292, 1, 9, 'Congestion', 'Congestion', 'An event that happens at bottlenecks when the flow of people increases than a provided limit due to herding (and similar phenomena of human behaviour), especially during an emergency evacuation process.'),
(293, 1, 9, 'CorridorEntrance', 'Corridor Entrance', 'A logical point that is used to represent the entrance to a corridor.'),
(294, 1, 9, 'CorridorExit', 'Corridor Exit', 'A logical point that is used to represent the exit of a corridor.'),
(295, 1, 9, 'CorridorSegment', 'Corridor Segment', 'A fragment or an atomic element of a corridor.'),
(296, 1, 9, 'DayCare', 'Day Care', 'A place where infants and young children are provided a supervision and care of during the daytime, particularly so that their parents can hold jobs.'),
(297, 1, 9, 'Description', 'Description', 'A representation and detail of a person, object, or event. It is used to describe the details of anything.'),
(298, 1, 9, 'DeviationState', 'Deviation State', 'It models the user\'s deviation state from one\'s proposed route. For example, NoDeviate, RareDeviate, OftenDeviate, and TooOftenDeviate.'),
(299, 1, 9, 'Device', 'Device', 'A thing made or adapted for a particular purpose, especially a piece of mechanical or electronic equipment (Oxford Dictionary of English).'),
(300, 1, 9, 'DisplayScreen', 'Display Screen', 'A display screen is an output device to represent the information in visual or tactile form.'),
(301, 1, 9, 'DownSyndromePerson', 'Down Syndrome Person', 'A person with Down\'s syndrome.'),
(302, 1, 9, 'Earthquake', 'Earthquake', 'A sudden violent shaking of the ground, typically causing great destruction, as a result of movements within the earth\'s crust or volcanic action (Oxford Dictionary of English). It may cause a sudden panic among the occupants of the building.'),
(303, 1, 9, 'EmergencyActivity', 'Emergency Activity', 'An activity that is done with an urgency and highest priority.'),
(304, 1, 9, 'EmergencyEvacuation', 'Emergency Evacuation', 'It represents an immediate escape of people away from a particular area that has ongoing or imminent hazard to their lives or property.'),
(305, 1, 9, 'EmergencyEvacuationGroup', 'Emergency Evacuation Group', 'A group of two or more persons who are supposed to evacuate the building together.'),
(306, 1, 9, 'EmergencyEvacuationRoute', 'Emergency Evacuation Route', 'A type of route in which only those spaces are mentioned that are potentially safe for its users as well as the ending point of it must be an exit from a particular space.'),
(307, 1, 9, 'EmergencyExit', 'Emergency Exit', 'Emergency exit is logical point that is only used in case of any emergency conditions such as fire, etc.'),
(308, 1, 9, 'EndPoint', 'End Point', 'A logic point that is used to indicate the end of a corridor.'),
(309, 1, 9, 'Entrance', 'Entrance', 'Entrance represents a space or a door that is used to enter into a building. Normally, it is also used as an exit.'),
(310, 1, 9, 'Escalator', 'Escalator', 'A moving staircase consisting of an endlessly circulating belt of steps driven by a motor, which conveys people between the floors of a public building (Oxford Dictionary of English).'),
(311, 1, 9, 'EscortSupportedWheelchairPerson', 'Escort Supported Wheelchair Person', 'A physical impaired person whose wheelchair is escorted by another person.'),
(312, 1, 9, 'Event', 'Event', 'An occurrence; something that happens (Oxford Dictionary of English). It represents when something planned or sudden happens.'),
(313, 1, 9, 'EventImpact', 'Event Impact', 'A parameter to express the impact of an event on a specific person (or type of persons) in terms of any specific value or a type.'),
(314, 1, 9, 'EventSeverity', 'Event Severity', 'A parameter to express the severity of an event for a specific person (or type of persons) in terms of  potential severity levels.'),
(315, 1, 9, 'Exit', 'Exit', 'Exit represents a logical representation for escaping or releasing from a specific phsyical space. Generally, an exit is as same as an entrance.'),
(316, 1, 9, 'ExitRoute', 'Exit Route', 'A type of route in which the ending point represents the exit of a specific space.'),
(317, 1, 9, 'Family', 'Family', 'A group of two or more persons having family ties between them.'),
(318, 1, 9, 'Fire', 'Fire', 'An event that may burn different parts of the building and hazourdous for both the people and the building.'),
(319, 1, 9, 'FireDoor', 'Fire Door', 'A type of door used to minimize the spread of fire and related effects by isolating two connected spaces or sections in the building.'),
(320, 1, 9, 'FireEscapeLadder', 'Fire Escape Ladder', 'A type of ladder which is used to make an emergency exit through the window out of fire accident site.'),
(321, 1, 9, 'FireExtinguisher', 'Fire Extinguisher', 'An active fire protection instrument used by persons to blow out small scale fire.'),
(322, 1, 9, 'FireProtectionDevice', 'Fire Protection Device', 'Device that is used to minimize the effects of potentially danger fires.'),
(323, 1, 9, 'FitnessStatus', 'Fitness Status', 'A fitness status is associated with a person that represent the quality of being suitable for a specific activity.'),
(324, 1, 9, 'FloorEntrance', 'Floor Entrance', 'A logical point that is used to represent the entrance to a floor.'),
(325, 1, 9, 'FloorExit', 'Floor Exit', 'A logical point that is used to represent the exit of a specific floor and that leads to different floors of a building.'),
(326, 1, 9, 'Footpath', 'Footpath', 'A path for pedestrians in a built-up area; a pavement.'),
(327, 1, 9, 'GraphBasedRoute', 'Graph-Based Route', 'A graph-based route is a graphical way of representing a route in terms of nodes (sometimes called vertices) and edges (sometimes called arcs).'),
(328, 1, 9, 'Group', 'Group', 'It represents a collection of two or more people who interact with each other and may have the similar characteristics or objectives.'),
(329, 1, 9, 'HallEntrance', 'Hall Entrance', 'A logical point that is used to represent the entrance to a hall.'),
(330, 1, 9, 'HallExit', 'Hall Exit', 'A logical point that is used to represent the exit of a Hall.'),
(331, 1, 9, 'HallSegment', 'Hall Segment', 'A fragment or an atomic element of a hall.'),
(332, 1, 9, 'HandheldDevice', 'Handheld Device', 'A smart device or a computer that is small enough to be used while holding it in the hands.'),
(333, 1, 9, 'HearingImpairedPerson', 'Hearing Impaired Person', 'It is a partial or total unability to hear. It is also known as Hearing loss.'),
(334, 1, 9, 'HorizontalMovingPavement', 'Horizontal Moving Pavement', 'A slow-moving conveyor mechanism that transports people across a horizontal plane over a short to medium distance.'),
(335, 1, 9, 'HorizontalPassage', 'Horizontal Passage', 'A type of a passage that connects spatial elements located on the same storey or floor.'),
(336, 1, 9, 'HotelBuilding', 'Hotel Building', 'A building that contains rooms, apartments or suites where people stay for a specific time period.'),
(337, 1, 9, 'ImageDescription', 'Image Description', 'A type of description in which images are given to provide information about any entity.'),
(338, 1, 9, 'Impact', 'Impact', 'An impact is a long-lasting effect of an event (or activity), that continues to exist after the event (or activity) has taken place.'),
(339, 1, 9, 'ImpairedPerson', 'Impaired Person', 'An individual whose natural senses or physical abilities are either diminished or damaged.'),
(340, 1, 9, 'Incident', 'Incident', 'An event or occurance that can be dangerous for the occupants of the building.'),
(341, 1, 9, 'IncidentProtectionDevice', 'Incident Protection Device', 'Device that is used to avoid and minimize the effects of potentially danger events for the occupants of the building as well as for the structure of building itself.'),
(342, 1, 9, 'Intensity', 'Intensity', 'The measurable amount of a property, such as force, brightness, or a magnetic field (Oxford Dictionary of English).'),
(343, 1, 9, 'Junction', 'Junction', 'A logic point that connects more than two corridors.'),
(344, 1, 9, 'KidsArea', 'Kids Area', 'A place where infants or young children can play which is surrounded by a boundary normally. It can be both indoor and outdoor.'),
(345, 1, 9, 'LowStaminaPerson', 'Low Stamina Person', 'It is the unability to sustain physical or mental activity to a normal level.'),
(346, 1, 9, 'LowVisionPerson', 'Low Vision Person', 'A person whose visual acuity is 20/70 or poorer in the better-seeing eye and cannot be corrected or improved with regular eyeglasses.'),
(347, 1, 9, 'MeetingRoom', 'Meeting Room', 'A type of room designated for social gathering of people, especially professional meetings.'),
(348, 1, 9, 'MentalAbility', 'Mental Ability', 'The mental ability of an indi-vidual to remain focused on an external stimuli or an internal experience for a certain period of time (World Health Organisation).'),
(349, 1, 9, 'MentalImpairedPerson', 'Mental Impaired Person', 'A person having mental impairment in which one\'s mind is damaged or is not working properly and one have issues such as consciousness, orientation, concentration.'),
(350, 1, 9, 'MildHearingImpairedPerson', 'Mild Hearing Impaired Person', 'A person who is only able to hear the sounds that are between 25 and 40 dB.'),
(351, 1, 9, 'MobilePhone', 'Mobile Phone', 'A telephone with access to a cellular radio system so it can be used over a wide area, without a physical connection to a network (Oxford Dictionary of English).'),
(352, 1, 9, 'MobilityAbility', 'Mobility Ability', 'This ability is used to represent all kinetic abilities a person may have.'),
(353, 1, 9, 'MobilityWithAssistedDevicePerson', 'Mobility With Assisted Device Person', 'A person who used a motorised device for moving, such as motorised wheelchair or scooter, etc.'),
(354, 1, 9, 'MobilityWithWheelchairPerson', 'Mobility With Wheelchair Person', 'A person using a wheelchair (a mobility device that is used while having any kind of tempoary or permanent physical impairment).'),
(355, 1, 9, 'ModerateHearingImpairedPerson', 'Moderate Hearing Impaired Person', 'A person who cannot hear sounds that are less than 40-75 dB.'),
(356, 1, 9, 'MotionState', 'Motion State', 'It describes the movement of a person.'),
(357, 1, 9, 'MotorImpairedPerson', 'Motor Impaired Person', 'A person who has either partial or total loss of function of a body part, usually a limb or limbs.'),
(358, 1, 9, 'MotorisedWheelchairPerson', 'Motorised Wheelchair Person', 'It is a kind of wheelchair that has either a mechanical engine or an electric battery. It has more speed than a traditional wheelchair.'),
(359, 1, 9, 'MovableDevice', 'Movable Device', 'A device that can be moved from one place to another place, e.g., mobile phone, computer trolley, etc.'),
(360, 1, 9, 'MovingPavement', 'Moving Pavement', 'A slow-moving conveyor mechanism that transports people across a horizontal or inclined plane over a short to medium distance (Oxford Dictionary of English).'),
(361, 1, 9, 'Navigation', 'Navigation', 'The process or activity of accurately ascertaining one\'s position and planning and following a route (Oxford Dictionary of English).'),
(362, 1, 9, 'NavigationalPoint', 'Navigational Point', 'It is a special type of point that connects more than two corridors or enforce change of direction to users or indicate the end of corridors.'),
(363, 1, 9, 'NavigationalState', 'Navigational State', 'It models the user\'s navigational state while following the path.'),
(364, 1, 9, 'NonMotorisedWheelchairPerson', 'Non-Motorised Wheelchair Person', 'A traditional wheelchair that is used by hands. It has significantly lower speed than motorised wheelchairs.'),
(365, 1, 9, 'OpenAreaEntrance', 'Open Area Entrance', 'A logical point that is used to represent the entrance to an open area.'),
(366, 1, 9, 'OpenAreaExit', 'Open Area Exit', 'A logical point that is used to represent the exit from a specifc open space.'),
(367, 1, 9, 'Panic', 'Panic', 'A  sudden uncontrollable fear or anxiety among the occupants of the building that often causes wildly unthinking behaviour (Oxford Dictionary of English). In indoor environments, it may happens due to several reasons such as earthquake, fire or other sudden hazardous situations.'),
(368, 1, 9, 'Parameter', 'Parameter', 'A numerical or other measurable factor forming one of a set that defines a system or sets the conditions of its operation.'),
(369, 1, 9, 'Passage', 'Passage', 'Any spatial element that is part of a path and traversable by persons. In addition, it may be used as a logic representation of physical passages to represent an edge (or an arc) in a route graph.'),
(370, 1, 9, 'PassiveFireProtectionDevice', 'Passive Fire Protection', 'It is an integral component installed in the building while construction to resist the fire.'),
(371, 1, 9, 'PersonAbility', 'Person Ability', 'A parameter to express the quality of an ability a specific person (or type of persons) own.'),
(372, 1, 9, 'PersonAccessibility', 'Person Accessibility', 'A parameter to express the accessibility of any space for a specific person (or type of persons) in terms of some value.'),
(373, 1, 9, 'PhysicallyImpairedPerson', 'Physically Impaired Person', 'A physical impairment is a condition in which any part of person\'s body is either  damaged or is not working properly.'),
(374, 1, 9, 'PointOfInterest', 'Point Of Interest', 'Any physical or virtual location or object, which may be of interest to a user and may serve as a navigation destination (e.g., room, water dispenser, waiting zone, assembly point, shop, seat, etc).'),
(375, 1, 9, 'PointOfInterestSegment', 'Point Of Interest Segement', 'A traverasal part of a space that is connected to a specific Point of Interest.'),
(376, 1, 9, 'ProfoundHearingImpairedPerson', 'Profound Hearing Impaired Person', 'A person who cannot hear sounds softer than 90-120 dB. A person suffering from profound hearing loss, using a hearing aid is also ineffective most of the time.'),
(377, 1, 9, 'Quality', 'Quality', 'A degree or grade of excellence or worth.'),
(378, 1, 9, 'Ramp', 'Ramp', 'A sloping surface joining two different levels, as at the entrance or between floors of a building (Oxford Dictionary of English).'),
(379, 1, 9, 'Road', 'Road', 'A road is a way on land between two places that has been paved or otherwise improved to allow travel by foot or some form of conveyance, including a motor vehicle, cart, bicycle, or horse.'),
(380, 1, 9, 'Role', 'Role', 'The function assumed or part played by a person or thing in a particular situation (Oxford Dictionary of English).'),
(381, 1, 9, 'RoleInContext', 'Role In Context', 'A concept to express that an agent is playing a role in a given context.'),
(382, 1, 9, 'RoomEntrance', 'Room Entrance', 'A logical point that is used to represent the entrance to a room.'),
(383, 1, 9, 'RoomExit', 'Room Exit', 'A logical point that is used to represent the exit of a room.'),
(384, 1, 9, 'RoomSegment', 'Room Segment', 'A traversable part in a room that is usually used to go the exit or the other part of the room.'),
(385, 1, 9, 'Route', 'Route', 'A set of connected spaces represented by a starting and ending point, that ultimately leads to some specific position or place.'),
(386, 1, 9, 'RouteElement', 'Route Element', 'It represents the physical or conceptual elements of a navigation path.'),
(387, 1, 9, 'RoutePoint', 'Route Point', 'Any spatial element that is part of a path and traversable by persons. In addition, it may be used as a logic representation of physical passages to represent a node (or a vertex) in a route graph.'),
(388, 1, 9, 'SeatingArrangementRoute', 'Seating Arrangement Route', 'A type of route in which the ending point represents the seat of one or more individuals such as in cinema, stadiums, auditoriums, etc.'),
(389, 1, 9, 'SensorEvent', 'Sensor Event', 'This concept is used to express an event detected by any sensor.'),
(390, 1, 9, 'SensoryAbility', 'Sensor Ability', 'Sensory ability is referred to the brain\'s ability to receive, interpret, and effectively use the information provided by the senses in human beings such as touch, hear, smell, vision, etc.'),
(391, 1, 9, 'SensoryImpairedPerson', 'Sensory Impairmed Person', 'Sensory impairment is when one of the senses such as sight, hearing, smell, touch, taste and spatial awareness, is no longer normal.'),
(392, 1, 9, 'SevereHearingImpairedPerson', 'Severe Hearing Impaired Person', 'A person who is unable to hear anything without wearing a hearing aid.'),
(393, 1, 9, 'Severity', 'Severity', 'The quality of being hard to endure, uninviting or formidable.'),
(394, 1, 9, 'ShoppingMallBuilding', 'Shopping Mall Building', 'A set of one or more buildings forming a complex of shops representing merchandisers, with interconnecting walkways enabling visitors to easily walk from unit to unit, along with a parking area.'),
(395, 1, 9, 'ShoppingRoute', 'Shopping Route', 'A type of route in which the specific points of interest are mentioned in the form of connected spaces, according to the preferences or interests of a one or more individuals.'),
(396, 1, 9, 'SmartPhone', 'Smartphone', 'A mobile phone that is able to perform many of the functions of a computer, typically having a relatively large screen and an operating system capable of running general-purpose applications (Oxford Dictionary of English).'),
(397, 1, 9, 'SocialUnit', 'Social Unit', 'An individual, or a group or community, considered as a discrete constituent of a society or larger group (Oxford Dictionary of English).'),
(398, 1, 9, 'Space', 'Space', 'A physical, three dimensional, and one of the most important elements in the design of architecture that can further be divided to create more spaces from it.'),
(399, 1, 9, 'SpaceSafety', 'Space Saftey', 'A parameter to express the safety of any space for a specific person (or type of persons) in terms of some value.'),
(400, 1, 9, 'SpatialAbility', 'Spatial Ability', 'This ability expresses the capacity to understand, reason and remember the spatial relations among objects and spaces.'),
(401, 1, 9, 'StadiumBuilding', 'Stadium Building', 'A building that has a large open area surrounded by many rows of seats, and  used for sports events, concerts, etc.'),
(402, 1, 9, 'Stampeding', 'Stampeding', 'A sudden and uncontrollable run by the group of people caused by panic.'),
(403, 1, 9, 'Suite', 'Suite', 'A suite of rooms usually on one floor of an apartment house (Cambridge English Dictionary). This term is normally used in hotels, resorts, guesthouses, etc.'),
(404, 1, 9, 'Telephone', 'Telephone', 'A device for transmitting voices over a distance using wire or radio, by converting acoustic vibrations to electrical signals (Oxford Dictionary of English).'),
(405, 1, 9, 'TerroristAttack', 'Terrorist Attack', 'A surprise event involving the deliberate use of violence against the occupants of the buildings.'),
(406, 1, 9, 'TextualDescription', 'Textual Description', 'A type of description in which only text or writings are used to provide the information about any entity.'),
(407, 1, 9, 'Thoroughfare', 'Thoroughfare', 'A road or path forming a route between two places (Oxford Dictionary of English).'),
(408, 1, 9, 'TransitionPoint', 'Transition Point', 'A point at which person passes from one place to the next.'),
(409, 1, 9, 'TurnPoint', 'Turn Point', 'A logic point that is used to enforce people to change their direction.'),
(410, 1, 9, 'VerticalMovingPavement', 'Vertical Moving Pavement', 'A slow-moving conveyor mechanism that transports people across an inclined plane over a short to medium distance.'),
(411, 1, 9, 'VerticalPassage', 'Vertical Passage', 'A type of passage that connects spatial elements located on different storey or floor.'),
(412, 1, 9, 'Visit', 'Visit', 'An activity that represents an act of going to see a person or place as a guest, tourist or a spectator. Normally, this type of activity is considered as a leasiure or recreational activity.'),
(413, 1, 9, 'VisitRoute', 'Visit Route', 'A type of route created for visiting purposes within an indoor environment.'),
(414, 1, 9, 'VisitingGroup', 'Visiting Group', 'A group of two or more people that has the same objective of visiting any space.'),
(415, 1, 9, 'VisuallyImpairedPerson', 'Visually Impaired Person', 'It is a partial or total unability to see. It is also known as visual loss. Here, we considered a person having visual impairment who as severe low vision; 20/200 to 20/400 or higher.'),
(416, 1, 9, 'WaitingZone', 'Waiting Zone', 'A space (normally with seating), where people can wait to do some specific activity. During emergency condtions, it is also used for several purposes, such as unification of people with their family members, acquaintances or emergency rescue teams, etc.'),
(417, 1, 10, 'Cinema', 'Cinema', 'The instances of this class represent, among all the business activities, certain cinematic projection activities.'),
(419, 1, 12, 'Actor', 'acteur', 'Μια ηθοποιός ή ένας ηθοποιός είναι ένα άτομο που παίζει σε μια δραματική παραγωγή και που εργάζεται στο χώρο του κινηματογράφου, της τηλεόρασης, του θεάτρου, ή το ραδιόφωνο.'),
(444, 1, 17, 'Seance', 'Seance', NULL),
(445, 1, 17, 'Film', 'Film', NULL),
(446, 1, 17, 'Acteur', 'Acteur', NULL),
(447, 1, 17, 'Cinema', 'Cinema', NULL),
(448, 1, 17, 'Salle', 'Salle', NULL),
(449, 1, 17, 'Client', 'Client', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 289, NULL, NULL, 'Cinema'),
(3, 1, 56, NULL, NULL, 'Film'),
(5, 1, 419, NULL, NULL, 'Acteur'),
(6, 1, NULL, NULL, NULL, 'Cinemas'),
(7, 1, 449, NULL, NULL, 'Client'),
(8, 1, 444, NULL, NULL, 'Seance'),
(9, 1, 448, NULL, NULL, 'Salle');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21, 2, 1, 'Nom', NULL, 1, NULL, 0, 0),
(22, 2, 4, 'Adresse', NULL, 2, NULL, 0, 0),
(23, 3, 1, 'Titre', NULL, 1, NULL, 0, 0),
(29, 5, 139, 'Prénom', NULL, 1, NULL, 0, 0),
(30, 5, 140, 'Nom de Famille', NULL, 2, NULL, 0, 0),
(31, 5, 182, 'Date Naissance', NULL, 3, NULL, 0, 0),
(32, 3, 301, 'Durée', NULL, 2, NULL, 0, 0),
(33, 6, 334, NULL, NULL, 1, '[\"<br \\/>\\r\\n<font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'>\\r\\n<tr><th align=\'left\' bgcolor=\'#f57900\' colspan=\"]', 0, 0),
(34, 6, 335, NULL, NULL, 2, '[\"<br \\/>\\r\\n<font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'>\\r\\n<tr><th align=\'left\' bgcolor=\'#f57900\' colspan=\"]', 0, 0),
(35, 6, 336, NULL, NULL, 3, '[\"<br \\/>\\r\\n<font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'>\\r\\n<tr><th align=\'left\' bgcolor=\'#f57900\' colspan=\"]', 0, 0),
(36, 6, 337, NULL, NULL, 4, '[\"<br \\/>\\r\\n<font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'>\\r\\n<tr><th align=\'left\' bgcolor=\'#f57900\' colspan=\"]', 0, 0),
(37, 7, 339, NULL, NULL, 1, NULL, 0, 0),
(38, 7, 340, NULL, NULL, 2, NULL, 0, 0),
(39, 7, 341, NULL, NULL, 3, NULL, 0, 0),
(40, 7, 342, NULL, NULL, 4, NULL, 0, 0),
(41, 7, 343, NULL, NULL, 5, NULL, 0, 0),
(42, 8, 325, NULL, NULL, 1, NULL, 0, 0),
(43, 8, 326, NULL, NULL, 2, NULL, 0, 0),
(44, 8, 327, NULL, NULL, 3, NULL, 0, 0),
(45, 9, 338, NULL, NULL, 1, NULL, 0, 0);

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
('kbccojd08ov2jhhe6p28qqecit', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383835383037312e3339363838383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616739366136737172696b6c37397268356a7472613168656b33223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383831393232333b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836313133383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836313636363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836313238333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836313135323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383836313637313b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223732663063613433323162383430613933653265313761326262323362393132223b733a33323a223436626261616362623363623338376262396365363735326530613162303134223b733a33323a226230633334303861343761656162323334613035363864316339323231336362223b733a33323a223662363661663866636461653362343763303237646661613965363030326133223b7d733a343a2268617368223b733a36353a2236623636616638666364616533623437633032376466616139653630303261332d6230633334303861343761656162323334613035363864316339323231336362223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3935313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226236353434663932616663386334643132393864653230646534623363303363223b733a33323a223135386338383930643963323532613765313530313665383331643164323931223b733a33323a223266643364623932393639393636353062303233373937303838306131356234223b733a33323a223066666538643036303863616435663135653633346361303261323662376135223b733a33323a226131373961373765623236636631306663653232653837356463373565336564223b733a33323a223737303432386231643565336331303834643934376530333162383538656533223b733a33323a223434366132303335613638656333643764393631313336633733353933386163223b733a33323a223535653737646637343636653263633930616437386537616431643863326234223b733a33323a226438623431313339643038353136663366353631653237323364326339663665223b733a33323a223837333366376461393933376261656662363332303037303366386661626136223b733a33323a223639313463396137373838373266316566333836346461653161326432313165223b733a33323a223733353931333564636132346366396662666363366335646130666365643430223b733a33323a223131353565653366396237663961306231316561636636356166633264383261223b733a33323a226463376665316565313262366131653539383732336236663466643537646233223b733a33323a226361323639616263343434376464333339626134633734313539616163366336223b733a33323a226438386561326536356636333965316635353832666530626136386532633461223b7d733a343a2268617368223b733a36353a2264383865613265363566363339653166353538326665306261363865326334612d6361323639616263343434376464333339626134633734313539616163366336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223863633631653230626166313762343332336434663566373364373631636562223b733a33323a223439373237623661633361396637356636633563396536336466613264643630223b733a33323a223738383838303864376330643338356232646665396235613361393066643161223b733a33323a223731633766643639326362326431646539343138326131323632363464656239223b733a33323a223435653830663463326265333036303830333862346166383935393538303838223b733a33323a226131396438386266613162356130313366326639633630346566633566613363223b733a33323a226332646266313033366666656166316261376462323033303462363561373961223b733a33323a223331616666666234333235636136336539636566656334326266353836333963223b733a33323a223164386564303862656537313739626336343461666561666330353764326462223b733a33323a223130393235656266316331306232313439303333656166653038373132613633223b733a33323a226437353262363237366565666362643330346338623631663266313033623664223b733a33323a226363653165666337363030613435336637623266626635656566396635356565223b733a33323a223266356362373565646232373138396365663630383466363730326235643230223b733a33323a223835653934393261343365313765323534326638303235613665353830353137223b733a33323a226534626538616335356232333431376538656533353562366438343833373533223b733a33323a223638323938383361643831326636333062613032363437623539616365323364223b733a33323a226337343038383536323233363135393965386261303238313932363235663266223b733a33323a223732313432653937353139343862383735326632336338633635323539386262223b733a33323a223538636263643437383466343463316337303539623132376161656633383038223b733a33323a223139376433303936653433616432376532616465353735313334383735613762223b733a33323a223034353332306265613932313438343832396134393631626664343763353465223b733a33323a223239316233613163353763353063336134336463663961626537376465326162223b733a33323a226133616235306432333566663161656338313234346362653233316532643037223b733a33323a226162353862636161346134626139373738643331613731613138623333653733223b733a33323a223265343235303864643366363337623932313963613538633264656433323865223b733a33323a223736356339383634356439383430616337636431316639633931333630373862223b733a33323a223536303131643634613966303065363161633633373864613462323865373964223b733a33323a226364313134346631313138626533326333636238636561376561326264653238223b733a33323a226532663261346333313931633833353734316536373837646536636239663031223b733a33323a223234353962383164653639313330396332386339356661363231373030356632223b733a33323a223865373965323831613133353163333532666335646362393831353165393365223b733a33323a223132666238396233306563353734393863306566346564646265623330303762223b733a33323a226432303762356535316535343235313334343636623236396437336337333531223b733a33323a223261353336383164353461323163653562666465363332613734396532636366223b733a33323a223930643030356661396531336239656339323637353531333435396338393463223b733a33323a226239353132353365316561316230356561613833636666373066333664396432223b733a33323a226537356339613536633935383430386431366438643834336632656330646364223b733a33323a226562366231383130396136623030303236373862333138643634616566306335223b733a33323a223666623433323563373933356130613236363861623064343662666431636264223b733a33323a223264373132303839353064303737376238323631333362623364353137326462223b733a33323a223063646164393964353763306262643130656131613332653930313762623137223b733a33323a223665343164383837356431663435326361303937623666373637393533373965223b733a33323a226435333164306162306266633530383866653730363638666464356265383463223b733a33323a223962356263666266306335333365303633383238386164656136306636386235223b7d733a343a2268617368223b733a36353a2239623562636662663063353333653036333832383861646561363066363862352d6435333164306162306266633530383866653730363638666464356265383463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223939373435363932633462306639306562396632623831616137663761623362223b733a33323a223732346463303266613230343264653436616338386533323237313263633834223b733a33323a226339393636613164343162333265303932303333396136633664633736396335223b733a33323a223662353961373561643165353664616531376637383130636238623631633334223b733a33323a223864353536653162313464663639353738363433303638363538306633313931223b733a33323a223561346162313666316364323738336334613964376637303138313434323236223b733a33323a223731323134366235633737643633306166386365333431636366373164643635223b733a33323a226364323632633735353966643164363837313231623930376565633363313837223b733a33323a223537653133306266353739366231646330343537303263613839353433366563223b733a33323a226665376534373039333138646362313230313637633339363130366536663732223b733a33323a226635326163653932383636376331306434663837626335656233343037353764223b733a33323a223461663461616538303930663638316462336566336365313430303061366135223b733a33323a223032323431333636373633643365613163346562356132386236646565353930223b733a33323a223039393836373330316164666331376133613330376438303762616331396532223b7d733a343a2268617368223b733a36353a2230393938363733303161646663313761336133303764383037626163313965322d3032323431333636373633643365613163346562356132386236646565353930223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223937353732393630643531616461656432316435623766663738326134633037223b733a33323a223766306430633835336237383864376463623161313730663562383234613435223b733a33323a226336373334623236663430623761623438366633353537326339633261353431223b733a33323a223063393161376230613761396162613462356235643230663232303538313534223b7d733a343a2268617368223b733a36353a2230633931613762306137613961626134623562356432306632323035383135342d6336373334623236663430623761623438366633353537326339633261353431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226665656364386163303533653663306135383934386438386464656537356265223b733a33323a223534363836303236656635653066393765313964326233623738653934313630223b733a33323a223665353233643863633530663330333531656536383763373564316364366633223b733a33323a223632636661393662336637363238326439376131316134616436313039353636223b733a33323a223064346237343937636438383866666236663038663934643138373436333966223b733a33323a223730343139346137613661306437303936613537643963376230343863663732223b733a33323a226533646364623166356165616463616265353938396362626263333733633765223b733a33323a223339326263386235613038626133343636326237643565356430353164336236223b733a33323a226138383337646561393866623031656266336238333034316535663436373964223b733a33323a223163326633626431393130633738343838663862326235663736373063643738223b733a33323a223737326431396362646263316439343461626562313966326638396135373432223b733a33323a226565386438373065653436323264646366613338656263383232653933353064223b7d733a343a2268617368223b733a36353a2265653864383730656534363232646463666133386562633832326539333530642d3737326431396362646263316439343461626562313966326638396135373432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618858071);

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
('administrator_email', '\"emeline.guillet.revol@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Omeka_Cinemas\"'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'emeline.guillet.revol@gmail.com', 'Emeline', '2021-03-08 17:01:34', '2021-03-08 17:01:35', '$2y$10$nvoDDQabCHeREDOp/Hsse.XySOpbhUvRj7SKK0BhD0wJfDFEm6vd6', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-03-08 17:03:09', '2021-03-08 17:03:33', '$2y$10$mVSfywV/EJXZmcNdDtUB.uzRtBBbapnDilzJafGB80KF6wlA435We', 'global_admin', 1);

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
('default_resource_template', 2, '\"\"'),
('locale', 2, '\"\"');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 1, NULL, 'literal', 'fr', 'Titi', NULL, 1),
(2, 1, 1, NULL, 'literal', 'en-us', 'Tweety', NULL, 1),
(3, 1, 4, NULL, 'literal', 'fr', 'Ami de Grominet', NULL, 1),
(4, 1, 4, NULL, 'literal', 'en-us', 'Bird', NULL, 1),
(5, 2, 1, NULL, 'literal', '', 'SuckerPunch', NULL, 1),
(6, 2, 301, NULL, 'literal', '', '110', NULL, 1),
(7, 3, 1, NULL, 'literal', 'fr', 'Princesse Mononoké', NULL, 1),
(8, 3, 1, NULL, 'literal', 'en', 'Princess Mononoke', NULL, 1),
(9, 3, 301, NULL, 'literal', '', '135', NULL, 1),
(10, 4, 1, NULL, 'literal', 'fr', 'Le voyage de Chihiro', NULL, 1),
(11, 4, 1, NULL, 'literal', 'en', 'Spirited Away', NULL, 1),
(12, 4, 301, NULL, 'literal', '', '122', NULL, 1),
(16, 6, 139, NULL, 'literal', '', 'Emily', NULL, 1),
(17, 6, 140, NULL, 'literal', '', 'Browning', NULL, 1),
(18, 6, 182, NULL, 'literal', '', '1988-12-07', NULL, 1),
(19, 6, 1, NULL, 'literal', '', 'Emily Browning', NULL, 1),
(20, 7, 334, NULL, 'literal', '', 'Ariel Hauts-de-Rueil', NULL, 1),
(21, 7, 335, NULL, 'literal', '', '58 avenue de Fouilleuse', NULL, 1),
(22, 7, 336, NULL, 'literal', '', 'Reuil-Malmaison', NULL, 1),
(23, 7, 337, NULL, 'literal', '', '92500', NULL, 1),
(24, 7, 1, NULL, 'literal', '', 'Ariel Hauts-de-Rueil', NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(8, 1, 'https://w3id.org/sbeo#CinemaBuilding', 'CinemaBuilding', 'Cinema Building', ''),
(9, 1, 'https://w3id.org/sbeo', 'sbeo', 'SBEO', ''),
(10, 1, 'http://www.disit.org/km4city/schema#Cinema', 'km4c', 'Cinema', ''),
(12, 1, 'http://dbpedia.org/ontology/Actor', 'owl', 'Acteur', ''),
(17, 1, 'https://cinema.fr/onto/cine#', 'cine', 'Cinema Gestion', '');

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
