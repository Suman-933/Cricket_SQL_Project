-- Show the players who contributed in both batting and fielding
SELECT DISTINCT
    all_players.Player_Name
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Runs_Scored
    FROM
        1st_innings_batting UNION ALL SELECT 
        Player_Id, Runs_Scored
    FROM
        2nd_innings_batting) AS bat ON all_players.Player_Id = bat.Player_Id
        JOIN
    fielding ON all_players.Player_Id = fielding.Player_id
WHERE
    (fielding.Catches + fielding.Run_Outs + fielding.Stumpings) > 0
        AND bat.Runs_scored > 0;