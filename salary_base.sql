--Problematic Query, sorts players by salary descending
--Fix by adding an index
SELECT *
FROM players
ORDER BY salary DESC