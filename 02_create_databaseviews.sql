-- mysql
USE onet ;

-- lookup all codes in all individual tables in the ONet database with one database view per table
-- merge all database views to one table x_usbls_survey_soc
-- an individual (local) unique numeric primary key, lnr, is added to x_usbls_survey_soc.


-- abilities
CREATE OR REPLACE VIEW v_abilities AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'abilities' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	T.data_value AS l_data_value,
	T.standard_error AS l_se,
	T.lower_ci_bound AS l_lower_ci,
	T.upper_ci_bound AS l_upper_ci,
	T.n AS l_n,
	T.recommend_suppress AS l_recommend_suppress,
	T.not_relevant AS l_not_relevant,
	-- IM.scale_id,
	IM.data_value AS i_data_value,
	IM.standard_error AS i_se,
	IM.lower_ci_bound AS i_lower_ci,
	IM.upper_ci_bound AS i_upper_ci,
	IM.n AS i_n,
	IM.recommend_suppress AS i_recommend_suppress,
	IM.not_relevant AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM abilities T
INNER JOIN abilities IM ON (
	T.onetsoc_code = IM.onetsoc_code
	AND T.element_id = IM.element_id
	AND T.scale_id = 'LV' AND IM.scale_id = 'IM'
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;




-- knowledge
CREATE OR REPLACE VIEW v_knowledge AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'knowledge' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	T.data_value AS l_data_value,
	T.standard_error AS l_se,
	T.lower_ci_bound AS l_lower_ci,
	T.upper_ci_bound AS l_upper_ci,
	T.n AS l_n,
	T.recommend_suppress AS l_recommend_suppress,
	T.not_relevant AS l_not_relevant,
	-- IM.scale_id,
	IM.data_value AS i_data_value,
	IM.standard_error AS i_se,
	IM.lower_ci_bound AS i_lower_ci,
	IM.upper_ci_bound AS i_upper_ci,
	IM.n AS i_n,
	IM.recommend_suppress AS i_recommend_suppress,
	IM.not_relevant AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM knowledge T
INNER JOIN knowledge IM ON (
	T.onetsoc_code = IM.onetsoc_code
	AND T.element_id = IM.element_id
	AND T.scale_id = 'LV' AND IM.scale_id = 'IM'
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;


-- skills
CREATE OR REPLACE VIEW v_skills AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'skills' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	T.data_value AS l_data_value,
	T.standard_error AS l_se,
	T.lower_ci_bound AS l_lower_ci,
	T.upper_ci_bound AS l_upper_ci,
	T.n AS l_n,
	T.recommend_suppress AS l_recommend_suppress,
	T.not_relevant AS l_not_relevant,
	-- IM.scale_id,
	IM.data_value AS i_data_value,
	IM.standard_error AS i_se,
	IM.lower_ci_bound AS i_lower_ci,
	IM.upper_ci_bound AS i_upper_ci,
	IM.n AS i_n,
	IM.recommend_suppress AS i_recommend_suppress,
	IM.not_relevant AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM skills T
INNER JOIN skills IM ON (
	T.onetsoc_code = IM.onetsoc_code
	AND T.element_id = IM.element_id
	AND T.scale_id = 'LV' AND IM.scale_id = 'IM'
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;



-- work_activities
CREATE OR REPLACE VIEW v_work_activities AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'work_activities' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	T.data_value AS l_data_value,
	T.standard_error AS l_se,
	T.lower_ci_bound AS l_lower_ci,
	T.upper_ci_bound AS l_upper_ci,
	T.n AS l_n,
	T.recommend_suppress AS l_recommend_suppress,
	T.not_relevant AS l_not_relevant,
	-- IM.scale_id,
	IM.data_value AS i_data_value,
	IM.standard_error AS i_se,
	IM.lower_ci_bound AS i_lower_ci,
	IM.upper_ci_bound AS i_upper_ci,
	IM.n AS i_n,
	IM.recommend_suppress AS i_recommend_suppress,
	IM.not_relevant AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM work_activities T
INNER JOIN work_activities IM ON (
	T.onetsoc_code = IM.onetsoc_code
	AND T.element_id = IM.element_id
	AND T.scale_id = 'LV' AND IM.scale_id = 'IM'
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;



-- work_styles
CREATE OR REPLACE VIEW v_work_styles AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'work_styles' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	NULL AS l_data_value,
	NULL AS l_se,
	NULL AS l_lower_ci,
	NULL AS l_upper_ci,
	NULL AS l_n,
	NULL AS l_recommend_suppress,
	NULL AS l_not_relevant,
	-- IM.scale_id,
	T.data_value AS i_data_value,
	T.standard_error AS i_se,
	T.lower_ci_bound AS i_lower_ci,
	T.upper_ci_bound AS i_upper_ci,
	T.n AS i_n,
	T.recommend_suppress AS i_recommend_suppress,
	NULL AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM work_styles T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;


-- work_values
CREATE OR REPLACE VIEW v_work_values AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	-- SOC.description AS soc_description,
	'work_values' AS onet_type,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	T.data_value AS l_data_value,
	NULL AS l_se,
	NULL AS l_lower_ci,
	NULL AS l_upper_ci,
	NULL AS l_n,
	NULL AS l_recommend_suppress,
	NULL AS l_not_relevant,
	-- IM.scale_id,
	NULL AS i_data_value,
	NULL AS i_se,
	NULL AS i_lower_ci,
	NULL AS i_upper_ci,
	NULL AS i_n,
	NULL AS i_recommend_suppress,
	NULL AS i_not_relevant,
	T.date_updated,
	T.domain_source
FROM work_values T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;


-- NOTETOSELF
-- Views som lister opp data, først de som vi skal benytte, deretter de som vi har lite bruk for.

-- interests
CREATE OR REPLACE VIEW v_interests AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'interests' AS onet_type,
	-- SOC.description AS soc_description,
	T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.data_value, T.date_updated, T.domain_source
FROM interests T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id= CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = T.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- alternate_titles
CREATE OR REPLACE VIEW v_alternate_titles AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'alternate titles' AS onet_type,
	-- SOC.description AS soc_description,
	T.alternate_title, T.short_title, T.sources
FROM alternate_titles T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)

-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;



-- x_usbls_survey_soc
DROP TABLE IF EXISTS x_usbls_survey_soc ;
CREATE TABLE IF NOT EXISTS x_usbls_survey_soc (
--  lnr int unsigned NOT NULL COMMENT 'unikt løpenummer',
  soc_kode char(10) NOT NULL COMMENT 'id for ONets versjon av Standard Occupational Classification System',
  soc_yrke_en varchar(255) NOT NULL COMMENT 'SOC-kategori opprinnelig',
  soc_yrke_nb varchar(255) NOT NULL COMMENT 'SOC-kategori vår oversetting',
  onet_type varchar(128) NOT NULL DEFAULT '' COMMENT 'fra hvilken tabell er dataene?',
  element_id varchar(20) NOT NULL,
  element_name_en varchar(255) NOT NULL,
  element_name_nb varchar(255) NOT NULL,
  element_description_en varchar(1024) NOT NULL,
  element_description_nb varchar(1024) NOT NULL,
  l_data_value decimal(5,2) DEFAULT NULL COMMENT 'verdi for level i spørreundersøkelsen',
  l_se decimal(5,2) DEFAULT NULL COMMENT 'statistisk standardfeil i level',
  l_lower_ci decimal(5,2) DEFAULT NULL COMMENT 'nedre konfidensinterval i level',
  l_upper_ci decimal(5,2) DEFAULT NULL COMMENT 'øvre konfidensintervall i level',
  l_recommend_suppress char(1) DEFAULT NULL,
  l_not_relevant char(1) DEFAULT NULL COMMENT 'level-måling relevant?',
  i_data_value decimal(5,2) DEFAULT NULL COMMENT 'verdi for importance i spørreundersøkelsen',
  i_se decimal(5,2) DEFAULT NULL COMMENT 'statistisk standardfeil i importace',
  i_lower_ci decimal(5,2) DEFAULT NULL COMMENT 'nedre konfidensinterval i  importance',
  i_upper_ci decimal(5,2) DEFAULT NULL COMMENT 'øvre konfidensintervall i importance',
  i_recommend_suppress char(1) DEFAULT NULL,
  i_not_relevant varchar(255) DEFAULT NULL,
  date_updated date DEFAULT NULL COMMENT 'sist oppdaterte data',
  domain_source varchar(128) NOT NULL COMMENT 'kilde for data',
  onet_uno_category_nb varchar(128) NOT NULL COMMENT 'overkategorier på interessesider utdanning.no',
 -- PRIMARY KEY (lnr),
 UNIQUE(soc_kode, element_id),
 KEY soc_code (soc_kode),
 KEY soc_yrke_en (soc_yrke_en),
 KEY onet_type (onet_type),
 KEY element_id (element_id),
 KEY element_name_nb (element_name_nb),
 KEY l_data_value (l_data_value),
 KEY i_data_value (i_data_value)
)  ;


-- insert abilities into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	-- NULL AS lnr,
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(l_data_value*(100/7)) AS l_data_value,
	(l_se*(100/7)) AS l_se,
	(l_lower_ci*(100/7)) AS l_lower_ci,
	(l_upper_ci*(100/7)) AS l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	(25*(i_data_value-1)) AS i_data_value,
	(25*(i_se)) AS i_se,
	(25*(i_lower_ci-1)) AS i_lower_ci,
	(25*(i_upper_ci-1)) AS i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_abilities ONET
LEFT JOIN content_model_reference_nb NB ON (NB.element_id = ONET.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 50128 rows inserted.

-- insert knowledge into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	-- NULL AS lnr,
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(l_data_value*(100/7)) AS l_data_value,
	(l_se*(100/7)) AS l_se,
	(l_lower_ci*(100/7)) AS l_lower_ci,
	(l_upper_ci*(100/7)) AS l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	(25*(i_data_value-1)) AS i_data_value,
	(25*(i_se)) AS i_se,
	(25*(i_lower_ci-1)) AS i_lower_ci,
	(25*(i_upper_ci-1)) AS i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_knowledge ONET
LEFT JOIN content_model_reference_nb NB ON (NB.element_id = ONET.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 31812 rows inserted.

-- insert skills into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	-- NULL AS lnr,
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(l_data_value*(100/7)) AS l_data_value,
	(l_se*(100/7)) AS l_se,
	(l_lower_ci*(100/7)) AS l_lower_ci,
	(l_upper_ci*(100/7)) AS l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	(25*(i_data_value-1)) AS i_data_value,
	(25*(i_se)) AS i_se,
	(25*(i_lower_ci-1)) AS i_lower_ci,
	(25*(i_upper_ci-1)) AS i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_skills ONET
LEFT JOIN content_model_reference_nb NB ON (NB.element_id = ONET.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 33740 rows inserted.


-- insert work_styles into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	-- NULL AS lnr,
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(l_data_value*(100/7)) AS l_data_value,
	(l_se*(100/7)) AS l_se,
	(l_lower_ci*(100/7)) AS l_lower_ci,
	(l_upper_ci*(100/7)) AS l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	(25*(i_data_value-1)) AS i_data_value,
	(25*(i_se)) AS i_se,
	(25*(i_lower_ci-1)) AS i_lower_ci,
	(25*(i_upper_ci-1)) AS i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_work_styles ONET
LEFT JOIN content_model_reference_nb NB ON (NB.element_id = ONET.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 15408 rows inserted.

-- insert work_values into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	-- NULL AS lnr,
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(ONET.l_data_value*(100/7)) AS l_data_value,
	(ONET.l_se*(100/7)) AS l_se,
	(ONET.l_lower_ci*(100/7)) AS l_lower_ci,
	(ONET.l_upper_ci*(100/7)) AS l_upper_ci,
	ONET.l_recommend_suppress,
	ONET.l_not_relevant,
	(25*(ONET.i_data_value-1)) AS i_data_value,
	(25*(ONET.i_se)) AS i_se,
	(25*(ONET.i_lower_ci-1)) AS i_lower_ci,
	(25*(ONET.i_upper_ci-1)) AS i_upper_ci,
	ONET.i_recommend_suppress,
	ONET.i_not_relevant,
	ONET.date_updated,
	ONET.domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_work_values ONET
LEFT JOIN content_model_reference_nb NB ON (NB.element_id = ONET.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 8766 rows inserted.

-- insert work_activities into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	ONET.onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS description_nb,
	(ONET.l_data_value*(100/7)) AS l_data_value,
	(ONET.l_se*(100/7)) AS l_se,
	(ONET.l_lower_ci*(100/7)) AS l_lower_ci,
	(ONET.l_upper_ci*(100/7)) AS l_upper_ci,
	ONET.l_recommend_suppress,
	ONET.l_not_relevant,
	(25*(ONET.i_data_value-1)) AS i_data_value,
	(25*(ONET.i_se)) AS i_se,
	(25*(ONET.i_lower_ci-1)) AS i_lower_ci,
	(25*(ONET.i_upper_ci-1)) AS i_upper_ci,
	ONET.i_recommend_suppress,
	ONET.i_not_relevant,
	ONET.date_updated,
	ONET.domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_work_activities ONET
LEFT JOIN content_model_reference_nb NB ON (ONET.element_id = NB.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
; # 39524 rows inserted.



-- TODO
-- insert interests into x_usbls_survey_soc
INSERT INTO x_usbls_survey_soc
SELECT
	ONET.soc_kode,
	ONET.soc_yrke_en,
	'' AS soc_yrke_nb,
	onet_type,
	ONET.element_id,
	ONET.element_name_en,
	NB.element_name_nb AS element_name_nb,
	ONET.element_description_en,
	NB.description_nb AS element_description_nb,
-- 	scale_name,
-- 	minimum,
-- 	maximum,
	((data_value-1)*(100/6)) AS l_data_value,
	NULL AS l_se,
	NULL AS l_lower_ci,
	NULL AS l_upper_ci,
	'' AS l_recommend_suppress,
	'' AS l_not_relevant,
	((data_value-1)*(100/6)) AS i_data_value,
	NULL AS i_se,
	NULL AS i_lower_ci,
	NULL AS i_upper_ci,
	'' AS i_recommend_suppress,
	'' AS i_not_relevant,
	ONET.date_updated,
	ONET.domain_source,
	IFNULL(UNO.onet_uno_category_nb, '') AS onet_uno_category_nb
FROM v_interests ONET
LEFT JOIN content_model_reference_nb NB ON (ONET.element_id = NB.element_id)
LEFT JOIN onet_uno_category_nb UNO ON (UNO.element_id = ONET.element_id)
WHERE scale_name = 'Occupational Interests'
-- sjekk opp hva brukes "Occupational Interest High-Point" til?
-- ORDER BY RAND()
;





-- job_zone_reference
CREATE OR REPLACE VIEW v_job_zone_reference AS

SELECT
    JZR.job_zone,
    JZR.name,
    JZR.experience,
    JZR.education,
    JZR.job_training,
    JZR.examples,
    JZR.svp_range
FROM job_zone_reference JZR
;

-- content_model_reference
CREATE OR REPLACE VIEW v_content_model_reference AS

SELECT CMR.element_id,
       CMR.element_name AS element_name_en,
       CMR.description AS element_description_en
FROM content_model_reference CMR
;

-- scales_reference
-- forklarer hva de 30 nivåkategoriene er for noe.
CREATE OR REPLACE VIEW v_scales_reference AS

SELECT
    SR.scale_id,
    SR.scale_name,
    SR.minimum,
    SR.maximum
FROM scales_reference SR
;


-- occupation_data
CREATE OR REPLACE VIEW v_occupation_data AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'occupation_data' AS onet_type,
	-- SOC.description AS soc_description,
	T.title,
	T.description AS description_en
FROM occupation_data T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- x_usbls_jobdescriptions_soc
DROP TABLE IF EXISTS x_usbls_jobdescriptions_soc ;
CREATE TABLE x_usbls_jobdescriptions_soc
SELECT
	OD.soc_kode,
    OD.soc_yrke_en,
    OD.onet_type,
    OD.title,
    OD.description_en AS description_en
FROM onet.v_occupation_data OD
;


-- work_values
CREATE OR REPLACE VIEW v_work_values AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'work_values' AS onet_type,
	-- SOC.description AS soc_description,
	T.data_value,
	-- T.element_id,
	CMR.element_name, CMR.description,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.date_updated, T.domain_source
FROM work_values T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;



-- work_styles
CREATE OR REPLACE VIEW v_work_styles AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'work_styles' AS onet_type,
	-- SOC.description AS soc_description,
	-- T.element_id,
	CMR.element_name AS element_name_en,
	CMR.description AS element_description_en,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.data_value,
	T.n,
	T.lower_ci_bound,
	T.upper_ci_bound,
	T.standard_error,
	T.recommend_suppress,
	T.date_updated,
	T.domain_source
FROM work_styles T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

-- occupation_level_metadata
CREATE OR REPLACE VIEW v_occupation_level_metadata AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'occupation_level_metadata' AS onet_type,
	-- SOC.description AS soc_description,
	T.item, T.response, T.n, T.percent, T.date_updated
FROM occupation_level_metadata T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- task_statements
CREATE OR REPLACE VIEW v_task_statements AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'task_statements' AS onet_type,
	-- SOC.description AS soc_description,
	T.task_id, T.task, T.task_type, T.incumbents_responding, T.date_updated, T.domain_source
FROM task_statements T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

-- education_training_experience
CREATE OR REPLACE VIEW v_education_training_experience AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'education_training_experience' AS onet_type,
	-- SOC.description AS soc_description,
	-- T.element_id,
	CMR.element_name, CMR.description,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.category, T.data_value, T.n, T.lower_ci_bound, T.upper_ci_bound, T.standard_error,  T.recommend_suppress, T.date_updated, T.domain_source
FROM education_training_experience T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- tasks_to_dwas (arbeidsoppgaver)
CREATE OR REPLACE VIEW v_tasks_to_dwas AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'tasks_to_dwas' AS onet_type,
	-- SOC.description AS soc_description,
-- 	T.task_id,
	TS.task,task_type, TS.incumbents_responding,
-- 	T.dwa_id,
	DWAR.dwa_title,
	IWAR.iwa_title,
	CMR.element_name, CMR.description,
	T.domain_source AS dwas_domain_source,
	TS.domain_source AS task_statements_domain_source,
	TS.date_updated AS task_statements_date_updated,
	T.date_updated AS dwas_domain_date_updated
FROM tasks_to_dwas T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN task_statements TS ON (T.task_id = TS.task_id)
INNER JOIN dwa_reference DWAR ON (T.dwa_id = DWAR.dwa_id)
INNER JOIN iwa_reference IWAR ON (DWAR.iwa_id = IWAR.iwa_id)
INNER JOIN content_model_reference CMR ON (DWAR.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- x_usa_detailed_work_activity
DROP TABLE IF EXISTS x_usa_detailed_work_activity;
CREATE TABLE x_usa_detailed_work_activity (
-- 	lnr int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unikt løpenummer',
	soc_code char(10) NOT NULL COMMENT ' ',
	soc_yrke_en varchar(150) NOT NULL COMMENT ' ',
	onet_type varchar(20) NOT NULL DEFAULT '' COMMENT ' ',
	task_id varchar(64) NOT NULL COMMENT ' ',
	task varchar(1000) NOT NULL COMMENT ' ',
	task_type varchar(12) NOT NULL COMMENT ' ',
	incumbents_responding int(8) DEFAULT NULL COMMENT ' ',
	dwa_id  char(20) NOT NULL COMMENT ' ',
	dwa_title varchar(150) NOT NULL COMMENT ' ',
	iwa_title varchar(150) NOT NULL COMMENT ' ',
	element_name varchar(150) NOT NULL COMMENT ' ',
	detailed_work_activity_description varchar(1500) NOT NULL COMMENT ' ',
	dwas_domain_source varchar(30) NOT NULL COMMENT ' ',
	task_statements_domain_source varchar(30) NOT NULL COMMENT ' ',
	task_statements_date_updated date NOT NULL COMMENT ' ',
	-- PRIMARY KEY (lnr),
	KEY soc_yrke_en (soc_yrke_en)
) ;


-- insert from tasks_to_dwas to x_usa_detailed_work_activity
INSERT INTO x_usa_detailed_work_activity
SELECT
	-- NULL AS lnr,
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'tasks_to_dwas' AS onet_type,
	T.task_id,
	TS.task,
	IFNULL(task_type, '') AS task_type,
	TS.incumbents_responding,
	T.dwa_id,
	DWAR.dwa_title,
	IWAR.iwa_title,
	CMR.element_name,
	CMR.description AS detailed_work_activity_description,
	T.domain_source AS dwas_domain_source,
	TS.domain_source AS task_statements_domain_source,
	TS.date_updated AS task_statements_date_updated
-- 	, T.date_updated AS dwas_domain_date_updated
FROM tasks_to_dwas T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN task_statements TS ON (T.task_id = TS.task_id)
INNER JOIN dwa_reference DWAR ON (T.dwa_id = DWAR.dwa_id)
INNER JOIN iwa_reference IWAR ON (DWAR.iwa_id = IWAR.iwa_id)
INNER JOIN content_model_reference CMR ON (DWAR.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
ORDER BY SOC.title ASC
;

-- work_activities
CREATE OR REPLACE VIEW v_work_activities AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'work_activities' AS onet_type,
	-- SOC.description AS soc_description,
	T.data_value,
	-- T.element_id, T.scale_id,
	CMR.element_name, CMR.description,
	SR.scale_name, SR.minimum, SR.maximum,
	T.n, T.lower_ci_bound, T.upper_ci_bound, T.standard_error,  T.recommend_suppress, T.not_relevant, T.date_updated, T.domain_source
FROM work_activities T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;



-- task_ratings
CREATE OR REPLACE VIEW v_task_ratings AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'task_ratings' AS onet_type,
	-- SOC.description AS soc_description,
	-- T.task_id,
	TS.task,task_type, TS.incumbents_responding,
	T.scale_id,
	-- TC.scale_id AS task_categories_scale_id,
	TC.category_description,
	T.data_value, T.n, T.lower_ci_bound, T.upper_ci_bound, T.standard_error,  T.recommend_suppress, T.date_updated, T.domain_source
FROM task_ratings T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN task_statements TS ON (T.task_id = TS.task_id)
LEFT JOIN task_categories TC ON (T.category = TC.category) # noen er null
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- DWAS detailed work activities

DROP TABLE IF EXISTS x_usbls_workactivities_soc ;
CREATE TABLE x_usbls_workactivities_soc
SELECT *
FROM onet.v_tasks_to_dwas
;

ALTER TABLE x_usbls_workactivities_soc ADD lnr INT(8) UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (lnr);

-- Kopiere lista over yrker til egen tabell

DROP TABLE IF EXISTS x_usbls_occupations_soc;
CREATE TABLE x_usbls_occupations_soc (
--   lnr int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unikt løpenummer',
  soc_code char(10) NOT NULL,
  title varchar(150) NOT NULL,
  description varchar(1000) NOT NULL,
	-- PRIMARY KEY (lnr),
	UNIQUE KEY soc_code (soc_code)
) ;

INSERT INTO x_usbls_occupations_soc
SELECT
 	-- NULL AS lnr,
	onetsoc_code AS soc_kode,
    title,
	description
FROM onet.occupation_data
;


CREATE OR REPLACE VIEW v_work_context AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'work_context' AS onet_type,
	-- SOC.description AS soc_description,
	-- T.element_id,
	WCC.scale_id AS work_context_categories_scale_id,
	WCC.category AS work_context_categories_category,
	WCC.category_description AS work_context_categories_description,
	T.scale_id, T.category, T.data_value, T.n, T.lower_ci_bound, T.upper_ci_bound, T.standard_error,  T.recommend_suppress, T.not_relevant, T.date_updated, T.domain_source
FROM work_context T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN work_context_categories WCC ON (T.element_id = WCC.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;



-- job_zones
CREATE OR REPLACE VIEW v_job_zones AS

SELECT
	T.onetsoc_code AS soc_kode,
	SOC.title AS soc_yrke_en,
	'job_zones' AS onet_type,
	T.job_zone,
	JZR.name,
	JZR.experience,
	JZR.education,
	JZR.job_training,
	JZR.examples,
	JZR.svp_range,
	T.date_updated
FROM onet.job_zones T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN job_zone_reference JZR ON (T.job_zone = JZR.job_zone)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;
