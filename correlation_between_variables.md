

# Calculate correlation 

Calculate [Pearson's R correlation quotient](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient) between eatch possible combination of two O*Net variables. Store result in table `x_usbls_survey_soc_pearsonsr`

Purpose: Which variables should be kept, and which are so closely related that they do not add understanding to the subject? Similar could be acheived with Principal component analysis (PCA). 

$$
r_{xy} = \frac{n\sum x_i y_i - \sum x_i\sum y_i}
{\sqrt{n\sum x_i^2-\left(\sum x_i\right)^2}~\sqrt{n\sum y_i^2-\left(\sum y_i\right)^2}},$$


```mysql

USE onet ; 
DROP TABLE IF EXISTS x_usbls_survey_soc_pearsonsr ;
CREATE TABLE x_usbls_survey_soc_pearsonsr
SELECT
    -- X.soc_kode,
    -- X.soc_yrke_en,
    X.element_id AS element_id_x,
    X.element_name_nb AS element_name_nb_x,
    -- AVG(X.l_data_value) AS avg_l_data_value_x,
    -- AVG(X.i_data_value) AS avg_i_data_value_x,

    Y.element_id AS element_id_y,
    Y.element_name_nb AS element_name_nb_y,
    -- AVG(Y.l_data_value) AS avg_l_data_value_y,
    -- AVG(Y.i_data_value) AS avg_i_data_value_y,

	(
		(SUM(X.l_data_value * Y.l_data_value)-(SUM(X.l_data_value)*SUM(Y.l_data_value))/COUNT(*))) / (SQRT(SUM(X.l_data_value * X.l_data_value)-(SUM(X.l_data_value)*SUM (X.l_data_value))/COUNT(*)
	) * SQRT(SUM(Y.l_data_value*Y.l_data_value)-(SUM(Y.l_data_value)*SUM(Y.l_data_value))/COUNT(*))
	) AS l_data_value_pearsonsr,

	(
		(SUM(X.i_data_value * Y.i_data_value)-(SUM(X.i_data_value)*SUM(Y.i_data_value))/COUNT(*))) / (SQRT(SUM(X.i_data_value * X.i_data_value)-(SUM(X.i_data_value)*SUM (X.i_data_value))/COUNT(*)
	) * SQRT(SUM(Y.i_data_value*Y.i_data_value)-(SUM(Y.i_data_value)*SUM(Y.i_data_value))/COUNT(*))
	) AS i_data_value_pearsonsr

FROM x_usbls_survey_soc X
INNER JOIN x_usbls_survey_soc Y ON (X.soc_kode = Y.soc_kode AND X.element_id <> Y.element_id)
WHERE X.i_data_value > 0 AND Y.i_data_value > 0
    -- X.l_data_value > 0 AND Y.l_data_value > 0
GROUP BY X.element_id, Y.element_id
;

```

# Display table with each variable's closest correlation 

```mysql
-- vis hver onet-variabel sammen med de som har høyset korrelasjon
SELECT
    CMR.element_id,
    CONCAT(

        CMR.element_name_nb, ' (', CMR.onettype, ') ',
        IF(ONET.element_id_x IS NULL, ' IKKEMED ', '')
        ) AS element_name_nb_x,

    GROUP_CONCAT(DISTINCT
        (IF(ONET.i_data_value_pearsonsr>0.66, CONCAT(ONET.element_name_nb_y, ' (', REF_Y.onettype, ') '), ''))
        ORDER BY (ONET.i_data_value_pearsonsr+ONET.l_data_value_pearsonsr) DESC
        SEPARATOR '; '
    ) AS i_data_value_pearsonsr

FROM content_model_reference_nb CMR
LEFT JOIN x_usbls_survey_soc_pearsonsr ONET ON (CMR.element_id = ONET.element_id_x)
LEFT JOIN content_model_reference_nb REF_Y ON (REF_Y.element_id = ONET.element_id_y)
WHERE CMR.onettype NOT IN ('content_model_reference')
AND CMR.element_name NOT LIKE '%High-Point%'
GROUP BY CMR.element_id
;
;
```
