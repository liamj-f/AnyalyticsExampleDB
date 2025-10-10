CREATE OR REPLACE VIEW `AvgShiftSatisfactionView` AS
SELECT
    c.Month,
    c.MonthName,
    r.NUTS1_Region,
    r.Flag,
    -- AvgShiftLength calculation
    CASE 
        WHEN r.Flag = 1 
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
    END AS AvgShiftLength,
    -- AvgSatisfactionScore calculation
    ROUND(
        LEAST(
            GREATEST(
                (
                    6 + ((c.Month - 1) / 10.0) * 2 + RAND()
                ) - GREATEST(0, (
                    CASE 
                        WHEN r.Flag = 1 
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
                    END - 10
                ) * 3), 1),
            10
        ),
    2) AS AvgSatisfactionScore
FROM Calendar c
INNER JOIN regions r ON 1=1;
