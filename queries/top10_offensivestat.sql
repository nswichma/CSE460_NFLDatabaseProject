--Returns the top 10 players in passyards
--Change passyards to any offensive stat to display top 10
SELECT playername, playerid, passyards
FROM offensivestats
ORDER BY passyards DESC
LIMIT 10