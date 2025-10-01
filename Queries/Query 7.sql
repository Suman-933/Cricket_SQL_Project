-- find the batsman who hit the highest strike rate(min 20 balls) in the match.
SELECT 
    all_players.Player_Name,
    ROUND(((Runs_Scored / Balls_Faced) * 100), 2) AS Strike_Rate
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Runs_Scored, Balls_Faced
    FROM
        1st_innings_batting UNION ALL SELECT 
        Player_Id, Runs_Scored, Balls_Faced
    FROM
        2nd_innings_batting) AS Batting ON all_players.Player_Id = Batting.Player_Id
WHERE
    Batting.Balls_Faced >= 20
ORDER BY Strike_Rate DESC
LIMIT 1
