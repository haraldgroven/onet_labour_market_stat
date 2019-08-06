-- mysql
USE onet ; 

-- lookup all codes in all individual tables in the ONet database with one database view per table
-- merge all database views to one table x_usbls_survey_soc 
-- an individual (local) unique numeric primary key, lnr, is added to x_usbls_survey_soc.


# 66 matches
-- abilities
CREATE OR REPLACE VIEW v_abilities AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"abilities" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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
	AND T.scale_id = "LV" AND IM.scale_id = "IM"
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;



# 66 matches
-- knowledge
CREATE OR REPLACE VIEW v_knowledge AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"knowledge" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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
	AND T.scale_id = "LV" AND IM.scale_id = "IM"
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;


# 70 matches
-- skills
CREATE OR REPLACE VIEW v_skills AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"skills" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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
	AND T.scale_id = "LV" AND IM.scale_id = "IM"
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;




# 70 matches
-- work_activities
CREATE OR REPLACE VIEW v_work_activities AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"work_activities" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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
	AND T.scale_id = "LV" AND IM.scale_id = "IM"
	)
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
-- ORDER BY RAND() LIMIT 1000
;



# 70 matches
-- work_styles
CREATE OR REPLACE VIEW v_work_styles AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"work_styles" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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


# 70 matches
-- work_values
CREATE OR REPLACE VIEW v_work_values AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	-- SOC.description AS soc_description,
	"work_values" AS onettype,
	T.element_id,
	CMR.element_name,
	CMR.description,
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

# 9 matches
CREATE OR REPLACE VIEW v_interests AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"Interests" AS onettype,
	-- SOC.description AS soc_description,
	-- T.element_id,
	CMR.element_name, CMR.description,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.data_value, T.date_updated, T.domain_source
FROM interests T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id= CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;


-- Synonyme titler

# 9 matches
CREATE OR REPLACE VIEW v_alternate_titles AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"Alternate titles" AS onettype,
	-- SOC.description AS soc_description,
	T.alternate_title, T.short_title, T.sources
FROM alternate_titles T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)

-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;



--
-- Table structure for table `x_usbls_survey_soc`
--

DROP TABLE IF EXISTS x_usbls_survey_soc;
CREATE TABLE IF NOT EXISTS x_usbls_survey_soc (
  lnr int unsigned NOT NULL COMMENT 'unikt løpenummer',
  soc_code char(10) NOT NULL COMMENT 'id for ONets versjon av Standard Occupational Classification System',
  soc_title varchar(150) NOT NULL COMMENT 'navn på SOC-kategori',

  -- TODO utdno varchar(150) NOT NULL COMMENT 'yrke norsk',

  onettype varchar(128) NOT NULL DEFAULT '' COMMENT 'fra hvilken tabell er dataene?',
  element_id varchar(20) NOT NULL,
  element_name varchar(150) NOT NULL,
  description varchar(1024) NOT NULL,
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
  domain_source varchar(128) NOT NULL COMMENT 'kilde for data'
)  ;




--
-- Indexes for dumped tables
--

--
-- Indexes for table x_usbls_survey_soc
--
ALTER TABLE x_usbls_survey_soc
  ADD PRIMARY KEY (lnr),
  ADD KEY soc_code (soc_code),
  ADD KEY soc_title (soc_title),
  ADD KEY onettype (onettype),
  ADD KEY element_id (element_id),
  ADD KEY element_name (element_name),
  ADD KEY l_data_value (l_data_value),
  ADD KEY i_data_value (i_data_value)
  ;

ALTER TABLE x_usbls_survey_soc
  MODIFY lnr int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'unikt løpenummer';


INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_abilities ; # 50128 rows inserted.

INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_knowledge ; # 31812 rows inserted.

INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_skills ; # 33740 rows inserted.

INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_work_styles ; # 15408 rows inserted.

INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_work_values ; # 8766 rows inserted.

INSERT INTO x_usbls_survey_soc
SELECT
	NULL AS lnr,
	soc_code,
	soc_title,
	onettype,
	element_id,
	element_name,
	description,
	l_data_value,
	l_se,
	l_lower_ci,
	l_upper_ci,
	l_recommend_suppress,
	l_not_relevant,
	i_data_value,
	i_se,
	i_lower_ci,
	i_upper_ci,
	i_recommend_suppress,
	i_not_relevant,
	date_updated,
	domain_source
FROM v_work_activities ; # 39524 rows inserted.



CREATE OR REPLACE VIEW v_job_zone_reference AS

