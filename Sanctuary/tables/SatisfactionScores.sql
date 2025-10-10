create table IF NOT EXISTS SatisafactionScores
(SatisfactionScoreId int not null AUTO_INCREMENT,
  PRIMARY KEY (`SatisfactionScoreId`),
  )

CALL AddColumnIfNotExists ('SatisafactionScores','Score', 'tinyint not null');
CALL AddColumnIfNotExists ('SatisafactionScores','ScoreDateTime', 'datetime not null');
CALL AddColumnIfNotExists ('SatisafactionScores','PropertyId','int not null');

CALL AddForeignKeyIfNotExists ( 'SatisafactionScores','FK_PropertySatisfactionScore', 'PropertyId','Properties', 'PropertyId')
