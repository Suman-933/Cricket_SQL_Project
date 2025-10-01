-- Show all- rounders with 20+ runs and took at least 1 wicket

SELECT 
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
        2nd_innings_batting) AS Batting ON all_players.Player_Id = Batting.Player_Id
        JOIN
    (SELECT 
        Player_Id, Wickets_Taken
    FROM
        1st_innings_bowling UNION ALL SELECT 
        Player_Id, Wickets_Taken
    FROM
        2nd_innings_bowling) AS Bowling ON all_players.Player_Id = Bowling.Player_Id
WHERE
    Batting.Runs_Scored >= 20
        AND Bowling.Wickets_Taken <= 1