-- Show the top 5 Wicket-takers in the match
SELECT 
    all_players.Player_Name,
    SUM(all_wickets.wickets_taken) AS total_wickets
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, wickets_taken
    FROM
        1st_innings_bowling UNION ALL SELECT 
        Player_Id, Wickets_Taken
    FROM
        2nd_innings_bowling) AS all_wickets ON all_players.Player_Id = all_wickets.Player_Id
GROUP BY all_players.Player_Name
ORDER BY total_wickets DESC
LIMIT 5;