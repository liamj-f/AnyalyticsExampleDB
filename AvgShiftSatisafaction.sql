CREATE TEMPORARY TABLE tmp (
    MonthName VARCHAR(50),
    NUTS1_Region VARCHAR(50),
    Flag TINYINT,
    AvgShiftLength DECIMAL(5,2),
    AvgSatisfactionScore DECIMAL(5,2)
);
INSERT INTO tmp (MonthName, NUTS1_Region, Flag)
SELECT DISTINCT 
    MonthName, 
    NUTS1_Region, 
    Flag
FROM Calendar
INNER JOIN regions ON 1=1;

  
update tmp
  set AvgShiftLength =
    -- Random Avg Shift Length
   CASE 
        WHEN Flag = 1 
        THEN RAND() * (11 - 6) + 6 - RAND()
        ELSE RAND() * (13 - 6) + 6 + RAND()
    END ;

update tmp
SET AvgSatisfactionScore = ROUND(
    LEAST(
        GREATEST(
            10 - (AvgShiftLength - 6) * (9.0 / 7.0)   -- inverse scale from 6-13 → ~1-10
            + (RAND() - 0.5) * 2                       -- optional random jitter ±1
        , 1),                                           -- minimum 1
    10),                                               -- maximum 10
2);    


select *
from tmp
