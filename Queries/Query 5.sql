
 -- Find the most valuable  Fielder.
SELECT 
    all_players.Player_Name,
    (fielding.Catches + fielding.Run_Outs + fielding.Stumpings) AS Most_Dismissal
FROM
    all_players
        JOIN
    fielding ON all_players.Player_Id = fielding.Player_id
ORDER BY Most_Dismissal DESC
LIMIT 1