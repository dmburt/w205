-- Correlate hospital quality, using overall patient
-- CAHPS Star ratings and surgical complications (as
-- a proxy for hospital quality.

SELECT corr(quality.WtdAvgScore, rating.patientsurveystarrating) as CorrQualityAndRating
FROM (SELECT providerid,
             SUM(denominator * score) / SUM(denominator) as WtdAvgScore
      FROM Complications
      GROUP BY providerid
	  ) as quality
JOIN (SELECT providerid,
             patientsurveystarrating
	  FROM Survey_Ratings
	  ) as rating
  ON quality.providerid = rating.providerid

