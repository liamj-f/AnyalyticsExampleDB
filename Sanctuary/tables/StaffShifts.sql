CREATE TABLE IF NOT EXISTS `StaffShifts` (
  `ShiftId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ShiftId`)
  );

CALL AddColumnIfNotExists('StaffShifts','StaffId','int NOT NULL');
CALL AddColumnIfNotExists('StaffShifts','PropertyId','int NOT NULL');
CALL AddColumnIfNotExists('StaffShifts','ShiftStartDateTime','datetime DEFAULT NULL');
CALL AddColumnIfNotExists('StaffShifts','ShiftEndDateTime','datetime DEFAULT NULL');
CALL AddColumnIfNotExists('StaffShifts','ShiftLength','int DEFAULT NULL');
    
CALL AddForeignKeyIfNotExists ('StaffShifts','FK_StaffShift','StaffId','PropertyStaff','StaffId');
CALL AddForeignKeyIfNotExists ('StaffShifts','FK_ShiftProperty','PropertyId','Properties','PropertyId');

