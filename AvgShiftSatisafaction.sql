CREATE TEMPORARY TABLE tmp (
    `Month` int,
    MonthName nvarchar(50),
    NUTS1_Region VARCHAR(50),
    Flag TINYINT,
    AvgShiftLength DECIMAL(5,2),
    AvgSatisfactionScore DECIMAL(5,2)
);
INSERT INTO tmp (Month, MonthName, NUTS1_Region, Flag)
SELECT DISTINCT 
    Month, 
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
        THEN ROUND(
                LEAST(
                    GREATEST(
                        8 + (SQRT(-2 * LN(RAND())) * COS(2 * PI() * RAND())) * 1.2,
                        6
                    ),
                    12
                ),
            2)
        ELSE ROUND(
                LEAST(
                    GREATEST(
                        9.5 + (SQRT(-2 * LN(RAND())) * COS(2 * PI() * RAND())) * 1.5,
                        6.5
                    ),
                    13
                ),
            2)
    END ;

update tmp
SET AvgSatisfactionScore = ROUND(
    LEAST(
        GREATEST(
            (6 + ((Month - 1) / 10.0) * 2 + RAND())    -- upward month-on-month trend
            - GREATEST(0, (AvgShiftLength - 10) * 3),  -- penalty grows as shift length > 11
        1),
    10),
2);


select *
from tmp
