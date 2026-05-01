--Procedure to insert players
CREATE PROCEDURE InsertPlayer(
    IN p_playerid INT,
	IN p_playername TEXT,
	IN p_position TEXT,
	IN p_teamid INT,
	IN p_salary INT,
	IN p_yearjoined INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO players (playerid, playername, position, teamid, salary, yearjoined)
	VALUES (p_playerid, p_playername, p_position, p_teamid, p_salary, p_yearjoined);
END;
$$;



