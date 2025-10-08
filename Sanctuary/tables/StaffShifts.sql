CREATE TABLE `Staff_Shifts` (
  `ShiftId` int NOT NULL AUTO_INCREMENT,
  `StaffId` int NOT NULL,
  `PropertyId` int NOT NULL,
  `ShiftStartDateTime` datetime DEFAULT NULL,
  `ShiftEndDateTime` datetime DEFAULT NULL,
  `ShiftLength` int DEFAULT NULL,
  PRIMARY KEY (`ShiftId`),
  CONSTRAINT `FK_StaffShift`    FOREIGN KEY (`StaffId`)    REFERENCES `PropertyStaff`(`StaffId`) ON DELETE RESTRICT,
  CONSTRAINT `FK_ShiftProperty` FOREIGN KEY (`PropertyId`) REFERENCES `Properties`(`PropertyId`) ON DELETE RESTRICT
) 
