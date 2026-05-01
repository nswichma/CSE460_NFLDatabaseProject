--Create Fucntion to check if salary < 0
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

--Call our procedure with a value that would fail
CALL InsertPlayer(2002, 'Failure', 'NA', 4, -500, 2026)