
create table if not exists Calendar 
(
`Date` date primary key
);

CALL AddColumnIfNotExists ('Calendar', 'DayName', 'VARCHAR(20) not null')
CALL AddColumnIfNotExists ('Calendar','DayOfWeek','INT NOT NULL');
CALL AddColumnIfNotExists ('Calendar','WeekOfYear','INT NOT NULL');
CALL AddColumnIfNotExists ('Calendar','MonthName', 'VARCHAR(20) NOT NULL');
CALL AddColumnIfNotExists ('Calendar','Month', 'INT NOT NULL');
CALL AddColumnIfNotExists ('Calendar','Year', 'INT NOT NULL');
CALL AddColumnIfNotExists ('Calendar','IsWeekend','BIT NOT NULL');

DROP PROCEDURE IF EXISTS FillCalendar;

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
        -- INSERT IGNORE ensures idempotency
        INSERT IGNORE INTO Calendar
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
