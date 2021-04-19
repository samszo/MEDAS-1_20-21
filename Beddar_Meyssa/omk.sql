-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Apr 19, 2021 at 09:32 PM
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
-- Database: `omeka_medas`
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
(2, 'items', 1, 1, 'FLAUBERT Hugo', 'FLAUBERT\nHugo\n.\nFLAUBERT Hugo\nMédecin généraliste'),
(3, 'items', 1, 1, 'MARTINS Jérémy', 'MARTINS\nJérémy\n.\nMARTINS Jérémy\nMédecin généraliste'),
(4, 'items', 1, 1, 'DUMONT Mélanie', 'DUMONT\nMélanie\n18 passages desgrais\nParis\n.\nDUMONT Mélanie'),
(5, 'items', 1, 1, 'KEDIRE Martin', 'KEDIRE\nMartin\n18 rue notre dame de lorette\nParis\n.\nKEDIRE Martin'),
(6, 'items', 1, 1, 'RICHARD Frederic', 'RICHARD\nFrederic\n15 rue du clos beauvoys\nVilleneuve la Garenne\n.\nRICHARD Frederic'),
(7, 'items', 1, 1, 'Consultation MARTINS du 01/02/20 - 14h00', '2020-02-01 14:00:00\nConsultation MARTINS du 01/02/20 - 14h00 \nMARTINS Jérémy\nVoir le patient et le médecin concernés\nKEDIRE Martin\nMARTINS Jérémy'),
(8, 'items', 1, 1, 'Ordonnance 1', '2020-02-01 14:00:00\nPARACETAMOL TEVA 1 g cp\nhttps://www.vidal.fr/medicaments/paracetamol-teva-1-g-cp-64682.html \nAntalgique\nOrdonnance 1\nMARTINS Jérémy\nKEDIRE Martin\nTraitement antalgique pour angine');

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
(2),
(3),
(4),
(5),
(6),
(7),
(8);

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

