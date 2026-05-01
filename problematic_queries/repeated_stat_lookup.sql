--first run
DROP INDEX IF EXISTS idx_offensivestats_playerid;
DROP INDEX IF EXISTS idx_defensivestats_playerid;

ANALYZE players;
ANALYZE teams;
ANALYZE offensivestats;
ANALYZE defensivestats;

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    t.teamname,
    p.playerid,
    p.playername,
    p.salary,
    (SELECT o.passyards
     FROM offensivestats o
     WHERE o.playerid = p.playerid) AS passyards,
    (SELECT o.passtds
     FROM offensivestats o
     WHERE o.playerid = p.playerid) AS passtds,
    (SELECT d.tackles
     FROM defensivestats d
     WHERE d.playerid = p.playerid) AS tackles,
    (SELECT d.sacks
     FROM defensivestats d
     WHERE d.playerid = p.playerid) AS sacks
FROM players p
JOIN teams t
    ON p.teamid = t.teamid
ORDER BY passyards DESC, passtds DESC, tackles DESC, sacks DESC
LIMIT 25;

--this creates the indexes
CREATE INDEX idx_offensivestats_playerid
ON offensivestats (playerid);

CREATE INDEX idx_defensivestats_playerid
ON defensivestats (playerid);

ANALYZE offensivestats;
ANALYZE defensivestats;

--post index run
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    t.teamname,
    p.playerid,
    p.playername,
    p.salary,
    (SELECT o.passyards
     FROM offensivestats o
     WHERE o.playerid = p.playerid) AS passyards,
    (SELECT o.passtds
     FROM offensivestats o
     WHERE o.playerid = p.playerid) AS passtds,
    (SELECT d.tackles
     FROM defensivestats d
     WHERE d.playerid = p.playerid) AS tackles,
    (SELECT d.sacks
     FROM defensivestats d
     WHERE d.playerid = p.playerid) AS sacks
FROM players p
JOIN teams t
    ON p.teamid = t.teamid
ORDER BY passyards DESC, passtds DESC, tackles DESC, sacks DESC
LIMIT 25;