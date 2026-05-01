SELECT 
	teams.teamid,
	teams.teamname,
	teams.city,
	stadiums.stadiumname,
	coaches.coachname,
	general_managers.gmname,
	owners.ownername
FROM teams 
JOIN stadiums on teams.teamname = stadiums.teamname
JOIN coaches on teams.teamid = coaches.teamid
JOIN general_managers on teams.teamid = general_managers.teamid
JOIN owners on teams.teamid = owners.teamid
