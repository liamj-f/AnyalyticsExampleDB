CREATE TABLE IF NOT EXISTS `Regions` (
  `RegionId` int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`RegionId`)
);

CALL AddColumnIfNotExists ('Regions','NUTS1_Region','varchar(50) DEFAULT NULL');
CALL AddColumnIfNotExists ('Regions','Population', 'int DEFAULT NULL');
CALL AddColumnIfNotExists ('Regions','Pop%', 'float DEFAULT NULL');
CALL AddColumnIfNotExists ('Regions','Flag', 'bit(1) DEFAULT NULL');

INSERT IGNORE INTO `Regions` (`RegionId`, `NUTS1_Region`, `Population`, `Pop%`, `Flag`) VALUES
(1,	'England, East Midlands',	4835928,	7.24,	CONVERT(b'1', UNSIGNED)),
(2,	'England, East of England',	6236072,	9.34,	CONVERT(b'1', UNSIGNED)),
(3,	'England, Greater London',	8961989,	13.42,	CONVERT(b'0', UNSIGNED)),
(4,	'England, North East',	2669941,	4,	CONVERT(b'1', UNSIGNED)),
(5,	'England, North West',	7341196,	10.99,	CONVERT(b'1', UNSIGNED)),
(6,	'England, South East',	9180135,	13.74,	CONVERT(b'0', UNSIGNED)),
(7,	'England, South West',	5624696,	8.42,	CONVERT(b'0', UNSIGNED)),
(8,	'England, West Midlands',	5934037,	8.88,	CONVERT(b'0', UNSIGNED)),
(9,	'England, Yorkshire & the Humber',	5502967,	8.24,	CONVERT(b'1', UNSIGNED)),
(10,	'Northern Ireland',	1893667,	2.83,	CONVERT(b'1', UNSIGNED)),
(11,	'Scotland',	5463300,	8.18,	CONVERT(b'1', UNSIGNED)),
(12,	'Wales',	3152879,	4.72,	CONVERT(b'0', UNSIGNED));
