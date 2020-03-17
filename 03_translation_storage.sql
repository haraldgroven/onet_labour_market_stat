-- tables for storing Norwegian (bokmål) translations of Labor Market Information from onetonline.org

-- store in same database as downloaded data from onetonline.org

USE onet ;



-- Provide O*NET Content Model elements.
-- https://www.onetcenter.org/dictionary/24.2/mysql/content_model_reference.html

DROP TABLE IF EXISTS `content_model_reference_nb`;
CREATE TABLE `content_model_reference_nb` (
	`element_id` char(16) NOT NULL COMMENT 'ID',
	`onettype` varchar(16) NOT NULL COMMENT 'innholdstype strengen er henta fra',
	`element_name` varchar(128) NOT NULL,
	`element_name_nb` varchar(128) DEFAULT NULL,
	`description` varchar(512) NOT NULL,
	`description_nb` varchar(512) DEFAULT NULL,
	`changed` date NOT NULL COMMENT 'dato siste endring',
	PRIMARY KEY (`element_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci
COMMENT='O*Net online content_model_reference translated to Norwegian (bokmål)'
;


-- Provide each Detailed Work Activity.
-- https://www.onetcenter.org/dictionary/24.2/mysql/dwa_reference.html

DROP TABLE IF EXISTS `dwa_reference_nb`;
CREATE TABLE `dwa_reference_nb` (
	`element_id` varchar(20) DEFAULT NULL,
	`iwa_id` varchar(20) DEFAULT NULL,
	`dwa_id` varchar(20) NOT NULL,
	`dwa_title` varchar(128) DEFAULT NULL,
	`dwa_title_nb` varchar(128) DEFAULT NULL,
	`changed` date NOT NULL,
	PRIMARY KEY (`dwa_id`),
	KEY `iwa_id` (`iwa_id`),
	KEY `element_id` (`element_id`),
	KEY `dwa_title_NO` (`dwa_title_nb`),
	KEY `dwa_title` (`dwa_title`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci
COMMENT='O*Net online dwa_reference translated to Norwegian (bokmål)'
;


-- Provide each Intermediate Work Activity.
-- https://www.onetcenter.org/dictionary/24.2/mysql/iwa_reference.html

DROP TABLE IF EXISTS `iwa_reference_nb`;
CREATE TABLE `iwa_reference_nb` (
	`element_id` varchar(20) DEFAULT NULL,
	`iwa_id` varchar(20) NOT NULL,
	`iwa_title` varchar(128) DEFAULT NULL,
	`iwa_title_nb` varchar(128) DEFAULT NULL,
	`changed` date NOT NULL,
	PRIMARY KEY (`iwa_id`),
	KEY `element_id` (`element_id`),
	KEY `iwa_title` (`iwa_title`),
	KEY `iwa_title_nb` (`iwa_title_nb`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci
COMMENT='O*Net online iwa_reference translated to Norwegian (bokmål)'
;


-- Provide O*NET-SOC codes, titles, and descriptions.
-- https://www.onetcenter.org/dictionary/24.2/mysql/occupation_data.html

DROP TABLE IF EXISTS `occupation_data_nb`;
CREATE TABLE `occupation_data_nb` (
	`onetsoc_code` varchar(10) NOT NULL,
	`title` varchar(128) NOT NULL,
	`title_nb` varchar(128) DEFAULT NULL,
	`description` varchar(1024) NOT NULL,
	`description_nb` varchar(1024) DEFAULT NULL,
	`changed` date NOT NULL,
	PRIMARY KEY (`onetsoc_code`),
	KEY `title` (`title`),
	KEY `title_nb` (`title_nb`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci
COMMENT='O*Net online occupation_data translated to Norwegian (bokmål)'
;


