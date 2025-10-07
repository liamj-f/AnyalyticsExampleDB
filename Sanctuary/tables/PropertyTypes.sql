CREATE TABLE `PropertyType` (
  `PropertyTypeId` int NOT NULL AUTO_INCREMENT,
  `PropertyTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`PropertyTypeId`)
)
INSERT INTO `PropertyTypes` (`PropertyTypeId`, `ProptertyTypeName`) VALUES
(1,	'General Needs'),
(2,	'Supported Housing'),
(3,	'Extra Care');
