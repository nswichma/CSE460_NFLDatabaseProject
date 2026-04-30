-- this summarizes player payroll by team

SELECT
    t.teamname,
    COUNT(p.playerid) AS playerCount,
    SUM(p.salary) AS total_playerSalary,
    ROUND(AVG(p.salary), 2) AS averagePlayerSalary,
    MAX(p.salary) AS highestPlayerSalary
FROM teams t
JOIN players p
    ON t.teamid = p.teamid
GROUP BY t.teamname
HAVING COUNT(p.playerid) > 0
ORDER BY total_player_salary DESC;
