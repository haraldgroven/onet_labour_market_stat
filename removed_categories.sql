-- Categories removed manually, mostly because they are so similar to other that they may be considered duplicates

DELETE FROM x_usbls_survey_soc 
WHERE element_id IN(
	'1.A.1.b.5', # Inductive Reasoning	Evne til å resonnere induktivt
	'1.A.1.b.7', # Category Flexibility	Kategorifleksibilitet
	'1.A.2.b.2', # Multilimb Coordination	Kroppskoordinasjon
	'1.A.2.b.3', # Response Orientation	Responsorientering
	'1.A.3.a.2', # Explosive Strength	Eksplosiv styrke
	'1.A.3.a.3', # Dynamic Strength	Dynamisk styrke
	'1.A.3.c.1', # Extent Flexibility	Utstrekningsfleksibilitet
	'1.A.3.c.2', # Dynamic Flexibility	Dynamisk fleksibilitet
	'1.A.4.a.4', # Night Vision	Nattsyn
	'1.A.4.a.5', # Peripheral Vision	Sidesyn
	'1.A.4.a.6', # Depth Perception	Dybdesyn
	'1.A.4.a.7', # Glare Sensitivity	Følsomhet for gjenskinn
	'1.A.4.b.2', # Auditory Attention	Lydmessig oppmerksomhet
	'1.A.4.b.3', # Sound Localization	Lydlokalisering
	'1.A.4.b.4', # Speech Recognition	Talegjenkjenning
	'1.A.4.b.5', # Speech Clarity	Evne til å snakke klart
	'2.A.1.c', # Writing	Skriving
	'2.A.1.d', # Speaking	Snakking
	'2.B.3.g', # Operations Monitoring	Driftsovervåking
	'2.B.3.j', # Equipment Maintenance	Utstyrsvedlikehold
	'2.B.3.m', # Quality Control Analysis	Kvalitetskontrollanalyse
	'2.B.4.e', # Judgment and Decision Making	Vurderinger og beslutningstaking
	'2.B.4.g', # Systems Analysis	Systemanalyse
	'2.B.4.h', # Systems Evaluation	Systemevaluering
	'dummy'
	)
