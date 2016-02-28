
-- Find the variability in volume for surgical procedures
-- by major body system by h.state.  Compile the results using
-- a union in order to return the highest combination of
-- body system and h.state.


SELECT a.state, a.sd, a.system
FROM (
    SELECT h.state, stddev_samp(p.gastrointestinal) as sd, 'GI' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'GI'
    UNION ALL
    SELECT h.state, stddev_samp(p.eye) as sd, 'EYE' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'EYE'
	UNION ALL
	SELECT h.state, stddev_samp(p.nervoussystem) as sd, 'NRV' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'NRV'
    UNION ALL
    SELECT h.state, stddev_samp(p.musculoskeletal) as sd, 'MSK' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'MSK'
    UNION ALL
    SELECT h.state, stddev_samp(p.skin) as sd, 'SKN' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'SKN'
    UNION ALL
    SELECT h.state, stddev_samp(p.genitourinary) as sd, 'GEN' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'GEN'
    UNION ALL
    SELECT h.state, stddev_samp(p.cardiovascular) as sd, 'CAR' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'CAR'
    UNION ALL
    SELECT h.state, stddev_samp(p.respiratory) as sd, 'RES' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'RES'
    UNION ALL
    SELECT h.state, stddev_samp(p.other) as sd, 'OTH' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state, 'OTH'
) as a
ORDER BY a.sd DESC
LIMIT 10;