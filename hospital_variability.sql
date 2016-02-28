
-- Find the variability in volume for surgical procedures
-- by major body system.

/*
SELECT stddev_samp(gastrointestinal) as sd_gastrointestinal,
       stddev_samp(eye) as sd_eye,
       stddev_samp(nervoussystem) as sd_nervoussystem,
       stddev_samp(musculoskeletal) as sd_musculoskeletal,
       stddev_samp(skin) as sd_skin,
       stddev_samp(genitourinary) as sd_genitourinary,
       stddev_samp(cardiovascular) as sd_cardiovascular,
       stddev_samp(respiratory) as sd_respiratory,
       stddev_samp(other) as sd_other

FROM OP_Proc_Volume;
*/

SELECT state, stddev_samp(gastrointestinal) as sd, 'GI' as system
FROM OP_Proc_Volume
GROUP BY state
UNION
SELECT state, stddev_samp(eye) as sd, 'EYE' as system
FROM OP_Proc_Volume
GROUP BY state
