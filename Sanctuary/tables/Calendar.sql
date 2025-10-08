
create table Calendar 
(
`Date` date primary key,
`DayName` NVARCHAR(20),
`DayOfWeek` INT,
`WeekOfYear` INT,
`MonthName` NVARCHAR(20),
`Month` INT,
`Year` INT,
`IsWeekend` BIT
);
DELIMITER //

CREATE PROCEDURE FillCalendar()
BEGIN
    DECLARE StartDate DATE;
    DECLARE EndDate DATE;
    DECLARE LoopDate DATE;

    SET StartDate = '2005-01-01';
    SET EndDate = CURDATE();
    SET LoopDate = StartDate;

    WHILE LoopDate <= EndDate DO
        INSERT INTO `Calendar`
            (`Date`, `DayName`, `DayOfWeek`, `WeekOfYear`, `MonthName`, `Month`, `Year`, `IsWeekend`)
        VALUES (
            LoopDate,
            DATE_FORMAT(LoopDate, '%W'),
            DAYOFWEEK(LoopDate),
            WEEK(LoopDate, 3),
            DATE_FORMAT(LoopDate, '%M'),
            MONTH(LoopDate),
            YEAR(LoopDate),
            CASE WHEN DAYOFWEEK(LoopDate) IN (1,7) THEN 1 ELSE 0 END
        );

        SET LoopDate = DATE_ADD(LoopDate, INTERVAL 1 DAY);
    END WHILE;
END;
//

DELIMITER ;

CALL FillCalendar();
