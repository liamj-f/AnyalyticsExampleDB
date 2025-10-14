Create or replace view RepairSatisfactionByMonth as 

with temp_satisfaction as (
select 
avg(s.Score) as 'avgSatisfactionScore'
,date_format(s.ScoreDateTime, '%Y-%m-01') as 'MonthLogged'
from SatisfactionScores as s
where
1=1
group by
date_format(s.ScoreDateTime, '%Y-%m-01')
),

temp_repairs as (
select 
count(rb.RepairId) as 'RepairCount'    
,date_format(rb.LoggedDateTime, '%Y-%m-01') as 'MonthLogged'
,avg(datediff(rb.CompletedDateTime,rb.LoggedDateTime)) as 'AvgRepairWait'
from RepairBookings as rb
LEFT JOIN RepairCategories as rc
ON rc.RepairCategoryId = rb.RepairCategoryId
where
1=1
group by 
date_format(rb.LoggedDateTime, '%Y-%m-01')
)

select
  temp_repairs.MonthLogged
  ,temp_rapairs.AvgRepairWait
  ,temp_repairs.RepairCount
  ,tmp_satisfaction.avgSatisfactionScore
from temp_repairs
inner join temp_satisfaction
on temp_repairs.MonthLogged = temp_satisfaction.MonthLogged


