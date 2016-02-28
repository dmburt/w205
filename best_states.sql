
-- Calculate per-state average score for complications, weighted by denominator,
-- (to account for higher opportunity/risk associated with higher number of procedures).  
-- The methodology used here is the same as per-hospital, but requires a join to
-- the hospitals table in order to associate each hospital with a state.

 
SELECT h.state,
       SUM(c.denominator * c.score) / SUM(c.denominator) as WtdAvgScore

FROM Complications as c
JOIN Hospitals as h
  ON c.providerid = h.providerid

GROUP BY h.state
ORDER BY WtdAvgScore DESC
LIMIT 10;
