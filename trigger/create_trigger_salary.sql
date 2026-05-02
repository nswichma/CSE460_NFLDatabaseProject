-- Reset demo player so this script can be rerun
DELETE FROM players
WHERE playerid = 2002;

-- Show that the demo player is not currently in the table
SELECT 'Before trigger test' AS step, COUNT(*) AS matching_players
FROM players
WHERE playerid = 2002;

--Create Function to check if salary < 0
CREATE OR REPLACE FUNCTION salary_check()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.salary < 0 THEN
	RAISE EXCEPTION 'Insertion Or Update Failed: Salary cannot be < 0';
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Drop tirgger so you can rerun this query
DROP TRIGGER IF EXISTS salary_check_trigger ON players;

--Create Trigger calling salary_check()
CREATE TRIGGER salary_check_trigger
BEFORE INSERT OR UPDATE ON players
FOR EACH ROW
EXECUTE FUNCTION salary_check();

-- Try to insert an invalid salary.
-- The exception is caught so pgAdmin can continue to the proof query below.
DO $$
BEGIN
	INSERT INTO players (playerid, playername, position, teamid, salary, yearjoined)
	VALUES (2002, 'Failure', 'NA', 4, -500, 2026);
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE 'Trigger blocked invalid insert: %', SQLERRM;
END;
$$;

-- Prove that the failed insert did not add a row
SELECT 'After failed insert' AS step, COUNT(*) AS matching_players
FROM players
WHERE playerid = 2002;

-- Optional cleanup if you use playerid 2002 for another demo take
DELETE FROM players
WHERE playerid = 2002;
