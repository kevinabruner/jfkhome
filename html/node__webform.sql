-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2022 at 06:34 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drupaldata`
--

-- --------------------------------------------------------

--
-- Table structure for table `node__webform`
--

CREATE TABLE `node__webform` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `webform_target_id` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the webform entity.',
  `webform_default_data` text COLLATE utf8mb4_general_ci COMMENT 'Default submission data.',
  `webform_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Flag to control whether this webform should be open, closed, or scheduled for new submissions.',
  `webform_open` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'The open date/time.',
  `webform_close` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'The close date/time.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Data storage for node field webform.';

--
-- Dumping data for table `node__webform`
--

INSERT INTO `node__webform` (`bundle`, `deleted`, `entity_id`, `revision_id`, `langcode`, `delta`, `webform_target_id`, `webform_default_data`, `webform_status`, `webform_open`, `webform_close`) VALUES
('webform', 0, 214, 1941, 'en', 0, 'contact', '', 'open', '', ''),
('webform', 0, 587, 14764, 'en', 0, 'president_s_award_of_excellence', '', 'open', '', ''),
('webform', 0, 1118, 7248, 'en', 0, 'covid_19_feedback_form', '', 'open', '', ''),
('webform', 0, 1118, 7248, 'fr', 0, 'covid_19_feedback_form', '', 'open', '', ''),
('webform', 0, 1197, 7890, 'en', 0, 'ppp_data_request_form', '', 'open', '', ''),
('webform', 0, 1286, 8489, 'en', 0, 'ppp_data_request_form', '', 'open', '', ''),
('webform', 0, 1286, 8489, 'fr', 0, 'ppp_data_request_form', '', 'open', '', ''),
('webform', 0, 1317, 17938, 'en', 0, 'wine_survivor_sign_up', '', 'open', '', ''),
('webform', 0, 1317, 17938, 'fr', 0, 'wine_survivor_sign_up', '', 'open', '', ''),
('webform', 0, 1346, 9041, 'en', 0, 'translation_request_form', '', 'open', '', ''),
('webform', 0, 1346, 9041, 'fr', 0, 'translation_request_form', '', 'open', '', ''),
('webform', 0, 1404, 10548, 'en', 0, 'holiday_survivor_sign_up', '', 'open', '', ''),
('webform', 0, 1404, 10548, 'fr', 0, 'holiday_survivor_sign_up', '', 'open', '', ''),
('webform', 0, 1536, 13398, 'en', 0, 'recipe_submissions', '', 'open', '', ''),
('webform', 0, 1536, 13398, 'fr', 0, 'recipe_submissions', '', 'open', '', ''),
('webform', 0, 1600, 11531, 'en', 0, 'intergovernmental_and_stakeholde', '', 'open', '', ''),
('webform', 0, 1600, 11531, 'fr', 0, 'intergovernmental_and_stakeholde', '', 'open', '', ''),
('webform', 0, 1928, 14827, 'en', 0, 'president_s_award_of_excellence_', '', 'open', '', ''),
('webform', 0, 1928, 14827, 'fr', 0, 'president_s_award_of_excellence_', '', 'open', '', ''),
('webform', 0, 1964, 15195, 'en', 0, 'pipeline_submission', '', 'open', '', ''),
('webform', 0, 1964, 15195, 'fr', 0, 'pipeline_submission', '', 'open', '', ''),
('webform', 0, 2296, 19610, 'en', 0, 'gcwcc_recognition_form', '', 'closed', '', ''),
('webform', 0, 2296, 19610, 'fr', 0, 'gcwcc_recognition_form', '', 'closed', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `node__webform`
--
ALTER TABLE `node__webform`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `webform_target_id` (`webform_target_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
