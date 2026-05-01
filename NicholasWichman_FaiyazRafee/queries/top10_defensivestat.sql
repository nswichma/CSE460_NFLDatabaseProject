--Returns the top 10 players in tackles
--Change tackles to any defensive stat to display top 10
SELECT playername, playerid, tackles
FROM defensivestats
ORDER BY tackles DESC
LIMIT 10