CREATE TABLE IF NOT EXISTS `PropertyStaff` (
  `StaffId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`StaffId`)
) ;

CALL AddColumnIfNotExists ('PropertyStaff','PropertyId','INT','NOT NULL');
CALL AddColumnIfNotExists ('PropertyStaff','StartDate','date','NOT NULL');
CALL AddColumnIfNotExists ('PropertyStaff','EndDate', 'date','default NULL');

CALL AddForeignKeyIfNotExists ('PropertyStaff', 'FK_PropertyStaff', 'PropertyId', 'Properties', 'PropertyId');
