
create table if not exists Calendar 
(
`Date` date primary key
);

ALTER TABLE Calendar
ADD COLUMN IF NOT EXISTS `DayName` NVARCHAR(20),
ADD COLUMN IF NOT EXISTS `DayOfWeek` INT,
ADD COLUMN IF NOT EXISTS `WeekOfYear` INT,
ADD COLUMN IF NOT EXISTS `MonthName` NVARCHAR(20),
ADD COLUMN IF NOT EXISTS `Month` INT,
ADD COLUMN IF NOT EXISTS `Year` INT,
ADD COLUMN IF NOT EXISTS `IsWeekend` BIT;

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS FillCalendar()
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

if select count(*) from Calendar = 0 
    then CALL FillCalendar();
    else null
    end if;
//
delimiter ;
