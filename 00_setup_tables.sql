-- tables for storing Norwegian (bokmål) translations of Labor Market Information from onetonline.org

-- store in same database as downloaded data from onetonline.org

USE onet ; 



-- Provide O*NET Content Model elements.
-- https://www.onetcenter.org/dictionary/28.3/mysql/content_model_reference.html

DROP TABLE IF EXISTS content_model_reference_nb ; 
CREATE TABLE content_model_reference_nb (
	element_id CHAR(32) NOT NULL COMMENT 'ID',
	onettype VARCHAR(128) NOT NULL COMMENT 'innholdstype strengen er henta fra',
	element_name VARCHAR(512) NOT NULL,
	element_name_nb VARCHAR(512) DEFAULT NULL,
	description VARCHAR(512) NOT NULL,
	description_nb VARCHAR(512) DEFAULT NULL,
	changed date NOT NULL COMMENT 'dato siste endring',
	PRIMARY KEY (element_id)
) COMMENT='O*Net online content_model_reference translated to Norwegian (bokmål)'
 ; 


-- Provide each Detailed Work Activity.
-- https://www.onetcenter.org/dictionary/28.3/mysql/dwa_reference.html

DROP TABLE IF EXISTS dwa_reference_nb ; 
CREATE TABLE dwa_reference_nb (
	element_id CHAR(32) DEFAULT NULL,
	iwa_id VARCHAR(20) DEFAULT NULL,
	dwa_id VARCHAR(20) NOT NULL,
	dwa_title VARCHAR(128) DEFAULT NULL,
	dwa_title_nb VARCHAR(128) DEFAULT NULL,
	changed date NOT NULL,
	PRIMARY KEY (dwa_id),
	KEY iwa_id (iwa_id),
	KEY element_id (element_id),
	KEY dwa_title_NO (dwa_title_nb),
	KEY dwa_title (dwa_title)
) COMMENT='O*Net online dwa_reference translated to Norwegian (bokmål)'
; 


-- Provide each Intermediate Work Activity.
-- https://www.onetcenter.org/dictionary/28.3/mysql/iwa_reference.html

DROP TABLE IF EXISTS iwa_reference_nb ; 
CREATE TABLE iwa_reference_nb (
	element_id CHAR(32) DEFAULT NULL,
	iwa_id VARCHAR(20) NOT NULL,
	iwa_title VARCHAR(128) DEFAULT NULL,
	iwa_title_nb VARCHAR(128) DEFAULT NULL,
	changed date NOT NULL,
	PRIMARY KEY (iwa_id),
	KEY element_id (element_id),
	KEY iwa_title (iwa_title),
	KEY iwa_title_nb (iwa_title_nb)
) COMMENT='O*Net online iwa_reference translated to Norwegian (bokmål)'
; 


-- Provide O*NET-SOC codes, titles, and descriptions.
-- https://www.onetcenter.org/dictionary/28.3/mysql/occupation_data.html

DROP TABLE IF EXISTS occupation_data_nb ; 
CREATE TABLE occupation_data_nb (
	onetsoc_code VARCHAR(10) NOT NULL,
	title VARCHAR(128) NOT NULL,
	title_nb VARCHAR(128) DEFAULT NULL,
	description VARCHAR(1024) NOT NULL,
	description_nb VARCHAR(1024) DEFAULT NULL,
	changed date NOT NULL,
	PRIMARY KEY (onetsoc_code),
	KEY title (title),
	KEY title_nb (title_nb)
) COMMENT='O*Net online occupation_data translated to Norwegian (bokmål)'
; 

DROP TABLE IF EXISTS onet_uno_category_nb ;
CREATE TABLE onet_uno_category_nb (
	element_id CHAR(32) NOT NULL,
	onet_uno_category_nb VARCHAR(1024) NOT NULL,
	PRIMARY KEY (element_id)
) COMMENT='categories used by Utdanning.no'
;


/* 
-- TODO check why we use this 
CREATE TABLE IF NOT EXISTS occupation_data (
	onetsoc_code CHAR(16) NOT NULL,
	title VARCHAR(255) NOT NULL,
	description VARCHAR(1000) NOT NULL,
	PRIMARY KEY (onetsoc_code)
) ;
*/

 