SELECT JZR.job_zone, JZR.name, JZR.experience, JZR.education, JZR.job_training, JZR.examples, JZR.svp_range
FROM job_zone_reference JZR
;

CREATE OR REPLACE VIEW v_content_model_reference AS

SELECT CMR.element_id, CMR.element_name, CMR.description
FROM content_model_reference CMR
;

-- forklarer hva de 30 nivåkategoriene er for noe.
CREATE OR REPLACE VIEW v_scales_reference AS

SELECT SR.scale_id, SR.scale_name, SR.minimum, SR.maximum
FROM scales_reference SR
;


# 1 match
CREATE OR REPLACE VIEW v_occupation_data AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"occupation_data" AS onettype,
	-- SOC.description AS soc_description,
	T.title,
	T.description
FROM occupation_data T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

DROP TABLE IF EXISTS x_usbls_jobdescriptions_soc ; 
CREATE TABLE x_usbls_jobdescriptions_soc
SELECT
	soc_code,
    soc_title,
    onettype,
    title,
    description
FROM onet.v_occupation_data
;

# 9 matches


CREATE OR REPLACE VIEW v_work_values AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"work_values" AS onettype,
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



# 16 matches
CREATE OR REPLACE VIEW v_work_styles AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"work_styles" AS onettype,
	-- SOC.description AS soc_description,
	-- T.element_id,
	CMR.element_name, CMR.description,
	-- T.scale_id,
	SR.scale_name, SR.minimum, SR.maximum,
	T.data_value, T.n, T.lower_ci_bound, T.upper_ci_bound, T.standard_error,  T.recommend_suppress, T.date_updated, T.domain_source
FROM work_styles T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
INNER JOIN content_model_reference CMR ON (T.element_id = CMR.element_id)
INNER JOIN scales_reference SR ON (T.scale_id = SR.scale_id)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

# 23 matches
CREATE OR REPLACE VIEW v_occupation_level_metadata AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"occupation_level_metadata" AS onettype,
	-- SOC.description AS soc_description,
	T.item, T.response, T.n, T.percent, T.date_updated
FROM occupation_level_metadata T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

# 37 matches
CREATE OR REPLACE VIEW v_task_statements AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"task_statements" AS onettype,
	-- SOC.description AS soc_description,
	T.task_id, T.task, T.task_type, T.incumbents_responding, T.date_updated, T.domain_source
FROM task_statements T
INNER JOIN occupation_data SOC ON (T.onetsoc_code = SOC.onetsoc_code)
-- WHERE T.onetsoc_code = "15-1134.00" # eksempelyrke
;

# 41 matches
CREATE OR REPLACE VIEW v_education_training_experience AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"education_training_experience" AS onettype,
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

# 51 matches


-- arbeidsoppgaver

CREATE OR REPLACE VIEW v_tasks_to_dwas AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"tasks_to_dwas" AS onettype,
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


-- --------------------------------------------------------

--
-- Table structure for table x_usa_detailed_work_activity

DROP TABLE IF EXISTS x_usa_detailed_work_activity;
CREATE TABLE x_usa_detailed_work_activity (
	lnr int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unikt løpenummer',
	soc_code char(10) NOT NULL COMMENT ' ',
	soc_title varchar(150) NOT NULL COMMENT ' ',
	onettype varchar(20) NOT NULL DEFAULT '' COMMENT ' ',
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
	PRIMARY KEY (lnr),
	KEY soc_title (soc_title)
) ;



INSERT INTO x_usa_detailed_work_activity
SELECT
	NULL AS lnr,
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"tasks_to_dwas" AS onettype,
	T.task_id,
	TS.task,
	IFNULL(task_type, "") AS task_type,
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


# 82 matches


CREATE OR REPLACE VIEW v_work_activities AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"work_activities" AS onettype,
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



# 333 matches


CREATE OR REPLACE VIEW v_task_ratings AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"task_ratings" AS onettype,
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
  lnr int(9) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unikt løpenummer',
  soc_code char(10) NOT NULL,
  title varchar(150) NOT NULL,
  description varchar(1000) NOT NULL,
	PRIMARY KEY (lnr),
	UNIQUE KEY soc_code (soc_code)
) ;

INSERT INTO x_usbls_occupations_soc
SELECT
 	NULL AS lnr,
	onetsoc_code AS soc_code,
    title,
	description
FROM onet.occupation_data
;


CREATE OR REPLACE VIEW v_work_context AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"work_context" AS onettype,
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




# 1 match


CREATE OR REPLACE VIEW v_job_zones AS

SELECT
	T.onetsoc_code AS soc_code,
	SOC.title AS soc_title,
	"job_zones" AS onettype,
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
