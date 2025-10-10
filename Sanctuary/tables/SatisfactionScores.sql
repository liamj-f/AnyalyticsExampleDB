create table IF NOT EXISTS SatisfactionScores
(SatisfactionScoreId int not null AUTO_INCREMENT,
  PRIMARY KEY (`SatisfactionScoreId`)
  );

CALL AddColumnIfNotExists ('SatisfactionScores','Score', 'tinyint not null');
CALL AddColumnIfNotExists ('SatisfactionScores','ScoreDateTime', 'datetime not null');
CALL AddColumnIfNotExists ('SatisfactionScores','PropertyId','int not null');

CALL AddForeignKeyIfNotExists ( 'SatisfactionScores','FK_PropertySatisfactionScore', 'PropertyId','Properties', 'PropertyId');
