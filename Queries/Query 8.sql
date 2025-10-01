 -- List top 3 bowlers with best bowling economy across both innings.

SELECT 
    all_players.Player_Name,
    ROUND((Bowling.Runs_Conceeded / (Bowling.Balls_Bowled / 6)),
            2) AS Economy
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Balls_Bowled, Runs_Conceeded
    FROM
        1st_innings_bowling UNION ALL SELECT 
        Player_Id, Balls_Bowled, Runs_Conceeded
    FROM
        2nd_innings_bowling) AS Bowling ON all_players.Player_Id = Bowling.Player_Id
ORDER BY Economy ASC
LIMIT 3