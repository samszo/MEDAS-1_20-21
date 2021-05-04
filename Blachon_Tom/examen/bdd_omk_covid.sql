-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 04 mai 2021 à 12:59
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
-- Base de données : `bdd_omk_covid`
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
(2, 'items', 1, 1, '2021-05-07', '2021-05-07\n203151'),
(3, 'items', 1, 1, '2021-05-06', '2021-05-06\n199942'),
(4, 'items', 1, 1, '2021-05-05', '2021-05-05\n189654'),
(5, 'items', 1, 1, '2021-05-04', '2021-05-04\n148963'),
(6, 'items', 1, 1, '2021-05-03', '2021-05-03\n153677'),
(7, 'items', 1, 1, '2021-05-02', '2021-05-02\n168453'),
(8, 'items', 1, 1, '2021-05-01', '2021-05-01\n159634'),
(9, 'items', 1, 1, 'Antigénique', 'Antigénique\n3,5€\nPologne\n2021-05-01\n2021-05-04\n2021-05-06\n2021-05-07'),
(10, 'items', 1, 1, 'RT-PCR', 'RT-PCR\n12,7€\nItalie\n2021-05-01\n2021-05-02\n2021-05-03\n2021-05-04'),
(11, 'items', 1, 1, 'Salivaire', 'Salivaire\n7,4€\nFrance\n2021-05-05\n2021-05-06\n2021-05-07'),
(12, 'items', 1, 1, 'Sérologique', 'Sérologique\n13,1€\nEspagne\n2021-05-02\n2021-05-04\n2021-05-06'),
(13, 'items', 1, 1, 'Louis DUPOND', 'Louis DUPOND\n25\nParis\nToux\n2021-05-05'),
(14, 'items', 1, 1, 'Jeanne DURAND', 'Jeanne DURAND\n68\nParis\nDifficultés respiratoires\n2021-05-07'),
(15, 'items', 1, 1, 'Therese SIANEY', 'Therese SIANEY\n63\nParis\nMigraines\n2021-05-02'),
(16, 'items', 1, 1, 'Paul TRIBOUL', 'Paul TRIBOUL\n42\nLyon\nPerte de goût\n2021-05-04'),
(17, 'items', 1, 1, 'Abdel BLARIOT', 'Abdel BLARIOT\n37\nLyon\nToux\n2021-05-04'),
(18, 'items', 1, 1, 'Leslie SOUCHANG', 'Leslie SOUCHANG\n19\nLyon\nToux\n2021-05-06'),
(19, 'items', 1, 1, 'Zeus MILOS', 'Zeus MILOS\n57\nMarseille\nDifficultés respiratoires\n2021-05-03'),
(20, 'items', 1, 1, 'Benoît PULARD', 'Benoît PULARD\n17\nMarseille\nMigraines\n2021-05-01'),
(21, 'items', 1, 1, 'Habess LABOUILLE', 'Habess LABOUILLE\n64\nMarseille\nPerte de goût\n2021-05-06'),
(22, 'items', 1, 1, 'Jean VALJEAN', 'Jean VALJEAN\n54\nAvignon\nPerte de goût\n2021-05-07'),
(23, 'items', 1, 1, 'Maxime CARVANA', 'Maxime CARVANA\n33\nAvignon\nToux\n2021-05-05'),
(24, 'items', 1, 1, 'Samira DIDLO', 'Samira DIDLO\n85\nAvignon\nDifficultés respiratoires\n2021-05-05'),
(25, 'items', 1, 1, 'Alexandre SOLEIL', 'Alexandre SOLEIL\n25\nParis\nToux\n2021-05-03\nRT-PCR'),
(26, 'items', 1, 1, 'Marine MONROE', 'Marine MONROE\n68\nParis\nDifficultés respiratoires\n2021-05-04\nAntigénique'),
(27, 'items', 1, 1, 'Therese BONNAY', 'Therese BONNAY\n63\nParis\nMigraines\n2021-05-03\nRT-PCR'),
(28, 'items', 1, 1, 'Paul PERRIN', 'Paul PERRIN\n42\nLyon\nPerte de goût\n2021-05-01\nRT-PCR'),
(29, 'items', 1, 1, 'Omar HASSAD', 'Omar HASSAD\n37\nLyon\nToux\n2021-05-03\nSalivaire'),
(30, 'items', 1, 1, 'Lizie SOUTIPHONG', 'Lizie SOUTIPHONG\n19\nLyon\nToux\n2021-05-04\nAntigénique'),
(31, 'items', 1, 1, 'Francis BERTRAND', 'Francis BERTRAND\n57\nMarseille\nDifficultés respiratoires\n2021-05-05\nSérologique'),
(32, 'items', 1, 1, 'Micheline SIGNOREL', 'Micheline SIGNOREL\n17\nMarseille\nMigraines\n2021-05-06\nRT-PCR'),
(33, 'items', 1, 1, 'Maya ZETONG', 'Maya ZETONG\n64\nMarseille\nPerte de goût\n2021-05-01\nAntigénique'),
(34, 'items', 1, 1, 'Pedro RAMIREZ', 'Pedro RAMIREZ\n54\nAvignon\nPerte de goût\n2021-05-05\nSalivaire'),
(35, 'items', 1, 1, 'Louis VIGNAC', 'Louis VIGNAC\n33\nAvignon\nToux\n2021-05-04\nSérologique'),
(36, 'items', 1, 1, 'Victoria HUGO', 'Victoria HUGO\n85\nAvignon\nDifficultés respiratoires\n2021-05-02\nAntigénique');

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
(2),
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
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36);

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
('nhk7doiTAwfDpxxKD9txox3DSwkmFgUU', 2, '2021-05-04 11:21:34', 1);

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
(185, 1, 5, 'nom', 'nom', NULL),
(186, 1, 5, 'prenom', 'prénom', NULL),
(187, 1, 5, 'age', 'âge', NULL),
(188, 1, 5, 'ville', 'ville', NULL),
(189, 1, 5, 'mainsymptom', 'symptome principal', NULL),
(190, 1, 5, 'typetest', 'type de test', NULL),
(191, 1, 5, 'unitcost', 'coût unitaire', NULL),
(192, 1, 5, 'importcountry', 'pays d\'import', NULL),
(193, 1, 5, 'date', 'date', NULL),
(194, 1, 5, 'totalstock', 'stock total', NULL),
(195, 1, 5, 'testedby', 'testé avec', NULL),
(196, 1, 5, 'testeddate', 'testé le', NULL),
(197, 1, 5, 'isavailable', 'est disponible le', NULL),
(198, 1, 5, 'rendezvousdate', 'a rendez-vous le', NULL);

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
(2, 1, 109, 5, NULL, '2021-05-07', 1, '2021-05-04 12:18:58', '2021-05-04 12:18:58', 'Omeka\\Entity\\Item'),
(3, 1, 109, 5, NULL, '2021-05-06', 1, '2021-05-04 12:19:29', '2021-05-04 12:19:29', 'Omeka\\Entity\\Item'),
(4, 1, 109, 5, NULL, '2021-05-05', 1, '2021-05-04 12:19:52', '2021-05-04 12:19:52', 'Omeka\\Entity\\Item'),
(5, 1, 109, 5, NULL, '2021-05-04', 1, '2021-05-04 12:20:27', '2021-05-04 12:20:27', 'Omeka\\Entity\\Item'),
(6, 1, 109, 5, NULL, '2021-05-03', 1, '2021-05-04 12:20:49', '2021-05-04 12:20:49', 'Omeka\\Entity\\Item'),
(7, 1, 109, 5, NULL, '2021-05-02', 1, '2021-05-04 12:21:13', '2021-05-04 12:21:13', 'Omeka\\Entity\\Item'),
(8, 1, 109, 5, NULL, '2021-05-01', 1, '2021-05-04 12:21:32', '2021-05-04 12:21:32', 'Omeka\\Entity\\Item'),
(9, 1, 106, 4, NULL, 'Antigénique', 1, '2021-05-04 12:24:23', '2021-05-04 12:24:23', 'Omeka\\Entity\\Item'),
(10, 1, 106, 4, NULL, 'RT-PCR', 1, '2021-05-04 12:25:37', '2021-05-04 12:25:37', 'Omeka\\Entity\\Item'),
(11, 1, 106, 4, NULL, 'Salivaire', 1, '2021-05-04 12:26:24', '2021-05-04 12:26:24', 'Omeka\\Entity\\Item'),
(12, 1, 106, 4, NULL, 'Sérologique', 1, '2021-05-04 12:27:26', '2021-05-04 12:27:26', 'Omeka\\Entity\\Item'),
(13, 1, 108, 2, NULL, 'Louis DUPOND', 1, '2021-05-04 12:28:51', '2021-05-04 12:28:51', 'Omeka\\Entity\\Item'),
(14, 1, 108, 2, NULL, 'Jeanne DURAND', 1, '2021-05-04 12:29:43', '2021-05-04 12:29:43', 'Omeka\\Entity\\Item'),
(15, 1, 108, 2, NULL, 'Therese SIANEY', 1, '2021-05-04 12:35:31', '2021-05-04 12:35:31', 'Omeka\\Entity\\Item'),
(16, 1, 108, 2, NULL, 'Paul TRIBOUL', 1, '2021-05-04 12:36:16', '2021-05-04 12:36:16', 'Omeka\\Entity\\Item'),
(17, 1, 108, 2, NULL, 'Abdel BLARIOT', 1, '2021-05-04 12:36:50', '2021-05-04 12:36:50', 'Omeka\\Entity\\Item'),
(18, 1, 108, 2, NULL, 'Leslie SOUCHANG', 1, '2021-05-04 12:37:27', '2021-05-04 12:37:27', 'Omeka\\Entity\\Item'),
(19, 1, 108, 2, NULL, 'Zeus MILOS', 1, '2021-05-04 12:38:12', '2021-05-04 12:38:12', 'Omeka\\Entity\\Item'),
(20, 1, 108, 2, NULL, 'Benoît PULARD', 1, '2021-05-04 12:39:25', '2021-05-04 12:39:25', 'Omeka\\Entity\\Item'),
(21, 1, 108, 2, NULL, 'Habess LABOUILLE', 1, '2021-05-04 12:40:19', '2021-05-04 12:40:19', 'Omeka\\Entity\\Item'),
(22, 1, 108, 2, NULL, 'Jean VALJEAN', 1, '2021-05-04 12:41:05', '2021-05-04 12:41:05', 'Omeka\\Entity\\Item'),
(23, 1, 108, 2, NULL, 'Maxime CARVANA', 1, '2021-05-04 12:41:43', '2021-05-04 12:41:43', 'Omeka\\Entity\\Item'),
(24, 1, 108, 2, NULL, 'Samira DIDLO', 1, '2021-05-04 12:42:28', '2021-05-04 12:42:28', 'Omeka\\Entity\\Item'),
(25, 1, 107, 3, NULL, 'Alexandre SOLEIL', 1, '2021-05-04 12:45:51', '2021-05-04 12:45:51', 'Omeka\\Entity\\Item'),
(26, 1, 107, 3, NULL, 'Marine MONROE', 1, '2021-05-04 12:46:39', '2021-05-04 12:46:39', 'Omeka\\Entity\\Item'),
(27, 1, 107, 3, NULL, 'Therese BONNAY', 1, '2021-05-04 12:47:27', '2021-05-04 12:48:01', 'Omeka\\Entity\\Item'),
(28, 1, 107, 3, NULL, 'Paul PERRIN', 1, '2021-05-04 12:49:01', '2021-05-04 12:49:01', 'Omeka\\Entity\\Item'),
(29, 1, 107, 3, NULL, 'Omar HASSAD', 1, '2021-05-04 12:49:54', '2021-05-04 12:49:54', 'Omeka\\Entity\\Item'),
(30, 1, 107, 3, NULL, 'Lizie SOUTIPHONG', 1, '2021-05-04 12:50:55', '2021-05-04 12:50:55', 'Omeka\\Entity\\Item'),
(31, 1, 107, 3, NULL, 'Francis BERTRAND', 1, '2021-05-04 12:52:13', '2021-05-04 12:52:13', 'Omeka\\Entity\\Item'),
(32, 1, 107, 3, NULL, 'Micheline SIGNOREL', 1, '2021-05-04 12:53:10', '2021-05-04 12:53:10', 'Omeka\\Entity\\Item'),
(33, 1, 107, 3, NULL, 'Maya ZETONG', 1, '2021-05-04 12:54:01', '2021-05-04 12:54:01', 'Omeka\\Entity\\Item'),
(34, 1, 107, 3, NULL, 'Pedro RAMIREZ', 1, '2021-05-04 12:54:47', '2021-05-04 12:54:47', 'Omeka\\Entity\\Item'),
(35, 1, 107, 3, NULL, 'Louis VIGNAC', 1, '2021-05-04 12:55:44', '2021-05-04 12:55:44', 'Omeka\\Entity\\Item'),
(36, 1, 107, 3, NULL, 'Victoria HUGO', 1, '2021-05-04 12:56:33', '2021-05-04 12:56:33', 'Omeka\\Entity\\Item');

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
(106, 1, 5, 'tests', 'tests', NULL),
(107, 1, 5, 'testedpatient', 'patients testés', NULL),
(108, 1, 5, 'patientforrendezvous', 'patients pour rendez-vous', NULL),
(109, 1, 5, 'planning', 'planning', NULL);

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
(2, 1, 108, NULL, NULL, 'Patients pour rendez-vous'),
(3, 1, 107, NULL, NULL, 'Patients testés'),
(4, 1, 106, NULL, NULL, 'Tests'),
(5, 1, 109, NULL, NULL, 'Planning');

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
(22, 2, 187, NULL, NULL, 2, NULL, 0, 0),
(23, 2, 188, NULL, NULL, 3, NULL, 0, 0),
(24, 2, 189, NULL, NULL, 4, NULL, 0, 0),
(25, 2, 198, NULL, NULL, 5, NULL, 0, 0),
(26, 3, 1, NULL, NULL, 1, NULL, 0, 0),
(27, 3, 187, NULL, NULL, 2, NULL, 0, 0),
(28, 3, 188, NULL, NULL, 3, NULL, 0, 0),
(29, 3, 189, NULL, NULL, 4, NULL, 0, 0),
(30, 3, 196, NULL, NULL, 5, NULL, 0, 0),
(31, 4, 1, NULL, NULL, 1, NULL, 0, 0),
(32, 4, 191, NULL, NULL, 2, NULL, 0, 0),
(33, 4, 192, NULL, NULL, 3, NULL, 0, 0),
(34, 4, 197, NULL, NULL, 4, NULL, 0, 0),
(35, 5, 1, 'Date', NULL, 1, NULL, 0, 0),
(36, 5, 194, NULL, NULL, 2, NULL, 0, 0),
(37, 3, 195, NULL, NULL, 6, NULL, 0, 0);

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
('3d540d02b25f70949c17090d7c3465e9', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303132373431342e3034353438353937333335383135343239363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226166326331623632356532366263346138626563313135623165383431346135223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133313030313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223833393966376665666137613734333562363833666561663966353766623936223b733a33323a223665363261303463306462653263353630386632386633386235623030653232223b7d733a343a2268617368223b733a36353a2236653632613034633064626532633536303866323866333862356230306532322d3833393966376665666137613734333562363833666561663966353766623936223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b, 1620127414),
('62851d69f51997d0f13dbd45b6a1098a', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303132373430302e39373431303438383132383636323130393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226130323964636665646364623835333831663962323364353563346336333836223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303132393332383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133303935303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303133303937383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223138386564393961636437336335633038646365373335336233343063343965223b733a33323a223833396266363636366536336132633464633431383064396364626361383433223b7d733a343a2268617368223b733a36353a2238333962663636363665363361326334646334313830643963646263613834332d3138386564393961636437336335633038646365373335336233343063343965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226563313863663166663637336333366364613662646639323366376565303763223b733a33323a226234323561383032306539383265323232313839633966343639396436663564223b733a33323a223737306366633462386338373933653665303132323630616434383932663630223b733a33323a223531666262666236323563343066336464653162343965623433336638613933223b733a33323a223531653533366564633430336436336630626230613932666234303937666261223b733a33323a223834313830633330656138343633643334393665303662336437323933353932223b733a33323a226163393432383939643865666335653465633461646461333331386139653133223b733a33323a226264373436646132353564333037313866313534313966333933303832366634223b7d733a343a2268617368223b733a36353a2262643734366461323535643330373138663135343139663339333038323666342d6163393432383939643865666335653465633461646461333331386139653133223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223437363835633537303237663865643730663731376566373665333932383362223b733a33323a223231363332323234366162646133636332316138393230623737333764373966223b733a33323a223439663964653464623334343263623435336463633463373636316266656131223b733a33323a223031376134663532393432643339373135313832363366646565313930666262223b733a33323a223961643034663262316663383764366666616363316261373733636564333734223b733a33323a223661326534373361373038303133326364363535386630326266626233626639223b733a33323a223830666566346332333364656438613133396564666461646135616432303631223b733a33323a226261373663336665636130396136613366323563623862326238613634306164223b7d733a343a2268617368223b733a36353a2262613736633366656361303961366133663235636238623262386136343061642d3830666566346332333364656438613133396564666461646135616432303631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620127400),
('774ed228d1b38d14b20af4908312818d', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303133333039352e3337393235323931303631343031333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223561656438663832613736663566383633353133356161633234323434393635223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133313031343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133363038363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303133363534373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133323338323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133353833363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223732396133356538666430333838646365646465616332336639316362313138223b733a33323a223637643966373738313965373466313234653338613761623833396138306330223b7d733a343a2268617368223b733a36353a2236376439663737383139653734663132346533386137616238333961383063302d3732396133356538666430333838646365646465616332336639316362313138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313637323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a226265336262383863323835353662346664316236303964363335623031393933223b733a33323a226163353965333634303635383339373439326339343237326334643065623939223b733a33323a223438316165633931363634636238633761363761346432303364333430316239223b733a33323a223161383266336434323761393835336134663438626362386134623365636163223b733a33323a226236343765386439613463376139626332613661646133346366643365383934223b733a33323a226261363038383561303739316461383433626165613333373730356662646464223b733a33323a226561623831343139663565306362376237663137313139353731346135633662223b733a33323a226134623762613636623439653037636663353937656433363834653139323665223b733a33323a223235653932636539396339326566393732653665313030633162386234616663223b733a33323a223430363963306438333739386633633666623533343834656539653861643434223b733a33323a223462666466313238613734656537336166383838376633313766313038663338223b733a33323a223831396261343634613162653833633365623537343133356566346138303930223b733a33323a226363333136623032613435376433666664366437646561396534663366366263223b733a33323a223832656264316239626433363762633536346264343865303139333035653437223b733a33323a223764333865633631396366623838643636303832303839666132313663383630223b733a33323a223634643638333034616534303865323762313435363736323836303435353839223b733a33323a223638666336346434613266646336653633386139373062616133616163333462223b733a33323a223731333362396362336666636235303864663365656232656139616464343461223b733a33323a223264633037363935353135646637333939623235613832613638353663636435223b733a33323a226134643035393564363830366366333465666264643966396337323935323435223b733a33323a226332323332313634363531616661653664393832646563643835363762346162223b733a33323a223765653833393334393464326234343638353861623939306539303963353139223b733a33323a226335626436386563623231363730333836363164633034616531383734336531223b733a33323a226361383762636438653733373139663064633961343832646366636463333132223b733a33323a226565623265333336366661373164643637646566376437326133633631343333223b733a33323a226636306339653433666262323436646465366538336264393263653566646436223b733a33323a223565306262653565363435646332353066393966623261656565343534636335223b733a33323a223465376132333431626161393130333962653032306239613230303464366336223b733a33323a223963633365656662623130336263336533356163373433346534346632643234223b733a33323a226361646230383836333837646333633266643737633938643166636263636338223b733a33323a223564316236383431353931393265666338643862653365623663366531653033223b733a33323a223435393533623230346337646635333264616131366462313030626464323735223b733a33323a226466396235656331656538393834316665383032663962316565663330333533223b733a33323a226163326636623734323830633030396662633063353336326639356231366433223b7d733a343a2268617368223b733a36353a2261633266366237343238306330303966626330633533363266393562313664332d6466396235656331656538393834316665383032663962316565663330333533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a223762616337626563336338343033393936356638636665653534616464393931223b733a33323a226534393462303330646661366631396139316435656136313161353933366664223b733a33323a226234323366663832343462363132616530353434323863643336316238336163223b733a33323a223034643732643764383766626631326633636166653162383837326434663365223b733a33323a226431373232303539666436353663646132643665336561373936663632393662223b733a33323a223535393833663739656135363465376630396235336162363563623332653163223b733a33323a223731636566613165623361373066356331356434323339643437303566643830223b733a33323a223561623230663335633732316134396632303139323637383261333230353932223b733a33323a226664626163303935383063633564646661343364616165326261333536623562223b733a33323a223964616661323135366138323664653539383738306535383137323163663930223b733a33323a223032326438366633643633363936653330333664376266323433623536376334223b733a33323a223830393063656165333436393364363865346231643731626366626463393232223b733a33323a223039636235363635366637646631656134656561326139636438353963666361223b733a33323a226131633964386237386230613933386331633835306437646466386439383032223b733a33323a223464623562323462663964656438303861646563393937646238323233366332223b733a33323a226462373530366438626335666464353766623334646563336435623338633335223b733a33323a223062393162356130373931613436616561643966343861643738326664373464223b733a33323a226663623838376363316538386430656466383636623839663835623365356335223b733a33323a226166633461623236343834393565396535376136346136313437643761343164223b733a33323a223538303761633430316530633936366362386462623330346330373037306632223b733a33323a223335343162656135363761303765343334666132383363393665373165353832223b733a33323a223264666163373933356637303139323530636431373739393135346636303935223b733a33323a226263326631656137643336643434393864363066626463306437393664343537223b733a33323a223263393639663837366334366561313431346462316639323631623534356566223b733a33323a226531343766636634333734613839393935386531303165363639373834393762223b733a33323a223661346639333862326634623666613563623138316136303866373466366161223b733a33323a226532663936656466363061346166363034313665313939613166623832353666223b733a33323a226262666232616163336638643930366336313833376238353932363232373330223b733a33323a226363623039366634326266616264393935636564363537346435356561386131223b733a33323a223233643161643565633137613530633864613238643065666338313836326539223b733a33323a223064623236323365363465643034623561366131323433663433616235623532223b733a33323a223563613535626431383461663638366338383738326638623532333237303765223b733a33323a223464373463393264653465656234333762366133363264643935663262366565223b733a33323a223631613863653035383338363464646364396638653931653934643531626664223b733a33323a223765643433373461383630353331343433346161643031643662633862653766223b733a33323a223736626466326530343033636538666266356662643030636666343936633933223b733a33323a226461343538363565393562663132636434383061316230346432313533363530223b733a33323a226330636135666165633761336666313062316165386265366265633366636463223b733a33323a223539303538393037633738643635326634663163313464656631663432623830223b733a33323a223961643238663237363539633465383063663032363434356661636362353538223b733a33323a223336363261383566363136663638653762346231643532303861373338346166223b733a33323a226661333565366665653633613163396263653664633832323232313863356639223b733a33323a223061313561383533326531633936396261613233353635633362373463316566223b733a33323a223161316162663865343039626337316638633339626662626161373837616265223b733a33323a223466316364363164383664633737393637376262343063383963633764343034223b733a33323a223463643166356532653333306439643361306461393361346138396535396266223b733a33323a223138633736366563653837663266613638666533613965396136313733396539223b733a33323a223661623138313532326662313562316663353963616266383032313433613231223b733a33323a223931323937383530396161346537303338396465386631663939373765636133223b733a33323a223336393765323233623935396638633164396365656437343539323566396233223b733a33323a226339343139663665323366316564303666616463616665616438663834613966223b733a33323a226465323463363633663764636563616565356239653862326535303038326433223b733a33323a226333656237656630653135313438616531663937343431393933306361343061223b733a33323a226231303865333135303938666233626230383639626637343130323937303166223b733a33323a223430633431633263646430633065643532626138376237373031643130363261223b733a33323a223730653862316337346231303931313433653334663136653634616165326561223b733a33323a226464356431346139623166343234633834376465616239333231383961656434223b733a33323a226466313638306630623632623431646336636534326563663836366463633439223b733a33323a223661313336356535623839353966313833366639316263663536303865336333223b733a33323a223637326566326538626161303462393736323235643930303638386363633133223b733a33323a223035303262643264623036326461663964613932316530636131656365633233223b733a33323a223561633834303866386239616163386365366533646230613030376239373536223b733a33323a223233306138626163353638316565383335353238373736383263303534626661223b733a33323a226538633538356562626364383064343139376537666233653233346565333032223b733a33323a223863613131313330323632356534303661366166623239353435663531636532223b733a33323a226265333130383938643839373534343836356536383166353934383861666666223b733a33323a223832626531353566316263396138373061653665656331633230346163613465223b733a33323a226363663839663339383238346336636663636531653132646330633330326165223b733a33323a223135613431356138393035333761313032323764636365336263626164626131223b733a33323a226237643138643963626131346461383465373735313461633934653639333163223b733a33323a226363376132323863616331666435353136613264383734353339656565653436223b733a33323a223766623962366339633964393135306434366161396230656130333036346263223b733a33323a223733643463646561316161613361643634343163623535386162653861643861223b733a33323a226437663538393963313061653430323930633839353336653639633339393863223b733a33323a226535346333366138393038643938613763663665316638623762376532633737223b733a33323a226639336337636263313963326131666537326163643164306565653934613165223b733a33323a226233366661353834636532663861326331333965346139336237653238363865223b733a33323a223336333937316465656232646138653261353266626565343565386136636631223b733a33323a223736306361396337356130356631363137323737376264653637363730643637223b733a33323a223362633435653261303263383233356638313061333162636461326439336364223b7d733a343a2268617368223b733a36353a2233626334356532613032633832333566383130613331626364613264393363642d3736306361396337356130356631363137323737376264653637363730643637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226564643737313764613838623439363933346231663139333262656137396165223b733a33323a223363316664623664633731373336333561653237663233646534636534386639223b7d733a343a2268617368223b733a36353a2233633166646236646337313733363335616532376632336465346365343866392d6564643737313764613838623439363933346231663139333262656137396165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3837313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223966353539643631663065373139393931643932323463313338616338326464223b733a33323a223330613738336361396264633563383430653239656262393334643136656565223b733a33323a226361346134636338386136356466626638656364383164636334336631316561223b733a33323a226138326536623735623365353133323031643632353264333539643235643333223b733a33323a226639333633663531313565353064336134393237373666623864333830633631223b733a33323a223132373537666135623433613830343634383838643464393931346465383931223b733a33323a223462616336383464376336613132316336363834623361333839306133353930223b733a33323a226433363963613538373761613733373134643539333530356332343930393433223b733a33323a226435633534323531313865336363643562363734306630303661646264316337223b733a33323a223133666464613662663062303931346566316435663938316233633064306331223b733a33323a223330643037393937343530363464666536323633373534643530376338303662223b733a33323a223764633363663637396261383532623765366663373333393333326637633534223b733a33323a223631356564623461613166623838396232353732333963666639636466653161223b733a33323a226637313461313434656566663538633638333537326333393336306533353733223b7d733a343a2268617368223b733a36353a2266373134613134346565666635386336383335373263333933363065333537332d3631356564623461613166623838396232353732333963666639636466653161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620133095);

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
('administrator_email', '\"tom.blachon@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Gestion COVID\"'),
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

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'tom.blachon@gmail.com', 'Tom Blachon', '2021-05-04 10:55:26', '2021-05-04 10:55:26', '$2y$10$j.tFSlkcDqERmCAK1o6q2O3KhLddvRpDUUzyy/5MjWvTJjOnyfHkO', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-05-04 11:21:34', '2021-05-04 11:22:57', '$2y$10$Q92dKn8uZPxHcfImkikW0OhxLppfJjspZF4hpFDqu8V7jLib6p0Ca', 'global_admin', 1);

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
('locale', 1, '\"fr\"'),
('locale', 2, '\"\"');

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
(1, 2, 1, NULL, 'literal', '', '2021-05-07', NULL, 1),
(2, 2, 194, NULL, 'literal', '', '203151', NULL, 1),
(3, 3, 1, NULL, 'literal', '', '2021-05-06', NULL, 1),
(4, 3, 194, NULL, 'literal', '', '199942', NULL, 1),
(5, 4, 1, NULL, 'literal', '', '2021-05-05', NULL, 1),
(6, 4, 194, NULL, 'literal', '', '189654', NULL, 1),
(7, 5, 1, NULL, 'literal', '', '2021-05-04', NULL, 1),
(8, 5, 194, NULL, 'literal', '', '148963', NULL, 1),
(9, 6, 1, NULL, 'literal', '', '2021-05-03', NULL, 1),
(10, 6, 194, NULL, 'literal', '', '153677', NULL, 1),
(11, 7, 1, NULL, 'literal', '', '2021-05-02', NULL, 1),
(12, 7, 194, NULL, 'literal', '', '168453', NULL, 1),
(13, 8, 1, NULL, 'literal', '', '2021-05-01', NULL, 1),
(14, 8, 194, NULL, 'literal', '', '159634', NULL, 1),
(15, 9, 1, NULL, 'literal', '', 'Antigénique', NULL, 1),
(16, 9, 191, NULL, 'literal', '', '3,5€', NULL, 1),
(17, 9, 192, NULL, 'literal', '', 'Pologne', NULL, 1),
(18, 9, 197, 8, 'resource', NULL, NULL, NULL, 1),
(19, 9, 197, 5, 'resource', NULL, NULL, NULL, 1),
(20, 9, 197, 3, 'resource', NULL, NULL, NULL, 1),
(21, 9, 197, 2, 'resource', NULL, NULL, NULL, 1),
(22, 10, 1, NULL, 'literal', '', 'RT-PCR', NULL, 1),
(23, 10, 191, NULL, 'literal', '', '12,7€', NULL, 1),
(24, 10, 192, NULL, 'literal', '', 'Italie', NULL, 1),
(25, 10, 197, 8, 'resource', NULL, NULL, NULL, 1),
(26, 10, 197, 7, 'resource', NULL, NULL, NULL, 1),
(27, 10, 197, 6, 'resource', NULL, NULL, NULL, 1),
(28, 10, 197, 5, 'resource', NULL, NULL, NULL, 1),
(29, 11, 1, NULL, 'literal', '', 'Salivaire', NULL, 1),
(30, 11, 191, NULL, 'literal', '', '7,4€', NULL, 1),
(31, 11, 192, NULL, 'literal', '', 'France', NULL, 1),
(32, 11, 197, 4, 'resource', NULL, NULL, NULL, 1),
(33, 11, 197, 3, 'resource', NULL, NULL, NULL, 1),
(34, 11, 197, 2, 'resource', NULL, NULL, NULL, 1),
(35, 12, 1, NULL, 'literal', '', 'Sérologique', NULL, 1),
(36, 12, 191, NULL, 'literal', '', '13,1€', NULL, 1),
(37, 12, 192, NULL, 'literal', '', 'Espagne', NULL, 1),
(38, 12, 197, 7, 'resource', NULL, NULL, NULL, 1),
(39, 12, 197, 5, 'resource', NULL, NULL, NULL, 1),
(40, 12, 197, 3, 'resource', NULL, NULL, NULL, 1),
(41, 13, 1, NULL, 'literal', '', 'Louis DUPOND', NULL, 1),
(42, 13, 187, NULL, 'literal', '', '25', NULL, 1),
(43, 13, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(44, 13, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(45, 13, 198, 4, 'resource', NULL, NULL, NULL, 1),
(46, 14, 1, NULL, 'literal', '', 'Jeanne DURAND', NULL, 1),
(47, 14, 187, NULL, 'literal', '', '68', NULL, 1),
(48, 14, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(49, 14, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(50, 14, 198, 2, 'resource', NULL, NULL, NULL, 1),
(51, 15, 1, NULL, 'literal', '', 'Therese SIANEY', NULL, 1),
(52, 15, 187, NULL, 'literal', '', '63', NULL, 1),
(53, 15, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(54, 15, 189, NULL, 'literal', '', 'Migraines', NULL, 1),
(55, 15, 198, 7, 'resource', NULL, NULL, NULL, 1),
(56, 16, 1, NULL, 'literal', '', 'Paul TRIBOUL', NULL, 1),
(57, 16, 187, NULL, 'literal', '', '42', NULL, 1),
(58, 16, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(59, 16, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(60, 16, 198, 5, 'resource', NULL, NULL, NULL, 1),
(61, 17, 1, NULL, 'literal', '', 'Abdel BLARIOT', NULL, 1),
(62, 17, 187, NULL, 'literal', '', '37', NULL, 1),
(63, 17, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(64, 17, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(65, 17, 198, 5, 'resource', NULL, NULL, NULL, 1),
(66, 18, 1, NULL, 'literal', '', 'Leslie SOUCHANG', NULL, 1),
(67, 18, 187, NULL, 'literal', '', '19', NULL, 1),
(68, 18, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(69, 18, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(70, 18, 198, 3, 'resource', NULL, NULL, NULL, 1),
(71, 19, 1, NULL, 'literal', '', 'Zeus MILOS', NULL, 1),
(72, 19, 187, NULL, 'literal', '', '57', NULL, 1),
(73, 19, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(74, 19, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(75, 19, 198, 6, 'resource', NULL, NULL, NULL, 1),
(76, 20, 1, NULL, 'literal', '', 'Benoît PULARD', NULL, 1),
(77, 20, 187, NULL, 'literal', '', '17', NULL, 1),
(78, 20, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(79, 20, 189, NULL, 'literal', '', 'Migraines', NULL, 1),
(80, 20, 198, 8, 'resource', NULL, NULL, NULL, 1),
(81, 21, 1, NULL, 'literal', '', 'Habess LABOUILLE', NULL, 1),
(82, 21, 187, NULL, 'literal', '', '64', NULL, 1),
(83, 21, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(84, 21, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(85, 21, 198, 3, 'resource', NULL, NULL, NULL, 1),
(86, 22, 1, NULL, 'literal', '', 'Jean VALJEAN', NULL, 1),
(87, 22, 187, NULL, 'literal', '', '54', NULL, 1),
(88, 22, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(89, 22, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(90, 22, 198, 2, 'resource', NULL, NULL, NULL, 1),
(91, 23, 1, NULL, 'literal', '', 'Maxime CARVANA', NULL, 1),
(92, 23, 187, NULL, 'literal', '', '33', NULL, 1),
(93, 23, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(94, 23, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(95, 23, 198, 4, 'resource', NULL, NULL, NULL, 1),
(96, 24, 1, NULL, 'literal', '', 'Samira DIDLO', NULL, 1),
(97, 24, 187, NULL, 'literal', '', '85', NULL, 1),
(98, 24, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(99, 24, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(100, 24, 198, 4, 'resource', NULL, NULL, NULL, 1),
(101, 25, 1, NULL, 'literal', '', 'Alexandre SOLEIL', NULL, 1),
(102, 25, 187, NULL, 'literal', '', '25', NULL, 1),
(103, 25, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(104, 25, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(105, 25, 196, 6, 'resource', NULL, NULL, NULL, 1),
(106, 25, 195, 10, 'resource', NULL, NULL, NULL, 1),
(107, 26, 1, NULL, 'literal', '', 'Marine MONROE', NULL, 1),
(108, 26, 187, NULL, 'literal', '', '68', NULL, 1),
(109, 26, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(110, 26, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(111, 26, 196, 5, 'resource', NULL, NULL, NULL, 1),
(112, 26, 195, 9, 'resource', NULL, NULL, NULL, 1),
(113, 27, 1, NULL, 'literal', '', 'Therese BONNAY', NULL, 1),
(114, 27, 187, NULL, 'literal', '', '63', NULL, 1),
(115, 27, 188, NULL, 'literal', '', 'Paris', NULL, 1),
(116, 27, 189, NULL, 'literal', '', 'Migraines', NULL, 1),
(117, 27, 196, 6, 'resource', NULL, NULL, NULL, 1),
(118, 27, 195, 10, 'resource', NULL, NULL, NULL, 1),
(119, 28, 1, NULL, 'literal', '', 'Paul PERRIN', NULL, 1),
(120, 28, 187, NULL, 'literal', '', '42', NULL, 1),
(121, 28, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(122, 28, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(123, 28, 196, 8, 'resource', NULL, NULL, NULL, 1),
(124, 28, 195, 10, 'resource', NULL, NULL, NULL, 1),
(125, 29, 1, NULL, 'literal', '', 'Omar HASSAD', NULL, 1),
(126, 29, 187, NULL, 'literal', '', '37', NULL, 1),
(127, 29, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(128, 29, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(129, 29, 196, 6, 'resource', NULL, NULL, NULL, 1),
(130, 29, 195, 11, 'resource', NULL, NULL, NULL, 1),
(131, 30, 1, NULL, 'literal', '', 'Lizie SOUTIPHONG', NULL, 1),
(132, 30, 187, NULL, 'literal', '', '19', NULL, 1),
(133, 30, 188, NULL, 'literal', '', 'Lyon', NULL, 1),
(134, 30, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(135, 30, 196, 5, 'resource', NULL, NULL, NULL, 1),
(136, 30, 195, 9, 'resource', NULL, NULL, NULL, 1),
(137, 31, 1, NULL, 'literal', '', 'Francis BERTRAND', NULL, 1),
(138, 31, 187, NULL, 'literal', '', '57', NULL, 1),
(139, 31, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(140, 31, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(141, 31, 196, 4, 'resource', NULL, NULL, NULL, 1),
(142, 31, 195, 12, 'resource', NULL, NULL, NULL, 1),
(143, 32, 1, NULL, 'literal', '', 'Micheline SIGNOREL', NULL, 1),
(144, 32, 187, NULL, 'literal', '', '17', NULL, 1),
(145, 32, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(146, 32, 189, NULL, 'literal', '', 'Migraines', NULL, 1),
(147, 32, 196, 3, 'resource', NULL, NULL, NULL, 1),
(148, 32, 195, 10, 'resource', NULL, NULL, NULL, 1),
(149, 33, 1, NULL, 'literal', '', 'Maya ZETONG', NULL, 1),
(150, 33, 187, NULL, 'literal', '', '64', NULL, 1),
(151, 33, 188, NULL, 'literal', '', 'Marseille', NULL, 1),
(152, 33, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(153, 33, 196, 8, 'resource', NULL, NULL, NULL, 1),
(154, 33, 195, 9, 'resource', NULL, NULL, NULL, 1),
(155, 34, 1, NULL, 'literal', '', 'Pedro RAMIREZ', NULL, 1),
(156, 34, 187, NULL, 'literal', '', '54', NULL, 1),
(157, 34, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(158, 34, 189, NULL, 'literal', '', 'Perte de goût', NULL, 1),
(159, 34, 196, 4, 'resource', NULL, NULL, NULL, 1),
(160, 34, 195, 11, 'resource', NULL, NULL, NULL, 1),
(161, 35, 1, NULL, 'literal', '', 'Louis VIGNAC', NULL, 1),
(162, 35, 187, NULL, 'literal', '', '33', NULL, 1),
(163, 35, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(164, 35, 189, NULL, 'literal', '', 'Toux', NULL, 1),
(165, 35, 196, 5, 'resource', NULL, NULL, NULL, 1),
(166, 35, 195, 12, 'resource', NULL, NULL, NULL, 1),
(167, 36, 1, NULL, 'literal', '', 'Victoria HUGO', NULL, 1),
(168, 36, 187, NULL, 'literal', '', '85', NULL, 1),
(169, 36, 188, NULL, 'literal', '', 'Avignon', NULL, 1),
(170, 36, 189, NULL, 'literal', '', 'Difficultés respiratoires', NULL, 1),
(171, 36, 196, 7, 'resource', NULL, NULL, NULL, 1),
(172, 36, 195, 9, 'resource', NULL, NULL, NULL, 1);

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
(5, 1, 'https://covidlikecoviderse.covid-verse.fr/onto/covid', 'covid', 'Gestion du Covid', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
