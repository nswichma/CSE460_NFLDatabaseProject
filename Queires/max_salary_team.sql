-- Query for finding each teams highest played player
SELECT teamname, salary, playername, position
FROM teams JOIN players
on teams.teamid = players.teamid
WHERE salary in (SELECT MAX(Salary)
	FROM teams JOIN players
	on teams.teamid = players.teamid
	GROUP by teamname)
ORDER BY SALARY DESC