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