--
-- Dumping data for table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('emU1xGBxScu8x6fGPkFBZEkEeEGKHi4L', 2, '2021-03-22 09:12:50', 1);

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
(186, 1, 6, 'abstract', 'has abstract', 'Reserved for DBpedia.'),
(187, 1, 7, 'accessToElement', 'Access to element', 'An entry rule refers to a specific Road element.'),
(188, 1, 7, 'approvedByPa', 'Approved by PA', 'To connect a resolution to the municipality that have approved it.'),
(189, 1, 7, 'arrangedOnRoad', 'Arranged on road', 'To connect each beacon to the road in which it is installed.'),
(190, 1, 7, 'atBusStop', 'At bus stop', 'Each forecast refers to a specific bus stop.'),
(191, 1, 7, 'beginsAtJunction', 'Begins at junction', 'Each routeLink, has a beginning and an end junction.'),
(192, 1, 7, 'belongToMunicipality', 'Belong to municipality', 'A municipality can be divided in districts.'),
(193, 1, 7, 'belongToRoad', 'Belong to road', 'Each road has street numbers.'),
(194, 1, 7, 'coincideWith', 'Coincide with', 'There is no exact match between Road and AdministrativeRoad.'),
(195, 1, 7, 'composeDirection', 'Compose direction', 'A railway Direction is composed by more railway element.'),
(196, 1, 7, 'composeSection', 'Compose section', 'A railway Section is composed by more railway element.'),
(197, 1, 7, 'concernLine', 'Concern line', 'An AVMrecord concert to a unique line.'),
(198, 1, 7, 'concerningNode', 'Concerning node', 'A maneuver takes place in correspondence of a node.'),
(199, 1, 7, 'consistOfElement', 'Consist of element', 'A railway Direction is composed by more railway element.'),
(200, 1, 7, 'containsElement', 'Contains element', 'A road is formed by more elements road.'),
(201, 1, 7, 'correspondToJunction', 'Correspond to junction', 'Train station and good yard are located precisely on a junction.'),
(202, 1, 7, 'correspondsTo', 'Corresponds to', 'There is no exact match between Road and AdministrativeRoad.'),
(203, 1, 7, 'endAtJunction', 'End at junction', 'A railway element is delimited by two junctions.'),
(204, 1, 7, 'endingJunction', 'Ending junction', 'A road link is delimited by two junctions.'),
(205, 1, 7, 'endsAtNode', 'Ends at node', 'A road element is delimited by 2 nodes.'),
(206, 1, 7, 'endsAtStop', 'Ends at stop', 'A route section is delimited by two consecutive bus stops.'),
(207, 1, 7, 'finishesAtJunction', 'Finishes at junction', 'Each routeLink, has a beginning and an end junction.'),
(208, 1, 7, 'formingAdminRoad', 'Forming administrative road', 'More road elements form an administrative road.'),
(209, 1, 7, 'formsTable', 'Forms table', 'More road sensors form a sensor Table.'),
(210, 1, 7, 'hasAVMRecord', 'Has avm record', 'The AVM refer to a specific ride code.'),
(211, 1, 7, 'hasAccess', 'Has acceess', 'Point corresponding to the house number of service.'),
(212, 1, 7, 'hasBObservation', 'Has beacon observation', 'To connect each beacon to observations that it produces.'),
(213, 1, 7, 'hasCarParkSensor', 'Has car park sensor', 'To connect each car park to its installed sensor.'),
(214, 1, 7, 'hasDistrict', 'Has district', 'A municipality can be divided in districts.'),
(215, 1, 7, 'hasElement', 'Has element', 'A railway line is composed by more railway element.'),
(216, 1, 7, 'hasExpectedTime', 'Has expected time', 'The expected time at the next bus stops.'),
(217, 1, 7, 'hasExternalAccess', 'Has external access', 'It corresponds to the outer gate of the building.'),
(218, 1, 7, 'hasFirstElem', 'Has first element', 'The first element concerned by the maneuver.'),
(219, 1, 7, 'hasFirstSection', 'Has first section', 'Defines which is the departure section of a route.'),
(220, 1, 7, 'hasFirstStop', 'Has first stop', 'Defines which is the departure stop of a route.'),
(221, 1, 7, 'hasForecast', 'Has forecast', 'Each forecast refers to a specific bus stop.'),
(222, 1, 7, 'hasGeometry', 'Has geometry', 'Some services and all railway elements have a specific geometry like polygons or linestrings.'),
(223, 1, 7, 'hasInternalAccess', 'Has internal access', 'It corresponds to the door of the building.'),
(224, 1, 7, 'hasLastStop', 'Has last stop', 'Defines which is the last stop of a route.'),
(225, 1, 7, 'hasLastStopTime', 'Has last stop time', 'The arrival time at last bus stops.'),
(226, 1, 7, 'hasManeuver', 'Has maneuver', 'An entry rule can be connected to a specific maneuver.'),
(227, 1, 7, 'hasMonitoringStation', 'Has monitoring station', 'Relates an ICQA agglomeration to its monitoring stations.'),
(228, 1, 7, 'hasMunicipality', 'Has municipality', 'A province is formed by more municipalities.'),
(229, 1, 7, 'hasObservation', 'Has observation', 'Each road sensor produce a report every 20 minutes.'),
(230, 1, 7, 'hasPrediction', 'Has prediction', 'A report is made up of more predictions.'),
(231, 1, 7, 'hasProvince', 'Has province', 'In a region there are more than one province.'),
(232, 1, 7, 'hasRecord', 'Has record', 'Every 10 minutes a sensor sends a report.'),
(233, 1, 7, 'hasRegularService', 'Has regular service', 'Regular services can be connected to transverse services.'),
(234, 1, 7, 'hasResolution', 'Has resolution', 'To connect a resolution to the municipality that have approved it.'),
(235, 1, 7, 'hasRoadElement', 'Has road element', 'More road elements form an administrative road.'),
(236, 1, 7, 'hasRoute', 'Has route', 'Each route refers to a line.'),
(237, 1, 7, 'hasRouteLink', 'Has route link', 'A route section is composed by more route link.'),
(238, 1, 7, 'hasRule', 'Has rule', 'Some road elements are subject to rules of access.'),
(239, 1, 7, 'hasSecondElem', 'Has second element', 'The second element concerned the maneuver.'),
(240, 1, 7, 'hasSection', 'Has section', 'Defines all the other section of a route.'),
(241, 1, 7, 'hasSegment', 'Has segment', 'Each road element can be see as a collection of consecutive road link.'),
(242, 1, 7, 'hasStatistic', 'Has statistic', 'To connect a statistic to the referred municipality.'),
(243, 1, 7, 'hasStreetNumber', 'Has street number', 'Each road has street numbers.'),
(244, 1, 7, 'hasThirdElem', 'Has third element', 'The third element concerned the maneuver.'),
(245, 1, 7, 'hasTransferService', 'Has transfer Service', 'To connect each train station to the correspondant service.'),
(246, 1, 7, 'hasTransverseService', 'Has transverse service', 'Regular services can be connected to transverse services.'),
(247, 1, 7, 'hasWeatherReport', 'Has weather report', 'Each weather forecasts is connected to a municipality.'),
(248, 1, 7, 'inMunicipalityOf', 'In municipality of', 'Municipality to which the road belongs.'),
(249, 1, 7, 'includeForecast', 'Include forecast', 'Each AVMrecord includes more forecasts.'),
(250, 1, 7, 'instantAVM', 'Instant avm', 'The arrival time at last bus stops.'),
(251, 1, 7, 'instantBObserv', 'Instant Beacon Observ', 'Time and date of each Beacon observation.'),
(252, 1, 7, 'instantForecast', 'Instant forecast', 'The expected time at the next bus stops.'),
(253, 1, 7, 'instantObserv', 'Instant observation', 'The time of one observation.'),
(254, 1, 7, 'instantParking', 'Instant parking', 'The generation time of one situation record.'),
(255, 1, 7, 'instantWReport', 'Instant weather report', 'The generation time of a new weather report.'),
(256, 1, 7, 'isComposedByElement', 'Is composed by element', 'A railway section is composed by more railway element.'),
(257, 1, 7, 'isInElement', 'Is in element', 'Each milestone need to refers to a road element.'),
(258, 1, 7, 'isInMunicipality', 'Is in municipality', 'A bus stop can be connected to the municipality to which belong.'),
(259, 1, 7, 'isInRoad', 'Is in road', 'Service and train station can be connected to the referred Road.\n'),
(260, 1, 7, 'isPartOfICQAAgglomeration', 'Is part of ICQA agglomeration', 'Relates each air quality monitoring station to the ICQA agglomerate where it is located.'),
(261, 1, 7, 'isPartOfLine', 'Is part of line', 'A railway line is composed by more railway element.'),
(262, 1, 7, 'isPartOfLot', 'Is part of lot', 'Bus stops and bus lines are part of a lot.'),
(263, 1, 7, 'isPartOfProvince', 'Is part of province', 'A province is formed by more municipalities.'),
(264, 1, 7, 'isPartOfRegion', 'Is part of region', 'In a region there are more than one province.'),
(265, 1, 7, 'isPartOfRoad', 'Is part of Road', 'More road elements compose a road.'),
(266, 1, 7, 'lastStop', 'Last stop', 'The AVMrecord specify which is the last bus stop made.'),
(267, 1, 7, 'managingAuthority', 'Managing authority', 'The authority that deals with the road elements management.'),
(268, 1, 7, 'measuredByBeacon', 'Measured by beacon', 'To connect each observation to the beacon that has produced it.'),
(269, 1, 7, 'measuredBySensor', 'Measured by sensor', 'Each observation refers to only one road sensor.'),
(270, 1, 7, 'measuredDate', 'Measured date', 'Time and date of each Beacon observation.'),
(271, 1, 7, 'measuredTime', 'Measured time', 'The time of one observation.'),
(272, 1, 7, 'observationTime', 'Observation time', 'The generation time of one situation record.'),
(273, 1, 7, 'observeCarPark', 'Observe car park', 'To connect each sensor to the referred car park service.'),
(274, 1, 7, 'onRoute', 'On route', 'Rides and AVMrecords refer to a specific route.'),
(275, 1, 7, 'ownerAuthority', 'Owner authority', 'The authority that owns the administrative road.'),
(276, 1, 7, 'placedInElement', 'Placed in element', 'Each entry need to refers to a road.'),
(277, 1, 7, 'placedOnRoad', 'Placed on road', 'To connect each road sensor to the road in which is installed.'),
(278, 1, 7, 'refersToMunicipality', 'Refers to municipality', 'Specifies the municipality for the weather forecast.'),
(279, 1, 7, 'refersToRide', 'Refers to ride', 'The AVM refer to a specific ride code.'),
(280, 1, 7, 'refersToRoadElement', 'Refers to road element', 'Refers to road element'),
(281, 1, 7, 'relatedToSensor', 'Related to sensor', 'Refers to the parking where the situation record was produced.'),
(282, 1, 7, 'scheduledOnLine', 'Scheduled on line', 'A ride can be scheduled on a single line.'),
(283, 1, 7, 'startAtJunction', 'Start at junction', 'A railway element is delimited by two junctions.'),
(284, 1, 7, 'startingJunction', 'Starting junction', 'A road link is delimited by two junctions.'),
(285, 1, 7, 'startsAtNode', 'Starts at node', 'A road element is delimited by 2 nodes.'),
(286, 1, 7, 'startsAtStop', 'Start at stop', 'A route section is delimited by two consecutive bus stops.'),
(287, 1, 7, 'updateTime', 'Update time', 'The generation time of a new weather report.'),
(288, 1, 7, 'wasteType', 'Waste type', 'Specify the waste type (plastics, paper, glass, and the like).'),
(289, 1, 7, 'abbreviation', 'Abbreviation', 'Abbreviation of the description of the service.'),
(290, 1, 7, 'accessType', 'Access type', 'It provides an information about the data retrieval method (HTTP, Rest, etc.)'),
(291, 1, 7, 'adRoadName', 'Administrative Road Name', 'Official name of the road'),
(292, 1, 7, 'addressVillage', 'address village', 'It helps locate the service, specifying, for example, the historic building where it is located, the neighborhood, or something else.'),
(293, 1, 7, 'adminClass', 'Admin class', 'Administrative classification of the road'),
(294, 1, 7, 'airQuality', 'Air quality', 'It provides a measurement of the level of air pollution'),
(295, 1, 7, 'airQualityBenzene', 'Air quality - Benzene', 'Daily average concentration of Benzene expressed in micrograms per cubic meter.'),
(296, 1, 7, 'airQualityCO', 'Air quality - CO', 'Maximum mobile average over 8h of CO concentration expressed in milligrams per cubic meter'),
(297, 1, 7, 'airQualityCombinedCounter', 'Air quality - Combined', 'It provides an overall measure of air quality, combining different indicators appropriately.'),
(298, 1, 7, 'airQualityH2S', 'Air quality - H2S', 'Maximum hourly concentration of H2S expressed in micrograms per cubic meter'),
(299, 1, 7, 'airQualityICQAValue', 'Air quality - ICQA', 'It provides the value of the ICQA index defined by the Tuscany Region for the measurement of air quality at urban agglomeration level'),
(300, 1, 7, 'airQualityNO2', 'Air quality - NO2', 'Maximum hourly concentration of NO2 expressed in micrograms per cubic meter'),
(301, 1, 7, 'airQualityO3', 'Air quality - O3', 'Maximum hourly concentration of O3 expressed in micrograms per cubic meter'),
(302, 1, 7, 'airQualityPM10', 'Air quality - PM10', 'Daily average concentration of PM10 expressed in micrograms per cubic meter'),
(303, 1, 7, 'airQualityPM2.5', 'Air quality - PM2.5', 'Daily average concentration of PM2.5 expressed in micrograms per cubic meter.'),
(304, 1, 7, 'airQualitySO2', 'Air quality - SO2', 'Maximum hourly concentration of SO2 expressed in micrograms per cubic meter'),
(305, 1, 7, 'alertArea', 'Alert area', 'It identifies ​​the alert area in the context of water hazard prevention'),
(306, 1, 7, 'allowedArmedForcesAccess', 'Allowed armed forces access', 'It indicates whether an access restriction is active but allows transit to the armed forces.'),
(307, 1, 7, 'allowedAuthorizedVehiclesAccess', 'Allowed authorized veihicles access', 'It indicates whether an access restriction is active but still permits transit to authorized vehicles.'),
(308, 1, 7, 'allowedBicycleAccess', 'Allowed bicycle access', 'It indicates whether an access restriction is active but still permits the transit of bicycles.'),
(309, 1, 7, 'allowedDisabledAccess', 'Allowed disabled access', 'It indicates whether an access restriction is active but still allows for the disabled.'),
(310, 1, 7, 'allowedDriverIncludedRentedCarAccess', 'Allowed access to driver included rented car', 'It indicates whether an access restriction is active but still permits transit to cars rented with a driver.'),
(311, 1, 7, 'allowedElectricBicycleAccess', 'Allowed electric bicycle access', 'It indicates whether an access restriction is active but allows transit to electric bicycles.'),
(312, 1, 7, 'allowedExtraurbanBusAccess', 'Allowed extraurban bus access', 'It indicates whether an access restriction is active but allows transit to non-urban buses.'),
(313, 1, 7, 'allowedOnlyEmergencyAccess', 'Allowed only emergency access', 'It indicates whether an access restriction is active but allows transit to rescue vehicles.'),
(314, 1, 7, 'allowedOperatingVehiclesAccess', 'Allowed operating vehicles access', 'It indicates whether an access restriction is active, however it allows transit to the means involved in the work.'),
(315, 1, 7, 'allowedPoliceAndEmergencyAccess', 'Allowed police and emergency access', 'It indicates whether an access restriction is active but allows transit to the police and rescue vehicles.'),
(316, 1, 7, 'allowedUrbanBusAccess', 'Allowed urban bus access', 'It indicates whether an access restriction is active but still allows for urban bus transit.'),
(317, 1, 7, 'alterCode', 'Alter code', 'It indicates an alternative code for the road.'),
(318, 1, 7, 'alternativeEmail', 'Alternative e-mail', 'It indicates a secondary e-mail address.'),
(319, 1, 7, 'alternativeFax', 'Alternative fax', 'It indicates a secondary fax number.'),
(320, 1, 7, 'alternativeTelephone', 'Alternative phone', 'It indicates a secondary phone number.'),
(321, 1, 7, 'altitude', 'Altitude', 'It indicates the altitude to which the weather station is located.'),
(322, 1, 7, 'annualPM10ExceedanceCount', 'Air quality - PM10 Exceedance', 'It provides the count of the number of PM10 threshold strides in the last year.'),
(323, 1, 7, 'areaCode', 'Area code', 'Area code, defined at the municipal level, where the service or sensor  is located.'),
(324, 1, 7, 'areaName', 'Area name', 'Name of the area, defined at the municipal level, where the service or the sensor is located.'),
(325, 1, 7, 'atecoCode', 'Ateco code', 'It provides the ATECO classification code for the service.'),
(326, 1, 7, 'automaticity', 'Automaticity', 'It specifies whether data capture can be executed in a totally automated way or if an operator is needed.'),
(327, 1, 7, 'averageDistance', 'Average distance', 'Average distance between two vehicles passing one from one to the other.'),
(328, 1, 7, 'averageSpeed', 'Average speed', 'Average speed at which vehicles pass.'),
(329, 1, 7, 'averageTime', 'Average time', 'Average time between 2 transits'),
(330, 1, 7, 'axialMass', 'Axial mass', 'It provides a railway line classification code based on the maximum allowed axial mass'),
(331, 1, 7, 'batteryLevel', 'Battery level', 'It indicates the level of the batteries, in a waste container with advanced features.'),
(332, 1, 7, 'blueCodeCount', 'Code blue count', 'It provides an indication of the number of red code patients present in the First Aid facility when detecting. The property is called blue code, resuming the classification used in some English-speaking countries.'),
(333, 1, 7, 'botanicalFamily', 'Botanical family', 'Botanical family'),
(334, 1, 7, 'capacity', 'Capacity', 'The capacity of the parking lot, or the garbage container.'),
(335, 1, 7, 'carParkStatus', 'Car park status', 'It describes the status of the parking lot, indicating whether there are any vacancies, if it is full, or if there is no information on the presence of vacant posts.'),
(336, 1, 7, 'category', 'Category', 'It provides the railway station category, an overall indicator of the quality of the railway line.'),
(337, 1, 7, 'classCode', 'Class code', 'It indicates the color of the civic number, for those cities where there are two independent numbering systems, the red numbers and the black numbers.'),
(338, 1, 7, 'collectionTime', 'Collection time', 'The time when the waste container is emptied.'),
(339, 1, 7, 'combinedTraffic', 'Combined traffic', 'It provides a technical information related to the railroad.'),
(340, 1, 7, 'composition', 'Composition', 'It indicates whether the stretch of road is on a single road or on separate roadways.'),
(341, 1, 7, 'concentration', 'Concentration', 'It provides the concentration of vehicles detected by the traffic sensor.'),
(342, 1, 7, 'currentWaterLevel', 'Current water level', 'It indicates the last detected water level.'),
(343, 1, 7, 'currentWindDirection', 'Current wind direction', 'It provides the last detected wind direction.'),
(344, 1, 7, 'currentWindGustSpeed', 'Current wind gust speed', 'Windness detected by equally fractionating the time, and  returning the peak of the last fraction.'),
(345, 1, 7, 'currentlyActive', 'Currently active', 'Currently active'),
(346, 1, 7, 'dailyO3ExceedanceCount', 'Air quality - O3 exceedance count', 'Number of times in the day that O3 concentracion is over 180mg/m3'),
(347, 1, 7, 'dailyO3ExceedanceHours', 'Air quality - O3 exceedance duration', 'Hours in the day that O3 concentracion is over 180mg/m3'),
(348, 1, 7, 'day', 'Day', 'Day to which the weather forecast refers.'),
(349, 1, 7, 'depthKm', 'Depth', 'Depth in kilometers'),
(350, 1, 7, 'direction', 'Direction', 'Direction of the route.'),
(351, 1, 7, 'distance', 'Distance', 'Distance between two stops within the route.'),
(352, 1, 7, 'districtCode', 'District code', 'Code of the neighborhood where the service is located.'),
(353, 1, 7, 'elemLocation', 'Element location', 'It provides a categorization of the road or rail segment, indicating whether it is on a bridge, rather than inside a tunnel or other.'),
(354, 1, 7, 'elementClass', 'Element class', 'It provides an indication of the importance of the road to which the road segment belongs (motorway, street, urban road and so on)'),
(355, 1, 7, 'elementType', 'Element type', 'It provides a categorization of the road or rail segment, for example, for a road segment, it says if it is located at a crossroad, on a roundabout, on a square, on a parking lot, and so on.'),
(356, 1, 7, 'enrolledStudents', 'number of enrolled students', NULL),
(357, 1, 7, 'entryType', 'Entry type', 'It indicates whether it is an interior pass, rather than an outside outcrop overlooking the public road, or something else.'),
(358, 1, 7, 'estimatedYearsToReturn', 'estimatedYearsToReturn', 'estimatedYearsToReturn'),
(359, 1, 7, 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours'),
(360, 1, 7, 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour'),
(361, 1, 7, 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours'),
(362, 1, 7, 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours'),
(363, 1, 7, 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours'),
(364, 1, 7, 'eventCategory', 'Event category', 'It provides the type of event, whether it is a theatrical work, a festival, an extraordinary opening, a sporting event, and so on.'),
(365, 1, 7, 'eventTime', 'Event time', 'It shows the start time of the event.'),
(366, 1, 7, 'exitRate', 'Exit rate', 'It provides the vehicle exit rate from the parking lot, ie the number of outgoing vehicles per hour.'),
(367, 1, 7, 'expectedTime', 'Expected time', 'Timetable for bus arrival at the stop. TO DELETE WHEN INSTANT FUNCTIONS TO PERFECT.'),
(368, 1, 7, 'exponent', 'Exponent', 'It provides the literal part of the civic number, if present.'),
(369, 1, 7, 'extendName', 'Extend name', 'It provides the full name of the road, including generic naming.'),
(370, 1, 7, 'extendNumber', 'Extend number', 'It provides the civic number for extended, including both the numerical part and the literal number where it is present.'),
(371, 1, 7, 'fillRate', 'Fill rate', 'It provides the parking rate, as the number of inbound vehicles per hour.'),
(372, 1, 7, 'firenzeCard', 'Firenze card', 'It provides whether the service is provided on favorable terms to holders of Firenze Card.'),
(373, 1, 7, 'firstAidState', 'State of First Aid', 'It indicates whether the counts refer to the total number of people standing in the First Aid with that specific code, or only to those who are at a specific stage (visiting, pending, observing, and so on).'),
(374, 1, 7, 'flowRate', 'Flow rate', 'Sliding rate'),
(375, 1, 7, 'free', 'Free', 'It provides the number of free places in the parking lot.'),
(376, 1, 7, 'freeEvent', 'Free event', 'It indicates whether the event is free or paid.'),
(377, 1, 7, 'freephone', 'freephone', 'It provides the green number to dial to get in touch with the service call center.'),
(378, 1, 7, 'gauge', 'Gauge', 'It provides the type of gauge, which can be reduced or standard.  It\'s a technical information relating to the railroad.'),
(379, 1, 7, 'geographicAreaType', 'Geographic area type', 'The geographic area type where the sensor is (eg. urban, suburban).'),
(380, 1, 7, 'greenCodeCount', 'Green code count', 'It provides the number of patients who are admitted to Green Emergency Rescue.'),
(381, 1, 7, 'heightHour', 'Height hour', 'It provides the time when the sun is expected to reach its maximum height.'),
(382, 1, 7, 'hour', 'Hour', 'It provides the time the weather forecast refers to.'),
(383, 1, 7, 'hourO3Max', 'Air quality - Maximum O3 exceedance', 'Hour in the day that O3 concentracion is at maximum'),
(384, 1, 7, 'houseNumber', 'House number', 'It provides the civic number where the service is located or where the event takes place.'),
(385, 1, 7, 'humidity', 'Humidity', 'Percentage of humidity.'),
(386, 1, 7, 'inAgglomeration', 'Agglomeration', 'The agglomeration where the monitoring station is'),
(387, 1, 7, 'internalTemperature', 'Internal temperature', 'Internal temperature'),
(388, 1, 7, 'isSelfService', 'is a self-service', 'It indicates whether the service is a refueling station self-service.'),
(389, 1, 7, 'juncType', 'Junction type', 'It indicates the type of railway junction, for example whether it is a level crossing, a track termination, a freight train, and so on.'),
(390, 1, 7, 'lastObservationHumidity', 'Last observation humidity', 'it indicates the last humidity value detected by the weather station.'),
(391, 1, 7, 'lastStopTime', 'Last stop time', 'The time the bus has reached the last stop. TO BE DELETED WHEN INSTANT FUNCTIONS TO PERFECT.'),
(392, 1, 7, 'lastTriples', 'Last triples', 'It indicates the last date when the RDF triples have been updated.'),
(393, 1, 7, 'lastUpdate', 'Last update', 'It indicates the last date when the source data has been updated.'),
(394, 1, 7, 'leafWetness', 'Leaf wetness', 'Humidity value detected by intelligent sprinkler.'),
(395, 1, 7, 'length', 'Length', 'It provides the length of the road segment (road element) or rail line.'),
(396, 1, 7, 'lineNumber', 'Line number', 'Indica il numero della linea a cui la fermata appartiene.'),
(397, 1, 7, 'lunarPhase', 'Lunar phase', 'Monn phase.'),
(398, 1, 7, 'magnitudeType', 'Magnitude type', 'It indicates the type of magnitude of the earthquake event.'),
(399, 1, 7, 'magnitudeValue', 'Magnitude value', 'It indicates the magnitude of the earthquake event.'),
(400, 1, 7, 'major', 'Major', 'The major, in a Beacon device, is a positive integer that, together with the minor and the UUID, uniquely identifies the device.'),
(401, 1, 7, 'managingAuth', 'Managing authority', 'It identifies the administration or the company responsible for managing the railway station.'),
(402, 1, 7, 'managingBy', 'Managing by', 'AVM system or road sensors operator.'),
(403, 1, 7, 'maneuverType', 'Maneuver type', 'It describes the type of restriction (bifurcation, forbidden maneuver, mandatory maneuver).'),
(404, 1, 7, 'maxTemp', 'Max temperature', 'It provides the maximum expected temperature.'),
(405, 1, 7, 'minTemp', 'Min temperature', 'It provides the minimum expected temperature.'),
(406, 1, 7, 'minor', 'Minor', 'The minor, in a Beacon device, is a positive integer that, together with the major and the UUID, uniquely identifies the device.'),
(407, 1, 7, 'monitoringStationType', 'Monitoring station type', 'Type of montioring station (e.g. fondo, traffico, industriale)'),
(408, 1, 7, 'moonrise', 'Moonrise', 'It provides the expected time for the moon to rise.'),
(409, 1, 7, 'moonset', 'Moonset', 'In indicates the expected time for the moon to set.'),
(410, 1, 7, 'multimediaResource', 'Multimedia resource', 'It provides the Internet address of a media resource related to the service.'),
(411, 1, 7, 'nodeType', 'Node type', 'It provides the node\'s category (intersection, toll, roundabout, roadway terminal, and so on).'),
(412, 1, 7, 'numTrack', 'Track number', 'The number of available tracks. Set to zero in the case of a railway section under construction or discarded.'),
(413, 1, 7, 'number', 'Number', 'It provides the numerical part of the civic number.'),
(414, 1, 7, 'occupancy', 'Occupancy', 'It provides the occupancy rate of the road detected by the traffic sensor.'),
(415, 1, 7, 'occupied', 'Occupied', 'Number of occupied parking spaces.'),
(416, 1, 7, 'operatingStatus', 'Operating status', 'It indicates whether the road element or railroad section is under construction, in operation, or has been discarded.'),
(417, 1, 7, 'otherHouseNumber', 'Other house number', 'It provides a second civic number to which the service can be accessed.'),
(418, 1, 7, 'otherStreetAddress', 'Other street address', 'It provides a second street address to which the service can be accessed.'),
(419, 1, 7, 'overtime', 'Overtime', 'It indicates the maximum execution time of the import process, after which it is killed.'),
(420, 1, 7, 'owner', 'Owner', 'AVM system owner.'),
(421, 1, 7, 'parkOccupancy', 'Park occupancy', 'Percentage of occupied parking spaces.'),
(422, 1, 7, 'parkingSpacesForDisabled', 'Parking spaces for disabled', 'It indicates the number of parking places reserved to disabled people.'),
(423, 1, 7, 'parkingSpacesForScooters', 'Parking spaces for scooters', 'It indicates the number of parking places reserved for scooters and similar.'),
(424, 1, 7, 'payingParkingSpaces', 'Paying parking spaces', 'It indicates the number of available paid places.'),
(425, 1, 7, 'perTemp', 'Perc. temperature', 'Indicates the expected perceived temperature.'),
(426, 1, 7, 'period', 'Period', 'It indicates the time expressed in seconds between two consecutive calls of the same process.'),
(427, 1, 7, 'physicalShape', 'Container shape', 'It indicates the shape of the waste bin with advanced features.'),
(428, 1, 7, 'placeName', 'Place name', 'It indicates the name of the place where the event takes place.'),
(429, 1, 7, 'pollenConcentration', 'Pollen', 'Pollen concentration'),
(430, 1, 7, 'pollenConcentrationLevel', 'Pollen concentration level', 'Pollen concentration level'),
(431, 1, 7, 'pollenConcentrationTrend', 'Pollen concentration trend', 'Pollen concentration trend.'),
(432, 1, 7, 'porteCochere', 'Porte cochere', 'It indicates if the entry is a porte cochere.'),
(433, 1, 7, 'power', 'Power', 'Indicates the power of the lamppost.'),
(434, 1, 7, 'primaryType', 'Primary type', 'It describes the main service that is provided.'),
(435, 1, 7, 'processType', 'Process type', 'It describes the type of process.'),
(436, 1, 7, 'public', 'Public', 'It indicates whether it is a public lighting streetlight.'),
(437, 1, 7, 'railDepartment', 'Rail department', 'It indicates the railway department of which the railway line is part.'),
(438, 1, 7, 'railwaySiding', 'Railway siding', 'It provides the number of sidings available in the goods yard.'),
(439, 1, 7, 'rainfall', 'Rainfall', 'Rainfall Detection'),
(440, 1, 7, 'rainfallLast12Hours', 'Rainfall last 12 hours', 'Rainfall detection within the last 12 hours.'),
(441, 1, 7, 'rainfallLast15Minutes', 'Rainfall last 15 minutes', 'Rainfall detection within the last 15 minutes.'),
(442, 1, 7, 'rainfallLast1Hour', 'Rainfall last 1 hour', 'Rainfall detection within the last hour.'),
(443, 1, 7, 'rainfallLast24Hours', 'Rainfall last 24 hours', 'Rainfall detection within the last 24 hours.'),
(444, 1, 7, 'rainfallLast36Hours', 'Rainfall last 36 hours', 'Rainfall detection within the last 36 hours.'),
(445, 1, 7, 'rainfallLast3Hours', 'Rainfall last 3 hours', 'Rainfall detection within the last 3 hours.'),
(446, 1, 7, 'rainfallLast6Hours', 'Rainfall last 6 hours', 'Rainfall detection within the last 6 hours.'),
(447, 1, 7, 'recTemp', 'Rec temp', 'It returns the temperature actually detected.'),
(448, 1, 7, 'rechargeState', 'Charging station status', 'Describes the status of the column for charging electric vehicles.'),
(449, 1, 7, 'redCodeCount', 'Red code count', 'It provides the number of patients who are admitted to Red Emergency Assistance.'),
(450, 1, 7, 'referencePerson', 'Reference person', 'Reference person'),
(451, 1, 7, 'restrictionType', 'Restriction type', 'It describes the type of the active restriction.'),
(452, 1, 7, 'restrictionValue', 'Restriction value', 'It provides a quantification for the active restriction, when applicable.'),
(453, 1, 7, 'rideState', 'Ride state', 'State of the ride: advance, late, on time.'),
(454, 1, 7, 'riverName', 'River name', 'River name'),
(455, 1, 7, 'roadName', 'Road name', 'It indicates the name of the road without the generic naming.'),
(456, 1, 7, 'roadType', 'Road type', 'It indicates the generic naming only.'),
(457, 1, 7, 'routeCode', 'Route code', 'It provides the code of the thematic path.'),
(458, 1, 7, 'routeLength', 'Route length', 'It provides the route length.'),
(459, 1, 7, 'routePosition', 'Route position', 'It provides the position of the service within the thematic path.'),
(460, 1, 7, 'severityCode', 'Severity code', 'It provides a code that describes the severity of the event, used for mobility events.'),
(461, 1, 7, 'shortDescription', 'Short description', 'Brief indication of where the service is provided.'),
(462, 1, 7, 'snow', 'Snow', 'It provides a forecast about the snowfalls.'),
(463, 1, 7, 'soilWaterPotential', 'Soil water potential', 'It provides the soil water potential detected by the intelligent sprinkler.'),
(464, 1, 7, 'speedLimit', 'Speed limit', 'It indicates the speed limit in force on the specific road section.'),
(465, 1, 7, 'speedPercentile', 'Speed percentile', 'Percentile calculated on the speeds detected by the traffic sensor.'),
(466, 1, 7, 'state', 'State', 'Describes the status of a charging station for electric vehicles, or a railway station.'),
(467, 1, 7, 'stopNumber', 'Stop number', 'It indicates the number of the TPL stop.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(468, 1, 7, 'streetWithCurb', 'Street with curb', 'It indicates if the middle line is replaced by a separation wall.'),
(469, 1, 7, 'streetWithRtzAccess', 'Street with Restricted Traffic Zone access', 'Indicates whether or not the street belongs to a restricted traffic zone.'),
(470, 1, 7, 'studentsAtRefectory', 'number of students at the refectory', NULL),
(471, 1, 7, 'studentsAtSchool', 'number of students present at school', NULL),
(472, 1, 7, 'sunHeight', 'Sun height', 'Indicates the maximum height that will reach the sun during the day.'),
(473, 1, 7, 'sunrise', 'Sunrise', 'Indicates the time at which the sun will rise.'),
(474, 1, 7, 'sunset', 'Sunset', 'Indicates the time at which the sun will set.'),
(475, 1, 7, 'supply', 'Supply', 'Indicates whether it is an electrified line or not.'),
(476, 1, 7, 'surfaceArea', 'Surface area', 'Surface area'),
(477, 1, 7, 'temperature', 'Temperature', 'Temperature detection.'),
(478, 1, 7, 'temperatureLastObservation', 'Temperature last observation', 'It indicates the latest detected temperature value.'),
(479, 1, 7, 'temperatureMaxToday', 'Today max temperature', 'It indicates the maximum temperature value detected during the day.'),
(480, 1, 7, 'temperatureMaxYesterday', 'Yesterday max temperature', 'It indicates the maximum temperature value recorded on the previous day.'),
(481, 1, 7, 'temperatureMinToday', 'Today min temperature', 'It indicates the minimum temperature value detected during the day.'),
(482, 1, 7, 'temperatureMinYesterday', 'Yesterday min temperature', 'It indicates the minimum temperature value recorded on the previous day.'),
(483, 1, 7, 'text', 'Text', 'Returns the text written on the milestone (mileage).'),
(484, 1, 7, 'thresholdPerc', 'Threshold perc', 'Threshold value for the percentile of the speeds detected by the traffic sensor.'),
(485, 1, 7, 'time', 'Time', 'Times of last detection, and times of detection of extreme values, of humidity, precipitation, temperature and wind.'),
(486, 1, 7, 'timeHumidityObservation', 'Time humidity observation', 'Times of last detection, and times of detection of extreme values, of humidity.'),
(487, 1, 7, 'timeLastObservationHumidity', 'Time humidity last observation', 'Time of last detection of the humidity.'),
(488, 1, 7, 'timeLastObservationTemperature', 'Time last temperature observation', 'Time when the most recent temperature test was performed.'),
(489, 1, 7, 'timeLastObservationWind', 'Time wind last observation', 'The time when the latest wind speed detection was performed.'),
(490, 1, 7, 'timeRainfallLastObservation', 'Time rainfall last observation', 'The most recent rainfall detection.'),
(491, 1, 7, 'timeTemperatureObservation', 'Time temperature observation', 'Times of last detection, and times of detection of extreme values, of temperature.'),
(492, 1, 7, 'timeTodayMaxHumidity', 'Time today max humidity', 'Time when the maximum humidity concentration in the air was detected during the day.'),
(493, 1, 7, 'timeTodayMaxTemperature', 'Time today max temperature', 'The time when the maximum temperature was detected during the day.'),
(494, 1, 7, 'timeTodayMaxWindVelocity', 'Time today max wind velocity', 'The time when the maximum windiness was detected during the day.'),
(495, 1, 7, 'timeTodayMinHumidity', 'Time today min humidity', 'The time when the lowest concentration of humidity in the air was detected during the day.'),
(496, 1, 7, 'timeTodayMinTemperature', 'Time today min temperature', 'Time when the minimum temperature was detected during the day.'),
(497, 1, 7, 'timeWaterLevelObservation', 'Time water level observation', 'Time when the most recent water level detection was performed.'),
(498, 1, 7, 'timeWindObservation', 'Time wind observation', 'Times of last detection, and times of detection of extreme values, of windness.'),
(499, 1, 7, 'timeYesterdayMaxHumidity', 'Time yesterday max humidity', 'The time when the highest humidity concentration was detected during the previous day.'),
(500, 1, 7, 'timeYesterdayMaxTemperature', 'Time yesterday max temperature', 'The time when the maximum temperature was detected during the previous day.'),
(501, 1, 7, 'timeYesterdayMaxWindVelocity', 'Time yesterday max wind velocity', 'The time when the maximum windiness was detected during the previous day.'),
(502, 1, 7, 'timeYesterdayMinHumidity', 'time yesterday min humidity', 'Time when the lowest humidity concentration was detected during the previous day.'),
(503, 1, 7, 'timeYesterdayMinTemperature', 'Time yesterday min temperature', 'The time when the lowest temperature was detected during the previous day.'),
(504, 1, 7, 'timestamp', 'Time slot', 'One-second time interval, usually used as a time instant, to provide time allocation to a generic event. EVEN IF INSTANT IS INTRODUCED, THIS ATTRIBUTE MUST BE PRESERVED.'),
(505, 1, 7, 'todayMaxHumidity', 'Today max humidity', 'It provides the maximum value of humidity detected by the weather station throughout the day.'),
(506, 1, 7, 'todayMaxWaterLevel', 'Today max water level', 'It indicates the highest level of water detected in the day.'),
(507, 1, 7, 'todayMaxWindAverageSpeed', 'Today max wind average speed', 'Average windness of the day, determined by averaging the peaks.'),
(508, 1, 7, 'todayMaxWindDirection', 'Today max wind direction', 'It provides the wind direction detected at the peak windness of the day.'),
(509, 1, 7, 'todayMaxWindGustSpeed', 'Today max wind gust speed', 'Windness detected by equally fractionating the day and considering for each fraction the peak value only.'),
(510, 1, 7, 'todayMinHumidity', 'Today min humidity', 'It provides the minimum moisture value detected by the weather station throughout the day.'),
(511, 1, 7, 'todayMinWaterLevel', 'Today min water level', 'It indicates the lowest level of water detected in the day.'),
(512, 1, 7, 'trackType', 'Track type', 'Indicates whether the railway section is single track or double track.'),
(513, 1, 7, 'trafficDir', 'Traffic dir', 'It indicates whether the road section can be traveled in one or both directions.'),
(514, 1, 7, 'type', 'Type', 'It provides a first indication about the service delivered but is not intended to be shown to users.'),
(515, 1, 7, 'typeLabel', 'Type label', 'It provides a first description of the service provided, intended to be displayed to users and therefore available in multiple languages.'),
(516, 1, 7, 'typeOfResale', 'Type of resale', 'It describes the type of resale of TPL tickets (bars, bookstores, tobacconists, stationery, etc.).'),
(517, 1, 7, 'typicalIrrigationTime', 'Typical irrigation time', 'It indicates the usual time when the irrigator comes into operation.'),
(518, 1, 7, 'underpass', 'Underpass', 'It indicates whether the railroad section is within a subway.'),
(519, 1, 7, 'userTagId', 'User tag ID', 'An identifier for the smart waste container user.'),
(520, 1, 7, 'uuid', 'Uuid', 'Identifier that, together with major and minor, uniquely identifies the Beacon device.'),
(521, 1, 7, 'uv', 'Uv', 'Forecast about the intensity of UV rays.'),
(522, 1, 7, 'validityStatus', 'Validity status', 'It indicates whether the parking sensor is active or not.'),
(523, 1, 7, 'value', 'Value', 'It indicates the resulting value from the statistical detection.'),
(524, 1, 7, 'vehicle', 'Vehicle', 'Unique identifier of a local public transport vehicle.'),
(525, 1, 7, 'vehicleFlow', 'Vehicle flow', 'It indicates the flow of vehicles detected by the traffic sensor.'),
(526, 1, 7, 'wasteLevel', 'Waste level', 'It indicates the fill level of the waste bin with advanced features.'),
(527, 1, 7, 'waterLevel', 'Water level', 'Indicators relating to inland water monitoring.'),
(528, 1, 7, 'waterLevelVariation', 'Water level variation', 'Variations detected in the water level sampled every 1, 3, or 6, hours.'),
(529, 1, 7, 'waterLevelVariationLast1Hour', 'Water level variation last 1 hour', 'Variations detected in the water level sampled at every hour.'),
(530, 1, 7, 'waterLevelVariationLast3Hours', 'Water level variation last 3 hours', 'Variations detected in the water level sampled every 3 hours.'),
(531, 1, 7, 'waterLevelVariationLast6Hours', 'Water level variation last 6 hours', 'Variations detected in the water level sampled every 6 hours.'),
(532, 1, 7, 'whiteCodeCount', 'White code count', 'Number of patients admitted to White Emergency Assistance.'),
(533, 1, 7, 'width', 'Width', 'Road section width.'),
(534, 1, 7, 'wind', 'Wind', 'Expected windness.'),
(535, 1, 7, 'windAverageSpeed', 'Wind average speed', 'Average windness.'),
(536, 1, 7, 'windDirection', 'Wind direction', 'Wind direction'),
(537, 1, 7, 'windGustSpeed', 'Wind gust speed', 'Windness detected by equally fractionating the time and considering for each fraction the peak value only.'),
(538, 1, 7, 'yardType', 'Yard type', 'It indicates whether the goods yard is public or private.'),
(539, 1, 7, 'year', 'Year', 'It indicates the year when the resolution was approved.'),
(540, 1, 7, 'yellowCodeCount', 'Yellow code count', 'Number of patients admitted to First Aid in Yellow Code.'),
(541, 1, 7, 'yesterdayMaxHumidity', 'Yesterday max humidity', 'It provides the maximum value of humidity detected by the weather station over the previous day.'),
(542, 1, 7, 'yesterdayMaxWaterLevel', 'Yesterday max water level', 'Maximum water level recorded over the previous day.'),
(543, 1, 7, 'yesterdayMaxWindAverageSpeed', 'Yesterday max wind average speed', 'Average windness of the previous day, determined by averaging the peaks.'),
(544, 1, 7, 'yesterdayMaxWindDirection', 'Yesterday max wind direction', 'It provides the wind direction detected at the peak windness of the previous day.'),
(545, 1, 7, 'yesterdayMaxWindGustSpeed', 'Yesterday max wind gust speed', 'Windness detected by equally fractionating the previous day and considering for each fraction the peak value only.'),
(546, 1, 7, 'yesterdayMinHumidity', 'Yesterday min humidity', 'It provides the minimum value of humidity detected by the weather station over the previous day.'),
(547, 1, 7, 'yesterdayMinWaterLevel', 'Yesterday min water level', 'Minimum water level recorded over the previous day.'),
(548, 1, 8, 'nom', 'a pour nom', NULL),
(549, 1, 8, 'prenom', 'a pour prenom', NULL),
(550, 1, 8, 'adresse', 'adresse', NULL),
(551, 1, 8, 'ville', 'ville', NULL),
(552, 1, 8, 'codepostal', 'code postal', NULL),
(553, 1, 8, 'numSS', 'numero SS', NULL),
(554, 1, 8, 'date', 'date', NULL),
(555, 1, 8, 'typemedicament', 'type de medicament', NULL),
(556, 1, 8, 'specialite', 'specialite', NULL),
(557, 1, 8, 'centre', 'centre', NULL),
(558, NULL, 8, 'avoirpatient', 'a pour patient', NULL),
(559, NULL, 8, 'avoirmedecin', 'a pour medecin', NULL);

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
(2, 1, 750, 3, NULL, 'FLAUBERT Hugo', 1, '2021-04-19 20:50:16', '2021-04-19 20:50:16', 'Omeka\\Entity\\Item'),
(3, 1, 750, 3, NULL, 'MARTINS Jérémy', 1, '2021-04-19 20:53:55', '2021-04-19 20:53:55', 'Omeka\\Entity\\Item'),
(4, 1, 751, 4, NULL, 'DUMONT Mélanie', 1, '2021-04-19 20:55:37', '2021-04-19 20:55:37', 'Omeka\\Entity\\Item'),
(5, 1, 751, 4, NULL, 'KEDIRE Martin', 1, '2021-04-19 20:56:19', '2021-04-19 20:56:19', 'Omeka\\Entity\\Item'),
(6, 1, 751, 4, NULL, 'RICHARD Frederic', 1, '2021-04-19 20:57:06', '2021-04-19 20:57:06', 'Omeka\\Entity\\Item'),
(7, 1, 753, 5, NULL, 'Consultation MARTINS du 01/02/20 - 14h00', 1, '2021-04-19 21:00:36', '2021-04-19 21:02:26', 'Omeka\\Entity\\Item'),
(8, 1, 752, 7, NULL, 'Ordonnance 1', 1, '2021-04-19 21:09:38', '2021-04-19 21:09:38', 'Omeka\\Entity\\Item');

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
(106, 1, 7, 'AVMRecord', 'AVM Record', 'Corsa programmata da una certa azienda TPL su un certo percorso di una certa linea'),
(107, 1, 7, 'Accommodation', 'Accommodation', 'Hotels and similar structures.'),
(108, 1, 7, 'Accommodation_or_office_containers_rental', 'Accommodation or office containers rental', 'The instances of this class represent, among all business activities, some companies that deal with rental of containers for housing and offices.'),
(109, 1, 7, 'Accountants', 'Accountants', 'The instances of this class represent, among all the business activities, certain commercial, tax and audit firms.'),
(110, 1, 7, 'Addiction_recovery_centre', 'Addiction recovery centre', 'The instances of this class represent, among all business activities, certain communities and recuperation centers from dependencies.'),
(111, 1, 7, 'AdministrativeRoad', 'Administrative Road', 'Class whose instances are the administrative extents defined in the road graph.'),
(112, 1, 7, 'Adult_clothing', 'Adult Clothing', 'The instances of this class represent, among all business activities, certain retail clothing stores for adults.'),
(113, 1, 7, 'Advertising', 'Advertising', 'Advertising-related services.'),
(114, 1, 7, 'Advertising_and_promotion', 'Advertising and promotion', 'The instances of this class represent, among all business activities, certain dealerships and advertising companies.'),
(115, 1, 7, 'Aestestic_medicine_centre', 'Aestestic medicine centre', NULL),
(116, 1, 7, 'Agents', 'Agents', 'The instances of this class represent, among all business activities, certain agencies and agents for the show and sport.'),
(117, 1, 7, 'AgricultureAndLivestock', 'Agriculture and livestock', 'Activities and services relating to agriculture and livestock farming.'),
(118, 1, 7, 'Agritourism', 'Agritourism', 'The instances of this class represent, among all the business activities, certain catering and accommodation activities related to agricultural activities.'),
(119, 1, 7, 'AirQualityObservation', 'Air quality observation', 'Each instance of this class represents an air quality detection.'),
(120, 1, 7, 'Air_quality_monitoring_station', 'Air quality monitoring station', 'The instances of this class are dust-level detectors in the air.\nEach instance represents a specific detector, of a specific type, located in a specific location located through a pair of geospatial coordinates. On the other hand, for each detector there is at most one instance representing it.'),
(121, 1, 7, 'Airfields', 'Airfields', 'The instances of this class represent, among all service locations, some airfields.'),
(122, 1, 7, 'Airplanes_rental', 'Airplanes rental', 'The instances of this class represent, among all business activities, certain chartering activities of air transport.'),
(123, 1, 7, 'Airport_lost_property_office', 'Airport lost property office', 'The instances of this class represent, among all service locations, some offices for lost items at the airport.'),
(124, 1, 7, 'Amusement_activities', 'Amusement activities', 'The instances of this class represent, among all the business activities, some creative, artistic and entertainment activities.'),
(125, 1, 7, 'Amusement_and_theme_parks', 'Amusement and theme parks', 'The instances of this class represent, among all business activities, some amusement and themed parks.'),
(126, 1, 7, 'AnemometryObservation', 'Anemometry observation', 'Each instance of this class represents a speed and wind direction detection.'),
(127, 1, 7, 'Animal_feeds_manufacture', 'Animal Feeds Manufacture', 'The instances of this class represent, among all business activities, some companies that produce animal feed.'),
(128, 1, 7, 'Animal_production', 'Animal Production', 'The instances of this class represent, among all business activities, some animal breeding companies.'),
(129, 1, 7, 'Antiques', 'Antiques', 'The instances of this class represent, among all business activities, certain retail companies of used furniture and antiques.'),
(130, 1, 7, 'Aquarium', 'Aquarium', 'The instances of this class represent, among all service locations, some aquariums.'),
(131, 1, 7, 'Archaeological_site', 'Archaeological site', 'The instances of this class represent, among all business activities, certain archaeological sites.'),
(132, 1, 7, 'Architectural_consulting', 'Architectural consulting', 'The instances of this class represent, among all the business activities, some activities of architectural studies.'),
(133, 1, 7, 'Area', 'Polygonal Service', 'Services represented by a polygonal form area.'),
(134, 1, 7, 'Art_galleries', 'Art Galleries', 'The instances of this class represent, among all the business activities, certain retail companies of art objects including art galleries.'),
(135, 1, 7, 'Artisan_shop', 'Artisanshop', 'The instances of this class represent, among all the business activities, some craft workshops.'),
(136, 1, 7, 'Assistance', 'Assistance', 'The instances of this class represent, among all the services, some personal assistance services.'),
(137, 1, 7, 'Associations', 'Associations', 'The instances of this class represent, among all the business activities, certain business activities carried out by associative organizations.'),
(138, 1, 7, 'Atm', 'Atm', 'The instances of this class represent, among all services, ATMs.'),
(139, 1, 7, 'Auctioning_houses', 'Auctioning Houses', 'The instances of this class represent, among all business activities, some retail auction houses, excluding auction houses via the Internet.'),
(140, 1, 7, 'Audio_and_video', 'Audio and Video', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of audio and video equipment in specialized stores.'),
(141, 1, 7, 'Auditing_activities', 'Auditing activities', 'The instances of this class represent, among all business activities, some auditing activities.'),
(142, 1, 7, 'Auditorium', 'Auditorium', 'The instances of this class represent, among all the business activities, some auditoriums.'),
(143, 1, 7, 'Automobile_driving_and_flying_schools', 'Automobile driving and flying schools', 'The instances of this class include, among all business activities, some driving, flying and nautical schools.'),
(144, 1, 7, 'Bakery', 'Bakery', 'The instances of this class represent, among all business activities, certain bread retail activities, as well as pies, sweets and confectionery.'),
(145, 1, 7, 'Bank', 'Bank', 'The instances of this class represent, among all business activities, some lenders and financial service activities in general.'),
(146, 1, 7, 'Bar', 'Bar', 'The instances of this class include, among all business activities, certain bars and other similar exercises without cooking.'),
(147, 1, 7, 'Beach', 'Beach', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune spiagge.'),
(148, 1, 7, 'Beach_resort', 'Beach resort', 'Such activities represent, among all service locations, some bathing establishments.'),
(149, 1, 7, 'Beacon', 'Beacon', 'Service associated to Beacon that allow to receive offers.'),
(150, 1, 7, 'BeaconObservation', 'Beacon observation', 'lettura proveniente da un singolo beacon'),
(151, 1, 7, 'Beauty_centre', 'Beauty centre', 'The instances of this class represent, among all the business activities, certain services of beauty institutes.'),
(152, 1, 7, 'Bed_and_breakfast', 'Bed and breakfast', 'The instances of this class represent, among all business activities, certain lodging activities in bed and breakfast.'),
(153, 1, 7, 'Bench', 'Bench', 'Each instance of this class represents a bench.'),
(154, 1, 7, 'Betting_shops', 'Betting shops', 'The instances of this class represent, among all business activities, certain betting shops.'),
(155, 1, 7, 'Beverage_manufacture', 'Beverage Manufacture', 'The instances of this class represent, among all business activities, certain beverage production activities.'),
(156, 1, 7, 'BikeRackObservation', 'Bike rack observation', 'Each instance of this class represents a finding of places available in a bicycle rack at a given instant.'),
(157, 1, 7, 'Bike_rack', 'Bike rack', 'Each instance of this class represents a bike rack.'),
(158, 1, 7, 'Bike_rental', 'Bike rental', 'The instances of this class represent, among all business activities, some bicycle rental activities.'),
(159, 1, 7, 'Bike_sharing_rack', 'Bike sharing rack', NULL),
(160, 1, 7, 'Boarding_house', 'Boarding house', 'The instances of this class represent, among all the business activities, certain guest houses.'),
(161, 1, 7, 'Boat_equipment', 'Boat equipment', 'The instances of this class represent, among all business activities, certain retail and boat related activities.'),
(162, 1, 7, 'Boats_and_ships_rental', 'Boats and ships rental', 'The instances of this class represent, among all the business activities, certain activities of renting sea and river transport.'),
(163, 1, 7, 'Bollard', 'Bollard', 'Each instance of this class represents a mobile bollard.'),
(164, 1, 7, 'Bookshop', 'Book Shop', 'The instances of this class represent, among all business activities, some retail business of new books.'),
(165, 1, 7, 'Botanical_and_zoological_gardens', 'Botanical and zoological gardens', 'The instances of this class represent, among all business activities, some activities of botanical gardens, zoological gardens and natural reserves.'),
(166, 1, 7, 'Boxoffice', 'Boxoffice', 'The instances of this class include, among all business activities, some resale of tickets for sporting events and entertainment.'),
(167, 1, 7, 'Building_and_industrial_cleaning_activities', 'Building and industrial cleaning activities', 'The instances of this class represent, among all business activities, certain sterilization activities of buildings, plant, industrial machinery and healthcare equipment.'),
(168, 1, 7, 'Building_construction', 'Building Construction', 'The instances of this class represent, among all the business activities, certain building design and building activities.'),
(169, 1, 7, 'Building_material', 'Building Material', 'The instances of this class represent, among all the business activities, certain retail business of building materials, ceramics, tiles.'),
(170, 1, 7, 'Building_materials_manufacture', 'Building Materials Manufacture', 'The instances of this class represent, among all the business activities, certain cement, lime, concrete, gypsum and other building compounds.'),
(171, 1, 7, 'BusStop', 'Bus Stop', 'Interconnection point between road segments to determine the path of a TPL line.'),
(172, 1, 7, 'BusStopForecast', 'BusStop Forecast', 'Arrival forecast at a certain stop.'),
(173, 1, 7, 'Bus_tickets_retail', 'Bus tickets retail', 'The instances of this class represent, among all business activities, some bus ticket resale services.'),
(174, 1, 7, 'Business_support', 'Business support', 'The instances of this class represent, among all business activities, certain types of business support activities. These are mainly companies of: exactorial management; distribution agencies of books, newspapers and magazines; services of public market management and public weights; request for certificates and public purses; request for certificates and practical drawings.'),
(175, 1, 7, 'Call_center', 'Call center', 'The instances of this class represent, among all business activities, some call center activities.'),
(176, 1, 7, 'Camper_service', 'Camper service', 'The instances of this class represent, among all the business activities, certain activities of traveling tourism services.'),
(177, 1, 7, 'Camping', 'Camping', 'The instances of this class include, among all business activities, some parking areas and areas equipped for motor homes and caravans.'),
(178, 1, 7, 'Canteens_and_food_service', 'Canteens and Food Service', 'The instances of this class represent, among all the business activities, certain canteens and continuous catering activities on a contractual basis.'),
(179, 1, 7, 'CarParkSensor', 'Car Park Sensor', 'Sensor collecting data inside a parking lot.'),
(180, 1, 7, 'Car_park', 'Car park', 'The instances of this class represent, among all business activities, some parking and caretaking activities.'),
(181, 1, 7, 'Car_rental_with_driver', 'Car Rental With Driver', 'The instances of this class represent, among all the business activities, certain transport activities by renting passenger cars with driver.'),
(182, 1, 7, 'Car_washing', 'Car Washing', 'The instances of this class represent, among all business activities, certain car wash activities.'),
(183, 1, 7, 'Carabinieri', 'Carabinieri', 'The instances of this class represent, among all service locations, some Carabinieri barracks.'),
(184, 1, 7, 'Cargo_handling', 'Cargo Handling', 'The instances of this class represent, among all the business activities, certain cargo handling activities on road and rail.'),
(185, 1, 7, 'Carpentry', 'Carpentry', 'The instances of this class represent, among all the business activities, some furniture repair and furnishing repair activities.'),
(186, 1, 7, 'Carpets', 'Carpets', 'The instances of this class represent, among all the business activities, certain carpet retail activities.'),
(187, 1, 7, 'Carpets_and_curtains', 'Carpets and Curtains', 'The instances of this class represent, among all the business activities, some retail activities of carpets, curtains and curtains.'),
(188, 1, 7, 'Cartographers', 'Cartographers', 'The instances of this class represent, among all the business activities, some cartography and aerial photogrammetry activities.'),
(189, 1, 7, 'Castle', 'Castle', 'The instances of this class represent some castles where tourist services of various kinds are offered.'),
(190, 1, 7, 'Catering', 'Catering', 'The instances of this class represent, among all the business activities, certain catering activities for events, banqueting, provision of meals prepared for catering and other catering services.'),
(191, 1, 7, 'Cemetery', 'Cemetery', 'The instances of this class each represent a cemetery.'),
(192, 1, 7, 'ChargeStationObservation', 'Charge station observation', 'Each instance of this class represents a state of a column for charging electric vehicles at a given instant.'),
(193, 1, 7, 'Charging_stations', 'Charging stations', 'The instances of this class represent, among all business activities, certain supply of columns for charging power supplies and related services.'),
(194, 1, 7, 'Charter_airlines', 'Charter Airlines', 'The instances of this class represent, among all business activities, some non-scheduled air transport activities (charter flights).'),
(195, 1, 7, 'Churches', 'Churches', 'The instances of this class represent, among all the places of service, certain places of worship and business activities related to places of worship.'),
(196, 1, 7, 'Cinema', 'Cinema', 'The instances of this class represent, among all the business activities, certain cinematic projection activities.'),
(197, 1, 7, 'CivilAndEdilEngineering', 'Civil and edil engineering', 'Services related to civil and construction engineering. '),
(198, 1, 7, 'Civil_airport', 'Civil airport', 'The instances of this class represent, among all business activities, certain activities carried out by civil airports, with particular reference to transfer and rental services.'),
(199, 1, 7, 'Civil_engineering', 'Civil Engineering', 'The instances of this class represent, among all the business activities, certain civil engineering activities, and in particular the activities of building public works.'),
(200, 1, 7, 'Civil_protection', 'Civil protection', 'The instances of this class represent, among all service locations, certain civil protection activities.'),
(201, 1, 7, 'Civil_registry', 'Civil registry', 'The instances of this class represent, among all service locations, certain registry offices.'),
(202, 1, 7, 'Cleaning_activities', 'Cleaning activities', 'The instances of this class represent, among all the business activities, some cleaning and disinfestation activities.'),
(203, 1, 7, 'Cleaning_materials', 'Cleaning Materials', 'The instances of this class represent, among all business activities, certain retail activities of soaps, detergents, polishing products and the like.'),
(204, 1, 7, 'Climbing', 'Climbing', 'The instances of this class represent, among all the business activities, some mountaineering activities.'),
(205, 1, 7, 'Clothing', 'Clothing', 'The instances of this class represent, among all the business activities, some clothing retail business.'),
(206, 1, 7, 'Clothing_accessories', 'Clothing Accessories', 'The instances of this class represent, among all business activities, certain retail activities of hats, umbrellas, gloves and ties.'),
(207, 1, 7, 'Clothing_and_linen', 'Clothing and Linen', 'The instances of this class represent, among all the business activities, certain retail trade activities of clothing, home furnishings and household linen.'),
(208, 1, 7, 'Clothing_children_and_infants', 'Clothing Children and Infants', 'The instances of this class represent, among all business activities, certain retail children\'s clothing.'),
(209, 1, 7, 'Clothing_factory_outlet', 'Clothing factory outlet', 'The instances of this class represent, among all business activities, certain activities of selling and selling outlets of clothing.'),
(210, 1, 7, 'Coast_guard_harbormaster', 'Coast guard harbormaster', 'The instances of this class represent, among all service locations, certain offices of the Coast Guard and the Harbor Captain.'),
(211, 1, 7, 'Coffee_rosters', 'Coffee Rosters', 'The instances of this class represent, among all business activities, some rotten coffee retail business.'),
(212, 1, 7, 'Coke_and_petroleum_derivatives', 'Coke and Petroleum Derivatives', 'The instances of this class represent, among all business activities, certain coke refining activities and other petroleum refining products.'),
(213, 1, 7, 'Combined_facilities_support_activities', 'Combined facilities support activities', 'The instances of this class represent, among all business activities, some integrated building management services.'),
(214, 1, 7, 'Commissariat_of_public_safety', 'Commissariat of public safety', 'The instances of this class represent, among all service locations, certain Commissariats of Public Safety.'),
(215, 1, 7, 'Community_centre', 'Community centre', 'The instances of this class represent, among all service locations, some day health care centers.'),
(216, 1, 7, 'Computer_data_processing', 'Computer data processing', 'The instances of this class represent, among all business activities, certain data bases management and electronic data processing.'),
(217, 1, 7, 'Computer_programming_and_consultancy', 'Computer programming and consultancy', 'The instances of this class include, among all business activities, certain software production activities, computer consultancy activities, configuration and management of facilities and computer equipment, and other IT related services.'),
(218, 1, 7, 'Computer_systems', 'Computer Systems', 'The instances of this class represent, among all business activities, certain retail business of computers, peripherals, software and office equipment in specialized stores.'),
(219, 1, 7, 'Computer_technician', 'Computer technician', 'The instances of this class represent, among all business activities, some repair and maintenance of computers and peripherals.'),
(220, 1, 7, 'Conservatory', 'Conservatory', 'The instances of this class represent, among all the business activities, certain activities of music conservators.'),
(221, 1, 7, 'Consulate', 'Consulate', 'The instances of this class represent, among all service locations, some foreign consulates in Italy.'),
(222, 1, 7, 'Consulting_services', 'Consulting services', 'The instances of this class represent, among all business activities, certain consulting activities in general, for example in the field of safety, hygiene, agriculture and so on.'),
(223, 1, 7, 'Controlled_parking_zone', 'Controlled parking zone', 'The instances of this class represent, among all service locations, certain controlled parking areas.'),
(224, 1, 7, 'Corps_of_forest_rangers', 'Corps of forest rangers', 'The instances of this class represent, among all service locations, certain sites of the Corp of Forest Rangers.'),
(225, 1, 7, 'Courier', 'Courier', 'The instances of this class represent, among all business activities, certain postal and courier activities on which no universal service obligation is involved (a statutory obligation to guarantee a minimum level of service to be rendered to all The affected user).'),
(226, 1, 7, 'Credit_collection_agencies', 'Credit collection agencies', 'The instances of this class represent, among all business activities, certain activities of credit recovery agencies.'),
(227, 1, 7, 'Crop_animal_production_hunting', 'Crop Animal Production Hunting', 'The instances of this class represent, among all business activities, certain agricultural production activities, processing of animal products, hunting, and other related activities.'),
(228, 1, 7, 'Crop_production', 'Crop Production', 'The instances of this class represent, among all the business activities, certain cultivation activities.'),
(229, 1, 7, 'CulturalActivity', 'Cultural Activity', 'Libraries, archives, museums and other cultural activities.'),
(230, 1, 7, 'Cultural_and_recreation_goods', 'Cultural and Recreation Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of cultural and recreational items in specialized stores.'),
(231, 1, 7, 'Cultural_centre', 'Cultural centre', 'The instances of this class represent, among all service locations, certain centers of cultural activity.'),
(232, 1, 7, 'Cultural_education', 'Cultural education', 'The instances of this class represent, among all business activities, some centers of cultural formation.'),
(233, 1, 7, 'Cultural_sites', 'Cultural sites', 'The instances of this class represent, among all business activities, certain activities of libraries, archives, museums and other places of culture.'),
(234, 1, 7, 'Curtains_and_net_curtains', 'Curtains and Net Curtains', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of curtains and curtains.'),
(235, 1, 7, 'Cycle_paths', 'Cycle paths', 'The instances of this class represent, among all service locations, certain cycling routes.'),
(236, 1, 7, 'Dairy_products', 'Dairy products', 'The demands of this class represent, among all business activities, certain retail trade activities of milk and dairy products.'),
(237, 1, 7, 'Dance_schools', 'Dance schools', 'The instances of this class represent, among all the business activities, some activities of conducting dance classes.'),
(238, 1, 7, 'Dating_service', 'Dating service', 'The instances of this class represent, among all the business activities, certain activities of marriage and meeting agencies.'),
(239, 1, 7, 'Day_care_centre', 'Day care centre', 'The instances of this class represent, among all service locations, some reception centers.'),
(240, 1, 7, 'Dentist', 'Dentist', 'The instances of this class represent, among all the business activities, some activities and services of dental surgeries.'),
(241, 1, 7, 'Department_of_motor_vehicles', 'Department of motor vehicles', 'The instances of this class represent, among all service locations, certain sites of Vehicle registration.'),
(242, 1, 7, 'Diet_products', 'Diet Products', 'The instances of this class represent, among all the business activities, some retail activities of macrobiotic and dietary products.'),
(243, 1, 7, 'DigitalLocation', 'Digital Location', 'Services classified by the city of Florence as Digital Location.'),
(244, 1, 7, 'Dining_hall', 'Dining hall', 'The instances of this class represent, among all service locations, certain canteens, not even structured in the form of a business.'),
(245, 1, 7, 'Disabled_parking_area', 'Disabled parking area', 'Ciascuna istanza di questa classe rappresenta un\'area di sosta riservata alle persone con ridotte capacità motorie.'),
(246, 1, 7, 'Discotheque', 'Discotheque', 'The instances of this class represent, among all the business activities, some activities of discos, ballrooms, nightclubs and the like.'),
(247, 1, 7, 'Discount', 'Discount', 'The instances of this class represent, among all business activities, some food discount activities.'),
(248, 1, 7, 'Disinfecting_and_exterminating_activities', 'Disinfecting and exterminating activities', 'The instances of this class represent, among all the business activities, certain disinfestation services.'),
(249, 1, 7, 'District', 'District', 'Class whose instances are the various neighborhoods in which a city can be subdivided.'),
(250, 1, 7, 'Diving_school', 'Diving school', 'The instances of this class represent, among all service locations, some diving schools.'),
(251, 1, 7, 'Doctor_office', 'Doctor office', 'The instances of this class represent, among all business activities, certain services of general medical practice.'),
(252, 1, 7, 'Dog_area', 'Dog area', 'Each instance of this class represents an area reserved for dog breeding.'),
(253, 1, 7, 'Door_to_door', 'Door to Door', 'The instances of this class represent, among all the business activities, certain retail activities of various products, by the intervention of a demonstrator or a sales agent (door to door).'),
(254, 1, 7, 'Drinking_fountain', 'Drinking fountain', 'The instances of this class represent, among all service locations, some drinking water fountains.'),
(255, 1, 7, 'EarthQuakeEvent', 'Earthquake', 'Each instance of this class represents an earthquake that affected the territory covered by the Km4City project.'),
(256, 1, 7, 'EducationAndResearch', 'EducationAndResearch', 'Services such as schools for all ages and training schools.'),
(257, 1, 7, 'Educational_support_activities', 'Educational support activities', 'The instances of this class include, among all business activities, certain education and training services, including counseling and school counseling services.'),
(258, 1, 7, 'Emergency', 'Emergency', 'Contiene tutte le classi relative ai servizi di emergenza'),
(259, 1, 7, 'Emergency_medical_care', 'Emergency medical care', 'The instances of this class include, among all business activities, certain health emergency services, blood banks, and others.'),
(260, 1, 7, 'Emergency_services', 'Emergency services', 'The instances of this class represent, among all service locations, certain roadside assistance services.'),
(261, 1, 7, 'Employment_exchange', 'Employment exchange', 'The instances of this class represent, among all service locations, some employment centers.'),
(262, 1, 7, 'Energy_supply', 'Energy Supply', 'The instances of this class represent, among all the business activities, certain activities of production, distribution, and trade in electricity and fuels.'),
(263, 1, 7, 'Engineering_consulting', 'Engineering consulting', 'The instances of this class represent, among all the business activities, certain activities of engineering studies.'),
(264, 1, 7, 'Entertainment', 'Entertainment', 'Entertainment services for the citizen.'),
(265, 1, 7, 'Entry', 'Entry', 'Classe le cui istanze sono i possibili ingressi ai numeri civici'),
(266, 1, 7, 'EntryRule', 'Entry Rule', 'Class whose instances are the rules of access to the different road elements.'),
(267, 1, 7, 'Environment', 'Environment', 'Environmentally friendly services.'),
(268, 1, 7, 'Equipment_for_events_and_shows_rental', 'Equipment for events and shows rental', 'The instances of this class represent, among all the business activities, some rental activities of facilities and equipment for events and shows.'),
(269, 1, 7, 'Estate_activities', 'Estate activities', 'The instances of this class represent, among all the business activities, certain leasing, sale, management and administration of real estate also for third parties.'),
(270, 1, 7, 'Event', 'Event', 'Events scheduled by the city of Florence and dusk.'),
(271, 1, 7, 'Extraction_of_natural_gas', 'Extraction of natural gas', 'The instances of this class represent, among all business activities, certain natural gas extraction activities.'),
(272, 1, 7, 'Extraction_of_salt', 'Extraction of salt', 'The instances of this class represent, among all the business activities, some salt extraction activities.'),
(273, 1, 7, 'Family_counselling', 'Family counselling', 'The instances of this class represent, among all service locations, some family counselors.'),
(274, 1, 7, 'Farm_house', 'Farm house', 'The cases of this class represent, among all the commercial activities, some activities of the hotel tourist residence.'),
(275, 1, 7, 'Fast_charging_station', 'Fast charging station', NULL),
(276, 1, 7, 'Ferry_stop', 'Ferry stop', 'The instances of this class are each a liner ferry port.'),
(277, 1, 7, 'FinancialService', 'Financial Service', 'Banks, monetary institutions and other financial services.'),
(278, 1, 7, 'Financial_institute', 'Financial institute', 'The instances of this class represent, among all business activities, certain financial services.'),
(279, 1, 7, 'Fine_arts_articles', 'Fine Arts Articles', 'The instances of this class represent, among all the business activities, certain retail activities of fine arts articles.'),
(280, 1, 7, 'Fire_brigade', 'Fire brigade', 'The instances of this class represent, among all service locations, certain fire brigades.'),
(281, 1, 7, 'First_aid', 'First aid', 'The instances of this class represent, among all service locations, some places of First Aid.'),
(282, 1, 7, 'First_aid_state', 'First Aid state', 'Each instance of this class represents a snapshot of how many people are, at a certain point in time, within a certain point of First Aid, in a certain condition, subdivided according to the urgency code assigned to them . The possible conditions in which a person who is in First Aid may be: destination, waiting, visiting, temporary observation. However, some instances report the total count, without taking into account the condition in which the different people are. In this case, the firstAidState property is valorized to \"Totali\".'),
(283, 1, 7, 'Fish_and_seafood', 'Fish and Seafood', 'The instances of this class represent, among all business activities, certain retail trade of fish, crustaceans and molluscs.'),
(284, 1, 7, 'Fishing_and_aquaculture', 'Fishing and Aquaculture', 'The instances of this class represent, among all business activities, certain fishing and aquaculture activities.'),
(285, 1, 7, 'Fishing_reserve', 'Fishing reserve', 'The instances of this class represent, among all service locations, some fishing reserves.'),
(286, 1, 7, 'Flight_companies', 'Flight Companies', 'The instances of this class represent, among all business activities, certain passenger liner air transport activities.'),
(287, 1, 7, 'Flower_shop', 'Flower shop', 'The instances of this class represent, among all the business activities, certain flower retail activities.'),
(288, 1, 7, 'Food_and_ice_cream_truck', 'Food and Ice Cream Truck', 'The instances of this class represent, among all the business activities, certain icecream, pastry and catering activities.'),
(289, 1, 7, 'Food_and_tobacconist', 'Food and Tobacconist', 'The instances of this class represent, among all business activities, certain retail activities of certain foodstuffs, beverages and tobacco.'),
(290, 1, 7, 'Food_manufacture', 'Food Manufacture', 'The instances of this class represent, among all business activities, certain industrial food production activities.'),
(291, 1, 7, 'Food_trade', 'Food trade', 'Each instance of this class represents a food resale activity.'),
(292, 1, 7, 'Footwear_and_accessories', 'Footwear and Accessories', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and accessories.'),
(293, 1, 7, 'Footwear_and_leather_goods', 'Footwear and Leather Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and leather goods.'),
(294, 1, 7, 'Footwear_factory_outlet', 'Footwear factory outlet', 'The instances of this class represent, among all the business activities, certain activities of selling footwear in shops and outlets.'),
(295, 1, 7, 'Footwear_manufacture', 'Footwear Manufacture', 'The instances of this class represent, among all the business activities, certain footwear manufacturing and leather footwear manufacturing activities.'),
(296, 1, 7, 'Forest', 'Forest', 'Each instance of this class represents a forest.'),
(297, 1, 7, 'Forestry', 'Forestry', 'The instances of this class represent, among all the business activities, certain forestry activities and use of forest areas.'),
(298, 1, 7, 'Freight_transport_and_furniture_removal', 'Freight Transport and Furniture Removal', 'The instances of this class represent, among all business activities, certain removal and cargo transport services on the road.'),
(299, 1, 7, 'Fresh_place', 'Fresh place', 'Places where you can sit in air conditioning during the summer.'),
(300, 1, 7, 'Frozen_food', 'Frozen Food', 'The instances of this class represent, among all business activities, certain retail trade activities of frozen products.'),
(301, 1, 7, 'Fruit_and_vegetables', 'Fruit and Vegetables', 'The instances of this class represent, among all business activities, certain fruit and vegetable retail activities.'),
(302, 1, 7, 'FuelStationObservation', 'Fuel station observation', 'Each instance of this class represents a state of a fuel distributor at a given instant.'),
(303, 1, 7, 'Fuel_station', 'Fuel station', 'The instances of this class represent, among all business activities, certain retail trade activities of automotive fuel.'),
(304, 1, 7, 'Funeral', 'Funeral', 'The instances of this class represent, among all the business activities, some funeral activities and related services.'),
(305, 1, 7, 'Funeral_and_cemetery_articles', 'Funeral and Cemetery Articles', 'The instances of this class represent, among all business activities, certain retail trade activities of funerary and cemeteries.'),
(306, 1, 7, 'Fur_and_leather_clothing', 'Fur and Leather Clothing', 'The instances of this class represent, among all the business activities, certain activities of retail trade of fur and leather clothing.'),
(307, 1, 7, 'Gambling_and_betting', 'Gambling and betting', 'The instances of this class represent, among all business activities, certain activities related to lotteries, betting, and gambling halls.'),
(308, 1, 7, 'Game_reserve', 'Game reserve', 'The instances of this class represent, amongst all service locations, some natural parks.'),
(309, 1, 7, 'Game_room', 'Game room', 'The instances of this class represent, among all the business activities, certain activities of playing rooms and billiards.'),
(310, 1, 7, 'Games_and_toys', 'Games and toys', 'The instances of this class represent, among all business activities, certain retail activities of games and toys (including electronic ones).'),
(311, 1, 7, 'Garden_and_agriculture', 'Garden and Agriculture', 'The instances of this class represent, among all business activities, certain retail trade activities of machinery, equipment and products for agriculture and gardening.'),
(312, 1, 7, 'Gardens', 'Gardens', 'The instances of this class represent, among all service locations, some parks and gardens.'),
(313, 1, 7, 'Geologists', 'Geologists', 'The instances of this class represent, among all business activities, certain geological and geo-survey and mining research activities.'),
(314, 1, 7, 'Gifts_and_smoking_articles', 'Gifts and Smoking Articles', 'The instances of this class represent, among all the business activities, certain activities of retail trade of gift items and smokers.'),
(315, 1, 7, 'Golf', 'Golf', 'The instances of this class represent, among all service locations, some golf courses.'),
(316, 1, 7, 'GoodsYard', 'Goods Yard', 'Goods Scale, are located at railway junctions with 1:1 ratio.'),
(317, 1, 7, 'GovernmentOffice', 'Government Office', 'Government offices open to the public.'),
(318, 1, 7, 'Green_areas', 'Green areas', 'The instances of this class represent, among all service locations, some green areas.'),
(319, 1, 7, 'Grill', 'Grill', 'Each instance of this class represents a rotisserie.'),
(320, 1, 7, 'Group_practice', 'Group practice', 'Each instance of this class represents an health centre.'),
(321, 1, 7, 'Gym_fitness', 'Gym fitness', 'The instances of this class represent, among all the business activities, some gym management activities.'),
(322, 1, 7, 'Haberdashery', 'Haberdashery', 'The instances of this class represent, among all the business activities, certain retail trade activities of knitting and knitting yarns.'),
(323, 1, 7, 'Haircare_centres', 'Haircare centres', 'The instances of this class represent, among all business activities, certain activities of trichological surgeries.'),
(324, 1, 7, 'Hairdressing', 'Hairdressing', 'The demands of this class represent, among all the business activities, certain services of barber and hairdresser salons.'),
(325, 1, 7, 'Hairdressing_and_beauty_treatment', 'Hairdressing and beauty treatment', 'The instances of this class represent, among all the business activities, certain services of hairdressers, manicures, pedicures and aesthetic treatments.'),
(326, 1, 7, 'Hardware_electrical_plumbing_and_heating', 'Hardware Electrical Plumbing and Heating', 'The instances of this class represent, among all business activities, certain retail trade of hardware, paints, flat glass and electrical and plumbing plumbing.'),
(327, 1, 7, 'Hardware_paints_and_glass', 'Hardware Paints and Glass', 'The instances of this class represent, among all the business activities, certain retail trade of hardware, paints, flat glass and building materials.'),
(328, 1, 7, 'HealthCare', 'Health Care', 'Hospitals, medical studios, analysis laboratories and other facilities providing health services.'),
(329, 1, 7, 'Health_district', 'Health district', 'The instances of this class represent, among all service locations, certain health districts.'),
(330, 1, 7, 'Health_reservations_centre', 'Health reservations centre', 'The instances of this class represent, among all service locations, certain single reservation centers established at health districts.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(331, 1, 7, 'Healthcare_centre', 'Healthcare centre', 'The instances of this class represent, among all service locations, certain health care centers established at health districts.'),
(332, 1, 7, 'Helipads', 'Helipads', 'The instances of this class represent, among all service locations, some hills.'),
(333, 1, 7, 'Herbalists_shop', 'Herbalist\'s Shop', 'The instances of this class represent, among all the business activities, some herbalists.'),
(334, 1, 7, 'Higher_education', 'Higher education', 'The instances of this class represent, among all business activities, some university and non-university post-secondary training centers.'),
(335, 1, 7, 'Highway_stop', 'Highway stop', 'The instances of this class represent, among all business activities, certain service areas along the main road arteries.'),
(336, 1, 7, 'Hippodrome', 'Hippodrome', 'The instances of this class represent, among all service locations, some racecourses.'),
(337, 1, 7, 'Historic_residence', 'Historic residence', 'The instances of this class represent, among all service locations, some historic residences that offer accommodation services.'),
(338, 1, 7, 'Historical_buildings', 'Historical buildings', 'The instances of this class represent, among all the service venues, some historic buildings.'),
(339, 1, 7, 'Holiday_village', 'Holiday village', 'The instances of this class represent, among all business activities, some holiday accommodation and other short-term accommodation, including resorts.'),
(340, 1, 7, 'Hostel', 'Hostel', 'The instances of this class represent, among all business activities, some youth hostels.'),
(341, 1, 7, 'Hotel', 'Hotel', 'The instances of this class represent, among all business activities, certain hotels and similar structures.'),
(342, 1, 7, 'Household_appliances_shop', 'Household appliances shop', 'The instances of this class represent, among all business activities, some retail trade of household appliances in specialized stores.'),
(343, 1, 7, 'Household_articles', 'Household Articles', 'The instances of this class represent, among all business activities, certain retail activities of certain household items.'),
(344, 1, 7, 'Household_fuel', 'Household Fuel', 'The instances of this class represent, among all business activities, certain retail trade activities of domestic and heating fuel.'),
(345, 1, 7, 'Household_furniture', 'Household Furniture', 'The instances of this class represent, among all the business activities, some retail business of home furniture.'),
(346, 1, 7, 'Household_products', 'Household Products', 'The instances of this class represent, among all business activities, certain retail activities of certain domestic products in specialized stores.'),
(347, 1, 7, 'Household_utensils', 'Household Utensils', 'The instances of this class represent, among all business activities, certain retail trade activities of household utensils, glassware and pottery.'),
(348, 1, 7, 'Human_health_activities', 'Human health activities', 'The instances of this class represent, among all business activities, certain health care activities.'),
(349, 1, 7, 'Hunting_trapping_and_services', 'Hunting Trapping and Services', 'The instances of this class represent, among all business activities, some hunting, animal trapping and related services.'),
(350, 1, 7, 'HydrometryObservation', 'Hydrometry observation', 'Each instance of this class represents a hydrometric detection.'),
(351, 1, 7, 'HygrometryObservation', 'Hygrometry observation', 'Each instance of this class represents a hygrometric detection.'),
(352, 1, 7, 'Hypermarket', 'Hypermarket', 'The instances of this class represent, among all business activities, some hypermarkets.'),
(353, 1, 7, 'ICQAAgglomeration', 'Air Quality Criticality Index agglomeration', 'Each instance of this class represents an agglomeration (suitably delimited geographical area) defined for air quality monitoring through the ICQA index, introduced by the Tuscany Region, Italy, in August 2016.'),
(354, 1, 7, 'ICQAObservation', 'ICQA Observation', 'Each instance of this class represents an air quality detection on an agglomeration.'),
(355, 1, 7, 'Ice_cream_parlour', 'Ice cream parlour', 'The instances of this class represent, among all business activities, some ice cream parlors and pastry shops.'),
(356, 1, 7, 'Ict_service', 'ICT service', 'The instances of this class represent, among all business activities, certain data processing, hosting and related activities, web portals, and other information service activities.'),
(357, 1, 7, 'Income_revenue_authority', 'Income revenue authority', 'The instances of this class represent, among all service locations, certain offices of the Revenue Agency.'),
(358, 1, 7, 'Industrial_laundries', 'industrial laundries', 'The instances of this class represent, among all the business activities, certain activities of industrial laundries.'),
(359, 1, 7, 'IndustryAndManufacturing', 'Industry and manufacturing', 'Services related to industry and work.'),
(360, 1, 7, 'Installation_of_industrial_machinery', 'Installation of Industrial Machinery', 'The instances of this class represent, among all the business activities, certain activities for the installation of industrial and medical equipment, such as: installation of electrical and electronic equipment for telecommunications and radio transmitting equipment; installation of instruments, apparatus for measuring, checking, testing, navigation and the like; installation of office machines, mainframes and similar computers; installation of other machines and industrial equipments; installation of motors, generators and transformers, electricity distribution and control equipment; installation of medical devices; installation of appliances and instruments for odontology; installation of motors, generators and transformers, electrical distribution and control equipment.'),
(361, 1, 7, 'Insurance', 'Insurance', 'The instances of this class include, among all business activities, certain insurance, agents, sub agents, brokers and other intermediaries, including for the purpose of opening pension funds and life insurance.'),
(362, 1, 7, 'Insurance_and_financial', 'Insurance and financial', 'The instances of this class represent, among all business activities, some auxiliary activities in financial services and insurance activities.'),
(363, 1, 7, 'Internet_point_and_public_telephone', 'Internet Point and Public Telephone', 'The instances of this class represent, among all business activities, certain activities of public telephone and Internet Point.'),
(364, 1, 7, 'Internet_service_provider', 'Internet Service Provider', 'The instances of this class represent, among all business activities, certain Internet access services.'),
(365, 1, 7, 'Investigation_activities', 'Investigation activities', 'The instances of this class represent, among all business activities, certain private investigation services.'),
(366, 1, 7, 'Irrigator', 'Irrigator', 'Each instance of this class represents an irrigator.'),
(367, 1, 7, 'Italian_finance_police', 'Italian finance police', 'The instances of this class represent, among all service locations, certain offices of the Italian financial police.'),
(368, 1, 7, 'Jeweller', 'Jeweller', 'The instances of this class represent, among all the business activities, certain remaking of watches and jewelery.'),
(369, 1, 7, 'Jewellery', 'Jewellery', 'The instances of this class represent, among all business activities, certain retail activities of watches, jewelery and silverware.'),
(370, 1, 7, 'Journalist', 'Journalist', 'The instances of this class represent, among all the business activities, certain activities of independent journalists.'),
(371, 1, 7, 'Junction', 'Junction', 'An interconnection point between road segments to draw a RoadElement.'),
(372, 1, 7, 'Knitted_manufacture', 'Knitted Manufacture', 'The instances of this class represent, among all the business activities, certain knitting, knitwear, jerseys, cardigans and other knitwear items.'),
(373, 1, 7, 'Labour_consultant', 'Labour consultant', 'The instances of this class represent, among all the business activities, certain activities of job counselors.'),
(374, 1, 7, 'Land_transport', 'Land Transport', 'The instances of this class represent, among all business activities, certain terrestrial passenger transport activities, and in particular: taxi transport, car hire with driver; terrestrial passenger transport in urban and suburban areas; terrestrial transport and transport by means of pipelines; other terrestrial passenger transport activities.'),
(375, 1, 7, 'Land_transport_rental', 'Land-transport rental', 'The instances of this class represent, among all business activities, certain rental activities of certain land transport vehicles.'),
(376, 1, 7, 'Landscape_care', 'Landscape care', 'The instances of this class represent, among all business activities, some landscape care and maintenance activities (including parks, gardens and flowerbeds).'),
(377, 1, 7, 'Language_courses', 'Language courses', 'The instances of this class represent, among all business activities, some activities of language courses by anyone organized, and language schools.'),
(378, 1, 7, 'Laundries_and_dry_cleaners', 'laundries and dry cleaners', 'The instances of this class represent, among all the business activities, some laundry and cleaning of textile and fur items.'),
(379, 1, 7, 'Leasing_of_intellectual_property', 'Leasing of intellectual property', 'The instances of this class represent, among all business activities, certain activities of granting intellectual property rights and similar products (excluding works protected by copyright).'),
(380, 1, 7, 'Leather_manufacture', 'Leather Manufacture', 'The instances of this class represent, among all the business activities, certain activities of making leather goods and the like.'),
(381, 1, 7, 'Legal_office', 'Legal office', 'The instances of this class represent, among all the business activities, certain activities of law firms and accounting.'),
(382, 1, 7, 'Library', 'Library', 'The instances of this class represent, among all the business activities, some library and archive activities.'),
(383, 1, 7, 'Lifting_and_handling_equipment_rental', 'Lifting and handling equipment rental', 'The instances of this class represent, among all business activities, certain rental activities without a lifting and handling equipment operator.'),
(384, 1, 7, 'Lighting', 'Lighting', 'The instances of this class represent, among all the business activities, certain retail activities of lighting articles.'),
(385, 1, 7, 'Literary_cafe', 'literary cafe', 'Each instance of this class represents a literary café.'),
(386, 1, 7, 'Local_health_authority', 'Local health authority', 'The instances of this class represent, among all service locations, some local health companies.'),
(387, 1, 7, 'Local_police', 'Local police', 'The instances of this class represent, among all service locations, some Local Police Offices.'),
(388, 1, 7, 'Logistics_activities', 'Logistics Activities', 'The instances of this class represent, among all business activities, certain activities related to handling and storage of goods, and in particular: logistical services relating to the distribution of goods; freight forwarders and customs agency agencies; transport intermediaries.'),
(389, 1, 7, 'Lot', 'TPL Lot', 'TPL line set, locally identifiable as a lot.'),
(390, 1, 7, 'Machinery_and_equipment_rental', 'Machinery and Eequipment Rental', 'The instances of this class represent, among all the business activities, certain rental activities of certain machines and equipment for professional use, and in particular: rental of machines and equipment for construction work and civil engineering; hire of office machinery and equipment (including computers); rental of agricultural machinery and equipment; hire of other machines, equipment and material assets, without operator.'),
(391, 1, 7, 'Machinery_repair_and_installation', 'Machinery Repair and Installation', 'The instances of this class represent, among all business activities, some repair and maintenance activities for both professional and domestic equipment.'),
(392, 1, 7, 'Maintenance_repair_of_motor_vehicles', 'Maintenance Repair of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain repair and maintenance activities for motor vehicles, in particular: mechanical repairs of motor vehicles; repair of carrozzerie of cars; repair of electrical installations and of alimentacion for cars; repair and replacement of tires for cars; maintenance and repair of cars; other attivita \'of maintenance and of repair of cars.'),
(393, 1, 7, 'Maintenance_repair_of_motorcycles', 'Maintenance Repair of Motorcycles', 'The instances of this class represent, among all business activities, some maintenance and repair activities on motorcycles and mopeds (including tires).'),
(394, 1, 7, 'Management_consultancy', 'Management consultancy', 'The instances of this class represent, among all the business activities, certain entrepreneurial consultancy activities, and in particular: public relations and communication; certain entrepreneurial and administrative-management consultancy activities; certain business planning activities; holdings of the holdings engaged in operating activities (holding companies); management consultancy activities; consultancy services for the management of company logistics; business management and management consulting.'),
(395, 1, 7, 'Maneuver', 'Maneuver', 'Class whose instances are the possible maneuvers that can be made on a road element.'),
(396, 1, 7, 'Manicure_and_pedicure', 'Manicure and pedicure', 'The instances of this class represent, among all business activities, certain manicure and pedicure services.'),
(397, 1, 7, 'Manufacture_of_basic_metals', 'Manufacture of Basic Metals', 'The instances of this class represent, among all the business activities, certain metalworking activities, and in particular: manufacture of precious and semi-finished metals; casting of cast iron and production of cast iron pipes and fittings; casting steel; manufacture of iron, steel and ferroleghe; cold ironing of bars; melting of light metals; foundries; manufacture of pipes, ducts, cable profiles and related accessories in steel (excluding those cast-iron); production of lead, zinc and pond and semilavorati; production of other metals non ferrosi and semilavorati; fusion of certain non-ferrous metals; cold rolling of strips; production of precious metal base and other non-ferrous metals; treatment of nuclear fuels; copper and semi-finished products; manufacture of certain products of the first steel processing; cold drawing; production of aluminum and semilavorati; manufacture of iron, steel and ferroleghe; certain other metallurgical activities; certain other steelworks.'),
(398, 1, 7, 'Manufacture_of_chemicals_products', 'Manufacture of Chemicals Products', 'The claims of this class represent, among all the business activities, certain chemical production activities, and in particular by way of example: industrial gases, perfumes, cosmetics, soaps, surfactant organic agents, polishing products, fertilizers, Nitrogen compounds, chemical treatment of fatty acids, plastics, synthetic rubber, glues, paints, varnishes, enamels, printing inks, mastics, fibers, photographic products, essential oils, chemicals for agriculture, fertilizers.'),
(399, 1, 7, 'Manufacture_of_clay_and_ceramic', 'Manufacture of Clay and Ceramic', 'The instances of this class represent, among all the business activities, certain brickwork, tiles, other terracotta materials for building, ceramics, porcelain.'),
(400, 1, 7, 'Manufacture_of_electrical_equipment', 'Manufacture of Electrical Equipment', 'The instances of this class represent, among all the business activities, certain manufacturing of electrical and electronic components and equipment, such as: motors, generators and transformers; equipment for distribution and control of electricity; electrical and lighting equipment; wiring harness; electric capacitors, resistors, capacitors and the like, accelerators; electrical signs and signaling electrical equipment; lighting and signaling equipment for means of transport; home appliances; non-electric household appliances; electrical equipment for welding and brazing; wires and cables, electrical and electronic; battery batteries and electrical accumulators.'),
(401, 1, 7, 'Manufacture_of_electronic_products', 'Manufacture of Electronic Products', 'The instances of this class represent, among all the business activities, certain manufacturing of electronic equipment and components, such as: irradiation equipment, electromedical and electrotherapeutic equipment; apparatus for the reproduction and recording of sound and images; computers and peripheral units; electronic components and electronic boards; magnetic and optical supports; radio and television transmitting equipment (including cameras); watches; certain measuring and regulating apparatus for meters of electricity, gas, water and other liquids, precision analytical scales (including stapled parts and accessories); electrical and electronic equipment for telecommunications; assembled electronic boards; optical elements and optical precision instruments; electrical and electronic equipment for telecommunications; manufacture of instruments and apparatus for measuring, testing and navigation (other than optical); optical instruments and photographic and cinematographic equipment; anti-theft and fire-fighting systems; tools for hydrology, geophysics and meteorology.'),
(402, 1, 7, 'Manufacture_of_furniture', 'Manufacture of Furniture', 'The instances of this class represent, among all the business activities, certain furniture manufacturing and furnishing, such as: office furniture and shops; armchairs and sofas; furniture finishing; furniture for domestic furniture; parts and accessories of furniture; kitchen furniture; mattresses; some chairs and seats.'),
(403, 1, 7, 'Manufacture_of_glass', 'Manufacture of Glass', 'The instances of this class represent, among all the business activities, certain manufacturing, processing and processing of flat, cable and artistic glass products.'),
(404, 1, 7, 'Manufacture_of_jewellery_bijouterie', 'Manufacture of Jewellery Bijouterie', 'The instances of this class represent, among all the business activities, certain jewelry manufacturing, jewelery, precious stones and coins.'),
(405, 1, 7, 'Manufacture_of_machinery_and_equipment', 'Manufacture of Machinery and Equipment', 'The instances of this class represent, among all business activities, certain machine manufacturing activities, including, for example: household appliances; conditioners; purifiers; industrial machinery for the food industry; machinery for laundries; machinery for the plastics and rubber industry; machinery for printing and binding; machinery for lifting and handling of goods; pumps; machinery for mines, quarries, construction sites; machinery for the textile industry; machinery for the paper industry; furnaces, furnaces, burners; leather processing machines; heating systems; machines for the agriculture, the silvicoltura and the zootecnia; office machinery and equipment; cartridges and toners; elevators, hoists, escalators; turbines; equipment for beauty salons.'),
(406, 1, 7, 'Manufacture_of_motor_vehicles', 'Manufacture of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain manufacturing of motor vehicles and trailers, bodywork and components, including electrical and electronic components.'),
(407, 1, 7, 'Manufacture_of_musical_instruments', 'Manufacture of Musical Instruments', 'The instances of this class represent, among all business activities, certain activities of making musical instruments (including parts and accessories).'),
(408, 1, 7, 'Manufacture_of_non_metallic_mineral_products', 'Manufacture of Non-Metallic Mineral Products', 'The instances of this class represent, among all business activities, certain manufacturing activities of non-metallic mineral products including abrasive products.'),
(409, 1, 7, 'Manufacture_of_paper', 'Manufacture of Paper', 'The instances of this class represent, among all the business activities, certain paper and paper making activities.'),
(410, 1, 7, 'Manufacture_of_paper_products', 'Manufacture of Paper Products', 'The instances of this class represent, among all the business activities, certain activities of making paper products, and in particular: corrugated paper and paperboard and paper and board packaging (other than paperboard); Articles of paper and cartone; Paper products; Sanitary and household products in paper and cellulose wadding.'),
(411, 1, 7, 'Manufacture_of_pharmaceutical_products', 'Manufacture of Pharmaceutical Products', 'The instances of this class represent, among all the business activities, certain pharmaceutical manufacturing and pharmaceutical preparations.'),
(412, 1, 7, 'Manufacture_of_plastics_products', 'Manufacture of Plastics Products', 'The instances of this class represent, among all the business activities, certain plastic products manufacturing activities, such as: plastic articles for the building; plastic parts for footwear; sheets, sheets, tubes and profilati in plastic materials; doors, windows, plastic frames; office items and plastic school.'),
(413, 1, 7, 'Manufacture_of_refined_petroleum_products', 'Manufacture of Refined Petroleum Products', 'The instances of this class represent, among all business activities, certain petroleum refining activities, and in particular: preparation or mixing of petroleum derivatives (excluding petrochemicals), manufacture of bitumen, tar and binder emulsions for use road mixing of liquefied petroleum gas (GPL) and bottling them.'),
(414, 1, 7, 'Manufacture_of_refractory_products', 'Manufacture of Refractory Products', 'The instances of this class represent, among all business activities, certain refractory products manufacturing.'),
(415, 1, 7, 'Manufacture_of_rubber_and_plastics_products', 'Manufacture of Rubber and Plastics Products', 'The instances of this class represent, among all the business activities, certain manufacturing of rubber articles and plastics.'),
(416, 1, 7, 'Manufacture_of_rubber_products', 'Manufacture of Rubber Products', 'The instances of this class represent, among all the business activities, certain manufacturing activities of rubber products, including in particular: rubber soles and other rubber parts for footwear; manufacture of tires and air chambers; regeneration and reconstruction of tires.'),
(417, 1, 7, 'Manufacture_of_sports_goods', 'Manufacture of Sports Goods', 'The instances of this class represent, among all the business activities, certain activities in the manufacture of sports goods.'),
(418, 1, 7, 'Manufacture_of_structural_metal_products', 'Manufacture of Structural Metal Products', 'The instances of this class represent, among all the business activities, some metal products manufacturing activities, such as: door frames and windows; gates; hinges; frames and other building elements; pots and crockery; radiators; springs; weapons and ammunition; bins and containers in general.'),
(419, 1, 7, 'Manufacture_of_textiles', 'Manufacture of textiles', 'The instances of this class represent, among all business activities, certain textile industries.'),
(420, 1, 7, 'Manufacture_of_toys_and_game', 'Manufacture of Toys and Game', 'The instances of this class represent, among all the business activities, some toys and toys manufacturing activities.'),
(421, 1, 7, 'Manufacture_of_transport_equipment', 'Manufacture of Transport Equipment', 'The instances of this class represent, among all the business activities, certain vehicle manufacturing and accessories activities, such as: accessories and parts detached for motorcycles and mopeds; ships and boats; motorcycles and motor vehicles (including engines); parts and accessories for bicycles; locomotives and other railway rolling stock, tranviario, filoviario, for metropolitane and for mines; bicycles; buildings metalliche and no metalliche in cantieri naval; aircraft, spacecraft and related devices; invalid vehicles (including parts and accessories).'),
(422, 1, 7, 'Manufacture_of_travel_articles', 'Manufacture of Travel Articles', 'The instances of this class represent, among all the business activities, certain activities of making travel articles, handbags and the like, leather goods and saddlery, whips and shawls for riding.'),
(423, 1, 7, 'Manufacture_of_wearing_apparel', 'Manufacture of Wearing Apparel', 'The instances of this class represent, among all the business activities, certain fabrication of garments, such as: leather clothing; fur coats; uniforms and work clothes; custom-made suits; shirts, shirts, underwear; sports clothing and technical clothing in general.'),
(424, 1, 7, 'Manufacture_of_wood', 'Manufacture of Wood', 'The instances of this class represent, among all the business activities, certain activities of the wood and wood and cork products industry, and are involved in the manufacture of straw articles and other plaiting products.'),
(425, 1, 7, 'Manufacture_of_wood_products', 'Manufacture of Wood Products', 'The instances of this class represent, among all the business activities, certain wood products production activities, such as: building materials; picture frames; packaging; fixtures; cork products, straw, and other weaving materials; wood panels; parquet.'),
(426, 1, 7, 'Marina', 'Marina', 'Each instance of this class represents a marina.'),
(427, 1, 7, 'Market_polling', 'Market polling', 'The instances of this class represent, among all the business activities, certain activities specializing in market research and opinion polls.'),
(428, 1, 7, 'Materials_recovery', 'Materials Recovery', 'The instances of this class represent, among all business activities, certain recycling and waste disposal activities, such as: recovery and preparation for recycling waste and scrap metal; recovery and preparation for the recycling of solid urban waste, industrial and biomass; recovery and preparation for the recycling of plastic material for the production of plastic raw materials, synthetic resins; demolition of carcasses.'),
(429, 1, 7, 'Meat_and_poultry', 'Meat and Poultry', 'The instances of this class represent, among all business activities, certain retail trade activities of meat and meat products.'),
(430, 1, 7, 'Mechanic_workshop', 'Mechanic Workshop', 'The instances of this class represent, among all the business activities, some workshop activities.'),
(431, 1, 7, 'Medical_analysis_laboratories', 'Medical analysis laboratories', 'The instances of this class represent, among all business activities, some clinical analysis laboratories, radiographic laboratories and other image diagnostic centers.'),
(432, 1, 7, 'Medical_and_orthopaedic_goods', 'Medical and Orthopaedic Goods', 'The instances of this class represent, among all the business activities, certain retail activities of medical and orthopedic articles.'),
(433, 1, 7, 'Mental_health_centre', 'Mental health centre', 'The instances of this class represent, among all service locations, certain centers of mental health.'),
(434, 1, 7, 'Milestone', 'milestone mileage', 'Classe le cui istanze sono i cippi chilometrici che si trovano lungo le principali strade'),
(435, 1, 7, 'Minimarket', 'Minimarket', 'The instances of this class represent, among all business activities, certain activities of minimarkets and other non-specialized foodstuffs.'),
(436, 1, 7, 'MiningAndQuarrying', 'Mining and quarrying', 'Services related to mining and quarrying.'),
(437, 1, 7, 'Mining_of_metal_ores', 'Mining of metal ores', 'The instances of this class represent, among all the business activities, certain activities of extraction of metallic minerals.'),
(438, 1, 7, 'Mining_support_services', 'Mining Support Services', ''),
(439, 1, 7, 'MobilityEvent', 'Mobility event', 'Each instance of this class represents an event that has had repercussions on the viability of the territory covered by the Km4City project, such as a road accident, a loss of cargo, a roadway restriction, a flood, a work deviation.'),
(440, 1, 7, 'Monument_location', 'Monument location', 'The instances of this class represent, among all business activities, some management of historical sites and monuments and similar attractions.'),
(441, 1, 7, 'Motion_picture_and_television_programme_activities', 'Motion picture and television programme activities', 'The instances of this class represent, among all the business activities, certain activities of production, post-production and film distribution, video and television programs.'),
(442, 1, 7, 'Motor_vehicles_wholesale_and_retail', 'Motor Vehicles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motor vehicles and brokerage in the sale of motor vehicles.'),
(443, 1, 7, 'Motorcycles_parts_wholesale_and_retail', 'Motorcycles Parts Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycle and moped parts and accessories, and brokering in the sale of parts and accessories for motorcycles and mopeds.'),
(444, 1, 7, 'Motorcycles_wholesale_and_retail', 'Motorcycles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycles, mopeds and their parts and accessories, and certain brokering activities in the sale of motorcycles, mopeds and parts thereof and accessories.'),
(445, 1, 7, 'Mountain_shelter', 'Mountain shelter', 'The instances of this class represent, among all business activities, some mountain shelters.'),
(446, 1, 7, 'Municipality', 'Municipality Administration', 'Class whose instances are the various municipalities.'),
(447, 1, 7, 'Museum', 'Museum', 'The instances of this class represent, among all the business activities, certain activities of the museums.'),
(448, 1, 7, 'Music_and_video_recordings', 'Music and Video Recordings', 'The instances of this class represent, among all business activities, certain retail trade activities of music and video recordings.'),
(449, 1, 7, 'Musical_instruments_and_scores', 'Musical Instruments and Scores', 'The instances of this class represent, among all the business activities, certain retail activities of musical instruments and scores.'),
(450, 1, 7, 'National_park', 'National park', 'Each instance of this class represents a national park.'),
(451, 1, 7, 'Natural_reserve', 'Natural reserve', 'Each instance of this class represents a natural reserve.'),
(452, 1, 7, 'News_agency', 'News agency', 'The instances of this class represent, among all the business activities, certain activities of the press agencies.'),
(453, 1, 7, 'Newspapers_and_stationery', 'Newspapers and Stationery', 'The instances of this class represent, among all the business activities, some retail activities of newspapers, magazines, periodicals, stationery and office supplies.'),
(454, 1, 7, 'Node', 'Node', 'Class whose instances are the nodes that connect the road elements.'),
(455, 1, 7, 'Non_food_large_retailers', 'non food large retailers', 'The instances of this class represent, among all service locations, certain non-food distribution facilities.'),
(456, 1, 7, 'Non_food_products', 'Non-Food Products', 'The instances of this class represent, among all business activities, certain retail activities of certain non-food products.'),
(457, 1, 7, 'Non_specialized_wholesale_trade', 'Non-specialized Wholesale Trade', 'The instances of this class represent, among all business activities, certain non-specialized wholesale activities.'),
(458, 1, 7, 'Observation', 'Observation', 'Single sensor for observing speed, traffic, concentration, or density.'),
(459, 1, 7, 'Office_administrative_and_support_activities', 'Office administrative and support activities', 'The instances of this class represent, among all business activities, certain temporary office management and support activities that are also integrated with the work of the office.'),
(460, 1, 7, 'Office_furniture', 'Office Furniture', 'The instances of this class represent, among all the business activities, some retail activities of office furniture.'),
(461, 1, 7, 'Operation_of_casinos', 'Operation of casinos', 'The instances of this class represent, among all business activities, certain asset management activities on devices that allow coin or coin-operated cash prizes.'),
(462, 1, 7, 'Optics_and_photography', 'Optics and Photography', 'The instances of this class represent, among all business activities, certain retail trade of optical and photographic material.'),
(463, 1, 7, 'Organization_of_conventions_and_trade_shows', 'Organization of conventions and trade shows', 'The instances of this class represent, among all the business activities, certain activities of organizing conferences and fairs.'),
(464, 1, 7, 'Other_accommodation', 'Other Accommodation', 'The instances of this class represent, among all the business activities, certain activities of short-term renters, holiday houses and apartments, bed and breakfasts, residences, farm-related accommodation, student and workers accommodation with some hotel services.'),
(465, 1, 7, 'Other_broadcasting', 'Other broadcasting', 'The instances of this class represent, among all business activities, certain activities of audio-visual programming and broadcasting.'),
(466, 1, 7, 'Other_goods', 'Other Goods', 'The instances of this class represent, among all business activities, certain retail activities of certain products in specialized stores.'),
(467, 1, 7, 'Other_manufacturing', 'Other Manufacturing', ''),
(468, 1, 7, 'Other_mining_and_quarrying', 'Other mining and quarrying', 'The instances of this class represent, among all the business activities, certain mining and quarry mining activities.'),
(469, 1, 7, 'Other_office', 'Other Office', 'The instances of this class represent, among all service locations, certain public and defense administration activities and compulsory social insurance.'),
(470, 1, 7, 'Other_retail_sale', 'Other Retail Sale', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses with a prevalence of non-food products.'),
(471, 1, 7, 'Other_specialized_construction', 'Other Specialized Construction', 'The instances of this class represent, among all the business activities, certain construction activities, including, for example: steam cleaning, sandblasting and similar activities for exterior walls of buildings; building of swimming pools and other skilled works of building; non-specialized works of construction work (masons); works of completamento and of finitura of the buildings; realization of coverings; hire of cranes and other equipment with operator for construction or demolition.'),
(472, 1, 7, 'Other_specialized_wholesale', 'Other Specialized Wholesale', 'The instances of this class represent, among all business activities, certain wholesale trade activities, such as: raw textile fibers and semi-finished textiles; hardware, appliances and accessories for plumbing and heating systems; fertilizers and other chemical products for agriculture; carpet and linoleum; raw rubber, plastics in primary and semi-finished forms; chemical products; fixtures; building materials; petroleum products and lubricants for haulage, of fuels for heating; chemical products for the industry; wallpaper, colors and paints; timber, semi-finished wood and artificial wood; building materials (including sanitary fixtures); coating materials (including sanitary fixtures); metallic minerals, of ferrous metals and semi-finished products; non-ferrous metals and semi-finished products; articles of iron and of other metals; packaging; timber and construction materials, sanitary fixtures, flat glass, paints and colors; scrap and metal by-products of industrial processing; appliances and accesorios for installations of fontaneras, heating and air conditioning; non-metallic recovery materials (glass, paper, cardboard, etc.); non-metallic by-products of industrial processing (waste).'),
(473, 1, 7, 'Other_telecommunications_activities', 'Other Telecommunications Activities', 'The instances of this class represent, among all business activities, certain telecommunications and brokering activities in telecommunication and data transmission services.'),
(474, 1, 7, 'Pa', 'Public Administration', 'Municipalities, regions and provinces.'),
(475, 1, 7, 'Packaging_activities', 'Packaging activities', 'The instances of this class represent, among all the business activities, some packaging and packaging activities also on behalf of third parties.'),
(476, 1, 7, 'Paramedical_activities', 'Paramedical activities', 'The instances of this class represent, among all business activities, certain independent paramedical activities.'),
(477, 1, 7, 'Parties_and_ceremonies', 'Parties and ceremonies', 'The instances of this class represent, among all the business activities, certain activities of organizing parties and ceremonies.'),
(478, 1, 7, 'Passenger_air_transport', 'Passenger Air Transport', 'The instances of this class represent, among all business activities, certain aviation activities.'),
(479, 1, 7, 'Pastry_shop', 'Pastry shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of cakes, sweets, confectionery.'),
(480, 1, 7, 'Path', 'String Service', 'Services represented by a polygonal chain.'),
(481, 1, 7, 'Pedestrian_zone', 'pedestrian zone', 'Each instance of this class represents an area reserved for pedestrian transit.'),
(482, 1, 7, 'Performing_arts_schools', 'Performing arts schools', 'The instances of this class represent, among all business activities, certain university and post-university, academy and conservation activities.'),
(483, 1, 7, 'Perfumery_and_cosmetic_articles', 'Perfumery and Cosmetic Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of cosmetics, perfumery, herbal medicine and personal hygiene.'),
(484, 1, 7, 'Personal_and_household_goods_rental', 'Personal and household goods rental', 'The instances of this class represent, among all business activities, certain rental activities of table linen, bed linen, bath linen and household linen, in addition to other personal and household goods.'),
(485, 1, 7, 'Personal_service_activities', 'Personal service activities', 'The instances of this class represent, among all business activities, certain services for the person.'),
(486, 1, 7, 'Pet_care_services', 'Pet care services', 'The instances of this class represent, among all business activities, certain pet care services (excluding veterinary services).'),
(487, 1, 7, 'Pet_shop', 'Pet Shop', 'The instances of this class represent, among all business activities, certain pet retail activities (including articles and food).'),
(488, 1, 7, 'Petroleum_and_natural_gas_extraction', 'Petroleum and natural gas extraction', 'The instances of this class represent, among all business activities, some activities supporting the extraction of oil and natural gas.'),
(489, 1, 7, 'Pharmaceuticals', 'Pharmaceuticals', 'The instances of this class represent, among all business activities, certain retail activities of medicinal products not subject to medical prescription.'),
(490, 1, 7, 'Pharmacy', 'Pharmacy', 'The demands of this class include, among all business activities, certain pharmacy and retail trade of medicines.'),
(491, 1, 7, 'Photographic_activities', 'Photographic activities', 'The instances of this class include, among all business activities, certain photographic activities, including photographic and aerial photography activities, and development and printing activities in photographic laboratories.'),
(492, 1, 7, 'Photovoltaic_system', 'Photovoltaic system', 'Geolocation of working photovoltaic plants.'),
(493, 1, 7, 'Physical_therapy_centre', 'Physical therapy centre', 'The instances of this class represent, among all business activities, some physiotherapy activities.'),
(494, 1, 7, 'Pizzeria', 'Pizzeria', 'The instances of this class represent, among all the business activities, some pizzerias.'),
(495, 1, 7, 'Poison_control_centre', 'Poison control centre', 'The instances of this class represent, among all service locations, some anti-theft centers.'),
(496, 1, 7, 'Police_headquarters', 'Police headquarters', 'The instances of this class represent, among all service locations, certain police headquarters.'),
(497, 1, 7, 'PollenObservation', 'Pollen observation', 'Each instance of this class represents a pollutant detection at a given time and place.'),
(498, 1, 7, 'PollenTrendObservation', 'Pollen trend observation', 'Each instance of this class represents a trend of pollutants with reference to a certain place and time interval.'),
(499, 1, 7, 'Pollen_monitoring_station', 'Pollen monitoring station', 'The instances of this class each represent an allergen level detector in the air.'),
(500, 1, 7, 'Pool', 'Pool', 'The instances of this class represent, among all business activities, some pools management activities.'),
(501, 1, 7, 'Port', 'Port', 'The instances of this class represent, among all service locations, certain ports.'),
(502, 1, 7, 'Post_secondary_education', 'Post-secondary education', 'The instances of this class represent, among all business activities, certain technical higher education and training (IFTS) activities.'),
(503, 1, 7, 'Postal_and_courier_activities', 'Postal and Courier Activities', 'The instances of this class represent, among all business activities, certain postal services and courier activities.'),
(504, 1, 7, 'Postal_office', 'Postal office', 'The instances of this class represent, among all the business activities, certain postal services with universal service obligation (on which, therefore, are legal obligations to ensure a minimum level of service for all users concerned, being a service of public interest).'),
(505, 1, 7, 'Pre_primary_education', 'Pre-primary education', 'The instances of this class represent, among all business activities, preparatory education activities: children\'s schools, special schools linked to primary schools.'),
(506, 1, 7, 'Prefecture', 'Prefecture', 'The instances of this class represent, among all service locations, certain offices of the Prefecture.'),
(507, 1, 7, 'Primary_education', 'Primary education', 'The instances of this class represent, among all business activities, certain primary education activities: elementary schools.'),
(508, 1, 7, 'Printing_and_recorded_media', 'Printing and Recorded Media', 'The instances of this class represent, among all business activities, some printing and reproduction of recorded media.'),
(509, 1, 7, 'Printing_and_services', 'Printing and Services', 'The instances of this class represent, among all the business activities, certain printing and bookbinding activities with related services, and certain newspaper printing activities.'),
(510, 1, 7, 'Private_clinic', 'Private clinic', 'The instances of this class represent, among all business activities, certain private clinics.'),
(511, 1, 7, 'Private_high_school', 'Private high school', 'The instances of this class represent, among all service locations, some private high schools.'),
(512, 1, 7, 'Private_infant_school', 'Private infant school', 'The instances of this class represent, among all service locations, some private infant schools.'),
(513, 1, 7, 'Private_junior_high_school', 'Private junior high school', 'The instances of this class represent, among all service locations, some private junior high school.'),
(514, 1, 7, 'Private_junior_school', 'Private junior school', 'The instances of this class represent, among all service locations, some private junior schools.'),
(515, 1, 7, 'Private_polytechnic_school', 'Private polytechnic school', 'The instances of this class represent, among all service locations, some private technical institutes.'),
(516, 1, 7, 'Private_preschool', 'Private preschool', 'The instances of this class represent, among all service locations, certain private nurseries.'),
(517, 1, 7, 'Private_professional_institute', 'Private professional institute', 'The instances of this class represent, among all service locations, some private professional institutes.'),
(518, 1, 7, 'Private_security', 'Private security', 'The instances of this class represent, among all business activities, certain private security services.'),
(519, 1, 7, 'Province', 'Provincial Administration', 'Class whose instances are the various provinces.'),
(520, 1, 7, 'Psychologists', 'Psychologists', 'The instances of this class represent, among all the business activities, some activities carried out by psychologists.'),
(521, 1, 7, 'PublicTransportLine', 'Bus Line', 'Line of a TPL company'),
(522, 1, 7, 'Public_high_school', 'Public high school', 'The instances of this class represent, among all service locations, some public high schools.'),
(523, 1, 7, 'Public_hospital', 'Public hospital', 'The instances of this class represent, among all service locations, some public hospitals.'),
(524, 1, 7, 'Public_infant_school', 'Public infant school', 'The instances of this class represent, among all service locations, some public nursery schools.'),
(525, 1, 7, 'Public_junior_high_school', 'Public junior high school', 'The instances of this class represent, among all service locations, some public middle schools.'),
(526, 1, 7, 'Public_junior_school', 'Public junior school', 'The instances of this class represent, among all service locations, some public junior schools.'),
(527, 1, 7, 'Public_polytechnic_school', 'Public polytechnic school', 'The instances of this class represent, among all service locations, some public technical institutes.'),
(528, 1, 7, 'Public_professional_institute', 'Public professional institute', 'The instances of this class represent, among all service locations, certain public professional institutes.'),
(529, 1, 7, 'Public_relations_office', 'Public relations office', 'The instances of this class represent, among all service locations, some Public Relations Offices (URPs).'),
(530, 1, 7, 'Public_university', 'Public university', 'The instances of this class represent, among all service locations, some public universities.'),
(531, 1, 7, 'Publishing_activities', 'Publishing activities', 'The instances of this class represent, among all business activities, certain activities of publishing newspapers, books, magazines, periodicals and other editorial activities.'),
(532, 1, 7, 'Quality_control_and_certification', 'Quality Control and Certification', 'The instances of this class represent, among all business activities, certain quality control activities and product, process and system certification, and certain activities for the protection of controlled production assets.'),
(533, 1, 7, 'Quarrying_of_stone_sand_and_clay', 'Quarrying of stone sand and clay', 'The instances of this class represent, among all the business activities, some extractive activities, and in particular: gravel and sand extraction; Extraction of clay and kaolin; Extraction of ornamental and construction stones, limestone, plaster, clay and slate stone.'),
(534, 1, 7, 'RTZgate', 'RTZ gate', 'Each instance of this class represents a gateway to a restricted traffic zone.'),
(535, 1, 7, 'Radio_broadcasting', 'Radio broadcasting', 'The instances of this class represent, among all business activities, certain radio broadcasting activities.'),
(536, 1, 7, 'Radiotherapy_centre', 'Radiotherapy centre', NULL),
(537, 1, 7, 'Rafting_kayak', 'Rafting kayak', 'The instances of this class represent, among all service locations, some locations where rafting, canoeing and kayaking can be practiced.'),
(538, 1, 7, 'RailwayDirection', 'Railway Direction', 'Class whose instances are the railway directives.'),
(539, 1, 7, 'RailwayElement', 'Railway Element', 'Class whose instances are the elements that make up the sections, sections or rail lines.'),
(540, 1, 7, 'RailwayJunction', 'Railway Junction', 'Two junctions delimit a railway element and represent railway stations or freight terminals.'),
(541, 1, 7, 'RailwayLine', 'Railway Line', 'Class whose instances are the railway lines.'),
(542, 1, 7, 'RailwaySection', 'Railway Section', 'Class whose instances are the railway sections.'),
(543, 1, 7, 'RainfallObservation', 'Rainfall observation', 'Each instance of this class represents a precipitation detection in a certain place and time interval.'),
(544, 1, 7, 'Recreation_room', 'Recreation room', 'The instances of this class represent, among all the service venues, some recreation rooms.'),
(545, 1, 7, 'Recreational_and_sports_goods_rental', 'Recreational and Sports Goods rental', 'The instances of this class represent, among all business activities, some rental activities of sports and recreational equipment, including pleasure boats and in particular pedalos.'),
(546, 1, 7, 'Recruitment', 'Recruitment', 'The instances of this class represent, among all business activities, certain research, selection, placement, management and support services for staff relocation.'),
(547, 1, 7, 'Red_cross', 'Red cross', 'The instances of this class represent, among all service locations, certain Red Cross seats.'),
(548, 1, 7, 'Region', 'Regional Administration', 'Class whose instances are the various regions.'),
(549, 1, 7, 'RegularService', 'Regular Service', 'Services that may have other features, represented as cross services.'),
(550, 1, 7, 'Religiuos_guest_house', 'Religious guest house', 'The instances of this class represent, among all service locations, certain holiday homes operated by monastic orders.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(551, 1, 7, 'Repair', 'Repair', 'The instances of this class represent, among all the business activities, some quick repair services, key duplication, sharpening knives, immediate printing on textile articles, quick metal engraving, non-precious metal repair items, and Repair of other articles of consumption for personal use and for the house.'),
(552, 1, 7, 'Repair_musical_instruments', 'Repair musical instruments', 'The instances of this class represent, among all the business activities, some musical instruments repair services.'),
(553, 1, 7, 'Repair_of_communication_equipment', 'Repair of communication equipment', 'The instances of this class represent, among all business activities, certain repair and maintenance services for fixed, cordless, cellular and other telecommunication equipment.'),
(554, 1, 7, 'Repair_of_consumer_electronics', 'Repair of consumer electronics', 'The instances of this class represent, among all business activities, some repair services for consumer electronics and audio and video products for personal and home use.'),
(555, 1, 7, 'Repair_of_footwear_and_leather_goods', 'Repair of footwear and leather goods', 'The instances of this class represent, among all business activities, certain repair services for footwear and luggage in leather, leather or similar materials.'),
(556, 1, 7, 'Repair_of_garden_equipment', 'Repair of garden equipment', 'The instances of this class represent, among all business activities, certain gardening repair services.'),
(557, 1, 7, 'Repair_of_home_equipment', 'Repair of home equipment', 'The instances of this class represent, among all business activities, certain repair services of other goods for personal and home use.'),
(558, 1, 7, 'Repair_of_household_appliances', 'Repair of household appliances', 'The instances of this class represent, among all the business activities, some repair services of household appliances and household items.'),
(559, 1, 7, 'Repair_of_sporting_goods', 'Repair of sporting goods', 'The instances of this class represent, among all business activities, certain repair services for sporting goods (excluding sportswear) and camping equipment (including bicycles).'),
(560, 1, 7, 'Reporting_agencies', 'Reporting agencies', 'The instances of this class represent, among all business activities, certain commercial information agencies.'),
(561, 1, 7, 'Reproduction_recorded_media', 'Reproduction Recorded Media', 'The instances of this class represent, among all business activities, certain activities of reproduction of recorded media.'),
(562, 1, 7, 'Rescuers', 'Rescuers area', 'Each instance of this class represents a meeting point for rescuers in case of disaster.'),
(563, 1, 7, 'Research_and_development', 'Research and development', 'The instances of this class represent, among all the business activities, certain scientific research and research and experimental development activities in the fields of geology, natural sciences, engineering, biotechnology, social sciences and humanities.'),
(564, 1, 7, 'Reserved_lane', 'Reserved lane', 'Each instance of this class represents a lane reserved for a specific type of user.'),
(565, 1, 7, 'Residential_care_activities', 'Residential care activities', 'The demands of this class include, among all business activities, certain residential care facilities for the elderly, disabled motorists, people with mental retardation, mental disorders, or abusing drugs.'),
(566, 1, 7, 'Resolution', 'Resolution', 'Resolution approved by a Public Administration.'),
(567, 1, 7, 'Rest_home', 'Rest home', 'The instances of this class represent, among all service locations, some rest homes.'),
(568, 1, 7, 'Restaurant', 'Restaurant', 'The instances of this class represent, among all business activities, certain catering services in a fixed location (including farmhouses), and all mobile catering services on trains, ships and others.'),
(569, 1, 7, 'Restorers', 'Restorers', 'The instances of this class represent, among all the business activities, some conservation and restoration works of art.'),
(570, 1, 7, 'Retail_motor_vehicles_parts', 'Retail Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles and brokering in the trade of motorcycle parts and accessories.'),
(571, 1, 7, 'Retail_sale_non_specialized_stores', 'Retail Sale Non-Specialized Stores', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses, including prevalence of food and beverages.'),
(572, 1, 7, 'Retail_trade', 'Retail Trade', 'The instances of this class represent, among all business activities, certain retail activities.'),
(573, 1, 7, 'Ride', 'Ride', 'Run scheduled by a certain TPL company on a certain route of a certain line.'),
(574, 1, 7, 'Riding_stables', 'Riding stables', 'The instances of this class represent, among all service locations, some riding stables activities.'),
(575, 1, 7, 'Road', 'Road', 'Class whose instances are the streets.'),
(576, 1, 7, 'RoadElement', 'Road element', 'Class whose instances are the elements that make up the streets.'),
(577, 1, 7, 'RoadLink', 'RoadLink', 'Linear road section bounded by two junctions that make up the road element.'),
(578, 1, 7, 'Roman_bridge', 'Roman bridge', 'The instances of this class represent the Roman bridges.'),
(579, 1, 7, 'Rope_cord_and_twine', 'Rope cord and twine', 'The instances of this class represent, among all business activities, certain retail activities of spades, ropes, canvases and jute bags and packaging products (excluding paper and board products).'),
(580, 1, 7, 'Route', 'Route', 'A route that is driven by public transport.'),
(581, 1, 7, 'RouteJunction', 'Route Junction', 'Interconnection point between road segments to determine the path of a TPL line.'),
(582, 1, 7, 'RouteLink', 'RouteLink', 'Road section bounded by two TPL junction that determines the path of a TPL line.'),
(583, 1, 7, 'RouteSection', 'Route Section', 'Road section between two successive bus stops in a certain line.'),
(584, 1, 7, 'Rtz_daily', 'Restricted traffic zone daily', 'Each instance of this class represents a limited active zone in the only daylight hours.'),
(585, 1, 7, 'Rtz_nightly', 'Restricted traffic zone nightly', 'Ciascuna istanza di questa classe rappresenta una zona a traffico limitato attiva nelle sole ore notturne.'),
(586, 1, 7, 'Sailing_school', 'Sailing school', 'The instances of this class represent, among all service locations, some sailing schools.'),
(587, 1, 7, 'Sale_motor_vehicles_parts', 'Sale Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles.'),
(588, 1, 7, 'Sale_of_motor_vehicles', 'Sale of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain car trade activities.'),
(589, 1, 7, 'Sale_of_motor_vehicles_and_motorcycles', 'Sale of Motor Vehicles and Motorcycles', 'The instances of this class represent, among all business activities, certain wholesale and retail activities and repair of motor vehicles and motorcycles.'),
(590, 1, 7, 'Sale_of_motorcycles', 'Sale of Motorcycles', 'The instances of this class represent, among all the business activities, certain activities of trade, maintenance and repair of motorcycles and related parts and accessories.'),
(591, 1, 7, 'Sale_via_mail_order_houses_or_via_internet', 'Sale Via Mail Order Houses or Via Internet', 'The instances of this class represent, among all business activities, certain retail activities of any type of correspondence, radio, telephone, Internet product.'),
(592, 1, 7, 'Sandwich_shop_pub', 'Sandwich shop pub', 'The instances of this class represent, among all business activities, some sandwich shops and pubs.'),
(593, 1, 7, 'Sanitary_equipment', 'Sanitary Equipment', 'The instances of this class represent, among all the business activities, certain retail activities of sanitary articles.'),
(594, 1, 7, 'Sawmilling', 'Sawmilling', 'The instances of this class represent, among all the business activities, some wood cutting and planing activities.'),
(595, 1, 7, 'SchoolObservation', 'SchoolObservation', NULL),
(596, 1, 7, 'Second_hand_books', 'Second-Hand Books', 'The instances of this class represent, among all the business activities, certain retail activities of second hand articles and books.'),
(597, 1, 7, 'Second_hand_goods', 'Second-Hand Goods', 'The instances of this class represent, among all business activities, certain retail activities of second hand items and clothing.'),
(598, 1, 7, 'Secondary_education', 'Secondary education', 'The instances of this class represent, among all business activities, secondary education of first and second grade general (high school), technical, vocational and artistic education.'),
(599, 1, 7, 'Secretarial_support_services', 'Secretarial support services', 'The instances of this class represent, among all business activities, certain photocopying, document preparation and other specialized support activities for office functions, and certain activities for the dispatch of propaganda material, compilation and address management .'),
(600, 1, 7, 'Security_systems', 'Security systems', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(601, 1, 7, 'Security_systems_service', 'Security systems service', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(602, 1, 7, 'Senior_centre', 'Senior centre', 'The instances of this class represent, among all the places of service, some old-age hospitals.'),
(603, 1, 7, 'SensorSite', 'Traffic sensor', 'Single sensor for observing speed, traffic, concentration or density'),
(604, 1, 7, 'SensorSiteTable', 'Sensor Site Table', 'Set of sensors representing a single installation, a single site.'),
(605, 1, 7, 'Service', 'Service', 'Business activities, services to the citizen, offices, services in general, which can be located at one point.'),
(606, 1, 7, 'Sewerage', 'Sewerage', 'The instances of this class represent, among all business activities, certain sewerage companies.'),
(607, 1, 7, 'Sexy_shop', 'Sexy Shop', 'The instances of this class represent, among all the business activities, some retail business of adult articles (sexy shop).'),
(608, 1, 7, 'Shelter_area', 'Shelter area', 'Each instance of this class represents a population gathering point in case of disaster.'),
(609, 1, 7, 'ShoppingAndService', 'Shopping and service', 'Shops, malls, stores, all forms of public sale activities.'),
(610, 1, 7, 'Shopping_centre', 'Shopping centre', 'The instances of this class represent, among all business activities, some department stores.'),
(611, 1, 7, 'Single_brand_store', 'Single brand store', 'The instances of this class represent, among all service locations, some single-brand stores.'),
(612, 1, 7, 'SituationRecord', 'Situation Record of a Car Park', 'Recording the situation of a given parking lot at a certain time.'),
(613, 1, 7, 'Ski_school', 'Ski school', 'The instances of this class represent, among all the service centers, some ski schools.'),
(614, 1, 7, 'Skiing_facility', 'Skiing facility', 'The instances of this class represent, amongst all service locations, some skiing facilties.'),
(615, 1, 7, 'Small_household_appliances', 'Small Household Appliances', 'The instances of this class represent, among all the business activities, some retail business of sewing machines and household knitwear.'),
(616, 1, 7, 'Small_shop', 'Small shop', 'The instances of this class represent, among all business activities, some grocery stores.'),
(617, 1, 7, 'SmartBenchObservation', 'Smart bench observation', 'Each instance of this class represents a detection from a bench equipped with advanced features.'),
(618, 1, 7, 'SmartIrrigatorObservation', 'Smart irrigator observation', 'Each instance of this class represents a detection from a sprinkler equipped with advanced features.'),
(619, 1, 7, 'SmartWasteContainerObservation', 'Smart waste container observation', 'Each instance of this class represents a detection from a waste container with advanced features.'),
(620, 1, 7, 'Smart_bench', 'Smart bench', 'Ciascuna istanza di questa classe rappresenta una panchina dotata di funzionalità evolute.'),
(621, 1, 7, 'Smart_irrigator', 'Smart irrigator', 'Each instance of this class represents an irrigator with advanced features.'),
(622, 1, 7, 'Smart_street_light', 'Smart street light', 'Each instance of this class represents a street lamp with advanced features.'),
(623, 1, 7, 'Smart_waste_container', 'Smart waste container', 'Each instance of this class represents a garbage dump with advanced features.'),
(624, 1, 7, 'Social_centre', 'Social centre', 'The instances of this class represent, among all service locations, some social centers.'),
(625, 1, 7, 'Social_security_service_office', 'Social security service office', 'The instances of this class represent, among all service locations, certain offices of the National Institute of Social Security.'),
(626, 1, 7, 'Social_work', 'Social work', 'The demands of this class include, among all business activities, certain nursery services, day care for disabled children and residential and non-residential social services for the elderly and disabled.'),
(627, 1, 7, 'Software_publishing', 'Software publishing', 'The instances of this class represent, among all the business activities, some computer and software play activities.'),
(628, 1, 7, 'Sound_recording_and_music_publishing', 'Sound Recording and Music Publishing', 'The instances of this class include, among all the business activities, some sound recording and music publishing activities also in sound recording studios.'),
(629, 1, 7, 'Souvenirs_craftwork_and_religious_articles', 'Souvenirs Craftwork and Religious Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of worship and decoration art, trinkets, costume jewelery and handicrafts.'),
(630, 1, 7, 'Specialized_construction', 'Specialized Construction', 'The instances of this class represent, among all the business activities, certain specialized construction activities, such as: installation of street lighting and signaling devices, illumination of the slopes of airports (including maintenance and repair); installation of sewage treatment plants for swimming pools (including maintenance and repair); Installation of irrigation systems for gardens (including maintenance and repair); drilling and perforation; works of thermal, acoustic or anti-vibration insulation; installation of electronic equipment (including maintenance and repair); installation of electrical installations in buildings or in other works of building (included maintenance and repair); tinteggiatura and pose in work of glasses; Installation of plumbing, heating and air conditioning (including maintenance and repair) in buildings or in other works of construction; poses in work of casseforti and infissi; completion and finishing of buildings; demolition of buildings; poses in work of infissi, furnitures, controsoffitti, mobile and alike walls; covering of floors and walls; preparation of the yard building and placing of the terrain; plastering and plastering; installation of gas distribution facilities (including maintenance and repair); installation of fire extinguishing systems, including integrated ones (including maintenance and repair); installation, repair and maintenance of elevators and escalators.'),
(631, 1, 7, 'Specialized_design', 'Specialized Design', 'The instances of this class represent, among all business activities, certain design activities including: some professional, scientific and technical activities; certain specialized design activities; fashion and industrial design activities; activities of technical designers; graphics and graphic design, including Web pages.'),
(632, 1, 7, 'Speed_camera', 'Speed camera', 'The instances of this class are each a speedcam.'),
(633, 1, 7, 'Sport_event_promoters', 'Sport event promoters', 'The instances of this class represent, among all the business activities, certain activities of sports organizations, including the promotion of sporting events.'),
(634, 1, 7, 'Sporting_equipment', 'Sporting Equipment', 'The instances of this class represent, among all business activities, certain retail activities of sporting goods, bicycles, leisure articles and underwater activities.'),
(635, 1, 7, 'Sports_and_recreation_education', 'Sports and recreation education', 'The instances of this class represent, among all the business activities, some activities of organizing sports and recreational courses.'),
(636, 1, 7, 'Sports_clubs', 'Sports clubs', 'The instances of this class represent, among all the business activities, some activities of sports clubs.'),
(637, 1, 7, 'Sports_facility', 'Sports facility', 'The instances of this class represent, among all the business activities, some sports facilities management activities.'),
(638, 1, 7, 'Squares', 'Squares', 'The instances of this class represent, among all the places of service, some squares of interest to carry out cultural activities.'),
(639, 1, 7, 'Stalls_and_markets', 'Stalls and Markets', 'The instances of this class represent, among all business activities, certain street retailing business activities.'),
(640, 1, 7, 'Stalls_and_markets_of_clothing_and_footwear', 'Stalls and Markets of Clothing and Footwear', 'The instances of this class represent, among all the business activities, certain street retailing business of textiles, home textiles, clothing, footwear and leather goods.'),
(641, 1, 7, 'Stalls_and_markets_of_food', 'Stalls and Markets of Food', 'The instances of this class represent, among all business activities, some street retailing business of foodstuffs and beverages, fruit and vegetables, fish products and meats.'),
(642, 1, 7, 'Stalls_and_markets_other_goods', 'Stalls and Markets Other Goods', 'The instances of this class represent, among all the business activities, certain street retailing business of machinery, equipment and products for agriculture, gardening equipment, trinkets, jewelery, garden furniture, furniture, carpets, Mats, household items, household appliances, electrical equipment, perfumes and cosmetics, soaps, detergents and other detergents for any use, flowers, plants, bulbs, seeds and fertilizers.'),
(643, 1, 7, 'Stamps_and_coins', 'Stamps and Coins', 'The instances of this class represent, among all the business activities, certain pharmacy, numismatics and collectibles retail activities.'),
(644, 1, 7, 'StatisticalData', 'StatisticalData', 'Value referring to a statistical data linked to a road or to a Public Administration.'),
(645, 1, 7, 'Stone_processing', 'Stone Processing', 'The instances of this class represent, among all the business activities, certain mining activities of various stones and minerals not related to the extraction, segagion and processing of stones and marble, artistic marble processing and other related stones , Mosaic work, cutting, molding and finishing of stones.'),
(646, 1, 7, 'StreetNumber', 'Street Number', 'Class whose instances are known civic numbers.'),
(647, 1, 7, 'Street_light', 'Street light', 'Each instance of this class represents a lamppost of the street lighting system.'),
(648, 1, 7, 'Street_sweeping', 'Street sweeping', 'The instances of this class include, among all the business activities, some cleaning and washing activities in public areas, removal of snow and ice.'),
(649, 1, 7, 'Summer_camp', 'Summer camp', 'The instances of this class represent, among all the business activities, certain activities of marine and mountain colonies.'),
(650, 1, 7, 'Summer_residence', 'Summer residence', 'The instances of this class represent, among all service locations, some holiday homes.'),
(651, 1, 7, 'Supermarket', 'Supermarket', 'The instances of this class represent, among all business activities, some supermarkets.'),
(652, 1, 7, 'Support_activities_for_transportation', 'Support Activities for Transportation', 'The instances of this class represent, among all business activities, certain services related to land, air, sea, and waterways transport.'),
(653, 1, 7, 'Support_animal_production', 'Support Animal Production', 'The instances of this class represent, among all the business activities, certain support activities for farming, including in particular agricultural crops associated with animal breeding, plant and animal production support activities, agriculture and subsequent collection activities.'),
(654, 1, 7, 'Surgical_activities', 'Surgical activities', NULL),
(655, 1, 7, 'Surveyor', 'Surveyor', 'The instances of this class represent, among all the business activities, certain technical activities carried out by geometers.'),
(656, 1, 7, 'Sushi_bar', 'Sushi bar', 'The instances of this class represent, among all business activities, some sushi bars.'),
(657, 1, 7, 'Take_away', 'Take Away', 'The instances of this class represent, among all the business activities, certain catering activities (without provision) for preparation of takeaway foods.'),
(658, 1, 7, 'Tannery', 'Tannery', 'The instances of this class include, among all the business activities, certain tanning activities of leather, manufacture of travel articles, handbags, leather goods and saddlery, fur preparation and dyeing.'),
(659, 1, 7, 'Tattoo_and_piercing', 'Tattoo and piercing', 'The instances of this class represent, among all the business activities, some tattoo and piercing activities.'),
(660, 1, 7, 'Tax_advice', 'Tax advice', 'The instances of this class represent, among all business activities, certain activities carried out by Tax Assistance Centers.'),
(661, 1, 7, 'Taxi_company', 'Taxi Company', 'The instances of this class represent, among all business activities, some taxi transport activities.'),
(662, 1, 7, 'Taxi_park', 'Taxi park', 'The instances of this class represent, among all service locations, certain parking areas for taxis.'),
(663, 1, 7, 'Technical_consultants', 'Technical consultants', 'The instances of this class represent, among all business activities, certain activities of architecture, engineering and other engineering studies.'),
(664, 1, 7, 'Technical_testing', 'Technical testing', 'The instances of this class represent, among all the business activities, certain testing and technical analysis activities.'),
(665, 1, 7, 'Telecommunications', 'Telecommunications', 'The instances of this class represent, among all business activities, certain retail trade activities of telecommunications equipment and telephony in specialized stores.'),
(666, 1, 7, 'Television_broadcasting', 'Television broadcasting', 'The instances of this class represent, among all the business activities, certain activities of television programming and broadcasting.'),
(667, 1, 7, 'Temp_agency', 'Temp agency', 'The instances of this class represent, among all the business activities, certain activities of the temporary employment agency.'),
(668, 1, 7, 'Textile_manufacturing', 'Textile Manufacturing', 'The instances of this class represent, among all the business activities, certain textile manufacturing activities, including: manufacture of twine, string, ropes and nets; manufacture of tulle, lace and lace; packaging of textile articles (excl. articles of clothing); manufacture of felt and textile articles diverse; manufacture of nonwovens and articles thereof (excl. articles of apparel); manufacture of embroidery; manufacture of carpets and carpets; finishing of textiles, of articles of changing room and similari activities; preparation and spinning of textile fibers; weaving; confezionamento of biancheria of bed, of table and for the amoblamiento; manufacture of knitted fabrics; manufacture of ribbons, labels and trimmings of textile fibers.'),
(669, 1, 7, 'Textiles_products', 'Textiles Products', 'The instances of this class represent, among all the business activities, certain retail trade activities of textile products.'),
(670, 1, 7, 'Theatre', 'Theatre', 'The instances of this class include, among all the business activities, certain theatrical activities, including in particular: activities in the field of directing; other activities supporting artistic representations; management of theaters, concert halls and other artistic structures; activities in the field of acting; artistic and literary creations; artistic representations; rental with operator of structures and equipment for events and shows.'),
(671, 1, 7, 'ThermometryObservation', 'Thermometry observation', 'Ciascuna istanza di questa classe rappresenta una rilevazione della temperatura eseguita in un certo luogo ad un certo istante di tempo.'),
(672, 1, 7, 'Ticket_sale', 'Ticket sale', 'The instances of this class represent, among all business activities, certain ticketing services for theatrical, sports and other recreational and entertainment events.'),
(673, 1, 7, 'Tobacco_industry', 'Tobacco Industry', 'The instances of this class represent, among all the business activities, certain tobacco industries.'),
(674, 1, 7, 'Tobacco_shop', 'Tobacco shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of monopolies (tobaccos).'),
(675, 1, 7, 'Toilet', 'Toilet', 'The instances of this class represent, among all the services, some public toilets, to be framed in the context of tourist services.'),
(676, 1, 7, 'Tour_operator', 'Tour operator', 'The instances of this class represent, among all business activities, certain activities of travel agencies.'),
(677, 1, 7, 'TourismService', 'Tourism Services', 'Activities of travel agency services, tour operators and booking services.'),
(678, 1, 7, 'Tourist_complaints_office', 'Tourist complaints office', 'The instances of this class represent, among all service locations, certain complaint offices dedicated to the tourism sector.'),
(679, 1, 7, 'Tourist_guides', 'Tourist guides', 'The instances of this class represent, among all the business activities, certain activities of guides and tour guides.'),
(680, 1, 7, 'Tourist_information_office', 'Tourist information office', 'The instances of this class represent, among all service locations, some tourist information offices.'),
(681, 1, 7, 'Tourist_trail', 'tourist trail', 'The instances of this class represent, among all service locations, certain tourist itineraries.'),
(682, 1, 7, 'Towing_and_roadside_assistance', 'Towing and Roadside Assistance', 'The instances of this class represent, among all the business activities, some towing and roadside assistance activities.'),
(683, 1, 7, 'TrafficConcentration', 'Traffic Concentration Observation', 'Subclass of observations on auto concentration.'),
(684, 1, 7, 'TrafficFlow', 'Traffic Flow Observation', 'Subclass of auto flow observations.'),
(685, 1, 7, 'TrafficHeadway', 'Traffic Headway Observation', 'Sub-class of observations on the average transit time between cars.'),
(686, 1, 7, 'TrafficObservation', 'Traffic observation', 'Each instance of this class represents a traffic detection performed at some point at some time.'),
(687, 1, 7, 'TrafficSpeed', 'TrafficSpeed Observation', 'Subclass of average velocity observations.'),
(688, 1, 7, 'Traffic_corps', 'Traffic corps', 'Each instance of this class represents a Street Police Station.'),
(689, 1, 7, 'Traffic_light', 'Traffic light', 'The instances of this class are each a semaphorical facility.'),
(690, 1, 7, 'TrainStation', 'Train Station', 'Railway station, are located at railway junctions with a ratio of 1:1'),
(691, 1, 7, 'Train_lost_property_office', 'Train lost property office', 'The instances of this class represent, among all service locations, some offices for the lost items located inside train stations.'),
(692, 1, 7, 'Train_station', 'Train station', 'The instances of this class represent, at all service locations, some railway stations.'),
(693, 1, 7, 'Training_school', 'Training school', 'The instances of this class represent, among all business activities, some training courses and professional updating courses.'),
(694, 1, 7, 'Training_school_for_teachers', 'Training school for teachers', 'The instances of this class represent, among all service locations, some master schools.'),
(695, 1, 7, 'Tram_stops', 'Tram stops', 'The instances of this class represent, at all service locations, some tram stops.'),
(696, 1, 7, 'Tramline', 'Tram line', 'The instances of this class represent, among all service locations, some tram lines.'),
(697, 1, 7, 'TransferServiceAndRenting', 'Transfer service and renting', 'Car parks, railway stations or buses, everything that must be located on a map and refers to transportation.'),
(698, 1, 7, 'Translation_and_interpreting', 'Translation and interpreting', 'The instances of this class represent, among all the business activities, some translation and interpretation activities.'),
(699, 1, 7, 'TransverseService', 'Transverse Service', 'Services often associated with other services, which have their own geolocation.'),
(700, 1, 7, 'Trattoria', 'Trattoria', 'The instances of this class represent, among all the business activities, some trattorias.'),
(701, 1, 7, 'Travel_agency', 'Travel agency', 'The instances of this class represent, among all business activities, some travel agencies.'),
(702, 1, 7, 'Travel_bureau', 'Travel bureau', 'The instances of this class represent, among all service locations, some tourist offices dedicated to guided tours.'),
(703, 1, 7, 'Travel_goods', 'Travel goods', 'The instances of this class represent, among all business activities, certain retail trade of leather goods and travel goods.'),
(704, 1, 7, 'Travel_information', 'Travel information', 'The instances of this class represent, among all business activities, certain services provided by travel agencies and tour operators, booking services, services of tourist interest made by subjects other than travel agencies and tour operators, and related activities.'),
(705, 1, 7, 'Trinkets', 'Trinkets', 'The instances of this class represent, among all the business activities, certain retail trade of trinkets and jewelery (including souvenirs and promotional items).'),
(706, 1, 7, 'Underwear_knitwear_and_shirts', 'Underwear, Knitwear and Shirts', 'The instances of this class represent, among all the business activities, some retail business of personal linen, knitwear, shirts.'),
(707, 1, 7, 'Upholsterer', 'Upholsterer', 'The instances of this class represent, among all the business activities, some upholstery workshops.'),
(708, 1, 7, 'Urban_bus', 'Urban bus', 'The instances of this class represent, among all service locations, the locations of certain local public transport companies operating on urban areas.'),
(709, 1, 7, 'Useful_numbers', 'Useful numbers', 'The instances of this class represent the numbers to be called in an emergency.'),
(710, 1, 7, 'UtilitiesAndSupply', 'Utilities and supply', 'Fornitura di utenze e servizi'),
(711, 1, 7, 'Vacating_service', 'Vacating service', 'The instances of this class represent, among all business activities, certain activities of clearing cellars, floors and garages.'),
(712, 1, 7, 'Vacation_resort', 'Vacation resort', 'The instances of this class represent, among all service locations, some holiday resorts.'),
(713, 1, 7, 'Vehicle_rental', 'Vehicle rental', 'The instances of this class represent, among all service locations, certain vehicle rental services.'),
(714, 1, 7, 'Vehicle_trade', 'Vehicle trade', 'This class represents, among all business activities, the business of buying and selling vehicles.'),
(715, 1, 7, 'Vending_machines', 'Vending Machines', 'The instances of this class represent, among all business activities, certain retail activities carried out by automated vending machines.'),
(716, 1, 7, 'Veterinary', 'Veterinary', 'The demands of this class represent, among all business activities, certain veterinary services.'),
(717, 1, 7, 'Video_tapes_disks_rental', 'Video tapes disks rental', 'The instances of this class represent, among all business activities, some hire of video cassettes, CDs, DVDs and discs containing audiovisual or video games.'),
(718, 1, 7, 'Viewpoint', 'Viewpoint', 'Ciascuna istanza di questa classe rappresenta un punto panoramico.'),
(719, 1, 7, 'Wallpaper_and_floor_coverings', 'Wallpaper and Floor Coverings', 'The instances of this class represent, among all business activities, some retail business of wallpaper and floor coverings (carpet and linoleum).'),
(720, 1, 7, 'Warehousing_and_storage', 'Warehousing and Storage', 'The instances of this class represent, among all business activities, certain storage and custody activities, and in particular: storage and custody; warehousing and transport support activities; refrigerated warehouses for third parties; warehouses of custody and deposit for third account.'),
(721, 1, 7, 'WasteType', 'Waste container type', 'Each instance of this class represents a particular type of waste container (undifferentiated, paper, plastic, glass, drugs, and so on).'),
(722, 1, 7, 'Waste_collection_and_treatment', 'Waste Collection and Treatment', 'The instances of this class represent, among all business activities, certain waste collection, treatment and disposal activities.'),
(723, 1, 7, 'Waste_container', 'Waste container', 'Each instance of this class represents a waste bin.'),
(724, 1, 7, 'Water_collection_treatment_and_supply', 'Water Collection Treatment and Supply', 'The instances of this class represent, among all business activities, certain activities of gathering, treating and supplying water.'),
(725, 1, 7, 'Water_resource', 'Water resource', 'Each instance of this class represents a water resource company or entity.'),
(726, 1, 7, 'Water_transport', 'Water Transport', 'The instances of this class represent, among all the business activities, certain maritime, coastal and inland waterway transport activities.'),
(727, 1, 7, 'Weapons_and_ammunition', 'Weapons and Ammunition', 'The instances of this class represent, among all business activities, certain retail trade activities of weapons, ammunition and military articles.'),
(728, 1, 7, 'WeatherPrediction', 'Weather prediction', 'Meteorological forecast for a specific part of the day.'),
(729, 1, 7, 'WeatherReport', 'Weather Report', 'Meteorological report with information on temperature, humidity, snow and the like.'),
(730, 1, 7, 'Weather_sensor', 'Weather sensor', 'Weather sensor releasing information on weather forecasts.'),
(731, 1, 7, 'Web_and_internet_provider', 'Web and Internet Provider', 'The instances of this class represent, among all business activities, some hosting and provision of application services, including Web portals.'),
(732, 1, 7, 'Wedding_favors', 'Wedding Favors', 'The instances of this class represent, among all business activities, certain candy-shop retail activities.'),
(733, 1, 7, 'Welfare_worker_office', 'Welfare worker office', 'The instances of this class represent, among all service locations, certain offices of social workers.'),
(734, 1, 7, 'Wellness_centre', 'Wellness centre', 'The instances of this class represent, among all business activities, certain activities of centers for physical well-being and spa facilities.'),
(735, 1, 7, 'Wholesale', 'Wholesale', 'Wholesale of anything.'),
(736, 1, 7, 'Wholesale_agricultural_raw_materials_live_animals', 'Wholesale Agricultural Raw Materials Live Animals', 'The instances of this class represent, among all business activities, certain wholesale trade in animal and vegetable products, including: cereals and pulses; Live animals; Leather and raw hides and skins (excluding fur skins); Raw skins and furskins; Seeds and feed for livestock (feed), officinal plants, oilseeds, potatoes; Cereals, raw tobacco, seed and livestock feed (feed); flowers and plants.'),
(737, 1, 7, 'Wholesale_commission_trade', 'Wholesale Commission Trade', 'The instances of this class represent, among all the business activities, certain activities of agents and trade representatives.'),
(738, 1, 7, 'Wholesale_food_beverages_tobacco', 'Wholesale Food Beverages Tobacco', 'The instances of this class represent, among all the business activities, certain activities of wholesale trade in food and tobacco products.'),
(739, 1, 7, 'Wholesale_household_goods', 'Wholesale Household Goods', 'The instances of this class represent, among all business activities, certain non-food wholesale trade activities.'),
(740, 1, 7, 'Wholesale_ict_equipment', 'Wholesale ICT Equipment', 'The instances of this class represent, among all business activities, certain wholesale activities of electronic, computer and similar equipment.'),
(741, 1, 7, 'Wholesale_machinery_equipmentent_supplies', 'Wholesale Machinery Equipmentent Supplies', 'The instances of this class represent, among all business activities, certain wholesale trade of professional equipment.'),
(742, 1, 7, 'Wholesale_motor_vehicles_parts', 'Wholesale Motor Vehicles Parts', 'The instances of this class represent, among all business activities, certain wholesale and brokering activities of parts and accessories of motor vehicles.'),
(743, 1, 7, 'Wholesale_trade', 'Wholesale Trade', 'The instances of this class represent, among all business activities, certain wholesale activities.'),
(744, 1, 7, 'Wifi', 'Free WiFi point', 'The instances of this class represent, among all service locations, certain access points to Wi-Fi networks.'),
(745, 1, 7, 'WineAndFood', 'Wine And Food', 'Restaurants, wine bars and all other food and wine activities.'),
(746, 1, 7, 'Wine_shop_and_wine_bar', 'Wine shop and wine bar', 'The instances of this class represent, among all business activities, certain beverage retail activities.'),
(747, 1, 7, 'Youth_assistance', 'Youth assistance', 'The instances of this class represent, among all service locations, some childcare centers.'),
(748, 1, 7, 'Youth_information_centre', 'Youth information centre', 'The instances of this class represent, among all service locations, certain youth information centres.'),
(749, NULL, 6, 'Hospital', 'hôpital', NULL),
(750, 1, 8, 'Medecin', 'Medecin', NULL),
(751, 1, 8, 'Patient', 'Patient', NULL),
(752, 1, 8, 'Ordonnance', 'Ordonnance', NULL),
(753, 1, 8, 'Consultation', 'Consultation', NULL),
(754, 1, 8, 'Parcourssoin', 'Parcours de soin', NULL);

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
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 251, NULL, NULL, 'office'),
(3, 1, 750, NULL, NULL, 'Medecin'),
(4, 1, 751, NULL, NULL, 'Patient'),
(5, 1, 753, NULL, NULL, 'Consultation'),
(6, 1, 754, NULL, NULL, 'Parcours de soin'),
(7, 1, 752, NULL, NULL, 'Ordonnance');

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
(25, 3, 548, NULL, NULL, 1, NULL, 0, 0),
(26, 3, 549, NULL, NULL, 2, NULL, 0, 0),
(31, 4, 548, NULL, NULL, 1, NULL, 0, 0),
(32, 4, 549, NULL, NULL, 2, NULL, 0, 0),
(33, 4, 550, NULL, NULL, 3, NULL, 0, 0),
(34, 4, 551, NULL, NULL, 4, NULL, 0, 0),
(35, 4, 553, NULL, NULL, 5, NULL, 0, 0),
(36, 5, 554, NULL, NULL, 1, NULL, 0, 0),
(37, 2, 292, NULL, NULL, 3, NULL, 0, 0),
(38, 2, 386, NULL, NULL, 4, NULL, 0, 0),
(39, 6, 548, NULL, NULL, 1, NULL, 0, 0),
(40, 6, 549, NULL, NULL, 2, NULL, 0, 0),
(41, 6, 556, NULL, NULL, 3, NULL, 0, 0),
(42, 6, 557, NULL, NULL, 4, NULL, 0, 0),
(43, 7, 554, NULL, NULL, 1, NULL, 0, 0),
(44, 7, 555, NULL, NULL, 2, NULL, 0, 0),
(45, 3, 558, NULL, NULL, 3, NULL, 0, 0),
(46, 4, 559, NULL, NULL, 6, NULL, 0, 0);

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
('143f6d6d3d54782967d6151195182b8c', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383836373437312e393538343733393230383232313433353534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223463663936663439326333656534346336663730653435616530633032346235223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836363231393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836383432343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383837313037323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836383234323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383836383336333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383837303631373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226630623739643665333837623031393437633764396431366435363261386239223b733a33323a223231343366653466633164316434636566373231656238346138343766643465223b7d733a343a2268617368223b733a36353a2232313433666534666331643164346365663732316562383461383437666434652d6630623739643665333837623031393437633764396431366435363261386239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223433666238393563386232643134306235613333633165316336653363633130223b733a33323a223462346437633239396439383962326663623363623665383763356133353261223b733a33323a223532623739373163663939666237633062623530376364663634623833393832223b733a33323a223363643335623037663931306538393535653764393039393435656331383731223b733a33323a223362303435383238376337616238663365373538343534313636366266616264223b733a33323a226562626530336433333362353834303236303961626432323366383437316465223b733a33323a226362383138343930383263626266323364333733386136653966336364316361223b733a33323a223765306130393538356530666665383938353962623432346362303537363566223b7d733a343a2268617368223b733a36353a2237653061303935383565306666653839383539626234323463623035373635662d6362383138343930383263626266323364333733386136653966336364316361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343935323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35383a7b733a33323a226664383637353634613336643934303265313437653635326231643337663464223b733a33323a223330303365626539323562306264656663383139383230643862386464656138223b733a33323a223132393233336235656332616363393862316138363733636135626538613063223b733a33323a226631326634366264653463363565353665623861666532663836363265383239223b733a33323a223232363634633338393239643563306433383737663038313766373563303335223b733a33323a223461346161373964353739386561333265303337366635313837646232303163223b733a33323a226533326236663331633830333434646331653835316533613563663137393566223b733a33323a226232636632623462383336323233623366636162656239363063666533326564223b733a33323a226334643036376535393134613939613136343431623763656434623032633264223b733a33323a223438643539323564653334646339633963356366646161386364613535376331223b733a33323a226561343464343236656434643930326466656564353239666536326135376438223b733a33323a223536306436376133356363666666343264626434393230313639343137633066223b733a33323a226639316131623531303262363763326232326133313938623730643562633735223b733a33323a223837356238663737626237626538626530303534643264616562343332306337223b733a33323a223633633831663835313337666433363566303839316530633538643235353161223b733a33323a223233646435393734613836326231353737373862663430356531613366396330223b733a33323a223931376364613863363262376134316332643432373831376464623336643633223b733a33323a226433316331383561356230636666333364663336393236353963616463333064223b733a33323a223365313963353838383431643939356131623532343264643433623464613831223b733a33323a223632613438336637353432613937356237386131396265373633663463646232223b733a33323a226164366162373432326330353734326463333332326661633230623663383032223b733a33323a223563346634636631623335303832656234373533313537363233386565343731223b733a33323a226430616132343562643931386564303534323365386438666531333363656234223b733a33323a226337303038636134633964623864656565646238393263646365636563656366223b733a33323a223231373634666261373337653061303435323634653633383633656335313665223b733a33323a226134346333363862353232323236383636636133373336336366353733653938223b733a33323a226262356639353266353931353830373131623530623830373330363138383730223b733a33323a223232626362376231346336353631366363313931313135653237666631643132223b733a33323a223639636265326564373761363064393531633231646339356537373461393333223b733a33323a226432616533383739613231653939623964666565356238383831663765383564223b733a33323a223664633435656464323833326164386233393961643531363963343030626661223b733a33323a223563643062386532353933303332626665326637353561356233323232613734223b733a33323a223065353231363565356365373234646333346261386633333532303263643165223b733a33323a223532373132386637373133663763636465643938643532346535653164646462223b733a33323a223436666234633430663065623635356363336162643936363637383034336637223b733a33323a226336383634623433373464386639323532386135346466386265383865316134223b733a33323a226464623566663736373465376237663537363932353732643739643133646331223b733a33323a223161643434353364376163623136636539323734313464316136306437633766223b733a33323a226263366662356166303537386234376262363631393834336664303862353439223b733a33323a223436386634313030633164643366336133343934613937643262373039653233223b733a33323a226662383134636131383233393235663361356234363665393935316336646633223b733a33323a223265663638653966306139346634373562393333663836316230396430623565223b733a33323a223964646231373530336366396331333766613666326663336130666634373438223b733a33323a223636666132363732303166366365623136313461343266373034653063323636223b733a33323a223234613238643332386132326337353461346239643765343834646466383363223b733a33323a226162386437373634663461386431343133623436653063383631376661613466223b733a33323a223862353237666134346135376330373837346434353135613031363933326366223b733a33323a223663613964643433336238303634656438383432616236633662316166323230223b733a33323a223265356561383732303334316564303364386335343434613364333462313035223b733a33323a223532303638323265373033633665376136333435663537313239653966333930223b733a33323a223332326339303464303130653366363162303838323937363462316434646565223b733a33323a226236316363383636656231343933663661373131646631346634393063653638223b733a33323a223234313734346430363937373966363438323963626465663161666130323137223b733a33323a226236653930383864663133353337393438323939626662313264336366626163223b733a33323a223762336534613161396364663135303065376639623139303163346330623933223b733a33323a223230373738343134653762386537363436613764393538373333383135663361223b733a33323a223761653736333135346464353465366666353664383535373936626332396531223b733a33323a226236333032303137363331326435663661333733653739613065333932323635223b733a33323a223064313532646662613861313263666261363039353864316438356434323734223b733a33323a226438666231386365636633646263353635303332623566663232326638626339223b733a33323a223538393830653435396531616633616335336666653033616631393737313336223b733a33323a226265386334396432323266666133363162626534373830623665636630316134223b733a33323a223731663839393266353861646332623165623764616465363062313232353866223b733a33323a223863313461356365616339333162656163366666363539656462316164393466223b733a33323a226136343563373739363064376264396165316536316339613761383830313335223b733a33323a223638643234353536633537346230396131616238363565386631303765373566223b733a33323a223738373136633463373361343131643633346530343630333930376266663865223b733a33323a223631643163353730653238363436343065313964393131366632363266656561223b733a33323a226662656464653631343431666533393738393033353036626330333238376435223b733a33323a226634613534393436303033343265616661653630393733393238353136653831223b733a33323a223765303566323935333465663237653631386263393337653733353134613731223b733a33323a226233333366393665336130316532336463626662636532333738663231623265223b733a33323a223839306665383033396430656631343533623963646531333137393437633639223b733a33323a223830623037623135646636636265343036386465303565636530396330643162223b733a33323a223438323465616334643363646463656138366661316438616666623162653435223b733a33323a226130386132383337636638333364313565636630343039353737373033616238223b733a33323a226639626163633231326466633962353062316665313762373434373862336263223b733a33323a226163316362326337646564616665613636336332323636646337346235626461223b733a33323a226638393636326330376234326464356164383636633633666565646361666530223b733a33323a223132363764373438613937653862303461646437303330363463313861326533223b733a33323a226162643132306130356234316431313136643261376630623562656335626365223b733a33323a226137383561353332666332626465376632643261623934333963313034653730223b733a33323a223832363138336534356138326362626563303833613932633835666438346335223b733a33323a223837396533383765323131333934646266363662643035633538313439373663223b733a33323a223066313361323865363436383430346363323239626162353562386232383039223b733a33323a223566613463393161336166386134356264633036346333633461333735633064223b733a33323a226266393932393138356638663235393962343131303964623838333261313830223b733a33323a223664363435303434323131653964313332323333316337323436323336313039223b733a33323a223662653361303830636362363463663638666132336461313964613764353034223b733a33323a226431646535616563383139643337613165376430613033663063616363313037223b733a33323a226132653662353664383061346439626363646363356564633739323861363432223b733a33323a223765366565306539396435633532653738363139373733303361303739653437223b733a33323a223763353161396531366536316335653563333061363435626333343134656533223b733a33323a226531656437623934646233303966646430323536643963623534613730303030223b733a33323a223035393232643866613330366234666435643133343435643665303637323834223b733a33323a223063353261626463653163323566366236346562663632643031653164366237223b733a33323a223139613339646534663233353563363433623233626161333533643961383565223b733a33323a223666343964396166636665633831616461363339643162323430353237316539223b733a33323a223634373932663164393136356339323863313938363463653331626135356434223b733a33323a223739383761353030363862303562636439643438353564323566363437613532223b733a33323a223933633833376366366634353038636237626538306362336432653336306464223b733a33323a223738313134396538656266636464333237636236666631353761383162633937223b733a33323a223734346237303666356634363830343033363335616430356464626164373431223b733a33323a223033623335346336323231393030356533643366333234653634643139383431223b733a33323a223335373038383336396336356331303865336233623530633736383430363263223b733a33323a223361303163623461376233336637643731613539613735353932343938613866223b733a33323a223862373930666233343236373735623037383231636535393363333465336630223b733a33323a223734613639383735376338373332313563326132333764326165363636373233223b733a33323a226366313932393534303832363733383263303135303438303730623866363335223b733a33323a223364646463633135393865396261373661613634323734333337633230653264223b733a33323a226331653463643039616663373264336466666233333733393932396266633633223b733a33323a223264303133643933633562313136343564396263656161653539623836366237223b733a33323a223465663930646138353930646364303964646665353538363037373139376433223b733a33323a223337306565646335393963323564656332363634643037633963356164633139223b733a33323a223539626338613938316531626131303763663538323939336135636436316264223b733a33323a223064663431313232343230336538386462646532323662393564616432333334223b7d733a343a2268617368223b733a36353a2230646634313132323432303365383864626465323236623935646164323333342d3539626338613938316531626131303763663538323939336135636436316264223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226636626666663664316562313761663765636330663632623632666438383139223b733a33323a226563646136333265666231343139653866323437333139643531353231343231223b733a33323a223962383635653465303166393362363762333038323236313639613061613465223b733a33323a226436393432623736643361656561316466636433623566643636656362306630223b733a33323a223366383332626261656237363239356463373936323836306532393631366364223b733a33323a226163616662613337663533383165313239346238633232613930373261366139223b7d733a343a2268617368223b733a36353a2261636166626133376635333831653132393462386332326139303732613661392d3366383332626261656237363239356463373936323836306532393631366364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223662333166383430393233656261613237386331303663396434326130643830223b733a33323a223135663334366330316432653632383431313132383466313436376436666235223b7d733a343a2268617368223b733a36353a2231356633343663303164326536323834313131323834663134363764366662352d3662333166383430393233656261613237386331303663396434326130643830223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313637323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223563323364383939393664653035653563636330363438646337353938646639223b733a33323a223535353933393535666137383365373938623861366436353662616536306364223b733a33323a223636636331633934326661663638326535303962653336376663306462353965223b733a33323a226236663737383936633637316138623065346631633638306234306432306134223b733a33323a223536376638326666393063613734623233633766343066616665393961353965223b733a33323a223235313364316666316661646464356230633137313330336364623836653564223b733a33323a226632356462663930356263626233643834343163353563386164303533316232223b733a33323a226434303262663232383334333238393139646366366432623366653663636232223b733a33323a223866303431663934343363393033386638373166333138303538663130653565223b733a33323a223834303931653965303033336235373862616338313335313264333330393663223b733a33323a223164623665626133626165353566633566363036346531343033323966333165223b733a33323a223762363238396638393236646561643431303262373265356338393737663765223b733a33323a223237323666636133323638313831323966363666353635646434306232393638223b733a33323a226162323463313233373630373361326563363830626565373238396130363665223b733a33323a223333386139333766303833333931626330326130396638336437616561353432223b733a33323a226330306265396532303762633534646665303430343834396330623964396430223b733a33323a223934383938643433393433363261343363653539323031653566353662363164223b733a33323a226439333135383564343732373739353630656130333263666434353534333139223b733a33323a226539393763326433326162653561343730366630613037653864613234656533223b733a33323a223133306539653064646639666262323234616235633562623565333237313632223b733a33323a223166653732323134623565303539393634313866613561313437646435393830223b733a33323a223963386332343161356166343166663738626565343366336233636333333439223b733a33323a226361373661396538653939346564653865366662383335303239646362623064223b733a33323a223364663831613164346634623666656430633039323461666137333332313836223b733a33323a223432376262356336346165343831393531323033663732323831613039626233223b733a33323a226561343739383866663339303238383833363437313366373336386666626433223b733a33323a223066353537646238356536373737326238393032386632653137626637346262223b733a33323a223735646464396539613031336632356536353035353064623730343062666365223b733a33323a223832373661653661653461363063643432306131323530393633363963386438223b733a33323a223866396361383532316566386562623933316439356532666234663562306535223b733a33323a226138653436333761326232323737353234346438343331326366613631366266223b733a33323a226232626265663566333063373335383265343631653861646237633036343963223b733a33323a223665363438623830626430623438656537343331663332623761373535323432223b733a33323a223962666563633062353763303033316561373539643839646361646230323030223b7d733a343a2268617368223b733a36353a2239626665636330623537633030333165613735396438396463616462303230302d3665363438623830626430623438656537343331663332623761373535323432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618867472);

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
('administrator_email', '\"meyssa.beddar@hotmail.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"medas\"'),
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

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'meyssa.beddar@hotmail.fr', 'meyssa', '2021-03-22 09:10:59', '2021-03-22 09:11:00', '$2y$10$xXMJx/ogSLIob5pCY.VKUuLwx3j3BTFUxo27MCq.M8faaHVUJLfPq', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-03-22 09:12:50', '2021-03-22 09:13:11', '$2y$10$9mVWirQQfKKWTq4huNGQUul9G.G9cLNY9KmOfw.a2D./wQiWABgH6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

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
(3, 2, 548, NULL, 'literal', '', 'FLAUBERT', NULL, 1),
(4, 2, 549, NULL, 'literal', '', 'Hugo', NULL, 1),
(5, 2, 558, NULL, 'literal', '', '.', NULL, 1),
(6, 2, 1, NULL, 'literal', '', 'FLAUBERT Hugo', NULL, 1),
(7, 2, 4, NULL, 'literal', '', 'Médecin généraliste', NULL, 1),
(8, 3, 548, NULL, 'literal', '', 'MARTINS', NULL, 1),
(9, 3, 549, NULL, 'literal', '', 'Jérémy', NULL, 1),
(10, 3, 558, NULL, 'literal', '', '.', NULL, 1),
(11, 3, 1, NULL, 'literal', '', 'MARTINS Jérémy', NULL, 1),
(12, 3, 4, NULL, 'literal', '', 'Médecin généraliste', NULL, 1),
(13, 4, 548, NULL, 'literal', '', 'DUMONT', NULL, 1),
(14, 4, 549, NULL, 'literal', '', 'Mélanie', NULL, 1),
(15, 4, 550, NULL, 'literal', '', '18 passages desgrais', NULL, 1),
(16, 4, 551, NULL, 'literal', '', 'Paris', NULL, 1),
(17, 4, 559, NULL, 'literal', '', '.', NULL, 1),
(18, 4, 1, NULL, 'literal', '', 'DUMONT Mélanie', NULL, 1),
(19, 5, 548, NULL, 'literal', '', 'KEDIRE', NULL, 1),
(20, 5, 549, NULL, 'literal', '', 'Martin', NULL, 1),
(21, 5, 550, NULL, 'literal', '', '18 rue notre dame de lorette', NULL, 1),
(22, 5, 551, NULL, 'literal', '', 'Paris', NULL, 1),
(23, 5, 559, NULL, 'literal', '', '.', NULL, 1),
(24, 5, 1, NULL, 'literal', '', 'KEDIRE Martin', NULL, 1),
(25, 6, 548, NULL, 'literal', '', 'RICHARD', NULL, 1),
(26, 6, 549, NULL, 'literal', '', 'Frederic', NULL, 1),
(27, 6, 550, NULL, 'literal', '', '15 rue du clos beauvoys', NULL, 1),
(28, 6, 551, NULL, 'literal', '', 'Villeneuve la Garenne', NULL, 1),
(29, 6, 559, NULL, 'literal', '', '.', NULL, 1),
(30, 6, 1, NULL, 'literal', '', 'RICHARD Frederic', NULL, 1),
(31, 7, 554, NULL, 'literal', '', '2020-02-01 14:00:00', NULL, 1),
(32, 7, 1, NULL, 'literal', '', 'Consultation MARTINS du 01/02/20 - 14h00 ', NULL, 1),
(33, 7, 1, 3, 'resource', NULL, NULL, NULL, 1),
(34, 7, 4, NULL, 'literal', '', 'Voir le patient et le médecin concernés', NULL, 1),
(35, 7, 4, 5, 'resource', NULL, NULL, NULL, 1),
(36, 7, 4, 3, 'resource', NULL, NULL, NULL, 1),
(37, 8, 554, NULL, 'literal', '', '2020-02-01 14:00:00', NULL, 1),
(38, 8, 555, NULL, 'literal', '', 'PARACETAMOL TEVA 1 g cp', NULL, 1),
(39, 8, 555, NULL, 'uri', NULL, '', 'https://www.vidal.fr/medicaments/paracetamol-teva-1-g-cp-64682.html', 1),
(40, 8, 555, NULL, 'literal', '', 'Antalgique', NULL, 1),
(41, 8, 1, NULL, 'literal', '', 'Ordonnance 1', NULL, 1),
(42, 8, 1, 3, 'resource', NULL, NULL, NULL, 1),
(43, 8, 1, 5, 'resource', NULL, NULL, NULL, 1),
(44, 8, 4, NULL, 'literal', '', 'Traitement antalgique pour angine', NULL, 1);

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
(6, 1, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', ''),
(7, 1, 'http://www.disit.org/km4city/schema', 'km4c', 'km4city', ''),
(8, 1, 'https://cabinetmedical.fr/onto/cabmed#', 'cabmed', 'Cabinet medical', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=755;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
