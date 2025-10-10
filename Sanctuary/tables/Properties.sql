CREATE TABLE If not exists `Properties` (
  `PropertyId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PropertyId`)
) ;

CALL AddColumnIfNotExists ('Properties','PropertyTypeId','INT NOT NULL');
CALL AddColumnIfNotExists ('Properties','PropertyName','varchar(50) NOT NULL');
CALL AddColumnIfNotExists ('Properties','RegionId', 'int NOT NULL');

CALL AddForeignKeyIfNotExists ('Properties', 'FK_PropertyTypes', 'PropertyTypeId', 'PropertyTypes', 'PropertyTypeId');
CALL AddForeignKeyIfNotExists ('Properties', 'FK_PropertyRegion', 'RegionId', 'Regions', 'RegionId');
