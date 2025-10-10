create table IF NOT EXISTS `RepairBookings`
(RepairId int not null AUTO_INCREMENT,
Primary Key (`RepairId`)
);

CALL AddColumnIfNotExists ('RepairBookings','PropertyId','int not null');
CALL AddColumnIfNotExists ('RepairBookings','LoggedDateTime', 'datetime not null');
CALL AddColumnIfNotExists ('RepairBookings','CompletedDateTime', 'datetime');
CALL AddColumnIfNotExists ('RepairBookings','RepairCategoryId', 'int');

CALL AddForeignKeyIfNotExists ('RepairBookings','FK_PropertyRepair','PropertyId','Properties','PropertyId');
CALL AddForeignKeyIfNotExists ('RepairBookings','FK_RepairCategoryBooking','RepairCategoryId','RepairCategories','RepairCategoryId');
