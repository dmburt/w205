
DROP TABLE Hospitals;
CREATE TABLE Hospitals AS SELECT providerid, 
                       hospitalname, 
					   state 
			    FROM hqi_hosp;

DROP TABLE Complications;
CREATE TABLE Complications AS SELECT providerid, 
                       measureid, 
					   cast(denominator as int) as denominator, 
					   cast(score as decimal) as score 
					   from hqi_hospital_comp 
					   where denominator <> 'Not Available' 
					     and score <> 'Not Available';

DROP TABLE OP_Proc_Volume;
CREATE TABLE OP_Proc_Volume AS SELECT providerid, 
                       cast(gastrointestinal as int) as gastrointestinal, 
					   cast(eye as int) as eye, 
					   cast(nervoussystem as int) as nervoussystem, 
					   cast(musculoskeletal as int) as musculoskeletal,
					   cast(skin as int) as skin, 
					   cast(genitourinary as int) as genitourinary, 
					   cast(cardiovascular as int) as cardiovascular, 
					   cast(respiratory as int) as respiratory, 
					   cast(other as int) as other 
				FROM hqi_op_procedure_volume 
				WHERE gastrointestinal <> 'Not Available' 
				  AND eye <> 'Not Available'
				  AND nervoussystem <> 'Not Available'
				  AND musculoskeletal <> 'Not Available'
				  AND skin <> 'Not Available'
				  AND genitourinary <> 'Not Available'
				  AND cardiovascular <> 'Not Available'
				  AND respiratory <> 'Not Available'
				  AND other <> 'Not Available';

DROP TABLE Survey_Ratings;
CREATE TABLE Survey_Ratings AS SELECT providerid, 
                                      hcahpsmeasureid, 
									  cast(patientsurveystarrating as int) as patientsurveystarrating 
							   FROM hqi_hosp_hcahps 
							   WHERE hcahpsmeasureid = 'H_HSP_RATING_STAR_RATING' 
							     AND cast(patientsurveystarrating as int) is not null;
