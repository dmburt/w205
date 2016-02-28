
-- Calculate per-hospital average score for complications, weighted by denominator,
-- (to account for higher opportunity/risk associated with higher number of procedures).  
-- This is done here as a geometric mean, to lessen the impact of hospitals with much 
-- higher procedure volume.

SELECT providerid,
       CASE WHEN MIN(denominator) >= 0 AND MAX(denominator) > 0 AND MIN(score) > -1
	        THEN EXP(SUM(denominator * LOG(1+ CASE WHEN score > -1
			                                    THEN score
												ELSE 1
												END
										   )
					    )
					)
			/ SUM(denominator) - 1
			ELSE 0
			END AS GeoMeanScore
FROM Complications
GROUP BY providerid
ORDER BY GeoMeanScore DESC
LIMIT 10;


