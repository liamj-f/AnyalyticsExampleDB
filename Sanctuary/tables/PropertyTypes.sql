CREATE TABLE IF NOT EXISTS `PropertyType` (
  `PropertyTypeId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PropertyTypeId`)
)

CALL AddColumnIfNotExists('PropertyType','PropertyTypeName','varchar(50) NOT NULL');
  
INSERT IGNORE INTO `PropertyTypes` (`PropertyTypeId`, `PropertyTypeName`) VALUES
(1,	'General Needs'),
(2,	'Supported Housing'),
(3,	'Extra Care');
