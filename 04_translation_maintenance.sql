-- O*Net maintenance script
-- for detecting strings which need updated translation
-- this script will compare new English language data with the string from
-- the version used by translatior. Changes will be 
-- stored in table translation_maintenance_nb


USE onet ;


-- flush table to hold changed strings
DROP TABLE IF EXISTS `translation_maintenance_nb`;
CREATE TABLE `translation_maintenance_nb` (
  `onettype` varchar(128) NOT NULL DEFAULT '',
  `onet_id` char(128) NOT NULL DEFAULT '',
  `string_imported` varchar(1024) NOT NULL,
  `string_untranslated` varchar(1024) DEFAULT NULL,
  `string_translated` varchar(1024) DEFAULT NULL,
  `todo` varchar(128) NOT NULL DEFAULT '',
  UNIQUE KEY `uk` (`onettype`,`onet_id`,`todo`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci
;


-- Detect changes to occupation_data_nb

INSERT IGNORE INTO translation_maintenance_nb

SELECT
	"occupation_data_nb" AS onettype,
	EN.onetsoc_code AS onet_id,
	EN.title AS string_imported,
	NB.title AS string_untranslated,
	NB.title_nb AS string_translated,
-- 	EN.`description`,
-- 	NB.`description`,
-- 	NB.`description_nb`,
	"Title changed" AS todo
FROM occupation_data EN
LEFT JOIN occupation_data_nb NB ON (EN.onetsoc_code = NB.onetsoc_code)
WHERE EN.title <> IFNULL(NB.title, "missing")

UNION

SELECT
	"occupation_data_nb" AS onettype,
	EN.onetsoc_code AS onet_id,
-- 	EN.title,
-- 	NB.title,
-- 	NB.title_nb,
	EN.`description` AS string_imported,
	NB.`description` AS string_untranslated,
	NB.`description_nb` AS string_translated,
	"Description changed" AS todo
FROM occupation_data EN
LEFT JOIN occupation_data_nb NB ON (EN.onetsoc_code = NB.onetsoc_code)
WHERE EN.`description` <> IFNULL(NB.`description`, "missing")
;





-- Detect changes to content_model_reference_nb


INSERT IGNORE INTO translation_maintenance_nb

SELECT
	"content_model_reference_nb" AS onettype,
	EN.element_id AS onet_id,
	EN.element_name AS string_imported,
	NB.element_name AS string_untranslated,
	NB.element_name_nb AS string_translated,
-- 	EN.`description`,
-- 	NB.`description`,
-- 	NB.`description_nb`,
	"Element_name changed" AS todo
FROM content_model_reference EN
LEFT JOIN content_model_reference_nb NB ON (EN.element_id = NB.element_id)
WHERE EN.element_name <> IFNULL(NB.element_name, "missing")

UNION

SELECT
	"content_model_reference_nb" AS onettype,
	EN.element_id AS onet_id,
-- 	EN.element_name AS string_imported,
-- 	NB.element_name AS string_untranslated,
-- 	NB.element_name_nb AS string_translated,
	EN.`description` AS string_imported,
	NB.`description` AS string_untranslated,
	NB.`description_nb` AS string_translated,
	"Description changed" AS todo
FROM content_model_reference EN
LEFT JOIN content_model_reference_nb NB ON (EN.element_id = NB.element_id)
WHERE EN.`description` <> IFNULL(NB.`description`, "missing")
;



-- Detect changes to dwa_reference_nb

INSERT IGNORE INTO translation_maintenance_nb

SELECT
	"dwa_reference_nb" AS onettype,
-- 	EN.element_id,
-- 	EN.iwa_id,
	EN.dwa_id AS onet_id,
	EN.dwa_title AS string_imported,
	NB.dwa_title AS string_untranslated,
	NB.dwa_title_nb AS string_translated,
-- 	NB.element_id,
-- 	NB.iwa_id,
-- 	NB.dwa_id,
	"Dwa_title changed" AS todo
FROM dwa_reference EN
LEFT JOIN dwa_reference_nb NB ON (EN.dwa_id = NB.dwa_id)
WHERE EN.dwa_title <> IFNULL(EN.dwa_title, "missing")
;


-- Detect changes to iwa_reference_nb

INSERT IGNORE INTO translation_maintenance_nb

SELECT
	"iwa_reference_nb" AS onettype,
-- 	EN.element_id,
	EN.iwa_id AS onet_id,
	EN.iwa_title AS string_imported,
	NB.iwa_title AS string_untranslated,
	NB.iwa_title_nb AS string_translated,	
-- 	NB.element_id,
-- 	NB.iwa_id,
	"Iwa_title changed" AS todo
FROM iwa_reference EN 
LEFT JOIN iwa_reference_nb NB ON (EN.iwa_id = NB.iwa_id)
WHERE EN.iwa_title <> IFNULL(EN.iwa_title, "missing")
;


SELECT * 
FROM translation_maintenance_nb
; 
