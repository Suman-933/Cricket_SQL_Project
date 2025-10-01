 -- Find the batsman who hit the highest individual score in the match

SELECT 
    all_players.Player_Name, Runs.Runs_Scored
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Runs_Scored
    FROM
        1st_innings_batting UNION ALL SELECT 
        Player_Id, Runs_Scored
    FROM
        2nd_innings_batting) AS Runs ON all_players.Player_Id = Runs.Player_Id
ORDER BY Runs.Runs_Scored DESC
LIMIT 1