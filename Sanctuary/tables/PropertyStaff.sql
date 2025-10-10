CREATE TABLE `PropertyStaff` (
  `StaffId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`StaffId`)
) ;

ALTER TABLE `PropertyStaff` ADD COLUMN  `PropertyId` int NOT NULL;
ALTER TABLE `PropertyStaff` ADD COLUMN  `StartDate` date NOT NULL;
ALTER TABLE `PropertyStaff` ADD COLUMN  `EndDate` date DEFAULT NULL;

SET @fk_exists := (
    SELECT COUNT(*) 
    FROM information_schema.table_constraints 
    WHERE constraint_schema = DATABASE()
      AND table_name = 'PropertyStaff'
      AND constraint_name = 'FK_PropertyStaff'
      AND constraint_type = 'FOREIGN KEY'
);

IF @fk_exists = 0 THEN
    ALTER TABLE `Properties`
        ADD CONSTRAINT `FK_PropertyStaff` FOREIGN KEY (`PropertyId`) REFERENCES `Properties` (`PropertyId`) ON DELETE RESTRICT;
END IF;
