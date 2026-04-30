-- problematic query #3 for salary summaries

SELECT
    t.teamname,
    COUNT(p.playerid) AS playerCount,
    SUM(p.salary) AS totalPlayerSalary,
    ROUND(AVG(p.salary), 2) AS averagePlayerSalary
FROM teams t
JOIN players p
    ON t.teamid = p.teamid
GROUP BY t.teamname
ORDER BY totalPlayerSalary DESC;

--Index then check after results
CREATE INDEX idx_players_teamid ON players (teamid);
CREATE INDEX idx_players_teamid_salary ON players (teamid, salary DESC);

EXPLAIN ANALYZE
SELECT
    t.teamname,
    COUNT(p.playerid) AS playerCount,
    SUM(p.salary) AS totalPlayerSalary,
    ROUND(AVG(p.salary), 2) AS averagePlayerSalary
FROM teams t
JOIN players p
    ON t.teamid = p.teamid
GROUP BY t.teamname
ORDER BY totalPlayerSalary DESC;
