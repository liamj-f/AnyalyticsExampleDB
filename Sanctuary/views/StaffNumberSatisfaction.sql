WITH RECURSIVE months AS (
  -- Generate one row per month from the earliest date to now
  SELECT '2023-01-01' AS month_start
  UNION ALL
  SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
  FROM months
  WHERE month_start < CURDATE()
),

-- Count staff active in each month per property
monthly_staff AS (
  SELECT
    ps.PropertyId,
    DATE_FORMAT(m.month_start, '%Y-%m') AS month,
    COUNT(DISTINCT ps.StaffId) AS staff_count
  FROM months m
  JOIN PropertyStaff ps
    ON ps.StartDate <= LAST_DAY(m.month_start)
   AND (ps.EndDate IS NULL OR ps.EndDate >= m.month_start)
  GROUP BY ps.PropertyId, m.month_start
),

-- Average satisfaction per month per property
monthly_satisfaction AS (
  SELECT
    s.PropertyId,
    DATE_FORMAT(s.ScoreDateTime, '%Y-%m') AS month,
 --   ROUND(AVG(s.Score), 2) AS avg_satisfaction,
    sum(s.Score) as  Total_Satisfaction,
    count(s.Score) as Count_Scores

  FROM SatisfactionScores s
  GROUP BY s.PropertyId, DATE_FORMAT(s.ScoreDateTime, '%Y-%m')
),

--  Combine both datasets (simulate FULL JOIN)
full_join as (
SELECT
  ms.PropertyId,
  ms.month,
  ms.staff_count,
--  ss.avg_satisfaction,
ss.Total_Satisfaction,
ss.Count_Scores
FROM monthly_staff ms
LEFT JOIN monthly_satisfaction ss
  ON ms.PropertyId = ss.PropertyId
 AND ms.month = ss.month

UNION

SELECT
  ss.PropertyId,
  ss.month,
  ms.staff_count,
ss.Total_Satisfaction,
ss.Count_Scores
FROM monthly_satisfaction ss
LEFT JOIN monthly_staff ms
  ON ms.PropertyId = ss.PropertyId
 AND ms.month = ss.month
)

-- final groupongs by staff_count
select staff_count, month, sum(Total_Satisfaction) / sum(Count_Scores) as avg_Satisfaction
from full_join
where
1=1
and staff_count is not null
and Count_Scores is not null
group by
staff_count, month
ORDER BY month;
