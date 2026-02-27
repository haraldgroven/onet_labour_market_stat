 



--
-- Table structure for table content_model_reference_nb
--

DROP TABLE IF EXISTS content_model_reference_nb;
CREATE TABLE content_model_reference_nb (
 element_id char(16) NOT NULL COMMENT 'ID',
 onettype varchar(128) NOT NULL COMMENT 'innholdstype strengen er henta fra',
 element_name varchar(512) NOT NULL,
 element_name_nb varchar(512) DEFAULT NULL,
 description varchar(512) NOT NULL,
 description_nb varchar(512) DEFAULT NULL,
 changed date NOT NULL COMMENT 'dato siste endring',
 PRIMARY KEY (element_id)
) COMMENT='O*Net online content_model_reference translated to Norwegian (bokmål)';




--
-- Table structure for table dwa_reference_nb
--

DROP TABLE IF EXISTS dwa_reference_nb;
CREATE TABLE dwa_reference_nb (
 element_id varchar(20) DEFAULT NULL,
 iwa_id varchar(20) DEFAULT NULL,
 dwa_id varchar(20) NOT NULL,
 dwa_title varchar(128) DEFAULT NULL,
 dwa_title_nb varchar(128) DEFAULT NULL,
 changed date NOT NULL,
 PRIMARY KEY (dwa_id),
 KEY iwa_id (iwa_id),
 KEY element_id (element_id),
 KEY dwa_title_NO (dwa_title_nb),
 KEY dwa_title (dwa_title)
) COMMENT='O*Net online dwa_reference translated to Norwegian (bokmål)';




--
-- Table structure for table iwa_reference_nb
--

DROP TABLE IF EXISTS iwa_reference_nb;
CREATE TABLE iwa_reference_nb (
 element_id varchar(20) DEFAULT NULL,
 iwa_id varchar(20) NOT NULL,
 iwa_title varchar(128) DEFAULT NULL,
 iwa_title_nb varchar(128) DEFAULT NULL,
 changed date NOT NULL,
 PRIMARY KEY (iwa_id),
 KEY element_id (element_id),
 KEY iwa_title (iwa_title),
 KEY iwa_title_nb (iwa_title_nb)
) COMMENT='O*Net online iwa_reference translated to Norwegian (bokmål)';




--
-- Table structure for table occupation_data_nb
--

DROP TABLE IF EXISTS occupation_data_nb;
CREATE TABLE occupation_data_nb (
 onetsoc_code varchar(10) NOT NULL,
 title varchar(128) NOT NULL,
 title_nb varchar(128) DEFAULT NULL,
 description varchar(1024) NOT NULL,
 description_nb varchar(1024) DEFAULT NULL,
 changed date NOT NULL,
 PRIMARY KEY (onetsoc_code),
 KEY title (title),
 KEY title_nb (title_nb)
) COMMENT='O*Net online occupation_data translated to Norwegian (bokmål)';




--
-- Table structure for table onet_uno_category_nb
--

DROP TABLE IF EXISTS onet_uno_category_nb;
CREATE TABLE onet_uno_category_nb (
 element_id varchar(9) DEFAULT NULL,
 onet_uno_category_nb varchar(1024) DEFAULT NULL
) 
;




--
-- Table structure for table translation_maintenance_nb
--

DROP TABLE IF EXISTS translation_maintenance_nb;
CREATE TABLE translation_maintenance_nb (
 onettype varchar(128) NOT NULL DEFAULT '',
 onet_id char(128) NOT NULL DEFAULT '',
 string_imported varchar(1024) NOT NULL,
 string_untranslated varchar(1024) DEFAULT NULL,
 string_translated varchar(1024) DEFAULT NULL,
 todo varchar(128) NOT NULL DEFAULT '',
 UNIQUE KEY uk (onettype,onet_id,todo)
); 
 