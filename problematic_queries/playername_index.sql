--Creates index on playername descending
--Improves performance
CREATE INDEX player_name_index
ON players (playername DESC)
