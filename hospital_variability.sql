
-- Find the variability in volume for surgical procedures
-- by major body system by h.state.  Compile the results using
-- a union in order to return the highest combination of
-- body system and h.state.


SELECT a.state, a.sd, a.system
FROM (
    SELECT h.state, p.stddev_samp(gastrointestinal) as sd, 'GI' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(eye) as sd, 'EYE' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
	UNION ALL
	SELECT h.state, p.stddev_samp(nervoussystem) as sd, 'NRV' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(musculoskeletal) as sd, 'MSK' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(skin) as sd, 'SKN' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(genitourinary) as sd, 'GEN' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(cardiovascular) as sd, 'CAR' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(respiratory) as sd, 'RES' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
    UNION ALL
    SELECT h.state, p.stddev_samp(other) as sd, 'OTH' as system
    FROM OP_Proc_Volume as p
	JOIN Hospitals h
	  ON p.providerid = h.providerid
    GROUP BY h.state
) as a
ORDER BY a.sd DESC
LIMIT 10;