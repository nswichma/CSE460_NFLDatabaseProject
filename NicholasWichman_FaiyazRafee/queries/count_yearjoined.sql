SELECT yearjoined, Count(*) AS count
FROM players
GROUP BY yearjoined
ORDER BY yearjoined;