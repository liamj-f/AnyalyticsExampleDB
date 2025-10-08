CREATE TABLE `Properties` (
  `PropertyId` int NOT NULL AUTO_INCREMENT,
  `PropertyTypeId` int NOT NULL,
  `PropertyName` varchar(50) NOT NULL,
  `RegionId` int NOT NULL,
  PRIMARY KEY (`PropertyId`),
  CONSTRAINT `FK_PropertyTypes` FOREIGN KEY (`PropertyTypeId`) REFERENCES `PropertyTypes` (`PropertyTypeId`) ON DELETE RESTRICT,
  CONSTRAINT `FK_PropertyRegion` FOREIGN KEY (`RegionId`) REFERENCES `Regions` (`RegionId`) ON DELETE RESTRICT,
  CONSTRAINT `FK_PropertyType` FOREIGN KEY (`PropertyTypeId`) REFERENCES `PropertyTypes` (`PropertyTypeId`) ON DELETE RESTRICT
) 

