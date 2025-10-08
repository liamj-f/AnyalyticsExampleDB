create table SatisafactionScores
(SatisfactionScoreId int not null AUTO_INCREMENT,
  Score tinyint not null,
  ScoreDateTime datetime not null,
  PropertyId int not null,
  PRIMARY KEY (`SatisfactionScoreId`),
  Constraint `FK_PropertySatisfactionScore` FOREIGN KEY (`PropertyId`) REFERENCES `Properties` (`PropertyId`) ON DELETE RESTRICT
  )
  
