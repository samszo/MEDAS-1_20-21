-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 23 mars 2021 à 11:14
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk_medas1_20-21`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'items', 1, 1, 'Titi', 'Titi\nTweety\nPetit oiseau malin\nSmart little bird\nhttps://fr.wikipedia.org/wiki/Bob_Clampett Bob Clampett\nhttps://fr.wikipedia.org/wiki/Friz_Freleng Friz Freleng\n1942\nGros minet'),
(2, 'media', 1, 1, 'Titi timide', 'Titi timide'),
(3, 'media', 1, 1, NULL, ''),
(7, 'item_sets', 1, 1, 'Dessins animés', 'Dessins animés'),
(8, 'item_sets', 1, 1, 'Dessins animés', 'Dessins animés'),
(9, 'items', 1, 1, 'Gros minet', 'Gros minet\nSylvester the Cat\nChat un peu bête'),
(10, 'items', 1, 1, 'Détail titi', 'Détail titi\nTiti');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`) VALUES
(1),
(9),
(10);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(7, 0),
(8, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`) VALUES
(2, 1, 'url', 'file', NULL, 'https://api.arretsurimages.net/api/public/media/nouveau-media-35014/action/show?format=public&t=2017-11-15T16:42:22+01:00', 'image/jpeg', '65daab7093c4a0cf66349bdff712146caac667d9', 'jpeg', 'b5cbe8231cf72e333d0c69159021903480d02e453b9f8fdd7b09300203c456fc', 44854, 1, 1, 1, NULL),
(3, 1, 'html', 'html', '{\"html\":\"<p><iframe allowfullscreen=\\\"\\\" height=\\\"450\\\" loading=\\\"lazy\\\" src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d17842.208195713025!2d2.339387541709988!3d48.8615203469645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e0556a60823%3A0x46dad820509383bc!2sConservatoire%20national%20des%20arts%20et%20m%C3%A9tiers!5e0!3m2!1sfr!2sfr!4v1615555432467!5m2!1sfr!2sfr\\\" style=\\\"border:0;\\\" width=\\\"600\\\"><\\/iframe><\\/p>\\r\\n\"}', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL),
(4, 1, 'youtube', 'youtube', '{\"id\":\"4tuy7AChGSI\"}', 'https://www.youtube.com/watch?v=4tuy7AChGSI', NULL, '51f5c32caadfc815d3408a11d9045392657be3ab', NULL, NULL, NULL, 0, 1, 3, NULL),
(5, 1, 'iiif', 'iiif', '{\"profile\":\"http:\\/\\/library.stanford.edu\\/iiif\\/image-api\\/1.1\\/compliance.html#level2\",\"width\":4661,\"height\":6170,\"@context\":\"http:\\/\\/library.stanford.edu\\/iiif\\/image-api\\/1.1\\/context.json\",\"@id\":\"https:\\/\\/gallica.bnf.fr\\/iiif\\/ark:\\/12148\\/bpt6k8878211\\/f3\"}', 'https://gallica.bnf.fr/iiif/ark:/12148/bpt6k8878211/f3/info.json', NULL, '264c1e06685828d0b6efb2df919a45db766a2070', NULL, NULL, NULL, 0, 1, 4, NULL),
(6, 1, 'html', 'html', '{\"o:is_public\":\"1\",\"dcterms:title\":[{\"@value\":\"\",\"property_id\":\"1\",\"type\":\"literal\"}],\"html\":\"<p><a href=\\\"https:\\/\\/gallica.bnf.fr\\/ark:\\/12148\\/bpt6k8878211\\/f3.item.zoom\\\" target=\\\"_blank\\\"><img src=\\\"https:\\/\\/gallica.bnf.fr\\/iiif\\/ark:\\/12148\\/bpt6k8878211\\/f3\\/676.9858124793504,792.3675837321256,2577.24600844095,1790.881576731605\\/508,353\\/0\\/native.jpg\\\" \\/><\\/a><\\/p>\\r\\n\",\"o:ingester\":\"html\"}', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('GnwsuLLulVf5S8BuyYZIFPLdPvUPXbwW', 2, '2021-02-23 11:13:52', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
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
(185, 1, 5, 'enemy', 'enemy', NULL),
(186, 1, 6, 'x', 'x', NULL),
(187, 1, 6, 'y', 'y', NULL),
(188, 1, 6, 'xRatingValue', 'xRatingValue', NULL),
(189, 1, 6, 'yRatingValue', 'yRatingValue', NULL),
(190, 1, 6, 'degradName', 'degradName', NULL),
(191, 1, 6, 'degradColors', 'degradColors', NULL),
(192, 1, 6, 'creationDate', 'creationDate', NULL),
(193, 1, 6, 'hasActant', 'a comme actant', NULL),
(194, 1, 6, 'hasDoc', 'a comme document', NULL),
(195, 1, 6, 'hasConcept', 'a comme concept', NULL),
(196, 1, 6, 'hasRapport', 'a comme rapport', NULL),
(197, 1, 6, 'hasCrible', 'a comme crible', NULL),
(198, 1, 6, 'cribleLabel', 'cribleLabel', NULL),
(199, 1, 6, 'cribleId', 'cribleId', NULL),
(200, 1, 6, 'cribleRatingValue', 'cribleRatingValue', NULL),
(201, 1, 6, 'distanceCenter', 'distance du centre', NULL),
(202, 1, 6, 'distanceConcept', 'distance du concept', NULL),
(203, 1, 6, 'ordreCrible', 'Ordre dans le crible', NULL),
(204, 1, 6, 'hasCribleCarto', 'a comme cartographie', NULL),
(205, 1, 7, 'accessToElement', 'Access to element', 'An entry rule refers to a specific Road element.'),
(206, 1, 7, 'approvedByPa', 'Approved by PA', 'To connect a resolution to the municipality that have approved it.'),
(207, 1, 7, 'arrangedOnRoad', 'Arranged on road', 'To connect each beacon to the road in which it is installed.'),
(208, 1, 7, 'atBusStop', 'At bus stop', 'Each forecast refers to a specific bus stop.'),
(209, 1, 7, 'beginsAtJunction', 'Begins at junction', 'Each routeLink, has a beginning and an end junction.'),
(210, 1, 7, 'belongToMunicipality', 'Belong to municipality', 'A municipality can be divided in districts.'),
(211, 1, 7, 'belongToRoad', 'Belong to road', 'Each road has street numbers.'),
(212, 1, 7, 'coincideWith', 'Coincide with', 'There is no exact match between Road and AdministrativeRoad.'),
(213, 1, 7, 'composeDirection', 'Compose direction', 'A railway Direction is composed by more railway element.'),
(214, 1, 7, 'composeSection', 'Compose section', 'A railway Section is composed by more railway element.'),
(215, 1, 7, 'concernLine', 'Concern line', 'An AVMrecord concert to a unique line.'),
(216, 1, 7, 'concerningNode', 'Concerning node', 'A maneuver takes place in correspondence of a node.'),
(217, 1, 7, 'consistOfElement', 'Consist of element', 'A railway Direction is composed by more railway element.'),
(218, 1, 7, 'containsElement', 'Contains element', 'A road is formed by more elements road.'),
(219, 1, 7, 'correspondToJunction', 'Correspond to junction', 'Train station and good yard are located precisely on a junction.'),
(220, 1, 7, 'correspondsTo', 'Corresponds to', 'There is no exact match between Road and AdministrativeRoad.'),
(221, 1, 7, 'endAtJunction', 'End at junction', 'A railway element is delimited by two junctions.'),
(222, 1, 7, 'endingJunction', 'Ending junction', 'A road link is delimited by two junctions.'),
(223, 1, 7, 'endsAtNode', 'Ends at node', 'A road element is delimited by 2 nodes.'),
(224, 1, 7, 'endsAtStop', 'Ends at stop', 'A route section is delimited by two consecutive bus stops.'),
(225, 1, 7, 'finishesAtJunction', 'Finishes at junction', 'Each routeLink, has a beginning and an end junction.'),
(226, 1, 7, 'formingAdminRoad', 'Forming administrative road', 'More road elements form an administrative road.'),
(227, 1, 7, 'formsTable', 'Forms table', 'More road sensors form a sensor Table.'),
(228, 1, 7, 'hasAVMRecord', 'Has avm record', 'The AVM refer to a specific ride code.'),
(229, 1, 7, 'hasAccess', 'Has acceess', 'Point corresponding to the house number of service.'),
(230, 1, 7, 'hasBObservation', 'Has beacon observation', 'To connect each beacon to observations that it produces.'),
(231, 1, 7, 'hasCarParkSensor', 'Has car park sensor', 'To connect each car park to its installed sensor.'),
(232, 1, 7, 'hasDistrict', 'Has district', 'A municipality can be divided in districts.'),
(233, 1, 7, 'hasElement', 'Has element', 'A railway line is composed by more railway element.'),
(234, 1, 7, 'hasExpectedTime', 'Has expected time', 'The expected time at the next bus stops.'),
(235, 1, 7, 'hasExternalAccess', 'Has external access', 'It corresponds to the outer gate of the building.'),
(236, 1, 7, 'hasFirstElem', 'Has first element', 'The first element concerned by the maneuver.'),
(237, 1, 7, 'hasFirstSection', 'Has first section', 'Defines which is the departure section of a route.'),
(238, 1, 7, 'hasFirstStop', 'Has first stop', 'Defines which is the departure stop of a route.'),
(239, 1, 7, 'hasForecast', 'Has forecast', 'Each forecast refers to a specific bus stop.'),
(240, 1, 7, 'hasGeometry', 'Has geometry', 'Some services and all railway elements have a specific geometry like polygons or linestrings.'),
(241, 1, 7, 'hasInternalAccess', 'Has internal access', 'It corresponds to the door of the building.'),
(242, 1, 7, 'hasLastStop', 'Has last stop', 'Defines which is the last stop of a route.'),
(243, 1, 7, 'hasLastStopTime', 'Has last stop time', 'The arrival time at last bus stops.'),
(244, 1, 7, 'hasManeuver', 'Has maneuver', 'An entry rule can be connected to a specific maneuver.'),
(245, 1, 7, 'hasMonitoringStation', 'Has monitoring station', 'Relates an ICQA agglomeration to its monitoring stations.'),
(246, 1, 7, 'hasMunicipality', 'Has municipality', 'A province is formed by more municipalities.'),
(247, 1, 7, 'hasObservation', 'Has observation', 'Each road sensor produce a report every 20 minutes.'),
(248, 1, 7, 'hasPrediction', 'Has prediction', 'A report is made up of more predictions.'),
(249, 1, 7, 'hasProvince', 'Has province', 'In a region there are more than one province.'),
(250, 1, 7, 'hasRecord', 'Has record', 'Every 10 minutes a sensor sends a report.'),
(251, 1, 7, 'hasRegularService', 'Has regular service', 'Regular services can be connected to transverse services.'),
(252, 1, 7, 'hasResolution', 'Has resolution', 'To connect a resolution to the municipality that have approved it.'),
(253, 1, 7, 'hasRoadElement', 'Has road element', 'More road elements form an administrative road.'),
(254, 1, 7, 'hasRoute', 'Has route', 'Each route refers to a line.'),
(255, 1, 7, 'hasRouteLink', 'Has route link', 'A route section is composed by more route link.'),
(256, 1, 7, 'hasRule', 'Has rule', 'Some road elements are subject to rules of access.'),
(257, 1, 7, 'hasSecondElem', 'Has second element', 'The second element concerned the maneuver.'),
(258, 1, 7, 'hasSection', 'Has section', 'Defines all the other section of a route.'),
(259, 1, 7, 'hasSegment', 'Has segment', 'Each road element can be see as a collection of consecutive road link.'),
(260, 1, 7, 'hasStatistic', 'Has statistic', 'To connect a statistic to the referred municipality.'),
(261, 1, 7, 'hasStreetNumber', 'Has street number', 'Each road has street numbers.'),
(262, 1, 7, 'hasThirdElem', 'Has third element', 'The third element concerned the maneuver.'),
(263, 1, 7, 'hasTransferService', 'Has transfer Service', 'To connect each train station to the correspondant service.'),
(264, 1, 7, 'hasTransverseService', 'Has transverse service', 'Regular services can be connected to transverse services.'),
(265, 1, 7, 'hasWeatherReport', 'Has weather report', 'Each weather forecasts is connected to a municipality.'),
(266, 1, 7, 'inMunicipalityOf', 'In municipality of', 'Municipality to which the road belongs.'),
(267, 1, 7, 'includeForecast', 'Include forecast', 'Each AVMrecord includes more forecasts.'),
(268, 1, 7, 'instantAVM', 'Instant avm', 'The arrival time at last bus stops.'),
(269, 1, 7, 'instantBObserv', 'Instant Beacon Observ', 'Time and date of each Beacon observation.'),
(270, 1, 7, 'instantForecast', 'Instant forecast', 'The expected time at the next bus stops.'),
(271, 1, 7, 'instantObserv', 'Instant observation', 'The time of one observation.'),
(272, 1, 7, 'instantParking', 'Instant parking', 'The generation time of one situation record.'),
(273, 1, 7, 'instantWReport', 'Instant weather report', 'The generation time of a new weather report.'),
(274, 1, 7, 'isComposedByElement', 'Is composed by element', 'A railway section is composed by more railway element.'),
(275, 1, 7, 'isInElement', 'Is in element', 'Each milestone need to refers to a road element.'),
(276, 1, 7, 'isInMunicipality', 'Is in municipality', 'A bus stop can be connected to the municipality to which belong.'),
(277, 1, 7, 'isInRoad', 'Is in road', 'Service and train station can be connected to the referred Road.\n'),
(278, 1, 7, 'isPartOfICQAAgglomeration', 'Is part of ICQA agglomeration', 'Relates each air quality monitoring station to the ICQA agglomerate where it is located.'),
(279, 1, 7, 'isPartOfLine', 'Is part of line', 'A railway line is composed by more railway element.'),
(280, 1, 7, 'isPartOfLot', 'Is part of lot', 'Bus stops and bus lines are part of a lot.'),
(281, 1, 7, 'isPartOfProvince', 'Is part of province', 'A province is formed by more municipalities.'),
(282, 1, 7, 'isPartOfRegion', 'Is part of region', 'In a region there are more than one province.'),
(283, 1, 7, 'isPartOfRoad', 'Is part of Road', 'More road elements compose a road.'),
(284, 1, 7, 'lastStop', 'Last stop', 'The AVMrecord specify which is the last bus stop made.'),
(285, 1, 7, 'managingAuthority', 'Managing authority', 'The authority that deals with the road elements management.'),
(286, 1, 7, 'measuredByBeacon', 'Measured by beacon', 'To connect each observation to the beacon that has produced it.'),
(287, 1, 7, 'measuredBySensor', 'Measured by sensor', 'Each observation refers to only one road sensor.'),
(288, 1, 7, 'measuredDate', 'Measured date', 'Time and date of each Beacon observation.'),
(289, 1, 7, 'measuredTime', 'Measured time', 'The time of one observation.'),
(290, 1, 7, 'observationTime', 'Observation time', 'The generation time of one situation record.'),
(291, 1, 7, 'observeCarPark', 'Observe car park', 'To connect each sensor to the referred car park service.'),
(292, 1, 7, 'onRoute', 'On route', 'Rides and AVMrecords refer to a specific route.'),
(293, 1, 7, 'ownerAuthority', 'Owner authority', 'The authority that owns the administrative road.'),
(294, 1, 7, 'placedInElement', 'Placed in element', 'Each entry need to refers to a road.'),
(295, 1, 7, 'placedOnRoad', 'Placed on road', 'To connect each road sensor to the road in which is installed.'),
(296, 1, 7, 'refersToMunicipality', 'Refers to municipality', 'Specifies the municipality for the weather forecast.'),
(297, 1, 7, 'refersToRide', 'Refers to ride', 'The AVM refer to a specific ride code.'),
(298, 1, 7, 'refersToRoadElement', 'Refers to road element', 'Refers to road element'),
(299, 1, 7, 'relatedToSensor', 'Related to sensor', 'Refers to the parking where the situation record was produced.'),
(300, 1, 7, 'scheduledOnLine', 'Scheduled on line', 'A ride can be scheduled on a single line.'),
(301, 1, 7, 'startAtJunction', 'Start at junction', 'A railway element is delimited by two junctions.'),
(302, 1, 7, 'startingJunction', 'Starting junction', 'A road link is delimited by two junctions.'),
(303, 1, 7, 'startsAtNode', 'Starts at node', 'A road element is delimited by 2 nodes.'),
(304, 1, 7, 'startsAtStop', 'Start at stop', 'A route section is delimited by two consecutive bus stops.'),
(305, 1, 7, 'updateTime', 'Update time', 'The generation time of a new weather report.'),
(306, 1, 7, 'wasteType', 'Waste type', 'Specify the waste type (plastics, paper, glass, and the like).'),
(307, 1, 7, 'abbreviation', 'Abbreviation', 'Abbreviation of the description of the service.'),
(308, 1, 7, 'accessType', 'Access type', 'It provides an information about the data retrieval method (HTTP, Rest, etc.)'),
(309, 1, 7, 'adRoadName', 'Administrative Road Name', 'Official name of the road'),
(310, 1, 7, 'addressVillage', 'address village', 'It helps locate the service, specifying, for example, the historic building where it is located, the neighborhood, or something else.'),
(311, 1, 7, 'adminClass', 'Admin class', 'Administrative classification of the road'),
(312, 1, 7, 'airQuality', 'Air quality', 'It provides a measurement of the level of air pollution'),
(313, 1, 7, 'airQualityBenzene', 'Air quality - Benzene', 'Daily average concentration of Benzene expressed in micrograms per cubic meter.'),
(314, 1, 7, 'airQualityCO', 'Air quality - CO', 'Maximum mobile average over 8h of CO concentration expressed in milligrams per cubic meter'),
(315, 1, 7, 'airQualityCombinedCounter', 'Air quality - Combined', 'It provides an overall measure of air quality, combining different indicators appropriately.'),
(316, 1, 7, 'airQualityH2S', 'Air quality - H2S', 'Maximum hourly concentration of H2S expressed in micrograms per cubic meter'),
(317, 1, 7, 'airQualityICQAValue', 'Air quality - ICQA', 'It provides the value of the ICQA index defined by the Tuscany Region for the measurement of air quality at urban agglomeration level'),
(318, 1, 7, 'airQualityNO2', 'Air quality - NO2', 'Maximum hourly concentration of NO2 expressed in micrograms per cubic meter'),
(319, 1, 7, 'airQualityO3', 'Air quality - O3', 'Maximum hourly concentration of O3 expressed in micrograms per cubic meter'),
(320, 1, 7, 'airQualityPM10', 'Air quality - PM10', 'Daily average concentration of PM10 expressed in micrograms per cubic meter'),
(321, 1, 7, 'airQualityPM2.5', 'Air quality - PM2.5', 'Daily average concentration of PM2.5 expressed in micrograms per cubic meter.'),
(322, 1, 7, 'airQualitySO2', 'Air quality - SO2', 'Maximum hourly concentration of SO2 expressed in micrograms per cubic meter'),
(323, 1, 7, 'alertArea', 'Alert area', 'It identifies ​​the alert area in the context of water hazard prevention'),
(324, 1, 7, 'allowedArmedForcesAccess', 'Allowed armed forces access', 'It indicates whether an access restriction is active but allows transit to the armed forces.'),
(325, 1, 7, 'allowedAuthorizedVehiclesAccess', 'Allowed authorized veihicles access', 'It indicates whether an access restriction is active but still permits transit to authorized vehicles.'),
(326, 1, 7, 'allowedBicycleAccess', 'Allowed bicycle access', 'It indicates whether an access restriction is active but still permits the transit of bicycles.'),
(327, 1, 7, 'allowedDisabledAccess', 'Allowed disabled access', 'It indicates whether an access restriction is active but still allows for the disabled.'),
(328, 1, 7, 'allowedDriverIncludedRentedCarAccess', 'Allowed access to driver included rented car', 'It indicates whether an access restriction is active but still permits transit to cars rented with a driver.'),
(329, 1, 7, 'allowedElectricBicycleAccess', 'Allowed electric bicycle access', 'It indicates whether an access restriction is active but allows transit to electric bicycles.'),
(330, 1, 7, 'allowedExtraurbanBusAccess', 'Allowed extraurban bus access', 'It indicates whether an access restriction is active but allows transit to non-urban buses.'),
(331, 1, 7, 'allowedOnlyEmergencyAccess', 'Allowed only emergency access', 'It indicates whether an access restriction is active but allows transit to rescue vehicles.'),
(332, 1, 7, 'allowedOperatingVehiclesAccess', 'Allowed operating vehicles access', 'It indicates whether an access restriction is active, however it allows transit to the means involved in the work.'),
(333, 1, 7, 'allowedPoliceAndEmergencyAccess', 'Allowed police and emergency access', 'It indicates whether an access restriction is active but allows transit to the police and rescue vehicles.'),
(334, 1, 7, 'allowedUrbanBusAccess', 'Allowed urban bus access', 'It indicates whether an access restriction is active but still allows for urban bus transit.'),
(335, 1, 7, 'alterCode', 'Alter code', 'It indicates an alternative code for the road.'),
(336, 1, 7, 'alternativeEmail', 'Alternative e-mail', 'It indicates a secondary e-mail address.'),
(337, 1, 7, 'alternativeFax', 'Alternative fax', 'It indicates a secondary fax number.'),
(338, 1, 7, 'alternativeTelephone', 'Alternative phone', 'It indicates a secondary phone number.'),
(339, 1, 7, 'altitude', 'Altitude', 'It indicates the altitude to which the weather station is located.'),
(340, 1, 7, 'annualPM10ExceedanceCount', 'Air quality - PM10 Exceedance', 'It provides the count of the number of PM10 threshold strides in the last year.'),
(341, 1, 7, 'areaCode', 'Area code', 'Area code, defined at the municipal level, where the service or sensor  is located.'),
(342, 1, 7, 'areaName', 'Area name', 'Name of the area, defined at the municipal level, where the service or the sensor is located.'),
(343, 1, 7, 'atecoCode', 'Ateco code', 'It provides the ATECO classification code for the service.'),
(344, 1, 7, 'automaticity', 'Automaticity', 'It specifies whether data capture can be executed in a totally automated way or if an operator is needed.'),
(345, 1, 7, 'averageDistance', 'Average distance', 'Average distance between two vehicles passing one from one to the other.'),
(346, 1, 7, 'averageSpeed', 'Average speed', 'Average speed at which vehicles pass.'),
(347, 1, 7, 'averageTime', 'Average time', 'Average time between 2 transits'),
(348, 1, 7, 'axialMass', 'Axial mass', 'It provides a railway line classification code based on the maximum allowed axial mass'),
(349, 1, 7, 'batteryLevel', 'Battery level', 'It indicates the level of the batteries, in a waste container with advanced features.'),
(350, 1, 7, 'blueCodeCount', 'Code blue count', 'It provides an indication of the number of red code patients present in the First Aid facility when detecting. The property is called blue code, resuming the classification used in some English-speaking countries.'),
(351, 1, 7, 'botanicalFamily', 'Botanical family', 'Botanical family'),
(352, 1, 7, 'capacity', 'Capacity', 'The capacity of the parking lot, or the garbage container.'),
(353, 1, 7, 'carParkStatus', 'Car park status', 'It describes the status of the parking lot, indicating whether there are any vacancies, if it is full, or if there is no information on the presence of vacant posts.'),
(354, 1, 7, 'category', 'Category', 'It provides the railway station category, an overall indicator of the quality of the railway line.'),
(355, 1, 7, 'classCode', 'Class code', 'It indicates the color of the civic number, for those cities where there are two independent numbering systems, the red numbers and the black numbers.'),
(356, 1, 7, 'collectionTime', 'Collection time', 'The time when the waste container is emptied.'),
(357, 1, 7, 'combinedTraffic', 'Combined traffic', 'It provides a technical information related to the railroad.'),
(358, 1, 7, 'composition', 'Composition', 'It indicates whether the stretch of road is on a single road or on separate roadways.'),
(359, 1, 7, 'concentration', 'Concentration', 'It provides the concentration of vehicles detected by the traffic sensor.'),
(360, 1, 7, 'currentWaterLevel', 'Current water level', 'It indicates the last detected water level.'),
(361, 1, 7, 'currentWindDirection', 'Current wind direction', 'It provides the last detected wind direction.'),
(362, 1, 7, 'currentWindGustSpeed', 'Current wind gust speed', 'Windness detected by equally fractionating the time, and  returning the peak of the last fraction.'),
(363, 1, 7, 'currentlyActive', 'Currently active', 'Currently active'),
(364, 1, 7, 'dailyO3ExceedanceCount', 'Air quality - O3 exceedance count', 'Number of times in the day that O3 concentracion is over 180mg/m3'),
(365, 1, 7, 'dailyO3ExceedanceHours', 'Air quality - O3 exceedance duration', 'Hours in the day that O3 concentracion is over 180mg/m3'),
(366, 1, 7, 'day', 'Day', 'Day to which the weather forecast refers.'),
(367, 1, 7, 'depthKm', 'Depth', 'Depth in kilometers'),
(368, 1, 7, 'direction', 'Direction', 'Direction of the route.'),
(369, 1, 7, 'distance', 'Distance', 'Distance between two stops within the route.'),
(370, 1, 7, 'districtCode', 'District code', 'Code of the neighborhood where the service is located.'),
(371, 1, 7, 'elemLocation', 'Element location', 'It provides a categorization of the road or rail segment, indicating whether it is on a bridge, rather than inside a tunnel or other.'),
(372, 1, 7, 'elementClass', 'Element class', 'It provides an indication of the importance of the road to which the road segment belongs (motorway, street, urban road and so on)'),
(373, 1, 7, 'elementType', 'Element type', 'It provides a categorization of the road or rail segment, for example, for a road segment, it says if it is located at a crossroad, on a roundabout, on a square, on a parking lot, and so on.'),
(374, 1, 7, 'enrolledStudents', 'number of enrolled students', NULL),
(375, 1, 7, 'entryType', 'Entry type', 'It indicates whether it is an interior pass, rather than an outside outcrop overlooking the public road, or something else.'),
(376, 1, 7, 'estimatedYearsToReturn', 'estimatedYearsToReturn', 'estimatedYearsToReturn'),
(377, 1, 7, 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours'),
(378, 1, 7, 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour'),
(379, 1, 7, 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours'),
(380, 1, 7, 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours'),
(381, 1, 7, 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours'),
(382, 1, 7, 'eventCategory', 'Event category', 'It provides the type of event, whether it is a theatrical work, a festival, an extraordinary opening, a sporting event, and so on.'),
(383, 1, 7, 'eventTime', 'Event time', 'It shows the start time of the event.'),
(384, 1, 7, 'exitRate', 'Exit rate', 'It provides the vehicle exit rate from the parking lot, ie the number of outgoing vehicles per hour.'),
(385, 1, 7, 'expectedTime', 'Expected time', 'Timetable for bus arrival at the stop. TO DELETE WHEN INSTANT FUNCTIONS TO PERFECT.'),
(386, 1, 7, 'exponent', 'Exponent', 'It provides the literal part of the civic number, if present.'),
(387, 1, 7, 'extendName', 'Extend name', 'It provides the full name of the road, including generic naming.'),
(388, 1, 7, 'extendNumber', 'Extend number', 'It provides the civic number for extended, including both the numerical part and the literal number where it is present.'),
(389, 1, 7, 'fillRate', 'Fill rate', 'It provides the parking rate, as the number of inbound vehicles per hour.'),
(390, 1, 7, 'firenzeCard', 'Firenze card', 'It provides whether the service is provided on favorable terms to holders of Firenze Card.'),
(391, 1, 7, 'firstAidState', 'State of First Aid', 'It indicates whether the counts refer to the total number of people standing in the First Aid with that specific code, or only to those who are at a specific stage (visiting, pending, observing, and so on).'),
(392, 1, 7, 'flowRate', 'Flow rate', 'Sliding rate'),
(393, 1, 7, 'free', 'Free', 'It provides the number of free places in the parking lot.'),
(394, 1, 7, 'freeEvent', 'Free event', 'It indicates whether the event is free or paid.'),
(395, 1, 7, 'freephone', 'freephone', 'It provides the green number to dial to get in touch with the service call center.'),
(396, 1, 7, 'gauge', 'Gauge', 'It provides the type of gauge, which can be reduced or standard.  It\'s a technical information relating to the railroad.'),
(397, 1, 7, 'geographicAreaType', 'Geographic area type', 'The geographic area type where the sensor is (eg. urban, suburban).'),
(398, 1, 7, 'greenCodeCount', 'Green code count', 'It provides the number of patients who are admitted to Green Emergency Rescue.'),
(399, 1, 7, 'heightHour', 'Height hour', 'It provides the time when the sun is expected to reach its maximum height.'),
(400, 1, 7, 'hour', 'Hour', 'It provides the time the weather forecast refers to.'),
(401, 1, 7, 'hourO3Max', 'Air quality - Maximum O3 exceedance', 'Hour in the day that O3 concentracion is at maximum'),
(402, 1, 7, 'houseNumber', 'House number', 'It provides the civic number where the service is located or where the event takes place.'),
(403, 1, 7, 'humidity', 'Humidity', 'Percentage of humidity.'),
(404, 1, 7, 'inAgglomeration', 'Agglomeration', 'The agglomeration where the monitoring station is'),
(405, 1, 7, 'internalTemperature', 'Internal temperature', 'Internal temperature'),
(406, 1, 7, 'isSelfService', 'is a self-service', 'It indicates whether the service is a refueling station self-service.'),
(407, 1, 7, 'juncType', 'Junction type', 'It indicates the type of railway junction, for example whether it is a level crossing, a track termination, a freight train, and so on.'),
(408, 1, 7, 'lastObservationHumidity', 'Last observation humidity', 'it indicates the last humidity value detected by the weather station.'),
(409, 1, 7, 'lastStopTime', 'Last stop time', 'The time the bus has reached the last stop. TO BE DELETED WHEN INSTANT FUNCTIONS TO PERFECT.'),
(410, 1, 7, 'lastTriples', 'Last triples', 'It indicates the last date when the RDF triples have been updated.'),
(411, 1, 7, 'lastUpdate', 'Last update', 'It indicates the last date when the source data has been updated.'),
(412, 1, 7, 'leafWetness', 'Leaf wetness', 'Humidity value detected by intelligent sprinkler.'),
(413, 1, 7, 'length', 'Length', 'It provides the length of the road segment (road element) or rail line.'),
(414, 1, 7, 'lineNumber', 'Line number', 'Indica il numero della linea a cui la fermata appartiene.'),
(415, 1, 7, 'lunarPhase', 'Lunar phase', 'Monn phase.'),
(416, 1, 7, 'magnitudeType', 'Magnitude type', 'It indicates the type of magnitude of the earthquake event.'),
(417, 1, 7, 'magnitudeValue', 'Magnitude value', 'It indicates the magnitude of the earthquake event.'),
(418, 1, 7, 'major', 'Major', 'The major, in a Beacon device, is a positive integer that, together with the minor and the UUID, uniquely identifies the device.'),
(419, 1, 7, 'managingAuth', 'Managing authority', 'It identifies the administration or the company responsible for managing the railway station.'),
(420, 1, 7, 'managingBy', 'Managing by', 'AVM system or road sensors operator.'),
(421, 1, 7, 'maneuverType', 'Maneuver type', 'It describes the type of restriction (bifurcation, forbidden maneuver, mandatory maneuver).'),
(422, 1, 7, 'maxTemp', 'Max temperature', 'It provides the maximum expected temperature.'),
(423, 1, 7, 'minTemp', 'Min temperature', 'It provides the minimum expected temperature.'),
(424, 1, 7, 'minor', 'Minor', 'The minor, in a Beacon device, is a positive integer that, together with the major and the UUID, uniquely identifies the device.'),
(425, 1, 7, 'monitoringStationType', 'Monitoring station type', 'Type of montioring station (e.g. fondo, traffico, industriale)'),
(426, 1, 7, 'moonrise', 'Moonrise', 'It provides the expected time for the moon to rise.'),
(427, 1, 7, 'moonset', 'Moonset', 'In indicates the expected time for the moon to set.'),
(428, 1, 7, 'multimediaResource', 'Multimedia resource', 'It provides the Internet address of a media resource related to the service.'),
(429, 1, 7, 'nodeType', 'Node type', 'It provides the node\'s category (intersection, toll, roundabout, roadway terminal, and so on).'),
(430, 1, 7, 'numTrack', 'Track number', 'The number of available tracks. Set to zero in the case of a railway section under construction or discarded.'),
(431, 1, 7, 'number', 'Number', 'It provides the numerical part of the civic number.'),
(432, 1, 7, 'occupancy', 'Occupancy', 'It provides the occupancy rate of the road detected by the traffic sensor.'),
(433, 1, 7, 'occupied', 'Occupied', 'Number of occupied parking spaces.'),
(434, 1, 7, 'operatingStatus', 'Operating status', 'It indicates whether the road element or railroad section is under construction, in operation, or has been discarded.'),
(435, 1, 7, 'otherHouseNumber', 'Other house number', 'It provides a second civic number to which the service can be accessed.'),
(436, 1, 7, 'otherStreetAddress', 'Other street address', 'It provides a second street address to which the service can be accessed.'),
(437, 1, 7, 'overtime', 'Overtime', 'It indicates the maximum execution time of the import process, after which it is killed.'),
(438, 1, 7, 'owner', 'Owner', 'AVM system owner.'),
(439, 1, 7, 'parkOccupancy', 'Park occupancy', 'Percentage of occupied parking spaces.'),
(440, 1, 7, 'parkingSpacesForDisabled', 'Parking spaces for disabled', 'It indicates the number of parking places reserved to disabled people.'),
(441, 1, 7, 'parkingSpacesForScooters', 'Parking spaces for scooters', 'It indicates the number of parking places reserved for scooters and similar.'),
(442, 1, 7, 'payingParkingSpaces', 'Paying parking spaces', 'It indicates the number of available paid places.'),
(443, 1, 7, 'perTemp', 'Perc. temperature', 'Indicates the expected perceived temperature.'),
(444, 1, 7, 'period', 'Period', 'It indicates the time expressed in seconds between two consecutive calls of the same process.'),
(445, 1, 7, 'physicalShape', 'Container shape', 'It indicates the shape of the waste bin with advanced features.'),
(446, 1, 7, 'placeName', 'Place name', 'It indicates the name of the place where the event takes place.'),
(447, 1, 7, 'pollenConcentration', 'Pollen', 'Pollen concentration'),
(448, 1, 7, 'pollenConcentrationLevel', 'Pollen concentration level', 'Pollen concentration level'),
(449, 1, 7, 'pollenConcentrationTrend', 'Pollen concentration trend', 'Pollen concentration trend.'),
(450, 1, 7, 'porteCochere', 'Porte cochere', 'It indicates if the entry is a porte cochere.'),
(451, 1, 7, 'power', 'Power', 'Indicates the power of the lamppost.'),
(452, 1, 7, 'primaryType', 'Primary type', 'It describes the main service that is provided.'),
(453, 1, 7, 'processType', 'Process type', 'It describes the type of process.'),
(454, 1, 7, 'public', 'Public', 'It indicates whether it is a public lighting streetlight.'),
(455, 1, 7, 'railDepartment', 'Rail department', 'It indicates the railway department of which the railway line is part.'),
(456, 1, 7, 'railwaySiding', 'Railway siding', 'It provides the number of sidings available in the goods yard.'),
(457, 1, 7, 'rainfall', 'Rainfall', 'Rainfall Detection'),
(458, 1, 7, 'rainfallLast12Hours', 'Rainfall last 12 hours', 'Rainfall detection within the last 12 hours.'),
(459, 1, 7, 'rainfallLast15Minutes', 'Rainfall last 15 minutes', 'Rainfall detection within the last 15 minutes.'),
(460, 1, 7, 'rainfallLast1Hour', 'Rainfall last 1 hour', 'Rainfall detection within the last hour.'),
(461, 1, 7, 'rainfallLast24Hours', 'Rainfall last 24 hours', 'Rainfall detection within the last 24 hours.'),
(462, 1, 7, 'rainfallLast36Hours', 'Rainfall last 36 hours', 'Rainfall detection within the last 36 hours.'),
(463, 1, 7, 'rainfallLast3Hours', 'Rainfall last 3 hours', 'Rainfall detection within the last 3 hours.'),
(464, 1, 7, 'rainfallLast6Hours', 'Rainfall last 6 hours', 'Rainfall detection within the last 6 hours.'),
(465, 1, 7, 'recTemp', 'Rec temp', 'It returns the temperature actually detected.'),
(466, 1, 7, 'rechargeState', 'Charging station status', 'Describes the status of the column for charging electric vehicles.'),
(467, 1, 7, 'redCodeCount', 'Red code count', 'It provides the number of patients who are admitted to Red Emergency Assistance.'),
(468, 1, 7, 'referencePerson', 'Reference person', 'Reference person'),
(469, 1, 7, 'restrictionType', 'Restriction type', 'It describes the type of the active restriction.'),
(470, 1, 7, 'restrictionValue', 'Restriction value', 'It provides a quantification for the active restriction, when applicable.'),
(471, 1, 7, 'rideState', 'Ride state', 'State of the ride: advance, late, on time.'),
(472, 1, 7, 'riverName', 'River name', 'River name'),
(473, 1, 7, 'roadName', 'Road name', 'It indicates the name of the road without the generic naming.'),
(474, 1, 7, 'roadType', 'Road type', 'It indicates the generic naming only.'),
(475, 1, 7, 'routeCode', 'Route code', 'It provides the code of the thematic path.'),
(476, 1, 7, 'routeLength', 'Route length', 'It provides the route length.'),
(477, 1, 7, 'routePosition', 'Route position', 'It provides the position of the service within the thematic path.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(478, 1, 7, 'severityCode', 'Severity code', 'It provides a code that describes the severity of the event, used for mobility events.'),
(479, 1, 7, 'shortDescription', 'Short description', 'Brief indication of where the service is provided.'),
(480, 1, 7, 'snow', 'Snow', 'It provides a forecast about the snowfalls.'),
(481, 1, 7, 'soilWaterPotential', 'Soil water potential', 'It provides the soil water potential detected by the intelligent sprinkler.'),
(482, 1, 7, 'speedLimit', 'Speed limit', 'It indicates the speed limit in force on the specific road section.'),
(483, 1, 7, 'speedPercentile', 'Speed percentile', 'Percentile calculated on the speeds detected by the traffic sensor.'),
(484, 1, 7, 'state', 'State', 'Describes the status of a charging station for electric vehicles, or a railway station.'),
(485, 1, 7, 'stopNumber', 'Stop number', 'It indicates the number of the TPL stop.'),
(486, 1, 7, 'streetWithCurb', 'Street with curb', 'It indicates if the middle line is replaced by a separation wall.'),
(487, 1, 7, 'streetWithRtzAccess', 'Street with Restricted Traffic Zone access', 'Indicates whether or not the street belongs to a restricted traffic zone.'),
(488, 1, 7, 'studentsAtRefectory', 'number of students at the refectory', NULL),
(489, 1, 7, 'studentsAtSchool', 'number of students present at school', NULL),
(490, 1, 7, 'sunHeight', 'Sun height', 'Indicates the maximum height that will reach the sun during the day.'),
(491, 1, 7, 'sunrise', 'Sunrise', 'Indicates the time at which the sun will rise.'),
(492, 1, 7, 'sunset', 'Sunset', 'Indicates the time at which the sun will set.'),
(493, 1, 7, 'supply', 'Supply', 'Indicates whether it is an electrified line or not.'),
(494, 1, 7, 'surfaceArea', 'Surface area', 'Surface area'),
(495, 1, 7, 'temperature', 'Temperature', 'Temperature detection.'),
(496, 1, 7, 'temperatureLastObservation', 'Temperature last observation', 'It indicates the latest detected temperature value.'),
(497, 1, 7, 'temperatureMaxToday', 'Today max temperature', 'It indicates the maximum temperature value detected during the day.'),
(498, 1, 7, 'temperatureMaxYesterday', 'Yesterday max temperature', 'It indicates the maximum temperature value recorded on the previous day.'),
(499, 1, 7, 'temperatureMinToday', 'Today min temperature', 'It indicates the minimum temperature value detected during the day.'),
(500, 1, 7, 'temperatureMinYesterday', 'Yesterday min temperature', 'It indicates the minimum temperature value recorded on the previous day.'),
(501, 1, 7, 'text', 'Text', 'Returns the text written on the milestone (mileage).'),
(502, 1, 7, 'thresholdPerc', 'Threshold perc', 'Threshold value for the percentile of the speeds detected by the traffic sensor.'),
(503, 1, 7, 'time', 'Time', 'Times of last detection, and times of detection of extreme values, of humidity, precipitation, temperature and wind.'),
(504, 1, 7, 'timeHumidityObservation', 'Time humidity observation', 'Times of last detection, and times of detection of extreme values, of humidity.'),
(505, 1, 7, 'timeLastObservationHumidity', 'Time humidity last observation', 'Time of last detection of the humidity.'),
(506, 1, 7, 'timeLastObservationTemperature', 'Time last temperature observation', 'Time when the most recent temperature test was performed.'),
(507, 1, 7, 'timeLastObservationWind', 'Time wind last observation', 'The time when the latest wind speed detection was performed.'),
(508, 1, 7, 'timeRainfallLastObservation', 'Time rainfall last observation', 'The most recent rainfall detection.'),
(509, 1, 7, 'timeTemperatureObservation', 'Time temperature observation', 'Times of last detection, and times of detection of extreme values, of temperature.'),
(510, 1, 7, 'timeTodayMaxHumidity', 'Time today max humidity', 'Time when the maximum humidity concentration in the air was detected during the day.'),
(511, 1, 7, 'timeTodayMaxTemperature', 'Time today max temperature', 'The time when the maximum temperature was detected during the day.'),
(512, 1, 7, 'timeTodayMaxWindVelocity', 'Time today max wind velocity', 'The time when the maximum windiness was detected during the day.'),
(513, 1, 7, 'timeTodayMinHumidity', 'Time today min humidity', 'The time when the lowest concentration of humidity in the air was detected during the day.'),
(514, 1, 7, 'timeTodayMinTemperature', 'Time today min temperature', 'Time when the minimum temperature was detected during the day.'),
(515, 1, 7, 'timeWaterLevelObservation', 'Time water level observation', 'Time when the most recent water level detection was performed.'),
(516, 1, 7, 'timeWindObservation', 'Time wind observation', 'Times of last detection, and times of detection of extreme values, of windness.'),
(517, 1, 7, 'timeYesterdayMaxHumidity', 'Time yesterday max humidity', 'The time when the highest humidity concentration was detected during the previous day.'),
(518, 1, 7, 'timeYesterdayMaxTemperature', 'Time yesterday max temperature', 'The time when the maximum temperature was detected during the previous day.'),
(519, 1, 7, 'timeYesterdayMaxWindVelocity', 'Time yesterday max wind velocity', 'The time when the maximum windiness was detected during the previous day.'),
(520, 1, 7, 'timeYesterdayMinHumidity', 'time yesterday min humidity', 'Time when the lowest humidity concentration was detected during the previous day.'),
(521, 1, 7, 'timeYesterdayMinTemperature', 'Time yesterday min temperature', 'The time when the lowest temperature was detected during the previous day.'),
(522, 1, 7, 'timestamp', 'Time slot', 'One-second time interval, usually used as a time instant, to provide time allocation to a generic event. EVEN IF INSTANT IS INTRODUCED, THIS ATTRIBUTE MUST BE PRESERVED.'),
(523, 1, 7, 'todayMaxHumidity', 'Today max humidity', 'It provides the maximum value of humidity detected by the weather station throughout the day.'),
(524, 1, 7, 'todayMaxWaterLevel', 'Today max water level', 'It indicates the highest level of water detected in the day.'),
(525, 1, 7, 'todayMaxWindAverageSpeed', 'Today max wind average speed', 'Average windness of the day, determined by averaging the peaks.'),
(526, 1, 7, 'todayMaxWindDirection', 'Today max wind direction', 'It provides the wind direction detected at the peak windness of the day.'),
(527, 1, 7, 'todayMaxWindGustSpeed', 'Today max wind gust speed', 'Windness detected by equally fractionating the day and considering for each fraction the peak value only.'),
(528, 1, 7, 'todayMinHumidity', 'Today min humidity', 'It provides the minimum moisture value detected by the weather station throughout the day.'),
(529, 1, 7, 'todayMinWaterLevel', 'Today min water level', 'It indicates the lowest level of water detected in the day.'),
(530, 1, 7, 'trackType', 'Track type', 'Indicates whether the railway section is single track or double track.'),
(531, 1, 7, 'trafficDir', 'Traffic dir', 'It indicates whether the road section can be traveled in one or both directions.'),
(532, 1, 7, 'type', 'Type', 'It provides a first indication about the service delivered but is not intended to be shown to users.'),
(533, 1, 7, 'typeLabel', 'Type label', 'It provides a first description of the service provided, intended to be displayed to users and therefore available in multiple languages.'),
(534, 1, 7, 'typeOfResale', 'Type of resale', 'It describes the type of resale of TPL tickets (bars, bookstores, tobacconists, stationery, etc.).'),
(535, 1, 7, 'typicalIrrigationTime', 'Typical irrigation time', 'It indicates the usual time when the irrigator comes into operation.'),
(536, 1, 7, 'underpass', 'Underpass', 'It indicates whether the railroad section is within a subway.'),
(537, 1, 7, 'userTagId', 'User tag ID', 'An identifier for the smart waste container user.'),
(538, 1, 7, 'uuid', 'Uuid', 'Identifier that, together with major and minor, uniquely identifies the Beacon device.'),
(539, 1, 7, 'uv', 'Uv', 'Forecast about the intensity of UV rays.'),
(540, 1, 7, 'validityStatus', 'Validity status', 'It indicates whether the parking sensor is active or not.'),
(541, 1, 7, 'value', 'Value', 'It indicates the resulting value from the statistical detection.'),
(542, 1, 7, 'vehicle', 'Vehicle', 'Unique identifier of a local public transport vehicle.'),
(543, 1, 7, 'vehicleFlow', 'Vehicle flow', 'It indicates the flow of vehicles detected by the traffic sensor.'),
(544, 1, 7, 'wasteLevel', 'Waste level', 'It indicates the fill level of the waste bin with advanced features.'),
(545, 1, 7, 'waterLevel', 'Water level', 'Indicators relating to inland water monitoring.'),
(546, 1, 7, 'waterLevelVariation', 'Water level variation', 'Variations detected in the water level sampled every 1, 3, or 6, hours.'),
(547, 1, 7, 'waterLevelVariationLast1Hour', 'Water level variation last 1 hour', 'Variations detected in the water level sampled at every hour.'),
(548, 1, 7, 'waterLevelVariationLast3Hours', 'Water level variation last 3 hours', 'Variations detected in the water level sampled every 3 hours.'),
(549, 1, 7, 'waterLevelVariationLast6Hours', 'Water level variation last 6 hours', 'Variations detected in the water level sampled every 6 hours.'),
(550, 1, 7, 'whiteCodeCount', 'White code count', 'Number of patients admitted to White Emergency Assistance.'),
(551, 1, 7, 'width', 'Width', 'Road section width.'),
(552, 1, 7, 'wind', 'Wind', 'Expected windness.'),
(553, 1, 7, 'windAverageSpeed', 'Wind average speed', 'Average windness.'),
(554, 1, 7, 'windDirection', 'Wind direction', 'Wind direction'),
(555, 1, 7, 'windGustSpeed', 'Wind gust speed', 'Windness detected by equally fractionating the time and considering for each fraction the peak value only.'),
(556, 1, 7, 'yardType', 'Yard type', 'It indicates whether the goods yard is public or private.'),
(557, 1, 7, 'year', 'Year', 'It indicates the year when the resolution was approved.'),
(558, 1, 7, 'yellowCodeCount', 'Yellow code count', 'Number of patients admitted to First Aid in Yellow Code.'),
(559, 1, 7, 'yesterdayMaxHumidity', 'Yesterday max humidity', 'It provides the maximum value of humidity detected by the weather station over the previous day.'),
(560, 1, 7, 'yesterdayMaxWaterLevel', 'Yesterday max water level', 'Maximum water level recorded over the previous day.'),
(561, 1, 7, 'yesterdayMaxWindAverageSpeed', 'Yesterday max wind average speed', 'Average windness of the previous day, determined by averaging the peaks.'),
(562, 1, 7, 'yesterdayMaxWindDirection', 'Yesterday max wind direction', 'It provides the wind direction detected at the peak windness of the previous day.'),
(563, 1, 7, 'yesterdayMaxWindGustSpeed', 'Yesterday max wind gust speed', 'Windness detected by equally fractionating the previous day and considering for each fraction the peak value only.'),
(564, 1, 7, 'yesterdayMinHumidity', 'Yesterday min humidity', 'It provides the minimum value of humidity detected by the weather station over the previous day.'),
(565, 1, 7, 'yesterdayMinWaterLevel', 'Yesterday min water level', 'Minimum water level recorded over the previous day.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 1, 2, NULL, 'Titi', 1, '2021-03-12 13:02:29', '2021-03-12 14:58:52', 'Omeka\\Entity\\Item'),
(2, 1, NULL, NULL, NULL, 'Titi timide', 1, '2021-03-12 13:06:16', '2021-03-12 13:21:46', 'Omeka\\Entity\\Media'),
(3, 1, NULL, NULL, NULL, NULL, 1, '2021-03-12 13:24:42', '2021-03-12 13:26:24', 'Omeka\\Entity\\Media'),
(4, 1, NULL, NULL, NULL, NULL, 1, '2021-03-12 13:27:56', '2021-03-12 13:27:56', 'Omeka\\Entity\\Media'),
(5, 1, NULL, NULL, NULL, NULL, 1, '2021-03-12 13:36:33', '2021-03-12 13:36:33', 'Omeka\\Entity\\Media'),
(6, 1, NULL, NULL, NULL, NULL, 1, '2021-03-12 13:36:43', '2021-03-12 13:36:43', 'Omeka\\Entity\\Media'),
(7, 1, NULL, NULL, NULL, 'Dessins animés', 1, '2021-03-12 13:58:33', '2021-03-12 13:58:33', 'Omeka\\Entity\\ItemSet'),
(8, 1, NULL, NULL, NULL, 'Dessins animés', 1, '2021-03-12 13:58:33', '2021-03-12 13:58:33', 'Omeka\\Entity\\ItemSet'),
(9, 1, 1, 2, NULL, 'Gros minet', 1, '2021-03-12 14:11:46', '2021-03-12 14:11:46', 'Omeka\\Entity\\Item'),
(10, 1, 110, 3, NULL, 'Détail titi', 1, '2021-03-23 09:50:42', '2021-03-23 09:50:42', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
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
(106, NULL, 5, 'FictionalCharacter', 'fictional character', NULL),
(107, 1, 6, 'SemanticPosition', 'SemanticPosition', NULL),
(108, 1, 6, 'Crible', 'Crible', NULL),
(109, 1, 6, 'CriblePosition', 'CriblePosition', NULL),
(110, 1, 6, 'CribleCarto', 'Cartographie d\'un crible', NULL),
(111, 1, 6, 'Actant', 'Actant', NULL),
(112, 1, 6, 'Doc', 'Doc', NULL),
(113, 1, 6, 'Rapport', 'Rapport', NULL),
(114, 1, 6, 'Concept', 'Concept', NULL),
(115, 1, 7, 'AVMRecord', 'AVM Record', 'Corsa programmata da una certa azienda TPL su un certo percorso di una certa linea'),
(116, 1, 7, 'Accommodation', 'Accommodation', 'Hotels and similar structures.'),
(117, 1, 7, 'Accommodation_or_office_containers_rental', 'Accommodation or office containers rental', 'The instances of this class represent, among all business activities, some companies that deal with rental of containers for housing and offices.'),
(118, 1, 7, 'Accountants', 'Accountants', 'The instances of this class represent, among all the business activities, certain commercial, tax and audit firms.'),
(119, 1, 7, 'Addiction_recovery_centre', 'Addiction recovery centre', 'The instances of this class represent, among all business activities, certain communities and recuperation centers from dependencies.'),
(120, 1, 7, 'AdministrativeRoad', 'Administrative Road', 'Class whose instances are the administrative extents defined in the road graph.'),
(121, 1, 7, 'Adult_clothing', 'Adult Clothing', 'The instances of this class represent, among all business activities, certain retail clothing stores for adults.'),
(122, 1, 7, 'Advertising', 'Advertising', 'Advertising-related services.'),
(123, 1, 7, 'Advertising_and_promotion', 'Advertising and promotion', 'The instances of this class represent, among all business activities, certain dealerships and advertising companies.'),
(124, 1, 7, 'Aestestic_medicine_centre', 'Aestestic medicine centre', NULL),
(125, 1, 7, 'Agents', 'Agents', 'The instances of this class represent, among all business activities, certain agencies and agents for the show and sport.'),
(126, 1, 7, 'AgricultureAndLivestock', 'Agriculture and livestock', 'Activities and services relating to agriculture and livestock farming.'),
(127, 1, 7, 'Agritourism', 'Agritourism', 'The instances of this class represent, among all the business activities, certain catering and accommodation activities related to agricultural activities.'),
(128, 1, 7, 'AirQualityObservation', 'Air quality observation', 'Each instance of this class represents an air quality detection.'),
(129, 1, 7, 'Air_quality_monitoring_station', 'Air quality monitoring station', 'The instances of this class are dust-level detectors in the air.\nEach instance represents a specific detector, of a specific type, located in a specific location located through a pair of geospatial coordinates. On the other hand, for each detector there is at most one instance representing it.'),
(130, 1, 7, 'Airfields', 'Airfields', 'The instances of this class represent, among all service locations, some airfields.'),
(131, 1, 7, 'Airplanes_rental', 'Airplanes rental', 'The instances of this class represent, among all business activities, certain chartering activities of air transport.'),
(132, 1, 7, 'Airport_lost_property_office', 'Airport lost property office', 'The instances of this class represent, among all service locations, some offices for lost items at the airport.'),
(133, 1, 7, 'Amusement_activities', 'Amusement activities', 'The instances of this class represent, among all the business activities, some creative, artistic and entertainment activities.'),
(134, 1, 7, 'Amusement_and_theme_parks', 'Amusement and theme parks', 'The instances of this class represent, among all business activities, some amusement and themed parks.'),
(135, 1, 7, 'AnemometryObservation', 'Anemometry observation', 'Each instance of this class represents a speed and wind direction detection.'),
(136, 1, 7, 'Animal_feeds_manufacture', 'Animal Feeds Manufacture', 'The instances of this class represent, among all business activities, some companies that produce animal feed.'),
(137, 1, 7, 'Animal_production', 'Animal Production', 'The instances of this class represent, among all business activities, some animal breeding companies.'),
(138, 1, 7, 'Antiques', 'Antiques', 'The instances of this class represent, among all business activities, certain retail companies of used furniture and antiques.'),
(139, 1, 7, 'Aquarium', 'Aquarium', 'The instances of this class represent, among all service locations, some aquariums.'),
(140, 1, 7, 'Archaeological_site', 'Archaeological site', 'The instances of this class represent, among all business activities, certain archaeological sites.'),
(141, 1, 7, 'Architectural_consulting', 'Architectural consulting', 'The instances of this class represent, among all the business activities, some activities of architectural studies.'),
(142, 1, 7, 'Area', 'Polygonal Service', 'Services represented by a polygonal form area.'),
(143, 1, 7, 'Art_galleries', 'Art Galleries', 'The instances of this class represent, among all the business activities, certain retail companies of art objects including art galleries.'),
(144, 1, 7, 'Artisan_shop', 'Artisanshop', 'The instances of this class represent, among all the business activities, some craft workshops.'),
(145, 1, 7, 'Assistance', 'Assistance', 'The instances of this class represent, among all the services, some personal assistance services.'),
(146, 1, 7, 'Associations', 'Associations', 'The instances of this class represent, among all the business activities, certain business activities carried out by associative organizations.'),
(147, 1, 7, 'Atm', 'Atm', 'The instances of this class represent, among all services, ATMs.'),
(148, 1, 7, 'Auctioning_houses', 'Auctioning Houses', 'The instances of this class represent, among all business activities, some retail auction houses, excluding auction houses via the Internet.'),
(149, 1, 7, 'Audio_and_video', 'Audio and Video', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of audio and video equipment in specialized stores.'),
(150, 1, 7, 'Auditing_activities', 'Auditing activities', 'The instances of this class represent, among all business activities, some auditing activities.'),
(151, 1, 7, 'Auditorium', 'Auditorium', 'The instances of this class represent, among all the business activities, some auditoriums.'),
(152, 1, 7, 'Automobile_driving_and_flying_schools', 'Automobile driving and flying schools', 'The instances of this class include, among all business activities, some driving, flying and nautical schools.'),
(153, 1, 7, 'Bakery', 'Bakery', 'The instances of this class represent, among all business activities, certain bread retail activities, as well as pies, sweets and confectionery.'),
(154, 1, 7, 'Bank', 'Bank', 'The instances of this class represent, among all business activities, some lenders and financial service activities in general.'),
(155, 1, 7, 'Bar', 'Bar', 'The instances of this class include, among all business activities, certain bars and other similar exercises without cooking.'),
(156, 1, 7, 'Beach', 'Beach', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune spiagge.'),
(157, 1, 7, 'Beach_resort', 'Beach resort', 'Such activities represent, among all service locations, some bathing establishments.'),
(158, 1, 7, 'Beacon', 'Beacon', 'Service associated to Beacon that allow to receive offers.'),
(159, 1, 7, 'BeaconObservation', 'Beacon observation', 'lettura proveniente da un singolo beacon'),
(160, 1, 7, 'Beauty_centre', 'Beauty centre', 'The instances of this class represent, among all the business activities, certain services of beauty institutes.'),
(161, 1, 7, 'Bed_and_breakfast', 'Bed and breakfast', 'The instances of this class represent, among all business activities, certain lodging activities in bed and breakfast.'),
(162, 1, 7, 'Bench', 'Bench', 'Each instance of this class represents a bench.'),
(163, 1, 7, 'Betting_shops', 'Betting shops', 'The instances of this class represent, among all business activities, certain betting shops.'),
(164, 1, 7, 'Beverage_manufacture', 'Beverage Manufacture', 'The instances of this class represent, among all business activities, certain beverage production activities.'),
(165, 1, 7, 'BikeRackObservation', 'Bike rack observation', 'Each instance of this class represents a finding of places available in a bicycle rack at a given instant.'),
(166, 1, 7, 'Bike_rack', 'Bike rack', 'Each instance of this class represents a bike rack.'),
(167, 1, 7, 'Bike_rental', 'Bike rental', 'The instances of this class represent, among all business activities, some bicycle rental activities.'),
(168, 1, 7, 'Bike_sharing_rack', 'Bike sharing rack', NULL),
(169, 1, 7, 'Boarding_house', 'Boarding house', 'The instances of this class represent, among all the business activities, certain guest houses.'),
(170, 1, 7, 'Boat_equipment', 'Boat equipment', 'The instances of this class represent, among all business activities, certain retail and boat related activities.'),
(171, 1, 7, 'Boats_and_ships_rental', 'Boats and ships rental', 'The instances of this class represent, among all the business activities, certain activities of renting sea and river transport.'),
(172, 1, 7, 'Bollard', 'Bollard', 'Each instance of this class represents a mobile bollard.'),
(173, 1, 7, 'Bookshop', 'Book Shop', 'The instances of this class represent, among all business activities, some retail business of new books.'),
(174, 1, 7, 'Botanical_and_zoological_gardens', 'Botanical and zoological gardens', 'The instances of this class represent, among all business activities, some activities of botanical gardens, zoological gardens and natural reserves.'),
(175, 1, 7, 'Boxoffice', 'Boxoffice', 'The instances of this class include, among all business activities, some resale of tickets for sporting events and entertainment.'),
(176, 1, 7, 'Building_and_industrial_cleaning_activities', 'Building and industrial cleaning activities', 'The instances of this class represent, among all business activities, certain sterilization activities of buildings, plant, industrial machinery and healthcare equipment.'),
(177, 1, 7, 'Building_construction', 'Building Construction', 'The instances of this class represent, among all the business activities, certain building design and building activities.'),
(178, 1, 7, 'Building_material', 'Building Material', 'The instances of this class represent, among all the business activities, certain retail business of building materials, ceramics, tiles.'),
(179, 1, 7, 'Building_materials_manufacture', 'Building Materials Manufacture', 'The instances of this class represent, among all the business activities, certain cement, lime, concrete, gypsum and other building compounds.'),
(180, 1, 7, 'BusStop', 'Bus Stop', 'Interconnection point between road segments to determine the path of a TPL line.'),
(181, 1, 7, 'BusStopForecast', 'BusStop Forecast', 'Arrival forecast at a certain stop.'),
(182, 1, 7, 'Bus_tickets_retail', 'Bus tickets retail', 'The instances of this class represent, among all business activities, some bus ticket resale services.'),
(183, 1, 7, 'Business_support', 'Business support', 'The instances of this class represent, among all business activities, certain types of business support activities. These are mainly companies of: exactorial management; distribution agencies of books, newspapers and magazines; services of public market management and public weights; request for certificates and public purses; request for certificates and practical drawings.'),
(184, 1, 7, 'Call_center', 'Call center', 'The instances of this class represent, among all business activities, some call center activities.'),
(185, 1, 7, 'Camper_service', 'Camper service', 'The instances of this class represent, among all the business activities, certain activities of traveling tourism services.'),
(186, 1, 7, 'Camping', 'Camping', 'The instances of this class include, among all business activities, some parking areas and areas equipped for motor homes and caravans.'),
(187, 1, 7, 'Canteens_and_food_service', 'Canteens and Food Service', 'The instances of this class represent, among all the business activities, certain canteens and continuous catering activities on a contractual basis.'),
(188, 1, 7, 'CarParkSensor', 'Car Park Sensor', 'Sensor collecting data inside a parking lot.'),
(189, 1, 7, 'Car_park', 'Car park', 'The instances of this class represent, among all business activities, some parking and caretaking activities.'),
(190, 1, 7, 'Car_rental_with_driver', 'Car Rental With Driver', 'The instances of this class represent, among all the business activities, certain transport activities by renting passenger cars with driver.'),
(191, 1, 7, 'Car_washing', 'Car Washing', 'The instances of this class represent, among all business activities, certain car wash activities.'),
(192, 1, 7, 'Carabinieri', 'Carabinieri', 'The instances of this class represent, among all service locations, some Carabinieri barracks.'),
(193, 1, 7, 'Cargo_handling', 'Cargo Handling', 'The instances of this class represent, among all the business activities, certain cargo handling activities on road and rail.'),
(194, 1, 7, 'Carpentry', 'Carpentry', 'The instances of this class represent, among all the business activities, some furniture repair and furnishing repair activities.'),
(195, 1, 7, 'Carpets', 'Carpets', 'The instances of this class represent, among all the business activities, certain carpet retail activities.'),
(196, 1, 7, 'Carpets_and_curtains', 'Carpets and Curtains', 'The instances of this class represent, among all the business activities, some retail activities of carpets, curtains and curtains.'),
(197, 1, 7, 'Cartographers', 'Cartographers', 'The instances of this class represent, among all the business activities, some cartography and aerial photogrammetry activities.'),
(198, 1, 7, 'Castle', 'Castle', 'The instances of this class represent some castles where tourist services of various kinds are offered.'),
(199, 1, 7, 'Catering', 'Catering', 'The instances of this class represent, among all the business activities, certain catering activities for events, banqueting, provision of meals prepared for catering and other catering services.'),
(200, 1, 7, 'Cemetery', 'Cemetery', 'The instances of this class each represent a cemetery.'),
(201, 1, 7, 'ChargeStationObservation', 'Charge station observation', 'Each instance of this class represents a state of a column for charging electric vehicles at a given instant.'),
(202, 1, 7, 'Charging_stations', 'Charging stations', 'The instances of this class represent, among all business activities, certain supply of columns for charging power supplies and related services.'),
(203, 1, 7, 'Charter_airlines', 'Charter Airlines', 'The instances of this class represent, among all business activities, some non-scheduled air transport activities (charter flights).'),
(204, 1, 7, 'Churches', 'Churches', 'The instances of this class represent, among all the places of service, certain places of worship and business activities related to places of worship.'),
(205, 1, 7, 'Cinema', 'Cinema', 'The instances of this class represent, among all the business activities, certain cinematic projection activities.'),
(206, 1, 7, 'CivilAndEdilEngineering', 'Civil and edil engineering', 'Services related to civil and construction engineering. '),
(207, 1, 7, 'Civil_airport', 'Civil airport', 'The instances of this class represent, among all business activities, certain activities carried out by civil airports, with particular reference to transfer and rental services.'),
(208, 1, 7, 'Civil_engineering', 'Civil Engineering', 'The instances of this class represent, among all the business activities, certain civil engineering activities, and in particular the activities of building public works.'),
(209, 1, 7, 'Civil_protection', 'Civil protection', 'The instances of this class represent, among all service locations, certain civil protection activities.'),
(210, 1, 7, 'Civil_registry', 'Civil registry', 'The instances of this class represent, among all service locations, certain registry offices.'),
(211, 1, 7, 'Cleaning_activities', 'Cleaning activities', 'The instances of this class represent, among all the business activities, some cleaning and disinfestation activities.'),
(212, 1, 7, 'Cleaning_materials', 'Cleaning Materials', 'The instances of this class represent, among all business activities, certain retail activities of soaps, detergents, polishing products and the like.'),
(213, 1, 7, 'Climbing', 'Climbing', 'The instances of this class represent, among all the business activities, some mountaineering activities.'),
(214, 1, 7, 'Clothing', 'Clothing', 'The instances of this class represent, among all the business activities, some clothing retail business.'),
(215, 1, 7, 'Clothing_accessories', 'Clothing Accessories', 'The instances of this class represent, among all business activities, certain retail activities of hats, umbrellas, gloves and ties.'),
(216, 1, 7, 'Clothing_and_linen', 'Clothing and Linen', 'The instances of this class represent, among all the business activities, certain retail trade activities of clothing, home furnishings and household linen.'),
(217, 1, 7, 'Clothing_children_and_infants', 'Clothing Children and Infants', 'The instances of this class represent, among all business activities, certain retail children\'s clothing.'),
(218, 1, 7, 'Clothing_factory_outlet', 'Clothing factory outlet', 'The instances of this class represent, among all business activities, certain activities of selling and selling outlets of clothing.'),
(219, 1, 7, 'Coast_guard_harbormaster', 'Coast guard harbormaster', 'The instances of this class represent, among all service locations, certain offices of the Coast Guard and the Harbor Captain.'),
(220, 1, 7, 'Coffee_rosters', 'Coffee Rosters', 'The instances of this class represent, among all business activities, some rotten coffee retail business.'),
(221, 1, 7, 'Coke_and_petroleum_derivatives', 'Coke and Petroleum Derivatives', 'The instances of this class represent, among all business activities, certain coke refining activities and other petroleum refining products.'),
(222, 1, 7, 'Combined_facilities_support_activities', 'Combined facilities support activities', 'The instances of this class represent, among all business activities, some integrated building management services.'),
(223, 1, 7, 'Commissariat_of_public_safety', 'Commissariat of public safety', 'The instances of this class represent, among all service locations, certain Commissariats of Public Safety.'),
(224, 1, 7, 'Community_centre', 'Community centre', 'The instances of this class represent, among all service locations, some day health care centers.'),
(225, 1, 7, 'Computer_data_processing', 'Computer data processing', 'The instances of this class represent, among all business activities, certain data bases management and electronic data processing.'),
(226, 1, 7, 'Computer_programming_and_consultancy', 'Computer programming and consultancy', 'The instances of this class include, among all business activities, certain software production activities, computer consultancy activities, configuration and management of facilities and computer equipment, and other IT related services.'),
(227, 1, 7, 'Computer_systems', 'Computer Systems', 'The instances of this class represent, among all business activities, certain retail business of computers, peripherals, software and office equipment in specialized stores.'),
(228, 1, 7, 'Computer_technician', 'Computer technician', 'The instances of this class represent, among all business activities, some repair and maintenance of computers and peripherals.'),
(229, 1, 7, 'Conservatory', 'Conservatory', 'The instances of this class represent, among all the business activities, certain activities of music conservators.'),
(230, 1, 7, 'Consulate', 'Consulate', 'The instances of this class represent, among all service locations, some foreign consulates in Italy.'),
(231, 1, 7, 'Consulting_services', 'Consulting services', 'The instances of this class represent, among all business activities, certain consulting activities in general, for example in the field of safety, hygiene, agriculture and so on.'),
(232, 1, 7, 'Controlled_parking_zone', 'Controlled parking zone', 'The instances of this class represent, among all service locations, certain controlled parking areas.'),
(233, 1, 7, 'Corps_of_forest_rangers', 'Corps of forest rangers', 'The instances of this class represent, among all service locations, certain sites of the Corp of Forest Rangers.'),
(234, 1, 7, 'Courier', 'Courier', 'The instances of this class represent, among all business activities, certain postal and courier activities on which no universal service obligation is involved (a statutory obligation to guarantee a minimum level of service to be rendered to all The affected user).'),
(235, 1, 7, 'Credit_collection_agencies', 'Credit collection agencies', 'The instances of this class represent, among all business activities, certain activities of credit recovery agencies.'),
(236, 1, 7, 'Crop_animal_production_hunting', 'Crop Animal Production Hunting', 'The instances of this class represent, among all business activities, certain agricultural production activities, processing of animal products, hunting, and other related activities.'),
(237, 1, 7, 'Crop_production', 'Crop Production', 'The instances of this class represent, among all the business activities, certain cultivation activities.'),
(238, 1, 7, 'CulturalActivity', 'Cultural Activity', 'Libraries, archives, museums and other cultural activities.'),
(239, 1, 7, 'Cultural_and_recreation_goods', 'Cultural and Recreation Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of cultural and recreational items in specialized stores.'),
(240, 1, 7, 'Cultural_centre', 'Cultural centre', 'The instances of this class represent, among all service locations, certain centers of cultural activity.'),
(241, 1, 7, 'Cultural_education', 'Cultural education', 'The instances of this class represent, among all business activities, some centers of cultural formation.'),
(242, 1, 7, 'Cultural_sites', 'Cultural sites', 'The instances of this class represent, among all business activities, certain activities of libraries, archives, museums and other places of culture.'),
(243, 1, 7, 'Curtains_and_net_curtains', 'Curtains and Net Curtains', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of curtains and curtains.'),
(244, 1, 7, 'Cycle_paths', 'Cycle paths', 'The instances of this class represent, among all service locations, certain cycling routes.'),
(245, 1, 7, 'Dairy_products', 'Dairy products', 'The demands of this class represent, among all business activities, certain retail trade activities of milk and dairy products.'),
(246, 1, 7, 'Dance_schools', 'Dance schools', 'The instances of this class represent, among all the business activities, some activities of conducting dance classes.'),
(247, 1, 7, 'Dating_service', 'Dating service', 'The instances of this class represent, among all the business activities, certain activities of marriage and meeting agencies.'),
(248, 1, 7, 'Day_care_centre', 'Day care centre', 'The instances of this class represent, among all service locations, some reception centers.'),
(249, 1, 7, 'Dentist', 'Dentist', 'The instances of this class represent, among all the business activities, some activities and services of dental surgeries.'),
(250, 1, 7, 'Department_of_motor_vehicles', 'Department of motor vehicles', 'The instances of this class represent, among all service locations, certain sites of Vehicle registration.'),
(251, 1, 7, 'Diet_products', 'Diet Products', 'The instances of this class represent, among all the business activities, some retail activities of macrobiotic and dietary products.'),
(252, 1, 7, 'DigitalLocation', 'Digital Location', 'Services classified by the city of Florence as Digital Location.'),
(253, 1, 7, 'Dining_hall', 'Dining hall', 'The instances of this class represent, among all service locations, certain canteens, not even structured in the form of a business.'),
(254, 1, 7, 'Disabled_parking_area', 'Disabled parking area', 'Ciascuna istanza di questa classe rappresenta un\'area di sosta riservata alle persone con ridotte capacità motorie.'),
(255, 1, 7, 'Discotheque', 'Discotheque', 'The instances of this class represent, among all the business activities, some activities of discos, ballrooms, nightclubs and the like.'),
(256, 1, 7, 'Discount', 'Discount', 'The instances of this class represent, among all business activities, some food discount activities.'),
(257, 1, 7, 'Disinfecting_and_exterminating_activities', 'Disinfecting and exterminating activities', 'The instances of this class represent, among all the business activities, certain disinfestation services.'),
(258, 1, 7, 'District', 'District', 'Class whose instances are the various neighborhoods in which a city can be subdivided.'),
(259, 1, 7, 'Diving_school', 'Diving school', 'The instances of this class represent, among all service locations, some diving schools.'),
(260, 1, 7, 'Doctor_office', 'Doctor office', 'The instances of this class represent, among all business activities, certain services of general medical practice.'),
(261, 1, 7, 'Dog_area', 'Dog area', 'Each instance of this class represents an area reserved for dog breeding.'),
(262, 1, 7, 'Door_to_door', 'Door to Door', 'The instances of this class represent, among all the business activities, certain retail activities of various products, by the intervention of a demonstrator or a sales agent (door to door).'),
(263, 1, 7, 'Drinking_fountain', 'Drinking fountain', 'The instances of this class represent, among all service locations, some drinking water fountains.'),
(264, 1, 7, 'EarthQuakeEvent', 'Earthquake', 'Each instance of this class represents an earthquake that affected the territory covered by the Km4City project.'),
(265, 1, 7, 'EducationAndResearch', 'EducationAndResearch', 'Services such as schools for all ages and training schools.'),
(266, 1, 7, 'Educational_support_activities', 'Educational support activities', 'The instances of this class include, among all business activities, certain education and training services, including counseling and school counseling services.'),
(267, 1, 7, 'Emergency', 'Emergency', 'Contiene tutte le classi relative ai servizi di emergenza'),
(268, 1, 7, 'Emergency_medical_care', 'Emergency medical care', 'The instances of this class include, among all business activities, certain health emergency services, blood banks, and others.'),
(269, 1, 7, 'Emergency_services', 'Emergency services', 'The instances of this class represent, among all service locations, certain roadside assistance services.'),
(270, 1, 7, 'Employment_exchange', 'Employment exchange', 'The instances of this class represent, among all service locations, some employment centers.'),
(271, 1, 7, 'Energy_supply', 'Energy Supply', 'The instances of this class represent, among all the business activities, certain activities of production, distribution, and trade in electricity and fuels.'),
(272, 1, 7, 'Engineering_consulting', 'Engineering consulting', 'The instances of this class represent, among all the business activities, certain activities of engineering studies.'),
(273, 1, 7, 'Entertainment', 'Entertainment', 'Entertainment services for the citizen.'),
(274, 1, 7, 'Entry', 'Entry', 'Classe le cui istanze sono i possibili ingressi ai numeri civici'),
(275, 1, 7, 'EntryRule', 'Entry Rule', 'Class whose instances are the rules of access to the different road elements.'),
(276, 1, 7, 'Environment', 'Environment', 'Environmentally friendly services.'),
(277, 1, 7, 'Equipment_for_events_and_shows_rental', 'Equipment for events and shows rental', 'The instances of this class represent, among all the business activities, some rental activities of facilities and equipment for events and shows.'),
(278, 1, 7, 'Estate_activities', 'Estate activities', 'The instances of this class represent, among all the business activities, certain leasing, sale, management and administration of real estate also for third parties.'),
(279, 1, 7, 'Event', 'Event', 'Events scheduled by the city of Florence and dusk.'),
(280, 1, 7, 'Extraction_of_natural_gas', 'Extraction of natural gas', 'The instances of this class represent, among all business activities, certain natural gas extraction activities.'),
(281, 1, 7, 'Extraction_of_salt', 'Extraction of salt', 'The instances of this class represent, among all the business activities, some salt extraction activities.'),
(282, 1, 7, 'Family_counselling', 'Family counselling', 'The instances of this class represent, among all service locations, some family counselors.'),
(283, 1, 7, 'Farm_house', 'Farm house', 'The cases of this class represent, among all the commercial activities, some activities of the hotel tourist residence.'),
(284, 1, 7, 'Fast_charging_station', 'Fast charging station', NULL),
(285, 1, 7, 'Ferry_stop', 'Ferry stop', 'The instances of this class are each a liner ferry port.'),
(286, 1, 7, 'FinancialService', 'Financial Service', 'Banks, monetary institutions and other financial services.'),
(287, 1, 7, 'Financial_institute', 'Financial institute', 'The instances of this class represent, among all business activities, certain financial services.'),
(288, 1, 7, 'Fine_arts_articles', 'Fine Arts Articles', 'The instances of this class represent, among all the business activities, certain retail activities of fine arts articles.'),
(289, 1, 7, 'Fire_brigade', 'Fire brigade', 'The instances of this class represent, among all service locations, certain fire brigades.'),
(290, 1, 7, 'First_aid', 'First aid', 'The instances of this class represent, among all service locations, some places of First Aid.'),
(291, 1, 7, 'First_aid_state', 'First Aid state', 'Each instance of this class represents a snapshot of how many people are, at a certain point in time, within a certain point of First Aid, in a certain condition, subdivided according to the urgency code assigned to them . The possible conditions in which a person who is in First Aid may be: destination, waiting, visiting, temporary observation. However, some instances report the total count, without taking into account the condition in which the different people are. In this case, the firstAidState property is valorized to \"Totali\".'),
(292, 1, 7, 'Fish_and_seafood', 'Fish and Seafood', 'The instances of this class represent, among all business activities, certain retail trade of fish, crustaceans and molluscs.'),
(293, 1, 7, 'Fishing_and_aquaculture', 'Fishing and Aquaculture', 'The instances of this class represent, among all business activities, certain fishing and aquaculture activities.'),
(294, 1, 7, 'Fishing_reserve', 'Fishing reserve', 'The instances of this class represent, among all service locations, some fishing reserves.'),
(295, 1, 7, 'Flight_companies', 'Flight Companies', 'The instances of this class represent, among all business activities, certain passenger liner air transport activities.'),
(296, 1, 7, 'Flower_shop', 'Flower shop', 'The instances of this class represent, among all the business activities, certain flower retail activities.'),
(297, 1, 7, 'Food_and_ice_cream_truck', 'Food and Ice Cream Truck', 'The instances of this class represent, among all the business activities, certain icecream, pastry and catering activities.'),
(298, 1, 7, 'Food_and_tobacconist', 'Food and Tobacconist', 'The instances of this class represent, among all business activities, certain retail activities of certain foodstuffs, beverages and tobacco.'),
(299, 1, 7, 'Food_manufacture', 'Food Manufacture', 'The instances of this class represent, among all business activities, certain industrial food production activities.'),
(300, 1, 7, 'Food_trade', 'Food trade', 'Each instance of this class represents a food resale activity.'),
(301, 1, 7, 'Footwear_and_accessories', 'Footwear and Accessories', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune attività di commercio al dettaglio di calzature e accessori.'),
(302, 1, 7, 'Footwear_and_leather_goods', 'Footwear and Leather Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and leather goods.'),
(303, 1, 7, 'Footwear_factory_outlet', 'Footwear factory outlet', 'The instances of this class represent, among all the business activities, certain activities of selling footwear in shops and outlets.'),
(304, 1, 7, 'Footwear_manufacture', 'Footwear Manufacture', 'The instances of this class represent, among all the business activities, certain footwear manufacturing and leather footwear manufacturing activities.'),
(305, 1, 7, 'Forest', 'Forest', 'Each instance of this class represents a forest.'),
(306, 1, 7, 'Forestry', 'Forestry', 'The instances of this class represent, among all the business activities, certain forestry activities and use of forest areas.'),
(307, 1, 7, 'Freight_transport_and_furniture_removal', 'Freight Transport and Furniture Removal', 'The instances of this class represent, among all business activities, certain removal and cargo transport services on the road.'),
(308, 1, 7, 'Fresh_place', 'Fresh place', 'Luoghi in cui e\' possibile sedere all\'aria condizionata durante l\'estate'),
(309, 1, 7, 'Frozen_food', 'Frozen Food', 'The instances of this class represent, among all business activities, certain retail trade activities of frozen products.'),
(310, 1, 7, 'Fruit_and_vegetables', 'Fruit and Vegetables', 'The instances of this class represent, among all business activities, certain fruit and vegetable retail activities.'),
(311, 1, 7, 'FuelStationObservation', 'Fuel station observation', 'Each instance of this class represents a state of a fuel distributor at a given instant.'),
(312, 1, 7, 'Fuel_station', 'Fuel station', 'The instances of this class represent, among all business activities, certain retail trade activities of automotive fuel.'),
(313, 1, 7, 'Funeral', 'Funeral', 'The instances of this class represent, among all the business activities, some funeral activities and related services.'),
(314, 1, 7, 'Funeral_and_cemetery_articles', 'Funeral and Cemetery Articles', 'The instances of this class represent, among all business activities, certain retail trade activities of funerary and cemeteries.'),
(315, 1, 7, 'Fur_and_leather_clothing', 'Fur and Leather Clothing', 'The instances of this class represent, among all the business activities, certain activities of retail trade of fur and leather clothing.'),
(316, 1, 7, 'Gambling_and_betting', 'Gambling and betting', 'The instances of this class represent, among all business activities, certain activities related to lotteries, betting, and gambling halls.'),
(317, 1, 7, 'Game_reserve', 'Game reserve', 'The instances of this class represent, amongst all service locations, some natural parks.'),
(318, 1, 7, 'Game_room', 'Game room', 'The instances of this class represent, among all the business activities, certain activities of playing rooms and billiards.'),
(319, 1, 7, 'Games_and_toys', 'Games and toys', 'The instances of this class represent, among all business activities, certain retail activities of games and toys (including electronic ones).'),
(320, 1, 7, 'Garden_and_agriculture', 'Garden and Agriculture', 'The instances of this class represent, among all business activities, certain retail trade activities of machinery, equipment and products for agriculture and gardening.'),
(321, 1, 7, 'Gardens', 'Gardens', 'The instances of this class represent, among all service locations, some parks and gardens.'),
(322, 1, 7, 'Geologists', 'Geologists', 'The instances of this class represent, among all business activities, certain geological and geo-survey and mining research activities.'),
(323, 1, 7, 'Gifts_and_smoking_articles', 'Gifts and Smoking Articles', 'The instances of this class represent, among all the business activities, certain activities of retail trade of gift items and smokers.'),
(324, 1, 7, 'Golf', 'Golf', 'The instances of this class represent, among all service locations, some golf courses.'),
(325, 1, 7, 'GoodsYard', 'Goods Yard', 'Goods Scale, are located at railway junctions with 1:1 ratio.'),
(326, 1, 7, 'GovernmentOffice', 'Government Office', 'Government offices open to the public.'),
(327, 1, 7, 'Green_areas', 'Green areas', 'The instances of this class represent, among all service locations, some green areas.'),
(328, 1, 7, 'Grill', 'Grill', 'Each instance of this class represents a rotisserie.'),
(329, 1, 7, 'Group_practice', 'Group practice', 'Each instance of this class represents an health centre.'),
(330, 1, 7, 'Gym_fitness', 'Gym fitness', 'The instances of this class represent, among all the business activities, some gym management activities.'),
(331, 1, 7, 'Haberdashery', 'Haberdashery', 'The instances of this class represent, among all the business activities, certain retail trade activities of knitting and knitting yarns.'),
(332, 1, 7, 'Haircare_centres', 'Haircare centres', 'The instances of this class represent, among all business activities, certain activities of trichological surgeries.'),
(333, 1, 7, 'Hairdressing', 'Hairdressing', 'The demands of this class represent, among all the business activities, certain services of barber and hairdresser salons.'),
(334, 1, 7, 'Hairdressing_and_beauty_treatment', 'Hairdressing and beauty treatment', 'The instances of this class represent, among all the business activities, certain services of hairdressers, manicures, pedicures and aesthetic treatments.'),
(335, 1, 7, 'Hardware_electrical_plumbing_and_heating', 'Hardware Electrical Plumbing and Heating', 'The instances of this class represent, among all business activities, certain retail trade of hardware, paints, flat glass and electrical and plumbing plumbing.'),
(336, 1, 7, 'Hardware_paints_and_glass', 'Hardware Paints and Glass', 'The instances of this class represent, among all the business activities, certain retail trade of hardware, paints, flat glass and building materials.'),
(337, 1, 7, 'HealthCare', 'Health Care', 'Hospitals, medical studios, analysis laboratories and other facilities providing health services.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(338, 1, 7, 'Health_district', 'Health district', 'The instances of this class represent, among all service locations, certain health districts.'),
(339, 1, 7, 'Health_reservations_centre', 'Health reservations centre', 'The instances of this class represent, among all service locations, certain single reservation centers established at health districts.'),
(340, 1, 7, 'Healthcare_centre', 'Healthcare centre', 'The instances of this class represent, among all service locations, certain health care centers established at health districts.'),
(341, 1, 7, 'Helipads', 'Helipads', 'The instances of this class represent, among all service locations, some hills.'),
(342, 1, 7, 'Herbalists_shop', 'Herbalist\'s Shop', 'The instances of this class represent, among all the business activities, some herbalists.'),
(343, 1, 7, 'Higher_education', 'Higher education', 'The instances of this class represent, among all business activities, some university and non-university post-secondary training centers.'),
(344, 1, 7, 'Highway_stop', 'Highway stop', 'The instances of this class represent, among all business activities, certain service areas along the main road arteries.'),
(345, 1, 7, 'Hippodrome', 'Hippodrome', 'The instances of this class represent, among all service locations, some racecourses.'),
(346, 1, 7, 'Historic_residence', 'Historic residence', 'The instances of this class represent, among all service locations, some historic residences that offer accommodation services.'),
(347, 1, 7, 'Historical_buildings', 'Historical buildings', 'The instances of this class represent, among all the service venues, some historic buildings.'),
(348, 1, 7, 'Holiday_village', 'Holiday village', 'The instances of this class represent, among all business activities, some holiday accommodation and other short-term accommodation, including resorts.'),
(349, 1, 7, 'Hostel', 'Hostel', 'The instances of this class represent, among all business activities, some youth hostels.'),
(350, 1, 7, 'Hotel', 'Hotel', 'The instances of this class represent, among all business activities, certain hotels and similar structures.'),
(351, 1, 7, 'Household_appliances_shop', 'Household appliances shop', 'The instances of this class represent, among all business activities, some retail trade of household appliances in specialized stores.'),
(352, 1, 7, 'Household_articles', 'Household Articles', 'The instances of this class represent, among all business activities, certain retail activities of certain household items.'),
(353, 1, 7, 'Household_fuel', 'Household Fuel', 'The instances of this class represent, among all business activities, certain retail trade activities of domestic and heating fuel.'),
(354, 1, 7, 'Household_furniture', 'Household Furniture', 'The instances of this class represent, among all the business activities, some retail business of home furniture.'),
(355, 1, 7, 'Household_products', 'Household Products', 'The instances of this class represent, among all business activities, certain retail activities of certain domestic products in specialized stores.'),
(356, 1, 7, 'Household_utensils', 'Household Utensils', 'The instances of this class represent, among all business activities, certain retail trade activities of household utensils, glassware and pottery.'),
(357, 1, 7, 'Human_health_activities', 'Human health activities', 'The instances of this class represent, among all business activities, certain health care activities.'),
(358, 1, 7, 'Hunting_trapping_and_services', 'Hunting Trapping and Services', 'The instances of this class represent, among all business activities, some hunting, animal trapping and related services.'),
(359, 1, 7, 'HydrometryObservation', 'Hydrometry observation', 'Each instance of this class represents a hydrometric detection.'),
(360, 1, 7, 'HygrometryObservation', 'Hygrometry observation', 'Each instance of this class represents a hygrometric detection.'),
(361, 1, 7, 'Hypermarket', 'Hypermarket', 'The instances of this class represent, among all business activities, some hypermarkets.'),
(362, 1, 7, 'ICQAAgglomeration', 'Air Quality Criticality Index agglomeration', 'Each instance of this class represents an agglomeration (suitably delimited geographical area) defined for air quality monitoring through the ICQA index, introduced by the Tuscany Region, Italy, in August 2016.'),
(363, 1, 7, 'ICQAObservation', 'ICQA Observation', 'Each instance of this class represents an air quality detection on an agglomeration.'),
(364, 1, 7, 'Ice_cream_parlour', 'Ice cream parlour', 'The instances of this class represent, among all business activities, some ice cream parlors and pastry shops.'),
(365, 1, 7, 'Ict_service', 'ICT service', 'The instances of this class represent, among all business activities, certain data processing, hosting and related activities, web portals, and other information service activities.'),
(366, 1, 7, 'Income_revenue_authority', 'Income revenue authority', 'The instances of this class represent, among all service locations, certain offices of the Revenue Agency.'),
(367, 1, 7, 'Industrial_laundries', 'industrial laundries', 'The instances of this class represent, among all the business activities, certain activities of industrial laundries.'),
(368, 1, 7, 'IndustryAndManufacturing', 'Industry and manufacturing', 'Services related to industry and work.'),
(369, 1, 7, 'Installation_of_industrial_machinery', 'Installation of Industrial Machinery', 'The instances of this class represent, among all the business activities, certain activities for the installation of industrial and medical equipment, such as: installation of electrical and electronic equipment for telecommunications and radio transmitting equipment; installation of instruments, apparatus for measuring, checking, testing, navigation and the like; installation of office machines, mainframes and similar computers; installation of other machines and industrial equipments; installation of motors, generators and transformers, electricity distribution and control equipment; installation of medical devices; installation of appliances and instruments for odontology; installation of motors, generators and transformers, electrical distribution and control equipment.'),
(370, 1, 7, 'Insurance', 'Insurance', 'The instances of this class include, among all business activities, certain insurance, agents, sub agents, brokers and other intermediaries, including for the purpose of opening pension funds and life insurance.'),
(371, 1, 7, 'Insurance_and_financial', 'Insurance and financial', 'The instances of this class represent, among all business activities, some auxiliary activities in financial services and insurance activities.'),
(372, 1, 7, 'Internet_point_and_public_telephone', 'Internet Point and Public Telephone', 'The instances of this class represent, among all business activities, certain activities of public telephone and Internet Point.'),
(373, 1, 7, 'Internet_service_provider', 'Internet Service Provider', 'The instances of this class represent, among all business activities, certain Internet access services.'),
(374, 1, 7, 'Investigation_activities', 'Investigation activities', 'The instances of this class represent, among all business activities, certain private investigation services.'),
(375, 1, 7, 'Irrigator', 'Irrigator', 'Each instance of this class represents an irrigator.'),
(376, 1, 7, 'Italian_finance_police', 'Italian finance police', 'The instances of this class represent, among all service locations, certain offices of the Italian financial police.'),
(377, 1, 7, 'Jeweller', 'Jeweller', 'The instances of this class represent, among all the business activities, certain remaking of watches and jewelery.'),
(378, 1, 7, 'Jewellery', 'Jewellery', 'The instances of this class represent, among all business activities, certain retail activities of watches, jewelery and silverware.'),
(379, 1, 7, 'Journalist', 'Journalist', 'The instances of this class represent, among all the business activities, certain activities of independent journalists.'),
(380, 1, 7, 'Junction', 'Junction', 'An interconnection point between road segments to draw a RoadElement.'),
(381, 1, 7, 'Knitted_manufacture', 'Knitted Manufacture', 'The instances of this class represent, among all the business activities, certain knitting, knitwear, jerseys, cardigans and other knitwear items.'),
(382, 1, 7, 'Labour_consultant', 'Labour consultant', 'The instances of this class represent, among all the business activities, certain activities of job counselors.'),
(383, 1, 7, 'Land_transport', 'Land Transport', 'The instances of this class represent, among all business activities, certain terrestrial passenger transport activities, and in particular: taxi transport, car hire with driver; terrestrial passenger transport in urban and suburban areas; terrestrial transport and transport by means of pipelines; other terrestrial passenger transport activities.'),
(384, 1, 7, 'Land_transport_rental', 'Land-transport rental', 'The instances of this class represent, among all business activities, certain rental activities of certain land transport vehicles.'),
(385, 1, 7, 'Landscape_care', 'Landscape care', 'The instances of this class represent, among all business activities, some landscape care and maintenance activities (including parks, gardens and flowerbeds).'),
(386, 1, 7, 'Language_courses', 'Language courses', 'The instances of this class represent, among all business activities, some activities of language courses by anyone organized, and language schools.'),
(387, 1, 7, 'Laundries_and_dry_cleaners', 'laundries and dry cleaners', 'The instances of this class represent, among all the business activities, some laundry and cleaning of textile and fur items.'),
(388, 1, 7, 'Leasing_of_intellectual_property', 'Leasing of intellectual property', 'The instances of this class represent, among all business activities, certain activities of granting intellectual property rights and similar products (excluding works protected by copyright).'),
(389, 1, 7, 'Leather_manufacture', 'Leather Manufacture', 'The instances of this class represent, among all the business activities, certain activities of making leather goods and the like.'),
(390, 1, 7, 'Legal_office', 'Legal office', 'The instances of this class represent, among all the business activities, certain activities of law firms and accounting.'),
(391, 1, 7, 'Library', 'Library', 'The instances of this class represent, among all the business activities, some library and archive activities.'),
(392, 1, 7, 'Lifting_and_handling_equipment_rental', 'Lifting and handling equipment rental', 'The instances of this class represent, among all business activities, certain rental activities without a lifting and handling equipment operator.'),
(393, 1, 7, 'Lighting', 'Lighting', 'The instances of this class represent, among all the business activities, certain retail activities of lighting articles.'),
(394, 1, 7, 'Literary_cafe', 'literary cafe', 'Each instance of this class represents a literary café.'),
(395, 1, 7, 'Local_health_authority', 'Local health authority', 'The instances of this class represent, among all service locations, some local health companies.'),
(396, 1, 7, 'Local_police', 'Local police', 'The instances of this class represent, among all service locations, some Local Police Offices.'),
(397, 1, 7, 'Logistics_activities', 'Logistics Activities', 'The instances of this class represent, among all business activities, certain activities related to handling and storage of goods, and in particular: logistical services relating to the distribution of goods; freight forwarders and customs agency agencies; transport intermediaries.'),
(398, 1, 7, 'Lot', 'TPL Lot', 'TPL line set, locally identifiable as a lot.'),
(399, 1, 7, 'Machinery_and_equipment_rental', 'Machinery and Eequipment Rental', 'The instances of this class represent, among all the business activities, certain rental activities of certain machines and equipment for professional use, and in particular: rental of machines and equipment for construction work and civil engineering; hire of office machinery and equipment (including computers); rental of agricultural machinery and equipment; hire of other machines, equipment and material assets, without operator.'),
(400, 1, 7, 'Machinery_repair_and_installation', 'Machinery Repair and Installation', 'The instances of this class represent, among all business activities, some repair and maintenance activities for both professional and domestic equipment.'),
(401, 1, 7, 'Maintenance_repair_of_motor_vehicles', 'Maintenance Repair of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain repair and maintenance activities for motor vehicles, in particular: mechanical repairs of motor vehicles; repair of carrozzerie of cars; repair of electrical installations and of alimentacion for cars; repair and replacement of tires for cars; maintenance and repair of cars; other attivita \'of maintenance and of repair of cars.'),
(402, 1, 7, 'Maintenance_repair_of_motorcycles', 'Maintenance Repair of Motorcycles', 'The instances of this class represent, among all business activities, some maintenance and repair activities on motorcycles and mopeds (including tires).'),
(403, 1, 7, 'Management_consultancy', 'Management consultancy', 'The instances of this class represent, among all the business activities, certain entrepreneurial consultancy activities, and in particular: public relations and communication; certain entrepreneurial and administrative-management consultancy activities; certain business planning activities; holdings of the holdings engaged in operating activities (holding companies); management consultancy activities; consultancy services for the management of company logistics; business management and management consulting.'),
(404, 1, 7, 'Maneuver', 'Maneuver', 'Class whose instances are the possible maneuvers that can be made on a road element.'),
(405, 1, 7, 'Manicure_and_pedicure', 'Manicure and pedicure', 'The instances of this class represent, among all business activities, certain manicure and pedicure services.'),
(406, 1, 7, 'Manufacture_of_basic_metals', 'Manufacture of Basic Metals', 'The instances of this class represent, among all the business activities, certain metalworking activities, and in particular: manufacture of precious and semi-finished metals; casting of cast iron and production of cast iron pipes and fittings; casting steel; manufacture of iron, steel and ferroleghe; cold ironing of bars; melting of light metals; foundries; manufacture of pipes, ducts, cable profiles and related accessories in steel (excluding those cast-iron); production of lead, zinc and pond and semilavorati; production of other metals non ferrosi and semilavorati; fusion of certain non-ferrous metals; cold rolling of strips; production of precious metal base and other non-ferrous metals; treatment of nuclear fuels; copper and semi-finished products; manufacture of certain products of the first steel processing; cold drawing; production of aluminum and semilavorati; manufacture of iron, steel and ferroleghe; certain other metallurgical activities; certain other steelworks.'),
(407, 1, 7, 'Manufacture_of_chemicals_products', 'Manufacture of Chemicals Products', 'The claims of this class represent, among all the business activities, certain chemical production activities, and in particular by way of example: industrial gases, perfumes, cosmetics, soaps, surfactant organic agents, polishing products, fertilizers, Nitrogen compounds, chemical treatment of fatty acids, plastics, synthetic rubber, glues, paints, varnishes, enamels, printing inks, mastics, fibers, photographic products, essential oils, chemicals for agriculture, fertilizers.'),
(408, 1, 7, 'Manufacture_of_clay_and_ceramic', 'Manufacture of Clay and Ceramic', 'The instances of this class represent, among all the business activities, certain brickwork, tiles, other terracotta materials for building, ceramics, porcelain.'),
(409, 1, 7, 'Manufacture_of_electrical_equipment', 'Manufacture of Electrical Equipment', 'The instances of this class represent, among all the business activities, certain manufacturing of electrical and electronic components and equipment, such as: motors, generators and transformers; equipment for distribution and control of electricity; electrical and lighting equipment; wiring harness; electric capacitors, resistors, capacitors and the like, accelerators; electrical signs and signaling electrical equipment; lighting and signaling equipment for means of transport; home appliances; non-electric household appliances; electrical equipment for welding and brazing; wires and cables, electrical and electronic; battery batteries and electrical accumulators.'),
(410, 1, 7, 'Manufacture_of_electronic_products', 'Manufacture of Electronic Products', 'The instances of this class represent, among all the business activities, certain manufacturing of electronic equipment and components, such as: irradiation equipment, electromedical and electrotherapeutic equipment; apparatus for the reproduction and recording of sound and images; computers and peripheral units; electronic components and electronic boards; magnetic and optical supports; radio and television transmitting equipment (including cameras); watches; certain measuring and regulating apparatus for meters of electricity, gas, water and other liquids, precision analytical scales (including stapled parts and accessories); electrical and electronic equipment for telecommunications; assembled electronic boards; optical elements and optical precision instruments; electrical and electronic equipment for telecommunications; manufacture of instruments and apparatus for measuring, testing and navigation (other than optical); optical instruments and photographic and cinematographic equipment; anti-theft and fire-fighting systems; tools for hydrology, geophysics and meteorology.'),
(411, 1, 7, 'Manufacture_of_furniture', 'Manufacture of Furniture', 'The instances of this class represent, among all the business activities, certain furniture manufacturing and furnishing, such as: office furniture and shops; armchairs and sofas; furniture finishing; furniture for domestic furniture; parts and accessories of furniture; kitchen furniture; mattresses; some chairs and seats.'),
(412, 1, 7, 'Manufacture_of_glass', 'Manufacture of Glass', 'The instances of this class represent, among all the business activities, certain manufacturing, processing and processing of flat, cable and artistic glass products.'),
(413, 1, 7, 'Manufacture_of_jewellery_bijouterie', 'Manufacture of Jewellery Bijouterie', 'The instances of this class represent, among all the business activities, certain jewelry manufacturing, jewelery, precious stones and coins.'),
(414, 1, 7, 'Manufacture_of_machinery_and_equipment', 'Manufacture of Machinery and Equipment', 'The instances of this class represent, among all business activities, certain machine manufacturing activities, including, for example: household appliances; conditioners; purifiers; industrial machinery for the food industry; machinery for laundries; machinery for the plastics and rubber industry; machinery for printing and binding; machinery for lifting and handling of goods; pumps; machinery for mines, quarries, construction sites; machinery for the textile industry; machinery for the paper industry; furnaces, furnaces, burners; leather processing machines; heating systems; machines for the agriculture, the silvicoltura and the zootecnia; office machinery and equipment; cartridges and toners; elevators, hoists, escalators; turbines; equipment for beauty salons.'),
(415, 1, 7, 'Manufacture_of_motor_vehicles', 'Manufacture of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain manufacturing of motor vehicles and trailers, bodywork and components, including electrical and electronic components.'),
(416, 1, 7, 'Manufacture_of_musical_instruments', 'Manufacture of Musical Instruments', 'The instances of this class represent, among all business activities, certain activities of making musical instruments (including parts and accessories).'),
(417, 1, 7, 'Manufacture_of_non_metallic_mineral_products', 'Manufacture of Non-Metallic Mineral Products', 'The instances of this class represent, among all business activities, certain manufacturing activities of non-metallic mineral products including abrasive products.'),
(418, 1, 7, 'Manufacture_of_paper', 'Manufacture of Paper', 'The instances of this class represent, among all the business activities, certain paper and paper making activities.'),
(419, 1, 7, 'Manufacture_of_paper_products', 'Manufacture of Paper Products', 'The instances of this class represent, among all the business activities, certain activities of making paper products, and in particular: corrugated paper and paperboard and paper and board packaging (other than paperboard); Articles of paper and cartone; Paper products; Sanitary and household products in paper and cellulose wadding.'),
(420, 1, 7, 'Manufacture_of_pharmaceutical_products', 'Manufacture of Pharmaceutical Products', 'The instances of this class represent, among all the business activities, certain pharmaceutical manufacturing and pharmaceutical preparations.'),
(421, 1, 7, 'Manufacture_of_plastics_products', 'Manufacture of Plastics Products', 'The instances of this class represent, among all the business activities, certain plastic products manufacturing activities, such as: plastic articles for the building; plastic parts for footwear; sheets, sheets, tubes and profilati in plastic materials; doors, windows, plastic frames; office items and plastic school.'),
(422, 1, 7, 'Manufacture_of_refined_petroleum_products', 'Manufacture of Refined Petroleum Products', 'The instances of this class represent, among all business activities, certain petroleum refining activities, and in particular: preparation or mixing of petroleum derivatives (excluding petrochemicals), manufacture of bitumen, tar and binder emulsions for use road mixing of liquefied petroleum gas (GPL) and bottling them.'),
(423, 1, 7, 'Manufacture_of_refractory_products', 'Manufacture of Refractory Products', 'The instances of this class represent, among all business activities, certain refractory products manufacturing.'),
(424, 1, 7, 'Manufacture_of_rubber_and_plastics_products', 'Manufacture of Rubber and Plastics Products', 'The instances of this class represent, among all the business activities, certain manufacturing of rubber articles and plastics.'),
(425, 1, 7, 'Manufacture_of_rubber_products', 'Manufacture of Rubber Products', 'The instances of this class represent, among all the business activities, certain manufacturing activities of rubber products, including in particular: rubber soles and other rubber parts for footwear; manufacture of tires and air chambers; regeneration and reconstruction of tires.'),
(426, 1, 7, 'Manufacture_of_sports_goods', 'Manufacture of Sports Goods', 'The instances of this class represent, among all the business activities, certain activities in the manufacture of sports goods.'),
(427, 1, 7, 'Manufacture_of_structural_metal_products', 'Manufacture of Structural Metal Products', 'The instances of this class represent, among all the business activities, some metal products manufacturing activities, such as: door frames and windows; gates; hinges; frames and other building elements; pots and crockery; radiators; springs; weapons and ammunition; bins and containers in general.'),
(428, 1, 7, 'Manufacture_of_textiles', 'Manufacture of textiles', 'The instances of this class represent, among all business activities, certain textile industries.'),
(429, 1, 7, 'Manufacture_of_toys_and_game', 'Manufacture of Toys and Game', 'The instances of this class represent, among all the business activities, some toys and toys manufacturing activities.'),
(430, 1, 7, 'Manufacture_of_transport_equipment', 'Manufacture of Transport Equipment', 'The instances of this class represent, among all the business activities, certain vehicle manufacturing and accessories activities, such as: accessories and parts detached for motorcycles and mopeds; ships and boats; motorcycles and motor vehicles (including engines); parts and accessories for bicycles; locomotives and other railway rolling stock, tranviario, filoviario, for metropolitane and for mines; bicycles; buildings metalliche and no metalliche in cantieri naval; aircraft, spacecraft and related devices; invalid vehicles (including parts and accessories).'),
(431, 1, 7, 'Manufacture_of_travel_articles', 'Manufacture of Travel Articles', 'The instances of this class represent, among all the business activities, certain activities of making travel articles, handbags and the like, leather goods and saddlery, whips and shawls for riding.'),
(432, 1, 7, 'Manufacture_of_wearing_apparel', 'Manufacture of Wearing Apparel', 'The instances of this class represent, among all the business activities, certain fabrication of garments, such as: leather clothing; fur coats; uniforms and work clothes; custom-made suits; shirts, shirts, underwear; sports clothing and technical clothing in general.'),
(433, 1, 7, 'Manufacture_of_wood', 'Manufacture of Wood', 'The instances of this class represent, among all the business activities, certain activities of the wood and wood and cork products industry, and are involved in the manufacture of straw articles and other plaiting products.'),
(434, 1, 7, 'Manufacture_of_wood_products', 'Manufacture of Wood Products', 'The instances of this class represent, among all the business activities, certain wood products production activities, such as: building materials; picture frames; packaging; fixtures; cork products, straw, and other weaving materials; wood panels; parquet.'),
(435, 1, 7, 'Marina', 'Marina', 'Each instance of this class represents a marina.'),
(436, 1, 7, 'Market_polling', 'Market polling', 'The instances of this class represent, among all the business activities, certain activities specializing in market research and opinion polls.'),
(437, 1, 7, 'Materials_recovery', 'Materials Recovery', 'The instances of this class represent, among all business activities, certain recycling and waste disposal activities, such as: recovery and preparation for recycling waste and scrap metal; recovery and preparation for the recycling of solid urban waste, industrial and biomass; recovery and preparation for the recycling of plastic material for the production of plastic raw materials, synthetic resins; demolition of carcasses.'),
(438, 1, 7, 'Meat_and_poultry', 'Meat and Poultry', 'The instances of this class represent, among all business activities, certain retail trade activities of meat and meat products.'),
(439, 1, 7, 'Mechanic_workshop', 'Mechanic Workshop', 'The instances of this class represent, among all the business activities, some workshop activities.'),
(440, 1, 7, 'Medical_analysis_laboratories', 'Medical analysis laboratories', 'The instances of this class represent, among all business activities, some clinical analysis laboratories, radiographic laboratories and other image diagnostic centers.'),
(441, 1, 7, 'Medical_and_orthopaedic_goods', 'Medical and Orthopaedic Goods', 'The instances of this class represent, among all the business activities, certain retail activities of medical and orthopedic articles.'),
(442, 1, 7, 'Mental_health_centre', 'Mental health centre', 'The instances of this class represent, among all service locations, certain centers of mental health.'),
(443, 1, 7, 'Milestone', 'milestone mileage', 'Classe le cui istanze sono i cippi chilometrici che si trovano lungo le principali strade'),
(444, 1, 7, 'Minimarket', 'Minimarket', 'The instances of this class represent, among all business activities, certain activities of minimarkets and other non-specialized foodstuffs.'),
(445, 1, 7, 'MiningAndQuarrying', 'Mining and quarrying', 'Services related to mining and quarrying.'),
(446, 1, 7, 'Mining_of_metal_ores', 'Mining of metal ores', 'The instances of this class represent, among all the business activities, certain activities of extraction of metallic minerals.'),
(447, 1, 7, 'Mining_support_services', 'Mining Support Services', ''),
(448, 1, 7, 'MobilityEvent', 'Mobility event', 'Each instance of this class represents an event that has had repercussions on the viability of the territory covered by the Km4City project, such as a road accident, a loss of cargo, a roadway restriction, a flood, a work deviation.'),
(449, 1, 7, 'Monument_location', 'Monument location', 'The instances of this class represent, among all business activities, some management of historical sites and monuments and similar attractions.'),
(450, 1, 7, 'Motion_picture_and_television_programme_activities', 'Motion picture and television programme activities', 'The instances of this class represent, among all the business activities, certain activities of production, post-production and film distribution, video and television programs.'),
(451, 1, 7, 'Motor_vehicles_wholesale_and_retail', 'Motor Vehicles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motor vehicles and brokerage in the sale of motor vehicles.'),
(452, 1, 7, 'Motorcycles_parts_wholesale_and_retail', 'Motorcycles Parts Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycle and moped parts and accessories, and brokering in the sale of parts and accessories for motorcycles and mopeds.'),
(453, 1, 7, 'Motorcycles_wholesale_and_retail', 'Motorcycles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycles, mopeds and their parts and accessories, and certain brokering activities in the sale of motorcycles, mopeds and parts thereof and accessories.'),
(454, 1, 7, 'Mountain_shelter', 'Mountain shelter', 'The instances of this class represent, among all business activities, some mountain shelters.'),
(455, 1, 7, 'Municipality', 'Municipality Administration', 'Class whose instances are the various municipalities.'),
(456, 1, 7, 'Museum', 'Museum', 'The instances of this class represent, among all the business activities, certain activities of the museums.'),
(457, 1, 7, 'Music_and_video_recordings', 'Music and Video Recordings', 'The instances of this class represent, among all business activities, certain retail trade activities of music and video recordings.'),
(458, 1, 7, 'Musical_instruments_and_scores', 'Musical Instruments and Scores', 'The instances of this class represent, among all the business activities, certain retail activities of musical instruments and scores.'),
(459, 1, 7, 'National_park', 'National park', 'Each instance of this class represents a national park.'),
(460, 1, 7, 'Natural_reserve', 'Natural reserve', 'Each instance of this class represents a natural reserve.'),
(461, 1, 7, 'News_agency', 'News agency', 'The instances of this class represent, among all the business activities, certain activities of the press agencies.'),
(462, 1, 7, 'Newspapers_and_stationery', 'Newspapers and Stationery', 'The instances of this class represent, among all the business activities, some retail activities of newspapers, magazines, periodicals, stationery and office supplies.'),
(463, 1, 7, 'Node', 'Node', 'Class whose instances are the nodes that connect the road elements.'),
(464, 1, 7, 'Non_food_large_retailers', 'non food large retailers', 'The instances of this class represent, among all service locations, certain non-food distribution facilities.'),
(465, 1, 7, 'Non_food_products', 'Non-Food Products', 'The instances of this class represent, among all business activities, certain retail activities of certain non-food products.'),
(466, 1, 7, 'Non_specialized_wholesale_trade', 'Non-specialized Wholesale Trade', 'The instances of this class represent, among all business activities, certain non-specialized wholesale activities.'),
(467, 1, 7, 'Observation', 'Observation', 'Single sensor for observing speed, traffic, concentration, or density.'),
(468, 1, 7, 'Office_administrative_and_support_activities', 'Office administrative and support activities', 'The instances of this class represent, among all business activities, certain temporary office management and support activities that are also integrated with the work of the office.'),
(469, 1, 7, 'Office_furniture', 'Office Furniture', 'The instances of this class represent, among all the business activities, some retail activities of office furniture.'),
(470, 1, 7, 'Operation_of_casinos', 'Operation of casinos', 'The instances of this class represent, among all business activities, certain asset management activities on devices that allow coin or coin-operated cash prizes.'),
(471, 1, 7, 'Optics_and_photography', 'Optics and Photography', 'The instances of this class represent, among all business activities, certain retail trade of optical and photographic material.'),
(472, 1, 7, 'Organization_of_conventions_and_trade_shows', 'Organization of conventions and trade shows', 'The instances of this class represent, among all the business activities, certain activities of organizing conferences and fairs.'),
(473, 1, 7, 'Other_accommodation', 'Other Accommodation', 'The instances of this class represent, among all the business activities, certain activities of short-term renters, holiday houses and apartments, bed and breakfasts, residences, farm-related accommodation, student and workers accommodation with some hotel services.'),
(474, 1, 7, 'Other_broadcasting', 'Other broadcasting', 'The instances of this class represent, among all business activities, certain activities of audio-visual programming and broadcasting.'),
(475, 1, 7, 'Other_goods', 'Other Goods', 'The instances of this class represent, among all business activities, certain retail activities of certain products in specialized stores.'),
(476, 1, 7, 'Other_manufacturing', 'Other Manufacturing', ''),
(477, 1, 7, 'Other_mining_and_quarrying', 'Other mining and quarrying', 'The instances of this class represent, among all the business activities, certain mining and quarry mining activities.'),
(478, 1, 7, 'Other_office', 'Other Office', 'The instances of this class represent, among all service locations, certain public and defense administration activities and compulsory social insurance.'),
(479, 1, 7, 'Other_retail_sale', 'Other Retail Sale', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses with a prevalence of non-food products.'),
(480, 1, 7, 'Other_specialized_construction', 'Other Specialized Construction', 'The instances of this class represent, among all the business activities, certain construction activities, including, for example: steam cleaning, sandblasting and similar activities for exterior walls of buildings; building of swimming pools and other skilled works of building; non-specialized works of construction work (masons); works of completamento and of finitura of the buildings; realization of coverings; hire of cranes and other equipment with operator for construction or demolition.'),
(481, 1, 7, 'Other_specialized_wholesale', 'Other Specialized Wholesale', 'The instances of this class represent, among all business activities, certain wholesale trade activities, such as: raw textile fibers and semi-finished textiles; hardware, appliances and accessories for plumbing and heating systems; fertilizers and other chemical products for agriculture; carpet and linoleum; raw rubber, plastics in primary and semi-finished forms; chemical products; fixtures; building materials; petroleum products and lubricants for haulage, of fuels for heating; chemical products for the industry; wallpaper, colors and paints; timber, semi-finished wood and artificial wood; building materials (including sanitary fixtures); coating materials (including sanitary fixtures); metallic minerals, of ferrous metals and semi-finished products; non-ferrous metals and semi-finished products; articles of iron and of other metals; packaging; timber and construction materials, sanitary fixtures, flat glass, paints and colors; scrap and metal by-products of industrial processing; appliances and accesorios for installations of fontaneras, heating and air conditioning; non-metallic recovery materials (glass, paper, cardboard, etc.); non-metallic by-products of industrial processing (waste).'),
(482, 1, 7, 'Other_telecommunications_activities', 'Other Telecommunications Activities', 'The instances of this class represent, among all business activities, certain telecommunications and brokering activities in telecommunication and data transmission services.'),
(483, 1, 7, 'Pa', 'Public Administration', 'Municipalities, regions and provinces.'),
(484, 1, 7, 'Packaging_activities', 'Packaging activities', 'The instances of this class represent, among all the business activities, some packaging and packaging activities also on behalf of third parties.'),
(485, 1, 7, 'Paramedical_activities', 'Paramedical activities', 'The instances of this class represent, among all business activities, certain independent paramedical activities.'),
(486, 1, 7, 'Parties_and_ceremonies', 'Parties and ceremonies', 'The instances of this class represent, among all the business activities, certain activities of organizing parties and ceremonies.'),
(487, 1, 7, 'Passenger_air_transport', 'Passenger Air Transport', 'The instances of this class represent, among all business activities, certain aviation activities.'),
(488, 1, 7, 'Pastry_shop', 'Pastry shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of cakes, sweets, confectionery.'),
(489, 1, 7, 'Path', 'String Service', 'Servizi rappresentati da una spezzata'),
(490, 1, 7, 'Pedestrian_zone', 'pedestrian zone', 'Each instance of this class represents an area reserved for pedestrian transit.'),
(491, 1, 7, 'Performing_arts_schools', 'Performing arts schools', 'The instances of this class represent, among all business activities, certain university and post-university, academy and conservation activities.'),
(492, 1, 7, 'Perfumery_and_cosmetic_articles', 'Perfumery and Cosmetic Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of cosmetics, perfumery, herbal medicine and personal hygiene.'),
(493, 1, 7, 'Personal_and_household_goods_rental', 'Personal and household goods rental', 'The instances of this class represent, among all business activities, certain rental activities of table linen, bed linen, bath linen and household linen, in addition to other personal and household goods.'),
(494, 1, 7, 'Personal_service_activities', 'Personal service activities', 'The instances of this class represent, among all business activities, certain services for the person.'),
(495, 1, 7, 'Pet_care_services', 'Pet care services', 'The instances of this class represent, among all business activities, certain pet care services (excluding veterinary services).'),
(496, 1, 7, 'Pet_shop', 'Pet Shop', 'The instances of this class represent, among all business activities, certain pet retail activities (including articles and food).'),
(497, 1, 7, 'Petroleum_and_natural_gas_extraction', 'Petroleum and natural gas extraction', 'The instances of this class represent, among all business activities, some activities supporting the extraction of oil and natural gas.'),
(498, 1, 7, 'Pharmaceuticals', 'Pharmaceuticals', 'The instances of this class represent, among all business activities, certain retail activities of medicinal products not subject to medical prescription.'),
(499, 1, 7, 'Pharmacy', 'Pharmacy', 'The demands of this class include, among all business activities, certain pharmacy and retail trade of medicines.'),
(500, 1, 7, 'Photographic_activities', 'Photographic activities', 'The instances of this class include, among all business activities, certain photographic activities, including photographic and aerial photography activities, and development and printing activities in photographic laboratories.'),
(501, 1, 7, 'Photovoltaic_system', 'Photovoltaic system', 'Geolocation of working photovoltaic plants.'),
(502, 1, 7, 'Physical_therapy_centre', 'Physical therapy centre', 'The instances of this class represent, among all business activities, some physiotherapy activities.'),
(503, 1, 7, 'Pizzeria', 'Pizzeria', 'The instances of this class represent, among all the business activities, some pizzerias.'),
(504, 1, 7, 'Poison_control_centre', 'Poison control centre', 'The instances of this class represent, among all service locations, some anti-theft centers.'),
(505, 1, 7, 'Police_headquarters', 'Police headquarters', 'The instances of this class represent, among all service locations, certain police headquarters.'),
(506, 1, 7, 'PollenObservation', 'Pollen observation', 'Each instance of this class represents a pollutant detection at a given time and place.'),
(507, 1, 7, 'PollenTrendObservation', 'Pollen trend observation', 'Each instance of this class represents a trend of pollutants with reference to a certain place and time interval.'),
(508, 1, 7, 'Pollen_monitoring_station', 'Pollen monitoring station', 'The instances of this class each represent an allergen level detector in the air.'),
(509, 1, 7, 'Pool', 'Pool', 'The instances of this class represent, among all business activities, some pools management activities.'),
(510, 1, 7, 'Port', 'Port', 'The instances of this class represent, among all service locations, certain ports.'),
(511, 1, 7, 'Post_secondary_education', 'Post-secondary education', 'The instances of this class represent, among all business activities, certain technical higher education and training (IFTS) activities.'),
(512, 1, 7, 'Postal_and_courier_activities', 'Postal and Courier Activities', 'The instances of this class represent, among all business activities, certain postal services and courier activities.'),
(513, 1, 7, 'Postal_office', 'Postal office', 'The instances of this class represent, among all the business activities, certain postal services with universal service obligation (on which, therefore, are legal obligations to ensure a minimum level of service for all users concerned, being a service of public interest).'),
(514, 1, 7, 'Pre_primary_education', 'Pre-primary education', 'The instances of this class represent, among all business activities, preparatory education activities: children\'s schools, special schools linked to primary schools.'),
(515, 1, 7, 'Prefecture', 'Prefecture', 'The instances of this class represent, among all service locations, certain offices of the Prefecture.'),
(516, 1, 7, 'Primary_education', 'Primary education', 'The instances of this class represent, among all business activities, certain primary education activities: elementary schools.'),
(517, 1, 7, 'Printing_and_recorded_media', 'Printing and Recorded Media', 'The instances of this class represent, among all business activities, some printing and reproduction of recorded media.'),
(518, 1, 7, 'Printing_and_services', 'Printing and Services', 'The instances of this class represent, among all the business activities, certain printing and bookbinding activities with related services, and certain newspaper printing activities.'),
(519, 1, 7, 'Private_clinic', 'Private clinic', 'The instances of this class represent, among all business activities, certain private clinics.'),
(520, 1, 7, 'Private_high_school', 'Private high school', 'The instances of this class represent, among all service locations, some private high schools.'),
(521, 1, 7, 'Private_infant_school', 'Private infant school', 'The instances of this class represent, among all service locations, some private infant schools.'),
(522, 1, 7, 'Private_junior_high_school', 'Private junior high school', 'The instances of this class represent, among all service locations, some private junior high school.'),
(523, 1, 7, 'Private_junior_school', 'Private junior school', 'The instances of this class represent, among all service locations, some private junior schools.'),
(524, 1, 7, 'Private_polytechnic_school', 'Private polytechnic school', 'The instances of this class represent, among all service locations, some private technical institutes.'),
(525, 1, 7, 'Private_preschool', 'Private preschool', 'The instances of this class represent, among all service locations, certain private nurseries.'),
(526, 1, 7, 'Private_professional_institute', 'Private professional institute', 'The instances of this class represent, among all service locations, some private professional institutes.'),
(527, 1, 7, 'Private_security', 'Private security', 'The instances of this class represent, among all business activities, certain private security services.'),
(528, 1, 7, 'Province', 'Provincial Administration', 'Class whose instances are the various provinces.'),
(529, 1, 7, 'Psychologists', 'Psychologists', 'The instances of this class represent, among all the business activities, some activities carried out by psychologists.'),
(530, 1, 7, 'PublicTransportLine', 'Bus Line', 'Line of a TPL company'),
(531, 1, 7, 'Public_high_school', 'Public high school', 'The instances of this class represent, among all service locations, some public high schools.'),
(532, 1, 7, 'Public_hospital', 'Public hospital', 'The instances of this class represent, among all service locations, some public hospitals.'),
(533, 1, 7, 'Public_infant_school', 'Public infant school', 'The instances of this class represent, among all service locations, some public nursery schools.'),
(534, 1, 7, 'Public_junior_high_school', 'Public junior high school', 'The instances of this class represent, among all service locations, some public middle schools.'),
(535, 1, 7, 'Public_junior_school', 'Public junior school', 'The instances of this class represent, among all service locations, some public junior schools.'),
(536, 1, 7, 'Public_polytechnic_school', 'Public polytechnic school', 'The instances of this class represent, among all service locations, some public technical institutes.'),
(537, 1, 7, 'Public_professional_institute', 'Public professional institute', 'The instances of this class represent, among all service locations, certain public professional institutes.'),
(538, 1, 7, 'Public_relations_office', 'Public relations office', 'The instances of this class represent, among all service locations, some Public Relations Offices (URPs).'),
(539, 1, 7, 'Public_university', 'Public university', 'The instances of this class represent, among all service locations, some public universities.'),
(540, 1, 7, 'Publishing_activities', 'Publishing activities', 'The instances of this class represent, among all business activities, certain activities of publishing newspapers, books, magazines, periodicals and other editorial activities.'),
(541, 1, 7, 'Quality_control_and_certification', 'Quality Control and Certification', 'The instances of this class represent, among all business activities, certain quality control activities and product, process and system certification, and certain activities for the protection of controlled production assets.'),
(542, 1, 7, 'Quarrying_of_stone_sand_and_clay', 'Quarrying of stone sand and clay', 'The instances of this class represent, among all the business activities, some extractive activities, and in particular: gravel and sand extraction; Extraction of clay and kaolin; Extraction of ornamental and construction stones, limestone, plaster, clay and slate stone.'),
(543, 1, 7, 'RTZgate', 'RTZ gate', 'Each instance of this class represents a gateway to a restricted traffic zone.'),
(544, 1, 7, 'Radio_broadcasting', 'Radio broadcasting', 'The instances of this class represent, among all business activities, certain radio broadcasting activities.'),
(545, 1, 7, 'Radiotherapy_centre', 'Radiotherapy centre', NULL),
(546, 1, 7, 'Rafting_kayak', 'Rafting kayak', 'The instances of this class represent, among all service locations, some locations where rafting, canoeing and kayaking can be practiced.'),
(547, 1, 7, 'RailwayDirection', 'Railway Direction', 'Class whose instances are the railway directives.'),
(548, 1, 7, 'RailwayElement', 'Railway Element', 'Class whose instances are the elements that make up the sections, sections or rail lines.'),
(549, 1, 7, 'RailwayJunction', 'Railway Junction', 'Two junctions delimit a railway element and represent railway stations or freight terminals.'),
(550, 1, 7, 'RailwayLine', 'Railway Line', 'Class whose instances are the railway lines.'),
(551, 1, 7, 'RailwaySection', 'Railway Section', 'Class whose instances are the railway sections.'),
(552, 1, 7, 'RainfallObservation', 'Rainfall observation', 'Each instance of this class represents a precipitation detection in a certain place and time interval.'),
(553, 1, 7, 'Recreation_room', 'Recreation room', 'The instances of this class represent, among all the service venues, some recreation rooms.'),
(554, 1, 7, 'Recreational_and_sports_goods_rental', 'Recreational and Sports Goods rental', 'The instances of this class represent, among all business activities, some rental activities of sports and recreational equipment, including pleasure boats and in particular pedalos.'),
(555, 1, 7, 'Recruitment', 'Recruitment', 'The instances of this class represent, among all business activities, certain research, selection, placement, management and support services for staff relocation.'),
(556, 1, 7, 'Red_cross', 'Red cross', 'The instances of this class represent, among all service locations, certain Red Cross seats.'),
(557, 1, 7, 'Region', 'Regional Administration', 'Class whose instances are the various regions.'),
(558, 1, 7, 'RegularService', 'Regular Service', 'Services that may have other features, represented as cross services.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(559, 1, 7, 'Religiuos_guest_house', 'Religious guest house', 'The instances of this class represent, among all service locations, certain holiday homes operated by monastic orders.'),
(560, 1, 7, 'Repair', 'Repair', 'The instances of this class represent, among all the business activities, some quick repair services, key duplication, sharpening knives, immediate printing on textile articles, quick metal engraving, non-precious metal repair items, and Repair of other articles of consumption for personal use and for the house.'),
(561, 1, 7, 'Repair_musical_instruments', 'Repair musical instruments', 'The instances of this class represent, among all the business activities, some musical instruments repair services.'),
(562, 1, 7, 'Repair_of_communication_equipment', 'Repair of communication equipment', 'The instances of this class represent, among all business activities, certain repair and maintenance services for fixed, cordless, cellular and other telecommunication equipment.'),
(563, 1, 7, 'Repair_of_consumer_electronics', 'Repair of consumer electronics', 'The instances of this class represent, among all business activities, some repair services for consumer electronics and audio and video products for personal and home use.'),
(564, 1, 7, 'Repair_of_footwear_and_leather_goods', 'Repair of footwear and leather goods', 'The instances of this class represent, among all business activities, certain repair services for footwear and luggage in leather, leather or similar materials.'),
(565, 1, 7, 'Repair_of_garden_equipment', 'Repair of garden equipment', 'The instances of this class represent, among all business activities, certain gardening repair services.'),
(566, 1, 7, 'Repair_of_home_equipment', 'Repair of home equipment', 'The instances of this class represent, among all business activities, certain repair services of other goods for personal and home use.'),
(567, 1, 7, 'Repair_of_household_appliances', 'Repair of household appliances', 'The instances of this class represent, among all the business activities, some repair services of household appliances and household items.'),
(568, 1, 7, 'Repair_of_sporting_goods', 'Repair of sporting goods', 'The instances of this class represent, among all business activities, certain repair services for sporting goods (excluding sportswear) and camping equipment (including bicycles).'),
(569, 1, 7, 'Reporting_agencies', 'Reporting agencies', 'The instances of this class represent, among all business activities, certain commercial information agencies.'),
(570, 1, 7, 'Reproduction_recorded_media', 'Reproduction Recorded Media', 'The instances of this class represent, among all business activities, certain activities of reproduction of recorded media.'),
(571, 1, 7, 'Rescuers', 'Rescuers area', 'Each instance of this class represents a meeting point for rescuers in case of disaster.'),
(572, 1, 7, 'Research_and_development', 'Research and development', 'The instances of this class represent, among all the business activities, certain scientific research and research and experimental development activities in the fields of geology, natural sciences, engineering, biotechnology, social sciences and humanities.'),
(573, 1, 7, 'Reserved_lane', 'Reserved lane', 'Each instance of this class represents a lane reserved for a specific type of user.'),
(574, 1, 7, 'Residential_care_activities', 'Residential care activities', 'The demands of this class include, among all business activities, certain residential care facilities for the elderly, disabled motorists, people with mental retardation, mental disorders, or abusing drugs.'),
(575, 1, 7, 'Resolution', 'Resolution', 'Resolution approved by a Public Administration.'),
(576, 1, 7, 'Rest_home', 'Rest home', 'The instances of this class represent, among all service locations, some rest homes.'),
(577, 1, 7, 'Restaurant', 'Restaurant', 'The instances of this class represent, among all business activities, certain catering services in a fixed location (including farmhouses), and all mobile catering services on trains, ships and others.'),
(578, 1, 7, 'Restorers', 'Restorers', 'The instances of this class represent, among all the business activities, some conservation and restoration works of art.'),
(579, 1, 7, 'Retail_motor_vehicles_parts', 'Retail Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles and brokering in the trade of motorcycle parts and accessories.'),
(580, 1, 7, 'Retail_sale_non_specialized_stores', 'Retail Sale Non-Specialized Stores', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses, including prevalence of food and beverages.'),
(581, 1, 7, 'Retail_trade', 'Retail Trade', 'The instances of this class represent, among all business activities, certain retail activities.'),
(582, 1, 7, 'Ride', 'Ride', 'Run scheduled by a certain TPL company on a certain route of a certain line.'),
(583, 1, 7, 'Riding_stables', 'Riding stables', 'The instances of this class represent, among all service locations, some riding stables activities.'),
(584, 1, 7, 'Road', 'Road', 'Class whose instances are the streets.'),
(585, 1, 7, 'RoadElement', 'Road element', 'Class whose instances are the elements that make up the streets.'),
(586, 1, 7, 'RoadLink', 'RoadLink', 'Linear road section bounded by two junctions that make up the road element.'),
(587, 1, 7, 'Roman_bridge', 'Roman bridge', 'The instances of this class represent the Roman bridges.'),
(588, 1, 7, 'Rope_cord_and_twine', 'Rope cord and twine', 'The instances of this class represent, among all business activities, certain retail activities of spades, ropes, canvases and jute bags and packaging products (excluding paper and board products).'),
(589, 1, 7, 'Route', 'Route', 'A route that is driven by public transport.'),
(590, 1, 7, 'RouteJunction', 'Route Junction', 'Interconnection point between road segments to determine the path of a TPL line.'),
(591, 1, 7, 'RouteLink', 'RouteLink', 'Road section bounded by two TPL junction that determines the path of a TPL line.'),
(592, 1, 7, 'RouteSection', 'Route Section', 'Road section between two successive bus stops in a certain line.'),
(593, 1, 7, 'Rtz_daily', 'Zona a traffico limitato diurno', 'Each instance of this class represents a limited active zone in the only daylight hours.'),
(594, 1, 7, 'Rtz_nightly', 'Restricted traffic zone nightly', 'Ciascuna istanza di questa classe rappresenta una zona a traffico limitato attiva nelle sole ore notturne.'),
(595, 1, 7, 'Sailing_school', 'Sailing school', 'The instances of this class represent, among all service locations, some sailing schools.'),
(596, 1, 7, 'Sale_motor_vehicles_parts', 'Sale Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles.'),
(597, 1, 7, 'Sale_of_motor_vehicles', 'Sale of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain car trade activities.'),
(598, 1, 7, 'Sale_of_motor_vehicles_and_motorcycles', 'Sale of Motor Vehicles and Motorcycles', 'The instances of this class represent, among all business activities, certain wholesale and retail activities and repair of motor vehicles and motorcycles.'),
(599, 1, 7, 'Sale_of_motorcycles', 'Sale of Motorcycles', 'The instances of this class represent, among all the business activities, certain activities of trade, maintenance and repair of motorcycles and related parts and accessories.'),
(600, 1, 7, 'Sale_via_mail_order_houses_or_via_internet', 'Sale Via Mail Order Houses or Via Internet', 'The instances of this class represent, among all business activities, certain retail activities of any type of correspondence, radio, telephone, Internet product.'),
(601, 1, 7, 'Sandwich_shop_pub', 'Sandwich shop pub', 'The instances of this class represent, among all business activities, some sandwich shops and pubs.'),
(602, 1, 7, 'Sanitary_equipment', 'Sanitary Equipment', 'The instances of this class represent, among all the business activities, certain retail activities of sanitary articles.'),
(603, 1, 7, 'Sawmilling', 'Sawmilling', 'The instances of this class represent, among all the business activities, some wood cutting and planing activities.'),
(604, 1, 7, 'SchoolObservation', 'SchoolObservation', NULL),
(605, 1, 7, 'Second_hand_books', 'Second-Hand Books', 'The instances of this class represent, among all the business activities, certain retail activities of second hand articles and books.'),
(606, 1, 7, 'Second_hand_goods', 'Second-Hand Goods', 'The instances of this class represent, among all business activities, certain retail activities of second hand items and clothing.'),
(607, 1, 7, 'Secondary_education', 'Secondary education', 'The instances of this class represent, among all business activities, secondary education of first and second grade general (high school), technical, vocational and artistic education.'),
(608, 1, 7, 'Secretarial_support_services', 'Secretarial support services', 'The instances of this class represent, among all business activities, certain photocopying, document preparation and other specialized support activities for office functions, and certain activities for the dispatch of propaganda material, compilation and address management .'),
(609, 1, 7, 'Security_systems', 'Security systems', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(610, 1, 7, 'Security_systems_service', 'Security systems service', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(611, 1, 7, 'Senior_centre', 'Senior centre', 'The instances of this class represent, among all the places of service, some old-age hospitals.'),
(612, 1, 7, 'SensorSite', 'Traffic sensor', 'Single sensor for observing speed, traffic, concentration or density'),
(613, 1, 7, 'SensorSiteTable', 'Sensor Site Table', 'Set of sensors representing a single installation, a single site.'),
(614, 1, 7, 'Service', 'Service', 'Business activities, services to the citizen, offices, services in general, which can be located at one point.'),
(615, 1, 7, 'Sewerage', 'Sewerage', 'The instances of this class represent, among all business activities, certain sewerage companies.'),
(616, 1, 7, 'Sexy_shop', 'Sexy Shop', 'The instances of this class represent, among all the business activities, some retail business of adult articles (sexy shop).'),
(617, 1, 7, 'Shelter_area', 'Shelter area', 'Ciascuna istanza di questa classe rappresenta un punto di raccolta della popolazione in caso di calamità.'),
(618, 1, 7, 'ShoppingAndService', 'Shopping and service', 'Shops, malls, stores, all forms of public sale activities.'),
(619, 1, 7, 'Shopping_centre', 'Shopping centre', 'The instances of this class represent, among all business activities, some department stores.'),
(620, 1, 7, 'Single_brand_store', 'Single brand store', 'The instances of this class represent, among all service locations, some single-brand stores.'),
(621, 1, 7, 'SituationRecord', 'Situation Record of a Car Park', 'Recording the situation of a given parking lot at a certain time.'),
(622, 1, 7, 'Ski_school', 'Ski school', 'The instances of this class represent, among all the service centers, some ski schools.'),
(623, 1, 7, 'Skiing_facility', 'Skiing facility', 'The instances of this class represent, amongst all service locations, some skiing facilties.'),
(624, 1, 7, 'Small_household_appliances', 'Small Household Appliances', 'The instances of this class represent, among all the business activities, some retail business of sewing machines and household knitwear.'),
(625, 1, 7, 'Small_shop', 'Small shop', 'The instances of this class represent, among all business activities, some grocery stores.'),
(626, 1, 7, 'SmartBenchObservation', 'Smart bench observation', 'Each instance of this class represents a detection from a bench equipped with advanced features.'),
(627, 1, 7, 'SmartIrrigatorObservation', 'Smart irrigator observation', 'Each instance of this class represents a detection from a sprinkler equipped with advanced features.'),
(628, 1, 7, 'SmartWasteContainerObservation', 'Smart waste container observation', 'Each instance of this class represents a detection from a waste container with advanced features.'),
(629, 1, 7, 'Smart_bench', 'Smart bench', 'Ciascuna istanza di questa classe rappresenta una panchina dotata di funzionalità evolute.'),
(630, 1, 7, 'Smart_irrigator', 'Smart irrigator', 'Each instance of this class represents an irrigator with advanced features.'),
(631, 1, 7, 'Smart_street_light', 'Smart street light', 'Each instance of this class represents a street lamp with advanced features.'),
(632, 1, 7, 'Smart_waste_container', 'Smart waste container', 'Each instance of this class represents a garbage dump with advanced features.'),
(633, 1, 7, 'Social_centre', 'Social centre', 'The instances of this class represent, among all service locations, some social centers.'),
(634, 1, 7, 'Social_security_service_office', 'Social security service office', 'The instances of this class represent, among all service locations, certain offices of the National Institute of Social Security.'),
(635, 1, 7, 'Social_work', 'Social work', 'The demands of this class include, among all business activities, certain nursery services, day care for disabled children and residential and non-residential social services for the elderly and disabled.'),
(636, 1, 7, 'Software_publishing', 'Software publishing', 'The instances of this class represent, among all the business activities, some computer and software play activities.'),
(637, 1, 7, 'Sound_recording_and_music_publishing', 'Sound Recording and Music Publishing', 'The instances of this class include, among all the business activities, some sound recording and music publishing activities also in sound recording studios.'),
(638, 1, 7, 'Souvenirs_craftwork_and_religious_articles', 'Souvenirs Craftwork and Religious Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of worship and decoration art, trinkets, costume jewelery and handicrafts.'),
(639, 1, 7, 'Specialized_construction', 'Specialized Construction', 'The instances of this class represent, among all the business activities, certain specialized construction activities, such as: installation of street lighting and signaling devices, illumination of the slopes of airports (including maintenance and repair); installation of sewage treatment plants for swimming pools (including maintenance and repair); Installation of irrigation systems for gardens (including maintenance and repair); drilling and perforation; works of thermal, acoustic or anti-vibration insulation; installation of electronic equipment (including maintenance and repair); installation of electrical installations in buildings or in other works of building (included maintenance and repair); tinteggiatura and pose in work of glasses; Installation of plumbing, heating and air conditioning (including maintenance and repair) in buildings or in other works of construction; poses in work of casseforti and infissi; completion and finishing of buildings; demolition of buildings; poses in work of infissi, furnitures, controsoffitti, mobile and alike walls; covering of floors and walls; preparation of the yard building and placing of the terrain; plastering and plastering; installation of gas distribution facilities (including maintenance and repair); installation of fire extinguishing systems, including integrated ones (including maintenance and repair); installation, repair and maintenance of elevators and escalators.'),
(640, 1, 7, 'Specialized_design', 'Specialized Design', 'The instances of this class represent, among all business activities, certain design activities including: some professional, scientific and technical activities; certain specialized design activities; fashion and industrial design activities; activities of technical designers; graphics and graphic design, including Web pages.'),
(641, 1, 7, 'Speed_camera', 'Speed camera', 'The instances of this class are each a speedcam.'),
(642, 1, 7, 'Sport_event_promoters', 'Sport event promoters', 'The instances of this class represent, among all the business activities, certain activities of sports organizations, including the promotion of sporting events.'),
(643, 1, 7, 'Sporting_equipment', 'Sporting Equipment', 'The instances of this class represent, among all business activities, certain retail activities of sporting goods, bicycles, leisure articles and underwater activities.'),
(644, 1, 7, 'Sports_and_recreation_education', 'Sports and recreation education', 'The instances of this class represent, among all the business activities, some activities of organizing sports and recreational courses.'),
(645, 1, 7, 'Sports_clubs', 'Sports clubs', 'The instances of this class represent, among all the business activities, some activities of sports clubs.'),
(646, 1, 7, 'Sports_facility', 'Sports facility', 'The instances of this class represent, among all the business activities, some sports facilities management activities.'),
(647, 1, 7, 'Squares', 'Squares', 'The instances of this class represent, among all the places of service, some squares of interest to carry out cultural activities.'),
(648, 1, 7, 'Stalls_and_markets', 'Stalls and Markets', 'The instances of this class represent, among all business activities, certain street retailing business activities.'),
(649, 1, 7, 'Stalls_and_markets_of_clothing_and_footwear', 'Stalls and Markets of Clothing and Footwear', 'The instances of this class represent, among all the business activities, certain street retailing business of textiles, home textiles, clothing, footwear and leather goods.'),
(650, 1, 7, 'Stalls_and_markets_of_food', 'Stalls and Markets of Food', 'The instances of this class represent, among all business activities, some street retailing business of foodstuffs and beverages, fruit and vegetables, fish products and meats.'),
(651, 1, 7, 'Stalls_and_markets_other_goods', 'Stalls and Markets Other Goods', 'The instances of this class represent, among all the business activities, certain street retailing business of machinery, equipment and products for agriculture, gardening equipment, trinkets, jewelery, garden furniture, furniture, carpets, Mats, household items, household appliances, electrical equipment, perfumes and cosmetics, soaps, detergents and other detergents for any use, flowers, plants, bulbs, seeds and fertilizers.'),
(652, 1, 7, 'Stamps_and_coins', 'Stamps and Coins', 'The instances of this class represent, among all the business activities, certain pharmacy, numismatics and collectibles retail activities.'),
(653, 1, 7, 'StatisticalData', 'StatisticalData', 'Value referring to a statistical data linked to a road or to a Public Administration.'),
(654, 1, 7, 'Stone_processing', 'Stone Processing', 'The instances of this class represent, among all the business activities, certain mining activities of various stones and minerals not related to the extraction, segagion and processing of stones and marble, artistic marble processing and other related stones , Mosaic work, cutting, molding and finishing of stones.'),
(655, 1, 7, 'StreetNumber', 'Street Number', 'Class whose instances are known civic numbers.'),
(656, 1, 7, 'Street_light', 'Street light', 'Each instance of this class represents a lamppost of the street lighting system.'),
(657, 1, 7, 'Street_sweeping', 'Street sweeping', 'The instances of this class include, among all the business activities, some cleaning and washing activities in public areas, removal of snow and ice.'),
(658, 1, 7, 'Summer_camp', 'Summer camp', 'The instances of this class represent, among all the business activities, certain activities of marine and mountain colonies.'),
(659, 1, 7, 'Summer_residence', 'Summer residence', 'The instances of this class represent, among all service locations, some holiday homes.'),
(660, 1, 7, 'Supermarket', 'Supermarket', 'The instances of this class represent, among all business activities, some supermarkets.'),
(661, 1, 7, 'Support_activities_for_transportation', 'Support Activities for Transportation', 'The instances of this class represent, among all business activities, certain services related to land, air, sea, and waterways transport.'),
(662, 1, 7, 'Support_animal_production', 'Support Animal Production', 'The instances of this class represent, among all the business activities, certain support activities for farming, including in particular agricultural crops associated with animal breeding, plant and animal production support activities, agriculture and subsequent collection activities.'),
(663, 1, 7, 'Surgical_activities', 'Surgical activities', NULL),
(664, 1, 7, 'Surveyor', 'Surveyor', 'The instances of this class represent, among all the business activities, certain technical activities carried out by geometers.'),
(665, 1, 7, 'Sushi_bar', 'Sushi bar', 'The instances of this class represent, among all business activities, some sushi bars.'),
(666, 1, 7, 'Take_away', 'Take Away', 'The instances of this class represent, among all the business activities, certain catering activities (without provision) for preparation of takeaway foods.'),
(667, 1, 7, 'Tannery', 'Tannery', 'The instances of this class include, among all the business activities, certain tanning activities of leather, manufacture of travel articles, handbags, leather goods and saddlery, fur preparation and dyeing.'),
(668, 1, 7, 'Tattoo_and_piercing', 'Tattoo and piercing', 'The instances of this class represent, among all the business activities, some tattoo and piercing activities.'),
(669, 1, 7, 'Tax_advice', 'Tax advice', 'The instances of this class represent, among all business activities, certain activities carried out by Tax Assistance Centers.'),
(670, 1, 7, 'Taxi_company', 'Taxi Company', 'The instances of this class represent, among all business activities, some taxi transport activities.'),
(671, 1, 7, 'Taxi_park', 'Taxi park', 'The instances of this class represent, among all service locations, certain parking areas for taxis.'),
(672, 1, 7, 'Technical_consultants', 'Technical consultants', 'The instances of this class represent, among all business activities, certain activities of architecture, engineering and other engineering studies.'),
(673, 1, 7, 'Technical_testing', 'Technical testing', 'The instances of this class represent, among all the business activities, certain testing and technical analysis activities.'),
(674, 1, 7, 'Telecommunications', 'Telecommunications', 'The instances of this class represent, among all business activities, certain retail trade activities of telecommunications equipment and telephony in specialized stores.'),
(675, 1, 7, 'Television_broadcasting', 'Television broadcasting', 'The instances of this class represent, among all the business activities, certain activities of television programming and broadcasting.'),
(676, 1, 7, 'Temp_agency', 'Temp agency', 'The instances of this class represent, among all the business activities, certain activities of the temporary employment agency.'),
(677, 1, 7, 'Textile_manufacturing', 'Textile Manufacturing', 'The instances of this class represent, among all the business activities, certain textile manufacturing activities, including: manufacture of twine, string, ropes and nets; manufacture of tulle, lace and lace; packaging of textile articles (excl. articles of clothing); manufacture of felt and textile articles diverse; manufacture of nonwovens and articles thereof (excl. articles of apparel); manufacture of embroidery; manufacture of carpets and carpets; finishing of textiles, of articles of changing room and similari activities; preparation and spinning of textile fibers; weaving; confezionamento of biancheria of bed, of table and for the amoblamiento; manufacture of knitted fabrics; manufacture of ribbons, labels and trimmings of textile fibers.'),
(678, 1, 7, 'Textiles_products', 'Textiles Products', 'The instances of this class represent, among all the business activities, certain retail trade activities of textile products.'),
(679, 1, 7, 'Theatre', 'Theatre', 'The instances of this class include, among all the business activities, certain theatrical activities, including in particular: activities in the field of directing; other activities supporting artistic representations; management of theaters, concert halls and other artistic structures; activities in the field of acting; artistic and literary creations; artistic representations; rental with operator of structures and equipment for events and shows.'),
(680, 1, 7, 'ThermometryObservation', 'Thermometry observation', 'Ciascuna istanza di questa classe rappresenta una rilevazione della temperatura eseguita in un certo luogo ad un certo istante di tempo.'),
(681, 1, 7, 'Ticket_sale', 'Ticket sale', 'The instances of this class represent, among all business activities, certain ticketing services for theatrical, sports and other recreational and entertainment events.'),
(682, 1, 7, 'Tobacco_industry', 'Tobacco Industry', 'The instances of this class represent, among all the business activities, certain tobacco industries.'),
(683, 1, 7, 'Tobacco_shop', 'Tobacco shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of monopolies (tobaccos).'),
(684, 1, 7, 'Toilet', 'Toilet', 'The instances of this class represent, among all the services, some public toilets, to be framed in the context of tourist services.'),
(685, 1, 7, 'Tour_operator', 'Tour operator', 'The instances of this class represent, among all business activities, certain activities of travel agencies.'),
(686, 1, 7, 'TourismService', 'Tourism Services', 'Activities of travel agency services, tour operators and booking services.'),
(687, 1, 7, 'Tourist_complaints_office', 'Tourist complaints office', 'The instances of this class represent, among all service locations, certain complaint offices dedicated to the tourism sector.'),
(688, 1, 7, 'Tourist_guides', 'Tourist guides', 'The instances of this class represent, among all the business activities, certain activities of guides and tour guides.'),
(689, 1, 7, 'Tourist_information_office', 'Tourist information office', 'The instances of this class represent, among all service locations, some tourist information offices.'),
(690, 1, 7, 'Tourist_trail', 'tourist trail', 'The instances of this class represent, among all service locations, certain tourist itineraries.'),
(691, 1, 7, 'Towing_and_roadside_assistance', 'Towing and Roadside Assistance', 'The instances of this class represent, among all the business activities, some towing and roadside assistance activities.'),
(692, 1, 7, 'TrafficConcentration', 'Traffic Concentration Observation', 'Subclass of observations on auto concentration.'),
(693, 1, 7, 'TrafficFlow', 'Traffic Flow Observation', 'Subclass of auto flow observations.'),
(694, 1, 7, 'TrafficHeadway', 'Traffic Headway Observation', 'Sub-class of observations on the average transit time between cars.'),
(695, 1, 7, 'TrafficObservation', 'Traffic observation', 'Each instance of this class represents a traffic detection performed at some point at some time.'),
(696, 1, 7, 'TrafficSpeed', 'TrafficSpeed Observation', 'Subclass of average velocity observations.'),
(697, 1, 7, 'Traffic_corps', 'Traffic corps', 'Each instance of this class represents a Street Police Station.'),
(698, 1, 7, 'Traffic_light', 'Traffic light', 'The instances of this class are each a semaphorical facility.'),
(699, 1, 7, 'TrainStation', 'Train Station', 'Railway station, are located at railway junctions with a ratio of 1:1'),
(700, 1, 7, 'Train_lost_property_office', 'Train lost property office', 'The instances of this class represent, among all service locations, some offices for the lost items located inside train stations.'),
(701, 1, 7, 'Train_station', 'Train station', 'The instances of this class represent, at all service locations, some railway stations.'),
(702, 1, 7, 'Training_school', 'Training school', 'The instances of this class represent, among all business activities, some training courses and professional updating courses.'),
(703, 1, 7, 'Training_school_for_teachers', 'Training school for teachers', 'The instances of this class represent, among all service locations, some master schools.'),
(704, 1, 7, 'Tram_stops', 'Tram stops', 'The instances of this class represent, at all service locations, some tram stops.'),
(705, 1, 7, 'Tramline', 'Tram line', 'The instances of this class represent, among all service locations, some tram lines.'),
(706, 1, 7, 'TransferServiceAndRenting', 'Transfer service and renting', 'Car parks, railway stations or buses, everything that must be located on a map and refers to transportation.'),
(707, 1, 7, 'Translation_and_interpreting', 'Translation and interpreting', 'The instances of this class represent, among all the business activities, some translation and interpretation activities.'),
(708, 1, 7, 'TransverseService', 'Transverse Service', 'Services often associated with other services, which have their own geolocation.'),
(709, 1, 7, 'Trattoria', 'Trattoria', 'The instances of this class represent, among all the business activities, some trattorias.'),
(710, 1, 7, 'Travel_agency', 'Travel agency', 'The instances of this class represent, among all business activities, some travel agencies.'),
(711, 1, 7, 'Travel_bureau', 'Travel bureau', 'The instances of this class represent, among all service locations, some tourist offices dedicated to guided tours.'),
(712, 1, 7, 'Travel_goods', 'Travel goods', 'The instances of this class represent, among all business activities, certain retail trade of leather goods and travel goods.'),
(713, 1, 7, 'Travel_information', 'Travel information', 'The instances of this class represent, among all business activities, certain services provided by travel agencies and tour operators, booking services, services of tourist interest made by subjects other than travel agencies and tour operators, and related activities.'),
(714, 1, 7, 'Trinkets', 'Trinkets', 'The instances of this class represent, among all the business activities, certain retail trade of trinkets and jewelery (including souvenirs and promotional items).'),
(715, 1, 7, 'Underwear_knitwear_and_shirts', 'Underwear, Knitwear and Shirts', 'The instances of this class represent, among all the business activities, some retail business of personal linen, knitwear, shirts.'),
(716, 1, 7, 'Upholsterer', 'Upholsterer', 'The instances of this class represent, among all the business activities, some upholstery workshops.'),
(717, 1, 7, 'Urban_bus', 'Urban bus', 'The instances of this class represent, among all service locations, the locations of certain local public transport companies operating on urban areas.'),
(718, 1, 7, 'Useful_numbers', 'Useful numbers', 'The instances of this class represent the numbers to be called in an emergency.'),
(719, 1, 7, 'UtilitiesAndSupply', 'Utilities and supply', 'Fornitura di utenze e servizi'),
(720, 1, 7, 'Vacating_service', 'Vacating service', 'The instances of this class represent, among all business activities, certain activities of clearing cellars, floors and garages.'),
(721, 1, 7, 'Vacation_resort', 'Vacation resort', 'The instances of this class represent, among all service locations, some holiday resorts.'),
(722, 1, 7, 'Vehicle_rental', 'Vehicle rental', 'The instances of this class represent, among all service locations, certain vehicle rental services.'),
(723, 1, 7, 'Vehicle_trade', 'Vehicle trade', 'This class represents, among all business activities, the business of buying and selling vehicles.'),
(724, 1, 7, 'Vending_machines', 'Vending Machines', 'The instances of this class represent, among all business activities, certain retail activities carried out by automated vending machines.'),
(725, 1, 7, 'Veterinary', 'Veterinary', 'The demands of this class represent, among all business activities, certain veterinary services.'),
(726, 1, 7, 'Video_tapes_disks_rental', 'Video tapes disks rental', 'The instances of this class represent, among all business activities, some hire of video cassettes, CDs, DVDs and discs containing audiovisual or video games.'),
(727, 1, 7, 'Viewpoint', 'Viewpoint', 'Ciascuna istanza di questa classe rappresenta un punto panoramico.'),
(728, 1, 7, 'Wallpaper_and_floor_coverings', 'Wallpaper and Floor Coverings', 'The instances of this class represent, among all business activities, some retail business of wallpaper and floor coverings (carpet and linoleum).'),
(729, 1, 7, 'Warehousing_and_storage', 'Warehousing and Storage', 'The instances of this class represent, among all business activities, certain storage and custody activities, and in particular: storage and custody; warehousing and transport support activities; refrigerated warehouses for third parties; warehouses of custody and deposit for third account.'),
(730, 1, 7, 'WasteType', 'Waste container type', 'Each instance of this class represents a particular type of waste container (undifferentiated, paper, plastic, glass, drugs, and so on).'),
(731, 1, 7, 'Waste_collection_and_treatment', 'Waste Collection and Treatment', 'The instances of this class represent, among all business activities, certain waste collection, treatment and disposal activities.'),
(732, 1, 7, 'Waste_container', 'Waste container', 'Each instance of this class represents a waste bin.'),
(733, 1, 7, 'Water_collection_treatment_and_supply', 'Water Collection Treatment and Supply', 'The instances of this class represent, among all business activities, certain activities of gathering, treating and supplying water.'),
(734, 1, 7, 'Water_resource', 'Water resource', 'Each instance of this class represents a water resource company or entity.'),
(735, 1, 7, 'Water_transport', 'Water Transport', 'The instances of this class represent, among all the business activities, certain maritime, coastal and inland waterway transport activities.'),
(736, 1, 7, 'Weapons_and_ammunition', 'Weapons and Ammunition', 'The instances of this class represent, among all business activities, certain retail trade activities of weapons, ammunition and military articles.'),
(737, 1, 7, 'WeatherPrediction', 'Weather prediction', 'Meteorological forecast for a specific part of the day.'),
(738, 1, 7, 'WeatherReport', 'Weather Report', 'Meteorological report with information on temperature, humidity, snow and the like.'),
(739, 1, 7, 'Weather_sensor', 'Weather sensor', 'Weather sensor releasing information on weather forecasts.'),
(740, 1, 7, 'Web_and_internet_provider', 'Web and Internet Provider', 'The instances of this class represent, among all business activities, some hosting and provision of application services, including Web portals.'),
(741, 1, 7, 'Wedding_favors', 'Wedding Favors', 'The instances of this class represent, among all business activities, certain candy-shop retail activities.'),
(742, 1, 7, 'Welfare_worker_office', 'Welfare worker office', 'The instances of this class represent, among all service locations, certain offices of social workers.'),
(743, 1, 7, 'Wellness_centre', 'Wellness centre', 'The instances of this class represent, among all business activities, certain activities of centers for physical well-being and spa facilities.'),
(744, 1, 7, 'Wholesale', 'Wholesale', 'Wholesale of anything.'),
(745, 1, 7, 'Wholesale_agricultural_raw_materials_live_animals', 'Wholesale Agricultural Raw Materials Live Animals', 'The instances of this class represent, among all business activities, certain wholesale trade in animal and vegetable products, including: cereals and pulses; Live animals; Leather and raw hides and skins (excluding fur skins); Raw skins and furskins; Seeds and feed for livestock (feed), officinal plants, oilseeds, potatoes; Cereals, raw tobacco, seed and livestock feed (feed); flowers and plants.'),
(746, 1, 7, 'Wholesale_commission_trade', 'Wholesale Commission Trade', 'The instances of this class represent, among all the business activities, certain activities of agents and trade representatives.'),
(747, 1, 7, 'Wholesale_food_beverages_tobacco', 'Wholesale Food Beverages Tobacco', 'The instances of this class represent, among all the business activities, certain activities of wholesale trade in food and tobacco products.'),
(748, 1, 7, 'Wholesale_household_goods', 'Wholesale Household Goods', 'The instances of this class represent, among all business activities, certain non-food wholesale trade activities.'),
(749, 1, 7, 'Wholesale_ict_equipment', 'Wholesale ICT Equipment', 'The instances of this class represent, among all business activities, certain wholesale activities of electronic, computer and similar equipment.'),
(750, 1, 7, 'Wholesale_machinery_equipmentent_supplies', 'Wholesale Machinery Equipmentent Supplies', 'The instances of this class represent, among all business activities, certain wholesale trade of professional equipment.'),
(751, 1, 7, 'Wholesale_motor_vehicles_parts', 'Wholesale Motor Vehicles Parts', 'The instances of this class represent, among all business activities, certain wholesale and brokering activities of parts and accessories of motor vehicles.'),
(752, 1, 7, 'Wholesale_trade', 'Wholesale Trade', 'The instances of this class represent, among all business activities, certain wholesale activities.'),
(753, 1, 7, 'Wifi', 'Free WiFi point', 'The instances of this class represent, among all service locations, certain access points to Wi-Fi networks.'),
(754, 1, 7, 'WineAndFood', 'Wine And Food', 'Restaurants, wine bars and all other food and wine activities.'),
(755, 1, 7, 'Wine_shop_and_wine_bar', 'Wine shop and wine bar', 'The instances of this class represent, among all business activities, certain beverage retail activities.'),
(756, 1, 7, 'Youth_assistance', 'Youth assistance', 'The instances of this class represent, among all service locations, some childcare centers.'),
(757, 1, 7, 'Youth_information_centre', 'Youth information centre', 'The instances of this class represent, among all service locations, certain youth information centres.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 1, NULL, NULL, 'Personnage de dessins animés'),
(3, 1, 110, NULL, NULL, 'Cartographie');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int NOT NULL,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
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
(25, 2, 185, NULL, NULL, 5, NULL, 0, 0),
(26, 3, 1, NULL, NULL, 1, NULL, 0, 0),
(27, 3, 4, NULL, NULL, 2, NULL, 0, 0),
(28, 3, 195, NULL, NULL, 3, NULL, 0, 0),
(29, 3, 196, NULL, NULL, 4, NULL, 0, 0),
(30, 3, 194, NULL, NULL, 5, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('vdn54ojk603fq4lp8ri0onps8m', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631363439373737302e3038383233363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b3375363039396a377162696472666f63396573306230626e6c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363533373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363530313336313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631363439363536323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363439363638383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363530313336313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363530313337303b7d7d72656469726563745f75726c7c733a33393a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f6d65646173315f32302d32312f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223534653339623766626238633339383031356539613637376232313839653761223b733a33323a226661306564333934356362616135346539343062313531643163613332646335223b733a33323a226530353930373639653036646662326461376336643161353762363466393161223b733a33323a223065353762303438316534313163306662386161326433373036656230396434223b7d733a343a2268617368223b733a36353a2230653537623034383165343131633066623861613264333730366562303964342d6530353930373639653036646662326461376336643161353762363466393161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223734643235616130333937373064623963663261363261383333363232616339223b733a33323a223236303832353232623664663335383164363763636531343732386238393937223b733a33323a226230623566343133333766636130376662363338323162616535313066306661223b733a33323a226337353431353539353662346462316536646564663136333163646463396462223b733a33323a223861326165643261393530346233333238643234656337656233303865396161223b733a33323a223133623962656265303837393038346163313538626434663866623636326563223b733a33323a226534653830626361376633663066343532623631316661646131623536363361223b733a33323a226266633030623334616437346265376634303435633630643435343336366635223b733a33323a223336616137393934323735366564656630386532313130363338636533633635223b733a33323a223466646335626432353931353439366530336537346266613164386531666430223b733a33323a226330333534343734616432393963653630326639623338626439353839306430223b733a33323a226562326638636366636364343635336139336164306331666333356566386265223b7d733a343a2268617368223b733a36353a2265623266386363666363643436353361393361643063316663333565663862652d6330333534343734616432393963653630326639623338626439353839306430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226138313930333030643561316539333035306431646136666166336163346435223b733a33323a223562653533333563313634653735376461633362366132363035636466653734223b7d733a343a2268617368223b733a36353a2235626535333335633136346537353764616333623661323630356364666537342d6138313930333030643561316539333035306431646136666166336163346435223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223831313964303661386633663334626430326136646334636561393562346630223b733a33323a223562323764346634626230623766643233656465643333356638393437656266223b733a33323a223936396230653533333765643536623530316332323536343461343563336130223b733a33323a223366346263633433383866396239623964633263386231366266626330386562223b733a33323a223230356238386534396532643330323364323432393239316434363864666336223b733a33323a223865656362613137333066383433316134663237383838343330333031333064223b7d733a343a2268617368223b733a36353a2238656563626131373330663834333161346632373838383433303330313330642d3230356238386534396532643330323364323432393239316434363864666336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223065623936353466643636613333633533323866303137633333363736393130223b733a33323a226666323033343539396439666132323236323239336262333235613334616164223b733a33323a226632643231346466633162303332666236313833613539303265313333363066223b733a33323a223530383064613866316666343131376632396438363766366164346666616639223b733a33323a226436626534353031373735666138376635303331313234303534333638663035223b733a33323a223036353164336439356664333134316433636438616437326333623439633035223b733a33323a223734393230616431646466663839643533653035666137393966633230316534223b733a33323a223934346664656437336238396465373432363539356163643134613030366363223b733a33323a223431343265353138336466656636633462333964343236343132663231646431223b733a33323a226237396562333964363938316533666662333937643632333336343433613234223b733a33323a226132383661663261326536326663333635383632643964346530636232333566223b733a33323a226331353361363036633934613233633833393666393736303262366534383464223b7d733a343a2268617368223b733a36353a2263313533613630366339346132336338333936663937363032623665343834642d6132383661663261326536326663333635383632643964346530636232333566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223862663034303832636239336134393362343231666634356335323962653735223b733a33323a223431613239326365613138376664643863356430346133643936363934623162223b733a33323a223238653061323663313461363630656233333761343130366465653765356163223b733a33323a226261613465373632386137353139313735656161313463336464366164396536223b733a33323a223238623631363337643336323261636363333931323632336462323665346133223b733a33323a223266333039333663383038343065306436323866346635666664383664633966223b733a33323a226664386438656635633234333835653962646638666261326631646630396535223b733a33323a223262666266303338343437376631363537303230336333633938636339336166223b733a33323a223735363266633761336436356666646336393565353061386164393762353765223b733a33323a223139653734393430643262326464343033353262633262353231643765313365223b7d733a343a2268617368223b733a36353a2231396537343934306432623264643430333532626332623532316437653133652d3735363266633761336436356666646336393565353061386164393762353765223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1616497770);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"samuel.szoniecky@univ-paris8.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"MEDAS 1 20-21\"'),
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
  `id` int NOT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
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
  `id` int NOT NULL,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int NOT NULL,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-02-23 11:04:54', '2021-02-23 11:04:54', '$2y$10$G5IjCC9RhtwLM9NXY6suzu6.F3GIGHYjZVMphrFAu81tE.XrBDPKS', 'global_admin', 1),
(2, 'toto@gmail.com', 'Toto', '2021-02-23 11:13:52', '2021-02-23 11:14:53', '$2y$10$01rXSz3yBeU9fYX7YyHfpeh81hrfr7poSn9x8N2/z4BNuM0YFAO1q', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
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
  `id` int NOT NULL,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 1, NULL, 'literal', 'fr', 'Titi', NULL, 1),
(2, 1, 1, NULL, 'literal', 'en', 'Tweety', NULL, 1),
(3, 1, 4, NULL, 'literal', 'fr', 'Petit oiseau malin', NULL, 1),
(4, 1, 4, NULL, 'literal', 'en', 'Smart little bird', NULL, 1),
(5, 2, 1, NULL, 'literal', '', 'Titi timide', NULL, 1),
(6, 7, 1, NULL, 'literal', '', 'Dessins animés', NULL, 1),
(7, 8, 1, NULL, 'literal', '', 'Dessins animés', NULL, 1),
(8, 1, 2, NULL, 'uri', NULL, 'Bob Clampett', 'https://fr.wikipedia.org/wiki/Bob_Clampett', 1),
(9, 1, 2, NULL, 'uri', NULL, 'Friz Freleng', 'https://fr.wikipedia.org/wiki/Friz_Freleng', 1),
(10, 1, 20, NULL, 'literal', '', '1942', NULL, 1),
(11, 9, 1, NULL, 'literal', 'fr', 'Gros minet', NULL, 1),
(12, 9, 1, NULL, 'literal', 'en', 'Sylvester the Cat', NULL, 1),
(13, 9, 4, NULL, 'literal', 'fr', 'Chat un peu bête', NULL, 1),
(14, 1, 185, 9, 'resource', NULL, NULL, NULL, 1),
(15, 10, 1, NULL, 'literal', '', 'Détail titi', NULL, 1),
(16, 10, 194, 1, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', ''),
(6, 1, 'https://jardindesconnaissances.univ-paris8.fr/onto/jdc#', 'jdc', 'Jardin des connaissances', ''),
(7, 1, 'http://www.disit.org/km4city/schema', 'km4c', 'Doctor Office', '');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
