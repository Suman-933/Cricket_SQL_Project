 -- Show the bowler who bowled the least number of balls but still look at least 1 wicket

SELECT 
    all_players.Player_Name
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Balls_Bowled, Wickets_Taken
    FROM
        1st_innings_bowling UNION ALL SELECT 
        Player_Id, Balls_Bowled, Wickets_Taken
    FROM
        2nd_innings_bowling) AS Bowling ON all_players.Player_Id = Bowling.Player_Id
WHERE
    Bowling.Wickets_Taken > 0
ORDER BY Bowling.Balls_Bowled ASC
LIMIT 1
