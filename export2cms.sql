-- Export translations to format suitable for a CRUD 

CREATE OR REPLACE VIEW v_x_usbls_occupation_nb_soc AS 

SELECT 
	-- O*Net-yrkeskode 
	O.onetsoc_code, 
	-- yrkestittel, engelsk original 
	O.title, 
	-- yrkestittel, norsk oversetting 
	NB.title_nb, 
	-- yrkesbeskrivelse, engelsk original 	
	O.description, 
	-- yrkesbeskrivelse, norsk oversetting  	
	NB.description_nb, 
	--  utdanningsnivå for yrket fra 1-5
	Z.job_zone, 
	-- oppdateringsdato 
	NB.`changed`
FROM onet.occupation_data O 
LEFT JOIN onet.occupation_data_nb NB ON (O.onetsoc_code = NB.onetsoc_code) 
LEFT JOIN onet.job_zones Z ON (O.onetsoc_code = Z.onetsoc_code)
;




--
-- Table structure for table x_usbls_occupation_nb_soc
--

DROP TABLE IF EXISTS x_usbls_occupation_nb_soc;
CREATE TABLE x_usbls_occupation_nb_soc (
	onetsoc_code char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL COMMENT 'O*Net-yrkeskode',
	title varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL COMMENT 'yrkestittel, engelsk original ',
	title_nb varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL COMMENT 'yrkestittel, norsk oversetting',
	description varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL COMMENT 'yrkesbeskrivelse, engelsk original ',
	description_nb varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci DEFAULT NULL COMMENT 'yrkesbeskrivelse, norsk oversetting ',
	job_zone int(1) DEFAULT NULL COMMENT 'utdanningsnivå for yrket fra 1-5',
	`changed` date DEFAULT NULL COMMENT 'sist endret dato', 
	PRIMARY KEY (onetsoc_code),
	KEY title (title),
	KEY title_nb (title_nb),
	KEY job_zone (job_zone)  
);

 
INSERT INTO x_usbls_occupation_nb_soc 
SELECT * 
FROM v_x_usbls_occupation_nb_soc
;
