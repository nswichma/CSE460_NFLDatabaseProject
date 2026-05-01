--Problematic Query, sorts players by last name
--Improve with index
EXPLAIN ANALYZE
SELECT *
FROM players
ORDER BY playername DESC