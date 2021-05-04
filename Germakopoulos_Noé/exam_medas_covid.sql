-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 04, 2021 at 12:42 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `omk_medas1`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
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
-- Table structure for table `asset`
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
-- Table structure for table `fulltext_search`
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
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'site_pages', 1, 1, 'Appartement', ''),
(5, 'items', 1, 1, 'Mouloud Benomin', '1445638472\nBenomin\nMouloud\n04/02/1944\n0\nMouloud Benomin'),
(6, 'items', 1, 1, 'Nicole Gérardo', '1567778778\nGérardo\nNicole\n01/02/1956\n0\nNicole Gérardo'),
(7, 'items', 1, 1, 'Kévin Duchoux', '1990363352\nDuchoux\nKévin\n03/03/1999\n0\nKévin Duchoux'),
(8, 'items', 1, 1, 'Laboratoire d\'analyses médicales Saint Titi', '12432\n20 rue Saint Titi\nLaboratoire d\'analyses médicales Saint Titi\n56783\nCartoonville\n56\n2232\nLaboratoire d\'analyses médicales Saint Titi'),
(9, 'items', 1, 1, 'Laboratoire Grominet', '12433\n12 Avenue du Général Leclerc\nLaboratoire Grominet\n93123\nComicville\n93\nLaboratoire Grominet'),
(10, 'items', 1, 1, 'RDV 1', '1567778778\n12432\n04/05/2021\n13:30\nPCR\nRDV 1'),
(11, 'items', 1, 1, 'RDV2', '1445638472\n12433\n04/05/2021\n13:30\nPCR\nRDV2'),
(12, 'items', 1, 1, 'RDV3', '1990363352\n12433\n04/05/2021\n13:30\nAntigenique\nRDV3'),
(13, 'items', 1, 1, 'Test Dispos - 04/05/2021 - Saint Titi', '12432\n04/05/2021\n150\n50\n50\n50\nTest Dispos - 04/05/2021 - Saint Titi'),
(14, 'items', 1, 1, 'Test Dispos - 04/05/2021 - Lab Grominet', '12433\n04/05/2021\n120\n10\nTest Dispos - 04/05/2021 - Lab Grominet'),
(17, 'items', 1, 1, 'Test Effectués - 04/05/2021 - Lab Saint Titi', '04/05/2021\n12432\n100\n40\n20\n40\nTest Effectués - 04/05/2021 - Lab Saint Titi'),
(18, 'items', 1, 1, 'Test Effectués au 04/05/2021 - Lab Grominet', '04/05/2021\n12433\n100\n100\n0\n0\nTest Effectués au 04/05/2021 - Lab Grominet');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`) VALUES
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
(17),
(18);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(17, 1),
(18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job`
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
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"2\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 07:22:44', NULL),
(2, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 07:23:36', NULL),
(3, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"},{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"},{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 07:26:57', NULL),
(4, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"2\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 07:29:50', NULL),
(5, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"2\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 08:24:17', NULL),
(6, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"2\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 08:25:04', NULL),
(7, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"fulltext_search\":\"\",\"owner_id\":\"\"}},\"action\":\"add\"}', NULL, '2021-05-03 08:26:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
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
-- Table structure for table `migration`
--

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

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
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
(204, 1, 8, 'nom', 'Nom', NULL),
(205, 1, 8, 'prenom', 'Prénom', NULL),
(206, 1, 8, 'adresse', 'Adresse', NULL),
(207, 1, 8, 'ville', 'Ville', NULL),
(208, 1, 8, 'codepostal', 'Code Postal', NULL),
(209, 1, 8, 'dpt', 'Département', NULL),
(210, 1, 8, 'capaccueil', 'Capacité d\'Accueil', NULL),
(211, 1, 8, 'numss', 'Numéro de Sécurité Sociale', NULL),
(212, 1, 8, 'datenaiss', 'Date de Naissance', NULL),
(213, 1, 8, 'nbcomorb', 'Nombre de comorbidités', NULL),
(214, 1, 8, 'idrdv', 'NUméro de Rendez-Vous', NULL),
(215, 1, 8, 'datejour', 'Date', NULL),
(216, 1, 8, 'heure', 'Heure', NULL),
(217, 1, 8, 'typetest', 'Type de test', NULL),
(218, 1, 8, 'nbtotal', 'Nombre de test total disponibles', NULL),
(219, 1, 8, 'nbPCR', 'Nombre de test PCR disponibles', NULL),
(220, 1, 8, 'nbAnti', 'Nombre de test antigéniques disponibles', NULL),
(221, 1, 8, 'nbSéro', 'Nombre de test Sérologiques disponibles', NULL),
(222, 1, 8, 'ID', 'Identifiant_Labo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource`
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
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(5, 1, 123, 8, NULL, 'Mouloud Benomin', 1, '2021-05-04 11:58:26', '2021-05-04 11:59:13', 'Omeka\\Entity\\Item'),
(6, 1, 123, 8, NULL, 'Nicole Gérardo', 1, '2021-05-04 12:00:03', '2021-05-04 12:00:03', 'Omeka\\Entity\\Item'),
(7, 1, 123, 8, NULL, 'Kévin Duchoux', 1, '2021-05-04 12:00:35', '2021-05-04 12:00:35', 'Omeka\\Entity\\Item'),
(8, 1, 122, 7, NULL, 'Laboratoire d\'analyses médicales Saint Titi', 1, '2021-05-04 12:01:30', '2021-05-04 12:01:30', 'Omeka\\Entity\\Item'),
(9, 1, 122, 7, NULL, 'Laboratoire Grominet', 1, '2021-05-04 12:02:07', '2021-05-04 12:02:07', 'Omeka\\Entity\\Item'),
(10, 1, 124, 10, NULL, 'RDV 1', 1, '2021-05-04 12:03:10', '2021-05-04 12:03:10', 'Omeka\\Entity\\Item'),
(11, 1, 124, 10, NULL, 'RDV2', 1, '2021-05-04 12:03:48', '2021-05-04 12:03:48', 'Omeka\\Entity\\Item'),
(12, 1, 124, 10, NULL, 'RDV3', 1, '2021-05-04 12:04:37', '2021-05-04 12:40:46', 'Omeka\\Entity\\Item'),
(13, 1, 125, 9, NULL, 'Test Dispos - 04/05/2021 - Saint Titi', 1, '2021-05-04 12:05:47', '2021-05-04 12:05:47', 'Omeka\\Entity\\Item'),
(14, 1, 125, 9, NULL, 'Test Dispos - 04/05/2021 - Lab Grominet', 1, '2021-05-04 12:07:02', '2021-05-04 12:07:02', 'Omeka\\Entity\\Item'),
(17, 1, 126, 11, NULL, 'Test Effectués - 04/05/2021 - Lab Saint Titi', 1, '2021-05-04 12:12:16', '2021-05-04 12:13:26', 'Omeka\\Entity\\Item'),
(18, 1, 126, 11, NULL, 'Test Effectués au 04/05/2021 - Lab Grominet', 1, '2021-05-04 12:13:13', '2021-05-04 12:13:13', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
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
(106, 1, 5, 'Appartement', 'Appartement', NULL),
(107, 1, 5, 'Personne', 'Personne', NULL),
(108, 1, 5, 'Immeuble', 'Immeuble', NULL),
(109, 1, 5, 'Quartier', 'Quartier', NULL),
(110, 1, 5, 'Commune', 'Commune', NULL),
(111, 1, 5, 'Personne_has_Appartement', 'theatre_has_proprietaire', NULL),
(122, 1, 8, 'Laboratoire', 'Laboratoire', NULL),
(123, 1, 8, 'Personne', 'Personne', NULL),
(124, 1, 8, 'RendezVous', 'Rendez-vous', NULL),
(125, 1, 8, 'NombreTestDispoJournaliers', 'Nombre de Test Dispo Journaliers', NULL),
(126, 1, 8, 'TestEffectuesJournaliers', 'Test Effectués Journaliers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource_template`
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
-- Dumping data for table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(7, 1, 122, NULL, NULL, 'Laboratoiore'),
(8, 1, 123, NULL, NULL, 'Personne'),
(9, 1, NULL, NULL, NULL, 'Nombre de test dispos journaliers'),
(10, 1, NULL, NULL, NULL, 'Rendez-Vous'),
(11, 1, NULL, NULL, NULL, 'Test Effectues Journlaiers');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template_property`
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
-- Dumping data for table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(31, 7, 222, NULL, NULL, 1, NULL, 0, 0),
(32, 7, 206, NULL, NULL, 2, NULL, 0, 0),
(33, 7, 204, NULL, NULL, 3, NULL, 0, 0),
(34, 7, 208, NULL, NULL, 4, NULL, 0, 0),
(35, 7, 207, NULL, NULL, 5, NULL, 0, 0),
(36, 7, 209, NULL, NULL, 6, NULL, 0, 0),
(37, 7, 210, NULL, NULL, 7, NULL, 0, 0),
(38, 8, 211, NULL, NULL, 1, NULL, 0, 0),
(39, 8, 204, NULL, NULL, 2, NULL, 0, 0),
(40, 8, 205, NULL, NULL, 3, NULL, 0, 0),
(41, 8, 212, NULL, NULL, 4, NULL, 0, 0),
(42, 8, 213, NULL, NULL, 5, NULL, 0, 0),
(43, 9, 222, NULL, NULL, 1, NULL, 0, 0),
(44, 9, 215, NULL, NULL, 2, NULL, 0, 0),
(45, 9, 218, NULL, NULL, 3, NULL, 0, 0),
(46, 9, 220, NULL, NULL, 4, NULL, 0, 0),
(47, 9, 221, NULL, NULL, 5, NULL, 0, 0),
(48, 9, 219, NULL, NULL, 6, NULL, 0, 0),
(49, 10, 211, NULL, NULL, 1, NULL, 0, 0),
(50, 10, 222, NULL, NULL, 2, NULL, 0, 0),
(51, 10, 215, NULL, NULL, 3, NULL, 0, 0),
(52, 10, 216, NULL, NULL, 4, NULL, 0, 0),
(53, 10, 217, NULL, NULL, 5, NULL, 0, 0),
(54, 11, 222, NULL, NULL, 2, NULL, 0, 0),
(55, 11, 218, 'Nombre de test total effectues', NULL, 3, NULL, 1, 0),
(56, 11, 219, 'Nombre de test PCR effectués', NULL, 4, NULL, 1, 0),
(57, 11, 221, 'Nombre de test Sérologiques effectués', NULL, 5, NULL, 0, 0),
(58, 11, 220, 'Nombre de test Antigéniques effectués', NULL, 6, NULL, 0, 0),
(59, 11, 215, NULL, NULL, 1, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('92leki1mht90hbb20vnuoji2lq', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303036313237352e3837353630353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f71616e6a667673736e70643166346c6773697276366e72396b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033303037353b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303036343836363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303036343837333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303036343837363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303033333833383b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223030343666346232396630383338623938393664333161663831366530303139223b733a33323a223730626630353566336566323361383038383736313361626433366465373733223b7d733a343a2268617368223b733a36353a2237306266303535663365663233613830383837363133616264333664653737332d3030343666346232396630383338623938393664333161663831366530303139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226236316635663064303262346665366537656631393361366464333039613936223b733a33323a223263326166633432656330303062663334356139356435376433356432353132223b7d733a343a2268617368223b733a36353a2232633261666334326563303030626633343561393564353764333564323531322d6236316635663064303262346665366537656631393361366464333039613936223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223137613130366430363938386339333132623063376530656132633031343637223b733a33323a223431306131343336333930356663616565376363373936663230393731623436223b733a33323a226333643933643163353634323330343963653234343766373338643864396461223b733a33323a226338386535373035313566356530623962383334383135393131623537623861223b733a33323a226136333134613833333234396363336534313439393339613634303234326635223b733a33323a226365653663313037613331363831656666663439376538356234643637343332223b733a33323a226566316532396264393231306333303137356134363733653665346366343065223b733a33323a223162663834323131646562313736303462633137613435643030383266313533223b7d733a343a2268617368223b733a36353a2231626638343231316465623137363034626331376134356430303832663135332d6566316532396264393231306333303137356134363733653665346366343065223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223438633734383236663865376265376230386164353434333161623833636665223b733a33323a226165643433336331623239616635313064663066623662616363393964633065223b7d733a343a2268617368223b733a36353a2261656434333363316232396166353130646630666236626163633939646330652d3438633734383236663865376265376230386164353434333161623833636665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223733383931613737373637633131663734656332336434373739376634373164223b733a33323a223339343537336638373161333334363535663064383732386438356264326531223b7d733a343a2268617368223b733a36353a2233393435373366383731613333343635356630643837323864383562643265312d3733383931613737373637633131663734656332336434373739376634373164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620061276),
('fpgfke08amvu3tlkj8stusfk48', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393837373736392e3139373830313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22667067666b653038616d767533746c6b6a3873747573666b3438223b7d7d, 1619877769),
('h53d4huhu3u1kadunnhgngsqq2', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393334383132352e3137313731393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223876696f31623834673675757071326d6e616376366c61353930223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393335303333393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631393335313732353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393335313732353b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223661643562373263373130613164313164393562343735636634643030643964223b733a33323a223437323261373835633339363336376133663961353637323165303635323930223b7d733a343a2268617368223b733a36353a2234373232613738356333393633363761336639613536373231653036353239302d3661643562373263373130613164313164393562343735636634643030643964223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313033313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223738366436373135316437646564323434383066326334323934356433653566223b733a33323a226433343530656263353033666430366431363765306530616462303233346631223b733a33323a223736643561336239316532366237656233386439336431613934346531616436223b733a33323a223261656338643333616538613033323732616436633265396533383961343565223b733a33323a226565333665653839656536326164373064633336313234386139313632613536223b733a33323a223738313765633833373937373337373931386531333233353861666262326337223b733a33323a223537366364326236613266363437623232356363653131633766343038623635223b733a33323a226135663639366632386661363538373636373838303837333265386339613666223b733a33323a223230363235326139633866663938633735346236636461323739353735663430223b733a33323a223866383664356333336533366530386462336531613035626263646330613231223b733a33323a223433393066666232393933336537303237613139366534646131653763353762223b733a33323a226339313064386665393264613132353633643637653338323137366232613761223b733a33323a223836656137666135343331363035363531616366346231353463653333353263223b733a33323a226166663030393039616361336136386565653361643430656162343838646463223b733a33323a223533643561333439333362643164363261653065616632633964653765636633223b733a33323a226438646264616465343263323338336637343864643839366430383561643762223b733a33323a226664376133373862636436323936666565636365343738323532356566376263223b733a33323a223165633561666534393864613434663764643030656239363962616166383437223b7d733a343a2268617368223b733a36353a2231656335616665343938646134346637646430306562393639626161663834372d6664376133373862636436323936666565636365343738323532356566376263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223965353565626633303266333834623536396136316338306233303262373134223b733a33323a223736343137393561316134626239313839306434323863666637663064363336223b733a33323a223065613433376333633733623663663061626363626338313234356237633139223b733a33323a226337303231343361303539353230333630396537613833323764613837376263223b733a33323a223530373834356532356338656336356334653338373231343630353633653736223b733a33323a223235326462373736613962383534643861623737386537393331336234346239223b733a33323a226338303938343565313462643562373037393864353165616431396530326633223b733a33323a226536353136663665313935633361386562663838343864616164316430383739223b733a33323a223539343833663639346437646137353231643963353264363238396439636530223b733a33323a226663666561353064333032656165343066316537326137633961343366646361223b733a33323a226235623061626339313030613163666434646239343434303062313562643036223b733a33323a226162613064373534376438326266373638373439366164363530653364666431223b733a33323a223466356239363961646437393438366536356536383966626634303031626365223b733a33323a223261393234636130303339663366633861643766323734363337636433326538223b733a33323a226563353235656430323437653639383632316537383661663766303039636165223b733a33323a223562326536613837646566346536616438336464376164386636303630633035223b733a33323a226365373564373531383731313961363961343264383966373137613863613137223b733a33323a223537643763633338633866666236363738396435346533393238316239326637223b733a33323a226134353164306531633662666333373238326234653265356262386665383133223b733a33323a226161613437343436306265306261353436633862666562663366383132356131223b733a33323a226633653337306435363639653735343564366635303365396162636363336561223b733a33323a223433316262626134343634653734313466303064323638653431643439376365223b733a33323a226165396364383331363236616235663731333631623935353431333031353932223b733a33323a226265393836653066343963356638383661353535663963623237363133613963223b733a33323a223138306434356333666433636437663061616161393565613535393138393461223b733a33323a223361303238343638623261613161643937383364613130373534306161303764223b733a33323a223365343536623032396536396266323434343135646165656237303432383465223b733a33323a226434356364323661353433343234316562303539383166363338366135663931223b733a33323a226566323639326139343166393964353432313134373064336138376238323663223b733a33323a226630326632393764663764636433323361626537656138383363376333376437223b7d733a343a2268617368223b733a36353a2266303266323937646637646364333233616265376561383833633763333764372d6566323639326139343166393964353432313134373064336138376238323663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619348125),
('mq554j5a079n3j3nj1kqmu2dlf', 0x5f5f4c616d696e61737c613a393a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313632303133323034372e3033363732373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d61686d3165367532396c6e69726b7675326d736f333333666b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303132393436383b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303132393437313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133323231313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133353634303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133333834363b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313632303133323335313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313632303133353634303b7d7d72656469726563745f75726c7c733a36353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e2f736974652f732f7072656d6965722d736974652f7265736f7572636573223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226363323034333465316237356466373965373630303534366663323864393735223b733a33323a226665303136633266316439626534626639313865616162306335386131323635223b7d733a343a2268617368223b733a36353a2266653031366332663164396265346266393138656161623063353861313236352d6363323034333465316237356466373965373630303534366663323864393735223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226265303238643162343465373339313439313335373964623231656163346638223b733a33323a223231373063663265616332396233613836363939383734376432373366303039223b7d733a343a2268617368223b733a36353a2232313730636632656163323962336138363639393837343764323733663030392d6265303238643162343465373339313439313335373964623231656163346638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223334333432653465653239363364653463376165616265616531626237373936223b733a33323a223331633234353061323732393366653438353330636662666664666462366266223b733a33323a223333303835353966613035373438393736353831303939666433383730646464223b733a33323a223934646462633335636665363333343263623633363131376432646461323935223b733a33323a223839366663383831383935663435386562323566633034636161656434396662223b733a33323a226534333335636639326536383339373937383261373435396337633038653931223b733a33323a226265646566656438326436353338663566666132636236366163663039303233223b733a33323a226136656535303231373961393339333531306465323362336134633338366235223b733a33323a223665666236303462363362323132633438616662616633386561656165303730223b733a33323a223439323030343537643930666562313832373966393665386234643934633930223b733a33323a223632303538363631633534633332326365636431323131393363376330616365223b733a33323a223465333764383536333863623061333834333666326230303931306237366266223b733a33323a226436343039633738326138663262326262356631313031323639636133626234223b733a33323a226533333661386131653736633436613162396137643861663033343237653565223b733a33323a223062323431303533333130393965373665336332316464393330343239353139223b733a33323a226361393330313133386565376234336663353035663564646131383836346561223b733a33323a226235653866373836333638616266643763383966633963336430363038363563223b733a33323a226165353833613965316266646361323535616632383633633430336337316338223b733a33323a226234623936626538363136613734653834346666346465646665653330353231223b733a33323a223462636238653437366363346630373232656237666435623632376566303931223b733a33323a223133646234333461393363623037643164336464663438383866313934323932223b733a33323a223164303538343530626436336562363234373231393135386166656163386339223b733a33323a223731343563313866666664303735373532653766626561653731366664626539223b733a33323a226565363533393137346531386362373634363838363938383532646637336432223b733a33323a226361336632623232346563366264383134383133326263356136346436616265223b733a33323a226633313830646363343464393366373830383431623632346666646238326666223b733a33323a226234343730336163363435653063396135373137663836393063333662303833223b733a33323a223230343564656631656164306465613130343632333135616538623464643939223b733a33323a223562626364383164306231623130363261366236366530393861643564636266223b733a33323a223734333138393962666132616262336335616266396436633366333631626436223b7d733a343a2268617368223b733a36353a2237343331383939626661326162623363356162663964366333663336316264362d3562626364383164306231623130363261366236366530393861643564636266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a353939323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37313a7b733a33323a226339313939323466326562363037373766383465623534613861616366623234223b733a33323a223630393165303564316437626365663365353665626634333066313832333132223b733a33323a223433653939306234393166363633633566373532373935613132663036313665223b733a33323a223930396464613432313035636462383165376263633336363331613631333438223b733a33323a226664303338613963646531666535636466313037373232383834623531633162223b733a33323a226135363838373538646266383462386436306432353765643334323437653631223b733a33323a223234376365653531633464343439336536653963313730393361636662643932223b733a33323a223030306431313033353665316566386430646533623638653331316566346566223b733a33323a223233326138383232656137633035303334373231323863643366363930393266223b733a33323a223836346634623865646537613630373334643334376331393937613038353837223b733a33323a226665303465656130336437303662633037343030653738323336363536343133223b733a33323a223064376634393966303463323437336433366131326130643636623462613035223b733a33323a223764313362376335616431366564306631653665366465316633633837613865223b733a33323a223539363734363265303433633937363332373634363231663631346265316464223b733a33323a226539626266393039316538333330623064353036373630306338343831393936223b733a33323a223561303036343864303466313731663536633061623639313239346138373232223b733a33323a223463623638343661306531633164643337633761376330633738393862316664223b733a33323a223138663731663665333063663833373230666330613831653764326132373666223b733a33323a223062313561373033623530373661356138356239346464313566346631623866223b733a33323a223636346364623635386332333034666362636661616132613530313835313733223b733a33323a226663373239343931363230666239326565373463626531386663376463633061223b733a33323a226431343630646134393466633730623436363031346365666138326263313738223b733a33323a226632633566356362393765353639613462396164343336306132376361636639223b733a33323a223133313835613864633133346339353939303561363262383033346666363337223b733a33323a226366633963386562366533393337343135643664663636376537303135376539223b733a33323a226163646339366261656435346634396632653965633831663435653630316237223b733a33323a226664313137663930313561383262653366336431326666336639613432323963223b733a33323a226239653232633263646162366166356338386438626161313061323361353534223b733a33323a223931383838326638323361376631313333613866333366366237643233326134223b733a33323a223339373833663064356466363361336264376134353837393638633464373234223b733a33323a223332343931353662303938366361393436376338336361343531373632636634223b733a33323a226635323563626333313230313861306131383562613266326639326231376662223b733a33323a226536303864353837666135346136643839626532393165396533333430343133223b733a33323a226262363338396136646265306632373139323231646366306361383733306263223b733a33323a223264643533306534633937356462303566346661633563646434646338633439223b733a33323a226330376662363964313262313235613537643132666437326539373938353364223b733a33323a223762653037643932616535333933313466373332316633346531383639663661223b733a33323a226162333963646366343765643232383766643932333539336235633637313732223b733a33323a223963303766616364363437353630343134386239313538386466666162336539223b733a33323a226536326236353161636439653635313234616266306663386531663863383639223b733a33323a223730333934366333313661383864653665363532623963633934333063306637223b733a33323a223266363766623766616562346466633335313637396361306461303166353864223b733a33323a226531373765353132663633373231653162633132363562373735633063653730223b733a33323a223863643031656335653932336262333636373036636563326631366565303166223b733a33323a223661313234633435346365663662653939613939633038313732383433306232223b733a33323a226566613835333565313365313933313066646165616131386364376438343035223b733a33323a223932373536656335323832336538393031326365353435366331316438623865223b733a33323a223663363833613931333662393430346266373839633633373732356164356432223b733a33323a226332623931643937353963383537646331313731666338306330643361366638223b733a33323a223763393433383730363835626637613165646562626232353864653462306566223b733a33323a226163393639623835393964613930393538653561346664663532623737393965223b733a33323a226333306131373939366439323235323239306161623537373832333665626165223b733a33323a226166383037353831333638333636656564623564353732613235663665303432223b733a33323a223766373766383630623332316437393237616639626630396464396337306664223b733a33323a226364626239616136313064336239313932383437356665636434356138663862223b733a33323a223466653161366431643135613062613031323132396531396164623062333063223b733a33323a223061633333333962306233316364393164346130623665613138303563613033223b733a33323a223164313462633733383262373030656435363732333930386266363234613131223b733a33323a223761396234313235376532653030643761303831316663323765393364643038223b733a33323a223138346362313661343130353262656161623664626466633163343262356164223b733a33323a226464343666653966336636333965393338656332643433306365396535303461223b733a33323a223165396430363231613331613164353535356365306461376331373534343963223b733a33323a223533643963393739363539643933316139363336356662343339366261303162223b733a33323a223832306362306564663331316530353531623065373037373734623639396630223b733a33323a223862303032313630383164313535653838633334353934666233616365333638223b733a33323a226335393061653861343438326638336565353636663263356537346336356630223b733a33323a226266306364323636623934653433646234313431393462383435383463393630223b733a33323a223866393434646630663239353463633462636334633932663262626464633634223b733a33323a226636363063303639633464363364636430303033366539323334333361326664223b733a33323a223139343734306631626466303930393434393366373862643235656361373838223b733a33323a223766386231353563383261663337326263386430373139616232393138663837223b733a33323a223133653033393464623737626236616130363634313163333132653863373261223b733a33323a226333323765356534613131613162316236366431306633626237326265343461223b733a33323a223566616265343964623636633366333530336138363032353830653937663634223b733a33323a223230323266336537393438333435613433323435376431336637623362663161223b733a33323a223661326661306464393030646361616530633434393030633731633664623635223b733a33323a226266666363643565383962343465323835383832323038303861326364613663223b733a33323a226130363631396361653063323937383735306631623139623161313732316636223b733a33323a223661386666396239636134613135303135653362343063323361346462646237223b733a33323a226461366335633535393631363831363235656437613331383263303430303133223b733a33323a223236313463376165336365313435623764646636366563656434363861666332223b733a33323a223933336134303261376536626563386238323564313933306230396662613333223b733a33323a226435663736626236643335363034323438393465643530333238336334396338223b733a33323a226464313133363466306464333138613138323735303364303937616635646161223b733a33323a226664663838356635333165626565313761376138313063636161373937623936223b733a33323a223639656339663438646639303130356231343730383830343730353334663937223b733a33323a223636383366303461383361386631633931646663396266633530313231386463223b733a33323a226462346331303831303435306566383838333639663963326430373762336131223b733a33323a223761633265343166373730656438656232343665316435653461393934333437223b733a33323a223837623066653633393461613637356431326364363938626334313363613534223b733a33323a223062393939303738396464613563663637373634303335623434383865623238223b733a33323a223766383830386231343630623339373334316338663237313264656130313064223b733a33323a226537626232386362333065306631653338333465663533636238393465333837223b733a33323a223837383962646362326232336237613539303933643766643366333234336562223b733a33323a223263373565373130643836333431373939396535373930323835383739633235223b733a33323a226530393938326331366437353336323837613436393431376136343463643038223b733a33323a226532383437396337383962366331633661313236336364663039616233373661223b733a33323a223063663635333339366363376461623836346231613163323666633838663462223b733a33323a223932336333306563653436343135363166373733363964333531373931373236223b733a33323a226435666435383664613863366532666238303361643338633938303331346435223b733a33323a226531623035363231366634313132346566633264663833343232613335353235223b733a33323a226631306331383665396337323034366564636335333234663430623233373064223b733a33323a226139613064306665613466343466383731373135636230316566303439343338223b733a33323a226462306130303265366630643831306338366634636337343631376239383839223b733a33323a223635306334633065613538346161383538643762343633353439386130363733223b733a33323a223061363562333932363732396366353962613938383439303833666461626130223b733a33323a223930623963323838306639636635656266646331613933346262353766623134223b733a33323a223330333532633231316363343161646136653661633232363563623564376134223b733a33323a223463626165623364656237313266356235633336313266313366336432633333223b733a33323a226434303335616166303365616330383733636536376335613238626465646133223b733a33323a226339633662383038613862393838643363633561626364666137346336356335223b733a33323a223366333037663164396266613930313439633564313633663563373333356333223b733a33323a223739653061363863623237663762333330636564323032656431333566626536223b733a33323a223839666266333061616262393930663463623333633063396234626164373638223b733a33323a226661306264643732613766303961643430653465386334356432323231663231223b733a33323a223139613766333130376131626130623333633838396330306164666236326335223b733a33323a223333636130396232656465313663303830363635353535386534386236373661223b733a33323a226130333863643131353739613262646430643138333732633539373565313336223b733a33323a223631336639343963663966386263393262613039306335313264613030636562223b733a33323a223563303035316565623037666335336665393831366161633830303861333964223b733a33323a226461623338326335376563383164316335356666353566633131306232613361223b733a33323a226166373732353862393931633163646337643935306131636330323934663564223b733a33323a223636393431383461326439366535616361313037383938623236333933383938223b733a33323a223939393865386431353134376438366533623933396236386363333136326436223b733a33323a223761376634373065323464356565366565353231316463623862376662623036223b733a33323a226530383764613932313539643035646130366665656335653766306164333931223b733a33323a226435643538343866303162343337333330346263393337623839366130333964223b733a33323a226361303466323237313038313938393231666136383237326330653764386136223b733a33323a223833323234363939663339366231363464313033383239333736353631386233223b733a33323a223161303536333936383562303634376566366436636634386636636631653634223b733a33323a223636313239303430343539373936623433303764353932356265393532616339223b733a33323a223334356439323038306531313432313763303862663131343630643165316330223b733a33323a223333643334643738346439303763653438376334326638653837383930356262223b733a33323a223732323432653230653438396433663864656665353433316165373762376536223b733a33323a223332303931356435306531663238323132353635653566343237343063346163223b733a33323a223164643836313837613061323764613235666332356637323833356537326466223b733a33323a223263333838373334316334303464383864646638303234646633393532616366223b733a33323a223730626463613563376235353331313237326337353234356536646234643837223b733a33323a223031623036323832613233363235313833303861396630663138626237376331223b733a33323a223037626265663031353138316363626130326162356364623938306661383162223b733a33323a223332376630623735333936316462623163326638383533363663383136326332223b733a33323a223732333437633463363766373439353531653565356264353666646264373235223b7d733a343a2268617368223b733a36353a2237323334376334633637663734393535316535653562643536666462643732352d3332376630623735333936316462623163326638383533363663383136326332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313131323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226165303630663665393265333861393331356665333639316435646332386663223b733a33323a223237393435623465303539616231616331326235376538393138383930306534223b733a33323a223136643635326664643064663061623863343462346662383161666233653966223b733a33323a223138396337303264336130373663303465353338653833373062376638666466223b733a33323a223438376462633034363233316530633634346562643835316139383166323334223b733a33323a223337373866316230653665623362613838613165366436666461663336323661223b733a33323a223537656538663736623038346436316161343435643737383031356631626365223b733a33323a226362376164646433663130666463613430643833356462646662303237643835223b733a33323a223830306331616338356337636238343766636331346135356632626237353135223b733a33323a226465386132386138333832323765636461373438333562336463643936376236223b733a33323a223635383864393939353839383039376564323130336332653333346132366132223b733a33323a226161333535393835643239373536663631323233656563356264303861323766223b733a33323a223530363061353231353932306262373161656566366133343936316365343765223b733a33323a223566316139613661343835393662366430626138353765373136356535383665223b733a33323a226535333066663031663936333531316132303262373666333835356635313837223b733a33323a223135366334393132333237663138613237343465393966346364396239656538223b733a33323a226536633937346664643236653534646638653266336333363364396336323235223b733a33323a226166396435393162366531366134656563663433353336623539336133353637223b733a33323a223166373331613931303232376339643261363666326631666532393938643461223b733a33323a223764333661623262636532396638333562303735653964636331376339633138223b7d733a343a2268617368223b733a36353a2237643336616232626365323966383335623037356539646363313763396331382d3166373331613931303232376339643261363666326631666532393938643461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226531353764386234663465386334653433663335386365393238383661316439223b733a33323a223634393136343631343139633764383336633337656538653636343466373066223b733a33323a223861353065303162323730373164303931346366333738633633353164396365223b733a33323a223532613232306162353735386163313634666462643661656335376235373866223b7d733a343a2268617368223b733a36353a2235326132323061623537353861633136346664626436616563353762353738662d3861353065303162323730373164303931346366333738633633353164396365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313833323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31393a7b733a33323a223838323161333463333138656361333761316533313134313931323933636138223b733a33323a223039316565343366396536383332393633666531636662383239666538633963223b733a33323a226434653539633736313637343262303262363462643137386231343735636464223b733a33323a226163313431663566383133343439336465306663343031353266356331653335223b733a33323a223430343237313563343134353665653530393337373364663661356630346638223b733a33323a226631316331316364353538636331643832383566316137386163323637643931223b733a33323a226465373961356632656434653837633937633335333031303230353564326136223b733a33323a223763383734623466626337386333313039343130396435336234313138383162223b733a33323a223761656561306266316162393133653362313833336330616265396330653864223b733a33323a226636393932663736666335623936326562376135636261613066313233353534223b733a33323a226636303238393761396165636162643062323362393266363638636636636262223b733a33323a223838396534396363636463613137363137643636353034633033396338636237223b733a33323a223365346138343863323637333339353333303531373338353732323638303231223b733a33323a223137316561636132626632633130396539653533636334353131666433356233223b733a33323a223065616366656432343937646335333862303261323933623464626334643166223b733a33323a226566326531616137396533326634636632396630666362643863316437323832223b733a33323a223064373566646131656236323332353762386335343165623637366661643366223b733a33323a226338346139626363393632336164383830396134383963336465356239313834223b733a33323a223161653737386630663564663162633639646136633861313032623565383230223b733a33323a223163623831373435663335316332643261373530393264616438313737626238223b733a33323a223462346437376266376438623832653961343733663133366163626633646437223b733a33323a223138643631323833656566323839343865623334316236656663316438393930223b733a33323a226637333532633435356235616562303032666465316130343434313331313863223b733a33323a226466376362323765323538316432303734396535353631333964613634633338223b733a33323a223030333562383136383931653539346565313563653633653634663166636438223b733a33323a223034376539323166356137653837336562613964366638626137366232376565223b733a33323a223937336563336362323462626561646562323265313634623538313832616566223b733a33323a223332626437333334386535323832386661336330323138303737343666653336223b733a33323a223566663633323663373461376137656639303862353161366330663730316662223b733a33323a226630313334356530393666636336303463333634616538626137653266633631223b733a33323a223063663865626334313934383838313137373933396432336233643437333931223b733a33323a226338353437306533326561363563636538393863366166623565323664646661223b733a33323a226133343030383430663636306563646166663131653032323262363363313635223b733a33323a223564643037386161663138393137636264633135313363633464616632666666223b733a33323a226233653632613831393166363530346663643639396637663063353465336165223b733a33323a226361626165343135373863306465613537316162373062613764303834323363223b733a33323a226335656139313435323537633339616462386565343561636537646334333762223b733a33323a223066663435333066323231396539646162326138623035356336623134373761223b7d733a343a2268617368223b733a36353a2230666634353330663232313965396461623261386230353563366231343737612d6335656139313435323537633339616462386565343561636537646334333762223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1620132047);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('rht4mun5jc1e8tmlpffj44avqr', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631393837373737362e3939343638393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396865656e383875306f616e6d6e6c323576303134716b677168223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393838303339333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631393838313333363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393838313333363b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393838313236323b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393838313038373b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631393838313132383b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223532333632346135366435343339643139643236323165323535306434386561223b733a33323a226334343132336631396638363032333661323534346435633933663665643131223b733a33323a223238393666326237613233666330643861373031653331376365353232323565223b733a33323a226566343965366465653539333033306339333831333532643362656135336636223b733a33323a223930346235336161643966616137643837623632373262646439333961326639223b733a33323a223839393463643731613834383339366161323563653265333133613437326533223b7d733a343a2268617368223b733a36353a2238393934636437316138343833393661613235636532653331336134373265332d3930346235336161643966616137643837623632373262646439333961326639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323633323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32393a7b733a33323a223431383066393436643337343861386131323362356533613664633665353562223b733a33323a223334373235393361373137633664616539376136653539306266326134313135223b733a33323a223238303863313137663732623563663066393139353761303936643434303037223b733a33323a226134646636663862343961336663323438396333633735386137363335636662223b733a33323a226166323333383362383761633234353266393265383335623934336434633666223b733a33323a223434633861306665633262613639343035653938346235333930356366316564223b733a33323a226265356136623836626132656566643438396236636565336536616635323139223b733a33323a226565653366376133323961626434376236373439396536616465336162633831223b733a33323a223565653631383866366165353266323066343031363732396431343438346262223b733a33323a223662316462616237343965383138386366616565666137616162346365353062223b733a33323a226132646439646566333938616262613762626437666461356262633064366264223b733a33323a226364336335393262346132363034373236313934383433663138613639346635223b733a33323a226337386239396236623035313263363535336333393364303764636561396639223b733a33323a223334303439303839623063613535303337343665303564373362356437376339223b733a33323a223137623836633635626630613363363534366333363064653934376632336164223b733a33323a223731326234653065326233366133383562623131316363383232356363633861223b733a33323a226661353365326236343763303830623834643837623964373864643930383830223b733a33323a223337336466633431386333333235616138373437313466313133653564346564223b733a33323a226162633362343663663233353763636365336534343539343061323436623037223b733a33323a223265663261353863353534636637363336376434353435376265636463656662223b733a33323a226262653931333034306236396433666631666165666239626462396439663635223b733a33323a223163623863653336636565306130383630393339313264376261653134373266223b733a33323a223564366465646237323137323465326536386331343732643863336664313135223b733a33323a223735633262303361336166316337303636623435303339663962396531343035223b733a33323a226161333538323137333331643430356139323937653335656362623532663436223b733a33323a223462353835656137373934313039373761383034343263633236653761663931223b733a33323a223838353765346231303064643434653130373330326565323739613630323738223b733a33323a223637353032326532653133333935623630633539383839626565613363323361223b733a33323a223165363962626434316532326133626165303366303637653462333033353632223b733a33323a226437366538613462336436373237363035363933333565393933333732666530223b733a33323a226663626130373136626632393834373862323334313161623063346634613861223b733a33323a223035353361643465623434356565353732626466333565363434323866333462223b733a33323a226138663134633133333633653363353035386331353034656661323935383463223b733a33323a223335623933653533376537326331616137663538393538393762663364306463223b733a33323a223239633836303933323539623435326164623839356361343432666432663862223b733a33323a226233633933343432336339346237656666643964313763383063353538393430223b733a33323a226561313564353536353130643530383763393631373763613065303666383362223b733a33323a226231326666346438343366656438366266323438643333636266383935373563223b733a33323a226335376530343732663930363465646232623665646436323030663236643932223b733a33323a223238386261303736633262653037386435396634343132336265326462366365223b733a33323a223332623936386662363465316335306339643837323038626162613339323761223b733a33323a223435643365643634643135383636343964623763363237313432663838323662223b733a33323a226633346262656533333539633935306236623336653463396464623739616163223b733a33323a223131633936653030363632643232393836626262623766323565313239616239223b733a33323a226532313839386438396334643637343465613265343430336232303330666561223b733a33323a226139613238343136376163643138343033626136396536363065313764386466223b733a33323a223831656263366333323864366661303037343230303265393032306535313530223b733a33323a226138376331653534356439393163393565636161613532333434663138396332223b733a33323a223366346433653066306533626666383538643966363264326566663862323939223b733a33323a226262343138336662613463313461376539346161623432303432633361316361223b733a33323a226538376338363031653739306336633938333562336137333866383731343465223b733a33323a226336646137306233333235323733303534316330326431323235613165333631223b733a33323a226163343465383934396166646634323332653163396464666231303566303736223b733a33323a226661643763643165343561613664333063313533373837646435346539646437223b733a33323a226131656161653165313637316662316134306232643636303163666464623731223b733a33323a223363313864353434323632633135643836666665316532313937653833646133223b733a33323a223933663737333662333536643166653366356439353537613062313036653030223b733a33323a223831623061393561363561376565336339386439623563616636336335616630223b7d733a343a2268617368223b733a36353a2238316230613935613635613765653363393864396235636166363363356166302d3933663737333662333536643166653366356439353537613062313036653030223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323731323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33303a7b733a33323a226432363838613436643832306431303736333166393262366465623164653736223b733a33323a223838616630626536353032306336656465323566396235313531643939643664223b733a33323a226333383637383462613135613965623334633262633064346166306431663566223b733a33323a223132633139653332393633383264323363663537643434636238383033363264223b733a33323a223965363433373334326166653739366364633236666131386366666535336637223b733a33323a223834623834643432383464386633373437373332313731653965356336383633223b733a33323a226262323639376166366432663938353134343038333035643836613538303235223b733a33323a223562336436356239376564333439623962306334323566363033366536653039223b733a33323a226332313138666565623761306563343831353661313365646436646464636264223b733a33323a226139303462306463613461393462653534306131393636626637323961613931223b733a33323a223764333764336638386231366533323536393233336663666535646362393536223b733a33323a223438643136326632336239333632663539323165386561333733633131316230223b733a33323a226264323234356138313638316266323336633033636533663431353561376333223b733a33323a226337363030343630653461373737336630303331303434316166343365386530223b733a33323a223866333831343962306261366335393438313436303836323531623434613638223b733a33323a223434666661393937313562653334613161623036303836653637343561306638223b733a33323a223063323331383863626639653237343530346164313639386336336236303062223b733a33323a223766613232656264643234663162623334383331373736343239373631643766223b733a33323a226436343264323561383466646331316332653633616161613834656562363131223b733a33323a226465653339626635623530363266313430393136383464396236623665333437223b733a33323a223531666165383138386166633039326637376637383062663235333931303963223b733a33323a223361366236643533373534306265306635653039323132336632353939373837223b733a33323a223062316539313266303964633561653634333733313937313239636165333438223b733a33323a223634653437643538343539353335353336336439643464356562356435373136223b733a33323a223932636536623163613237663135313835316431393032663036356361383163223b733a33323a226232623066333661623331393034663236383437646165646634306234626137223b733a33323a223230643262383934653038643530663662623737663633656636336238653738223b733a33323a223563623861396265353164376338323338393337623061633436303565346137223b733a33323a223963353036393535393031303630633064643862663434366431343331666461223b733a33323a223434666264633337633830646432363634643264366263643039386531323839223b733a33323a223633386333653937383439656539656366393930656438316365366633306430223b733a33323a223338303034613631366438366332636331323036303233623839656636326637223b733a33323a223666366539643939623365363461353264613039356562373661366239633138223b733a33323a223431313162656539303933313464656232613330326633316564356137383465223b733a33323a226632633934333033316263313831613030333932316164353733653934316238223b733a33323a226631323235336662653430386666313163653565346135336636333133356565223b733a33323a226264623666363534623737306664313563653063303165356162376333306264223b733a33323a223531353336343832616132306439353061326638346661343838346330636662223b733a33323a223363306533656430333535346364303564656366326362633265313365306437223b733a33323a223839343164383238613137366564613165376662623738346239663133353438223b733a33323a226461383836643038313664343861313132653235353861363437303138653039223b733a33323a223437336165626238616236643965613639643733646236316233393463373064223b733a33323a226435393039353632363662636133376437633132323239336638323434323763223b733a33323a223062353833656365353036376363653637626434323239313661336661333135223b733a33323a226333336362656464623938653430643837323866383333333032303364356462223b733a33323a223739373465366464396237663038636134343338616235313037336662343265223b733a33323a223231353733303665376662353034356630393937613731336437663831646338223b733a33323a226462646633643239663432303339376665346239303835326635336262623338223b733a33323a223866393166613239353530663365623330303362313866356638313434646636223b733a33323a226539313632346131376363333865373264363030393634656238633439323833223b733a33323a223364346334613236656362656336616665616465373934653731396430393731223b733a33323a226132373965346634643932326538373233653331326637363038623663663639223b733a33323a226530633365613766393865393962343334363130326363623630646637646132223b733a33323a223065383462633161616337663037373939383836366562376461313432626538223b733a33323a226266353765323430383562346437383963653262373937353435656538383538223b733a33323a223664346635366230373863663237663331363736323839376536393461643035223b733a33323a223034636633316362396434393862363337396666636632666530626363303833223b733a33323a226333646664386238306533613463653433613836326332623661356161323638223b733a33323a223830613264353361646537303034336561663037383966383262316462363937223b733a33323a226561363964383864623732333236616336373330623535343562333530643135223b7d733a343a2268617368223b733a36353a2265613639643838646237323332366163363733306235353435623335306431352d3830613264353361646537303034336561663037383966383262316462363937223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313335323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223739636133383732323832636632623563643330646639393032663233626461223b733a33323a223638356634636162376563343163346538643863333539646562326438616639223b733a33323a223234613739346337663662343064393061613363396337373765353934633632223b733a33323a223334343461343139613364386336366164623531366464333832633138613539223b733a33323a226265303639393539643539643430343762656331323163616466626338643334223b733a33323a223465613930303837313531653664383039376430643231353765393634653264223b733a33323a223130336235613937626235646538386363383438353031656563636466663536223b733a33323a223163326235346332666266316536623035643961613635386230373338333764223b733a33323a223266313638646538383261643238313839636531643561313061386533663834223b733a33323a226464363734666131316265316235313837626638353166636432356238653039223b733a33323a226265313232616239393962626433623038333132396263623035643364343364223b733a33323a223630643631633735613035346237386465613535383537313339633966666336223b733a33323a223363373832343133656539616265663031663734656431386336373531336330223b733a33323a226163623133376630373234343839616666386235653337386461666137363739223b733a33323a223034373961336233326239356434323039633831386461343438666530373130223b733a33323a226565663632396265646163393139393262396664346232653733636338353336223b733a33323a226533653565373365383963636462666463396361326239323232323136643933223b733a33323a223635353537376164383166346136323166376436333438646233343238336336223b733a33323a223764343865653463353335616634356331313262623733316435666661313639223b733a33323a223531656530616336313437646566346463323936633766343937353230663832223b733a33323a223339656366343262636631623865356531313066356234346334633534346538223b733a33323a223263373835616166623936313538666532663063623861303163376136663764223b733a33323a223332613066346562386265356533366239663639316662323766613431623566223b733a33323a226130396432326534343932656235343866613232326438313866303438346266223b733a33323a223430643764653537346435613936656361316439363364666163316564623235223b733a33323a223534653234643139636666303361623763343636323563386132316232396666223b7d733a343a2268617368223b733a36353a2235346532346431396366663033616237633436363235633861323162323966662d3430643764653537346435613936656361316439363364666163316564623235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223634323637363830396462363734653638663939666534613037643738356464223b733a33323a223035363962346562323037396331643765323933666132313462613831383561223b733a33323a223430353030323530353564366232323261313562656638373731636235316166223b733a33323a226261306335386662623433656636643639353830303038373237353464323761223b733a33323a226336326532613334366163643461313632393162303935366664346532316535223b733a33323a226139366332366638303134353430333933616334336630326633316332336266223b7d733a343a2268617368223b733a36353a2261393663323666383031343534303339336163343366303266333163323362662d6336326532613334366163643461313632393162303935366664346532316535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223431613835353436613364323862343137303538613764633138646566626365223b733a33323a223735313831636162376234653964306464623933333535363134393937313165223b733a33323a226234303632393330646461663963346336613639623339373731373937363561223b733a33323a223262313032663866363139636434653934656232613162643166353664313532223b7d733a343a2268617368223b733a36353a2232623130326638663631396364346539346562326131626431663536643135322d6234303632393330646461663963346336613639623339373731373937363561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1619877777);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"samuel.szoniecky@univ-paris8.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"administrateur g\\u00e9n\\u00e9ral\"'),
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
(1, 1, 1, 'premier-site', 'default', 'Premier Site', 'test', '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]},{\"type\":\"page\",\"data\":{\"id\":2,\"label\":\"\"},\"links\":[]}]', '{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"ex\"}],\"resource_class_id\":[\"106\"],\"resource_template_id\":[\"2\"],\"item_set_id\":[\"\"],\"owner_id\":\"\"}', '2021-05-01 13:46:50', '2021-05-03 08:26:52', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_block_attachment`
--

INSERT INTO `site_block_attachment` (`id`, `block_id`, `item_id`, `media_id`, `caption`, `position`) VALUES
(1, 3, NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_item_set`
--

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
(1, 1, 'welcome', 'Welcome', 1, '2021-05-01 13:46:50', '2021-05-01 13:46:50'),
(2, 1, 'appartement', 'Appartement', 1, '2021-05-01 13:51:22', '2021-05-01 14:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

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
(1, 1, 'html', '{\"html\":\"Welcome to your new site. This is an example page.\"}', 1),
(2, 2, 'pageTitle', '[]', 1),
(3, 2, 'itemShowCase', '{\"thumbnail_type\":\"large\",\"show_title_option\":\"item_title\"}', 2),
(4, 2, 'listOfSites', '{\"sort\":\"alpha\",\"limit\":\"\",\"pagination\":\"0\",\"summaries\":\"1\",\"exclude_current\":\"1\"}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

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
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 1, '\"item\"'),
('browse_attached_items', 1, '\"1\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('search_apply_templates', 1, '[\"2\"]'),
('search_resource_names', 1, '[\"site_pages\",\"items\",\"item_sets\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"sitewide\"'),
('show_attached_pages', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-04-07 15:57:44', '2021-04-07 15:57:44', '$2y$10$.ZvV/jn5uQsBSS/Y0Ls/A.vsnBQ40nn5xDilHabdn0S6pnenhPJk2', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `value`
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
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(9, 5, 211, NULL, 'literal', '', '1445638472', NULL, 1),
(10, 5, 204, NULL, 'literal', '', 'Benomin', NULL, 1),
(11, 5, 205, NULL, 'literal', '', 'Mouloud', NULL, 1),
(12, 5, 212, NULL, 'literal', '', '04/02/1944', NULL, 1),
(13, 5, 213, NULL, 'literal', '', '0', NULL, 1),
(14, 5, 1, NULL, 'literal', '', 'Mouloud Benomin', NULL, 1),
(15, 6, 211, NULL, 'literal', '', '1567778778', NULL, 1),
(16, 6, 204, NULL, 'literal', '', 'Gérardo', NULL, 1),
(17, 6, 205, NULL, 'literal', '', 'Nicole', NULL, 1),
(18, 6, 212, NULL, 'literal', '', '01/02/1956', NULL, 1),
(19, 6, 213, NULL, 'literal', '', '0', NULL, 1),
(20, 6, 1, NULL, 'literal', '', 'Nicole Gérardo', NULL, 1),
(21, 7, 211, NULL, 'literal', '', '1990363352', NULL, 1),
(22, 7, 204, NULL, 'literal', '', 'Duchoux', NULL, 1),
(23, 7, 205, NULL, 'literal', '', 'Kévin', NULL, 1),
(24, 7, 212, NULL, 'literal', '', '03/03/1999', NULL, 1),
(25, 7, 213, NULL, 'literal', '', '0', NULL, 1),
(26, 7, 1, NULL, 'literal', '', 'Kévin Duchoux', NULL, 1),
(27, 8, 222, NULL, 'literal', '', '12432', NULL, 1),
(28, 8, 206, NULL, 'literal', '', '20 rue Saint Titi', NULL, 1),
(29, 8, 204, NULL, 'literal', '', 'Laboratoire d\'analyses médicales Saint Titi', NULL, 1),
(30, 8, 208, NULL, 'literal', '', '56783', NULL, 1),
(31, 8, 207, NULL, 'literal', '', 'Cartoonville', NULL, 1),
(32, 8, 209, NULL, 'literal', '', '56', NULL, 1),
(33, 8, 210, NULL, 'literal', '', '2232', NULL, 1),
(34, 8, 1, NULL, 'literal', '', 'Laboratoire d\'analyses médicales Saint Titi', NULL, 1),
(35, 9, 222, NULL, 'literal', '', '12433', NULL, 1),
(36, 9, 206, NULL, 'literal', '', '12 Avenue du Général Leclerc', NULL, 1),
(37, 9, 204, NULL, 'literal', '', 'Laboratoire Grominet', NULL, 1),
(38, 9, 208, NULL, 'literal', '', '93123', NULL, 1),
(39, 9, 207, NULL, 'literal', '', 'Comicville', NULL, 1),
(40, 9, 209, NULL, 'literal', '', '93', NULL, 1),
(41, 9, 1, NULL, 'literal', '', 'Laboratoire Grominet', NULL, 1),
(42, 10, 211, NULL, 'literal', '', '1567778778', NULL, 1),
(43, 10, 222, NULL, 'literal', '', '12432', NULL, 1),
(44, 10, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(45, 10, 216, NULL, 'literal', '', '13:30', NULL, 1),
(46, 10, 217, NULL, 'literal', '', 'PCR', NULL, 1),
(47, 10, 1, NULL, 'literal', '', 'RDV 1', NULL, 1),
(48, 11, 211, NULL, 'literal', '', '1445638472', NULL, 1),
(49, 11, 222, NULL, 'literal', '', '12433', NULL, 1),
(50, 11, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(51, 11, 216, NULL, 'literal', '', '13:30', NULL, 1),
(52, 11, 217, NULL, 'literal', '', 'PCR', NULL, 1),
(53, 11, 1, NULL, 'literal', '', 'RDV2', NULL, 1),
(54, 12, 211, NULL, 'literal', '', '1990363352', NULL, 1),
(55, 12, 222, NULL, 'literal', '', '12433', NULL, 1),
(56, 12, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(57, 12, 216, NULL, 'literal', '', '13:30', NULL, 1),
(58, 12, 217, NULL, 'literal', '', 'Antigenique', NULL, 1),
(59, 12, 1, NULL, 'literal', '', 'RDV3', NULL, 1),
(60, 13, 222, NULL, 'literal', '', '12432', NULL, 1),
(61, 13, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(62, 13, 218, NULL, 'literal', '', '150', NULL, 1),
(63, 13, 220, NULL, 'literal', '', '50', NULL, 1),
(64, 13, 221, NULL, 'literal', '', '50', NULL, 1),
(65, 13, 219, NULL, 'literal', '', '50', NULL, 1),
(66, 13, 1, NULL, 'literal', '', 'Test Dispos - 04/05/2021 - Saint Titi', NULL, 1),
(67, 14, 222, NULL, 'literal', '', '12433', NULL, 1),
(68, 14, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(69, 14, 218, NULL, 'literal', '', '120', NULL, 1),
(70, 14, 220, NULL, 'literal', '', '10', NULL, 1),
(71, 14, 1, NULL, 'literal', '', 'Test Dispos - 04/05/2021 - Lab Grominet', NULL, 1),
(84, 17, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(85, 17, 222, NULL, 'literal', '', '12432', NULL, 1),
(86, 17, 218, NULL, 'literal', '', '100', NULL, 1),
(87, 17, 219, NULL, 'literal', '', '40', NULL, 1),
(88, 17, 221, NULL, 'literal', '', '20', NULL, 1),
(89, 17, 220, NULL, 'literal', '', '40', NULL, 1),
(90, 17, 1, NULL, 'literal', '', 'Test Effectués - 04/05/2021 - Lab Saint Titi', NULL, 1),
(91, 18, 215, NULL, 'literal', '', '04/05/2021', NULL, 1),
(92, 18, 222, NULL, 'literal', '', '12433', NULL, 1),
(93, 18, 218, NULL, 'literal', '', '100', NULL, 1),
(94, 18, 219, NULL, 'literal', '', '100', NULL, 1),
(95, 18, 221, NULL, 'literal', '', '0', NULL, 1),
(96, 18, 220, NULL, 'literal', '', '0', NULL, 1),
(97, 18, 1, NULL, 'literal', '', 'Test Effectués au 04/05/2021 - Lab Grominet', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
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
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'https://bdd_foncier.foncierfoncier.fr/onto/fncr', 'fncr', 'Foncier BDD', ''),
(8, 1, 'https://covid.exammedas.fr/onto/covid#', 'covid', 'Covid Exam', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

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
