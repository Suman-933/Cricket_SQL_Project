-- Show the Top 5 Run scorers with their Scores in the Match
SELECT 
    all_players.Player_Name,
    SUM(all_scores.Runs_Scored) AS total_runs
FROM
    all_players
        JOIN
    (SELECT 
        Player_Id, Runs_Scored
    FROM
        1st_innings_batting UNION ALL SELECT 
        Player_Id, Runs_Scored
    FROM
        2nd_innings_batting) AS all_scores ON all_players.Player_Id = all_scores.Player_Id
GROUP BY all_players.Player_Name
ORDER BY total_runs DESC
LIMIT 5;