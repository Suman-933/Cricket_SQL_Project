 -- Players with 150+ strike rate
 select all_players.Player_Name, ((Strike.Runs_scored/Strike.Balls_faced)*100)as Strike_rate
from all_players
join (select Player_Id,Runs_Scored,Balls_faced from 1st_innings_batting
union all
select Player_Id,Runs_Scored,Balls_faced from 2nd_innings_batting) as Strike
on all_players.Player_Id= Strike.Player_Id
where ((Strike.Runs_scored/Strike.Balls_faced)*100) >= 150
order by strike_rate desc
