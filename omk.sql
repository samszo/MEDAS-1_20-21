-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2021 at 04:58 PM
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
-- Database: `omeka_master`
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
(1, 'items', 1, 1, 'Raymond Domenech', 'Raymond Domenech\nEntraineur de l\'equipe de foot'),
(2, 'items', 1, 1, 'Equipe de France', 'Equipe de France'),
(3, 'items', 1, 1, 'Joueur de Football americain', 'Joueur de Football americain'),
(4, 'items', 1, 1, 'Seance de sports hebdomadaire', 'Seance de sports hebdomadaire\nEntrainement qui se déroule tous les lundis '),
(5, 'items', 1, 1, 'Joueur de Basket', 'Joueur de Basket\nMeneur dans une équipe de basket'),
(6, 'items', 1, 1, 'Entraineur pour les sportifs au Basket et au Football', 'Entraineur pour les sportifs au Basket et au Football\nIl entraine tous les lundis et jeudi');

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
(1),
(2),
(3),
(4),
(5),
(6);

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
('ssAVzk0IjQ64dleBRJPoUzRMdVfJRESx', 2, '2021-03-08 17:23:52', 1);

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
(185, NULL, 5, 'numberOfSports', 'numbre de sports', NULL),
(186, 1, 6, 'accessToElement', 'Access to element', 'An entry rule refers to a specific Road element.'),
(187, 1, 6, 'approvedByPa', 'Approved by PA', 'To connect a resolution to the municipality that have approved it.'),
(188, 1, 6, 'arrangedOnRoad', 'Arranged on road', 'To connect each beacon to the road in which it is installed.'),
(189, 1, 6, 'atBusStop', 'At bus stop', 'Each forecast refers to a specific bus stop.'),
(190, 1, 6, 'beginsAtJunction', 'Begins at junction', 'Each routeLink, has a beginning and an end junction.'),
(191, 1, 6, 'belongToMunicipality', 'Belong to municipality', 'A municipality can be divided in districts.'),
(192, 1, 6, 'belongToRoad', 'Belong to road', 'Each road has street numbers.'),
(193, 1, 6, 'coincideWith', 'Coincide with', 'There is no exact match between Road and AdministrativeRoad.'),
(194, 1, 6, 'composeDirection', 'Compose direction', 'A railway Direction is composed by more railway element.'),
(195, 1, 6, 'composeSection', 'Compose section', 'A railway Section is composed by more railway element.'),
(196, 1, 6, 'concernLine', 'Concern line', 'An AVMrecord concert to a unique line.'),
(197, 1, 6, 'concerningNode', 'Concerning node', 'A maneuver takes place in correspondence of a node.'),
(198, 1, 6, 'consistOfElement', 'Consist of element', 'A railway Direction is composed by more railway element.'),
(199, 1, 6, 'containsElement', 'Contains element', 'A road is formed by more elements road.'),
(200, 1, 6, 'correspondToJunction', 'Correspond to junction', 'Train station and good yard are located precisely on a junction.'),
(201, 1, 6, 'correspondsTo', 'Corresponds to', 'There is no exact match between Road and AdministrativeRoad.'),
(202, 1, 6, 'endAtJunction', 'End at junction', 'A railway element is delimited by two junctions.'),
(203, 1, 6, 'endingJunction', 'Ending junction', 'A road link is delimited by two junctions.'),
(204, 1, 6, 'endsAtNode', 'Ends at node', 'A road element is delimited by 2 nodes.'),
(205, 1, 6, 'endsAtStop', 'Ends at stop', 'A route section is delimited by two consecutive bus stops.'),
(206, 1, 6, 'finishesAtJunction', 'Finishes at junction', 'Each routeLink, has a beginning and an end junction.'),
(207, 1, 6, 'formingAdminRoad', 'Forming administrative road', 'More road elements form an administrative road.'),
(208, 1, 6, 'formsTable', 'Forms table', 'More road sensors form a sensor Table.'),
(209, 1, 6, 'hasAVMRecord', 'Has avm record', 'The AVM refer to a specific ride code.'),
(210, 1, 6, 'hasAccess', 'Has acceess', 'Point corresponding to the house number of service.'),
(211, 1, 6, 'hasBObservation', 'Has beacon observation', 'To connect each beacon to observations that it produces.'),
(212, 1, 6, 'hasCarParkSensor', 'Has car park sensor', 'To connect each car park to its installed sensor.'),
(213, 1, 6, 'hasDistrict', 'Has district', 'A municipality can be divided in districts.'),
(214, 1, 6, 'hasElement', 'Has element', 'A railway line is composed by more railway element.'),
(215, 1, 6, 'hasExpectedTime', 'Has expected time', 'The expected time at the next bus stops.'),
(216, 1, 6, 'hasExternalAccess', 'Has external access', 'It corresponds to the outer gate of the building.'),
(217, 1, 6, 'hasFirstElem', 'Has first element', 'The first element concerned by the maneuver.'),
(218, 1, 6, 'hasFirstSection', 'Has first section', 'Defines which is the departure section of a route.'),
(219, 1, 6, 'hasFirstStop', 'Has first stop', 'Defines which is the departure stop of a route.'),
(220, 1, 6, 'hasForecast', 'Has forecast', 'Each forecast refers to a specific bus stop.'),
(221, 1, 6, 'hasGeometry', 'Has geometry', 'Some services and all railway elements have a specific geometry like polygons or linestrings.'),
(222, 1, 6, 'hasInternalAccess', 'Has internal access', 'It corresponds to the door of the building.'),
(223, 1, 6, 'hasLastStop', 'Has last stop', 'Defines which is the last stop of a route.'),
(224, 1, 6, 'hasLastStopTime', 'Has last stop time', 'The arrival time at last bus stops.'),
(225, 1, 6, 'hasManeuver', 'Has maneuver', 'An entry rule can be connected to a specific maneuver.'),
(226, 1, 6, 'hasMonitoringStation', 'Has monitoring station', 'Relates an ICQA agglomeration to its monitoring stations.'),
(227, 1, 6, 'hasMunicipality', 'Has municipality', 'A province is formed by more municipalities.'),
(228, 1, 6, 'hasObservation', 'Has observation', 'Each road sensor produce a report every 20 minutes.'),
(229, 1, 6, 'hasPrediction', 'Has prediction', 'A report is made up of more predictions.'),
(230, 1, 6, 'hasProvince', 'Has province', 'In a region there are more than one province.'),
(231, 1, 6, 'hasRecord', 'Has record', 'Every 10 minutes a sensor sends a report.'),
(232, 1, 6, 'hasRegularService', 'Has regular service', 'Regular services can be connected to transverse services.'),
(233, 1, 6, 'hasResolution', 'Has resolution', 'To connect a resolution to the municipality that have approved it.'),
(234, 1, 6, 'hasRoadElement', 'Has road element', 'More road elements form an administrative road.'),
(235, 1, 6, 'hasRoute', 'Has route', 'Each route refers to a line.'),
(236, 1, 6, 'hasRouteLink', 'Has route link', 'A route section is composed by more route link.'),
(237, 1, 6, 'hasRule', 'Has rule', 'Some road elements are subject to rules of access.'),
(238, 1, 6, 'hasSecondElem', 'Has second element', 'The second element concerned the maneuver.'),
(239, 1, 6, 'hasSection', 'Has section', 'Defines all the other section of a route.'),
(240, 1, 6, 'hasSegment', 'Has segment', 'Each road element can be see as a collection of consecutive road link.'),
(241, 1, 6, 'hasStatistic', 'Has statistic', 'To connect a statistic to the referred municipality.'),
(242, 1, 6, 'hasStreetNumber', 'Has street number', 'Each road has street numbers.'),
(243, 1, 6, 'hasThirdElem', 'Has third element', 'The third element concerned the maneuver.'),
(244, 1, 6, 'hasTransferService', 'Has transfer Service', 'To connect each train station to the correspondant service.'),
(245, 1, 6, 'hasTransverseService', 'Has transverse service', 'Regular services can be connected to transverse services.'),
(246, 1, 6, 'hasWeatherReport', 'Has weather report', 'Each weather forecasts is connected to a municipality.'),
(247, 1, 6, 'inMunicipalityOf', 'In municipality of', 'Municipality to which the road belongs.'),
(248, 1, 6, 'includeForecast', 'Include forecast', 'Each AVMrecord includes more forecasts.'),
(249, 1, 6, 'instantAVM', 'Instant avm', 'The arrival time at last bus stops.'),
(250, 1, 6, 'instantBObserv', 'Instant Beacon Observ', 'Time and date of each Beacon observation.'),
(251, 1, 6, 'instantForecast', 'Instant forecast', 'The expected time at the next bus stops.'),
(252, 1, 6, 'instantObserv', 'Instant observation', 'The time of one observation.'),
(253, 1, 6, 'instantParking', 'Instant parking', 'The generation time of one situation record.'),
(254, 1, 6, 'instantWReport', 'Instant weather report', 'The generation time of a new weather report.'),
(255, 1, 6, 'isComposedByElement', 'Is composed by element', 'A railway section is composed by more railway element.'),
(256, 1, 6, 'isInElement', 'Is in element', 'Each milestone need to refers to a road element.'),
(257, 1, 6, 'isInMunicipality', 'Is in municipality', 'A bus stop can be connected to the municipality to which belong.'),
(258, 1, 6, 'isInRoad', 'Is in road', 'Service and train station can be connected to the referred Road.\n'),
(259, 1, 6, 'isPartOfICQAAgglomeration', 'Is part of ICQA agglomeration', 'Relates each air quality monitoring station to the ICQA agglomerate where it is located.'),
(260, 1, 6, 'isPartOfLine', 'Is part of line', 'A railway line is composed by more railway element.'),
(261, 1, 6, 'isPartOfLot', 'Is part of lot', 'Bus stops and bus lines are part of a lot.'),
(262, 1, 6, 'isPartOfProvince', 'Is part of province', 'A province is formed by more municipalities.'),
(263, 1, 6, 'isPartOfRegion', 'Is part of region', 'In a region there are more than one province.'),
(264, 1, 6, 'isPartOfRoad', 'Is part of Road', 'More road elements compose a road.'),
(265, 1, 6, 'lastStop', 'Last stop', 'The AVMrecord specify which is the last bus stop made.'),
(266, 1, 6, 'managingAuthority', 'Managing authority', 'The authority that deals with the road elements management.'),
(267, 1, 6, 'measuredByBeacon', 'Measured by beacon', 'To connect each observation to the beacon that has produced it.'),
(268, 1, 6, 'measuredBySensor', 'Measured by sensor', 'Each observation refers to only one road sensor.'),
(269, 1, 6, 'measuredDate', 'Measured date', 'Time and date of each Beacon observation.'),
(270, 1, 6, 'measuredTime', 'Measured time', 'The time of one observation.'),
(271, 1, 6, 'observationTime', 'Observation time', 'The generation time of one situation record.'),
(272, 1, 6, 'observeCarPark', 'Observe car park', 'To connect each sensor to the referred car park service.'),
(273, 1, 6, 'onRoute', 'On route', 'Rides and AVMrecords refer to a specific route.'),
(274, 1, 6, 'ownerAuthority', 'Owner authority', 'The authority that owns the administrative road.'),
(275, 1, 6, 'placedInElement', 'Placed in element', 'Each entry need to refers to a road.'),
(276, 1, 6, 'placedOnRoad', 'Placed on road', 'To connect each road sensor to the road in which is installed.'),
(277, 1, 6, 'refersToMunicipality', 'Refers to municipality', 'Specifies the municipality for the weather forecast.'),
(278, 1, 6, 'refersToRide', 'Refers to ride', 'The AVM refer to a specific ride code.'),
(279, 1, 6, 'refersToRoadElement', 'Refers to road element', 'Refers to road element'),
(280, 1, 6, 'relatedToSensor', 'Related to sensor', 'Refers to the parking where the situation record was produced.'),
(281, 1, 6, 'scheduledOnLine', 'Scheduled on line', 'A ride can be scheduled on a single line.'),
(282, 1, 6, 'startAtJunction', 'Start at junction', 'A railway element is delimited by two junctions.'),
(283, 1, 6, 'startingJunction', 'Starting junction', 'A road link is delimited by two junctions.'),
(284, 1, 6, 'startsAtNode', 'Starts at node', 'A road element is delimited by 2 nodes.'),
(285, 1, 6, 'startsAtStop', 'Start at stop', 'A route section is delimited by two consecutive bus stops.'),
(286, 1, 6, 'updateTime', 'Update time', 'The generation time of a new weather report.'),
(287, 1, 6, 'wasteType', 'Waste type', 'Specify the waste type (plastics, paper, glass, and the like).'),
(288, 1, 6, 'abbreviation', 'Abbreviation', 'Abbreviation of the description of the service.'),
(289, 1, 6, 'accessType', 'Access type', 'It provides an information about the data retrieval method (HTTP, Rest, etc.)'),
(290, 1, 6, 'adRoadName', 'Administrative Road Name', 'Official name of the road'),
(291, 1, 6, 'addressVillage', 'address village', 'It helps locate the service, specifying, for example, the historic building where it is located, the neighborhood, or something else.'),
(292, 1, 6, 'adminClass', 'Admin class', 'Administrative classification of the road'),
(293, 1, 6, 'airQuality', 'Air quality', 'It provides a measurement of the level of air pollution'),
(294, 1, 6, 'airQualityBenzene', 'Air quality - Benzene', 'Daily average concentration of Benzene expressed in micrograms per cubic meter.'),
(295, 1, 6, 'airQualityCO', 'Air quality - CO', 'Maximum mobile average over 8h of CO concentration expressed in milligrams per cubic meter'),
(296, 1, 6, 'airQualityCombinedCounter', 'Air quality - Combined', 'It provides an overall measure of air quality, combining different indicators appropriately.'),
(297, 1, 6, 'airQualityH2S', 'Air quality - H2S', 'Maximum hourly concentration of H2S expressed in micrograms per cubic meter'),
(298, 1, 6, 'airQualityICQAValue', 'Air quality - ICQA', 'It provides the value of the ICQA index defined by the Tuscany Region for the measurement of air quality at urban agglomeration level'),
(299, 1, 6, 'airQualityNO2', 'Air quality - NO2', 'Maximum hourly concentration of NO2 expressed in micrograms per cubic meter'),
(300, 1, 6, 'airQualityO3', 'Air quality - O3', 'Maximum hourly concentration of O3 expressed in micrograms per cubic meter'),
(301, 1, 6, 'airQualityPM10', 'Air quality - PM10', 'Daily average concentration of PM10 expressed in micrograms per cubic meter'),
(302, 1, 6, 'airQualityPM2.5', 'Air quality - PM2.5', 'Daily average concentration of PM2.5 expressed in micrograms per cubic meter.'),
(303, 1, 6, 'airQualitySO2', 'Air quality - SO2', 'Maximum hourly concentration of SO2 expressed in micrograms per cubic meter'),
(304, 1, 6, 'alertArea', 'Alert area', 'It identifies ​​the alert area in the context of water hazard prevention'),
(305, 1, 6, 'allowedArmedForcesAccess', 'Allowed armed forces access', 'It indicates whether an access restriction is active but allows transit to the armed forces.'),
(306, 1, 6, 'allowedAuthorizedVehiclesAccess', 'Allowed authorized veihicles access', 'It indicates whether an access restriction is active but still permits transit to authorized vehicles.'),
(307, 1, 6, 'allowedBicycleAccess', 'Allowed bicycle access', 'It indicates whether an access restriction is active but still permits the transit of bicycles.'),
(308, 1, 6, 'allowedDisabledAccess', 'Allowed disabled access', 'It indicates whether an access restriction is active but still allows for the disabled.'),
(309, 1, 6, 'allowedDriverIncludedRentedCarAccess', 'Allowed access to driver included rented car', 'It indicates whether an access restriction is active but still permits transit to cars rented with a driver.'),
(310, 1, 6, 'allowedElectricBicycleAccess', 'Allowed electric bicycle access', 'It indicates whether an access restriction is active but allows transit to electric bicycles.'),
(311, 1, 6, 'allowedExtraurbanBusAccess', 'Allowed extraurban bus access', 'It indicates whether an access restriction is active but allows transit to non-urban buses.'),
(312, 1, 6, 'allowedOnlyEmergencyAccess', 'Allowed only emergency access', 'It indicates whether an access restriction is active but allows transit to rescue vehicles.'),
(313, 1, 6, 'allowedOperatingVehiclesAccess', 'Allowed operating vehicles access', 'It indicates whether an access restriction is active, however it allows transit to the means involved in the work.'),
(314, 1, 6, 'allowedPoliceAndEmergencyAccess', 'Allowed police and emergency access', 'It indicates whether an access restriction is active but allows transit to the police and rescue vehicles.'),
(315, 1, 6, 'allowedUrbanBusAccess', 'Allowed urban bus access', 'It indicates whether an access restriction is active but still allows for urban bus transit.'),
(316, 1, 6, 'alterCode', 'Alter code', 'It indicates an alternative code for the road.'),
(317, 1, 6, 'alternativeEmail', 'Alternative e-mail', 'It indicates a secondary e-mail address.'),
(318, 1, 6, 'alternativeFax', 'Alternative fax', 'It indicates a secondary fax number.'),
(319, 1, 6, 'alternativeTelephone', 'Alternative phone', 'It indicates a secondary phone number.'),
(320, 1, 6, 'altitude', 'Altitude', 'It indicates the altitude to which the weather station is located.'),
(321, 1, 6, 'annualPM10ExceedanceCount', 'Air quality - PM10 Exceedance', 'It provides the count of the number of PM10 threshold strides in the last year.'),
(322, 1, 6, 'areaCode', 'Area code', 'Area code, defined at the municipal level, where the service or sensor  is located.'),
(323, 1, 6, 'areaName', 'Area name', 'Name of the area, defined at the municipal level, where the service or the sensor is located.'),
(324, 1, 6, 'atecoCode', 'Ateco code', 'It provides the ATECO classification code for the service.'),
(325, 1, 6, 'automaticity', 'Automaticity', 'It specifies whether data capture can be executed in a totally automated way or if an operator is needed.'),
(326, 1, 6, 'averageDistance', 'Average distance', 'Average distance between two vehicles passing one from one to the other.'),
(327, 1, 6, 'averageSpeed', 'Average speed', 'Average speed at which vehicles pass.'),
(328, 1, 6, 'averageTime', 'Average time', 'Average time between 2 transits'),
(329, 1, 6, 'axialMass', 'Axial mass', 'It provides a railway line classification code based on the maximum allowed axial mass'),
(330, 1, 6, 'batteryLevel', 'Battery level', 'It indicates the level of the batteries, in a waste container with advanced features.'),
(331, 1, 6, 'blueCodeCount', 'Code blue count', 'It provides an indication of the number of red code patients present in the First Aid facility when detecting. The property is called blue code, resuming the classification used in some English-speaking countries.'),
(332, 1, 6, 'botanicalFamily', 'Botanical family', 'Botanical family'),
(333, 1, 6, 'capacity', 'Capacity', 'The capacity of the parking lot, or the garbage container.'),
(334, 1, 6, 'carParkStatus', 'Car park status', 'It describes the status of the parking lot, indicating whether there are any vacancies, if it is full, or if there is no information on the presence of vacant posts.'),
(335, 1, 6, 'category', 'Category', 'It provides the railway station category, an overall indicator of the quality of the railway line.'),
(336, 1, 6, 'classCode', 'Class code', 'It indicates the color of the civic number, for those cities where there are two independent numbering systems, the red numbers and the black numbers.'),
(337, 1, 6, 'collectionTime', 'Collection time', 'The time when the waste container is emptied.'),
(338, 1, 6, 'combinedTraffic', 'Combined traffic', 'It provides a technical information related to the railroad.'),
(339, 1, 6, 'composition', 'Composition', 'It indicates whether the stretch of road is on a single road or on separate roadways.'),
(340, 1, 6, 'concentration', 'Concentration', 'It provides the concentration of vehicles detected by the traffic sensor.'),
(341, 1, 6, 'currentWaterLevel', 'Current water level', 'It indicates the last detected water level.'),
(342, 1, 6, 'currentWindDirection', 'Current wind direction', 'It provides the last detected wind direction.'),
(343, 1, 6, 'currentWindGustSpeed', 'Current wind gust speed', 'Windness detected by equally fractionating the time, and  returning the peak of the last fraction.'),
(344, 1, 6, 'currentlyActive', 'Currently active', 'Currently active'),
(345, 1, 6, 'dailyO3ExceedanceCount', 'Air quality - O3 exceedance count', 'Number of times in the day that O3 concentracion is over 180mg/m3'),
(346, 1, 6, 'dailyO3ExceedanceHours', 'Air quality - O3 exceedance duration', 'Hours in the day that O3 concentracion is over 180mg/m3'),
(347, 1, 6, 'day', 'Day', 'Day to which the weather forecast refers.'),
(348, 1, 6, 'depthKm', 'Depth', 'Depth in kilometers'),
(349, 1, 6, 'direction', 'Direction', 'Direction of the route.'),
(350, 1, 6, 'distance', 'Distance', 'Distance between two stops within the route.'),
(351, 1, 6, 'districtCode', 'District code', 'Code of the neighborhood where the service is located.'),
(352, 1, 6, 'elemLocation', 'Element location', 'It provides a categorization of the road or rail segment, indicating whether it is on a bridge, rather than inside a tunnel or other.'),
(353, 1, 6, 'elementClass', 'Element class', 'It provides an indication of the importance of the road to which the road segment belongs (motorway, street, urban road and so on)'),
(354, 1, 6, 'elementType', 'Element type', 'It provides a categorization of the road or rail segment, for example, for a road segment, it says if it is located at a crossroad, on a roundabout, on a square, on a parking lot, and so on.'),
(355, 1, 6, 'enrolledStudents', 'number of enrolled students', NULL),
(356, 1, 6, 'entryType', 'Entry type', 'It indicates whether it is an interior pass, rather than an outside outcrop overlooking the public road, or something else.'),
(357, 1, 6, 'estimatedYearsToReturn', 'estimatedYearsToReturn', 'estimatedYearsToReturn'),
(358, 1, 6, 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours', 'estimatedYearsToReturn12Hours'),
(359, 1, 6, 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour', 'estimatedYearsToReturn1Hour'),
(360, 1, 6, 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours', 'estimatedYearsToReturn24Hours'),
(361, 1, 6, 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours', 'estimatedYearsToReturn3Hours'),
(362, 1, 6, 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours', 'estimatedYearsToReturn6Hours'),
(363, 1, 6, 'eventCategory', 'Event category', 'It provides the type of event, whether it is a theatrical work, a festival, an extraordinary opening, a sporting event, and so on.'),
(364, 1, 6, 'eventTime', 'Event time', 'It shows the start time of the event.'),
(365, 1, 6, 'exitRate', 'Exit rate', 'It provides the vehicle exit rate from the parking lot, ie the number of outgoing vehicles per hour.'),
(366, 1, 6, 'expectedTime', 'Expected time', 'Timetable for bus arrival at the stop. TO DELETE WHEN INSTANT FUNCTIONS TO PERFECT.'),
(367, 1, 6, 'exponent', 'Exponent', 'It provides the literal part of the civic number, if present.'),
(368, 1, 6, 'extendName', 'Extend name', 'It provides the full name of the road, including generic naming.'),
(369, 1, 6, 'extendNumber', 'Extend number', 'It provides the civic number for extended, including both the numerical part and the literal number where it is present.'),
(370, 1, 6, 'fillRate', 'Fill rate', 'It provides the parking rate, as the number of inbound vehicles per hour.'),
(371, 1, 6, 'firenzeCard', 'Firenze card', 'It provides whether the service is provided on favorable terms to holders of Firenze Card.'),
(372, 1, 6, 'firstAidState', 'State of First Aid', 'It indicates whether the counts refer to the total number of people standing in the First Aid with that specific code, or only to those who are at a specific stage (visiting, pending, observing, and so on).'),
(373, 1, 6, 'flowRate', 'Flow rate', 'Sliding rate'),
(374, 1, 6, 'free', 'Free', 'It provides the number of free places in the parking lot.'),
(375, 1, 6, 'freeEvent', 'Free event', 'It indicates whether the event is free or paid.'),
(376, 1, 6, 'freephone', 'freephone', 'It provides the green number to dial to get in touch with the service call center.'),
(377, 1, 6, 'gauge', 'Gauge', 'It provides the type of gauge, which can be reduced or standard.  It\'s a technical information relating to the railroad.'),
(378, 1, 6, 'geographicAreaType', 'Geographic area type', 'The geographic area type where the sensor is (eg. urban, suburban).'),
(379, 1, 6, 'greenCodeCount', 'Green code count', 'It provides the number of patients who are admitted to Green Emergency Rescue.'),
(380, 1, 6, 'heightHour', 'Height hour', 'It provides the time when the sun is expected to reach its maximum height.'),
(381, 1, 6, 'hour', 'Hour', 'It provides the time the weather forecast refers to.'),
(382, 1, 6, 'hourO3Max', 'Air quality - Maximum O3 exceedance', 'Hour in the day that O3 concentracion is at maximum'),
(383, 1, 6, 'houseNumber', 'House number', 'It provides the civic number where the service is located or where the event takes place.'),
(384, 1, 6, 'humidity', 'Humidity', 'Percentage of humidity.'),
(385, 1, 6, 'inAgglomeration', 'Agglomeration', 'The agglomeration where the monitoring station is'),
(386, 1, 6, 'internalTemperature', 'Internal temperature', 'Internal temperature'),
(387, 1, 6, 'isSelfService', 'is a self-service', 'It indicates whether the service is a refueling station self-service.'),
(388, 1, 6, 'juncType', 'Junction type', 'It indicates the type of railway junction, for example whether it is a level crossing, a track termination, a freight train, and so on.'),
(389, 1, 6, 'lastObservationHumidity', 'Last observation humidity', 'it indicates the last humidity value detected by the weather station.'),
(390, 1, 6, 'lastStopTime', 'Last stop time', 'The time the bus has reached the last stop. TO BE DELETED WHEN INSTANT FUNCTIONS TO PERFECT.'),
(391, 1, 6, 'lastTriples', 'Last triples', 'It indicates the last date when the RDF triples have been updated.'),
(392, 1, 6, 'lastUpdate', 'Last update', 'It indicates the last date when the source data has been updated.'),
(393, 1, 6, 'leafWetness', 'Leaf wetness', 'Humidity value detected by intelligent sprinkler.'),
(394, 1, 6, 'length', 'Length', 'It provides the length of the road segment (road element) or rail line.'),
(395, 1, 6, 'lineNumber', 'Line number', 'Indica il numero della linea a cui la fermata appartiene.'),
(396, 1, 6, 'lunarPhase', 'Lunar phase', 'Monn phase.'),
(397, 1, 6, 'magnitudeType', 'Magnitude type', 'It indicates the type of magnitude of the earthquake event.'),
(398, 1, 6, 'magnitudeValue', 'Magnitude value', 'It indicates the magnitude of the earthquake event.'),
(399, 1, 6, 'major', 'Major', 'The major, in a Beacon device, is a positive integer that, together with the minor and the UUID, uniquely identifies the device.'),
(400, 1, 6, 'managingAuth', 'Managing authority', 'It identifies the administration or the company responsible for managing the railway station.'),
(401, 1, 6, 'managingBy', 'Managing by', 'AVM system or road sensors operator.'),
(402, 1, 6, 'maneuverType', 'Maneuver type', 'It describes the type of restriction (bifurcation, forbidden maneuver, mandatory maneuver).'),
(403, 1, 6, 'maxTemp', 'Max temperature', 'It provides the maximum expected temperature.'),
(404, 1, 6, 'minTemp', 'Min temperature', 'It provides the minimum expected temperature.'),
(405, 1, 6, 'minor', 'Minor', 'The minor, in a Beacon device, is a positive integer that, together with the major and the UUID, uniquely identifies the device.'),
(406, 1, 6, 'monitoringStationType', 'Monitoring station type', 'Type of montioring station (e.g. fondo, traffico, industriale)'),
(407, 1, 6, 'moonrise', 'Moonrise', 'It provides the expected time for the moon to rise.'),
(408, 1, 6, 'moonset', 'Moonset', 'In indicates the expected time for the moon to set.'),
(409, 1, 6, 'multimediaResource', 'Multimedia resource', 'It provides the Internet address of a media resource related to the service.'),
(410, 1, 6, 'nodeType', 'Node type', 'It provides the node\'s category (intersection, toll, roundabout, roadway terminal, and so on).'),
(411, 1, 6, 'numTrack', 'Track number', 'The number of available tracks. Set to zero in the case of a railway section under construction or discarded.'),
(412, 1, 6, 'number', 'Number', 'It provides the numerical part of the civic number.'),
(413, 1, 6, 'occupancy', 'Occupancy', 'It provides the occupancy rate of the road detected by the traffic sensor.'),
(414, 1, 6, 'occupied', 'Occupied', 'Number of occupied parking spaces.'),
(415, 1, 6, 'operatingStatus', 'Operating status', 'It indicates whether the road element or railroad section is under construction, in operation, or has been discarded.'),
(416, 1, 6, 'otherHouseNumber', 'Other house number', 'It provides a second civic number to which the service can be accessed.'),
(417, 1, 6, 'otherStreetAddress', 'Other street address', 'It provides a second street address to which the service can be accessed.'),
(418, 1, 6, 'overtime', 'Overtime', 'It indicates the maximum execution time of the import process, after which it is killed.'),
(419, 1, 6, 'owner', 'Owner', 'AVM system owner.'),
(420, 1, 6, 'parkOccupancy', 'Park occupancy', 'Percentage of occupied parking spaces.'),
(421, 1, 6, 'parkingSpacesForDisabled', 'Parking spaces for disabled', 'It indicates the number of parking places reserved to disabled people.'),
(422, 1, 6, 'parkingSpacesForScooters', 'Parking spaces for scooters', 'It indicates the number of parking places reserved for scooters and similar.'),
(423, 1, 6, 'payingParkingSpaces', 'Paying parking spaces', 'It indicates the number of available paid places.'),
(424, 1, 6, 'perTemp', 'Perc. temperature', 'Indicates the expected perceived temperature.'),
(425, 1, 6, 'period', 'Period', 'It indicates the time expressed in seconds between two consecutive calls of the same process.'),
(426, 1, 6, 'physicalShape', 'Container shape', 'It indicates the shape of the waste bin with advanced features.'),
(427, 1, 6, 'placeName', 'Place name', 'It indicates the name of the place where the event takes place.'),
(428, 1, 6, 'pollenConcentration', 'Pollen', 'Pollen concentration'),
(429, 1, 6, 'pollenConcentrationLevel', 'Pollen concentration level', 'Pollen concentration level'),
(430, 1, 6, 'pollenConcentrationTrend', 'Pollen concentration trend', 'Pollen concentration trend.'),
(431, 1, 6, 'porteCochere', 'Porte cochere', 'It indicates if the entry is a porte cochere.'),
(432, 1, 6, 'power', 'Power', 'Indicates the power of the lamppost.'),
(433, 1, 6, 'primaryType', 'Primary type', 'It describes the main service that is provided.'),
(434, 1, 6, 'processType', 'Process type', 'It describes the type of process.'),
(435, 1, 6, 'public', 'Public', 'It indicates whether it is a public lighting streetlight.'),
(436, 1, 6, 'railDepartment', 'Rail department', 'It indicates the railway department of which the railway line is part.'),
(437, 1, 6, 'railwaySiding', 'Railway siding', 'It provides the number of sidings available in the goods yard.'),
(438, 1, 6, 'rainfall', 'Rainfall', 'Rainfall Detection'),
(439, 1, 6, 'rainfallLast12Hours', 'Rainfall last 12 hours', 'Rainfall detection within the last 12 hours.'),
(440, 1, 6, 'rainfallLast15Minutes', 'Rainfall last 15 minutes', 'Rainfall detection within the last 15 minutes.'),
(441, 1, 6, 'rainfallLast1Hour', 'Rainfall last 1 hour', 'Rainfall detection within the last hour.'),
(442, 1, 6, 'rainfallLast24Hours', 'Rainfall last 24 hours', 'Rainfall detection within the last 24 hours.'),
(443, 1, 6, 'rainfallLast36Hours', 'Rainfall last 36 hours', 'Rainfall detection within the last 36 hours.'),
(444, 1, 6, 'rainfallLast3Hours', 'Rainfall last 3 hours', 'Rainfall detection within the last 3 hours.'),
(445, 1, 6, 'rainfallLast6Hours', 'Rainfall last 6 hours', 'Rainfall detection within the last 6 hours.'),
(446, 1, 6, 'recTemp', 'Rec temp', 'It returns the temperature actually detected.'),
(447, 1, 6, 'rechargeState', 'Charging station status', 'Describes the status of the column for charging electric vehicles.'),
(448, 1, 6, 'redCodeCount', 'Red code count', 'It provides the number of patients who are admitted to Red Emergency Assistance.'),
(449, 1, 6, 'referencePerson', 'Reference person', 'Reference person'),
(450, 1, 6, 'restrictionType', 'Restriction type', 'It describes the type of the active restriction.'),
(451, 1, 6, 'restrictionValue', 'Restriction value', 'It provides a quantification for the active restriction, when applicable.'),
(452, 1, 6, 'rideState', 'Ride state', 'State of the ride: advance, late, on time.'),
(453, 1, 6, 'riverName', 'River name', 'River name'),
(454, 1, 6, 'roadName', 'Road name', 'It indicates the name of the road without the generic naming.'),
(455, 1, 6, 'roadType', 'Road type', 'It indicates the generic naming only.'),
(456, 1, 6, 'routeCode', 'Route code', 'It provides the code of the thematic path.'),
(457, 1, 6, 'routeLength', 'Route length', 'It provides the route length.'),
(458, 1, 6, 'routePosition', 'Route position', 'It provides the position of the service within the thematic path.'),
(459, 1, 6, 'severityCode', 'Severity code', 'It provides a code that describes the severity of the event, used for mobility events.'),
(460, 1, 6, 'shortDescription', 'Short description', 'Brief indication of where the service is provided.'),
(461, 1, 6, 'snow', 'Snow', 'It provides a forecast about the snowfalls.'),
(462, 1, 6, 'soilWaterPotential', 'Soil water potential', 'It provides the soil water potential detected by the intelligent sprinkler.'),
(463, 1, 6, 'speedLimit', 'Speed limit', 'It indicates the speed limit in force on the specific road section.'),
(464, 1, 6, 'speedPercentile', 'Speed percentile', 'Percentile calculated on the speeds detected by the traffic sensor.'),
(465, 1, 6, 'state', 'State', 'Describes the status of a charging station for electric vehicles, or a railway station.'),
(466, 1, 6, 'stopNumber', 'Stop number', 'It indicates the number of the TPL stop.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(467, 1, 6, 'streetWithCurb', 'Street with curb', 'It indicates if the middle line is replaced by a separation wall.'),
(468, 1, 6, 'streetWithRtzAccess', 'Street with Restricted Traffic Zone access', 'Indicates whether or not the street belongs to a restricted traffic zone.'),
(469, 1, 6, 'studentsAtRefectory', 'number of students at the refectory', NULL),
(470, 1, 6, 'studentsAtSchool', 'number of students present at school', NULL),
(471, 1, 6, 'sunHeight', 'Sun height', 'Indicates the maximum height that will reach the sun during the day.'),
(472, 1, 6, 'sunrise', 'Sunrise', 'Indicates the time at which the sun will rise.'),
(473, 1, 6, 'sunset', 'Sunset', 'Indicates the time at which the sun will set.'),
(474, 1, 6, 'supply', 'Supply', 'Indicates whether it is an electrified line or not.'),
(475, 1, 6, 'surfaceArea', 'Surface area', 'Surface area'),
(476, 1, 6, 'temperature', 'Temperature', 'Temperature detection.'),
(477, 1, 6, 'temperatureLastObservation', 'Temperature last observation', 'It indicates the latest detected temperature value.'),
(478, 1, 6, 'temperatureMaxToday', 'Today max temperature', 'It indicates the maximum temperature value detected during the day.'),
(479, 1, 6, 'temperatureMaxYesterday', 'Yesterday max temperature', 'It indicates the maximum temperature value recorded on the previous day.'),
(480, 1, 6, 'temperatureMinToday', 'Today min temperature', 'It indicates the minimum temperature value detected during the day.'),
(481, 1, 6, 'temperatureMinYesterday', 'Yesterday min temperature', 'It indicates the minimum temperature value recorded on the previous day.'),
(482, 1, 6, 'text', 'Text', 'Returns the text written on the milestone (mileage).'),
(483, 1, 6, 'thresholdPerc', 'Threshold perc', 'Threshold value for the percentile of the speeds detected by the traffic sensor.'),
(484, 1, 6, 'time', 'Time', 'Times of last detection, and times of detection of extreme values, of humidity, precipitation, temperature and wind.'),
(485, 1, 6, 'timeHumidityObservation', 'Time humidity observation', 'Times of last detection, and times of detection of extreme values, of humidity.'),
(486, 1, 6, 'timeLastObservationHumidity', 'Time humidity last observation', 'Time of last detection of the humidity.'),
(487, 1, 6, 'timeLastObservationTemperature', 'Time last temperature observation', 'Time when the most recent temperature test was performed.'),
(488, 1, 6, 'timeLastObservationWind', 'Time wind last observation', 'The time when the latest wind speed detection was performed.'),
(489, 1, 6, 'timeRainfallLastObservation', 'Time rainfall last observation', 'The most recent rainfall detection.'),
(490, 1, 6, 'timeTemperatureObservation', 'Time temperature observation', 'Times of last detection, and times of detection of extreme values, of temperature.'),
(491, 1, 6, 'timeTodayMaxHumidity', 'Time today max humidity', 'Time when the maximum humidity concentration in the air was detected during the day.'),
(492, 1, 6, 'timeTodayMaxTemperature', 'Time today max temperature', 'The time when the maximum temperature was detected during the day.'),
(493, 1, 6, 'timeTodayMaxWindVelocity', 'Time today max wind velocity', 'The time when the maximum windiness was detected during the day.'),
(494, 1, 6, 'timeTodayMinHumidity', 'Time today min humidity', 'The time when the lowest concentration of humidity in the air was detected during the day.'),
(495, 1, 6, 'timeTodayMinTemperature', 'Time today min temperature', 'Time when the minimum temperature was detected during the day.'),
(496, 1, 6, 'timeWaterLevelObservation', 'Time water level observation', 'Time when the most recent water level detection was performed.'),
(497, 1, 6, 'timeWindObservation', 'Time wind observation', 'Times of last detection, and times of detection of extreme values, of windness.'),
(498, 1, 6, 'timeYesterdayMaxHumidity', 'Time yesterday max humidity', 'The time when the highest humidity concentration was detected during the previous day.'),
(499, 1, 6, 'timeYesterdayMaxTemperature', 'Time yesterday max temperature', 'The time when the maximum temperature was detected during the previous day.'),
(500, 1, 6, 'timeYesterdayMaxWindVelocity', 'Time yesterday max wind velocity', 'The time when the maximum windiness was detected during the previous day.'),
(501, 1, 6, 'timeYesterdayMinHumidity', 'time yesterday min humidity', 'Time when the lowest humidity concentration was detected during the previous day.'),
(502, 1, 6, 'timeYesterdayMinTemperature', 'Time yesterday min temperature', 'The time when the lowest temperature was detected during the previous day.'),
(503, 1, 6, 'timestamp', 'Time slot', 'One-second time interval, usually used as a time instant, to provide time allocation to a generic event. EVEN IF INSTANT IS INTRODUCED, THIS ATTRIBUTE MUST BE PRESERVED.'),
(504, 1, 6, 'todayMaxHumidity', 'Today max humidity', 'It provides the maximum value of humidity detected by the weather station throughout the day.'),
(505, 1, 6, 'todayMaxWaterLevel', 'Today max water level', 'It indicates the highest level of water detected in the day.'),
(506, 1, 6, 'todayMaxWindAverageSpeed', 'Today max wind average speed', 'Average windness of the day, determined by averaging the peaks.'),
(507, 1, 6, 'todayMaxWindDirection', 'Today max wind direction', 'It provides the wind direction detected at the peak windness of the day.'),
(508, 1, 6, 'todayMaxWindGustSpeed', 'Today max wind gust speed', 'Windness detected by equally fractionating the day and considering for each fraction the peak value only.'),
(509, 1, 6, 'todayMinHumidity', 'Today min humidity', 'It provides the minimum moisture value detected by the weather station throughout the day.'),
(510, 1, 6, 'todayMinWaterLevel', 'Today min water level', 'It indicates the lowest level of water detected in the day.'),
(511, 1, 6, 'trackType', 'Track type', 'Indicates whether the railway section is single track or double track.'),
(512, 1, 6, 'trafficDir', 'Traffic dir', 'It indicates whether the road section can be traveled in one or both directions.'),
(513, 1, 6, 'type', 'Type', 'It provides a first indication about the service delivered but is not intended to be shown to users.'),
(514, 1, 6, 'typeLabel', 'Type label', 'It provides a first description of the service provided, intended to be displayed to users and therefore available in multiple languages.'),
(515, 1, 6, 'typeOfResale', 'Type of resale', 'It describes the type of resale of TPL tickets (bars, bookstores, tobacconists, stationery, etc.).'),
(516, 1, 6, 'typicalIrrigationTime', 'Typical irrigation time', 'It indicates the usual time when the irrigator comes into operation.'),
(517, 1, 6, 'underpass', 'Underpass', 'It indicates whether the railroad section is within a subway.'),
(518, 1, 6, 'userTagId', 'User tag ID', 'An identifier for the smart waste container user.'),
(519, 1, 6, 'uuid', 'Uuid', 'Identifier that, together with major and minor, uniquely identifies the Beacon device.'),
(520, 1, 6, 'uv', 'Uv', 'Forecast about the intensity of UV rays.'),
(521, 1, 6, 'validityStatus', 'Validity status', 'It indicates whether the parking sensor is active or not.'),
(522, 1, 6, 'value', 'Value', 'It indicates the resulting value from the statistical detection.'),
(523, 1, 6, 'vehicle', 'Vehicle', 'Unique identifier of a local public transport vehicle.'),
(524, 1, 6, 'vehicleFlow', 'Vehicle flow', 'It indicates the flow of vehicles detected by the traffic sensor.'),
(525, 1, 6, 'wasteLevel', 'Waste level', 'It indicates the fill level of the waste bin with advanced features.'),
(526, 1, 6, 'waterLevel', 'Water level', 'Indicators relating to inland water monitoring.'),
(527, 1, 6, 'waterLevelVariation', 'Water level variation', 'Variations detected in the water level sampled every 1, 3, or 6, hours.'),
(528, 1, 6, 'waterLevelVariationLast1Hour', 'Water level variation last 1 hour', 'Variations detected in the water level sampled at every hour.'),
(529, 1, 6, 'waterLevelVariationLast3Hours', 'Water level variation last 3 hours', 'Variations detected in the water level sampled every 3 hours.'),
(530, 1, 6, 'waterLevelVariationLast6Hours', 'Water level variation last 6 hours', 'Variations detected in the water level sampled every 6 hours.'),
(531, 1, 6, 'whiteCodeCount', 'White code count', 'Number of patients admitted to White Emergency Assistance.'),
(532, 1, 6, 'width', 'Width', 'Road section width.'),
(533, 1, 6, 'wind', 'Wind', 'Expected windness.'),
(534, 1, 6, 'windAverageSpeed', 'Wind average speed', 'Average windness.'),
(535, 1, 6, 'windDirection', 'Wind direction', 'Wind direction'),
(536, 1, 6, 'windGustSpeed', 'Wind gust speed', 'Windness detected by equally fractionating the time and considering for each fraction the peak value only.'),
(537, 1, 6, 'yardType', 'Yard type', 'It indicates whether the goods yard is public or private.'),
(538, 1, 6, 'year', 'Year', 'It indicates the year when the resolution was approved.'),
(539, 1, 6, 'yellowCodeCount', 'Yellow code count', 'Number of patients admitted to First Aid in Yellow Code.'),
(540, 1, 6, 'yesterdayMaxHumidity', 'Yesterday max humidity', 'It provides the maximum value of humidity detected by the weather station over the previous day.'),
(541, 1, 6, 'yesterdayMaxWaterLevel', 'Yesterday max water level', 'Maximum water level recorded over the previous day.'),
(542, 1, 6, 'yesterdayMaxWindAverageSpeed', 'Yesterday max wind average speed', 'Average windness of the previous day, determined by averaging the peaks.'),
(543, 1, 6, 'yesterdayMaxWindDirection', 'Yesterday max wind direction', 'It provides the wind direction detected at the peak windness of the previous day.'),
(544, 1, 6, 'yesterdayMaxWindGustSpeed', 'Yesterday max wind gust speed', 'Windness detected by equally fractionating the previous day and considering for each fraction the peak value only.'),
(545, 1, 6, 'yesterdayMinHumidity', 'Yesterday min humidity', 'It provides the minimum value of humidity detected by the weather station over the previous day.'),
(546, 1, 6, 'yesterdayMinWaterLevel', 'Yesterday min water level', 'Minimum water level recorded over the previous day.');

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
(1, 1, 107, 4, NULL, 'Raymond Domenech', 1, '2021-03-21 19:41:50', '2021-03-21 19:41:50', 'Omeka\\Entity\\Item'),
(2, 1, 106, 2, NULL, 'Equipe de France', 1, '2021-03-21 19:42:39', '2021-03-21 19:42:39', 'Omeka\\Entity\\Item'),
(3, 1, 109, 3, NULL, 'Joueur de Football americain', 1, '2021-03-21 19:43:09', '2021-03-21 19:43:09', 'Omeka\\Entity\\Item'),
(4, 1, 762, 6, NULL, 'Seance de sports hebdomadaire', 1, '2021-04-19 16:40:02', '2021-04-19 16:40:02', 'Omeka\\Entity\\Item'),
(5, 1, 760, 5, NULL, 'Joueur de Basket', 1, '2021-04-19 16:41:07', '2021-04-19 16:41:07', 'Omeka\\Entity\\Item'),
(6, 1, 107, 4, NULL, 'Entraineur pour les sportifs au Basket et au Football', 1, '2021-04-19 16:42:07', '2021-04-19 16:50:41', 'Omeka\\Entity\\Item');

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
(106, 1, 5, 'SportsClub', 'sports club', NULL),
(107, NULL, 5, 'SportsManager', 'sports manager', 'According to the french label sub Soccer, trainership could be meant. However, here a Sportsmanager is interpreted as a member of the board of a sporting club.'),
(108, NULL, 5, 'SportsLeague', 'Αθλητική Ομοσπονδία', 'A group of sports teams or individual athletes that compete against each other in a specific sport.'),
(109, NULL, 5, 'AmericanFootballPlayer', 'American footballspeler', NULL),
(110, NULL, 5, 'Sport', 'Αθλήματα', 'A sport is commonly defined as an organized, competitive, and skillful physical activity.'),
(111, NULL, 5, 'HandballPlayer', 'Handballspieler', NULL),
(112, 1, 6, 'AVMRecord', 'AVM Record', 'Corsa programmata da una certa azienda TPL su un certo percorso di una certa linea'),
(113, 1, 6, 'Accommodation', 'Accommodation', 'Hotels and similar structures.'),
(114, 1, 6, 'Accommodation_or_office_containers_rental', 'Accommodation or office containers rental', 'The instances of this class represent, among all business activities, some companies that deal with rental of containers for housing and offices.'),
(115, 1, 6, 'Accountants', 'Accountants', 'The instances of this class represent, among all the business activities, certain commercial, tax and audit firms.'),
(116, 1, 6, 'Addiction_recovery_centre', 'Addiction recovery centre', 'The instances of this class represent, among all business activities, certain communities and recuperation centers from dependencies.'),
(117, 1, 6, 'AdministrativeRoad', 'Administrative Road', 'Class whose instances are the administrative extents defined in the road graph.'),
(118, 1, 6, 'Adult_clothing', 'Adult Clothing', 'The instances of this class represent, among all business activities, certain retail clothing stores for adults.'),
(119, 1, 6, 'Advertising', 'Advertising', 'Advertising-related services.'),
(120, 1, 6, 'Advertising_and_promotion', 'Advertising and promotion', 'The instances of this class represent, among all business activities, certain dealerships and advertising companies.'),
(121, 1, 6, 'Aestestic_medicine_centre', 'Aestestic medicine centre', NULL),
(122, 1, 6, 'Agents', 'Agents', 'The instances of this class represent, among all business activities, certain agencies and agents for the show and sport.'),
(123, 1, 6, 'AgricultureAndLivestock', 'Agriculture and livestock', 'Activities and services relating to agriculture and livestock farming.'),
(124, 1, 6, 'Agritourism', 'Agritourism', 'The instances of this class represent, among all the business activities, certain catering and accommodation activities related to agricultural activities.'),
(125, 1, 6, 'AirQualityObservation', 'Air quality observation', 'Each instance of this class represents an air quality detection.'),
(126, 1, 6, 'Air_quality_monitoring_station', 'Air quality monitoring station', 'The instances of this class are dust-level detectors in the air.\nEach instance represents a specific detector, of a specific type, located in a specific location located through a pair of geospatial coordinates. On the other hand, for each detector there is at most one instance representing it.'),
(127, 1, 6, 'Airfields', 'Airfields', 'The instances of this class represent, among all service locations, some airfields.'),
(128, 1, 6, 'Airplanes_rental', 'Airplanes rental', 'The instances of this class represent, among all business activities, certain chartering activities of air transport.'),
(129, 1, 6, 'Airport_lost_property_office', 'Airport lost property office', 'The instances of this class represent, among all service locations, some offices for lost items at the airport.'),
(130, 1, 6, 'Amusement_activities', 'Amusement activities', 'The instances of this class represent, among all the business activities, some creative, artistic and entertainment activities.'),
(131, 1, 6, 'Amusement_and_theme_parks', 'Amusement and theme parks', 'The instances of this class represent, among all business activities, some amusement and themed parks.'),
(132, 1, 6, 'AnemometryObservation', 'Anemometry observation', 'Each instance of this class represents a speed and wind direction detection.'),
(133, 1, 6, 'Animal_feeds_manufacture', 'Animal Feeds Manufacture', 'The instances of this class represent, among all business activities, some companies that produce animal feed.'),
(134, 1, 6, 'Animal_production', 'Animal Production', 'The instances of this class represent, among all business activities, some animal breeding companies.'),
(135, 1, 6, 'Antiques', 'Antiques', 'The instances of this class represent, among all business activities, certain retail companies of used furniture and antiques.'),
(136, 1, 6, 'Aquarium', 'Aquarium', 'The instances of this class represent, among all service locations, some aquariums.'),
(137, 1, 6, 'Archaeological_site', 'Archaeological site', 'The instances of this class represent, among all business activities, certain archaeological sites.'),
(138, 1, 6, 'Architectural_consulting', 'Architectural consulting', 'The instances of this class represent, among all the business activities, some activities of architectural studies.'),
(139, 1, 6, 'Area', 'Polygonal Service', 'Services represented by a polygonal form area.'),
(140, 1, 6, 'Art_galleries', 'Art Galleries', 'The instances of this class represent, among all the business activities, certain retail companies of art objects including art galleries.'),
(141, 1, 6, 'Artisan_shop', 'Artisanshop', 'The instances of this class represent, among all the business activities, some craft workshops.'),
(142, 1, 6, 'Assistance', 'Assistance', 'The instances of this class represent, among all the services, some personal assistance services.'),
(143, 1, 6, 'Associations', 'Associations', 'The instances of this class represent, among all the business activities, certain business activities carried out by associative organizations.'),
(144, 1, 6, 'Atm', 'Atm', 'The instances of this class represent, among all services, ATMs.'),
(145, 1, 6, 'Auctioning_houses', 'Auctioning Houses', 'The instances of this class represent, among all business activities, some retail auction houses, excluding auction houses via the Internet.'),
(146, 1, 6, 'Audio_and_video', 'Audio and Video', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of audio and video equipment in specialized stores.'),
(147, 1, 6, 'Auditing_activities', 'Auditing activities', 'The instances of this class represent, among all business activities, some auditing activities.'),
(148, 1, 6, 'Auditorium', 'Auditorium', 'The instances of this class represent, among all the business activities, some auditoriums.'),
(149, 1, 6, 'Automobile_driving_and_flying_schools', 'Automobile driving and flying schools', 'The instances of this class include, among all business activities, some driving, flying and nautical schools.'),
(150, 1, 6, 'Bakery', 'Bakery', 'The instances of this class represent, among all business activities, certain bread retail activities, as well as pies, sweets and confectionery.'),
(151, 1, 6, 'Bank', 'Bank', 'The instances of this class represent, among all business activities, some lenders and financial service activities in general.'),
(152, 1, 6, 'Bar', 'Bar', 'The instances of this class include, among all business activities, certain bars and other similar exercises without cooking.'),
(153, 1, 6, 'Beach', 'Beach', 'Le istanze di questa classe rappresentano, tra tutte le attività d\'impresa, talune spiagge.'),
(154, 1, 6, 'Beach_resort', 'Beach resort', 'Such activities represent, among all service locations, some bathing establishments.'),
(155, 1, 6, 'Beacon', 'Beacon', 'Service associated to Beacon that allow to receive offers.'),
(156, 1, 6, 'BeaconObservation', 'Beacon observation', 'lettura proveniente da un singolo beacon'),
(157, 1, 6, 'Beauty_centre', 'Beauty centre', 'The instances of this class represent, among all the business activities, certain services of beauty institutes.'),
(158, 1, 6, 'Bed_and_breakfast', 'Bed and breakfast', 'The instances of this class represent, among all business activities, certain lodging activities in bed and breakfast.'),
(159, 1, 6, 'Bench', 'Bench', 'Each instance of this class represents a bench.'),
(160, 1, 6, 'Betting_shops', 'Betting shops', 'The instances of this class represent, among all business activities, certain betting shops.'),
(161, 1, 6, 'Beverage_manufacture', 'Beverage Manufacture', 'The instances of this class represent, among all business activities, certain beverage production activities.'),
(162, 1, 6, 'BikeRackObservation', 'Bike rack observation', 'Each instance of this class represents a finding of places available in a bicycle rack at a given instant.'),
(163, 1, 6, 'Bike_rack', 'Bike rack', 'Each instance of this class represents a bike rack.'),
(164, 1, 6, 'Bike_rental', 'Bike rental', 'The instances of this class represent, among all business activities, some bicycle rental activities.'),
(165, 1, 6, 'Bike_sharing_rack', 'Bike sharing rack', NULL),
(166, 1, 6, 'Boarding_house', 'Boarding house', 'The instances of this class represent, among all the business activities, certain guest houses.'),
(167, 1, 6, 'Boat_equipment', 'Boat equipment', 'The instances of this class represent, among all business activities, certain retail and boat related activities.'),
(168, 1, 6, 'Boats_and_ships_rental', 'Boats and ships rental', 'The instances of this class represent, among all the business activities, certain activities of renting sea and river transport.'),
(169, 1, 6, 'Bollard', 'Bollard', 'Each instance of this class represents a mobile bollard.'),
(170, 1, 6, 'Bookshop', 'Book Shop', 'The instances of this class represent, among all business activities, some retail business of new books.'),
(171, 1, 6, 'Botanical_and_zoological_gardens', 'Botanical and zoological gardens', 'The instances of this class represent, among all business activities, some activities of botanical gardens, zoological gardens and natural reserves.'),
(172, 1, 6, 'Boxoffice', 'Boxoffice', 'The instances of this class include, among all business activities, some resale of tickets for sporting events and entertainment.'),
(173, 1, 6, 'Building_and_industrial_cleaning_activities', 'Building and industrial cleaning activities', 'The instances of this class represent, among all business activities, certain sterilization activities of buildings, plant, industrial machinery and healthcare equipment.'),
(174, 1, 6, 'Building_construction', 'Building Construction', 'The instances of this class represent, among all the business activities, certain building design and building activities.'),
(175, 1, 6, 'Building_material', 'Building Material', 'The instances of this class represent, among all the business activities, certain retail business of building materials, ceramics, tiles.'),
(176, 1, 6, 'Building_materials_manufacture', 'Building Materials Manufacture', 'The instances of this class represent, among all the business activities, certain cement, lime, concrete, gypsum and other building compounds.'),
(177, 1, 6, 'BusStop', 'Bus Stop', 'Interconnection point between road segments to determine the path of a TPL line.'),
(178, 1, 6, 'BusStopForecast', 'BusStop Forecast', 'Arrival forecast at a certain stop.'),
(179, 1, 6, 'Bus_tickets_retail', 'Bus tickets retail', 'The instances of this class represent, among all business activities, some bus ticket resale services.'),
(180, 1, 6, 'Business_support', 'Business support', 'The instances of this class represent, among all business activities, certain types of business support activities. These are mainly companies of: exactorial management; distribution agencies of books, newspapers and magazines; services of public market management and public weights; request for certificates and public purses; request for certificates and practical drawings.'),
(181, 1, 6, 'Call_center', 'Call center', 'The instances of this class represent, among all business activities, some call center activities.'),
(182, 1, 6, 'Camper_service', 'Camper service', 'The instances of this class represent, among all the business activities, certain activities of traveling tourism services.'),
(183, 1, 6, 'Camping', 'Camping', 'The instances of this class include, among all business activities, some parking areas and areas equipped for motor homes and caravans.'),
(184, 1, 6, 'Canteens_and_food_service', 'Canteens and Food Service', 'The instances of this class represent, among all the business activities, certain canteens and continuous catering activities on a contractual basis.'),
(185, 1, 6, 'CarParkSensor', 'Car Park Sensor', 'Sensor collecting data inside a parking lot.'),
(186, 1, 6, 'Car_park', 'Car park', 'The instances of this class represent, among all business activities, some parking and caretaking activities.'),
(187, 1, 6, 'Car_rental_with_driver', 'Car Rental With Driver', 'The instances of this class represent, among all the business activities, certain transport activities by renting passenger cars with driver.'),
(188, 1, 6, 'Car_washing', 'Car Washing', 'The instances of this class represent, among all business activities, certain car wash activities.'),
(189, 1, 6, 'Carabinieri', 'Carabinieri', 'The instances of this class represent, among all service locations, some Carabinieri barracks.'),
(190, 1, 6, 'Cargo_handling', 'Cargo Handling', 'The instances of this class represent, among all the business activities, certain cargo handling activities on road and rail.'),
(191, 1, 6, 'Carpentry', 'Carpentry', 'The instances of this class represent, among all the business activities, some furniture repair and furnishing repair activities.'),
(192, 1, 6, 'Carpets', 'Carpets', 'The instances of this class represent, among all the business activities, certain carpet retail activities.'),
(193, 1, 6, 'Carpets_and_curtains', 'Carpets and Curtains', 'The instances of this class represent, among all the business activities, some retail activities of carpets, curtains and curtains.'),
(194, 1, 6, 'Cartographers', 'Cartographers', 'The instances of this class represent, among all the business activities, some cartography and aerial photogrammetry activities.'),
(195, 1, 6, 'Castle', 'Castle', 'The instances of this class represent some castles where tourist services of various kinds are offered.'),
(196, 1, 6, 'Catering', 'Catering', 'The instances of this class represent, among all the business activities, certain catering activities for events, banqueting, provision of meals prepared for catering and other catering services.'),
(197, 1, 6, 'Cemetery', 'Cemetery', 'The instances of this class each represent a cemetery.'),
(198, 1, 6, 'ChargeStationObservation', 'Charge station observation', 'Each instance of this class represents a state of a column for charging electric vehicles at a given instant.'),
(199, 1, 6, 'Charging_stations', 'Charging stations', 'The instances of this class represent, among all business activities, certain supply of columns for charging power supplies and related services.'),
(200, 1, 6, 'Charter_airlines', 'Charter Airlines', 'The instances of this class represent, among all business activities, some non-scheduled air transport activities (charter flights).'),
(201, 1, 6, 'Churches', 'Churches', 'The instances of this class represent, among all the places of service, certain places of worship and business activities related to places of worship.'),
(202, 1, 6, 'Cinema', 'Cinema', 'The instances of this class represent, among all the business activities, certain cinematic projection activities.'),
(203, 1, 6, 'CivilAndEdilEngineering', 'Civil and edil engineering', 'Services related to civil and construction engineering. '),
(204, 1, 6, 'Civil_airport', 'Civil airport', 'The instances of this class represent, among all business activities, certain activities carried out by civil airports, with particular reference to transfer and rental services.'),
(205, 1, 6, 'Civil_engineering', 'Civil Engineering', 'The instances of this class represent, among all the business activities, certain civil engineering activities, and in particular the activities of building public works.'),
(206, 1, 6, 'Civil_protection', 'Civil protection', 'The instances of this class represent, among all service locations, certain civil protection activities.'),
(207, 1, 6, 'Civil_registry', 'Civil registry', 'The instances of this class represent, among all service locations, certain registry offices.'),
(208, 1, 6, 'Cleaning_activities', 'Cleaning activities', 'The instances of this class represent, among all the business activities, some cleaning and disinfestation activities.'),
(209, 1, 6, 'Cleaning_materials', 'Cleaning Materials', 'The instances of this class represent, among all business activities, certain retail activities of soaps, detergents, polishing products and the like.'),
(210, 1, 6, 'Climbing', 'Climbing', 'The instances of this class represent, among all the business activities, some mountaineering activities.'),
(211, 1, 6, 'Clothing', 'Clothing', 'The instances of this class represent, among all the business activities, some clothing retail business.'),
(212, 1, 6, 'Clothing_accessories', 'Clothing Accessories', 'The instances of this class represent, among all business activities, certain retail activities of hats, umbrellas, gloves and ties.'),
(213, 1, 6, 'Clothing_and_linen', 'Clothing and Linen', 'The instances of this class represent, among all the business activities, certain retail trade activities of clothing, home furnishings and household linen.'),
(214, 1, 6, 'Clothing_children_and_infants', 'Clothing Children and Infants', 'The instances of this class represent, among all business activities, certain retail children\'s clothing.'),
(215, 1, 6, 'Clothing_factory_outlet', 'Clothing factory outlet', 'The instances of this class represent, among all business activities, certain activities of selling and selling outlets of clothing.'),
(216, 1, 6, 'Coast_guard_harbormaster', 'Coast guard harbormaster', 'The instances of this class represent, among all service locations, certain offices of the Coast Guard and the Harbor Captain.'),
(217, 1, 6, 'Coffee_rosters', 'Coffee Rosters', 'The instances of this class represent, among all business activities, some rotten coffee retail business.'),
(218, 1, 6, 'Coke_and_petroleum_derivatives', 'Coke and Petroleum Derivatives', 'The instances of this class represent, among all business activities, certain coke refining activities and other petroleum refining products.'),
(219, 1, 6, 'Combined_facilities_support_activities', 'Combined facilities support activities', 'The instances of this class represent, among all business activities, some integrated building management services.'),
(220, 1, 6, 'Commissariat_of_public_safety', 'Commissariat of public safety', 'The instances of this class represent, among all service locations, certain Commissariats of Public Safety.'),
(221, 1, 6, 'Community_centre', 'Community centre', 'The instances of this class represent, among all service locations, some day health care centers.'),
(222, 1, 6, 'Computer_data_processing', 'Computer data processing', 'The instances of this class represent, among all business activities, certain data bases management and electronic data processing.'),
(223, 1, 6, 'Computer_programming_and_consultancy', 'Computer programming and consultancy', 'The instances of this class include, among all business activities, certain software production activities, computer consultancy activities, configuration and management of facilities and computer equipment, and other IT related services.'),
(224, 1, 6, 'Computer_systems', 'Computer Systems', 'The instances of this class represent, among all business activities, certain retail business of computers, peripherals, software and office equipment in specialized stores.'),
(225, 1, 6, 'Computer_technician', 'Computer technician', 'The instances of this class represent, among all business activities, some repair and maintenance of computers and peripherals.'),
(226, 1, 6, 'Conservatory', 'Conservatory', 'The instances of this class represent, among all the business activities, certain activities of music conservators.'),
(227, 1, 6, 'Consulate', 'Consulate', 'The instances of this class represent, among all service locations, some foreign consulates in Italy.'),
(228, 1, 6, 'Consulting_services', 'Consulting services', 'The instances of this class represent, among all business activities, certain consulting activities in general, for example in the field of safety, hygiene, agriculture and so on.'),
(229, 1, 6, 'Controlled_parking_zone', 'Controlled parking zone', 'The instances of this class represent, among all service locations, certain controlled parking areas.'),
(230, 1, 6, 'Corps_of_forest_rangers', 'Corps of forest rangers', 'The instances of this class represent, among all service locations, certain sites of the Corp of Forest Rangers.'),
(231, 1, 6, 'Courier', 'Courier', 'The instances of this class represent, among all business activities, certain postal and courier activities on which no universal service obligation is involved (a statutory obligation to guarantee a minimum level of service to be rendered to all The affected user).'),
(232, 1, 6, 'Credit_collection_agencies', 'Credit collection agencies', 'The instances of this class represent, among all business activities, certain activities of credit recovery agencies.'),
(233, 1, 6, 'Crop_animal_production_hunting', 'Crop Animal Production Hunting', 'The instances of this class represent, among all business activities, certain agricultural production activities, processing of animal products, hunting, and other related activities.'),
(234, 1, 6, 'Crop_production', 'Crop Production', 'The instances of this class represent, among all the business activities, certain cultivation activities.'),
(235, 1, 6, 'CulturalActivity', 'Cultural Activity', 'Libraries, archives, museums and other cultural activities.'),
(236, 1, 6, 'Cultural_and_recreation_goods', 'Cultural and Recreation Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of cultural and recreational items in specialized stores.'),
(237, 1, 6, 'Cultural_centre', 'Cultural centre', 'The instances of this class represent, among all service locations, certain centers of cultural activity.'),
(238, 1, 6, 'Cultural_education', 'Cultural education', 'The instances of this class represent, among all business activities, some centers of cultural formation.'),
(239, 1, 6, 'Cultural_sites', 'Cultural sites', 'The instances of this class represent, among all business activities, certain activities of libraries, archives, museums and other places of culture.'),
(240, 1, 6, 'Curtains_and_net_curtains', 'Curtains and Net Curtains', 'The instances of this class represent, among all business activities, certain retail and wholesale activities of curtains and curtains.'),
(241, 1, 6, 'Cycle_paths', 'Cycle paths', 'The instances of this class represent, among all service locations, certain cycling routes.'),
(242, 1, 6, 'Dairy_products', 'Dairy products', 'The demands of this class represent, among all business activities, certain retail trade activities of milk and dairy products.'),
(243, 1, 6, 'Dance_schools', 'Dance schools', 'The instances of this class represent, among all the business activities, some activities of conducting dance classes.'),
(244, 1, 6, 'Dating_service', 'Dating service', 'The instances of this class represent, among all the business activities, certain activities of marriage and meeting agencies.'),
(245, 1, 6, 'Day_care_centre', 'Day care centre', 'The instances of this class represent, among all service locations, some reception centers.'),
(246, 1, 6, 'Dentist', 'Dentist', 'The instances of this class represent, among all the business activities, some activities and services of dental surgeries.'),
(247, 1, 6, 'Department_of_motor_vehicles', 'Department of motor vehicles', 'The instances of this class represent, among all service locations, certain sites of Vehicle registration.'),
(248, 1, 6, 'Diet_products', 'Diet Products', 'The instances of this class represent, among all the business activities, some retail activities of macrobiotic and dietary products.'),
(249, 1, 6, 'DigitalLocation', 'Digital Location', 'Services classified by the city of Florence as Digital Location.'),
(250, 1, 6, 'Dining_hall', 'Dining hall', 'The instances of this class represent, among all service locations, certain canteens, not even structured in the form of a business.'),
(251, 1, 6, 'Disabled_parking_area', 'Disabled parking area', 'Ciascuna istanza di questa classe rappresenta un\'area di sosta riservata alle persone con ridotte capacità motorie.'),
(252, 1, 6, 'Discotheque', 'Discotheque', 'The instances of this class represent, among all the business activities, some activities of discos, ballrooms, nightclubs and the like.'),
(253, 1, 6, 'Discount', 'Discount', 'The instances of this class represent, among all business activities, some food discount activities.'),
(254, 1, 6, 'Disinfecting_and_exterminating_activities', 'Disinfecting and exterminating activities', 'The instances of this class represent, among all the business activities, certain disinfestation services.'),
(255, 1, 6, 'District', 'District', 'Class whose instances are the various neighborhoods in which a city can be subdivided.'),
(256, 1, 6, 'Diving_school', 'Diving school', 'The instances of this class represent, among all service locations, some diving schools.'),
(257, 1, 6, 'Doctor_office', 'Doctor office', 'The instances of this class represent, among all business activities, certain services of general medical practice.'),
(258, 1, 6, 'Dog_area', 'Dog area', 'Each instance of this class represents an area reserved for dog breeding.'),
(259, 1, 6, 'Door_to_door', 'Door to Door', 'The instances of this class represent, among all the business activities, certain retail activities of various products, by the intervention of a demonstrator or a sales agent (door to door).'),
(260, 1, 6, 'Drinking_fountain', 'Drinking fountain', 'The instances of this class represent, among all service locations, some drinking water fountains.'),
(261, 1, 6, 'EarthQuakeEvent', 'Earthquake', 'Each instance of this class represents an earthquake that affected the territory covered by the Km4City project.'),
(262, 1, 6, 'EducationAndResearch', 'EducationAndResearch', 'Services such as schools for all ages and training schools.'),
(263, 1, 6, 'Educational_support_activities', 'Educational support activities', 'The instances of this class include, among all business activities, certain education and training services, including counseling and school counseling services.'),
(264, 1, 6, 'Emergency', 'Emergency', 'Contiene tutte le classi relative ai servizi di emergenza'),
(265, 1, 6, 'Emergency_medical_care', 'Emergency medical care', 'The instances of this class include, among all business activities, certain health emergency services, blood banks, and others.'),
(266, 1, 6, 'Emergency_services', 'Emergency services', 'The instances of this class represent, among all service locations, certain roadside assistance services.'),
(267, 1, 6, 'Employment_exchange', 'Employment exchange', 'The instances of this class represent, among all service locations, some employment centers.'),
(268, 1, 6, 'Energy_supply', 'Energy Supply', 'The instances of this class represent, among all the business activities, certain activities of production, distribution, and trade in electricity and fuels.'),
(269, 1, 6, 'Engineering_consulting', 'Engineering consulting', 'The instances of this class represent, among all the business activities, certain activities of engineering studies.'),
(270, 1, 6, 'Entertainment', 'Entertainment', 'Entertainment services for the citizen.'),
(271, 1, 6, 'Entry', 'Entry', 'Classe le cui istanze sono i possibili ingressi ai numeri civici'),
(272, 1, 6, 'EntryRule', 'Entry Rule', 'Class whose instances are the rules of access to the different road elements.'),
(273, 1, 6, 'Environment', 'Environment', 'Environmentally friendly services.'),
(274, 1, 6, 'Equipment_for_events_and_shows_rental', 'Equipment for events and shows rental', 'The instances of this class represent, among all the business activities, some rental activities of facilities and equipment for events and shows.'),
(275, 1, 6, 'Estate_activities', 'Estate activities', 'The instances of this class represent, among all the business activities, certain leasing, sale, management and administration of real estate also for third parties.'),
(276, 1, 6, 'Event', 'Event', 'Events scheduled by the city of Florence and dusk.'),
(277, 1, 6, 'Extraction_of_natural_gas', 'Extraction of natural gas', 'The instances of this class represent, among all business activities, certain natural gas extraction activities.'),
(278, 1, 6, 'Extraction_of_salt', 'Extraction of salt', 'The instances of this class represent, among all the business activities, some salt extraction activities.'),
(279, 1, 6, 'Family_counselling', 'Family counselling', 'The instances of this class represent, among all service locations, some family counselors.'),
(280, 1, 6, 'Farm_house', 'Farm house', 'The cases of this class represent, among all the commercial activities, some activities of the hotel tourist residence.'),
(281, 1, 6, 'Fast_charging_station', 'Fast charging station', NULL),
(282, 1, 6, 'Ferry_stop', 'Ferry stop', 'The instances of this class are each a liner ferry port.'),
(283, 1, 6, 'FinancialService', 'Financial Service', 'Banks, monetary institutions and other financial services.'),
(284, 1, 6, 'Financial_institute', 'Financial institute', 'The instances of this class represent, among all business activities, certain financial services.'),
(285, 1, 6, 'Fine_arts_articles', 'Fine Arts Articles', 'The instances of this class represent, among all the business activities, certain retail activities of fine arts articles.'),
(286, 1, 6, 'Fire_brigade', 'Fire brigade', 'The instances of this class represent, among all service locations, certain fire brigades.'),
(287, 1, 6, 'First_aid', 'First aid', 'The instances of this class represent, among all service locations, some places of First Aid.'),
(288, 1, 6, 'First_aid_state', 'First Aid state', 'Each instance of this class represents a snapshot of how many people are, at a certain point in time, within a certain point of First Aid, in a certain condition, subdivided according to the urgency code assigned to them . The possible conditions in which a person who is in First Aid may be: destination, waiting, visiting, temporary observation. However, some instances report the total count, without taking into account the condition in which the different people are. In this case, the firstAidState property is valorized to \"Totali\".'),
(289, 1, 6, 'Fish_and_seafood', 'Fish and Seafood', 'The instances of this class represent, among all business activities, certain retail trade of fish, crustaceans and molluscs.'),
(290, 1, 6, 'Fishing_and_aquaculture', 'Fishing and Aquaculture', 'The instances of this class represent, among all business activities, certain fishing and aquaculture activities.'),
(291, 1, 6, 'Fishing_reserve', 'Fishing reserve', 'The instances of this class represent, among all service locations, some fishing reserves.'),
(292, 1, 6, 'Flight_companies', 'Flight Companies', 'The instances of this class represent, among all business activities, certain passenger liner air transport activities.'),
(293, 1, 6, 'Flower_shop', 'Flower shop', 'The instances of this class represent, among all the business activities, certain flower retail activities.'),
(294, 1, 6, 'Food_and_ice_cream_truck', 'Food and Ice Cream Truck', 'The instances of this class represent, among all the business activities, certain icecream, pastry and catering activities.'),
(295, 1, 6, 'Food_and_tobacconist', 'Food and Tobacconist', 'The instances of this class represent, among all business activities, certain retail activities of certain foodstuffs, beverages and tobacco.'),
(296, 1, 6, 'Food_manufacture', 'Food Manufacture', 'The instances of this class represent, among all business activities, certain industrial food production activities.'),
(297, 1, 6, 'Food_trade', 'Food trade', 'Each instance of this class represents a food resale activity.'),
(298, 1, 6, 'Footwear_and_accessories', 'Footwear and Accessories', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and accessories.'),
(299, 1, 6, 'Footwear_and_leather_goods', 'Footwear and Leather Goods', 'The instances of this class represent, among all business activities, certain retail trade activities of footwear and leather goods.'),
(300, 1, 6, 'Footwear_factory_outlet', 'Footwear factory outlet', 'The instances of this class represent, among all the business activities, certain activities of selling footwear in shops and outlets.'),
(301, 1, 6, 'Footwear_manufacture', 'Footwear Manufacture', 'The instances of this class represent, among all the business activities, certain footwear manufacturing and leather footwear manufacturing activities.'),
(302, 1, 6, 'Forest', 'Forest', 'Each instance of this class represents a forest.'),
(303, 1, 6, 'Forestry', 'Forestry', 'The instances of this class represent, among all the business activities, certain forestry activities and use of forest areas.'),
(304, 1, 6, 'Freight_transport_and_furniture_removal', 'Freight Transport and Furniture Removal', 'The instances of this class represent, among all business activities, certain removal and cargo transport services on the road.'),
(305, 1, 6, 'Fresh_place', 'Fresh place', 'Places where you can sit in air conditioning during the summer.'),
(306, 1, 6, 'Frozen_food', 'Frozen Food', 'The instances of this class represent, among all business activities, certain retail trade activities of frozen products.'),
(307, 1, 6, 'Fruit_and_vegetables', 'Fruit and Vegetables', 'The instances of this class represent, among all business activities, certain fruit and vegetable retail activities.'),
(308, 1, 6, 'FuelStationObservation', 'Fuel station observation', 'Each instance of this class represents a state of a fuel distributor at a given instant.'),
(309, 1, 6, 'Fuel_station', 'Fuel station', 'The instances of this class represent, among all business activities, certain retail trade activities of automotive fuel.'),
(310, 1, 6, 'Funeral', 'Funeral', 'The instances of this class represent, among all the business activities, some funeral activities and related services.'),
(311, 1, 6, 'Funeral_and_cemetery_articles', 'Funeral and Cemetery Articles', 'The instances of this class represent, among all business activities, certain retail trade activities of funerary and cemeteries.'),
(312, 1, 6, 'Fur_and_leather_clothing', 'Fur and Leather Clothing', 'The instances of this class represent, among all the business activities, certain activities of retail trade of fur and leather clothing.'),
(313, 1, 6, 'Gambling_and_betting', 'Gambling and betting', 'The instances of this class represent, among all business activities, certain activities related to lotteries, betting, and gambling halls.'),
(314, 1, 6, 'Game_reserve', 'Game reserve', 'The instances of this class represent, amongst all service locations, some natural parks.'),
(315, 1, 6, 'Game_room', 'Game room', 'The instances of this class represent, among all the business activities, certain activities of playing rooms and billiards.'),
(316, 1, 6, 'Games_and_toys', 'Games and toys', 'The instances of this class represent, among all business activities, certain retail activities of games and toys (including electronic ones).'),
(317, 1, 6, 'Garden_and_agriculture', 'Garden and Agriculture', 'The instances of this class represent, among all business activities, certain retail trade activities of machinery, equipment and products for agriculture and gardening.'),
(318, 1, 6, 'Gardens', 'Gardens', 'The instances of this class represent, among all service locations, some parks and gardens.'),
(319, 1, 6, 'Geologists', 'Geologists', 'The instances of this class represent, among all business activities, certain geological and geo-survey and mining research activities.'),
(320, 1, 6, 'Gifts_and_smoking_articles', 'Gifts and Smoking Articles', 'The instances of this class represent, among all the business activities, certain activities of retail trade of gift items and smokers.'),
(321, 1, 6, 'Golf', 'Golf', 'The instances of this class represent, among all service locations, some golf courses.'),
(322, 1, 6, 'GoodsYard', 'Goods Yard', 'Goods Scale, are located at railway junctions with 1:1 ratio.'),
(323, 1, 6, 'GovernmentOffice', 'Government Office', 'Government offices open to the public.'),
(324, 1, 6, 'Green_areas', 'Green areas', 'The instances of this class represent, among all service locations, some green areas.'),
(325, 1, 6, 'Grill', 'Grill', 'Each instance of this class represents a rotisserie.'),
(326, 1, 6, 'Group_practice', 'Group practice', 'Each instance of this class represents an health centre.'),
(327, 1, 6, 'Gym_fitness', 'Gym fitness', 'The instances of this class represent, among all the business activities, some gym management activities.'),
(328, 1, 6, 'Haberdashery', 'Haberdashery', 'The instances of this class represent, among all the business activities, certain retail trade activities of knitting and knitting yarns.'),
(329, 1, 6, 'Haircare_centres', 'Haircare centres', 'The instances of this class represent, among all business activities, certain activities of trichological surgeries.'),
(330, 1, 6, 'Hairdressing', 'Hairdressing', 'The demands of this class represent, among all the business activities, certain services of barber and hairdresser salons.'),
(331, 1, 6, 'Hairdressing_and_beauty_treatment', 'Hairdressing and beauty treatment', 'The instances of this class represent, among all the business activities, certain services of hairdressers, manicures, pedicures and aesthetic treatments.'),
(332, 1, 6, 'Hardware_electrical_plumbing_and_heating', 'Hardware Electrical Plumbing and Heating', 'The instances of this class represent, among all business activities, certain retail trade of hardware, paints, flat glass and electrical and plumbing plumbing.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(333, 1, 6, 'Hardware_paints_and_glass', 'Hardware Paints and Glass', 'The instances of this class represent, among all the business activities, certain retail trade of hardware, paints, flat glass and building materials.'),
(334, 1, 6, 'HealthCare', 'Health Care', 'Hospitals, medical studios, analysis laboratories and other facilities providing health services.'),
(335, 1, 6, 'Health_district', 'Health district', 'The instances of this class represent, among all service locations, certain health districts.'),
(336, 1, 6, 'Health_reservations_centre', 'Health reservations centre', 'The instances of this class represent, among all service locations, certain single reservation centers established at health districts.'),
(337, 1, 6, 'Healthcare_centre', 'Healthcare centre', 'The instances of this class represent, among all service locations, certain health care centers established at health districts.'),
(338, 1, 6, 'Helipads', 'Helipads', 'The instances of this class represent, among all service locations, some hills.'),
(339, 1, 6, 'Herbalists_shop', 'Herbalist\'s Shop', 'The instances of this class represent, among all the business activities, some herbalists.'),
(340, 1, 6, 'Higher_education', 'Higher education', 'The instances of this class represent, among all business activities, some university and non-university post-secondary training centers.'),
(341, 1, 6, 'Highway_stop', 'Highway stop', 'The instances of this class represent, among all business activities, certain service areas along the main road arteries.'),
(342, 1, 6, 'Hippodrome', 'Hippodrome', 'The instances of this class represent, among all service locations, some racecourses.'),
(343, 1, 6, 'Historic_residence', 'Historic residence', 'The instances of this class represent, among all service locations, some historic residences that offer accommodation services.'),
(344, 1, 6, 'Historical_buildings', 'Historical buildings', 'The instances of this class represent, among all the service venues, some historic buildings.'),
(345, 1, 6, 'Holiday_village', 'Holiday village', 'The instances of this class represent, among all business activities, some holiday accommodation and other short-term accommodation, including resorts.'),
(346, 1, 6, 'Hostel', 'Hostel', 'The instances of this class represent, among all business activities, some youth hostels.'),
(347, 1, 6, 'Hotel', 'Hotel', 'The instances of this class represent, among all business activities, certain hotels and similar structures.'),
(348, 1, 6, 'Household_appliances_shop', 'Household appliances shop', 'The instances of this class represent, among all business activities, some retail trade of household appliances in specialized stores.'),
(349, 1, 6, 'Household_articles', 'Household Articles', 'The instances of this class represent, among all business activities, certain retail activities of certain household items.'),
(350, 1, 6, 'Household_fuel', 'Household Fuel', 'The instances of this class represent, among all business activities, certain retail trade activities of domestic and heating fuel.'),
(351, 1, 6, 'Household_furniture', 'Household Furniture', 'The instances of this class represent, among all the business activities, some retail business of home furniture.'),
(352, 1, 6, 'Household_products', 'Household Products', 'The instances of this class represent, among all business activities, certain retail activities of certain domestic products in specialized stores.'),
(353, 1, 6, 'Household_utensils', 'Household Utensils', 'The instances of this class represent, among all business activities, certain retail trade activities of household utensils, glassware and pottery.'),
(354, 1, 6, 'Human_health_activities', 'Human health activities', 'The instances of this class represent, among all business activities, certain health care activities.'),
(355, 1, 6, 'Hunting_trapping_and_services', 'Hunting Trapping and Services', 'The instances of this class represent, among all business activities, some hunting, animal trapping and related services.'),
(356, 1, 6, 'HydrometryObservation', 'Hydrometry observation', 'Each instance of this class represents a hydrometric detection.'),
(357, 1, 6, 'HygrometryObservation', 'Hygrometry observation', 'Each instance of this class represents a hygrometric detection.'),
(358, 1, 6, 'Hypermarket', 'Hypermarket', 'The instances of this class represent, among all business activities, some hypermarkets.'),
(359, 1, 6, 'ICQAAgglomeration', 'Air Quality Criticality Index agglomeration', 'Each instance of this class represents an agglomeration (suitably delimited geographical area) defined for air quality monitoring through the ICQA index, introduced by the Tuscany Region, Italy, in August 2016.'),
(360, 1, 6, 'ICQAObservation', 'ICQA Observation', 'Each instance of this class represents an air quality detection on an agglomeration.'),
(361, 1, 6, 'Ice_cream_parlour', 'Ice cream parlour', 'The instances of this class represent, among all business activities, some ice cream parlors and pastry shops.'),
(362, 1, 6, 'Ict_service', 'ICT service', 'The instances of this class represent, among all business activities, certain data processing, hosting and related activities, web portals, and other information service activities.'),
(363, 1, 6, 'Income_revenue_authority', 'Income revenue authority', 'The instances of this class represent, among all service locations, certain offices of the Revenue Agency.'),
(364, 1, 6, 'Industrial_laundries', 'industrial laundries', 'The instances of this class represent, among all the business activities, certain activities of industrial laundries.'),
(365, 1, 6, 'IndustryAndManufacturing', 'Industry and manufacturing', 'Services related to industry and work.'),
(366, 1, 6, 'Installation_of_industrial_machinery', 'Installation of Industrial Machinery', 'The instances of this class represent, among all the business activities, certain activities for the installation of industrial and medical equipment, such as: installation of electrical and electronic equipment for telecommunications and radio transmitting equipment; installation of instruments, apparatus for measuring, checking, testing, navigation and the like; installation of office machines, mainframes and similar computers; installation of other machines and industrial equipments; installation of motors, generators and transformers, electricity distribution and control equipment; installation of medical devices; installation of appliances and instruments for odontology; installation of motors, generators and transformers, electrical distribution and control equipment.'),
(367, 1, 6, 'Insurance', 'Insurance', 'The instances of this class include, among all business activities, certain insurance, agents, sub agents, brokers and other intermediaries, including for the purpose of opening pension funds and life insurance.'),
(368, 1, 6, 'Insurance_and_financial', 'Insurance and financial', 'The instances of this class represent, among all business activities, some auxiliary activities in financial services and insurance activities.'),
(369, 1, 6, 'Internet_point_and_public_telephone', 'Internet Point and Public Telephone', 'The instances of this class represent, among all business activities, certain activities of public telephone and Internet Point.'),
(370, 1, 6, 'Internet_service_provider', 'Internet Service Provider', 'The instances of this class represent, among all business activities, certain Internet access services.'),
(371, 1, 6, 'Investigation_activities', 'Investigation activities', 'The instances of this class represent, among all business activities, certain private investigation services.'),
(372, 1, 6, 'Irrigator', 'Irrigator', 'Each instance of this class represents an irrigator.'),
(373, 1, 6, 'Italian_finance_police', 'Italian finance police', 'The instances of this class represent, among all service locations, certain offices of the Italian financial police.'),
(374, 1, 6, 'Jeweller', 'Jeweller', 'The instances of this class represent, among all the business activities, certain remaking of watches and jewelery.'),
(375, 1, 6, 'Jewellery', 'Jewellery', 'The instances of this class represent, among all business activities, certain retail activities of watches, jewelery and silverware.'),
(376, 1, 6, 'Journalist', 'Journalist', 'The instances of this class represent, among all the business activities, certain activities of independent journalists.'),
(377, 1, 6, 'Junction', 'Junction', 'An interconnection point between road segments to draw a RoadElement.'),
(378, 1, 6, 'Knitted_manufacture', 'Knitted Manufacture', 'The instances of this class represent, among all the business activities, certain knitting, knitwear, jerseys, cardigans and other knitwear items.'),
(379, 1, 6, 'Labour_consultant', 'Labour consultant', 'The instances of this class represent, among all the business activities, certain activities of job counselors.'),
(380, 1, 6, 'Land_transport', 'Land Transport', 'The instances of this class represent, among all business activities, certain terrestrial passenger transport activities, and in particular: taxi transport, car hire with driver; terrestrial passenger transport in urban and suburban areas; terrestrial transport and transport by means of pipelines; other terrestrial passenger transport activities.'),
(381, 1, 6, 'Land_transport_rental', 'Land-transport rental', 'The instances of this class represent, among all business activities, certain rental activities of certain land transport vehicles.'),
(382, 1, 6, 'Landscape_care', 'Landscape care', 'The instances of this class represent, among all business activities, some landscape care and maintenance activities (including parks, gardens and flowerbeds).'),
(383, 1, 6, 'Language_courses', 'Language courses', 'The instances of this class represent, among all business activities, some activities of language courses by anyone organized, and language schools.'),
(384, 1, 6, 'Laundries_and_dry_cleaners', 'laundries and dry cleaners', 'The instances of this class represent, among all the business activities, some laundry and cleaning of textile and fur items.'),
(385, 1, 6, 'Leasing_of_intellectual_property', 'Leasing of intellectual property', 'The instances of this class represent, among all business activities, certain activities of granting intellectual property rights and similar products (excluding works protected by copyright).'),
(386, 1, 6, 'Leather_manufacture', 'Leather Manufacture', 'The instances of this class represent, among all the business activities, certain activities of making leather goods and the like.'),
(387, 1, 6, 'Legal_office', 'Legal office', 'The instances of this class represent, among all the business activities, certain activities of law firms and accounting.'),
(388, 1, 6, 'Library', 'Library', 'The instances of this class represent, among all the business activities, some library and archive activities.'),
(389, 1, 6, 'Lifting_and_handling_equipment_rental', 'Lifting and handling equipment rental', 'The instances of this class represent, among all business activities, certain rental activities without a lifting and handling equipment operator.'),
(390, 1, 6, 'Lighting', 'Lighting', 'The instances of this class represent, among all the business activities, certain retail activities of lighting articles.'),
(391, 1, 6, 'Literary_cafe', 'literary cafe', 'Each instance of this class represents a literary café.'),
(392, 1, 6, 'Local_health_authority', 'Local health authority', 'The instances of this class represent, among all service locations, some local health companies.'),
(393, 1, 6, 'Local_police', 'Local police', 'The instances of this class represent, among all service locations, some Local Police Offices.'),
(394, 1, 6, 'Logistics_activities', 'Logistics Activities', 'The instances of this class represent, among all business activities, certain activities related to handling and storage of goods, and in particular: logistical services relating to the distribution of goods; freight forwarders and customs agency agencies; transport intermediaries.'),
(395, 1, 6, 'Lot', 'TPL Lot', 'TPL line set, locally identifiable as a lot.'),
(396, 1, 6, 'Machinery_and_equipment_rental', 'Machinery and Eequipment Rental', 'The instances of this class represent, among all the business activities, certain rental activities of certain machines and equipment for professional use, and in particular: rental of machines and equipment for construction work and civil engineering; hire of office machinery and equipment (including computers); rental of agricultural machinery and equipment; hire of other machines, equipment and material assets, without operator.'),
(397, 1, 6, 'Machinery_repair_and_installation', 'Machinery Repair and Installation', 'The instances of this class represent, among all business activities, some repair and maintenance activities for both professional and domestic equipment.'),
(398, 1, 6, 'Maintenance_repair_of_motor_vehicles', 'Maintenance Repair of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain repair and maintenance activities for motor vehicles, in particular: mechanical repairs of motor vehicles; repair of carrozzerie of cars; repair of electrical installations and of alimentacion for cars; repair and replacement of tires for cars; maintenance and repair of cars; other attivita \'of maintenance and of repair of cars.'),
(399, 1, 6, 'Maintenance_repair_of_motorcycles', 'Maintenance Repair of Motorcycles', 'The instances of this class represent, among all business activities, some maintenance and repair activities on motorcycles and mopeds (including tires).'),
(400, 1, 6, 'Management_consultancy', 'Management consultancy', 'The instances of this class represent, among all the business activities, certain entrepreneurial consultancy activities, and in particular: public relations and communication; certain entrepreneurial and administrative-management consultancy activities; certain business planning activities; holdings of the holdings engaged in operating activities (holding companies); management consultancy activities; consultancy services for the management of company logistics; business management and management consulting.'),
(401, 1, 6, 'Maneuver', 'Maneuver', 'Class whose instances are the possible maneuvers that can be made on a road element.'),
(402, 1, 6, 'Manicure_and_pedicure', 'Manicure and pedicure', 'The instances of this class represent, among all business activities, certain manicure and pedicure services.'),
(403, 1, 6, 'Manufacture_of_basic_metals', 'Manufacture of Basic Metals', 'The instances of this class represent, among all the business activities, certain metalworking activities, and in particular: manufacture of precious and semi-finished metals; casting of cast iron and production of cast iron pipes and fittings; casting steel; manufacture of iron, steel and ferroleghe; cold ironing of bars; melting of light metals; foundries; manufacture of pipes, ducts, cable profiles and related accessories in steel (excluding those cast-iron); production of lead, zinc and pond and semilavorati; production of other metals non ferrosi and semilavorati; fusion of certain non-ferrous metals; cold rolling of strips; production of precious metal base and other non-ferrous metals; treatment of nuclear fuels; copper and semi-finished products; manufacture of certain products of the first steel processing; cold drawing; production of aluminum and semilavorati; manufacture of iron, steel and ferroleghe; certain other metallurgical activities; certain other steelworks.'),
(404, 1, 6, 'Manufacture_of_chemicals_products', 'Manufacture of Chemicals Products', 'The claims of this class represent, among all the business activities, certain chemical production activities, and in particular by way of example: industrial gases, perfumes, cosmetics, soaps, surfactant organic agents, polishing products, fertilizers, Nitrogen compounds, chemical treatment of fatty acids, plastics, synthetic rubber, glues, paints, varnishes, enamels, printing inks, mastics, fibers, photographic products, essential oils, chemicals for agriculture, fertilizers.'),
(405, 1, 6, 'Manufacture_of_clay_and_ceramic', 'Manufacture of Clay and Ceramic', 'The instances of this class represent, among all the business activities, certain brickwork, tiles, other terracotta materials for building, ceramics, porcelain.'),
(406, 1, 6, 'Manufacture_of_electrical_equipment', 'Manufacture of Electrical Equipment', 'The instances of this class represent, among all the business activities, certain manufacturing of electrical and electronic components and equipment, such as: motors, generators and transformers; equipment for distribution and control of electricity; electrical and lighting equipment; wiring harness; electric capacitors, resistors, capacitors and the like, accelerators; electrical signs and signaling electrical equipment; lighting and signaling equipment for means of transport; home appliances; non-electric household appliances; electrical equipment for welding and brazing; wires and cables, electrical and electronic; battery batteries and electrical accumulators.'),
(407, 1, 6, 'Manufacture_of_electronic_products', 'Manufacture of Electronic Products', 'The instances of this class represent, among all the business activities, certain manufacturing of electronic equipment and components, such as: irradiation equipment, electromedical and electrotherapeutic equipment; apparatus for the reproduction and recording of sound and images; computers and peripheral units; electronic components and electronic boards; magnetic and optical supports; radio and television transmitting equipment (including cameras); watches; certain measuring and regulating apparatus for meters of electricity, gas, water and other liquids, precision analytical scales (including stapled parts and accessories); electrical and electronic equipment for telecommunications; assembled electronic boards; optical elements and optical precision instruments; electrical and electronic equipment for telecommunications; manufacture of instruments and apparatus for measuring, testing and navigation (other than optical); optical instruments and photographic and cinematographic equipment; anti-theft and fire-fighting systems; tools for hydrology, geophysics and meteorology.'),
(408, 1, 6, 'Manufacture_of_furniture', 'Manufacture of Furniture', 'The instances of this class represent, among all the business activities, certain furniture manufacturing and furnishing, such as: office furniture and shops; armchairs and sofas; furniture finishing; furniture for domestic furniture; parts and accessories of furniture; kitchen furniture; mattresses; some chairs and seats.'),
(409, 1, 6, 'Manufacture_of_glass', 'Manufacture of Glass', 'The instances of this class represent, among all the business activities, certain manufacturing, processing and processing of flat, cable and artistic glass products.'),
(410, 1, 6, 'Manufacture_of_jewellery_bijouterie', 'Manufacture of Jewellery Bijouterie', 'The instances of this class represent, among all the business activities, certain jewelry manufacturing, jewelery, precious stones and coins.'),
(411, 1, 6, 'Manufacture_of_machinery_and_equipment', 'Manufacture of Machinery and Equipment', 'The instances of this class represent, among all business activities, certain machine manufacturing activities, including, for example: household appliances; conditioners; purifiers; industrial machinery for the food industry; machinery for laundries; machinery for the plastics and rubber industry; machinery for printing and binding; machinery for lifting and handling of goods; pumps; machinery for mines, quarries, construction sites; machinery for the textile industry; machinery for the paper industry; furnaces, furnaces, burners; leather processing machines; heating systems; machines for the agriculture, the silvicoltura and the zootecnia; office machinery and equipment; cartridges and toners; elevators, hoists, escalators; turbines; equipment for beauty salons.'),
(412, 1, 6, 'Manufacture_of_motor_vehicles', 'Manufacture of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain manufacturing of motor vehicles and trailers, bodywork and components, including electrical and electronic components.'),
(413, 1, 6, 'Manufacture_of_musical_instruments', 'Manufacture of Musical Instruments', 'The instances of this class represent, among all business activities, certain activities of making musical instruments (including parts and accessories).'),
(414, 1, 6, 'Manufacture_of_non_metallic_mineral_products', 'Manufacture of Non-Metallic Mineral Products', 'The instances of this class represent, among all business activities, certain manufacturing activities of non-metallic mineral products including abrasive products.'),
(415, 1, 6, 'Manufacture_of_paper', 'Manufacture of Paper', 'The instances of this class represent, among all the business activities, certain paper and paper making activities.'),
(416, 1, 6, 'Manufacture_of_paper_products', 'Manufacture of Paper Products', 'The instances of this class represent, among all the business activities, certain activities of making paper products, and in particular: corrugated paper and paperboard and paper and board packaging (other than paperboard); Articles of paper and cartone; Paper products; Sanitary and household products in paper and cellulose wadding.'),
(417, 1, 6, 'Manufacture_of_pharmaceutical_products', 'Manufacture of Pharmaceutical Products', 'The instances of this class represent, among all the business activities, certain pharmaceutical manufacturing and pharmaceutical preparations.'),
(418, 1, 6, 'Manufacture_of_plastics_products', 'Manufacture of Plastics Products', 'The instances of this class represent, among all the business activities, certain plastic products manufacturing activities, such as: plastic articles for the building; plastic parts for footwear; sheets, sheets, tubes and profilati in plastic materials; doors, windows, plastic frames; office items and plastic school.'),
(419, 1, 6, 'Manufacture_of_refined_petroleum_products', 'Manufacture of Refined Petroleum Products', 'The instances of this class represent, among all business activities, certain petroleum refining activities, and in particular: preparation or mixing of petroleum derivatives (excluding petrochemicals), manufacture of bitumen, tar and binder emulsions for use road mixing of liquefied petroleum gas (GPL) and bottling them.'),
(420, 1, 6, 'Manufacture_of_refractory_products', 'Manufacture of Refractory Products', 'The instances of this class represent, among all business activities, certain refractory products manufacturing.'),
(421, 1, 6, 'Manufacture_of_rubber_and_plastics_products', 'Manufacture of Rubber and Plastics Products', 'The instances of this class represent, among all the business activities, certain manufacturing of rubber articles and plastics.'),
(422, 1, 6, 'Manufacture_of_rubber_products', 'Manufacture of Rubber Products', 'The instances of this class represent, among all the business activities, certain manufacturing activities of rubber products, including in particular: rubber soles and other rubber parts for footwear; manufacture of tires and air chambers; regeneration and reconstruction of tires.'),
(423, 1, 6, 'Manufacture_of_sports_goods', 'Manufacture of Sports Goods', 'The instances of this class represent, among all the business activities, certain activities in the manufacture of sports goods.'),
(424, 1, 6, 'Manufacture_of_structural_metal_products', 'Manufacture of Structural Metal Products', 'The instances of this class represent, among all the business activities, some metal products manufacturing activities, such as: door frames and windows; gates; hinges; frames and other building elements; pots and crockery; radiators; springs; weapons and ammunition; bins and containers in general.'),
(425, 1, 6, 'Manufacture_of_textiles', 'Manufacture of textiles', 'The instances of this class represent, among all business activities, certain textile industries.'),
(426, 1, 6, 'Manufacture_of_toys_and_game', 'Manufacture of Toys and Game', 'The instances of this class represent, among all the business activities, some toys and toys manufacturing activities.'),
(427, 1, 6, 'Manufacture_of_transport_equipment', 'Manufacture of Transport Equipment', 'The instances of this class represent, among all the business activities, certain vehicle manufacturing and accessories activities, such as: accessories and parts detached for motorcycles and mopeds; ships and boats; motorcycles and motor vehicles (including engines); parts and accessories for bicycles; locomotives and other railway rolling stock, tranviario, filoviario, for metropolitane and for mines; bicycles; buildings metalliche and no metalliche in cantieri naval; aircraft, spacecraft and related devices; invalid vehicles (including parts and accessories).'),
(428, 1, 6, 'Manufacture_of_travel_articles', 'Manufacture of Travel Articles', 'The instances of this class represent, among all the business activities, certain activities of making travel articles, handbags and the like, leather goods and saddlery, whips and shawls for riding.'),
(429, 1, 6, 'Manufacture_of_wearing_apparel', 'Manufacture of Wearing Apparel', 'The instances of this class represent, among all the business activities, certain fabrication of garments, such as: leather clothing; fur coats; uniforms and work clothes; custom-made suits; shirts, shirts, underwear; sports clothing and technical clothing in general.'),
(430, 1, 6, 'Manufacture_of_wood', 'Manufacture of Wood', 'The instances of this class represent, among all the business activities, certain activities of the wood and wood and cork products industry, and are involved in the manufacture of straw articles and other plaiting products.'),
(431, 1, 6, 'Manufacture_of_wood_products', 'Manufacture of Wood Products', 'The instances of this class represent, among all the business activities, certain wood products production activities, such as: building materials; picture frames; packaging; fixtures; cork products, straw, and other weaving materials; wood panels; parquet.'),
(432, 1, 6, 'Marina', 'Marina', 'Each instance of this class represents a marina.'),
(433, 1, 6, 'Market_polling', 'Market polling', 'The instances of this class represent, among all the business activities, certain activities specializing in market research and opinion polls.'),
(434, 1, 6, 'Materials_recovery', 'Materials Recovery', 'The instances of this class represent, among all business activities, certain recycling and waste disposal activities, such as: recovery and preparation for recycling waste and scrap metal; recovery and preparation for the recycling of solid urban waste, industrial and biomass; recovery and preparation for the recycling of plastic material for the production of plastic raw materials, synthetic resins; demolition of carcasses.'),
(435, 1, 6, 'Meat_and_poultry', 'Meat and Poultry', 'The instances of this class represent, among all business activities, certain retail trade activities of meat and meat products.'),
(436, 1, 6, 'Mechanic_workshop', 'Mechanic Workshop', 'The instances of this class represent, among all the business activities, some workshop activities.'),
(437, 1, 6, 'Medical_analysis_laboratories', 'Medical analysis laboratories', 'The instances of this class represent, among all business activities, some clinical analysis laboratories, radiographic laboratories and other image diagnostic centers.'),
(438, 1, 6, 'Medical_and_orthopaedic_goods', 'Medical and Orthopaedic Goods', 'The instances of this class represent, among all the business activities, certain retail activities of medical and orthopedic articles.'),
(439, 1, 6, 'Mental_health_centre', 'Mental health centre', 'The instances of this class represent, among all service locations, certain centers of mental health.'),
(440, 1, 6, 'Milestone', 'milestone mileage', 'Classe le cui istanze sono i cippi chilometrici che si trovano lungo le principali strade'),
(441, 1, 6, 'Minimarket', 'Minimarket', 'The instances of this class represent, among all business activities, certain activities of minimarkets and other non-specialized foodstuffs.'),
(442, 1, 6, 'MiningAndQuarrying', 'Mining and quarrying', 'Services related to mining and quarrying.'),
(443, 1, 6, 'Mining_of_metal_ores', 'Mining of metal ores', 'The instances of this class represent, among all the business activities, certain activities of extraction of metallic minerals.'),
(444, 1, 6, 'Mining_support_services', 'Mining Support Services', ''),
(445, 1, 6, 'MobilityEvent', 'Mobility event', 'Each instance of this class represents an event that has had repercussions on the viability of the territory covered by the Km4City project, such as a road accident, a loss of cargo, a roadway restriction, a flood, a work deviation.'),
(446, 1, 6, 'Monument_location', 'Monument location', 'The instances of this class represent, among all business activities, some management of historical sites and monuments and similar attractions.'),
(447, 1, 6, 'Motion_picture_and_television_programme_activities', 'Motion picture and television programme activities', 'The instances of this class represent, among all the business activities, certain activities of production, post-production and film distribution, video and television programs.'),
(448, 1, 6, 'Motor_vehicles_wholesale_and_retail', 'Motor Vehicles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motor vehicles and brokerage in the sale of motor vehicles.'),
(449, 1, 6, 'Motorcycles_parts_wholesale_and_retail', 'Motorcycles Parts Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycle and moped parts and accessories, and brokering in the sale of parts and accessories for motorcycles and mopeds.'),
(450, 1, 6, 'Motorcycles_wholesale_and_retail', 'Motorcycles Wholesale and Retail', 'The instances of this class represent, among all business activities, certain wholesale and retail activities of motorcycles, mopeds and their parts and accessories, and certain brokering activities in the sale of motorcycles, mopeds and parts thereof and accessories.'),
(451, 1, 6, 'Mountain_shelter', 'Mountain shelter', 'The instances of this class represent, among all business activities, some mountain shelters.'),
(452, 1, 6, 'Municipality', 'Municipality Administration', 'Class whose instances are the various municipalities.'),
(453, 1, 6, 'Museum', 'Museum', 'The instances of this class represent, among all the business activities, certain activities of the museums.'),
(454, 1, 6, 'Music_and_video_recordings', 'Music and Video Recordings', 'The instances of this class represent, among all business activities, certain retail trade activities of music and video recordings.'),
(455, 1, 6, 'Musical_instruments_and_scores', 'Musical Instruments and Scores', 'The instances of this class represent, among all the business activities, certain retail activities of musical instruments and scores.'),
(456, 1, 6, 'National_park', 'National park', 'Each instance of this class represents a national park.'),
(457, 1, 6, 'Natural_reserve', 'Natural reserve', 'Each instance of this class represents a natural reserve.'),
(458, 1, 6, 'News_agency', 'News agency', 'The instances of this class represent, among all the business activities, certain activities of the press agencies.'),
(459, 1, 6, 'Newspapers_and_stationery', 'Newspapers and Stationery', 'The instances of this class represent, among all the business activities, some retail activities of newspapers, magazines, periodicals, stationery and office supplies.'),
(460, 1, 6, 'Node', 'Node', 'Class whose instances are the nodes that connect the road elements.'),
(461, 1, 6, 'Non_food_large_retailers', 'non food large retailers', 'The instances of this class represent, among all service locations, certain non-food distribution facilities.'),
(462, 1, 6, 'Non_food_products', 'Non-Food Products', 'The instances of this class represent, among all business activities, certain retail activities of certain non-food products.'),
(463, 1, 6, 'Non_specialized_wholesale_trade', 'Non-specialized Wholesale Trade', 'The instances of this class represent, among all business activities, certain non-specialized wholesale activities.'),
(464, 1, 6, 'Observation', 'Observation', 'Single sensor for observing speed, traffic, concentration, or density.'),
(465, 1, 6, 'Office_administrative_and_support_activities', 'Office administrative and support activities', 'The instances of this class represent, among all business activities, certain temporary office management and support activities that are also integrated with the work of the office.'),
(466, 1, 6, 'Office_furniture', 'Office Furniture', 'The instances of this class represent, among all the business activities, some retail activities of office furniture.'),
(467, 1, 6, 'Operation_of_casinos', 'Operation of casinos', 'The instances of this class represent, among all business activities, certain asset management activities on devices that allow coin or coin-operated cash prizes.'),
(468, 1, 6, 'Optics_and_photography', 'Optics and Photography', 'The instances of this class represent, among all business activities, certain retail trade of optical and photographic material.'),
(469, 1, 6, 'Organization_of_conventions_and_trade_shows', 'Organization of conventions and trade shows', 'The instances of this class represent, among all the business activities, certain activities of organizing conferences and fairs.'),
(470, 1, 6, 'Other_accommodation', 'Other Accommodation', 'The instances of this class represent, among all the business activities, certain activities of short-term renters, holiday houses and apartments, bed and breakfasts, residences, farm-related accommodation, student and workers accommodation with some hotel services.'),
(471, 1, 6, 'Other_broadcasting', 'Other broadcasting', 'The instances of this class represent, among all business activities, certain activities of audio-visual programming and broadcasting.'),
(472, 1, 6, 'Other_goods', 'Other Goods', 'The instances of this class represent, among all business activities, certain retail activities of certain products in specialized stores.'),
(473, 1, 6, 'Other_manufacturing', 'Other Manufacturing', ''),
(474, 1, 6, 'Other_mining_and_quarrying', 'Other mining and quarrying', 'The instances of this class represent, among all the business activities, certain mining and quarry mining activities.'),
(475, 1, 6, 'Other_office', 'Other Office', 'The instances of this class represent, among all service locations, certain public and defense administration activities and compulsory social insurance.'),
(476, 1, 6, 'Other_retail_sale', 'Other Retail Sale', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses with a prevalence of non-food products.'),
(477, 1, 6, 'Other_specialized_construction', 'Other Specialized Construction', 'The instances of this class represent, among all the business activities, certain construction activities, including, for example: steam cleaning, sandblasting and similar activities for exterior walls of buildings; building of swimming pools and other skilled works of building; non-specialized works of construction work (masons); works of completamento and of finitura of the buildings; realization of coverings; hire of cranes and other equipment with operator for construction or demolition.'),
(478, 1, 6, 'Other_specialized_wholesale', 'Other Specialized Wholesale', 'The instances of this class represent, among all business activities, certain wholesale trade activities, such as: raw textile fibers and semi-finished textiles; hardware, appliances and accessories for plumbing and heating systems; fertilizers and other chemical products for agriculture; carpet and linoleum; raw rubber, plastics in primary and semi-finished forms; chemical products; fixtures; building materials; petroleum products and lubricants for haulage, of fuels for heating; chemical products for the industry; wallpaper, colors and paints; timber, semi-finished wood and artificial wood; building materials (including sanitary fixtures); coating materials (including sanitary fixtures); metallic minerals, of ferrous metals and semi-finished products; non-ferrous metals and semi-finished products; articles of iron and of other metals; packaging; timber and construction materials, sanitary fixtures, flat glass, paints and colors; scrap and metal by-products of industrial processing; appliances and accesorios for installations of fontaneras, heating and air conditioning; non-metallic recovery materials (glass, paper, cardboard, etc.); non-metallic by-products of industrial processing (waste).'),
(479, 1, 6, 'Other_telecommunications_activities', 'Other Telecommunications Activities', 'The instances of this class represent, among all business activities, certain telecommunications and brokering activities in telecommunication and data transmission services.'),
(480, 1, 6, 'Pa', 'Public Administration', 'Municipalities, regions and provinces.'),
(481, 1, 6, 'Packaging_activities', 'Packaging activities', 'The instances of this class represent, among all the business activities, some packaging and packaging activities also on behalf of third parties.'),
(482, 1, 6, 'Paramedical_activities', 'Paramedical activities', 'The instances of this class represent, among all business activities, certain independent paramedical activities.'),
(483, 1, 6, 'Parties_and_ceremonies', 'Parties and ceremonies', 'The instances of this class represent, among all the business activities, certain activities of organizing parties and ceremonies.'),
(484, 1, 6, 'Passenger_air_transport', 'Passenger Air Transport', 'The instances of this class represent, among all business activities, certain aviation activities.'),
(485, 1, 6, 'Pastry_shop', 'Pastry shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of cakes, sweets, confectionery.'),
(486, 1, 6, 'Path', 'String Service', 'Services represented by a polygonal chain.'),
(487, 1, 6, 'Pedestrian_zone', 'pedestrian zone', 'Each instance of this class represents an area reserved for pedestrian transit.'),
(488, 1, 6, 'Performing_arts_schools', 'Performing arts schools', 'The instances of this class represent, among all business activities, certain university and post-university, academy and conservation activities.'),
(489, 1, 6, 'Perfumery_and_cosmetic_articles', 'Perfumery and Cosmetic Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of cosmetics, perfumery, herbal medicine and personal hygiene.'),
(490, 1, 6, 'Personal_and_household_goods_rental', 'Personal and household goods rental', 'The instances of this class represent, among all business activities, certain rental activities of table linen, bed linen, bath linen and household linen, in addition to other personal and household goods.'),
(491, 1, 6, 'Personal_service_activities', 'Personal service activities', 'The instances of this class represent, among all business activities, certain services for the person.'),
(492, 1, 6, 'Pet_care_services', 'Pet care services', 'The instances of this class represent, among all business activities, certain pet care services (excluding veterinary services).'),
(493, 1, 6, 'Pet_shop', 'Pet Shop', 'The instances of this class represent, among all business activities, certain pet retail activities (including articles and food).'),
(494, 1, 6, 'Petroleum_and_natural_gas_extraction', 'Petroleum and natural gas extraction', 'The instances of this class represent, among all business activities, some activities supporting the extraction of oil and natural gas.'),
(495, 1, 6, 'Pharmaceuticals', 'Pharmaceuticals', 'The instances of this class represent, among all business activities, certain retail activities of medicinal products not subject to medical prescription.'),
(496, 1, 6, 'Pharmacy', 'Pharmacy', 'The demands of this class include, among all business activities, certain pharmacy and retail trade of medicines.'),
(497, 1, 6, 'Photographic_activities', 'Photographic activities', 'The instances of this class include, among all business activities, certain photographic activities, including photographic and aerial photography activities, and development and printing activities in photographic laboratories.'),
(498, 1, 6, 'Photovoltaic_system', 'Photovoltaic system', 'Geolocation of working photovoltaic plants.'),
(499, 1, 6, 'Physical_therapy_centre', 'Physical therapy centre', 'The instances of this class represent, among all business activities, some physiotherapy activities.'),
(500, 1, 6, 'Pizzeria', 'Pizzeria', 'The instances of this class represent, among all the business activities, some pizzerias.'),
(501, 1, 6, 'Poison_control_centre', 'Poison control centre', 'The instances of this class represent, among all service locations, some anti-theft centers.'),
(502, 1, 6, 'Police_headquarters', 'Police headquarters', 'The instances of this class represent, among all service locations, certain police headquarters.'),
(503, 1, 6, 'PollenObservation', 'Pollen observation', 'Each instance of this class represents a pollutant detection at a given time and place.'),
(504, 1, 6, 'PollenTrendObservation', 'Pollen trend observation', 'Each instance of this class represents a trend of pollutants with reference to a certain place and time interval.'),
(505, 1, 6, 'Pollen_monitoring_station', 'Pollen monitoring station', 'The instances of this class each represent an allergen level detector in the air.'),
(506, 1, 6, 'Pool', 'Pool', 'The instances of this class represent, among all business activities, some pools management activities.'),
(507, 1, 6, 'Port', 'Port', 'The instances of this class represent, among all service locations, certain ports.'),
(508, 1, 6, 'Post_secondary_education', 'Post-secondary education', 'The instances of this class represent, among all business activities, certain technical higher education and training (IFTS) activities.'),
(509, 1, 6, 'Postal_and_courier_activities', 'Postal and Courier Activities', 'The instances of this class represent, among all business activities, certain postal services and courier activities.'),
(510, 1, 6, 'Postal_office', 'Postal office', 'The instances of this class represent, among all the business activities, certain postal services with universal service obligation (on which, therefore, are legal obligations to ensure a minimum level of service for all users concerned, being a service of public interest).'),
(511, 1, 6, 'Pre_primary_education', 'Pre-primary education', 'The instances of this class represent, among all business activities, preparatory education activities: children\'s schools, special schools linked to primary schools.'),
(512, 1, 6, 'Prefecture', 'Prefecture', 'The instances of this class represent, among all service locations, certain offices of the Prefecture.'),
(513, 1, 6, 'Primary_education', 'Primary education', 'The instances of this class represent, among all business activities, certain primary education activities: elementary schools.'),
(514, 1, 6, 'Printing_and_recorded_media', 'Printing and Recorded Media', 'The instances of this class represent, among all business activities, some printing and reproduction of recorded media.'),
(515, 1, 6, 'Printing_and_services', 'Printing and Services', 'The instances of this class represent, among all the business activities, certain printing and bookbinding activities with related services, and certain newspaper printing activities.'),
(516, 1, 6, 'Private_clinic', 'Private clinic', 'The instances of this class represent, among all business activities, certain private clinics.'),
(517, 1, 6, 'Private_high_school', 'Private high school', 'The instances of this class represent, among all service locations, some private high schools.'),
(518, 1, 6, 'Private_infant_school', 'Private infant school', 'The instances of this class represent, among all service locations, some private infant schools.'),
(519, 1, 6, 'Private_junior_high_school', 'Private junior high school', 'The instances of this class represent, among all service locations, some private junior high school.'),
(520, 1, 6, 'Private_junior_school', 'Private junior school', 'The instances of this class represent, among all service locations, some private junior schools.'),
(521, 1, 6, 'Private_polytechnic_school', 'Private polytechnic school', 'The instances of this class represent, among all service locations, some private technical institutes.'),
(522, 1, 6, 'Private_preschool', 'Private preschool', 'The instances of this class represent, among all service locations, certain private nurseries.'),
(523, 1, 6, 'Private_professional_institute', 'Private professional institute', 'The instances of this class represent, among all service locations, some private professional institutes.'),
(524, 1, 6, 'Private_security', 'Private security', 'The instances of this class represent, among all business activities, certain private security services.'),
(525, 1, 6, 'Province', 'Provincial Administration', 'Class whose instances are the various provinces.'),
(526, 1, 6, 'Psychologists', 'Psychologists', 'The instances of this class represent, among all the business activities, some activities carried out by psychologists.'),
(527, 1, 6, 'PublicTransportLine', 'Bus Line', 'Line of a TPL company'),
(528, 1, 6, 'Public_high_school', 'Public high school', 'The instances of this class represent, among all service locations, some public high schools.'),
(529, 1, 6, 'Public_hospital', 'Public hospital', 'The instances of this class represent, among all service locations, some public hospitals.'),
(530, 1, 6, 'Public_infant_school', 'Public infant school', 'The instances of this class represent, among all service locations, some public nursery schools.'),
(531, 1, 6, 'Public_junior_high_school', 'Public junior high school', 'The instances of this class represent, among all service locations, some public middle schools.'),
(532, 1, 6, 'Public_junior_school', 'Public junior school', 'The instances of this class represent, among all service locations, some public junior schools.'),
(533, 1, 6, 'Public_polytechnic_school', 'Public polytechnic school', 'The instances of this class represent, among all service locations, some public technical institutes.'),
(534, 1, 6, 'Public_professional_institute', 'Public professional institute', 'The instances of this class represent, among all service locations, certain public professional institutes.'),
(535, 1, 6, 'Public_relations_office', 'Public relations office', 'The instances of this class represent, among all service locations, some Public Relations Offices (URPs).'),
(536, 1, 6, 'Public_university', 'Public university', 'The instances of this class represent, among all service locations, some public universities.'),
(537, 1, 6, 'Publishing_activities', 'Publishing activities', 'The instances of this class represent, among all business activities, certain activities of publishing newspapers, books, magazines, periodicals and other editorial activities.'),
(538, 1, 6, 'Quality_control_and_certification', 'Quality Control and Certification', 'The instances of this class represent, among all business activities, certain quality control activities and product, process and system certification, and certain activities for the protection of controlled production assets.'),
(539, 1, 6, 'Quarrying_of_stone_sand_and_clay', 'Quarrying of stone sand and clay', 'The instances of this class represent, among all the business activities, some extractive activities, and in particular: gravel and sand extraction; Extraction of clay and kaolin; Extraction of ornamental and construction stones, limestone, plaster, clay and slate stone.'),
(540, 1, 6, 'RTZgate', 'RTZ gate', 'Each instance of this class represents a gateway to a restricted traffic zone.'),
(541, 1, 6, 'Radio_broadcasting', 'Radio broadcasting', 'The instances of this class represent, among all business activities, certain radio broadcasting activities.'),
(542, 1, 6, 'Radiotherapy_centre', 'Radiotherapy centre', NULL),
(543, 1, 6, 'Rafting_kayak', 'Rafting kayak', 'The instances of this class represent, among all service locations, some locations where rafting, canoeing and kayaking can be practiced.'),
(544, 1, 6, 'RailwayDirection', 'Railway Direction', 'Class whose instances are the railway directives.'),
(545, 1, 6, 'RailwayElement', 'Railway Element', 'Class whose instances are the elements that make up the sections, sections or rail lines.'),
(546, 1, 6, 'RailwayJunction', 'Railway Junction', 'Two junctions delimit a railway element and represent railway stations or freight terminals.'),
(547, 1, 6, 'RailwayLine', 'Railway Line', 'Class whose instances are the railway lines.'),
(548, 1, 6, 'RailwaySection', 'Railway Section', 'Class whose instances are the railway sections.'),
(549, 1, 6, 'RainfallObservation', 'Rainfall observation', 'Each instance of this class represents a precipitation detection in a certain place and time interval.'),
(550, 1, 6, 'Recreation_room', 'Recreation room', 'The instances of this class represent, among all the service venues, some recreation rooms.'),
(551, 1, 6, 'Recreational_and_sports_goods_rental', 'Recreational and Sports Goods rental', 'The instances of this class represent, among all business activities, some rental activities of sports and recreational equipment, including pleasure boats and in particular pedalos.'),
(552, 1, 6, 'Recruitment', 'Recruitment', 'The instances of this class represent, among all business activities, certain research, selection, placement, management and support services for staff relocation.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(553, 1, 6, 'Red_cross', 'Red cross', 'The instances of this class represent, among all service locations, certain Red Cross seats.'),
(554, 1, 6, 'Region', 'Regional Administration', 'Class whose instances are the various regions.'),
(555, 1, 6, 'RegularService', 'Regular Service', 'Services that may have other features, represented as cross services.'),
(556, 1, 6, 'Religiuos_guest_house', 'Religious guest house', 'The instances of this class represent, among all service locations, certain holiday homes operated by monastic orders.'),
(557, 1, 6, 'Repair', 'Repair', 'The instances of this class represent, among all the business activities, some quick repair services, key duplication, sharpening knives, immediate printing on textile articles, quick metal engraving, non-precious metal repair items, and Repair of other articles of consumption for personal use and for the house.'),
(558, 1, 6, 'Repair_musical_instruments', 'Repair musical instruments', 'The instances of this class represent, among all the business activities, some musical instruments repair services.'),
(559, 1, 6, 'Repair_of_communication_equipment', 'Repair of communication equipment', 'The instances of this class represent, among all business activities, certain repair and maintenance services for fixed, cordless, cellular and other telecommunication equipment.'),
(560, 1, 6, 'Repair_of_consumer_electronics', 'Repair of consumer electronics', 'The instances of this class represent, among all business activities, some repair services for consumer electronics and audio and video products for personal and home use.'),
(561, 1, 6, 'Repair_of_footwear_and_leather_goods', 'Repair of footwear and leather goods', 'The instances of this class represent, among all business activities, certain repair services for footwear and luggage in leather, leather or similar materials.'),
(562, 1, 6, 'Repair_of_garden_equipment', 'Repair of garden equipment', 'The instances of this class represent, among all business activities, certain gardening repair services.'),
(563, 1, 6, 'Repair_of_home_equipment', 'Repair of home equipment', 'The instances of this class represent, among all business activities, certain repair services of other goods for personal and home use.'),
(564, 1, 6, 'Repair_of_household_appliances', 'Repair of household appliances', 'The instances of this class represent, among all the business activities, some repair services of household appliances and household items.'),
(565, 1, 6, 'Repair_of_sporting_goods', 'Repair of sporting goods', 'The instances of this class represent, among all business activities, certain repair services for sporting goods (excluding sportswear) and camping equipment (including bicycles).'),
(566, 1, 6, 'Reporting_agencies', 'Reporting agencies', 'The instances of this class represent, among all business activities, certain commercial information agencies.'),
(567, 1, 6, 'Reproduction_recorded_media', 'Reproduction Recorded Media', 'The instances of this class represent, among all business activities, certain activities of reproduction of recorded media.'),
(568, 1, 6, 'Rescuers', 'Rescuers area', 'Each instance of this class represents a meeting point for rescuers in case of disaster.'),
(569, 1, 6, 'Research_and_development', 'Research and development', 'The instances of this class represent, among all the business activities, certain scientific research and research and experimental development activities in the fields of geology, natural sciences, engineering, biotechnology, social sciences and humanities.'),
(570, 1, 6, 'Reserved_lane', 'Reserved lane', 'Each instance of this class represents a lane reserved for a specific type of user.'),
(571, 1, 6, 'Residential_care_activities', 'Residential care activities', 'The demands of this class include, among all business activities, certain residential care facilities for the elderly, disabled motorists, people with mental retardation, mental disorders, or abusing drugs.'),
(572, 1, 6, 'Resolution', 'Resolution', 'Resolution approved by a Public Administration.'),
(573, 1, 6, 'Rest_home', 'Rest home', 'The instances of this class represent, among all service locations, some rest homes.'),
(574, 1, 6, 'Restaurant', 'Restaurant', 'The instances of this class represent, among all business activities, certain catering services in a fixed location (including farmhouses), and all mobile catering services on trains, ships and others.'),
(575, 1, 6, 'Restorers', 'Restorers', 'The instances of this class represent, among all the business activities, some conservation and restoration works of art.'),
(576, 1, 6, 'Retail_motor_vehicles_parts', 'Retail Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles and brokering in the trade of motorcycle parts and accessories.'),
(577, 1, 6, 'Retail_sale_non_specialized_stores', 'Retail Sale Non-Specialized Stores', 'The instances of this class represent, among all business activities, certain retail activities in non-specialized businesses, including prevalence of food and beverages.'),
(578, 1, 6, 'Retail_trade', 'Retail Trade', 'The instances of this class represent, among all business activities, certain retail activities.'),
(579, 1, 6, 'Ride', 'Ride', 'Run scheduled by a certain TPL company on a certain route of a certain line.'),
(580, 1, 6, 'Riding_stables', 'Riding stables', 'The instances of this class represent, among all service locations, some riding stables activities.'),
(581, 1, 6, 'Road', 'Road', 'Class whose instances are the streets.'),
(582, 1, 6, 'RoadElement', 'Road element', 'Class whose instances are the elements that make up the streets.'),
(583, 1, 6, 'RoadLink', 'RoadLink', 'Linear road section bounded by two junctions that make up the road element.'),
(584, 1, 6, 'Roman_bridge', 'Roman bridge', 'The instances of this class represent the Roman bridges.'),
(585, 1, 6, 'Rope_cord_and_twine', 'Rope cord and twine', 'The instances of this class represent, among all business activities, certain retail activities of spades, ropes, canvases and jute bags and packaging products (excluding paper and board products).'),
(586, 1, 6, 'Route', 'Route', 'A route that is driven by public transport.'),
(587, 1, 6, 'RouteJunction', 'Route Junction', 'Interconnection point between road segments to determine the path of a TPL line.'),
(588, 1, 6, 'RouteLink', 'RouteLink', 'Road section bounded by two TPL junction that determines the path of a TPL line.'),
(589, 1, 6, 'RouteSection', 'Route Section', 'Road section between two successive bus stops in a certain line.'),
(590, 1, 6, 'Rtz_daily', 'Restricted traffic zone daily', 'Each instance of this class represents a limited active zone in the only daylight hours.'),
(591, 1, 6, 'Rtz_nightly', 'Restricted traffic zone nightly', 'Ciascuna istanza di questa classe rappresenta una zona a traffico limitato attiva nelle sole ore notturne.'),
(592, 1, 6, 'Sailing_school', 'Sailing school', 'The instances of this class represent, among all service locations, some sailing schools.'),
(593, 1, 6, 'Sale_motor_vehicles_parts', 'Sale Motor Vehicles Parts', 'The instances of this class represent, among all the business activities, certain trade in parts and accessories of motor vehicles.'),
(594, 1, 6, 'Sale_of_motor_vehicles', 'Sale of Motor Vehicles', 'The instances of this class represent, among all the business activities, certain car trade activities.'),
(595, 1, 6, 'Sale_of_motor_vehicles_and_motorcycles', 'Sale of Motor Vehicles and Motorcycles', 'The instances of this class represent, among all business activities, certain wholesale and retail activities and repair of motor vehicles and motorcycles.'),
(596, 1, 6, 'Sale_of_motorcycles', 'Sale of Motorcycles', 'The instances of this class represent, among all the business activities, certain activities of trade, maintenance and repair of motorcycles and related parts and accessories.'),
(597, 1, 6, 'Sale_via_mail_order_houses_or_via_internet', 'Sale Via Mail Order Houses or Via Internet', 'The instances of this class represent, among all business activities, certain retail activities of any type of correspondence, radio, telephone, Internet product.'),
(598, 1, 6, 'Sandwich_shop_pub', 'Sandwich shop pub', 'The instances of this class represent, among all business activities, some sandwich shops and pubs.'),
(599, 1, 6, 'Sanitary_equipment', 'Sanitary Equipment', 'The instances of this class represent, among all the business activities, certain retail activities of sanitary articles.'),
(600, 1, 6, 'Sawmilling', 'Sawmilling', 'The instances of this class represent, among all the business activities, some wood cutting and planing activities.'),
(601, 1, 6, 'SchoolObservation', 'SchoolObservation', NULL),
(602, 1, 6, 'Second_hand_books', 'Second-Hand Books', 'The instances of this class represent, among all the business activities, certain retail activities of second hand articles and books.'),
(603, 1, 6, 'Second_hand_goods', 'Second-Hand Goods', 'The instances of this class represent, among all business activities, certain retail activities of second hand items and clothing.'),
(604, 1, 6, 'Secondary_education', 'Secondary education', 'The instances of this class represent, among all business activities, secondary education of first and second grade general (high school), technical, vocational and artistic education.'),
(605, 1, 6, 'Secretarial_support_services', 'Secretarial support services', 'The instances of this class represent, among all business activities, certain photocopying, document preparation and other specialized support activities for office functions, and certain activities for the dispatch of propaganda material, compilation and address management .'),
(606, 1, 6, 'Security_systems', 'Security systems', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(607, 1, 6, 'Security_systems_service', 'Security systems service', 'The instances of this class represent, among all business activities, certain retail trade activities of security systems.'),
(608, 1, 6, 'Senior_centre', 'Senior centre', 'The instances of this class represent, among all the places of service, some old-age hospitals.'),
(609, 1, 6, 'SensorSite', 'Traffic sensor', 'Single sensor for observing speed, traffic, concentration or density'),
(610, 1, 6, 'SensorSiteTable', 'Sensor Site Table', 'Set of sensors representing a single installation, a single site.'),
(611, 1, 6, 'Service', 'Service', 'Business activities, services to the citizen, offices, services in general, which can be located at one point.'),
(612, 1, 6, 'Sewerage', 'Sewerage', 'The instances of this class represent, among all business activities, certain sewerage companies.'),
(613, 1, 6, 'Sexy_shop', 'Sexy Shop', 'The instances of this class represent, among all the business activities, some retail business of adult articles (sexy shop).'),
(614, 1, 6, 'Shelter_area', 'Shelter area', 'Each instance of this class represents a population gathering point in case of disaster.'),
(615, 1, 6, 'ShoppingAndService', 'Shopping and service', 'Shops, malls, stores, all forms of public sale activities.'),
(616, 1, 6, 'Shopping_centre', 'Shopping centre', 'The instances of this class represent, among all business activities, some department stores.'),
(617, 1, 6, 'Single_brand_store', 'Single brand store', 'The instances of this class represent, among all service locations, some single-brand stores.'),
(618, 1, 6, 'SituationRecord', 'Situation Record of a Car Park', 'Recording the situation of a given parking lot at a certain time.'),
(619, 1, 6, 'Ski_school', 'Ski school', 'The instances of this class represent, among all the service centers, some ski schools.'),
(620, 1, 6, 'Skiing_facility', 'Skiing facility', 'The instances of this class represent, amongst all service locations, some skiing facilties.'),
(621, 1, 6, 'Small_household_appliances', 'Small Household Appliances', 'The instances of this class represent, among all the business activities, some retail business of sewing machines and household knitwear.'),
(622, 1, 6, 'Small_shop', 'Small shop', 'The instances of this class represent, among all business activities, some grocery stores.'),
(623, 1, 6, 'SmartBenchObservation', 'Smart bench observation', 'Each instance of this class represents a detection from a bench equipped with advanced features.'),
(624, 1, 6, 'SmartIrrigatorObservation', 'Smart irrigator observation', 'Each instance of this class represents a detection from a sprinkler equipped with advanced features.'),
(625, 1, 6, 'SmartWasteContainerObservation', 'Smart waste container observation', 'Each instance of this class represents a detection from a waste container with advanced features.'),
(626, 1, 6, 'Smart_bench', 'Smart bench', 'Ciascuna istanza di questa classe rappresenta una panchina dotata di funzionalità evolute.'),
(627, 1, 6, 'Smart_irrigator', 'Smart irrigator', 'Each instance of this class represents an irrigator with advanced features.'),
(628, 1, 6, 'Smart_street_light', 'Smart street light', 'Each instance of this class represents a street lamp with advanced features.'),
(629, 1, 6, 'Smart_waste_container', 'Smart waste container', 'Each instance of this class represents a garbage dump with advanced features.'),
(630, 1, 6, 'Social_centre', 'Social centre', 'The instances of this class represent, among all service locations, some social centers.'),
(631, 1, 6, 'Social_security_service_office', 'Social security service office', 'The instances of this class represent, among all service locations, certain offices of the National Institute of Social Security.'),
(632, 1, 6, 'Social_work', 'Social work', 'The demands of this class include, among all business activities, certain nursery services, day care for disabled children and residential and non-residential social services for the elderly and disabled.'),
(633, 1, 6, 'Software_publishing', 'Software publishing', 'The instances of this class represent, among all the business activities, some computer and software play activities.'),
(634, 1, 6, 'Sound_recording_and_music_publishing', 'Sound Recording and Music Publishing', 'The instances of this class include, among all the business activities, some sound recording and music publishing activities also in sound recording studios.'),
(635, 1, 6, 'Souvenirs_craftwork_and_religious_articles', 'Souvenirs Craftwork and Religious Articles', 'The instances of this class represent, among all the business activities, certain retail trade activities of worship and decoration art, trinkets, costume jewelery and handicrafts.'),
(636, 1, 6, 'Specialized_construction', 'Specialized Construction', 'The instances of this class represent, among all the business activities, certain specialized construction activities, such as: installation of street lighting and signaling devices, illumination of the slopes of airports (including maintenance and repair); installation of sewage treatment plants for swimming pools (including maintenance and repair); Installation of irrigation systems for gardens (including maintenance and repair); drilling and perforation; works of thermal, acoustic or anti-vibration insulation; installation of electronic equipment (including maintenance and repair); installation of electrical installations in buildings or in other works of building (included maintenance and repair); tinteggiatura and pose in work of glasses; Installation of plumbing, heating and air conditioning (including maintenance and repair) in buildings or in other works of construction; poses in work of casseforti and infissi; completion and finishing of buildings; demolition of buildings; poses in work of infissi, furnitures, controsoffitti, mobile and alike walls; covering of floors and walls; preparation of the yard building and placing of the terrain; plastering and plastering; installation of gas distribution facilities (including maintenance and repair); installation of fire extinguishing systems, including integrated ones (including maintenance and repair); installation, repair and maintenance of elevators and escalators.'),
(637, 1, 6, 'Specialized_design', 'Specialized Design', 'The instances of this class represent, among all business activities, certain design activities including: some professional, scientific and technical activities; certain specialized design activities; fashion and industrial design activities; activities of technical designers; graphics and graphic design, including Web pages.'),
(638, 1, 6, 'Speed_camera', 'Speed camera', 'The instances of this class are each a speedcam.'),
(639, 1, 6, 'Sport_event_promoters', 'Sport event promoters', 'The instances of this class represent, among all the business activities, certain activities of sports organizations, including the promotion of sporting events.'),
(640, 1, 6, 'Sporting_equipment', 'Sporting Equipment', 'The instances of this class represent, among all business activities, certain retail activities of sporting goods, bicycles, leisure articles and underwater activities.'),
(641, 1, 6, 'Sports_and_recreation_education', 'Sports and recreation education', 'The instances of this class represent, among all the business activities, some activities of organizing sports and recreational courses.'),
(642, 1, 6, 'Sports_clubs', 'Sports clubs', 'The instances of this class represent, among all the business activities, some activities of sports clubs.'),
(643, 1, 6, 'Sports_facility', 'Sports facility', 'The instances of this class represent, among all the business activities, some sports facilities management activities.'),
(644, 1, 6, 'Squares', 'Squares', 'The instances of this class represent, among all the places of service, some squares of interest to carry out cultural activities.'),
(645, 1, 6, 'Stalls_and_markets', 'Stalls and Markets', 'The instances of this class represent, among all business activities, certain street retailing business activities.'),
(646, 1, 6, 'Stalls_and_markets_of_clothing_and_footwear', 'Stalls and Markets of Clothing and Footwear', 'The instances of this class represent, among all the business activities, certain street retailing business of textiles, home textiles, clothing, footwear and leather goods.'),
(647, 1, 6, 'Stalls_and_markets_of_food', 'Stalls and Markets of Food', 'The instances of this class represent, among all business activities, some street retailing business of foodstuffs and beverages, fruit and vegetables, fish products and meats.'),
(648, 1, 6, 'Stalls_and_markets_other_goods', 'Stalls and Markets Other Goods', 'The instances of this class represent, among all the business activities, certain street retailing business of machinery, equipment and products for agriculture, gardening equipment, trinkets, jewelery, garden furniture, furniture, carpets, Mats, household items, household appliances, electrical equipment, perfumes and cosmetics, soaps, detergents and other detergents for any use, flowers, plants, bulbs, seeds and fertilizers.'),
(649, 1, 6, 'Stamps_and_coins', 'Stamps and Coins', 'The instances of this class represent, among all the business activities, certain pharmacy, numismatics and collectibles retail activities.'),
(650, 1, 6, 'StatisticalData', 'StatisticalData', 'Value referring to a statistical data linked to a road or to a Public Administration.'),
(651, 1, 6, 'Stone_processing', 'Stone Processing', 'The instances of this class represent, among all the business activities, certain mining activities of various stones and minerals not related to the extraction, segagion and processing of stones and marble, artistic marble processing and other related stones , Mosaic work, cutting, molding and finishing of stones.'),
(652, 1, 6, 'StreetNumber', 'Street Number', 'Class whose instances are known civic numbers.'),
(653, 1, 6, 'Street_light', 'Street light', 'Each instance of this class represents a lamppost of the street lighting system.'),
(654, 1, 6, 'Street_sweeping', 'Street sweeping', 'The instances of this class include, among all the business activities, some cleaning and washing activities in public areas, removal of snow and ice.'),
(655, 1, 6, 'Summer_camp', 'Summer camp', 'The instances of this class represent, among all the business activities, certain activities of marine and mountain colonies.'),
(656, 1, 6, 'Summer_residence', 'Summer residence', 'The instances of this class represent, among all service locations, some holiday homes.'),
(657, 1, 6, 'Supermarket', 'Supermarket', 'The instances of this class represent, among all business activities, some supermarkets.'),
(658, 1, 6, 'Support_activities_for_transportation', 'Support Activities for Transportation', 'The instances of this class represent, among all business activities, certain services related to land, air, sea, and waterways transport.'),
(659, 1, 6, 'Support_animal_production', 'Support Animal Production', 'The instances of this class represent, among all the business activities, certain support activities for farming, including in particular agricultural crops associated with animal breeding, plant and animal production support activities, agriculture and subsequent collection activities.'),
(660, 1, 6, 'Surgical_activities', 'Surgical activities', NULL),
(661, 1, 6, 'Surveyor', 'Surveyor', 'The instances of this class represent, among all the business activities, certain technical activities carried out by geometers.'),
(662, 1, 6, 'Sushi_bar', 'Sushi bar', 'The instances of this class represent, among all business activities, some sushi bars.'),
(663, 1, 6, 'Take_away', 'Take Away', 'The instances of this class represent, among all the business activities, certain catering activities (without provision) for preparation of takeaway foods.'),
(664, 1, 6, 'Tannery', 'Tannery', 'The instances of this class include, among all the business activities, certain tanning activities of leather, manufacture of travel articles, handbags, leather goods and saddlery, fur preparation and dyeing.'),
(665, 1, 6, 'Tattoo_and_piercing', 'Tattoo and piercing', 'The instances of this class represent, among all the business activities, some tattoo and piercing activities.'),
(666, 1, 6, 'Tax_advice', 'Tax advice', 'The instances of this class represent, among all business activities, certain activities carried out by Tax Assistance Centers.'),
(667, 1, 6, 'Taxi_company', 'Taxi Company', 'The instances of this class represent, among all business activities, some taxi transport activities.'),
(668, 1, 6, 'Taxi_park', 'Taxi park', 'The instances of this class represent, among all service locations, certain parking areas for taxis.'),
(669, 1, 6, 'Technical_consultants', 'Technical consultants', 'The instances of this class represent, among all business activities, certain activities of architecture, engineering and other engineering studies.'),
(670, 1, 6, 'Technical_testing', 'Technical testing', 'The instances of this class represent, among all the business activities, certain testing and technical analysis activities.'),
(671, 1, 6, 'Telecommunications', 'Telecommunications', 'The instances of this class represent, among all business activities, certain retail trade activities of telecommunications equipment and telephony in specialized stores.'),
(672, 1, 6, 'Television_broadcasting', 'Television broadcasting', 'The instances of this class represent, among all the business activities, certain activities of television programming and broadcasting.'),
(673, 1, 6, 'Temp_agency', 'Temp agency', 'The instances of this class represent, among all the business activities, certain activities of the temporary employment agency.'),
(674, 1, 6, 'Textile_manufacturing', 'Textile Manufacturing', 'The instances of this class represent, among all the business activities, certain textile manufacturing activities, including: manufacture of twine, string, ropes and nets; manufacture of tulle, lace and lace; packaging of textile articles (excl. articles of clothing); manufacture of felt and textile articles diverse; manufacture of nonwovens and articles thereof (excl. articles of apparel); manufacture of embroidery; manufacture of carpets and carpets; finishing of textiles, of articles of changing room and similari activities; preparation and spinning of textile fibers; weaving; confezionamento of biancheria of bed, of table and for the amoblamiento; manufacture of knitted fabrics; manufacture of ribbons, labels and trimmings of textile fibers.'),
(675, 1, 6, 'Textiles_products', 'Textiles Products', 'The instances of this class represent, among all the business activities, certain retail trade activities of textile products.'),
(676, 1, 6, 'Theatre', 'Theatre', 'The instances of this class include, among all the business activities, certain theatrical activities, including in particular: activities in the field of directing; other activities supporting artistic representations; management of theaters, concert halls and other artistic structures; activities in the field of acting; artistic and literary creations; artistic representations; rental with operator of structures and equipment for events and shows.'),
(677, 1, 6, 'ThermometryObservation', 'Thermometry observation', 'Ciascuna istanza di questa classe rappresenta una rilevazione della temperatura eseguita in un certo luogo ad un certo istante di tempo.'),
(678, 1, 6, 'Ticket_sale', 'Ticket sale', 'The instances of this class represent, among all business activities, certain ticketing services for theatrical, sports and other recreational and entertainment events.'),
(679, 1, 6, 'Tobacco_industry', 'Tobacco Industry', 'The instances of this class represent, among all the business activities, certain tobacco industries.'),
(680, 1, 6, 'Tobacco_shop', 'Tobacco shop', 'The instances of this class represent, among all the business activities, certain retail trade activities of monopolies (tobaccos).'),
(681, 1, 6, 'Toilet', 'Toilet', 'The instances of this class represent, among all the services, some public toilets, to be framed in the context of tourist services.'),
(682, 1, 6, 'Tour_operator', 'Tour operator', 'The instances of this class represent, among all business activities, certain activities of travel agencies.'),
(683, 1, 6, 'TourismService', 'Tourism Services', 'Activities of travel agency services, tour operators and booking services.'),
(684, 1, 6, 'Tourist_complaints_office', 'Tourist complaints office', 'The instances of this class represent, among all service locations, certain complaint offices dedicated to the tourism sector.'),
(685, 1, 6, 'Tourist_guides', 'Tourist guides', 'The instances of this class represent, among all the business activities, certain activities of guides and tour guides.'),
(686, 1, 6, 'Tourist_information_office', 'Tourist information office', 'The instances of this class represent, among all service locations, some tourist information offices.'),
(687, 1, 6, 'Tourist_trail', 'tourist trail', 'The instances of this class represent, among all service locations, certain tourist itineraries.'),
(688, 1, 6, 'Towing_and_roadside_assistance', 'Towing and Roadside Assistance', 'The instances of this class represent, among all the business activities, some towing and roadside assistance activities.'),
(689, 1, 6, 'TrafficConcentration', 'Traffic Concentration Observation', 'Subclass of observations on auto concentration.'),
(690, 1, 6, 'TrafficFlow', 'Traffic Flow Observation', 'Subclass of auto flow observations.'),
(691, 1, 6, 'TrafficHeadway', 'Traffic Headway Observation', 'Sub-class of observations on the average transit time between cars.'),
(692, 1, 6, 'TrafficObservation', 'Traffic observation', 'Each instance of this class represents a traffic detection performed at some point at some time.'),
(693, 1, 6, 'TrafficSpeed', 'TrafficSpeed Observation', 'Subclass of average velocity observations.'),
(694, 1, 6, 'Traffic_corps', 'Traffic corps', 'Each instance of this class represents a Street Police Station.'),
(695, 1, 6, 'Traffic_light', 'Traffic light', 'The instances of this class are each a semaphorical facility.'),
(696, 1, 6, 'TrainStation', 'Train Station', 'Railway station, are located at railway junctions with a ratio of 1:1'),
(697, 1, 6, 'Train_lost_property_office', 'Train lost property office', 'The instances of this class represent, among all service locations, some offices for the lost items located inside train stations.'),
(698, 1, 6, 'Train_station', 'Train station', 'The instances of this class represent, at all service locations, some railway stations.'),
(699, 1, 6, 'Training_school', 'Training school', 'The instances of this class represent, among all business activities, some training courses and professional updating courses.'),
(700, 1, 6, 'Training_school_for_teachers', 'Training school for teachers', 'The instances of this class represent, among all service locations, some master schools.'),
(701, 1, 6, 'Tram_stops', 'Tram stops', 'The instances of this class represent, at all service locations, some tram stops.'),
(702, 1, 6, 'Tramline', 'Tram line', 'The instances of this class represent, among all service locations, some tram lines.'),
(703, 1, 6, 'TransferServiceAndRenting', 'Transfer service and renting', 'Car parks, railway stations or buses, everything that must be located on a map and refers to transportation.'),
(704, 1, 6, 'Translation_and_interpreting', 'Translation and interpreting', 'The instances of this class represent, among all the business activities, some translation and interpretation activities.'),
(705, 1, 6, 'TransverseService', 'Transverse Service', 'Services often associated with other services, which have their own geolocation.'),
(706, 1, 6, 'Trattoria', 'Trattoria', 'The instances of this class represent, among all the business activities, some trattorias.'),
(707, 1, 6, 'Travel_agency', 'Travel agency', 'The instances of this class represent, among all business activities, some travel agencies.'),
(708, 1, 6, 'Travel_bureau', 'Travel bureau', 'The instances of this class represent, among all service locations, some tourist offices dedicated to guided tours.'),
(709, 1, 6, 'Travel_goods', 'Travel goods', 'The instances of this class represent, among all business activities, certain retail trade of leather goods and travel goods.'),
(710, 1, 6, 'Travel_information', 'Travel information', 'The instances of this class represent, among all business activities, certain services provided by travel agencies and tour operators, booking services, services of tourist interest made by subjects other than travel agencies and tour operators, and related activities.'),
(711, 1, 6, 'Trinkets', 'Trinkets', 'The instances of this class represent, among all the business activities, certain retail trade of trinkets and jewelery (including souvenirs and promotional items).'),
(712, 1, 6, 'Underwear_knitwear_and_shirts', 'Underwear, Knitwear and Shirts', 'The instances of this class represent, among all the business activities, some retail business of personal linen, knitwear, shirts.'),
(713, 1, 6, 'Upholsterer', 'Upholsterer', 'The instances of this class represent, among all the business activities, some upholstery workshops.'),
(714, 1, 6, 'Urban_bus', 'Urban bus', 'The instances of this class represent, among all service locations, the locations of certain local public transport companies operating on urban areas.'),
(715, 1, 6, 'Useful_numbers', 'Useful numbers', 'The instances of this class represent the numbers to be called in an emergency.'),
(716, 1, 6, 'UtilitiesAndSupply', 'Utilities and supply', 'Fornitura di utenze e servizi'),
(717, 1, 6, 'Vacating_service', 'Vacating service', 'The instances of this class represent, among all business activities, certain activities of clearing cellars, floors and garages.'),
(718, 1, 6, 'Vacation_resort', 'Vacation resort', 'The instances of this class represent, among all service locations, some holiday resorts.'),
(719, 1, 6, 'Vehicle_rental', 'Vehicle rental', 'The instances of this class represent, among all service locations, certain vehicle rental services.'),
(720, 1, 6, 'Vehicle_trade', 'Vehicle trade', 'This class represents, among all business activities, the business of buying and selling vehicles.'),
(721, 1, 6, 'Vending_machines', 'Vending Machines', 'The instances of this class represent, among all business activities, certain retail activities carried out by automated vending machines.'),
(722, 1, 6, 'Veterinary', 'Veterinary', 'The demands of this class represent, among all business activities, certain veterinary services.'),
(723, 1, 6, 'Video_tapes_disks_rental', 'Video tapes disks rental', 'The instances of this class represent, among all business activities, some hire of video cassettes, CDs, DVDs and discs containing audiovisual or video games.'),
(724, 1, 6, 'Viewpoint', 'Viewpoint', 'Ciascuna istanza di questa classe rappresenta un punto panoramico.'),
(725, 1, 6, 'Wallpaper_and_floor_coverings', 'Wallpaper and Floor Coverings', 'The instances of this class represent, among all business activities, some retail business of wallpaper and floor coverings (carpet and linoleum).'),
(726, 1, 6, 'Warehousing_and_storage', 'Warehousing and Storage', 'The instances of this class represent, among all business activities, certain storage and custody activities, and in particular: storage and custody; warehousing and transport support activities; refrigerated warehouses for third parties; warehouses of custody and deposit for third account.'),
(727, 1, 6, 'WasteType', 'Waste container type', 'Each instance of this class represents a particular type of waste container (undifferentiated, paper, plastic, glass, drugs, and so on).'),
(728, 1, 6, 'Waste_collection_and_treatment', 'Waste Collection and Treatment', 'The instances of this class represent, among all business activities, certain waste collection, treatment and disposal activities.'),
(729, 1, 6, 'Waste_container', 'Waste container', 'Each instance of this class represents a waste bin.'),
(730, 1, 6, 'Water_collection_treatment_and_supply', 'Water Collection Treatment and Supply', 'The instances of this class represent, among all business activities, certain activities of gathering, treating and supplying water.'),
(731, 1, 6, 'Water_resource', 'Water resource', 'Each instance of this class represents a water resource company or entity.'),
(732, 1, 6, 'Water_transport', 'Water Transport', 'The instances of this class represent, among all the business activities, certain maritime, coastal and inland waterway transport activities.'),
(733, 1, 6, 'Weapons_and_ammunition', 'Weapons and Ammunition', 'The instances of this class represent, among all business activities, certain retail trade activities of weapons, ammunition and military articles.'),
(734, 1, 6, 'WeatherPrediction', 'Weather prediction', 'Meteorological forecast for a specific part of the day.'),
(735, 1, 6, 'WeatherReport', 'Weather Report', 'Meteorological report with information on temperature, humidity, snow and the like.'),
(736, 1, 6, 'Weather_sensor', 'Weather sensor', 'Weather sensor releasing information on weather forecasts.'),
(737, 1, 6, 'Web_and_internet_provider', 'Web and Internet Provider', 'The instances of this class represent, among all business activities, some hosting and provision of application services, including Web portals.'),
(738, 1, 6, 'Wedding_favors', 'Wedding Favors', 'The instances of this class represent, among all business activities, certain candy-shop retail activities.'),
(739, 1, 6, 'Welfare_worker_office', 'Welfare worker office', 'The instances of this class represent, among all service locations, certain offices of social workers.'),
(740, 1, 6, 'Wellness_centre', 'Wellness centre', 'The instances of this class represent, among all business activities, certain activities of centers for physical well-being and spa facilities.'),
(741, 1, 6, 'Wholesale', 'Wholesale', 'Wholesale of anything.'),
(742, 1, 6, 'Wholesale_agricultural_raw_materials_live_animals', 'Wholesale Agricultural Raw Materials Live Animals', 'The instances of this class represent, among all business activities, certain wholesale trade in animal and vegetable products, including: cereals and pulses; Live animals; Leather and raw hides and skins (excluding fur skins); Raw skins and furskins; Seeds and feed for livestock (feed), officinal plants, oilseeds, potatoes; Cereals, raw tobacco, seed and livestock feed (feed); flowers and plants.'),
(743, 1, 6, 'Wholesale_commission_trade', 'Wholesale Commission Trade', 'The instances of this class represent, among all the business activities, certain activities of agents and trade representatives.'),
(744, 1, 6, 'Wholesale_food_beverages_tobacco', 'Wholesale Food Beverages Tobacco', 'The instances of this class represent, among all the business activities, certain activities of wholesale trade in food and tobacco products.'),
(745, 1, 6, 'Wholesale_household_goods', 'Wholesale Household Goods', 'The instances of this class represent, among all business activities, certain non-food wholesale trade activities.'),
(746, 1, 6, 'Wholesale_ict_equipment', 'Wholesale ICT Equipment', 'The instances of this class represent, among all business activities, certain wholesale activities of electronic, computer and similar equipment.'),
(747, 1, 6, 'Wholesale_machinery_equipmentent_supplies', 'Wholesale Machinery Equipmentent Supplies', 'The instances of this class represent, among all business activities, certain wholesale trade of professional equipment.'),
(748, 1, 6, 'Wholesale_motor_vehicles_parts', 'Wholesale Motor Vehicles Parts', 'The instances of this class represent, among all business activities, certain wholesale and brokering activities of parts and accessories of motor vehicles.'),
(749, 1, 6, 'Wholesale_trade', 'Wholesale Trade', 'The instances of this class represent, among all business activities, certain wholesale activities.'),
(750, 1, 6, 'Wifi', 'Free WiFi point', 'The instances of this class represent, among all service locations, certain access points to Wi-Fi networks.'),
(751, 1, 6, 'WineAndFood', 'Wine And Food', 'Restaurants, wine bars and all other food and wine activities.'),
(752, 1, 6, 'Wine_shop_and_wine_bar', 'Wine shop and wine bar', 'The instances of this class represent, among all business activities, certain beverage retail activities.'),
(753, 1, 6, 'Youth_assistance', 'Youth assistance', 'The instances of this class represent, among all service locations, some childcare centers.'),
(754, 1, 6, 'Youth_information_centre', 'Youth information centre', 'The instances of this class represent, among all service locations, certain youth information centres.'),
(760, 1, 8, 'Sportif', 'Sportif', NULL),
(761, 1, 8, 'Entraineur', 'Entraineur', NULL),
(762, 1, 8, 'Seance', 'Seance', NULL),
(763, 1, 8, 'Gymnase', 'Gymnase', NULL),
(764, 1, 8, 'Sports', 'Sports', NULL);

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
(2, 1, 106, NULL, NULL, 'Club de sports'),
(3, 1, 109, NULL, NULL, 'Joueur de football americain'),
(4, 1, 107, NULL, NULL, 'Entraineur de Sports'),
(5, 1, 760, NULL, NULL, 'Basketteur'),
(6, 1, 762, NULL, NULL, 'Entrainement_Hebdomadaire');

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
(23, 3, 1, NULL, NULL, 1, NULL, 0, 0),
(24, 3, 4, NULL, NULL, 2, NULL, 0, 0),
(25, 4, 1, NULL, NULL, 1, NULL, 0, 0),
(26, 4, 4, NULL, NULL, 2, NULL, 0, 0),
(27, 5, 1, NULL, NULL, 1, NULL, 0, 0),
(28, 5, 4, NULL, NULL, 2, NULL, 0, 0),
(29, 6, 1, NULL, NULL, 1, NULL, 0, 0),
(30, 6, 4, NULL, NULL, 2, NULL, 0, 0);

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
('2e16cafd3f17a7743994deb63caf4fd8', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631363435303635332e303030363934303336343833373634363438343337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226533326130393535363166643261373261323366333664623430646161366630223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435333635363b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435333736373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363435333732323b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73742f4f6d656b615f6d61737465722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226438303963376363333033303830323537316334643430633737306536613633223b733a33323a226531393564643631646631303737636463373965306230393366336236613230223b7d733a343a2268617368223b733a36353a2265313935646436316466313037376364633739653062303933663362366132302d6438303963376363333033303830323537316334643430633737306536613633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223236386466373134376364393237306335363061656233643861316535376536223b733a33323a223531643134393539643039666634326164396338656534646365376565633562223b733a33323a223034303337316639656133666139343139313566613864396436363734376163223b733a33323a223163663936653837666466306631386661323437323166323631633564353936223b7d733a343a2268617368223b733a36353a2231636639366538376664663066313866613234373231663236316335643539362d3034303337316639656133666139343139313566613864396436363734376163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226637346535363334396362623737326533303239643362663136336630313738223b733a33323a226662323261656662623063633662636338663332616339663065333631356534223b733a33323a223032613632643865656135633166626635333933376164656133393238343035223b733a33323a223134313933616330313437373539383832356634313366393562643964356464223b7d733a343a2268617368223b733a36353a2231343139336163303134373735393838323566343133663935626439643564642d3032613632643865656135633166626635333933376164656133393238343035223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1616450653),
('4a2f0102d6028c603339352c646be323', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631383835313435312e343638363932303634323835323738333230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223934333238646538313732386661333130623464356666383935353834393130223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383835313930363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383835353035313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383835333131343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631383835333834393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631383835353033323b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73742f4f6d656b615f6d61737465722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223566613737646362643762353365643333646166323763393163656161616433223b733a33323a223633366264333132626632643034363363613866353533326263613430336233223b7d733a343a2268617368223b733a36353a2236333662643331326266326430343633636138663535333262636134303362332d3566613737646362643762353365643333646166323763393163656161616433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a333531323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a226131386533376237616139306663666264376530633838613833633039333735223b733a33323a226664353264303634666261303638373438356366633732333333656464633661223b733a33323a223864663466313566356461643339393539636237366231383438656137336238223b733a33323a223934636635383839653437353233366361353938666439306661326232343637223b733a33323a226139316638373862633239393131643537376261363763316464316662653731223b733a33323a223831616330346230353066623964383936396639663261643561336638626333223b733a33323a226466613335356433316263313166643165313064363361663734656461313766223b733a33323a223235633861393562373566323939323861376565613263626263393863333366223b733a33323a223534633462623436653138306638656661363164393838316566656262393837223b733a33323a223966656662396233343234636533623131316630363230393264666462383464223b733a33323a223965343939393764343839626362666532663531343462343633633936323339223b733a33323a226265323061353862343438626534393030336364626431666663663633613936223b733a33323a223765633232353239356365646562313633656263333839343562393237316465223b733a33323a223838333865633165663232626333363536613766623261323764353533393663223b733a33323a223965613835383139653733343865313835643531626266396431626530336364223b733a33323a223862346530393534623665353236343363636562636637316635623236623366223b733a33323a223563643536396162633261653330306166613662666461653531376566353165223b733a33323a223633366630346435386438613839643039346239303430323363346334333830223b733a33323a223137663830306162376637353535633931363861656561393764353666316631223b733a33323a223336386361326165303964363238666666366466646463626264393832343165223b733a33323a223563643331343739663036613464613062386433633963393634643963623763223b733a33323a226366613938623761326163633364643236376332653338353062643765613664223b733a33323a223261613430653837346330663330616335336366323938353330623163646631223b733a33323a226638393266323334303132633838613135363037643364616537326330303163223b733a33323a223466303939306563383338626332396266613335663338643730303930303938223b733a33323a223034623236303436646235306264376134363662643061363233636231313233223b733a33323a223037356261613730663035626439346664353536353762666161353134303739223b733a33323a223432323235653164363061353137323235353335346461326135363566643162223b733a33323a226664616366326336636465653637336461663235383665643031613130363334223b733a33323a223366636332346432626237613861363139643435643833306635666636386637223b733a33323a226563313038663165366431316166633139653736373536306235316637666265223b733a33323a223538343136376362656336626463396662613039343037313566306564323865223b733a33323a226264313930393135313638323434343833303061333436376363376563383366223b733a33323a223737643636623630333863353632363432356631353161343131363331333136223b733a33323a223930376537346634313137383634333963373665636565376636386132303633223b733a33323a223463666366653864333066663164333163613738636534393230636539376434223b733a33323a223332393834383337646634646137613665376532343162316434393037343239223b733a33323a226139323861653165336638633530396434636537643732656230633634386439223b733a33323a223238333936616565376566353637613438646664396632653064356663366131223b733a33323a226366636161643264633634346364303630383636373362643731386362326165223b733a33323a226239383236386330643162663461383638646330643034646432323966663333223b733a33323a223330396337623733336331356661613766623266623637646637366339393439223b733a33323a223664353237383531646431363232613861623465616137386564633365626239223b733a33323a223036613761333734626463613462386133323233303030623965373738373631223b733a33323a226562663636323734366263396439623134626565666234303537333863376663223b733a33323a223564663866333666353134613364663139663431353336633537633966666561223b733a33323a223931343339343232343533356437643061393361306364313133613064373137223b733a33323a226262626462353232386431663130336332313933383463356564333333396666223b733a33323a223830383236386564356235623530326465333336316336353163613265623834223b733a33323a223564303964633031376237376436386537303531613866373133373166646665223b733a33323a223133636436633235363036313632663138323161353930313235336335373866223b733a33323a223664613835373839306139663634663031336466323862666664623764373931223b733a33323a223865313365313435393934656665323565393235363039613937643635303865223b733a33323a223833356461343331323032643838353563373931363461353461626131633539223b733a33323a226133663638613839306264356564323134336234383035316566626432323835223b733a33323a223539323531343066356465353237353133646139656531303730393164393765223b733a33323a223236336266303437393765383930366165373233303165376238333365623865223b733a33323a226237623135646465333166646363363461643162336263366438353662386265223b733a33323a223335313465613933613231363032363330656235386166343165656163383534223b733a33323a223865353866646331393438393662353032643964613231366465363237626637223b733a33323a223361383136323061353539396239666530613931626163313365316165326634223b733a33323a226634363232633134313039626133383663333563373835323264636638346133223b733a33323a223338623566383538616436393632383033393365636132643431376630393839223b733a33323a226135633338366231336339323265313333363338336339643763306334313238223b733a33323a223062623937343838353635643966313137656330626464623033373535316364223b733a33323a226664306138333435346166366136323730366231313232623034396231663430223b733a33323a226338353734636332383838363532303038373032323866373635323730366663223b733a33323a226537396532363832303263663762396133656439646466326362306533656130223b733a33323a223263383438336665626439393662313830666630306663623565343532333938223b733a33323a226236633034653033626462656132613737373033633138313362396265323237223b733a33323a226236316637303364393034636635366436346433643130653831653436303763223b733a33323a223735646230636662643266336330653665666464616363653064356238373263223b733a33323a226662343564663535663461663532383632663662633263613933626365333632223b733a33323a226131353332333730613264353164333433633762623339636430613039623130223b733a33323a226632323434376435373564633539366637326431366265303535616338326633223b733a33323a226236643066633463386136616664316333383565663937356266626535663362223b733a33323a223630623535333836616363646138663137336531643933373564323636653966223b733a33323a226133663535353031393036613866306537323332383662643738633266633639223b733a33323a226462316530636162643763633630373064313761363839613464633465396234223b733a33323a226335396532303861323434646463373431313330613934333964356233313561223b7d733a343a2268617368223b733a36353a2263353965323038613234346464633734313133306139343339643562333135612d6462316530636162643763633630373064313761363839613464633465396234223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226436373666393863646561356537666365323234393965303562333330306630223b733a33323a226632353837363265623562663031646666613363633565313536316430323334223b733a33323a226339616530396334643364656563613330343039366362366137376137623733223b733a33323a223364626561366265313037376633323838656362383661633433663861663930223b733a33323a223131663061353138646364646165386261393835306130336362343436666539223b733a33323a226237316535363363303361306263303936346135326532663362323465373866223b733a33323a226261393439343333663163623461356634366437346635303763376262636233223b733a33323a223434646531643136636636333432316338306437393031356331633333323462223b733a33323a226331373463613633646535353635633664366235303331363937333037336663223b733a33323a226635376531353737326565346332616437383939333535383362646338353565223b7d733a343a2268617368223b733a36353a2266353765313537373265653463326164373839393335353833626463383535652d6331373463613633646535353635633664366235303331363937333037336663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223930616531323962653332303937343466623065333933313334653637656439223b733a33323a223963326162326536626639643966343939303962623336366533346536393938223b733a33323a226238353065333661373739633031663761623032656137653537356637633438223b733a33323a223466636333666232376166336330323466656138643162386563376636663231223b733a33323a223936646533663633303039373438383132306461353364633530653265383164223b733a33323a223866656537396133623433303564623031383338666362666261666533343161223b733a33323a226232326164663265346136393435663332316164386239353938333037666466223b733a33323a223138343662303634363561333931613031653634636439386162306238343064223b7d733a343a2268617368223b733a36353a2231383436623036343635613339316130316536346364393861623062383430642d6232326164663265346136393435663332316164386239353938333037666466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3935313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223533363363666434363562626235393266373738613539653833613163323339223b733a33323a223332393139356235613566643630633236383134373164306632636433323361223b733a33323a223961316364366336313665363865656461343133356465363930366530313037223b733a33323a223334356537663564333330333465383265636364356433333761313832646363223b733a33323a223639663063336136376233353336386638396331396564333631636538313037223b733a33323a226332616562666132313933633862666561333137396665613164383961626134223b733a33323a226338613731323136366233653662626532306430353534346639633164383965223b733a33323a223163373933633663653865643734383362613566623163393139316466623332223b733a33323a223435376561663130383266636239656435623836623831366661343532643037223b733a33323a223835316232663731383432343061626462393664626336633435346564333366223b733a33323a223234393438303166623433383362366634376430386133386564373931313037223b733a33323a223964666632666431636536616365313539393635653366646632313435636136223b733a33323a223337356365306531623431313333336338356439326135366232376364666130223b733a33323a226139333761306461363236376537386431623831356266636664333737323631223b733a33323a226130363138353030383530653930366537356530656238376531313037626361223b733a33323a223837336265613731346330303561333634343039366431316233636165316235223b7d733a343a2268617368223b733a36353a2238373362656137313463303035613336343430393664313162336361653162352d6130363138353030383530653930366537356530656238376531313037626361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1618851451),
('62b59585c9e6902fd66973402445db62', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353232343139322e393239333031303233343833323736333637313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223933643437636135396231316330656637623665356665636537396433613466223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373732393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373736343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373736373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223864626663623962656365326163306633396436313934313462626537353962223b733a33323a223961346130366262323933333162376663623463373038653663656566666539223b7d733a343a2268617368223b733a36353a2239613461303662623239333331623766636234633730386536636565666665392d3864626663623962656365326163306633396436313934313462626537353962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223636376237306663326131633237623536643164313466393631383461613264223b733a33323a223738343662353937613231656539346338666434303666383165343035373934223b733a33323a223862306265643736313031636161643763623931383238363734326266366538223b733a33323a223339643235353031373439343536383664393166333937643862623333323835223b733a33323a223230613664626662313366653966333865643334623632383639343962346632223b733a33323a223962323136666135306235343862383432653531626631346266323266653561223b733a33323a223532366539373937386434333837626538376536623364626661626238613336223b733a33323a226462666463646239343366396465346561343461323835373734336439393230223b7d733a343a2268617368223b733a36353a2264626664636462393433663964653465613434613238353737343364393932302d3532366539373937386434333837626538376536623364626661626238613336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226466333139323462643537363365663239323466383362666166626335326665223b733a33323a223363343464316231666238353262396534636634656232643637613762316435223b7d733a343a2268617368223b733a36353a2233633434643162316662383532623965346366346562326436376137623164352d6466333139323462643537363365663239323466383362666166626335326665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615224192),
('6fd65ae0c4b49c346640ef28a3004a09', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353535393931362e373435353939393835313232363830363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223333356138303335666665346139646361373964663866386265656365343866223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363634383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363636353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353535363939313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73742f4f6d656b615f6d61737465722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226264626166313538663964376431313036666631613965626533376639633638223b733a33323a226530323962626134613038613736623137646537303935643532316165663464223b7d733a343a2268617368223b733a36353a2265303239626261346130386137366231376465373039356435323161656634642d6264626166313538663964376431313036666631613965626533376639633638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223232306563663335383362663530346433613936306130393530323833613431223b733a33323a226537376633613230646239316637623432356331306137386166393633663730223b733a33323a223264613935626531373066633766363339363439303037303863346139663563223b733a33323a226631656630633730393230393836353339656131393334316466386631383365223b7d733a343a2268617368223b733a36353a2266316566306337303932303938363533396561313933343164663866313833652d3264613935626531373066633766363339363439303037303863346139663563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226561393762626334313533336339303066636536313433383834323636376161223b733a33323a226136366166396262373466393331353130343665343730626232363835303833223b7d733a343a2268617368223b733a36353a2261363661663962623734663933313531303436653437306262323638353038332d6561393762626334313533336339303066636536313433383834323636376161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615559917),
('b84759459be598632bd97682f098f28f', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353232343237372e35383832373330343834303038373839303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223936396533363964323933626436623365306531396565356363346638313638223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373836363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373837373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223737666161656135333762323566336131366635646434373863313035613039223b733a33323a223962326164366530353662653034356336323432363562616637303761326166223b7d733a343a2268617368223b733a36353a2239623261643665303536626530343563363234323635626166373037613261662d3737666161656135333762323566336131366635646434373863313035613039223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223634666431633632303563356534663164633933666563363565643263386233223b733a33323a223334393862663836653862353438333730313866336563623261633565386661223b733a33323a226537393963393962326161386137376433633661636562373836623365333666223b733a33323a223539363938373533306535633966333131646133366233653535313961666666223b7d733a343a2268617368223b733a36353a2235393639383735333065356339663331316461333662336535353139616666662d6537393963393962326161386137376433633661636562373836623365333666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615224277),
('dedb23ce900a1b310560ce5739cab09d', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631353232343236362e303339313333303731383939343134303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226530623265336633306630333265356532613133353736623831386634366430223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373739333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373833373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631353232373835393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226630643438343036633166383362666330306238333764363332363235663132223b733a33323a223732306262616362326232623939386530646534626435393763633830393934223b7d733a343a2268617368223b733a36353a2237323062626163623262326239393865306465346264353937636338303939342d6630643438343036633166383362666330306238333764363332363235663132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3237313a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226664653162353132663738643234636665656263633031396635376131616238223b733a33323a226338613132366331376164626435396232633865356563336562326236633232223b733a33323a226134306261336363613338383166626432333537666161336366343739623234223b733a33323a223066313262333036323334396462323362363337323638656165656366643935223b733a33323a223230646263396235393037303737663835633664366232623534353039303232223b733a33323a226630663561336331333936376637666561336230656136633538646632313465223b733a33323a226265383132353366336463373539343630613833326264653338356666653062223b733a33323a223132386562663965323432366564636534393737663962346365336566613966223b7d733a343a2268617368223b733a36353a2231323865626639653234323665646365343937376639623463653365666139662d6265383132353366336463373539343630613833326264653338356666653062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223765616332353061636637643133303333633066336639326665363663303538223b733a33323a223537343465346131373763643866623430666339393664303266323131343030223b733a33323a223265653363353034663730393637346162373037313265623032666562313433223b733a33323a223836643665626237653433353837653135656336646337333539356536636435223b733a33323a223264333331336135643463613430653036643639303433383639663364376265223b733a33323a223662323737356137316337643038363962326561613237393431633364316330223b7d733a343a2268617368223b733a36353a2236623237373561373163376430383639623265616132373934316333643163302d3264333331336135643463613430653036643639303433383639663364376265223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1615224266);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ed6959745c5b25d3c91a73c0bff59033', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313631363335353830332e3339303637373932383932343536303534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223065373931323130363133653962333433366334636433386634303966386138223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363335373035373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313631363335393336373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363335393233333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363335393430333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363335383630313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313631363335393138383b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73742f4f6d656b615f6d61737465722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223436613030366463613466383730636236313961643866386232626339353339223b733a33323a226530643135363333663031373263333363636630363331636166343564353136223b7d733a343a2268617368223b733a36353a2265306431353633336630313732633333636366303633316361663435643531362d3436613030366463613466383730636236313961643866386232626339353339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226663383964356261613839646636323662353965613139366238336133633135223b733a33323a223662316338306438633139353363313966346638336535663335666233366637223b733a33323a223662636365653066376638336438346331643661623366366463333633383234223b733a33323a223663306635376637373537643939626261646366623133393036663732386565223b733a33323a226563393363396366656238663139306633346461636365656533366632363939223b733a33323a223766656462306639623038376138653463663230383532326237646232653431223b733a33323a223338636162616563306366663964306534336364613233323566303733363733223b733a33323a226364333266643432333561363161633432626364373732616137373432663036223b733a33323a226132613536303330303737316664366262373932313432353164383065346335223b733a33323a226435336239616438633139343335306235633032326265313564643239313730223b733a33323a223736343466343561656533363338363836656638613937663162363566646462223b733a33323a223135383039376333653666326239376464386261313931623836333933393631223b7d733a343a2268617368223b733a36353a2231353830393763336536663262393764643862613139316238363339333936312d3736343466343561656533363338363836656638613937663162363566646462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223132383836376263313935346337623037643233346334656361376564386132223b733a33323a226635383730383330316231653136383563386261383434323430373639626263223b733a33323a226464326334666536346235383763353762396532666431663662616136323363223b733a33323a226462326634326635366163636533353435396634643231373139666139613265223b733a33323a226430636662313461383866316562613633393138636562633730623064653130223b733a33323a226262613763303866633462303861303433376366343733386166323433623163223b733a33323a223766383063326139323833656562316562613165306531316462366263383762223b733a33323a223939376365383064643133633636326236313934353561373564373632366431223b733a33323a226136383266366562376462633032646131633930383966366434306231303631223b733a33323a223237653364373038333464653065313333303638303233353131393331666334223b733a33323a223635393765636136323231646330663666636431343064623339653365333462223b733a33323a223866613263346562646165643132656163393739303034373266303532366533223b733a33323a223766643439386536316131636139346631326365363034666632386465383438223b733a33323a226562373661343565633364393066396233363163353265626366343466623833223b733a33323a223132383364666430613435373733316136313662363133386161633664623730223b733a33323a223736326164346630663032313764333034623139373863633037646261636638223b733a33323a223534316365323431656462616663636539393834323639393061613431663731223b733a33323a223635366465306132306461396636663065623931643330383662623233616530223b733a33323a223936306435326335653964363030616633356535393063643163623533316536223b733a33323a223162376639623866306431633564363533313934306635656232323365316136223b733a33323a223236393436366138653862653631343161623730653939353232393363646235223b733a33323a223232316431356336396664313066666138653866396361343464383962386335223b733a33323a223764336136663636353835646434396431663035623962666334316264323231223b733a33323a223132353561633037323365656363343163326238633839613934616666666161223b733a33323a223537393562356663386637613863663966363536653662643131386237303737223b733a33323a223638393836656565333336336665616337383166646531353261333837656662223b733a33323a223139363130343632666364323430646537653833353064393464613561353432223b733a33323a226236323130663036616637366261636439663731363730636431346362393538223b733a33323a223063633535366439663833303534336432343138633465343435663231653836223b733a33323a223264333934333236626338333366663661396265326462666432303637663433223b733a33323a223461363930653763656132643138633834373836636537623532346662666438223b733a33323a223566346666343534656232616661383664653134623364313138643631396534223b733a33323a223332326163303334653564376234353463323732343834616264616237613561223b733a33323a223061643437333234663136356534636363373730633866316539663665356366223b733a33323a223333356131373037393936626637383836303863353637306131313961343862223b733a33323a223165646363383965373932326632333839383438626663626238356266383435223b733a33323a223164323437393937616234323563303135303635363364306430333333616661223b733a33323a226263643765303133366437373362313266323365363461303365323931386339223b733a33323a223261303065373663386334633562323339366461656361353737366439303432223b733a33323a223231666332376337653765616234353266363963656334623638373766616161223b733a33323a223564646230623065663838383432343835303430623639626234623861633139223b733a33323a223062313634316630343536373163363238643933356635326564653635366462223b733a33323a223165333930643131616633363761303965613364343864306564326535663534223b733a33323a226439313033646161386338653735323666616562643431623236653534373634223b7d733a343a2268617368223b733a36353a2264393130336461613863386537353236666165626434316232366535343736342d3165333930643131616633363761303965613364343864306564326535663534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a226665373938393134326639353261333137393733306638396362393463613430223b733a33323a226465663239383533646438363463313533346663376563663333393962303439223b733a33323a226163626535616564353631666362323531666464653266613739643666393861223b733a33323a226231393233643937666464623464656337653035393836366234373231366430223b733a33323a226262306633363437346433313030303539343638613934663030626332383033223b733a33323a226565633932333335613339633136346238633432383937343833646435646332223b733a33323a226364376166346135373930643661373965323833313238616436653331346138223b733a33323a226237633433613532356130323936613038643865616565376565316663373839223b733a33323a226566333661356266316664626239656334343733346537613637653938383862223b733a33323a223733383733643837393662636234646637373539353964393632646164353665223b733a33323a223430363963616238383238653331316663393735396130613831333139613162223b733a33323a226238393932363761393563336264363132616433393038663438313564346133223b733a33323a226335313435323565313137656137356336383737616264366134623962303437223b733a33323a223538656336323533643731386236666664346630626465623838303164376431223b733a33323a223435376233303536636137353865633761303130663136653734646630383330223b733a33323a223331646264363137303733333332396338373862396239656332333638333838223b733a33323a223333316561336433313831396534653639326437363235646537376665363461223b733a33323a223561656638383763653064326132643838323332356237363566656161616531223b733a33323a223766643062666333653662396261386630343739356332356664616332316236223b733a33323a226330396133663761343564363630376639613230356334303130313361343136223b733a33323a223164616436376238653865396433333061393463653131383737363266626563223b733a33323a226238613235383063343764373361386131643639653461623061383531653264223b733a33323a226532383632613264353364633064663063626662663038386666386337373830223b733a33323a223830326464643463363663616131663034366262393862643734366561623661223b733a33323a223931386432373363393336313433643030343462363932363033313464633866223b733a33323a223736663137363739303361636136643964636335653331313962313431613332223b733a33323a226330343837643136303764313138666430353034383635303233386333303035223b733a33323a226336363537316531653630336637333931333662623732313961363938343763223b733a33323a223337643833636637623836643362363666353935626434633266643534363562223b733a33323a226536626537643737366165346539396336383665376233333739633061623966223b733a33323a226339626638633638343466313166613638393264633332393462326261313461223b733a33323a223462633437666565306230333537623738313938653764316230303437326634223b733a33323a226538666261343231323739623132393437343239323736613738346234366431223b733a33323a223461656238626434306532633539613339666236373239373864356362656638223b733a33323a226534303533356632383533393035353161363732396234623166393162316234223b733a33323a223036313031663434373833333231363736656664346638303634666363356234223b733a33323a223731373739366236323164353738623662633938303236323332393938653238223b733a33323a223332333862393031313132396638313731383965303636623130663032343932223b733a33323a223139333035663363623631663433343061303931613336663638656530636139223b733a33323a223036333464383337666335663232396164336464643439363963316632616134223b733a33323a223538396233336439636261313564663933366434636536343933613663306331223b733a33323a226261653362346636366434653665363339623335636236326364303761323463223b733a33323a223963666562386465346631613033346233343734373237366431633433666465223b733a33323a226236333332316466643531353463313439643361633863616636303665633461223b7d733a343a2268617368223b733a36353a2262363333323164666435313534633134396433616338636166363036656334612d3963666562386465346631613033346233343734373237366431633433666465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a313131323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223136663334363339653636303061633438633633346434353966346433636462223b733a33323a223239623661353832663234356463306464383037623535343662346536383537223b733a33323a226639366132386432646263613330633030643363336561373966356433366666223b733a33323a226466643238373332316462646432646131616534353134316231366265313766223b733a33323a223538306266383631383663373438373735306565373436663164396331626366223b733a33323a226137386533363632343033346130343266363265663438643934393439643739223b733a33323a223662613737353635626438646564396232623762353161656164616632313662223b733a33323a223930303936653961623331663032633831393636643564653666343431363433223b733a33323a226431653736656132373630656130303031363862623835636564393532636365223b733a33323a223535663130336434353264303730636163306539383064383634643532666236223b733a33323a226331366331313736333631626330333163636334343166363731333838646362223b733a33323a223962323238653762613464323761333731326364646639353763373634616434223b733a33323a223338393334303231333536393433613963353063326234313533646437363433223b733a33323a223636333539633663616464303833376331636631373230623430393964353132223b733a33323a223062613537373037366461623638666339396636653136633733623434386435223b733a33323a226331626239663263303935636665366437643366613430643366356630373365223b733a33323a223634663030643232356636373337366436353461333434363236363166353436223b733a33323a223164636261313030346139643938376139663964366161393737393534366261223b733a33323a226138393734373235366634333633333836366438666564663463336663333330223b733a33323a223064306332306530666333643639353661363236303832626637656666313237223b7d733a343a2268617368223b733a36353a2230643063323065306663336436393536613632363038326266376566663132372d6138393734373235366634333633333836366438666564663463336663333330223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223163313535663533623165356637313030666335363135323761376139343933223b733a33323a223162653866386435613734303466343438623937326239323434653366633037223b733a33323a223631633863313361396363656261366263396631623962373630313438363366223b733a33323a223931316236333731373639633338333764373134623439653737323433626261223b733a33323a226261386563346334356165656163666437346138323061333063383361626637223b733a33323a223733633737633831626162303563626334383833663765336464363663363036223b733a33323a223264626265643830393938653736336463303566393534653438646538386564223b733a33323a226364653935313338643637626535396164306262323432663261363935393330223b733a33323a223533396331386637313631663865653437633334363563353263356439393434223b733a33323a226361333734643562633337663334356232623264393139633039326264613936223b7d733a343a2268617368223b733a36353a2263613337346435626333376633343562326232643931396330393262646139362d3533396331386637313631663865653437633334363563353263356439393434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1616355803);

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
('administrator_email', '\"mattsim77@orange.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Omeka_app\"'),
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
(1, 'mattsim77@orange.fr', 'Matthieu SIMOES', '2021-03-08 17:22:09', '2021-03-08 17:22:09', '$2y$10$LmZClzqRCJGiZROkvSi7l.8hl6be74.A510F.c10wNRv6sZYbgEGy', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2021-03-08 17:23:52', '2021-03-08 17:24:19', '$2y$10$X.f/YRXGQrmr6rOBsrIXeO3FCvlgi0wDZqljbA6gpekaPFSVK7s9y', 'global_admin', 1);

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
(1, 1, 1, NULL, 'literal', '', 'Raymond Domenech', NULL, 1),
(2, 1, 4, NULL, 'literal', '', 'Entraineur de l\'equipe de foot', NULL, 1),
(3, 2, 1, NULL, 'literal', '', 'Equipe de France', NULL, 1),
(4, 3, 1, NULL, 'literal', '', 'Joueur de Football americain', NULL, 1),
(5, 4, 1, NULL, 'literal', '', 'Seance de sports hebdomadaire', NULL, 1),
(6, 4, 4, NULL, 'literal', '', 'Entrainement qui se déroule tous les lundis ', NULL, 1),
(7, 5, 1, NULL, 'literal', '', 'Joueur de Basket', NULL, 1),
(8, 5, 4, NULL, 'literal', '', 'Meneur dans une équipe de basket', NULL, 1),
(9, 6, 1, NULL, 'literal', '', 'Entraineur pour les sportifs au Basket et au Football', NULL, 1),
(10, 6, 4, NULL, 'literal', '', 'Il entraine tous les lundis et jeudi', NULL, 1);

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
(5, 1, 'http://dbpedia.org/ontology/', 'dbo', 'dbpedia', ''),
(6, 1, 'http://www.disit.org/km4city/schema', 'km4c', 'km4city', ''),
(8, 1, 'http://gestion_equipe_sport/onto/ges#', 'ges', 'Gestion_Equipe_Sport', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=765;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
