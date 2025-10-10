CREATE TABLE IF NOT EXISTS `Staff_Shifts` (
  `ShiftId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ShiftId`)
  );

CALL AddColumnIfNotExists('Staff_Shifts','StaffId','int NOT NULL');
CALL AddColumnIfNotExists('Staff_Shifts','PropertyId','int NOT NULL');
CALL AddColumnIfNotExists('Staff_Shifts','ShiftStartDateTime','datetime DEFAULT NULL');
CALL AddColumnIfNotExists('Staff_Shifts','ShiftEndDateTime','datetime DEFAULT NULL');
CALL AddColumnIfNotExists('Staff_Shifts','ShiftLength','int DEFAULT NULL');
    
CALL AddForeignKeyIfNotExists ('Staff_Shifts','FK_StaffShift','StaffId','PropertyStaff','StaffId');
CALL AddForeignKeyIfNotExists ('Staff_Shifts','FK_ShiftProperty','PropertyId','Properties','PropertyId');

