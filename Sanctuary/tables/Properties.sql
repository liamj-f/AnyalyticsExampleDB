CREATE TABLE If not exists `Properties` (
  `PropertyId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PropertyId`)
) ;

ALTER TABLE Properties ADD COLUMN `PropertyTypeId` int NOT NULL;
ALTER TABLE Properties `PropertyName` varchar(50) NOT NULL;
ALTER TABLE Properties `RegionId` int NOT NULL;

SET @fk_exists := (
    SELECT COUNT(*) 
    FROM information_schema.table_constraints 
    WHERE constraint_schema = DATABASE()
      AND table_name = 'Properties'
      AND constraint_name = 'FK_PropertyTypes'
      AND constraint_type = 'FOREIGN KEY'
);

IF @fk_exists = 0 THEN
    ALTER TABLE `Properties`
        ADD CONSTRAINT `FK_PropertyTypes` FOREIGN KEY (`PropertyTypeId`) REFERENCES `PropertyTypes` (`PropertyTypeId`) ON DELETE RESTRICT;
END IF;

-- FK_PropertyRegion
SET @fk_exists := (
    SELECT COUNT(*) 
    FROM information_schema.table_constraints 
    WHERE constraint_schema = DATABASE()
      AND table_name = 'Properties'
      AND constraint_name = 'FK_PropertyRegion'
      AND constraint_type = 'FOREIGN KEY'
);

IF @fk_exists = 0 THEN
    ALTER TABLE `Properties`
        ADD CONSTRAINT `FK_PropertyRegion` FOREIGN KEY (`RegionId`) REFERENCES `Regions` (`RegionId`) ON DELETE RESTRICT;
END IF;
