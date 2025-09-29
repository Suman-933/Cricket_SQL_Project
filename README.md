# 🏏 SQL Project: IND vs PAK | Super Four | Asia Cup 2025

This project analyzes the **India vs Pakistan Super Four Match (Asia Cup 2025)** using **SQL**.  
The dataset includes **batting, bowling scorecards and Fielding ** for both innings,  
We use SQL queries to extract insights like **top run scorers, best bowlers, strike rates and  economy rates **.

---

## 📂 Project Structure
ind-vs-pak-sql-project/
├── data/                     
│   ├── all_players.csv
│   ├── 1st_innings_batting.csv
│   ├── 1st_innings_bowling.csv
│   ├── 2nd_innings_batting.csv
│   ├── 2nd_innings_bowling.csv
│   └── fielding.csv
│
├── schema/
│   └── create_tables.sql          
│
├── queries/
│   ├── 01_top_5_run_scorers.sql
│   ├── 02_top_5_wicket_takers.sql
│   ├── 03_strike_rate_150.sql
│   ├── 04_batting_and_fielding.sql
│   ├── 05_most_valuable_fielder.sql
│   ├── 06_all_rounders.sql
│   ├── 07_highest_strike_rate_min20.sql
│   ├── 08_best_economy_bowlers.sql
│   ├── 09_highest_individual_score.sql
│   └── 10_least_balls_with_wicket.sql
│
├── scripts/
│   ├── load_data.sql             
│   └── run_all_queries.sql       
│
├── results/                       # optional outputs
│   ├── query1_top_5_run_scorers.csv
│   └── query2_top_5_wicket_takers.csv
│
├── diagrams/                      # optional ER diagram
│   └── schema_diagram.png
│
├── README.md                      
└── LICENSE                        


---

## 📊 Dataset Description
- **all_players.csv** → master list of all players in the match  
- **1st_innings_batting.csv** → batting scorecard for Team 1  
- **2nd_innings_batting.csv** → batting scorecard for Team 2  
- **1st_innings_bowling.csv** → bowling stats for Team 1  
- **2nd_innings_bowling.csv** → bowling stats for Team 2  
- **fielding.csv** → catches, stumpings, runouts  

---

🔹 Queries for IND vs PAK SQL Project
1. Show the Top 5 Run scorers with their Scores in the Match
 select all_players.Player_Name, 
       sum(all_scores.Runs_Scored) as total_runs
from all_players 
join (
    select Player_Id, Runs_Scored from 1st_innings_batting
    union all
    select Player_Id, Runs_Scored from 2nd_innings_batting
) as all_scores
on all_players.Player_Id = all_scores.Player_Id
group by all_players.Player_Name
order by total_runs desc
limit 5;

2. Show the top 5 Wicket-takers in the match
 select all_players.Player_Name, 
       sum(all_wickets.wickets_taken) as total_wickets
from all_players 
join (
    select Player_Id, wickets_taken from 1st_innings_bowling
    union all
    select Player_Id, Wickets_Taken from 2nd_innings_bowling
) as all_wickets
on all_players.Player_Id = all_wickets.Player_Id
group by all_players.Player_Name
order by total_wickets desc
limit 5;

3. Players with 150+ strike rate.
   select all_players.Player_Name, ((Strike.Runs_scored/Strike.Balls_faced)*100) as Strike_rate
from all_players
join (select Player_Id,Runs_Scored,Balls_faced from 1st_innings_batting
union all
select Player_Id,Runs_Scored,Balls_faced from 2nd_innings_batting) as Strike
on all_players.Player_Id= Strike.Player_Id
where ((Strike.Runs_scored/Strike.Balls_faced)*100) >= 150
order by strike_rate desc

4.Show the players who contributed in both batting and fielding.
select distinct all_players.Player_Name
from all_players
join (select Player_Id, Runs_Scored from 1st_innings_batting
union all
select Player_Id,Runs_Scored from 2nd_innings_batting) as bat
on all_players.Player_Id = bat.Player_Id
join fielding
on all_players.Player_Id= fielding.Player_id
where (fielding.Catches+fielding.Run_Outs+ fielding.Stumpings) >0
and bat.Runs_scored >0;

5.Find the most valuable  Fielder.
  SELECT 
    all_players.Player_Name,
    (fielding.Catches + fielding.Run_Outs + fielding.Stumpings) AS Most_Dismissal
FROM
    all_players
        JOIN
    fielding ON all_players.Player_Id = fielding.Player_id
ORDER BY Most_Dismissal DESC
LIMIT 1

6.show all- rounders with 20+ runs and took at least 1 wicket.
select all_players.Player_Name
from all_players 
join(select Player_Id,Runs_Scored from 1st_innings_batting
union all
select Player_Id,Runs_Scored from  2nd_innings_batting) as Batting
on all_players.Player_Id= Batting.Player_Id
join (select Player_Id,Wickets_Taken from 1st_innings_bowling
union all 
select Player_Id,Wickets_Taken from 2nd_innings_bowling) as Bowling
on all_players.Player_Id= Bowling.Player_Id
where Batting.Runs_Scored >=20 
and Bowling.Wickets_Taken <=1

7. find the batsman who hit the highest strike rate(min 20 balls) in the match.
 select all_players.Player_Name,round(((Runs_Scored/Balls_Faced)*100),2) as Strike_Rate
from all_players 
join (select Player_Id,Runs_Scored,Balls_Faced from 1st_innings_batting
union all
select Player_Id,Runs_Scored,Balls_Faced from 2nd_innings_batting) as Batting
on all_players.Player_Id = Batting.Player_Id
where Batting.Balls_Faced >=20
order by Strike_Rate desc
limit 1

8. List top 3 bowlers with best bowling economy across both innings.
select  all_players.Player_Name, round((Bowling.Runs_Conceeded/(Bowling.Balls_Bowled/6)),2) as Economy
from all_players 
join (select Player_Id,Balls_Bowled,Runs_Conceeded from 1st_innings_bowling
union all 
select Player_Id, Balls_Bowled,Runs_Conceeded from 2nd_innings_bowling) as Bowling
on all_players.Player_Id= Bowling.Player_Id
order by Economy asc
limit 3

9.Find the batsman who hit the highest individual score in the match.
select all_players.Player_Name,Runs.Runs_Scored
from all_players
join( select Player_Id, Runs_Scored from 1st_innings_batting
union all 
select Player_Id, Runs_Scored from 2nd_innings_batting) as Runs
on all_players.Player_Id = Runs.Player_Id
order by Runs.Runs_Scored desc
limit 1

10. Show the bowler who bowled the least number of balls but still look at least 1 wicket
   select all_players.Player_Name
from all_players 
join (select Player_Id, Balls_Bowled,Wickets_Taken from 1st_innings_bowling
union all 
select Player_Id, Balls_Bowled,Wickets_Taken from 2nd_innings_bowling) as Bowling
on all_players.Player_Id = Bowling.Player_Id
where Bowling.Wickets_Taken >0
order by Bowling.Balls_Bowled asc
limit 1 
