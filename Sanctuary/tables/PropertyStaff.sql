CREATE TABLE `PropertyStaff` (
  `StaffId` int NOT NULL AUTO_INCREMENT,
  `PropertyId` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`StaffId`),
  CONSTRAINT `FK_PropertyStaff` FOREIGN KEY (`PropertyId`) REFERENCES `Properties` (`PropertyId`) ON DELETE RESTRICT
) 
